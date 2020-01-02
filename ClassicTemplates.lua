-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2020 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- WoW Classic template scales
------------------------------------------------------------

local ScaleProviderName = "Classic"

PawnClassicLastUpdatedVersion = 2.0312


function PawnClassicScaleProvider_AddScales()

	for _, Template in pairs(PawnScaleTemplatesClassic) do
		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			Template.ClassID,
			nil, -- SpecID
			{} -- UnusableStats
		)
	end
	
	------------------------------------------------------------

	-- PawnClassicScaleProviderOptions.LastAdded keeps track of the last time that we tried to automatically enable scales for this character.
	if not PawnClassicScaleProviderOptions then PawnClassicScaleProviderOptions = { } end
	if not PawnClassicScaleProviderOptions.LastAdded then PawnClassicScaleProviderOptions.LastAdded = 0 end

	local _, Class = UnitClass("player")
	if PawnClassicScaleProviderOptions.LastClass ~= nil and Class ~= PawnClassicScaleProviderOptions.LastClass then
		-- If the character has changed class since last time, let's start over.
		PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
		PawnClassicScaleProviderOptions.LastAdded = 0
	end
	PawnClassicScaleProviderOptions.LastClass = Class

	-- Since Pawn doesn't have an Automatic mode on Classic, enable a template scale when logging in for the first time
	-- IF the player hasn't already added a scale.
	if PawnClassicScaleProviderOptions.LastAdded < 1 then
		if PawnGetVisibleScaleCount() == 0 then
			PawnEnableAllScalesForClass()
		end
	end

	-- These scales are new, and we don't need any upgrade logic yet.
	PawnClassicScaleProviderOptions.LastAdded = 1

	-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
	PawnClassicScaleProvider_AddScales = nil

end -- PawnClassicScaleProvider_AddScales

------------------------------------------------------------

if VgerCore.IsClassic then
	PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.StarterProvider, PawnClassicScaleProvider_AddScales)
else
	-- We use Ask Mr. Robot spec-specific scales instead on retail WoW.
	PawnClassicScaleProvider_AddScales = nil
end
