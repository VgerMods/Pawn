-- VgerCore  by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- 
-- Version 1.0.17 -- IsWrath should still work on Burning Crusade Classic
local VgerCoreThisVersion = 1.17
-- 
-- VgerCore contains functionality that is shared by Vger's mods.
-- It can be used as a standalone add-on, or embedded within other mods.
--
------------------------------------------------------------

local InitializeOrUpgrade = (not VgerCore) or (not VgerCore.Version) or (VgerCore.Version < VgerCoreThisVersion)

-- If the currently loaded version of VgerCore isn't as good as this one, load the new one.
if InitializeOrUpgrade then

VgerCore = {}
VgerCore.Version = VgerCoreThisVersion

-- What version is this?
local BuildNumber = select(4, GetBuildInfo())
VgerCore.IsClassic = (WOW_PROJECT_ID == WOW_PROJECT_CLASSIC)
VgerCore.IsBurningCrusade = (WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and LE_EXPANSION_LEVEL_CURRENT == LE_EXPANSION_BURNING_CRUSADE) -- includes pre-patch
VgerCore.IsWrath = (WOW_PROJECT_ID == WOW_PROJECT_BURNING_CRUSADE_CLASSIC and LE_EXPANSION_WRATH_OF_THE_LICH_KING and LE_EXPANSION_LEVEL_CURRENT >= LE_EXPANSION_WRATH_OF_THE_LICH_KING) or (WOW_PROJECT_WRATH_CLASSIC and WOW_PROJECT_ID == WOW_PROJECT_WRATH_CLASSIC) -- includes pre-patch
VgerCore.IsMainline = BuildNumber >= 90000
VgerCore.IsDragonflight = VgerCore.IsMainline and BuildNumber >= 100000
VgerCore.IsShadowlands = VgerCore.IsMainline and BuildNumber >= 90000

VgerCore.DeathKnightsExist = VgerCore.IsWrath or VgerCore.IsMainline
VgerCore.MonksExist = VgerCore.IsMainline
VgerCore.DemonHuntersExist = VgerCore.IsMainline
VgerCore.EvokersExist = VgerCore.IsDragonflight
VgerCore.SpecsExist = VgerCore.IsMainline
VgerCore.RangedSlotExists = VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath -- or VgerCore.IsCataclysm
VgerCore.ArtifactsExist = VgerCore.IsMainline
VgerCore.EquipmentSetsExist = VgerCore.IsWrath or VgerCore.IsMainline

-- Common colors
VgerCore.Color = {}

VgerCore.Color.Reset = "|r"

VgerCore.Color.Blue = "|cff8ec3e6"
VgerCore.Color.BlueR = 142 / 255
VgerCore.Color.BlueG = 195 / 255
VgerCore.Color.BlueB = 230 / 255

VgerCore.Color.DarkBlue = "|cff6a92ac"
VgerCore.Color.DarkBlueR = 106 / 255
VgerCore.Color.DarkBlueG = 146 / 255
VgerCore.Color.DarkBlueB = 172 / 255

VgerCore.Color.Green = "|cffb4fe2c"
VgerCore.Color.GreenR = 180 / 255
VgerCore.Color.GreenG = 255 / 255
VgerCore.Color.GreenB = 44 / 255

VgerCore.Color.Orange = "|cfffecf38"
VgerCore.Color.OrangeR = 255 / 255
VgerCore.Color.OrangeG = 207 / 255
VgerCore.Color.OrangeB = 56 / 255

VgerCore.Color.Lemon = "|cfffffdd0"
VgerCore.Color.LemonR = 255 / 255
VgerCore.Color.LemonG = 253 / 255
VgerCore.Color.LemonB = 208 / 255

VgerCore.Color.Salmon = "|cfffe8460"
VgerCore.Color.SalmonR = 255 / 255
VgerCore.Color.SalmonG = 132 / 255
VgerCore.Color.SalmonB = 96 / 255

