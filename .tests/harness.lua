-- Minimal WoW API stub so Pawn's real tooltip parser can run under plain Lua 5.1 / LuaJIT.
local Dir = "."
local P = Dir .. "/"

-- String/table/math aliases WoW exposes as globals.
strlen, strsub, strlower, strupper, strmatch, strfind, strrep = string.len, string.sub, string.lower, string.upper, string.match, string.find, string.rep
gsub, gmatch, format, strbyte, strchar = string.gsub, string.gmatch, string.format, string.byte, string.char
tinsert, tremove, tconcat, wipe = table.insert, table.remove, table.concat, function(t) for k in pairs(t) do t[k] = nil end return t end
floor, ceil, abs, min, max = math.floor, math.ceil, math.abs, math.min, math.max
unpack = unpack or table.unpack
strtrim = function(s) return (s:gsub("^%s+", ""):gsub("%s+$", "")) end
strsplit = function(d, s) local r = {} for p in (s .. d):gmatch("(.-)" .. d:gsub("%p", "%%%0")) do r[#r + 1] = p end return unpack(r) end

-- Pretend to be WoW Classic Forever (interface 16001), English client.
GetBuildInfo = function() return "1.60.1", "70790", "", 16001 end
GetLocale = function() return os.getenv("PAWN_LOCALE") or "enUS" end
WOW_PROJECT_CLASSIC, WOW_PROJECT_MAINLINE = 2, 1
WOW_PROJECT_ID = WOW_PROJECT_CLASSIC
LARGE_NUMBER_SEPERATOR = ","

-- Anything else Pawn touches at load time is a harmless do-nothing stub.
local Stub
Stub = setmetatable({}, {
	__index = function() return Stub end,
	__call = function() return nil end,
	__newindex = function() end,
	__concat = function(a, b) return tostring(a == Stub and "" or a) .. tostring(b == Stub and "" or b) end,
	__tostring = function() return "" end,
})
-- Pawn's own globals, version flags and constants stay nil; any other WoW API name becomes the stub.
setmetatable(_G, { __index = function(_, k)
	if type(k) ~= "string" or k:match("^Pawn") or k:match("^Vger") or k:match("^WOW_PROJECT_") or k:match("^LE_") or k == "issecretvalue" then return nil end
	-- Blizzard's localized UI strings (ITEM_SOULBOUND etc.): a placeholder that never matches a real tooltip line.
	if k:match("^[A-Z][A-Z0-9_]+$") then return "ZZUNSET_" .. k end
	return Stub
end })

local function Load(File)
	local Chunk = assert(loadfile(P .. File))
	Chunk("Pawn", {})
end
Load("VgerCore/VgerCore.lua")
Load("Core.lua")
Load("Localization.lua")
Load("TooltipParsing.lua")
Load("Pawn.lua")

PawnCommon = PawnCommon or {}
PawnDebugMessage = function() end

-- Parse a list of tooltip lines through Pawn's real tooltip reader (PawnGetStatsFromTooltip).
-- Returns Stats, UnknownLines.
function ParseTooltip(Lines)
	local Name = "PawnTestTooltip"
	local All = { "Test Item" }
	for _, L in ipairs(Lines) do All[#All + 1] = L end
	local function FontString(Text) return { GetText = function() return Text end, SetText = function() end, GetTextColor = function() return 1 end } end
	_G[Name] = { NumLines = function() return #All end }
	for i, Text in ipairs(All) do
		_G[Name .. "TextLeft" .. i] = FontString(Text)
		_G[Name .. "TextRight" .. i] = FontString(nil)
	end
	local Stats, _, UnknownLines = PawnGetStatsFromTooltip(Name, false)
	for i in ipairs(All) do _G[Name .. "TextLeft" .. i], _G[Name .. "TextRight" .. i] = nil, nil end
	return Stats or {}, UnknownLines or {}
end

------------------------------------------------------------
-- Tiny test runner
------------------------------------------------------------

local Passed, Failed = 0, 0

local function Show(Stats)
	local Keys = {}
	for k in pairs(Stats) do Keys[#Keys + 1] = k end
	table.sort(Keys)
	local Out = {}
	for _, k in ipairs(Keys) do Out[#Out + 1] = k .. "=" .. tostring(Stats[k]) end
	return "{" .. table.concat(Out, ", ") .. "}"
end

local function Report(Name, Ok, Detail)
	if Ok then
		Passed = Passed + 1
		print("PASS  " .. Name)
	else
		Failed = Failed + 1
		print("FAIL  " .. Name .. "\n      " .. Detail)
	end
end

-- The tooltip lines must produce exactly these stats, and every line must be understood.
function ExpectStats(Name, Lines, Expected)
	local Stats, Unknown = ParseTooltip(Lines)
	local Ok = true
	for k, v in pairs(Expected) do if Stats[k] ~= v then Ok = false end end
	for k in pairs(Stats) do if Expected[k] == nil then Ok = false end end
	local UnknownList = {}
	for Line in pairs(Unknown) do UnknownList[#UnknownList + 1] = "\"" .. Line .. "\"" end
	if #UnknownList > 0 then Ok = false end
	Report(Name, Ok, "expected " .. Show(Expected) .. ", got " .. Show(Stats) ..
		(#UnknownList > 0 and ("; not understood: " .. table.concat(UnknownList, ", ")) or ""))
end

-- Two lines must produce identical, non-empty stats (for example, a line with and without a trailing sentence).
function ExpectSameStats(Name, Line, ReferenceLine)
	local Stats, Unknown = ParseTooltip({ Line })
	local RefStats = ParseTooltip({ ReferenceLine })
	local Ok = next(RefStats) ~= nil and next(Unknown) == nil and Show(Stats) == Show(RefStats)
	Report(Name, Ok, "expected " .. Show(RefStats) .. " (same as \"" .. ReferenceLine .. "\"), got " .. Show(Stats) ..
		(next(Unknown) and "; line not understood" or ""))
end

-- The line must not add any stats (Pawn may treat it as understood-and-ignored or as unknown).
function ExpectNoStats(Name, Line)
	local Stats = ParseTooltip({ Line })
	Report(Name, next(Stats) == nil, "expected no stats, got " .. Show(Stats))
end

function Finish()
	print(string.format("%d passed, %d failed", Passed, Failed))
	os.exit(Failed == 0 and 0 or 1)
end