VgerCore.Color.Beige = "|cffe0dec8"
VgerCore.Color.BeigeR = 224 / 255
VgerCore.Color.BeigeG = 222 / 255
VgerCore.Color.BeigeB = 200 / 255

VgerCore.Color.White = "|cffffffff"
VgerCore.Color.WhiteR = 255 / 255
VgerCore.Color.WhiteG = 255 / 255
VgerCore.Color.WhiteB = 255 / 255

VgerCore.Color.Grey = "|cff909090"
VgerCore.Color.GreyR = 144 / 255
VgerCore.Color.GreyG = 144 / 255
VgerCore.Color.GreyB = 144 / 255

VgerCore.Color.Silver = "|cffc0c0c0"
VgerCore.Color.SilverR = 192 / 255
VgerCore.Color.SilverG = 192 / 255
VgerCore.Color.SilverB = 192 / 255

VgerCore.Color.Black= "|cff000000"
VgerCore.Color.BlackR = 0 / 255
VgerCore.Color.BlackG = 0 / 255
VgerCore.Color.BlackB = 0 / 255

VgerCore.MoneyColor = {}
VgerCore.MoneyColor.Gold = "|cffecda90"
VgerCore.MoneyColor.Silver = "|cffd7d5d8"
VgerCore.MoneyColor.Copper = "|cffe2ad8e"


-- Displays a standard VgerCore message.
function VgerCore.Message(Text)
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(VgerCore.Color.Orange .. tostring(Text))
	else
		message(VgerCore.Color.Orange .. tostring(Text))
	end
end

-- Displays a bunch of messages from one string, separated by newlines.
-- Notes:
-- 	* Colors specified at the beginning of Text will not propagate to subsequent lines of Text.
-- 	Use the optional Color parameter instead.
-- 	* Empty lines will be skipped.  Add a space to the line if you want it to be printed.
function VgerCore.MultilineMessage(Text, Color)
	local Line
	local ColorString = Color
	if not ColorString then ColorString = "" end
	for Line in string.gmatch(Text, "[^\r\n]+") do
		VgerCore.Message(ColorString .. Line)
	end
end

-- Displays a large VgerCore message.
function VgerCore.BigMessage(Text)
	if UIErrorsFrame then
		UIErrorsFrame:AddMessage(tostring(Text), VgerCore.Color.GreenR, VgerCore.Color.GreenG, VgerCore.Color.GreenB, 1.0, 4.0)
	end
	if DEFAULT_CHAT_FRAME then
		DEFAULT_CHAT_FRAME:AddMessage(VgerCore.Color.Green .. tostring(Text))
	end
end

-- Displays a VgerCore error message if the condition is false.
function VgerCore.Assert(Condition, Message)
	-- Possibility: call the assert() function to get a callstack and integrate with mods such as Swatter.
	if not Condition then VgerCore.Fail(Message) end
end

-- Displays a VgerCore error message.
function VgerCore.Fail(Message)
	VgerCore.Message(VgerCore.Color.Salmon .. "ERROR:  " .. VgerCore.Color.White .. tostring(Message))
end

-- Hooks an insecure function.  Similar to the base WoW API's hooksecurefunc.  The hook function will be run
-- after the original function to be hooked, unless Pre is true, in which case the hook will be run first.
-- Valid usage:
-- VgerCore.HookInsecureFunction(Object, FunctionName, Hook, Pre)
-- VgerCore.HookInsecureFunction(FunctionName, Hook, Pre)
function VgerCore.HookInsecureFunction(arg1, arg2, arg3, arg4)
	local TypeOfObject = type(arg1)
	local OldFunction
	if TypeOfObject == "table" then -- Object, FunctionName, Hook, Pre
		OldFunction = arg1[arg2]
		if OldFunction then
			arg1[arg2] = VgerCore.CreateHookFunction(OldFunction, arg3, arg4)
		else
			VgerCore.Fail("VgerCore.HookInsecureFunction: could not find member function '" .. arg2 .. "'.")
		end
	elseif TypeOfObject == "string" then -- FunctionName, Hook, Pre
		OldFunction = getglobal(arg1)
		if OldFunction then
			local Environment = getfenv()
			Environment[arg1] = VgerCore.CreateHookFunction(OldFunction, arg2, arg3)
		else
			VgerCore.Fail("VgerCore.HookInsecureFunction: could not find function '" .. arg1 .. "'.")
		end
	else
		VgerCore.Fail("VgerCore.HookInsecureFunction argument 1 must be table or string, not " .. TypeOfObject .. ".")
	end
end

-- Hooks an insecure script handler.  Works just like HookInsecureFunction(Object, FunctionName, Hook, Pre), except that
-- instead of a function name, a script name is passed.
function VgerCore.HookInsecureScript(Object, ScriptName, Hook, Pre)
	local OldFunction = Object:GetScript(ScriptName)
	if OldFunction then
		Object:SetScript(ScriptName, VgerCore.CreateHookFunction(OldFunction, Hook, Pre))
	else
		Object:SetScript(ScriptName, Hook)
	end
end

-- Internal function used by HookInsecureFunction.
function VgerCore.CreateHookFunction(OldFunction, Hook, Pre)
	if Pre then
		return function(...)
			Hook(...)
			return OldFunction(...)
		end
	else
		return function(...)
			local ReturnValue = OldFunction(...)
			Hook(...)
			return ReturnValue
		end
	end
end

-- Executes a chat command just as if it were typed in the chat window.
-- Returns true if successful, or false if not (primarily if the command is a secure function, such as /cast).
function VgerCore.ExecuteChatCommand(Command)
	local EditBox = DEFAULT_CHAT_FRAME.editBox
	if not EditBox then return false end
	
	-- First, make sure that this command is okay.
	local _, _, SlashCommand = strfind(Command, "^(/%w+) ")
	if SlashCommand then
		if IsSecureCmd(SlashCommand) then
			VgerCore.Fail(SlashCommand .. " is a secure command and cannot be run automatically.")
			return false
		end
	end

	-- Now, execute the chat command.
	local PreviousText = EditBox:GetText()
	EditBox:SetText(Command)
	ChatEdit_SendText(EditBox)
	EditBox:SetText(PreviousText)
	return true
end

-- Runs a macro.
-- Returns true if successful, or false if not.
function VgerCore.RunMacro(MacroName)
	-- First, get the text of the macro.
	local _, _, Script, _ = GetMacroInfo(MacroName)
	if not Script then return false end

	-- Then, execute each line individually.  Ignore comments marked with # or -.
	local Line
	for Line in string.gmatch(Script, "[^\n]+") do
		local FirstChar = strsub(Line, 1, 1)
		if FirstChar ~= "#" and FirstChar ~= "-" then
			VgerCore.ExecuteChatCommand(Line)
		end
	end
	return true
end

-- Returns true if the user is in a Battleground, or false if not.
function VgerCore.IsInBattleground()
	local Battleground
	for Battleground = 1, GetMaxBattlefieldID() do
		if GetBattlefieldStatus(Battleground) == "active" then return true end
	end
	return false
end

-- Comparer function for use in table.sort that sorts strings alphabetically, ignoring case.
function VgerCore.CaseInsensitiveComparer(a, b)
	return strlower(a) < strlower(b)
end

-- Returns a six-digit hex string for three RGB values 0-1.
function VgerCore.RGBToHex(r, g, b)
	r = r <= 1 and r >= 0 and r or 0
	g = g <= 1 and g >= 0 and g or 0
	b = b <= 1 and b >= 0 and b or 0
	return format("%02x%02x%02x", r * 255, g * 255, b * 255)
end

-- Returns RGB values 0-1 for a six-digit hex string, or nil if unsuccessful.
function VgerCore.HexToRGB(hex)
	if not hex or strlen(hex) ~= 6 then return end
	local r, g, b = strsub(hex, 1, 2), strsub(hex, 3, 4), strsub(hex, 5, 6)
	r, g, b = r or 0, g or 0, b or 0
	return tonumber(r, 16) / 255, tonumber(g, 16) / 255, tonumber(b, 16) / 255
end

-- Same as strfind, but finds the last occurrence of a substring.  The substring to find must be
-- no more than two characters.
function VgerCore.StringFindReverse(str, find)
	local FindLen = strlen(find)
	VgerCore.Assert(FindLen == 1 or FindLen == 2, "The substring to find must be one or two characters in length.")
	local FindByte, FindByte2 = strbyte(find, 1, 2)
	local StringLength = strlen(str)
	local i
	for i = StringLength, 1, -1 do
		if strbyte(str, i) == FindByte and (FindByte2 == nil or strbyte(str, i + 1) == FindByte2) then return i end
	end
	return nil
end

-- Returns a string representation of a number to a maximum of one decimal place.  If the number passed is nil, nil is returned.
function VgerCore.FormatShortDecimal(Number)
	if Number == nil then
		return nil
	elseif Number >= 1000 then
		return BreakUpLargeNumbers(floor(Number + .5))
	elseif abs(Number - floor(Number)) < .0001 then
		return tostring(Number)
	else
		return format("%.1f", Number)
	end
end

-- Returns a string representation of a number to a maximum of one decimal place.  If the number is long, it is shortened using
-- an abbreviation like "12.3k" so that it fits in a small space.   If the number passed is nil, nil is returned.
function VgerCore.FormatCompactDecimal(Number)
	if Number == nil then
		return nil
	elseif Number >= 1000000000 then
		return format("%.1fb", Number / 1000000000)
	elseif Number >= 1000000 then
		return format("%.1fm", Number / 1000000)
	elseif Number >= 10000 then
		return format("%.1fk", Number / 1000)
	elseif Number >= 1000 then
		return BreakUpLargeNumbers(floor(Number + .5))
	elseif abs(Number - floor(Number)) < .0001 then
		return tostring(Number)
	else
		return format("%.1f", Number)
	end
end

-- Returns a string representation of a number with no decimal places.  If the number passed is nil, nil is returned.
function VgerCore.FormatInteger(Number)
	if Number == nil then
		return nil
	else
		return BreakUpLargeNumbers(floor(Number + .5))
	end
end

function VgerCore.ThrottleDelayCore(Duration, Immediate, Func, arg1)
	if arg1 ~= nil then
		VgerCore.Fail("Throttle and Delay don't support functions with arguments!")
	end
	local ThrottleUntil, WasThrottled
	local TimerCallback = function()
		Func()
		ThrottleUntil = nil
		WasThrottled = nil
	end
	local Throttled = function()
		if (not Immediate) or (ThrottleUntil ~= nil and GetTime() < ThrottleUntil) then
			-- We were called too soon.
			-- Or, if Immediate is true, then delay the first call too.
			if not WasThrottled then
				if ThrottleUntil == nil then ThrottleUntil = GetTime() + Duration end
				C_Timer.After(Duration, TimerCallback)
				WasThrottled = true
			end
		else
			-- It's been long enough, or this is the first call of the sequence.
			ThrottleUntil = GetTime() + Duration
			Func()
		end
	end
	return Throttled
end

-- Returns a version of Function that is called no more often than Duration (in sec).
function VgerCore.Throttle(Duration, Func, arg1)
	return VgerCore.ThrottleDelayCore(Duration, true, Func, arg1)
end

-- Returns a version of Function that delays its own execution by Duration (in sec), and also
-- prevents execution more than once in the same duration.
function VgerCore.Delay(Duration, Func, arg1)
	return VgerCore.ThrottleDelayCore(Duration, false, Func, arg1)
end

-- Returns the index of an item in a table, or nil if it's not in the table.
-- (Keep in mind that this requires iteration!)
function VgerCore.IndexOf(Table, Item)
	if not Item then
		VgerCore.Fail("Can't find the index of nothing.")
	end
	local ThisIndex, ThisItem
	for ThisIndex, ThisItem in pairs(Table) do
		if ThisItem == Item then return ThisIndex end
	end
end

------------------------------------------------------------
end -- if InitializeOrUpgrade
