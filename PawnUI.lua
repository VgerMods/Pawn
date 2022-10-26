-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- User interface code
------------------------------------------------------------



------------------------------------------------------------
-- Globals
------------------------------------------------------------

PawnUICurrentScale = nil
PawnUICurrentTabNumber = nil
PawnUICurrentListIndex = 0
PawnUICurrentStatIndex = 0

-- The currently-active string dialog.
local PawnUIStringDialog

-- An array with indices 1 and 2 for the left and right compare items, respectively; each one is of the type returned by GetItemData.
local PawnUIComparisonItems = {}
-- An array with indices 1 and 2 for the first and second left side shortcut items.
local PawnUIShortcutItems = {}

local PawnUIGemQualityLevel

local PawnUITotalScaleLines = 0
local PawnUIIsShowingNoneWarning = false
local PawnUITotalComparisonLines = 0
local PawnUITotalGemLines = 0

-- Index n is the quest advisor overlay image for the reward with index n
local PawnQuestAdvisorOverlays = {}

-- Don't taint the global variable "_".
local _

------------------------------------------------------------
-- "Constants"
------------------------------------------------------------

local PawnUIScaleSelectorNoneWarningHeight = 80 -- the "no scales selected" warning is this tall
local PawnUIScaleLineHeight = 16 -- each scale line is 16 pixels tall
local PawnUIScaleSelectorPaddingBottom = 5 -- add 5 pixels of padding to the bottom of the scrolling area

local PawnUIStatsListHeight = 20 -- the stats list contains 20 items
local PawnUIStatsListItemHeight = 16 -- each item is 16 pixels tall

local PawnUIComparisonLineHeight = 20 -- each comparison line is 20 pixels tall
local PawnUIComparisonAreaPaddingBottom = 10 -- add 10 pixels of padding to the bottom of the scrolling area

local PawnUIGemLineHeight = 17 -- each gem line is 17 pixels tall
local PawnUIGemAreaPaddingBottom = 0 -- add no padding to the bottom of the scrolling area

local PawnUIFrameNeedsScaleSelector = { true, true, true, true, false, false, false }


------------------------------------------------------------
-- Inventory button
------------------------------------------------------------

-- Moves the Pawn inventory sheet button and inspect button to the location specified by the user's current preferences.
function PawnUI_InventoryPawnButton_Move()
	if PawnCommon.ButtonPosition == PawnButtonPositionRight then
		PawnUI_InventoryPawnButton:ClearAllPoints()
		if PaperDollFrame.ExpandButton then
			-- DejaCharacterStats compatibility
			PawnUI_InventoryPawnButton:SetPoint("TOPRIGHT", "CharacterTrinket1Slot", "BOTTOMRIGHT", -31, -8)
		else
			PawnUI_InventoryPawnButton:SetPoint("TOPRIGHT", "CharacterTrinket1Slot", "BOTTOMRIGHT", -1, -8)
		end
		PawnUI_InventoryPawnButton:Show()
		if PawnUI_InspectPawnButton then
			PawnUI_InspectPawnButton:ClearAllPoints()
			PawnUI_InspectPawnButton:SetPoint("TOPRIGHT", "InspectTrinket1Slot", "BOTTOMRIGHT", -1, -8)
			PawnUI_InspectPawnButton:Show()
		end
		if PawnUI_SocketingPawnButton then
			PawnUI_SocketingPawnButton:ClearAllPoints()
			PawnUI_SocketingPawnButton:SetPoint("TOPRIGHT", "ItemSocketingFrame", "TOPRIGHT", -14, -32)
			PawnUI_SocketingPawnButton:Show()
		end
	elseif PawnCommon.ButtonPosition == PawnButtonPositionLeft then
		PawnUI_InventoryPawnButton:ClearAllPoints()
		PawnUI_InventoryPawnButton:SetPoint("TOPLEFT", "CharacterWristSlot", "BOTTOMLEFT", 1, -8)
		PawnUI_InventoryPawnButton:Show()
		if PawnUI_InspectPawnButton then
			PawnUI_InspectPawnButton:ClearAllPoints()
			PawnUI_InspectPawnButton:SetPoint("TOPLEFT", "InspectWristSlot", "BOTTOMLEFT", 1, -8)
			PawnUI_InspectPawnButton:Show()
		end
		if PawnUI_SocketingPawnButton then
			PawnUI_SocketingPawnButton:ClearAllPoints()
			PawnUI_SocketingPawnButton:SetPoint("TOPRIGHT", "ItemSocketingFrame", "TOPRIGHT", -14, -32)
			PawnUI_SocketingPawnButton:Show()
		end
	else
		PawnUI_InventoryPawnButton:Hide()
		if PawnUI_InspectPawnButton then
			PawnUI_InspectPawnButton:Hide()
		end
		if PawnUI_SocketingPawnButton then
			PawnUI_SocketingPawnButton:Hide()
		end
	end
end

function PawnUI_InventoryPawnButton_OnEnter(this)
	-- Even if there are no scales, we'll at least display this much.
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine("Pawn", 1, 1, 1, 1)
	GameTooltip:AddLine(PawnLocal.UI.InventoryButtonTooltip, nil, nil, nil, 1)

	-- If the user has at least one scale and at least one type of value is enabled, calculate a total of all equipped items' values.
	if not PawnCommon.ShowValuesForUpgradesOnly then
		PawnUI_AddInventoryTotalsToTooltip(GameTooltip, "player")
	end

	-- Finally, display the tooltip.
	GameTooltip:Show()
end

function PawnUI_InspectPawnButton_OnEnter(this)
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine("Pawn", 1, 1, 1, 1)
	-- For some reason INSPECTED_UNIT isn't getting set in Classic, so fall back to target if it's nil.
	PawnUI_AddInventoryTotalsToTooltip(GameTooltip, INSPECTED_UNIT or "target")
	GameTooltip:Show()
end

function PawnUI_SocketingPawnButton_OnEnter(this)
	GameTooltip:ClearLines()
	GameTooltip:SetOwner(this, "ANCHOR_BOTTOMRIGHT")
	GameTooltip:AddLine("Pawn", 1, 1, 1, 1)
	GameTooltip:AddLine(PawnLocal.UI.SocketingAdvisorButtonTooltip)

	-- Finally, display the tooltip.
	GameTooltip:Show()
end

function PawnUI_SocketingPawnButton_OnClick(this)
	-- Set the suggested gem quality level to the level of the current item so relevant gems will be displayed.
	local ItemLevel
	local _, ItemLink = ItemSocketingDescription:GetItem()
	_, _, _, ItemLevel = GetItemInfo(ItemLink)
	PawnUI_SetGemQualityLevel(ItemLevel)
	-- Show the Gems tab.
	PawnUIShowTab(PawnUIGemsTabPage, true)
end

function PawnUI_AddInventoryTotalsToTooltip(Tooltip, Unit)
	-- Get the total stats for all items.
	local ItemValues, Count, AverageItemLevel = PawnGetInventoryItemValues(Unit)
	if not PawnCommon.ShowValuesForUpgradesOnly then
		if Count and Count > 0 then
			Tooltip:AddLine(" ")
			Tooltip:AddLine(PawnLocal.UI.InventoryButtonTotalsHeader, 1, 1, 1, 1)
			PawnAddValuesToTooltip(Tooltip, ItemValues, nil, nil, nil, nil, nil, true)
		end
	end
	-- Add average item level information to the inspect window.  (It's not necessary for the current player's
	-- character sheet because that's part of the default UI now.)
	if AverageItemLevel and AverageItemLevel > 0 and Unit ~= "player" then
		if PawnCommon.AlignNumbersRight then
			Tooltip:AddDoubleLine(PawnLocal.AverageItemLevelIgnoringRarityTooltipLine,  AverageItemLevel, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB)
		else
			Tooltip:AddLine(PawnLocal.AverageItemLevelIgnoringRarityTooltipLine .. ":  " .. AverageItemLevel, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB)
		end
	end
end

function PawnUI_InspectPawnButton_Attach()
	VgerCore.Assert(InspectPaperDollFrame ~= nil, "InspectPaperDollFrame should be loaded by now!")
	CreateFrame("Button", "PawnUI_InspectPawnButton", InspectPaperDollFrame, "PawnUI_InspectPawnButtonTemplate")
	PawnUI_InspectPawnButton:SetParent(InspectPaperDollFrame)
	PawnUI_InventoryPawnButton_Move()
end

function PawnUI_SocketingPawnButton_Attach()
	-- Attach the socketing button.
	VgerCore.Assert(ItemSocketingFrame ~= nil, "ItemSocketingFrame should be loaded by now!")
	CreateFrame("Button", "PawnUI_SocketingPawnButton", ItemSocketingFrame, "PawnUI_SocketingPawnButtonTemplate")
	PawnUI_SocketingPawnButton:SetParent(ItemSocketingFrame)
	PawnUI_InventoryPawnButton_Move()

	-- Hook the item update event.
	hooksecurefunc(ItemSocketingDescription, "SetSocketedItem", PawnUI_OnSocketUpdate)
end

function PawnUI_HookArtifactUI()
	local OriginalOnRelicSlotMouseEnter = ArtifactFrame.PerksTab.TitleContainer.OnRelicSlotMouseEnter
	ArtifactFrame.PerksTab.TitleContainer.OnRelicSlotMouseEnter =
	function(...)
		PawnIsHoveringSocketedRelic = true
		OriginalOnRelicSlotMouseEnter(...)
		PawnIsHoveringSocketedRelic = false
	end
	-- individual slots: ArtifactFrame.PerksTab.TitleContainer.RelicSlots[1]
end

------------------------------------------------------------
-- Scale selector events
------------------------------------------------------------

function PawnUIFrame_ScaleSelector_Refresh()
	-- First, delete the existing scale lines.
	for i = 1, PawnUITotalScaleLines do
		local LineName = "PawnUIScaleLine" .. i
		local Line = getglobal(LineName)
		if Line then Line:Hide() end
		setglobal(LineName, nil)
	end
	PawnUITotalScaleLines = 0

	-- Get a sorted list of scale data and display it all.
	local ScaleData
	local ScaleList = PawnGetAllScalesEx()
	PawnUIIsShowingNoneWarning = true
	for _, ScaleData in pairs(ScaleList) do
		if ScaleData.IsVisible then
			PawnUIIsShowingNoneWarning = false
			break
		end
	end
	if PawnUIIsShowingNoneWarning then
		PawnUIFrame_ScaleSelector_NoneWarning:Show()
	else
		PawnUIFrame_ScaleSelector_NoneWarning:Hide()
	end

	local NewSelectedScale, FirstScale, LastHeader, _
	for _, ScaleData in pairs(ScaleList) do
		local ScaleName = ScaleData.Name
		if ScaleName == PawnUICurrentScale then NewSelectedScale = ScaleName end
		if not FirstScale then FirstScale = ScaleName end
		-- Add the header if necessary.
		if ScaleData.Header ~= LastHeader then
			LastHeader = ScaleData.Header
			PawnUIFrame_ScaleSelector_AddHeaderLine(LastHeader)
		end
		-- Then, list the scale.
		PawnUIFrame_ScaleSelector_AddScaleLine(ScaleName, ScaleData.LocalizedName, ScaleData.IsVisible)
	end

	PawnUIScaleSelectorScrollContent:SetHeight(PawnUIScaleLineHeight + PawnUIScaleLineHeight * PawnUITotalScaleLines + PawnUIScaleSelectorPaddingBottom)

	-- If the scale that they previously selected isn't in the list, or they didn't have a previously-selected
	-- scale, just select the first visible one, or the first one if there's no visible scale.
	PawnUICurrentScale = NewSelectedScale or FirstScale or PawnLocal.NoScale
	PawnUI_HighlightCurrentScale()

	-- Also refresh a few other related UI elements.
	PawnUIUpdateHeader()
	PawnUIFrame_ShowScaleCheck_Update()
	PawnUIFrame_ScaleSelector_UpdateAuto()
end

function PawnUIFrame_ScaleSelector_UpdateAuto()
	local Scale = PawnCommon.Scales[PawnUICurrentScale]
	if Scale and Scale.ClassID and Scale.SpecID then
		local _, LocalizedSpecName, _, IconTexturePath = PawnGetSpecializationInfoForClassID(Scale.ClassID, Scale.SpecID)
		PawnUIFrame_ScaleSelector_SpecLabel:SetText(LocalizedSpecName)
		PawnUIFrame_ScaleSelector_SpecIcon:SetTexture(IconTexturePath)
	else
		PawnUIFrame_ScaleSelector_SpecLabel:SetText("")
		PawnUIFrame_ScaleSelector_SpecIcon:SetTexture(nil)
	end
end

function PawnUIFrame_ScaleSelector_AddHeaderLine(Text)
	local Line = PawnUIFrame_ScaleSelector_AddLineCore(Text)
	Line:Disable()
end

function PawnUIFrame_ScaleSelector_AddScaleLine(ScaleName, LocalizedName, IsActive)
	local ColoredName = LocalizedName
	local Line = PawnUIFrame_ScaleSelector_AddLineCore(" " .. ColoredName)
	if not IsActive then
		Line:SetNormalFontObject("PawnFontSilver")
	end
	Line.ScaleName = ScaleName
end

function PawnUIFrame_ScaleSelector_AddLineCore(Text)
	PawnUITotalScaleLines = PawnUITotalScaleLines + 1
	local LineName = "PawnUIScaleLine" .. PawnUITotalScaleLines
	local Line = CreateFrame("Button", LineName, PawnUIScaleSelectorScrollContent, "PawnUIFrame_ScaleSelector_ItemTemplate")
	Line:SetPoint("TOPLEFT", PawnUIScaleSelectorScrollContent, "TOPLEFT", 0, -PawnUIScaleLineHeight * (PawnUITotalScaleLines - 1) - (PawnUIIsShowingNoneWarning and PawnUIScaleSelectorNoneWarningHeight or 0))
	Line:SetText(Text)
	return Line, LineName
end

function PawnUIFrame_ScaleSelector_OnClick(self)
	local ScaleName = self.ScaleName
	-- If they held down the shift key, also toggle the scale visibility; otherwise, just select that scale.
	if IsShiftKeyDown() then
		PawnSetScaleVisible(ScaleName, not PawnIsScaleVisible(ScaleName))
		PawnUIFrame_ScaleSelector_Refresh()
	end
	PawnUI_SelectScale(ScaleName)
end

-- Selects a scale in the scales list.
function PawnUI_SelectScale(ScaleName)
	-- Close popup UI as necessary.
	PawnUIStringDialogSingleLine:Hide()
	PawnUIStringDialogMultiLine:Hide()
	ColorPickerFrame:Hide()
	-- Select the scale.
	PawnUICurrentScale = ScaleName
	PawnUI_HighlightCurrentScale()
	-- After selecting a new scale, update the rest of the UI.
	PawnUIFrame_ShowScaleCheck_Update()
	PawnUIUpdateHeader()
	PawnUIFrame_ScaleSelector_UpdateAuto()
	if PawnUIScalesTabPage:IsVisible() then
		PawnUI_ScalesTab_Refresh()
	end
	if PawnUIValuesTabPage:IsVisible() then
		PawnUI_ValuesTab_Refresh()
	end
	if PawnUICompareTabPage:IsVisible() then
		PawnUI_CompareTab_Refresh()
	end
	if PawnUIGemsTabPage:IsVisible() then
		PawnUI_ShowBestGems()
	end
end

function PawnUI_HighlightCurrentScale()
	PawnUIFrame_ScaleSelector_HighlightFrame:ClearAllPoints()
	PawnUIFrame_ScaleSelector_HighlightFrame:Hide()
	for i = 1, PawnUITotalScaleLines do
		local LineName = "PawnUIScaleLine" .. i
		local Line = getglobal(LineName)
		if Line and Line.ScaleName == PawnUICurrentScale then
			PawnUIFrame_ScaleSelector_HighlightFrame:SetPoint("TOPLEFT", "PawnUIScaleLine" .. i, "TOPLEFT", 0, 0)
			PawnUIFrame_ScaleSelector_HighlightFrame:Show()
			break
		end
	end
end

------------------------------------------------------------
-- Scales tab events
------------------------------------------------------------

function PawnUI_ScalesTab_Refresh()
	PawnUIFrame_ScaleColorSwatch_Update()

	if PawnUICurrentScale ~= PawnLocal.NoScale then
		PawnUIFrame_ScaleNameLabel:SetText(PawnGetScaleColor(PawnUICurrentScale) .. PawnGetScaleLocalizedName(PawnUICurrentScale))
		if PawnScaleIsReadOnly(PawnUICurrentScale) then
			PawnUIFrame_ScaleTypeLabel:SetText(PawnUIFrame_ScaleTypeLabel_ReadOnlyScaleText)
			PawnUIFrame_RenameScaleButton:Disable()
			PawnUIFrame_DeleteScaleButton:Disable()
		else
			PawnUIFrame_ScaleTypeLabel:SetText(PawnUIFrame_ScaleTypeLabel_NormalScaleText)
			PawnUIFrame_RenameScaleButton:Enable()
			PawnUIFrame_DeleteScaleButton:Enable()
		end
		PawnUIFrame_CopyScaleButton:Enable()
		PawnUIFrame_ExportScaleButton:Enable()
	else
		PawnUIFrame_ScaleNameLabel:SetText(PawnLocal.NoScale)
		PawnUIFrame_CopyScaleButton:Disable()
		PawnUIFrame_RenameScaleButton:Disable()
		PawnUIFrame_DeleteScaleButton:Disable()
		PawnUIFrame_ExportScaleButton:Disable()
	end
	PawnUI_ScalesTab_SelectFrame()
end

------------------------------------------------------------
-- Values tab events
------------------------------------------------------------

function PawnUI_ValuesTab_Refresh()
	PawnUIFrame_StatsList_Update()
	PawnUIFrame_StatsList_SelectStat(PawnUICurrentStatIndex)
	local Scale
	if PawnUICurrentScale ~= PawnLocal.NoScale then Scale = PawnCommon.Scales[PawnUICurrentScale] end

	if PawnUICurrentScale == PawnLocal.NoScale then
		PawnUIFrame_ValuesWelcomeLabel:SetText(PawnUIFrame_ValuesWelcomeLabel_NoScalesText)
	elseif PawnScaleIsReadOnly(PawnUICurrentScale) then
		PawnUIFrame_ValuesWelcomeLabel:SetText(PawnUIFrame_ValuesWelcomeLabel_ReadOnlyScaleText)
		PawnUIFrame_NormalizeValuesCheck:Disable()
	else
		PawnUIFrame_ValuesWelcomeLabel:SetText(PawnUIFrame_ValuesWelcomeLabel_NormalText)
		PawnUIFrame_NormalizeValuesCheck:Enable()
	end
	if Scale then
		PawnUIFrame_NormalizeValuesCheck:SetChecked(Scale.NormalizationFactor and Scale.NormalizationFactor > 0)
		PawnUIFrame_NormalizeValuesCheck:Show()
	else
		PawnUIFrame_NormalizeValuesCheck:Hide()
	end
end

function PawnUIFrame_ImportScaleButton_OnClick()
	PawnUIImportScale()
end

function PawnUIFrame_NewScaleButton_OnClick()
	PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScale_OnOK)
end

function PawnUIFrame_NewScale_OnOK(NewScaleName)
	-- Does this scale already exist?
	if NewScaleName == PawnLocal.NoScale then
		PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScale_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_NewScale_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, NewScaleName, PawnUIFrame_NewScale_OnOK)
		return
	end

	-- Add and select the scale.
	PawnAddEmptyScale(NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
	PawnUISwitchToTab(PawnUIValuesTabPage)
end

function PawnUIFrame_NewScaleFromDefaultsButton_OnClick()
	PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScaleFromDefaults_OnOK)
end

function PawnUIFrame_NewScaleFromDefaults_OnOK(NewScaleName)
	-- Does this scale already exist?
	if NewScaleName == PawnLocal.NoScale then
		PawnUIGetString(PawnLocal.NewScaleEnterName, "", PawnUIFrame_NewScaleFromDefaults_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_NewScaleFromDefaults_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, NewScaleName, PawnUIFrame_NewScaleFromDefaults_OnOK)
		return
	end

	-- Add and select the scale.
	PawnAddDefaultScale(NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
	PawnUISwitchToTab(PawnUIValuesTabPage)
end

function PawnUIFrame_ExportScaleButton_OnClick()
	PawnUIExportScale(PawnUICurrentScale)
end

function PawnUIFrame_RenameScaleButton_OnClick()
	PawnUIGetString(format(PawnLocal.RenameScaleEnterName, PawnUICurrentScale), PawnUICurrentScale, PawnUIFrame_RenameScale_OnOK)
end

function PawnUIFrame_CopyScaleButton_OnClick()
	PawnUIGetString(format(PawnLocal.CopyScaleEnterName, PawnGetScaleLocalizedName(PawnUICurrentScale)), "", PawnUIFrame_CopyScale_OnOK)
end

-- Shows a dialog where the user can copy a scale tag for a given scale to the clipboard.
-- Immediately returns true if successful, or false if not.
function PawnUIExportScale(ScaleName)
	local ScaleTag = PawnGetScaleTag(ScaleName)
	if ScaleTag then
		PawnUIShowCopyableString(format(PawnLocal.ExportScaleMessage, PawnGetScaleLocalizedName(PawnUICurrentScale)), ScaleTag, nil, true)
		return true
	else
		return false
	end
end

-- Exports all custom scales as a series of scale tags.
function PawnUIExportAllScales()
	local ScaleTags, ScaleName, Scale
	ScaleTags = ""
	for ScaleName in pairs(PawnCommon.Scales) do
		if not PawnScaleIsReadOnly(ScaleName) then ScaleTags = ScaleTags .. PawnGetScaleTag(ScaleName) .. "    " end
	end
	if ScaleTags and ScaleTags ~= "" then
		PawnUIShowCopyableString(PawnLocal.ExportAllScalesMessage, ScaleTags, nil, true)
		return true
	else
		return false
	end
end

-- Shows a dialog where the user can paste a scale tag from the clipboard.
-- Immediately returns.
function PawnUIImportScale()
	PawnUIGetString(PawnLocal.ImportScaleMessage, "", PawnUIImportScaleCallback, nil, true)
end

-- Callback function for PawnUIImportScale.
function PawnUIImportScaleCallback(ScaleTag)
	-- Try to import the scale.  If successful, we don't need to do anything else.
	local Status, ScaleName = PawnImportScale(ScaleTag, true) -- allow overwriting a scale with the same name
	if Status == PawnImportScaleResultSuccess then
		if PawnUIFrame_ScaleSelector_Refresh then
			-- Select the new scale if the UI is up.
			PawnUIFrame_ScaleSelector_Refresh()
			PawnUI_SelectScale(ScaleName)
			PawnUISwitchToTab(PawnUIValuesTabPage)
		end
		return
	end

	-- If there was a problem, show an error message or reshow the dialog as appropriate.
	if Status == PawnImportScaleResultAlreadyExists then
		VgerCore.Message(VgerCore.Color.Salmon .. format(PawnLocal.ImportScaleAlreadyExistsMessage, ScaleName))
		return
	end
	if Status == PawnImportScaleResultTagError then
		-- Don't use the tag that was pasted as the default value; it makes it harder to paste.
		PawnUIGetString(PawnLocal.ImportScaleTagErrorMessage, "", PawnUIImportScaleCallback, nil, true)
		return
	end

	VgerCore.Fail("Unexpected PawnImportScaleResult value: " .. tostring(Status))
end

function PawnUIFrame_RenameScale_OnOK(NewScaleName)
	-- Did they change anything?
	if NewScaleName == PawnUICurrentScale then return end

	-- Does this scale already exist?
	if NewScaleName == PawnLocal.NoScale then
		PawnUIGetString(format(PawnLocal.RenameScaleEnterName, PawnUICurrentScale), PawnUICurrentScale, PawnUIFrame_RenameScale_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_RenameScale_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, PawnUICurrentScale, PawnUIFrame_RenameScale_OnOK)
		return
	end

	-- Rename and select the scale.
	PawnRenameScale(PawnUICurrentScale, NewScaleName)
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
end

function PawnUIFrame_CopyScale_OnOK(NewScaleName)
	-- Does this scale already exist?
	if NewScaleName == PawnLocal.NoScale then
		PawnUIGetString(PawnLocal.CopyScaleEnterName, "", PawnUIFrame_CopyScale_OnOK)
		return
	elseif strfind(NewScaleName, "\"") then
		PawnUIGetString(PawnLocal.NewScaleNoQuotes, NewScaleName, PawnUIFrame_CopyScale_OnOK)
	elseif PawnDoesScaleExist(NewScaleName) then
		PawnUIGetString(PawnLocal.NewScaleDuplicateName, NewScaleName, PawnUIFrame_CopyScale_OnOK)
		return
	end

	-- Create the new scale.
	PawnDuplicateScale(PawnUICurrentScale, NewScaleName)
	if PawnScaleIsReadOnly(PawnUICurrentScale) then PawnSetScaleVisible(PawnUICurrentScale, false) end
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_SelectScale(NewScaleName)
	PawnUISwitchToTab(PawnUIValuesTabPage)
end

function PawnUIFrame_DeleteScaleButton_OnClick()
	if IsShiftKeyDown() then
		-- If the user held down the shift key when clicking the Delete button, just do it immediately.
		PawnUIFrame_DeleteScaleButton_OnOK(DELETE_ITEM_CONFIRM_STRING)
	else
		PawnUIGetString(format(PawnLocal.DeleteScaleConfirmation, PawnUICurrentScale, DELETE_ITEM_CONFIRM_STRING), "", PawnUIFrame_DeleteScaleButton_OnOK)
	end
end

function PawnUIFrame_DeleteScaleButton_OnOK(ConfirmationText)
	-- If they didn't type "DELETE" (ignoring case), just exit.
	if strlower(ConfirmationText) ~= strlower(DELETE_ITEM_CONFIRM_STRING) then return end

	PawnDeleteScale(PawnUICurrentScale)
	PawnUICurrentScale = nil
	PawnUIFrame_ScaleSelector_Refresh()
	PawnUI_ScalesTab_Refresh()
end

function PawnUI_ScalesTab_SelectFrame()
	if not VgerCore.SpecsExist then
		PawnUIFrame_AutoSelectScalesOnButton:Hide()
		PawnUIFrame_AutoSelectScalesOffButton.SelectedTexture:Show()
		PawnUIScalesTab_AutoFrame:Hide()
		PawnUIScalesTab_ManualFrame:Show()
	elseif PawnOptions.AutoSelectScales then
		PawnUIFrame_AutoSelectScalesOnButton.SelectedTexture:Show()
		PawnUIScalesTab_AutoFrame:Show()
		PawnUIFrame_AutoSelectScalesOffButton.SelectedTexture:Hide()
		PawnUIScalesTab_ManualFrame:Hide()
	else
		PawnUIFrame_AutoSelectScalesOnButton.SelectedTexture:Hide()
		PawnUIScalesTab_AutoFrame:Hide()
		PawnUIFrame_AutoSelectScalesOffButton.SelectedTexture:Show()
		PawnUIScalesTab_ManualFrame:Show()
	end
	PawnUISwitchToTab(PawnUIScalesTabPage)
end

function PawnUIFrame_AutoSelectScalesOnButton_OnClick()
	PawnOptions.UpgradeTracking = false
	PawnSetAutoSelectScales(true)
	PawnUI_ScalesTab_SelectFrame()
end

function PawnUIFrame_AutoSelectScalesOffButton_OnClick()
	PawnSetAutoSelectScales(false)
	PawnUI_ScalesTab_SelectFrame()
end

function PawnUIFrame_StatsList_Update()
	if not PawnStats then return end

	-- First, update the control and get our new offset.
	FauxScrollFrame_Update(PawnUIFrame_StatsList, #PawnStats, PawnUIStatsListHeight, PawnUIStatsListItemHeight) -- list, number of items, number of items visible per page, item height
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)

	-- Then, update the list items as necessary.
	local ThisScale
	if PawnUICurrentScale ~= PawnLocal.NoScale then ThisScale = PawnGetAllStatValues(PawnUICurrentScale) end
	local i
	for i = 1, PawnUIStatsListHeight do
		local Index = i + Offset
		PawnUIFrame_StatsList_UpdateStatItem(i, Index, ThisScale)
	end

	-- After the user scrolled, we need to adjust their selection.
	PawnUIFrame_StatsList_MoveHighlight()

end

-- Updates a single stat in the list based on its index into the PawnStats table.
function PawnUIFrame_StatsList_UpdateStat(Index)
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	local i = Index - Offset
	if i <= 0 or i > PawnUIStatsListHeight then return end

	PawnUIFrame_StatsList_UpdateStatItem(i, Index, PawnGetAllStatValues(PawnUICurrentScale))
end

-- Updates a single stat in the list.
function PawnUIFrame_StatsList_UpdateStatItem(i, Index, ThisScale)
	local Title = PawnStats[Index][1]
	local ThisStat = PawnStats[Index][2]
	local Line = getglobal("PawnUIFrame_StatsList_Item" .. i)

	if Index <= #PawnStats then
		if not ThisStat then
			-- This is a header row.
			Line:SetText(Title)
			Line:Disable()
		elseif ThisScale and ThisScale[ThisStat] then
			-- This is a stat that's in the current scale.
			if ThisScale[ThisStat] <= PawnIgnoreStatValue then
				-- Well, technically, it's ignored.
				Line:SetText("  " .. Title .. " " .. PawnLocal.Unusable)
				Line:SetNormalFontObject("PawnFontSilver")
			else
				Line:SetText("  " .. Title .. " = " .. format("%g", ThisScale[ThisStat]))
				Line:SetNormalFontObject("GameFontHighlight")
			end
			Line:Enable()
		else
			-- This is a stat that's not in the current scale.
			Line:SetText("  " .. Title)
			Line:SetNormalFontObject("PawnFontSilver")
			Line:Enable()
		end
		Line:Show()
	else
		Line:Hide()
	end
end

-- Adjusts PawnUICurrentListIndex and the position of the highlight based on PawnUICurrentStatIndex.
function PawnUIFrame_StatsList_MoveHighlight()
	-- If no stat is selected, just hide the highlight.
	if not PawnUICurrentStatIndex or PawnUICurrentStatIndex == 0 then
		PawnUICurrentListIndex = 0
		PawnUIFrame_StatsList_HighlightFrame:Hide()
		return
	end

	-- Otherwise, see if we need to draw a highlight.  If the selected stat isn't visible, we shouldn't draw anything.
	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	local i = PawnUICurrentStatIndex - Offset
	if i <= 0 or i > PawnUIStatsListHeight then
		PawnUICurrentListIndex = 0
		PawnUIFrame_StatsList_HighlightFrame:Hide()
		return
	end

	-- If we made it this far, then we need to draw a highlight.
	PawnUICurrentListIndex = i
	PawnUIFrame_StatsList_HighlightFrame:ClearAllPoints()
	PawnUIFrame_StatsList_HighlightFrame:SetPoint("TOPLEFT", "PawnUIFrame_StatsList_Item" .. i, "TOPLEFT", 0, 0)
	PawnUIFrame_StatsList_HighlightFrame:Show()
end

-- This is the click handler for list item #i.
function PawnUIFrame_StatsList_OnClick(i)
	if not i or i <= 0 or i > PawnUIStatsListHeight then return end

	local Offset = FauxScrollFrame_GetOffset(PawnUIFrame_StatsList)
	local Index = i + Offset

	PawnUIFrame_StatsList_SelectStat(Index)
end

function PawnUIFrame_StatsList_SelectStat(Index)
	-- First, make sure that the stat is in the correct range.
	if not Index or Index < 0 or Index > #PawnStats then
		Index = 0
	end

	-- Then, find out what they've clicked on.
	local Title, ThisStat, ThisDescription, ThisPrompt
	if Index > 0 then
		Title = PawnStats[Index][1]
		ThisStat = PawnStats[Index][2]
		if ThisStat then
			-- This is a stat, not a header row.
		else
			-- This is a header row, or empty space.
			Index = 0
		end
	end
	PawnUICurrentStatIndex = Index

	-- Show, move, or hide the highlight as appropriate.
	PawnUIFrame_StatsList_MoveHighlight()

	-- Finally, change the UI to the right.
	local ThisScale
	local ThisScaleIsReadOnly = PawnScaleIsReadOnly(PawnUICurrentScale)
	if PawnUICurrentScale ~= PawnLocal.NoScale then ThisScale = PawnGetAllStatValues(PawnUICurrentScale) end
	if Index > 0 and ThisScale then
		-- They've selected a stat.
		local ThisStatIsIgnored = ThisScale[ThisStat] and ThisScale[ThisStat] <= PawnIgnoreStatValue
		ThisDescription = PawnStats[Index][3]
		PawnUIFrame_DescriptionLabel:SetText(ThisDescription)
		ThisPrompt = PawnStats[Index][5]
		if ThisPrompt then
			PawnUIFrame_StatNameLabel:SetText(ThisPrompt)
		else
			PawnUIFrame_StatNameLabel:SetText(format(PawnLocal.StatNameText, Title))
		end
		PawnUIFrame_StatNameLabel:Show()
		local ThisScaleValue = ThisScale[ThisStat]
		local ThisScaleValueUneditable = ThisScaleValue
		if ThisStatIsIgnored then ThisScaleValueUneditable = "0" end
		if not ThisScaleValueUneditable then ThisScaleValueUneditable = "0" end
		if not ThisScaleValue or ThisScaleValue == 0 then ThisScaleValue = "" else ThisScaleValue = tostring(ThisScaleValue) end
		PawnUIFrame_StatValueBox.SettingValue = (PawnUIFrame_StatValueBox:GetText() ~= ThisScaleValue)
		PawnUIFrame_StatValueBox:SetText(ThisScaleValue)
		PawnUIFrame_StatValueLabel:SetText(ThisScaleValueUneditable)
		if ThisScaleIsReadOnly or ThisStatIsIgnored then
			PawnUIFrame_StatValueLabel:Show()
			PawnUIFrame_StatValueBox:Hide()
			PawnUIFrame_ClearValueButton:Hide()
		else
			PawnUIFrame_StatValueBox:Show()
			PawnUIFrame_StatValueLabel:Hide()
			if ThisScaleValue ~= "" then
				PawnUIFrame_ClearValueButton:Show()
			else
				PawnUIFrame_ClearValueButton:Hide()
			end
		end
		PawnUIFrame_IgnoreStatCheck:SetChecked(ThisStatIsIgnored)
		local TypeOfStat = PawnStats[Index][4]
		if (not ThisScaleIsReadOnly) and (TypeOfStat ~= PawnStatUnignorable) then
			-- Shown and editable: scale is editable and stat is not unignorable
			PawnUIFrame_IgnoreStatCheck_Label:SetText(TypeOfStat == PawnStatItemType and PawnLocal.UI.ValuesIgnoreItemType or PawnLocal.UI.ValuesIgnoreStat)
			PawnUIFrame_IgnoreStatCheck:Show()
			PawnUIFrame_IgnoreStatCheck:Enable()
		elseif ThisScaleIsReadOnly and (ThisStatIsIgnored) then
			-- Shown but not editable: scale is not editable and stat is currently ignored
			PawnUIFrame_IgnoreStatCheck_Label:SetText(TypeOfStat == PawnStatItemType and PawnLocal.UI.ValuesIgnoreItemType or PawnLocal.UI.ValuesIgnoreStat)
			PawnUIFrame_IgnoreStatCheck:Show()
			PawnUIFrame_IgnoreStatCheck:Disable()
		else
			-- Hidden: anytime else
			PawnUIFrame_IgnoreStatCheck:Hide()
			PawnUIFrame_IgnoreStatCheck:Disable()
		end
		local WeaponSet = PawnGetWeaponSetForStat(ThisStat)
		if WeaponSet then PawnUIFrame_NoUpgradesCheck:SetChecked(not PawnGetShowUpgradesForWeapons(PawnUICurrentScale, WeaponSet)) end
		PawnUIFrame_FollowSpecializationCheck:SetChecked(PawnGetUpgradesFollowSpecialization(PawnUICurrentScale))
		if WeaponSet == 1 then
			PawnUIFrame_NoUpgradesCheck_Label:SetText(PawnLocal.UI.ValuesDoNotShowUpgradesFor1H)
		elseif WeaponSet == 2 then
			PawnUIFrame_NoUpgradesCheck_Label:SetText(PawnLocal.UI.ValuesDoNotShowUpgradesFor2H)
		end
		if WeaponSet == nil then
			PawnUIFrame_NoUpgradesCheck:Hide()
		else
			PawnUIFrame_NoUpgradesCheck:Show()
		end
		if (PawnArmorSpecializationLevel ~= nil) and (ThisStat == "IsCloth" or ThisStat == "IsLeather" or ThisStat == "IsMail" or ThisStat == "IsPlate") then
			PawnUIFrame_FollowSpecializationCheck:Show()
		else
			PawnUIFrame_FollowSpecializationCheck:Hide()
		end
	elseif PawnUICurrentScale == PawnLocal.NoScale then
		-- They don't have any scales.
		PawnUIFrame_DescriptionLabel:SetText(PawnLocal.NoScalesDescription)
		PawnUIFrame_StatNameLabel:Hide()
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Hide()
		PawnUIFrame_ClearValueButton:Hide()
		PawnUIFrame_IgnoreStatCheck:Hide()
		PawnUIFrame_NoUpgradesCheck:Hide()
		PawnUIFrame_FollowSpecializationCheck:Hide()
	else
		-- They haven't selected a stat.
		PawnUIFrame_DescriptionLabel:SetText(PawnLocal.NoStatDescription)
		PawnUIFrame_StatNameLabel:Hide()
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Hide()
		PawnUIFrame_ClearValueButton:Hide()
		PawnUIFrame_IgnoreStatCheck:Hide()
		PawnUIFrame_NoUpgradesCheck:Hide()
		PawnUIFrame_FollowSpecializationCheck:Hide()
	end

end

function PawnUIFrame_IgnoreStatCheck_OnClick()
	if PawnScaleIsReadOnly(PawnUICurrentScale) then return end

	local IsIgnoredNow = PawnUIFrame_IgnoreStatCheck:GetChecked()
	if IsIgnoredNow then
		PawnUIFrame_ClearValueButton:Hide()
		PawnUIFrame_StatValueBox:Hide()
		PawnUIFrame_StatValueLabel:Show()
		PawnUIFrame_StatValueLabel:SetText("0")
		PawnSetStatValue(PawnUICurrentScale, PawnStats[PawnUICurrentStatIndex][2], PawnIgnoreStatValue)
	else
		PawnUIFrame_ClearValueButton:Disable()
		PawnUIFrame_ClearValueButton:Show()
		PawnUIFrame_StatValueBox:SetText("")
		PawnUIFrame_StatValueBox:Show()
		PawnSetStatValue(PawnUICurrentScale, PawnStats[PawnUICurrentStatIndex][2], 0)
	end
	PawnUIFrame_StatsList_UpdateStat(PawnUICurrentStatIndex)
end

function PawnUIFrame_NoUpgradesCheck_OnClick()
	local WeaponSet = PawnGetWeaponSetForStat(PawnStats[PawnUICurrentStatIndex][2])
	if not WeaponSet then VgerCore.Fail("Couldn't find the weapon set to enable or disable.") return end

	PawnSetShowUpgradesForWeapons(PawnUICurrentScale, WeaponSet, not PawnUIFrame_NoUpgradesCheck:GetChecked())
end

function PawnUIFrame_FollowSpecializationCheck_OnClick()
	PawnSetUpgradesFollowSpecialization(PawnUICurrentScale, PawnUIFrame_FollowSpecializationCheck:GetChecked())
end

function PawnUIFrame_StatValueBox_OnTextChanged()
	if PawnScaleIsReadOnly(PawnUICurrentScale) then return end

	local NewString = gsub(PawnUIFrame_StatValueBox:GetText(), ",", ".")
	local NewValue = tonumber(NewString)
	if NewValue == 0 then NewValue = nil end

	if NewValue then
		if NewValue <= PawnIgnoreStatValue then
			PawnUIFrame_StatValueBox:Hide()
			PawnUIFrame_ClearValueButton:Hide()
			PawnUIFrame_IgnoreStatCheck:SetChecked(true)
		else
			PawnUIFrame_StatValueBox:Show()
			PawnUIFrame_ClearValueButton:Show()
			PawnUIFrame_ClearValueButton:Enable()
			PawnUIFrame_IgnoreStatCheck:SetChecked(false)
		end
	else
		PawnUIFrame_StatValueBox:Show()
		PawnUIFrame_ClearValueButton:Show()
		PawnUIFrame_ClearValueButton:Disable()
		PawnUIFrame_IgnoreStatCheck:SetChecked(false)
	end

	-- If other code is setting this value, we should ignore this event and not set any values.
	if PawnUIFrame_StatValueBox.SettingValue then
		PawnUIFrame_StatValueBox.SettingValue = false
		return
	end
	PawnSetStatValue(PawnUICurrentScale, PawnStats[PawnUICurrentStatIndex][2], NewValue)
	PawnUIFrame_StatsList_UpdateStat(PawnUICurrentStatIndex)
end

function PawnUIFrame_ClearValueButton_OnClick()
	PawnUIFrame_StatValueBox:SetText("")
end

function PawnUIFrame_GetCurrentScaleColor()
	local r, g, b
	if PawnUICurrentScale and PawnUICurrentScale ~= PawnLocal.NoScale then r, g, b = VgerCore.HexToRGB(PawnCommon.Scales[PawnUICurrentScale].Color) end
	if not r then
		r, g, b = VgerCore.Color.BlueR, VgerCore.Color.BlueG, VgerCore.Color.BlueB
	end
	return r, g, b
end

function PawnUIFrame_ScaleColorSwatch_OnClick()
	-- Get the color of the current scale.
	local r, g, b = PawnUIFrame_GetCurrentScaleColor()
	ColorPickerFrame.func = PawnUIFrame_ScaleColorSwatch_OnChange
	ColorPickerFrame.cancelFunc = PawnUIFrame_ScaleColorSwatch_OnCancel
	ColorPickerFrame.previousValues = { r, g, b }
	ColorPickerFrame.hasOpacity = false
	ColorPickerFrame:SetColorRGB(r, g, b)
	ShowUIPanel(ColorPickerFrame)
end

function PawnUIFrame_ScaleColorSwatch_OnChange()
	local r, g, b = ColorPickerFrame:GetColorRGB()
	PawnUIFrame_ScaleColorSwatch_SetColor(r, g, b)
end

function PawnUIFrame_ScaleColorSwatch_OnCancel(rgb)
	---@diagnostic disable-next-line: deprecated
	local r, g, b = unpack(rgb)
	PawnUIFrame_ScaleColorSwatch_SetColor(r, g, b)
end

function PawnUIFrame_ScaleColorSwatch_SetColor(r, g, b)
	PawnSetScaleColor(PawnUICurrentScale, VgerCore.RGBToHex(r, g, b))
	PawnUI_ScalesTab_Refresh()
	PawnResetTooltips()
end

function PawnUIFrame_ScaleColorSwatch_Update()
	if PawnUICurrentScale ~= PawnLocal.NoScale then
		local r, g, b = PawnUIFrame_GetCurrentScaleColor()
		PawnUIFrame_ScaleColorSwatch_Color:SetColorTexture(r, g, b)
		PawnUIFrame_ScaleColorSwatch_Label:Show()
		PawnUIFrame_ScaleColorSwatch:Show()
	else
		PawnUIFrame_ScaleColorSwatch_Label:Hide()
		PawnUIFrame_ScaleColorSwatch:Hide()
	end
end

function PawnUIFrame_ShowScaleCheck_Update()
	if PawnUICurrentScale ~= PawnLocal.NoScale then
		PawnUIFrame_ShowScaleCheck:SetChecked(PawnIsScaleVisible(PawnUICurrentScale))
		PawnUIFrame_ShowScaleCheck:Show()
	else
		PawnUIFrame_ShowScaleCheck:Hide()
	end
end

function PawnUIFrame_ShowScaleCheck_OnClick()
	PawnSetScaleVisible(PawnUICurrentScale, PawnUIFrame_ShowScaleCheck:GetChecked())
	PawnUIFrame_ScaleSelector_Refresh()
end

function PawnUIFrame_NormalizeValuesCheck_OnClick()
	if PawnUICurrentScale == PawnLocal.NoScale or PawnScaleIsReadOnly(PawnUICurrentScale) then return end

	if PawnUIFrame_NormalizeValuesCheck:GetChecked() then
		PawnSetScaleNormalizationFactor(PawnUICurrentScale, 1)
	else
		PawnSetScaleNormalizationFactor(PawnUICurrentScale, nil)
	end
end

------------------------------------------------------------
-- Compare tab
------------------------------------------------------------

-- Initializes the Compare tab if it hasn't already been initialized.
local PawnUI_CompareTabInitialized
function PawnUI_InitCompareTab()
	-- This only needs to be run once.
	if PawnUI_CompareTabInitialized then return end
	PawnUI_CompareTabInitialized = true

	-- All the Compare tab needs to do here is clear out the comparison items so the UI is in the default state.
	PawnUI_ClearCompareItems()
end

function PawnUI_CompareTab_Refresh()
	PawnUI_InitCompareTab()

	-- Update the currently visible comparison, if any.
	PawnUI_CompareItems()
	-- Then, update the best in slot shortcuts.
	local Item = PawnUIComparisonItems[2]
	local ItemEquipLoc, _
	if Item then _, _, _, _, _, _, _, _, ItemEquipLoc = GetItemInfo(Item.Link) end
	PawnUI_SetShortcutBestItem(3, ItemEquipLoc)
	PawnUI_SetShortcutBestItem(4, ItemEquipLoc)
end

-- Called whenever we reset the tooltips due to a calculation change.
function PawnUI_ClearCacheValues()
	if PawnUIComparisonItems[1] then PawnUIComparisonItems[1].Values = nil end
	if PawnUIComparisonItems[2] then PawnUIComparisonItems[2].Values = nil end
end

-- Sets either the left (index 1) or right (index 2) comparison item, using an item link.  If the passed item
-- link is nil, that comparison item is instead cleared out.  Returns true if an item was actually placed in the
-- slot or cleared from the slot.
function PawnUI_SetCompareItem(Index, ItemLink)
	PawnUI_InitCompareTab()
	if Index ~= 1 and Index ~= 2 then
		VgerCore.Fail("Index must be 1 or 2.")
		return
	end

	-- Get the item data for this item link; we can't do a comparison without it.
	local Item
	if ItemLink then
		-- If they passed item data instead of an item link, just use that.  Otherwise, get item data from the link.
		if type(ItemLink) == "table" then
			Item = ItemLink
			ItemLink = Item.Link
			if not ItemLink then
				VgerCore.Fail("Second parameter must be an item link or item data from PawnGetItemData.")
				return
			end
		elseif type(ItemLink) == "number" or tonumber(ItemLink) ~= nil then
			ItemLink = "item:" .. ItemLink
			Item = PawnGetItemData(ItemLink)
			-- If Item is nil, then that item isn't actually a valid item with stats, so we shouldn't allow it in the compare UI.
			if not Item then return end
		else
			-- Check to make sure it's an item link and not, say, a battle pet.
			if PawnGetHyperlinkType(ItemLink) ~= "item" then return end
			-- Unenchant the item link.
			ItemLink = PawnUnenchantItemLink(ItemLink, true)
			Item = PawnGetItemData(ItemLink)
			-- If Item is nil, then that item isn't actually a valid item with stats, so we shouldn't allow it in the compare UI.
			if not Item then return end
		end
	end
	local ItemName, ItemRarity, ItemEquipLoc, ItemTexture, _
	local SlotID1, SlotID2
	if ItemLink then
		ItemName, _, ItemRarity, _, _, _, _, _, ItemEquipLoc, ItemTexture = GetItemInfo(ItemLink)
		SlotID1, SlotID2 = PawnGetSlotsForItemType(ItemEquipLoc)
	else
		ItemName = PawnUIFrame_VersusHeader_NoItem
		ItemRarity = 0
	end

	-- Items that are not equippable cannot be placed in the Compare slots.
	if ItemLink and SlotID1 == nil and SlotID2 == nil then return end

	-- Save the item data locally, in case the item is later removed from the main Pawn item cache.
	PawnUIComparisonItems[Index] = Item

	-- Now, update the item name and icon.
	local Label = getglobal("PawnUICompareItemName" .. Index)
	local Texture = getglobal("PawnUICompareItemIcon" .. Index .. "NormalTexture")
	Label:SetText(ItemName)
	local Color = ITEM_QUALITY_COLORS[ItemRarity]
	if Color then Label:SetVertexColor(Color.r, Color.g, Color.b) end
	Texture:SetTexture(ItemTexture)

	-- If this item is a different type than the existing item, clear out the existing item.
	if ItemLink then
		local OtherIndex
		if Index == 1 then OtherIndex = 2 else OtherIndex = 1 end
		if PawnUIComparisonItems[OtherIndex] then
			_, _, _, _, _, _, _, _, OtherItemEquipLoc = GetItemInfo(PawnUIComparisonItems[OtherIndex].Link)
			local OtherSlotID1, OtherSlotID2 = PawnGetSlotsForItemType(OtherItemEquipLoc)
			if not (
				(SlotID1 == nil and SlotID2 == nil and OtherSlotID1 == nil and OtherSlotID2 == nil) or
				(SlotID1 and (SlotID1 == OtherSlotID1 or SlotID1 == OtherSlotID2)) or
				(SlotID2 and (SlotID2 == OtherSlotID1 or SlotID2 == OtherSlotID2))
			) then
				PawnUI_SetCompareItem(OtherIndex, nil)
			end
		end
	end

	-- Update the item shortcuts.  The item shortcuts appear on the left side, but they're based on what's equipped on
	-- the right side.
	if Index == 2 then
		PawnUI_SetShortcutItemForSlot(1, SlotID1)
		PawnUI_SetShortcutItemForSlot(2, SlotID2)
		PawnUI_SetShortcutBestItem(3, ItemEquipLoc)
		PawnUI_SetShortcutBestItem(4, ItemEquipLoc)
	end

	-- Finally, either compare the two items, or remove the current comparison, whichever is appropriate.
	PawnUI_CompareItems()

	-- Return true to indicate success to the caller.
	return true
end

-- Same as PawnUI_SetCompareItem, but shows the Pawn Compare UI if not already visible.
function PawnUI_SetCompareItemAndShow(Index, ItemLink)
	-- Set this as a compare item.
	local Success = PawnUI_SetCompareItem(Index, ItemLink)
	if Success then
		-- Automatically pick a comparison item when possible.
		PawnUI_AutoCompare()

		-- If the Pawn Compare UI is not visible, show it.
		PawnUIShowTab(PawnUICompareTabPage)
	end

	return Success
end

-- If there is an item in slot 2 and nothing in slot 1, and the player has an item equipped in the proper slot, automatically
-- compare the slot 2 item with the equipped item.
function PawnUI_AutoCompare()
	if PawnUIComparisonItems[2] and not PawnUIComparisonItems[1] then
		-- First, pick an appropriate scale.
		local UpgradeInfo = PawnIsItemAnUpgrade(PawnUIComparisonItems[2])
		local ShortcutToUse
		if UpgradeInfo and #UpgradeInfo == 1 and UpgradeInfo[1].PercentUpgrade then
			-- This item upgrades exactly one scale, so switch to that scale and the current best-in-slot.
			PawnUI_SelectScale(UpgradeInfo[1].ScaleName)
			if PawnUIShortcutItems[3] then
				ShortcutToUse = PawnUIShortcutItems[3]
			elseif PawnUIShortcutItems[4] then
				ShortcutToUse = PawnUIShortcutItems[4]
			end
		end
		-- Now set the left compare item.
		if ShortcutToUse == nil and (PawnUIShortcutItems[1] or PawnUIShortcutItems[2]) then
			-- Normally, use the first shortcut.  But, if the first shortcut is missing or matches the item just compared, use the second
			-- shortcut item instead.
			ShortcutToUse = PawnUIShortcutItems[1]
			if (not PawnUIShortcutItems[1]) or (PawnUIShortcutItems[2] and (PawnUIShortcutItems[1].Link == PawnUIComparisonItems[2].Link)) then
				ShortcutToUse = PawnUIShortcutItems[2]
			end
		end
		-- Don't bother with an auto-comparison at all if the best item we found was the same item.
		if ShortcutToUse and ShortcutToUse.Link ~= PawnUIComparisonItems[2].Link then
			PawnUI_SetCompareItem(1, ShortcutToUse)
		end
	end
end

-- Tries to set one of the compare items based on what the user is currently hovering over.  Meant for keybindings.
function PawnUI_SetCompareFromHover(Index)
	PawnUI_SetCompareItemAndShow(Index, PawnLastHoveredItem)
end

-- Enables or disables one of the "currently equipped" shortcut buttons based on an inventory slot ID.  If there is an item in that
-- slot, that item will appear in the shortcut button.  If not, or if Slot is nil, that shortcut button will be hidden.
function PawnUI_SetShortcutItemForSlot(ShortcutIndex, Slot)
	if ShortcutIndex ~= 1 and ShortcutIndex ~= 2 then
		VgerCore.Fail("ShortcutIndex must be 1 or 2.")
		return
	end

	if Slot then
		PawnUIShortcutItems[ShortcutIndex] = PawnGetItemDataForInventorySlot(Slot, true)
	else
		PawnUIShortcutItems[ShortcutIndex] = nil
	end
	PawnUI_SetShortcutButtonItem(ShortcutIndex)
end

-- Enables or disables one of the "best in slot" shortcut buttons based on an inventory type.  If there is a best item for the
-- current scale for that inventory type, it will appear in the shortcut button.  Otherwise, it will be hidden.
function PawnUI_SetShortcutBestItem(ShortcutIndex, InvType)
	if ShortcutIndex ~= 3 and ShortcutIndex ~= 4 then
		VgerCore.Fail("ShortcutIndex must be 3 or 4.")
		return
	end

	-- Find the best item for this shortcut, and save it for later.  (If InvType is nil, this will return nil.)
	local BestItemLink = PawnGetBestItemLink(PawnUICurrentScale, InvType, ShortcutIndex - 2)
	if BestItemLink then
		PawnUIShortcutItems[ShortcutIndex] = PawnGetItemData(BestItemLink)
	else
		PawnUIShortcutItems[ShortcutIndex] = nil
	end
	PawnUI_SetShortcutButtonItem(ShortcutIndex)
end

function PawnUI_SetShortcutButtonItem(ShortcutIndex)
	local ButtonName = "PawnUICompareItemShortcut" .. ShortcutIndex
	local ShortcutButton = getglobal(ButtonName)

	-- Update this button.
	local Item = PawnUIShortcutItems[ShortcutIndex]
	if Item then
		local Texture = getglobal(ButtonName .. "NormalTexture")
		local _, _, _, _, _, _, _, _, _, ItemTexture = GetItemInfo(Item.Link)
		Texture:SetTexture(ItemTexture)
		ShortcutButton:Show()
	else
		ShortcutButton:Hide()
	end

	-- Now, show or hide the header text above this button.
	if ShortcutIndex == 1 or ShortcutIndex == 2 then
		if PawnUIShortcutItems[1] or PawnUIShortcutItems[2] then
			PawnUIFrame_EquippedItemsHeader:Show()
		else
			PawnUIFrame_EquippedItemsHeader:Hide()
		end
	elseif ShortcutIndex == 3 or ShortcutIndex == 4 then
		if PawnUIShortcutItems[3] or PawnUIShortcutItems[4] then
			PawnUIFrame_BestItemsHeader:Show()
		else
			PawnUIFrame_BestItemsHeader:Hide()
		end
	end
end

-- Clears both comparison items and all comparison data.
function PawnUI_ClearCompareItems()
	PawnUI_SetCompareItem(1, nil)
	PawnUI_SetCompareItem(2, nil)
end

-- Swaps the left and right comparison items.
function PawnUI_SwapCompareItems()
	local Item1, Item2 = PawnUIComparisonItems[1], PawnUIComparisonItems[2]
	if SOUNDKIT then PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON) else PlaySound("igMainMenuOptionCheckBoxOn") end
	-- Set the right item to nil first so that unnecessary comparisons aren't performed.
	PawnUI_SetCompareItem(2, nil)
	PawnUI_SetCompareItem(1, Item2)
	PawnUI_SetCompareItem(2, Item1)
end

-- Performs an item comparison.  If the item in either index 1 or index 2 is currently empty, no
-- item comparison is made and the function silently exits.
function PawnUI_CompareItems(IsAutomatedRefresh)
	-- Before doing anything else, clear out the existing comparison data.
	PawnUICompareItemScore1:SetText("")
	PawnUICompareItemScore2:SetText("")
	PawnUICompareItemScoreDifference1:SetText("")
	PawnUICompareItemScorePercentDifference1:SetText("")
	PawnUICompareItemScoreDifference2:SetText("")
	PawnUICompareItemScorePercentDifference2:SetText("")
	PawnUICompareItemScoreHighlight1:Hide()
	PawnUICompareItemScoreHighlight2:Hide()
	PawnUICompareItemScoreArrow1:Hide()
	PawnUICompareItemScoreArrow2:Hide()
	PawnUIFrame_CompareSwapButton:Hide()
	PawnUI_DeleteComparisonLines()

	-- There must be a scale selected to perform a comparison.
	PawnUI_EnsureLoaded()
	if (not PawnUICurrentScale) or (PawnUICurrentScale == PawnLocal.NoScale) then return end

	-- There must be two valid comparison items set to perform a comparison.
	local Item1, Item2 = PawnUIComparisonItems[1], PawnUIComparisonItems[2]
	if Item1 or Item2 then PawnUIFrame_CompareSwapButton:Show() end
	if (not Item1) or (not Item2) then return end

	-- We have two comparison items set.  Do the compare!
	local ItemStats1 = Item1.UnenchantedStats
	local ItemSocketBonusStats1 = Item1.UnenchantedSocketBonusStats
	local ItemStats2 = Item2.UnenchantedStats
	local ItemSocketBonusStats2 = Item2.UnenchantedSocketBonusStats
	local ThisScale = PawnCommon.Scales[PawnUICurrentScale]
	local ThisScaleValues = ThisScale.Values

	-- For items that have socket bonuses, we actually go through the list twice -- the first loop goes until we get to
	-- the place in the list where the socket bonus should be displayed, and then we pause the first loop and go into
	-- the second loop.  Once the second loop completes, we return to the first loop and finish it.
	if (not ItemStats1) or (not ItemStats2) then return end
	local CurrentItemStats1, CurrentItemStats2 = ItemStats1, ItemStats2

	local StatCount = #PawnStats
	local LastFoundHeader
	local i = 1
	for i = 1, StatCount do
		local ThisStatInfo = PawnStats[i]
		VgerCore.Assert(ThisStatInfo, "Failed to find stat info at PawnStats[" .. i .. "]")
		local Title, StatName = ThisStatInfo[1], ThisStatInfo[2]

		-- Is this a stat header, or an actual stat?
		if StatName and StatName ~= "MetaSocketEffect" then
			-- This is a stat name.  Is this stat present in the scale AND one of the items?
			local StatValue = ThisScaleValues[StatName]
			local Stats1, Stats2 = CurrentItemStats1[StatName], CurrentItemStats2[StatName]
			if StatValue and StatValue > PawnIgnoreStatValue and (Stats1 or Stats2) then
				-- We should show this stat.  Do we need to add a header first?
				if LastFoundHeader then
					PawnUI_AddComparisonHeaderLine(LastFoundHeader)
					LastFoundHeader = nil
				end
				-- Now, add the stat line.
				local StatNameAndValue = Title .. " @ " .. format("%g", StatValue)
				PawnUI_AddComparisonStatLineNumbers(StatNameAndValue, Stats1, Stats2)
			end
		else
			-- This is a header; remember it.
			LastFoundHeader = Title
		end
	end

	-- Add gem and socket information.
	LastFoundHeader = PawnLocal.UI.CompareSocketsHeader

	local AddSockets = function(Stat, FriendlyName)
		local HasSockets1 = Item1.UnenchantedStats[Stat]
		local HasSockets2 = Item2.UnenchantedStats[Stat]
		if not HasSockets1 or HasSockets1 <= 0 then HasSockets1 = nil end
		if not HasSockets2 or HasSockets2 <= 0 then HasSockets2 = nil end
		if HasSockets1 or HasSockets2 then
			if LastFoundHeader then
				PawnUI_AddComparisonHeaderLine(LastFoundHeader)
				LastFoundHeader = nil
			end
			PawnUI_AddComparisonStatLineNumbers(FriendlyName, HasSockets1, HasSockets2, false) -- hide differential
		end
	end

	AddSockets("PrismaticSocket", PawnLocal.UI.CompareColoredSockets)
	AddSockets("RedSocket", RED_GEM)
	AddSockets("YellowSocket", YELLOW_GEM)
	AddSockets("BlueSocket", BLUE_GEM)
	AddSockets("MetaSocket", META_GEM)

	local _, TotalSocketValue1, SocketBonusValue1 = PawnGetItemValue(ItemStats1, Item1.Level, ItemSocketBonusStats1, PawnUICurrentScale, false, true)
	local _, TotalSocketValue2, SocketBonusValue2 = PawnGetItemValue(ItemStats2, Item2.Level, ItemSocketBonusStats2, PawnUICurrentScale, false, true)
	if TotalSocketValue1 and SocketBonusValue1 then TotalSocketValue1 = TotalSocketValue1 - SocketBonusValue1 end -- socket bonus is already included in total socket value
	if TotalSocketValue2 and SocketBonusValue2 then TotalSocketValue2 = TotalSocketValue2 - SocketBonusValue2 end

	if not TotalSocketValue1 or TotalSocketValue1 <= 0 then TotalSocketValue1 = nil end
	if not TotalSocketValue2 or TotalSocketValue2 <= 0 then TotalSocketValue2 = nil end
	if TotalSocketValue1 or TotalSocketValue2 then
		if LastFoundHeader then
			PawnUI_AddComparisonHeaderLine(LastFoundHeader)
			LastFoundHeader = nil
		end
		PawnUI_AddComparisonStatLineNumbers(PawnLocal.UI.CompareGemTotalValue, TotalSocketValue1, TotalSocketValue2, false) -- hide differential
	end
	if not SocketBonusValue1 or SocketBonusValue1 <= 0 then SocketBonusValue1 = nil end
	if not SocketBonusValue2 or SocketBonusValue2 <= 0 then SocketBonusValue2 = nil end
	if SocketBonusValue1 or SocketBonusValue2 then
		if LastFoundHeader then
			PawnUI_AddComparisonHeaderLine(LastFoundHeader)
			LastFoundHeader = nil
		end
		PawnUI_AddComparisonStatLineNumbers(PawnLocal.UI.CompareSocketBonus, SocketBonusValue1, SocketBonusValue2, false) -- hide differential
	end

	-- Everything else below this point goes under an "Other" header.
	LastFoundHeader = PawnLocal.UI.CompareOtherHeader

	-- Add item level information if the user normally has item levels visible.
	-- Note that for upgradeable items, this won't be the upgradeable level of the item—the GetItemInfo API doesn't return the
	-- correct item level for upgraded items.  We don't use the item level for anything important, so that'll just be a known limitation for now.
	local Level1, Level2 = Item1.Level, Item2.Level
	if not Level1 or Level1 <= 1 then Level1 = nil end
	if not Level2 or Level2 <= 1 then Level2 = nil end
	if (Level1 and Level1 > 0) or (Level2 and Level2 > 0) then
		if LastFoundHeader then
			PawnUI_AddComparisonHeaderLine(LastFoundHeader)
			LastFoundHeader = nil
		end
		PawnUI_AddComparisonStatLineNumbers(PawnLocal.ItemLevelTooltipLine, Level1, Level2, false) -- hide differential
	end

	-- Add asterisk indicator.
	local Asterisk1, Asterisk2
	if Item1.UnknownLines then Asterisk1 = YES end
	if Item2.UnknownLines then Asterisk2 = YES end
	if Asterisk1 or Asterisk2 then
		if LastFoundHeader then
			PawnUI_AddComparisonHeaderLine(LastFoundHeader)
			LastFoundHeader = nil
		end
		PawnUI_AddComparisonStatLineStrings(PawnLocal.UI.CompareSpecialEffects .. " " .. PawnDiamondTexture, Asterisk1, Asterisk2)
	end

	-- Update the scrolling stat area's height.
	PawnUI_RefreshCompareScrollFrame()

	-- Update the total item score row.
	local ValueFormat = "%." .. PawnCommon.Digits .. "f"
	local r, g, b = VgerCore.HexToRGB(PawnCommon.Scales[PawnUICurrentScale].Color)
	if not r then r, g, b = VgerCore.Color.BlueR, VgerCore.Color.BlueG, VgerCore.Color.BlueB end
	local _, Value1 = PawnGetSingleValueFromItem(Item1, PawnUICurrentScale)
	local _, Value2 = PawnGetSingleValueFromItem(Item2, PawnUICurrentScale)
	local Value1String, Value2String
	if Value1 then
		if Value1 >= 1000 then
			Value1String = VgerCore.FormatCompactDecimal(Value1)
		else
			Value1String = format(ValueFormat, Value1)
		end
	else
		Value1 = 0
	end
	if Value2 then
		if Value2 >= 1000 then
			Value2String = VgerCore.FormatCompactDecimal(Value2)
		else
			Value2String = format(ValueFormat, Value2)
		end
	else
		Value2 = 0
	end
	if Value1 > 0 then
		PawnUICompareItemScore1:SetText(Value1String)
		PawnUICompareItemScore1:SetVertexColor(r, g, b)
		if Value1 > Value2 and Value2 > 0 then
			PawnUICompareItemScoreDifference1:SetText("(+" .. VgerCore.FormatCompactDecimal(Value1 - Value2) .. ")")
			local Increase = (Value1 - Value2) / Value2
			if Increase < PawnBigUpgradeThreshold then
				PawnUICompareItemScorePercentDifference1:SetText(format("(+%s%%)", VgerCore.FormatInteger(Increase * 100)))
			end
			PawnUICompareItemScoreHighlight1:Show()
			PawnUICompareItemScoreArrow1:Show()
		end
	end
	if Value2 > 0 then
		PawnUICompareItemScore2:SetText(Value2String)
		PawnUICompareItemScore2:SetVertexColor(r, g, b)
		if Value2 > Value1 and Value1 > 0 then
			PawnUICompareItemScoreDifference2:SetText("(+" .. VgerCore.FormatCompactDecimal(Value2 - Value1) .. ")")
			local Increase = (Value2 - Value1) / Value1
			if Increase < PawnBigUpgradeThreshold then
				PawnUICompareItemScorePercentDifference2:SetText(format("(+%s%%)", VgerCore.FormatInteger(Increase * 100)))
			end
			PawnUICompareItemScoreHighlight2:Show()
			PawnUICompareItemScoreArrow2:Show()
		end
	end

	-- Hack for WoW Classic: after a moment, refresh the whole thing, because we might have gotten
	-- incomplete data from the tooltip the first time.
	if not IsAutomatedRefresh and (VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath) then
		local AutomatedRefresh = function()
			if PawnUIComparisonItems[1] then PawnUIComparisonItems[1] = PawnGetItemData(PawnUIComparisonItems[1].Link) end
			if PawnUIComparisonItems[2] then PawnUIComparisonItems[2] = PawnGetItemData(PawnUIComparisonItems[2].Link) end
			PawnUI_CompareItems(true)
		end
		C_Timer.After(0.5, AutomatedRefresh)
		C_Timer.After(1.0, AutomatedRefresh)
	end
end

-- Deletes all comparison stat and header lines.
function PawnUI_DeleteComparisonLines()
	for i = 1, PawnUITotalComparisonLines do
		local LineName = "PawnUICompareStatLine" .. i
		local Line = getglobal(LineName)
		if Line then Line:Hide() end
		setglobal(LineName, nil)
		setglobal(LineName .. "Name", nil)
		setglobal(LineName .. "Quantity1", nil)
		setglobal(LineName .. "Quantity2", nil)
		setglobal(LineName .. "Difference1", nil)
		setglobal(LineName .. "Difference2", nil)
	end
	PawnUITotalComparisonLines = 0
	PawnUI_RefreshCompareScrollFrame()
end

-- Adds a stat line to the comparison stat area, passing in the strings to use.
function PawnUI_AddComparisonStatLineStrings(StatNameAndValue, Quantity1, Quantity2, Difference1, Difference2)
	local Line, LineName = PawnUI_AddComparisonLineCore("PawnUICompareStatLineTemplate")
	getglobal(LineName .. "Name"):SetText(StatNameAndValue)
	getglobal(LineName .. "Quantity1"):SetText(Quantity1)
	getglobal(LineName .. "Quantity2"):SetText(Quantity2)
	getglobal(LineName .. "Difference1"):SetText(Difference1)
	getglobal(LineName .. "Difference2"):SetText(Difference2)
	Line:Show()
end

-- Adds a stat line to the comparison stat area, passing in the numbers to use.  It is acceptable to use nil for either or both
-- of the numbers.  Differences are calculated automatically.
function PawnUI_AddComparisonStatLineNumbers(StatNameAndValue, Quantity1, Quantity2, ShowDifference)
	if ShowDifference == nil then ShowDifference = true end -- default value

	local QuantityString1 = VgerCore.FormatCompactDecimal(Quantity1)
	local QuantityString2 = VgerCore.FormatCompactDecimal(Quantity2)
	local Difference1, Difference2
	if not Quantity1 then Quantity1 = 0 end
	if not Quantity2 then Quantity2 = 0 end
	if ShowDifference then
		if Quantity1 > Quantity2 then
			Difference1 = "(+" .. VgerCore.FormatCompactDecimal(Quantity1 - Quantity2) .. ")"
		elseif Quantity2 > Quantity1 then
			Difference2 = "(+" .. VgerCore.FormatCompactDecimal(Quantity2 - Quantity1) .. ")"
		end
	end

	PawnUI_AddComparisonStatLineStrings(StatNameAndValue, QuantityString1, QuantityString2, Difference1, Difference2)
end

-- Adds a header line to the comparison stat area.
function PawnUI_AddComparisonHeaderLine(HeaderText)
	local Line, LineName = PawnUI_AddComparisonLineCore("PawnUICompareStatLineHeaderTemplate")
	local HeaderLabel = getglobal(LineName .. "Name")
	HeaderLabel:SetText(HeaderText)
	Line:Show()
end

-- Adds a line to the comparison stat area.
-- Arguments: Template
--	Template: The XML UI template to use when creating the new line.
-- Returns: Line, LineName
--	Line: A reference to the newly added line.
--	LineName: The string name of the newly added line.
function PawnUI_AddComparisonLineCore(Template)
	PawnUITotalComparisonLines = PawnUITotalComparisonLines + 1
	local LineName = "PawnUICompareStatLine" .. PawnUITotalComparisonLines
	local Line = CreateFrame("Frame", LineName, PawnUICompareScrollContent, Template)
	Line:SetPoint("TOPLEFT", PawnUICompareScrollContent, "TOPLEFT", 0, -PawnUIComparisonLineHeight * (PawnUITotalComparisonLines - 1))
	return Line, LineName
end

-- Updates the height of the comparison stat list scroll area's inner frame.  Call this after adding or removing a block of
-- comparison lines to ensure that the scroll area is correct.
function PawnUI_RefreshCompareScrollFrame()
	PawnUICompareScrollContent:SetHeight(PawnUIComparisonLineHeight * PawnUITotalComparisonLines + PawnUIComparisonAreaPaddingBottom)
	if PawnUITotalComparisonLines > 0 then
		PawnUICompareMissingItemInfoFrame:Hide()
		PawnUICompareScrollFrame:Show()
	else
		PawnUICompareScrollFrame:Hide()
		PawnUICompareMissingItemInfoFrame:Show()
	end
end

-- Links an item in chat.
function PawnUILinkItemInChat(Item)
	if not Item then return end
	local EditBox = DEFAULT_CHAT_FRAME.editBox
	if EditBox then
		if not EditBox:IsShown() then
			EditBox:SetText("")
			EditBox:Show()
		end
		EditBox:Insert(Item.Link)
	else
		VgerCore.Fail("Can't insert item link into chat because the edit box was not found.")
	end
end

-- Gets all of the text from an item tooltip and then puts it into a box where it can be copied.
function PawnUIGetAllTextForItem(Item)
	if not Item then return end
	local ItemLink
	if type(Item) == "table" then
		if Item.Link then
			ItemLink = Item.Link
		else
			return
		end
	elseif type(Item) == "string" then
		ItemLink = Item
		PawnGetItemData(ItemLink) -- Not actually used, but call this here so we can use /pawn debug.
		Item = nil
	end
	local Tooltip = _G[PawnPrivateTooltipName]
	VgerCore.Assert(Tooltip, "Failed to find the private tooltip.")

	Tooltip:ClearLines()
	Tooltip:SetHyperlink(ItemLink)

	local NumLines = Tooltip:NumLines()
	local i
	local AllText = ""
	for i = 1, NumLines do
		local LeftLine = _G[PawnPrivateTooltipName .. "TextLeft" .. i]
		AllText = AllText .. LeftLine:GetText() .. "\n"
		local RightLine = _G[PawnPrivateTooltipName .. "TextRight" .. i]
		if RightLine then
			local RightText = RightLine:GetText()
			if RightText and RightText ~= "" then
				AllText = AllText .. "    " .. RightText .. "\n"
			end
		end
	end
	AllText = AllText .. "\n/pawn compare " .. PawnGetItemIDsForDisplay(ItemLink, false)

	local ItemName
	if Item then
		ItemName = Item.Name
	else
		ItemName = (_G[PawnPrivateTooltipName .. "TextLeft1"]):GetText()
	end
	PawnUIShowCopyableString(ItemName, AllText, nil, true)

	-- Tip: If this doesn't work for your particular situation, you can also open an item link and then do this:
	-- /script PawnUIShowCopyableString("", ItemRefTooltipTextLeft8:GetText(), nil, true)
	-- (where "8" is the line of the tooltip that you want to extract)
end

-- Called when one of the two upper item slots are clicked.
function PawnUICompareItemIcon_OnClick(Index)
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)

	-- Are they shift-clicking it to insert the item into chat?
	if IsModifiedClick("CHATLINK") then
		PawnUILinkItemInChat(PawnUIComparisonItems[Index])
		return
	end

	-- Are they dropping an item from their inventory?
	local InfoType, Info1, Info2 = GetCursorInfo()
	if InfoType == "item" then
		ClearCursor()
		PawnUI_SetCompareItem(Index, Info2)
		if Index == 2 then PawnUI_AutoCompare() end
		return
	end

	-- Are they dropping an item from a merchant's inventory?
	if InfoType == "merchant" then
		ClearCursor()
		local ItemLink = GetMerchantItemLink(Info1)
		if not ItemLink then return end
		PawnUI_SetCompareItem(Index, ItemLink)
		if Index == 2 then PawnUI_AutoCompare() end
		return
	end

	-- Are they holding down Alt to copy and paste text from the item?
	if PawnUIComparisonItems[Index] and IsAltKeyDown() then
		PawnUIGetAllTextForItem(PawnUIComparisonItems[Index])
		return
	end

end

-- Shows the tooltip for an item comparison slot.
function PawnUICompareItemIcon_TooltipOn(Index)
	-- Is there an item set for this slot?
	local Item = PawnUIComparisonItems[Index]
	if Item then
		if Index == 1 then
			GameTooltip:SetOwner(PawnUICompareItemIcon1, "ANCHOR_BOTTOMLEFT")
		elseif Index == 2 then
			GameTooltip:SetOwner(PawnUICompareItemIcon2, "ANCHOR_BOTTOMRIGHT")
		end
		GameTooltip:SetHyperlink(Item.Link)
	end
end

-- Hides the tooltip for an item comparison slot.
function PawnUICompareItemIcon_TooltipOff()
	GameTooltip:Hide()
end

-- Sets the left item to the item depicted in the "currently equipped" shortcut button.
function PawnUICompareItemShortcut_OnClick(self, Button)
	PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
	local ShortcutIndex = self:GetID()

	-- Are they shift-clicking it to insert the item into chat?
	if IsModifiedClick("CHATLINK") then
		PawnUILinkItemInChat(PawnUIShortcutItems[ShortcutIndex])
		return
	end

	-- Nope; they want to set the compare item.
	local Index = 1
	if Button == "RightButton" then Index = 2 end
	PawnUI_SetCompareItem(Index, PawnUIShortcutItems[ShortcutIndex])
end

-- Shows the tooltip for the shortcut button.
function PawnUICompareItemShortcut_TooltipOn(self)
	local ShortcutIndex = self:GetID()
	local Item = PawnUIShortcutItems[ShortcutIndex]
	if Item then
		GameTooltip:SetOwner(getglobal("PawnUICompareItemShortcut" .. ShortcutIndex), "ANCHOR_TOPLEFT")
		GameTooltip:SetHyperlink(PawnUnenchantItemLink(Item.Link, true))
	end
end

-- Hides the tooltip for the shortcut button.
function PawnUICompareItemShortcut_TooltipOff()
	GameTooltip:Hide()
end

------------------------------------------------------------
-- Gems tab
------------------------------------------------------------

function PawnUI_InitGemsTab()
	-- Each time the gems tab is shown, immediately refresh its contents.
	PawnUI_ShowBestGems()
end

-- Changes the current gem quality level.  Set to nil to reset to showing the best gems overall regardless of item level.
function PawnUI_SetGemQualityLevel(GemQualityLevel)
	if GemQualityLevel then
		PawnUIFrame_GemQualityLevelBox:SetText(GemQualityLevel)
	else
		PawnUIFrame_BestGemsRadio_Click()
	end
end

function PawnUI_ShowBestGems()
	-- Always clear out the existing gems, no matter what happens next.
	PawnUI_DeleteGemLines()
	-- If no scale is selected, we can't show a gem list.  (This is a valid case!)
	if not PawnUICurrentScale or PawnUICurrentScale == PawnLocal.NoScale then return end

	-- Update the gem list for this scale.
	if not PawnScaleBestGems[PawnUICurrentScale] then
		VgerCore.Fail("Failed to build a gem list because no best-gem data was available for this scale.")
		return
	end

	local ShownGems = false
	local _

	local GemQualityLevel = PawnGetGemQualityForItem(PawnGemQualityLevels, PawnUIGemQualityLevel)

	if not VgerCore.IsClassic and not VgerCore.IsMainline then
		-- Burning Crusade Classic and Wrath Classic: Divide by color
		if #(PawnScaleBestGems[PawnUICurrentScale].RedSocket[GemQualityLevel]) > 0 then
			PawnUI_AddGemHeaderLine(format(PawnLocal.UI.GemsColorHeader, RED_GEM))
			for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].RedSocket[GemQualityLevel]) do
				PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
			end
			ShownGems = true
		end
		if #(PawnScaleBestGems[PawnUICurrentScale].YellowSocket[GemQualityLevel]) > 0 then
			PawnUI_AddGemHeaderLine(format(PawnLocal.UI.GemsColorHeader, YELLOW_GEM))
			for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].YellowSocket[GemQualityLevel]) do
				PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
			end
			ShownGems = true
		end
		if #(PawnScaleBestGems[PawnUICurrentScale].BlueSocket[GemQualityLevel]) > 0 then
			PawnUI_AddGemHeaderLine(format(PawnLocal.UI.GemsColorHeader, BLUE_GEM))
			for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].BlueSocket[GemQualityLevel]) do
				PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
			end
			ShownGems = true
		end
	else
		-- Non-Classic WoW: All sockets are prismatic
		if #(PawnScaleBestGems[PawnUICurrentScale].PrismaticSocket[GemQualityLevel]) > 0 then
			for _, GemData in pairs(PawnScaleBestGems[PawnUICurrentScale].PrismaticSocket[GemQualityLevel]) do
				PawnUI_AddGemLine(GemData.Name, GemData.Texture, GemData.ID)
			end
			ShownGems = true
		end
	end

	if not ShownGems then
		PawnUI_AddGemHeaderLine(PawnLocal.UI.GemsNoneFound)
	end

	PawnUI_RefreshGemScrollFrame()
end

function PawnUIFrame_BestGemsRadio_Click()
	PawnUIFrame_BestGemsRadio:SetChecked(true)
	PawnUIFrame_GemsForItemLevelRadio:SetChecked(false)
	PawnUIFrame_GemQualityLevelBox:ClearFocus()
	PawnUIGemQualityLevel = nil
	PawnUI_ShowBestGems()
end

function PawnUIFrame_GemsForItemLevelRadio_Click()
	PawnUIFrame_GemQualityLevelBox_OnTextChanged()
	PawnUIFrame_BestGemsRadio:SetChecked(false)
	PawnUIFrame_GemsForItemLevelRadio:SetChecked(true)
end

function PawnUIFrame_GemQualityLevelBox_OnTextChanged()
	PawnUIGemQualityLevel = tonumber(PawnUIFrame_GemQualityLevelBox:GetText())
	if PawnUIGemQualityLevel then
		-- If the user just starts typing in the quality level box, automatically select the proper option.
		PawnUIFrame_BestGemsRadio:SetChecked(false)
		PawnUIFrame_GemsForItemLevelRadio:SetChecked(true)
	else
		PawnUIFrame_BestGemsRadio:SetChecked(true)
		PawnUIFrame_GemsForItemLevelRadio:SetChecked(false)
	end
	PawnUI_ShowBestGems()
end

-- Deletes all gem lines.
function PawnUI_DeleteGemLines()
	for i = 1, PawnUITotalGemLines do
		local LineName = "PawnUIGemLine" .. i
		local Line = getglobal(LineName)
		if Line then Line:Hide() end
		setglobal(LineName, nil)
		setglobal(LineName .. "Icon", nil)
		setglobal(LineName .. "Name", nil)
		setglobal(LineName .. "Highlight", nil)
	end
	PawnUITotalGemLines = 0
	PawnUI_RefreshGemScrollFrame()
end

-- Adds a gem line to the gem list area, passing in the string and icon to use.
function PawnUI_AddGemLine(GemName, Icon, ItemID)
	local Line, LineName = PawnUI_AddGemLineCore("PawnUIGemLineTemplate")
	Line:SetID(ItemID)

	-- Prefer data from the Pawn cache if available.  It's more up-to-date if the user
	-- has hovered over anything.
	local Item = PawnGetItemData("item:" .. ItemID)
	if Item and Item.Name then
		GemName = Item.Name
		Icon = Item.Texture
	end

	getglobal(LineName .. "Name"):SetText(GemName)
	getglobal(LineName .. "Icon"):SetTexture(Icon)
	Line:Show()
end

-- Adds a header to the gem list area.
function PawnUI_AddGemHeaderLine(Text)
	local Line, LineName = PawnUI_AddGemLineCore("PawnUIGemHeaderLineTemplate")
	getglobal(LineName .. "Name"):SetText(Text)
	Line:Show()
end

-- Adds a line to the gem list area.
-- Arguments: Template
--	Template: The XML UI template to use when creating the new line.
-- Returns: Line, LineName
--	Line: A reference to the newly added line.
--	LineName: The string name of the newly added line.
function PawnUI_AddGemLineCore(Template)
	PawnUITotalGemLines = PawnUITotalGemLines + 1
	local LineName = "PawnUIGemLine" .. PawnUITotalGemLines
	local Line = CreateFrame("Button", LineName, PawnUIGemScrollContent, Template)
	Line:SetPoint("TOPLEFT", PawnUIGemScrollContent, "TOPLEFT", 0, -PawnUIGemLineHeight * (PawnUITotalGemLines - 1))
	return Line, LineName
end

-- Updates the height of the gem list scroll area's inner frame.  Call this after adding or removing a block of
-- gem lines to ensure that the scroll area is correct.
function PawnUI_RefreshGemScrollFrame()
	PawnUIGemScrollContent:SetHeight(PawnUIGemLineHeight * PawnUITotalGemLines + PawnUIGemAreaPaddingBottom)
end

-- Raised when the user hovers over a gem in the Gems tab.
function PawnUIFrame_GemList_OnEnter(self)
	GameTooltip:SetOwner(self, "ANCHOR_LEFT")
	GameTooltip:SetHyperlink("item:" .. self:GetID())
	PawnUIFrame_GemList_UpdateInfo(self)
end

-- Raised when the user stops hovering over a gem in the Gems tab.
function PawnUIFrame_GemList_OnLeave(self)
	GameTooltip:Hide()
	PawnUIFrame_GemList_UpdateInfo(self)
end

-- Updates the name and icon for a gem in the gem list if necessary.
function PawnUIFrame_GemList_UpdateInfo(self)
	-- If Icon already has a texture set, then we already have item information, so skip this.
	local Icon = getglobal(tostring(self:GetName()) .. "Icon")
	if Icon and not Icon:GetTexture() then
		local Label = getglobal(tostring(self:GetName()) .. "Name")
		local Item = PawnGetItemData("item:" .. self:GetID())
		if Item and PawnRefreshCachedItem(Item) then
			Label:SetText(Item.Name)
			Icon:SetTexture(Item.Texture)
		end
	end
end

-- Raised when the user clicks a gem in the Gems tab.
function PawnUIFrame_GemList_OnClick(self)
	-- Are they shift-clicking it to insert the item into chat?
	if IsModifiedClick("CHATLINK") then
		PawnUILinkItemInChat(PawnGetItemData("item:" .. tostring(self:GetID())))
		return
	end
end

------------------------------------------------------------
-- Options tab
------------------------------------------------------------

-- When the Options tab is first shown, set the values of all of the controls based on the user's settings.
function PawnUIOptionsTabPage_OnShow()
	-- Tooltip options
	PawnUIFrame_ShowItemIDsCheck:SetChecked(PawnCommon.ShowItemID)
	PawnUIFrame_ShowIconsCheck:SetChecked(PawnCommon.ShowTooltipIcons)
	PawnUIFrame_ShowSpecIconsCheck:SetChecked(PawnCommon.ShowSpecIcons)
	PawnUIFrame_AlignRightCheck:SetChecked(PawnCommon.AlignNumbersRight)
	PawnUIFrame_TooltipUpgradeList_UpdateSelection()
	PawnUIFrame_ColorTooltipBorderCheck:SetChecked(PawnCommon.ColorTooltipBorder)
	PawnUIFrame_EnchantedValuesCheck:SetChecked(PawnCommon.ShowEnchanted)

	-- Upgrade options
	PawnUIFrame_IgnoreGemsWhileLevelingCheck:SetChecked(PawnCommon.IgnoreGemsWhileLeveling)
	PawnUIFrame_UpgradeTrackingList_UpdateSelection()

	-- Advisor options
	if not VgerCore.IsMainline then
		-- The bag upgrade advisor isn't supported on Classic.
		PawnUIFrame_ShowBagUpgradeAdvisorCheck:Hide()
	else
		PawnUIFrame_ShowBagUpgradeAdvisorCheck:SetChecked(PawnCommon.ShowBagUpgradeAdvisor)
	end
	PawnUIFrame_ShowLootUpgradeAdvisorCheck:SetChecked(PawnCommon.ShowLootUpgradeAdvisor)
	PawnUIFrame_ShowQuestUpgradeAdvisorCheck:SetChecked(PawnCommon.ShowQuestUpgradeAdvisor)
	PawnUIFrame_ShowSocketingAdvisorCheck:SetChecked(PawnCommon.ShowSocketingAdvisor)
	PawnUIFrame_ShowItemLevelUpgradesCheck:SetChecked(PawnCommon.ShowItemLevelUpgrades)

	-- Other options
	PawnUIFrame_DebugCheck:SetChecked(PawnCommon.Debug)
	PawnUIFrame_ButtonPositionList_UpdateSelection()
end

function PawnUIFrame_ShowItemIDsCheck_OnClick()
	PawnCommon.ShowItemID = PawnUIFrame_ShowItemIDsCheck:GetChecked()
	PawnResetTooltips()
end

function PawnUIFrame_ShowIconsCheck_OnClick()
	PawnCommon.ShowTooltipIcons = PawnUIFrame_ShowIconsCheck:GetChecked()
	PawnToggleTooltipIcons()
end

function PawnUIFrame_ShowSpecIconsCheck_OnClick()
	PawnCommon.ShowSpecIcons = PawnUIFrame_ShowSpecIconsCheck:GetChecked()
	PawnResetTooltips()
end

function PawnUIFrame_AlignRightCheck_OnClick()
	PawnCommon.AlignNumbersRight = PawnUIFrame_AlignRightCheck:GetChecked()
	PawnResetTooltips()
end

function PawnUIFrame_TooltipUpgradeList_SetSelection(ShowUpgrades, ShowUpgradesOnly)
	PawnCommon.ShowUpgradesOnTooltips = ShowUpgrades
	PawnCommon.ShowValuesForUpgradesOnly = ShowUpgradesOnly
	PawnUIFrame_TooltipUpgradeList_UpdateSelection()
	PawnResetTooltips()
end

function PawnUIFrame_TooltipUpgradeList_UpdateSelection()
	PawnUIFrame_TooltipUpgradeOnRadio:SetChecked(PawnCommon.ShowUpgradesOnTooltips and not PawnCommon.ShowValuesForUpgradesOnly)
	PawnUIFrame_TooltipUpgradeOnUpgradesOnlyRadio:SetChecked(PawnCommon.ShowUpgradesOnTooltips and PawnCommon.ShowValuesForUpgradesOnly)
	PawnUIFrame_TooltipUpgradeOffRadio:SetChecked(not PawnCommon.ShowUpgradesOnTooltips)
end

function PawnUIFrame_UpgradeTrackingList_SetSelection(Enabled)
	PawnSetUpgradeTracking(Enabled)
	PawnUIFrame_UpgradeTrackingList_UpdateSelection()
end

function PawnUIFrame_UpgradeTrackingList_UpdateSelection()
	local IsOptionAvailable = not PawnOptions.AutoSelectScales

	PawnUIFrame_UpgradeTrackingOffRadio:SetChecked(not PawnOptions.UpgradeTracking)
	PawnUIFrame_UpgradeTrackingOnRadio:SetChecked(PawnOptions.UpgradeTracking)

	PawnUIFrame_UpgradeTrackingHeaderLabel:SetShown(IsOptionAvailable)
	PawnUIFrame_UpgradeTrackingOffRadio:SetShown(IsOptionAvailable)
	PawnUIFrame_UpgradeTrackingOnRadio:SetShown(IsOptionAvailable)
end

function PawnUIFrame_ColorTooltipBorderCheck_OnClick()
	PawnCommon.ColorTooltipBorder = PawnUIFrame_ColorTooltipBorderCheck:GetChecked()
	PawnResetTooltips()
end

function PawnUIFrame_EnchantedValuesCheck_OnClick()
	PawnCommon.ShowEnchanted = PawnUIFrame_EnchantedValuesCheck:GetChecked()
	PawnResetTooltips()
end

function PawnUIFrame_ShowBagUpgradeAdvisorCheck_OnClick()
	PawnCommon.ShowBagUpgradeAdvisor = PawnUIFrame_ShowBagUpgradeAdvisorCheck:GetChecked()

	-- When toggling this option, refresh all bags.
	local BagIndex
	for BagIndex = 1, NUM_CONTAINER_FRAMES, 1 do
		local BagFrame = _G["ContainerFrame" .. BagIndex];
		if BagFrame:IsShown() then
			if BagFrame.UpdateItemUpgradeIcons then
				-- Dragonflight onward
				BagFrame:UpdateItemUpgradeIcons()
			else
				-- Legion through Shadowlands
				ContainerFrame_UpdateItemUpgradeIcons(BagFrame)
			end
		end
	end
end

function PawnUIFrame_ShowLootUpgradeAdvisorCheck_OnClick()
	PawnCommon.ShowLootUpgradeAdvisor = PawnUIFrame_ShowLootUpgradeAdvisorCheck:GetChecked()
	if LootHistoryFrame then LootHistoryFrame_FullUpdate(LootHistoryFrame) end
end

function PawnUIFrame_ShowQuestUpgradeAdvisorCheck_OnClick()
	PawnCommon.ShowQuestUpgradeAdvisor = PawnUIFrame_ShowQuestUpgradeAdvisorCheck:GetChecked()
end

function PawnUIFrame_ShowSocketingAdvisorCheck_OnClick()
	PawnCommon.ShowSocketingAdvisor = PawnUIFrame_ShowSocketingAdvisorCheck:GetChecked()
end

function PawnUIFrame_ShowItemLevelUpgradesCheck_OnClick()
	PawnCommon.ShowItemLevelUpgrades = PawnUIFrame_ShowItemLevelUpgradesCheck:GetChecked()
end

function PawnUIFrame_IgnoreGemsWhileLevelingCheck_OnClick()
	PawnCommon.IgnoreGemsWhileLeveling = PawnUIFrame_IgnoreGemsWhileLevelingCheck:GetChecked()
	PawnClearCache()
	PawnInvalidateBestItems()
	PawnResetTooltips()
end

function PawnUIFrame_ResetUpgradesButton_OnClick()
	PawnClearCache()
	PawnInvalidateBestItems()
	PawnResetTooltips()
	PawnClearBestItemLevelData()
end

function PawnUIFrame_DebugCheck_OnClick()
	PawnCommon.Debug = PawnUIFrame_DebugCheck:GetChecked()
	PawnResetTooltips()
end

function PawnUIFrame_ButtonPositionList_SetSelection(Value)
	PawnCommon.ButtonPosition = Value
	PawnUIFrame_ButtonPositionList_UpdateSelection()
	PawnUI_InventoryPawnButton_Move()
end

function PawnUIFrame_ButtonPositionList_UpdateSelection()
	PawnUIFrame_ButtonRightRadio:SetChecked(PawnCommon.ButtonPosition == PawnButtonPositionRight)
	PawnUIFrame_ButtonLeftRadio:SetChecked(PawnCommon.ButtonPosition == PawnButtonPositionLeft)
	PawnUIFrame_ButtonOffRadio:SetChecked(PawnCommon.ButtonPosition == PawnButtonPositionHidden)
end

------------------------------------------------------------
-- About tab methods
------------------------------------------------------------

function PawnUIAboutTabPage_OnShow()
	local Version = GetAddOnMetadata("Pawn", "Version")
	if Version then
		PawnUIFrame_AboutVersionLabel:SetText(format(PawnUIFrame_AboutVersionLabel_Text, Version))
	end
	if not VgerCore.IsMainline then
		-- WoW Classic doesn't use the Mr. Robot scales, so hide that logo and information.
		PawnUIFrame_MrRobotLogo:Hide()
		PawnUIFrame_MrRobotLabel:SetPoint("TOPLEFT", 25, -210)
		PawnUIFrame_MrRobotLabel:SetText("Special thanks to HawsJon for collecting the stat weights used in the starter scales.")
	end
end

------------------------------------------------------------
-- Socketing Advisor
------------------------------------------------------------

function PawnUI_OnSocketUpdate()
	if PawnSocketingTooltip then PawnSocketingTooltip:Hide() end
	if not PawnCommon.ShowSocketingAdvisor then return end

	-- Find out what item it is.
	local _, ItemLink = ItemSocketingDescription:GetItem()
	if strfind(ItemLink, "item:167555") then
		-- Don't show an error message on Pocket-Sized Computation Device, which has three punch card sockets and no stats.
		return
	end
	local Item = PawnGetItemData(ItemLink)
	if not Item or not Item.Values then
		VgerCore.Fail("Failed to update the socketing UI because we didn't know what item was in it.")
		return
	end
	if not Item.UnenchantedStats then return end -- Can't do anything interesting if we couldn't get unenchanted item data

	local ItemStats = Item.UnenchantedStats
	local SocketCount = 0
		+ (ItemStats.PrismaticSocket or 0)
		+ (ItemStats.RedSocket or 0)
		+ (ItemStats.YellowSocket or 0)
		+ (ItemStats.BlueSocket or 0)
	-- We intentionally ignore meta sockets, because meta gems should be selected for their non-stat effects.
	-- If there are no supported gems in the item, don't add our advisor tooltip to the window.
	if SocketCount == 0 then return end

	-- Add the annotation lines to the tooltip.
	CreateFrame("GameTooltip", "PawnSocketingTooltip", ItemSocketingFrame, "PawnUI_HintTooltip_PointsUp")
	PawnSocketingTooltip:SetOwner(ItemSocketingFrame, "ANCHOR_NONE")
	PawnSocketingTooltip:SetPoint("TOPLEFT", ItemSocketingFrame, "BOTTOMLEFT", 6, -6)
	local ShouldIncludeSockets = (not PawnCommon.IgnoreGemsWhileLeveling) or (Item.Level ~= nil and Item.Level >= PawnMinimumItemLevelToConsiderGems)
	PawnSocketingTooltip:SetText(PawnLocal.UI.SocketingAdvisorHeader, 1, 1, 1)
	if not ShouldIncludeSockets then
		PawnSocketingTooltip:AddLine(PawnLocal.UI.SocketingAdvisorIgnoreThisItem, VgerCore.Color.BlueR, VgerCore.Color.BlueG, VgerCore.Color.BlueB)
	end

	for _, Entry in pairs(Item.Values) do
		local ScaleName = Entry[1]
		if PawnIsScaleVisible(ScaleName) then
			local Scale = PawnCommon.Scales[ScaleName]
			local TextColor = VgerCore.Color.Blue
			if Scale.Color and strlen(Scale.Color) == 6 then TextColor = "|cff" .. Scale.Color end

			local _, _, SocketBonusValue = PawnGetItemValue(Item.UnenchantedStats, Item.Level, Item.UnenchantedSocketBonusStats, ScaleName, false, true)
			local GemListString, IsVague
			if SocketBonusValue and SocketBonusValue > 0 then
				local ThisColorGemList
				if ItemStats.PrismaticSocket then
					ThisColorGemList = PawnGetGemListString(ScaleName, PawnOptions.AutoSelectScales, Item.Level, "Prismatic")
					if ItemStats.PrismaticSocket > 1 then ThisColorGemList = ItemStats.PrismaticSocket .. " " .. ThisColorGemList end
					if GemListString then GemListString = GemListString .. ", " .. ThisColorGemList else GemListString = ThisColorGemList end
				end
				if ItemStats.RedSocket then
					ThisColorGemList = PawnGetGemListString(ScaleName, PawnOptions.AutoSelectScales, Item.Level, "Red")
					if ItemStats.RedSocket > 1 then ThisColorGemList = ItemStats.RedSocket .. " " .. ThisColorGemList end
					if GemListString then GemListString = GemListString .. ", " .. ThisColorGemList else GemListString = ThisColorGemList end
				end
				if ItemStats.YellowSocket then
					ThisColorGemList = PawnGetGemListString(ScaleName, PawnOptions.AutoSelectScales, Item.Level, "Yellow")
					if ItemStats.YellowSocket > 1 then ThisColorGemList = ItemStats.YellowSocket .. " " .. ThisColorGemList end
					if GemListString then GemListString = GemListString .. ", " .. ThisColorGemList else GemListString = ThisColorGemList end
				end
				if ItemStats.BlueSocket then
					ThisColorGemList = PawnGetGemListString(ScaleName, PawnOptions.AutoSelectScales, Item.Level, "Blue")
					if ItemStats.BlueSocket > 1 then ThisColorGemList = ItemStats.BlueSocket .. " " .. ThisColorGemList end
					if GemListString then GemListString = GemListString .. ", " .. ThisColorGemList else GemListString = ThisColorGemList end
				end
			else
				GemListString, IsVague = PawnGetGemListString(ScaleName, PawnOptions.AutoSelectScales, Item.Level, "Prismatic")
				if IsVague then GemListString = PawnLocal.GemListMany end
			end
			if GemListString then
				if PawnOptions.AutoSelectScales then
					-- Use a simplified list when Automatic mode is enabled, since we don't need to list multiple scales.
					PawnSocketingTooltip:AddLine(GemListString, 1, 1, 1)
				else
					local TooltipText = TextColor .. PawnGetScaleLocalizedName(ScaleName) .. ":  |r" .. GemListString
					PawnSocketingTooltip:AddLine(TooltipText, 1, 1, 1)
				end
			end

		end
	end

	-- Show our annotations tooltip.
	PawnSocketingTooltip:Show()
end

------------------------------------------------------------
-- Loot Upgrade Advisor
------------------------------------------------------------

function PawnUI_LootUpgradeAdvisor_OnLoad(self)
	self:SetFrameLevel(self:GetParent():GetFrameLevel() + 8)

	self.arrow:SetSize(21, 53)
	self.arrow.arrow = _G[self.arrow:GetName() .. "Arrow"]
	self.arrow.glow = _G[self.arrow:GetName() .. "Glow"]
	self.arrow.arrow:SetAllPoints(true)
	self.arrow.glow:SetAllPoints(true)
	self.arrow.arrow:SetTexCoord(0.78515625, 0.58789063, 0.99218750, 0.58789063, 0.78515625, 0.54687500, 0.99218750, 0.54687500)
	self.arrow.glow:SetTexCoord(0.40625000, 0.82812500, 0.66015625, 0.82812500, 0.40625000, 0.77343750, 0.66015625, 0.77343750)
end

function PawnUI_GroupLootFrame_OnShow(self)
	local Index = self:GetID()
	local LootAdvisor = _G["PawnUI_LootUpgradeAdvisor" .. Index]
	if not PawnCommon.ShowLootUpgradeAdvisor then LootAdvisor:Hide() return end
	LootAdvisor.ItemLink = nil

	-- What item are they rolling for?
	local RollID = self.rollID
	local ItemLink = GetLootRollItemLink(RollID)
	LootAdvisor.ItemLink = ItemLink
	if not ItemLink then LootAdvisor:Hide() return end

	-- Is it an upgrade?
	local IsUpgrade = false
	if PawnCanItemHaveStats(ItemLink) then
		local Item = PawnGetItemData(ItemLink)
		if Item then
			local UpgradeInfo = PawnIsItemAnUpgrade(Item)
			if UpgradeInfo then
				-- It's an upgrade!  Decide how to display it.
				local NumUpgrades = #UpgradeInfo
				local ShowOldItems = (NumUpgrades == 1) -- If the item upgrades exactly one scale, show a detailed tooltip showing the item being replaced.
				local ShowScaleNames = (NumUpgrades <= 3) -- If the item upgrades two or three scales, show a less detailed tooltip showing the upgrade percentages.
				local UpgradeText
				if ShowScaleNames then
					UpgradeText = PawnLocal.LootUpgradeAdvisorHeader
					local ThisUpgradeData, _
					for _, ThisUpgradeData in pairs(UpgradeInfo) do
						local ScaleName = ThisUpgradeData.ScaleName
						if ScaleName then
							local SetAnnotation = ""
							if InvType == "INVTYPE_2HWEAPON" then
								SetAnnotation = PawnLocal.TooltipUpgradeFor2H
							elseif InvType == "INVTYPE_WEAPONMAINHAND" or InvType == "INVTYPE_WEAPON" or InvType == "INVTYPE_WEAPONOFFHAND" then
								SetAnnotation = PawnLocal.TooltipUpgradeFor1H
							end
							local ThisText
							if ThisUpgradeData.PercentUpgrade >= 100 then
								ThisText = format(PawnLocal.TooltipBigUpgradeAnnotation, format("|n%s%s:", PawnGetScaleColor(ScaleName), ThisUpgradeData.LocalizedScaleName), SetAnnotation)
							else
								ThisText = format(PawnLocal.TooltipUpgradeAnnotation, format("|n%s%s:", PawnGetScaleColor(ScaleName), ThisUpgradeData.LocalizedScaleName), ThisUpgradeData.PercentUpgrade * 100, SetAnnotation)
							end
							if ShowOldItems and ThisUpgradeData.ExistingItemLink then
								local ExistingItemName, _, Quality = GetItemInfo(ThisUpgradeData.ExistingItemLink)
								if ExistingItemName then
									-- It's possible (though rare) that the existing item isn't in the user's cache, so we can't get its quality color.  In that case, don't display it in the tooltip.
									local _, _, _, QualityColor =  GetItemQualityColor(Quality)
									ThisText = format(PawnLocal.TooltipVersusLine, ThisText, QualityColor, ExistingItemName)
								end
							end
							UpgradeText = UpgradeText .. ThisText
						end
					end
				else
					-- If the item upgrades more than three scales, show a generic tooltip.
					UpgradeText = format(PawnLocal.LootUpgradeAdvisorHeaderMany, NumUpgrades)
				end

				local ItemLevelIncrease = PawnIsItemAnItemLevelUpgrade(Item)
				if ItemLevelIncrease then
					UpgradeText = UpgradeText .. "|n" .. format(PawnLocal.TooltipRelicUpgradeAnnotation, PawnLocal.ItemLevelTooltipLine .. ":", ItemLevelIncrease, "")
				end

				LootAdvisor.text:SetText(UpgradeText)
				IsUpgrade = true
			end
		end
	elseif PawnCanItemBeArtifactUpgrade(ItemLink) then
		local UpgradeInfo = PawnGetRelicUpgradeInfo(ItemLink)
		if UpgradeInfo then
			local ArtifactName, ArtifactUpgradeInfo, UpgradeText
			for ArtifactName, ArtifactUpgradeInfo in pairs(UpgradeInfo) do
				if UpgradeText then UpgradeText = UpgradeText .. "\n" else UpgradeText = "" end
				UpgradeText = UpgradeText .. format(PawnLocal.TooltipRelicUpgradeAnnotation, tostring(ArtifactName) .. ":", ArtifactUpgradeInfo.ItemLevelIncrease, "")
			end
			LootAdvisor.text:SetText(UpgradeText)
			IsUpgrade = true
		end
	end

	if IsUpgrade then
		LootAdvisor:SetHeight(LootAdvisor.text:GetHeight() + 32)
		LootAdvisor:Show()
	else
		LootAdvisor:Hide()
	end

end

function PawnUI_LootUpgradeAdvisor_OnClick(self)
	if self.ItemLink then PawnUI_SetCompareItemAndShow(2, self.ItemLink) end
end

function PawnUI_LootHistoryFrame_UpdateItemFrame(self, ItemFrame, ...)
	-- Figure out what item we're rolling for.  It's possible that we won't have an item link or item data yet; if that's true
	-- then the loot roll window should get an update when the item information is available and this should thus be
	-- called again later.
	local RollID, ItemLink = C_LootHistory.GetItem(ItemFrame.itemIdx)
	if ItemLink == nil then return end

	-- Is this item an upgrade?
	local IsUpgrade = PawnCommon.ShowLootUpgradeAdvisor and PawnShouldItemLinkHaveUpgradeArrow(ItemLink, false, true)
	if IsUpgrade then
		-- If the arrow hasn't already been created, create it.
		if not ItemFrame.PawnLootAdvisorArrow then
			ItemFrame.PawnLootAdvisorArrow = ItemFrame:CreateTexture(nil, "OVERLAY", "PawnUI_LootAdvisorTexture")
			ItemFrame.PawnLootAdvisorArrow:SetTexCoord(0, .5, 0, .5)
		end
		ItemFrame.PawnLootAdvisorArrow:Show()
	else
		-- Hide the upgrade arrow if it's already there from a previous loot item.
		if ItemFrame.PawnLootAdvisorArrow then
			ItemFrame.PawnLootAdvisorArrow:Hide()
		end
	end
end

function PawnUI_LootWonAlertFrame_SetUp(self, ItemLink, ...)
	-- Hide the upgrade arrow if it's already there from a previous loot item.
	if self.PawnLootAdvisorArrow then
		self.PawnLootAdvisorArrow:Hide()
	end

	-- Is this item an upgrade?
	if ItemLink == nil then return end
	local IsUpgrade = PawnCommon.ShowLootUpgradeAdvisor and PawnShouldItemLinkHaveUpgradeArrow(ItemLink, false, true)

	if IsUpgrade then
		-- If the arrow hasn't already been created, create it.
		if not self.PawnLootAdvisorArrow then
			self.PawnLootAdvisorArrow = self:CreateTexture(nil, "OVERLAY", "PawnUI_LootWonAdvisorTexture")
			self.PawnLootAdvisorArrow:SetTexCoord(0, .5, 0, .5)
		end
		self.PawnLootAdvisorArrow:Show()
	end
end

------------------------------------------------------------
-- Quest Advisor
------------------------------------------------------------

-- When quest info is displayed, call other quest info hook functions as appropriate.
function PawnUI_OnQuestInfo_Display(template)
	if not PawnCommon or not PawnPlayerFullName then return end
	VgerCore.Assert(QuestInfoFrame, "QuestInfoFrame should exist by the time that PawnUI_OnQuestInfo_Display is called.")

	-- There are a variety of QUEST_TEMPLATE_* tables in QuestInfo.lua.  Instead of hooking QuestInfo_ShowRewards directly,
	-- wait until after QuestInfo_Display is finished, and then call our QuestInfo_ShowRewards hook if QuestInfo_ShowRewards
	-- was ever called.  (I don't remember why...)
	local i = 1
	while template.elements[i] do
		if template.elements[i] == QuestInfo_ShowRewards then PawnUI_OnQuestInfo_ShowRewards() return end
		i = i + 3
	end
end

-- When quest info is shown, annotate item rewards with upgrade and vendor icons.
function PawnUI_OnQuestInfo_ShowRewards()
	-- Before doing anything else, clear out our state from last time.
	local i
	for i = 1, MAX_NUM_ITEMS do
		local Overlay = PawnQuestAdvisorOverlays[i]
		if Overlay then Overlay:Hide() end
	end

	if not PawnCommon.ShowQuestUpgradeAdvisor then return end

	-- Now, get information about this quest.
	local QuestID
	if C_QuestLog.GetSelectedQuest then QuestID = C_QuestLog.GetSelectedQuest() end
	local IsInMap = WorldMapFrame:IsShown()
	local StaticRewards, RewardChoices
	local SetQuestRewardFunctionName, GetRewardInfoFunction, GetChoiceInfoFunction
	if QuestInfoFrame.questLog then
		StaticRewards = GetNumQuestLogRewards()
		-- Ignore this warning: it's incorrect; GetNumQuestLogChoices does indeed take two parameters.
		---@diagnostic disable-next-line: redundant-parameter
		RewardChoices = GetNumQuestLogChoices(QuestID, false)
		SetQuestRewardFunctionName = "SetQuestLogItem"
		GetRewardInfoFunction = GetQuestLogRewardInfo
		GetChoiceInfoFunction = GetQuestLogChoiceInfo
	else
		StaticRewards = GetNumQuestRewards()
		RewardChoices = GetNumQuestChoices()
		SetQuestRewardFunctionName = "SetQuestItem"
		GetRewardInfoFunction = function(Index) return GetQuestItemInfo("reward", Index) end
		GetChoiceInfoFunction = function(Index) return GetQuestItemInfo("choice", Index) end
	end
	-- BUG: In 7.0, sometimes when turning in a quest (the "else" case above), these numbers are still 0 by the time that this is called.  Calling GetNumQuest*() too early apparently prevents the reward from getting shown at all...?
	if StaticRewards + RewardChoices == 0 then return end
	if not QuestInfo_GetRewardButton(QuestInfoFrame.rewardsFrame, 1) then
		VgerCore.Fail("Failed to annotate quest info because we couldn't find the reward button.  (Is a quest log mod interfering with Pawn?)")
		return
	end

	-- Gather up all of the rewards for this quest.
	local QuestRewards = { }
	local Tooltip = _G[PawnPrivateTooltipName]
	for i = 1, StaticRewards do
		-- BUG: In 9.0, the "get the item link for a quest reward" functions return incorrect data for some Shadowlands quests, so
		-- we work around this by calling the "show this quest reward on a tooltip" method and then getting the item link from THAT, which is correct.
		Tooltip[SetQuestRewardFunctionName](Tooltip, "reward", i)
		local _, ItemLink = Tooltip:GetItem()
		local Item = PawnGetItemData(ItemLink)

		if Item then
			local _, _, _, _, Usable = GetRewardInfoFunction(i)
			tinsert(QuestRewards, { ["Item"] = Item, ["RewardType"] = "reward", ["Usable"] = Usable, ["Index"] = i + RewardChoices })
		else
			--VgerCore.Fail("Pawn can't display upgrade information because the server hasn't given us item stats for fixed rewards yet.")
			-- TODO: Queue this up and retry these calculations later...
			-- Important: Don't bail out if we didn't get stats for a static reward! You could, for example, get an item and a deprecated artifact power
			-- item with no stats, and we want to make sure that the item that DOES have stats still shows up.
		end
	end
	for i = 1, RewardChoices do
		Tooltip[SetQuestRewardFunctionName](Tooltip, "choice", i)
		local _, ItemLink = Tooltip:GetItem()
		local Item = PawnGetItemData(ItemLink)

		if Item then
			local _, _, _, _, Usable = GetChoiceInfoFunction(i)
			tinsert(QuestRewards, { ["Item"] = Item, ["RewardType"] = "choice", ["Usable"] = Usable, ["Index"] = i })
		else
			--VgerCore.Fail("Pawn can't display upgrade information because the server hasn't given us item stats for reward choices yet.")
			-- TODO: Queue this up and retry these calculations later...
			return
		end
	end

	-- Find the ones that are interesting (and should get an icon).
	PawnFindInterestingItems(QuestRewards)

	local Reward
	for _, Reward in pairs(QuestRewards) do
		local ItemButton = QuestInfo_GetRewardButton(QuestInfoFrame.rewardsFrame, Reward.Index)
		local TextureName
		if ItemButton then
			local Overlay = PawnQuestAdvisorOverlays[Reward.Index]
			if not Overlay then
				if IsInMap then
					Overlay = ItemButton:CreateTexture(nil, "OVERLAY", "PawnUI_QuestAdvisorTexture_Map")
				else
					Overlay = ItemButton:CreateTexture(nil, "OVERLAY", "PawnUI_QuestAdvisorTexture")
				end
				-- Mod compatibility: ElvUI
				Overlay:SetDrawLayer("OVERLAY", 7)

				PawnQuestAdvisorOverlays[Reward.Index] = Overlay
			end
			if Reward.Result == "upgrade" then
				Overlay:SetTexture("Interface\\AddOns\\Pawn\\Textures\\UpgradeArrowBig")
				Overlay:SetTexCoord(0, .5, 0, .5)
				Overlay:Show()
			elseif Reward.Result == "vendor" then
				Overlay:SetTexture("Interface\\AddOns\\Pawn\\Textures\\UpgradeArrowBig")
				Overlay:SetTexCoord(0, .5, .5, 1)
				Overlay:Show()
			elseif Reward.Result == "trinket" then -- trinkets or relics
				Overlay:SetTexture("Interface\\AddOns\\Pawn\\Textures\\UpgradeArrowBig")
				Overlay:SetTexCoord(.5, 1, .5, 1)
				Overlay:Show()
			end
		end
	end
end

------------------------------------------------------------
-- Interface Options
------------------------------------------------------------

function PawnInterfaceOptionsFrame_OnLoad()
	-- Register the Interface Options page.
	PawnInterfaceOptionsFrame.name = "Pawn"
	InterfaceOptions_AddCategory(PawnInterfaceOptionsFrame)
	-- Update the version display.
	local Version = GetAddOnMetadata("Pawn", "Version")
	if Version then
		PawnInterfaceOptionsFrame_AboutVersionLabel:SetText(format(PawnUIFrame_AboutVersionLabel_Text, Version))
	end
end

------------------------------------------------------------
-- Other Pawn UI methods
------------------------------------------------------------

-- Causes a Button to respond to both left and right clicks.
-- Usage: <OnLoad function="PawnUIRegisterRightClickOnLoad" />
function PawnUIRegisterRightClickOnLoad(self)
	self:RegisterForClicks("LeftButtonUp", "RightButtonUp")
end

-- Create the tab strip under the Pawn UI.
-- We need to do this in Lua because there's no tab template that exists in every version of the game.
function PawnUICreateTabs()
	local TabCount = #PawnUITabList
	local TabTemplate
	if VgerCore.IsDragonflight then
		TabTemplate = "PanelTabButtonTemplate"
	else
		TabTemplate = "CharacterFrameTabButtonTemplate"
	end

	local LastTab
	for i = 1, TabCount do
		local ThisTab = CreateFrame("Button", "PawnUIFrameTab" .. i, PawnUIFrame, TabTemplate, i)
		ThisTab:SetText(PawnUITabLabels[i])
		if i == 1 then
			ThisTab:SetPoint("LEFT", PawnUIFrame, "BOTTOMLEFT", 196, -8)
		else
			ThisTab:SetPoint("LEFT", LastTab, "RIGHT", -16, 0)
		end
		ThisTab:SetScript("OnClick", PawnUITab_OnClick)
		LastTab = ThisTab
	end

	PanelTemplates_SetNumTabs(PawnUIFrame, TabCount)
end

function PawnUITab_OnClick(self)
	local TabNumber = self:GetID()
	PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
	PawnUISwitchToTab(PawnUITabList[TabNumber])
end

-- Switches to a tab by its Page.
function PawnUISwitchToTab(Tab)
	local TabCount = #PawnUITabList
	if not Tab then
		VgerCore.Fail("You must specify a valid Pawn tab.")
		return
	end

	-- Loop through all tab frames, showing all but the current one.
	local TabNumber
	for i = 1, TabCount do
		local ThisTab = PawnUITabList[i]
		if ThisTab == Tab  then
			ThisTab:Show()
			TabNumber = i
		else
			ThisTab:Hide()
		end
	end
	VgerCore.Assert(TabNumber, "Oh noes, we couldn't find that tab.")
	local ReloadingSameTab = (TabNumber == PawnUICurrentTabNumber)
	PawnUICurrentTabNumber = TabNumber

	-- Show/hide the scale selector as appropriate.
	-- (This also gets called when turning Automatic mode on or off, so we need to still re-run this even
	-- if the tab doesn't change.)
	if PawnUIFrameNeedsScaleSelector[PawnUICurrentTabNumber] then
		if PawnOptions.AutoSelectScales then
			PawnUIScaleSelectorAuto:Show()
			PawnUIScaleSelector:Hide()
		else
			PawnUIScaleSelector:Show()
			PawnUIScaleSelectorAuto:Hide()
		end
	else
		PawnUIScaleSelector:Hide()
		PawnUIScaleSelectorAuto:Hide()
	end

	-- Then, update the header text.
	PawnUIUpdateHeader()

	-- If we're already on that tab, we don't need to do anything else.
	if ReloadingSameTab then return end

	-- Hide popup UI.
	PawnUIStringDialogSingleLine:Hide()
	PawnUIStringDialogMultiLine:Hide()
	ColorPickerFrame:Hide()

	-- Then, update the tabstrip itself.
	PanelTemplates_SetTab(PawnUIFrame, TabNumber)
end

function PawnUIUpdateHeader()
	if not PawnUIHeaders[PawnUICurrentTabNumber] then return end
	local ColoredName
	if PawnUICurrentScale and PawnUICurrentScale ~= PawnLocal.NoScale then
		ColoredName = PawnGetScaleColor(PawnUICurrentScale) .. PawnGetScaleLocalizedName(PawnUICurrentScale) .. "|r"
	else
		ColoredName = PawnLocal.NoScale
	end
	PawnUIHeader:SetText(format(PawnUIHeaders[PawnUICurrentTabNumber], ColoredName))
end

-- Switches to a tab and shows the Pawn UI if not already visible.
-- If Toggle is true, close the Pawn UI if it was already visible on that page.
function PawnUIShowTab(Tab, Toggle)
	if not PawnUIFrame:IsShown() then
		PawnUIShow()
		PawnUISwitchToTab(Tab)
	elseif not Tab:IsShown() then
		PlaySound(SOUNDKIT.IG_CHARACTER_INFO_TAB)
		PawnUISwitchToTab(Tab)
	else
		if Toggle then
			PawnUIShow()
		else
			PlaySound(SOUNDKIT.IG_MAINMENU_OPTION_CHECKBOX_ON)
		end
	end
end

-- Makes sure that all first-open initialization has been performed.
function PawnUI_EnsureLoaded()
	if not PawnUIOpenedYet then
		PawnUIOpenedYet = true
		PawnUIFrame_ScaleSelector_Refresh()
		PawnUIFrame_ShowScaleCheck_Label:SetText(format(PawnUIFrame_ShowScaleCheck_Label_Text, UnitName("player")))
		if VgerCore.IsClassic then
			-- WoW Classic Era doesn't have gems.
			PawnUIFrameTab4:Hide()
			PawnUIFrame_IgnoreGemsWhileLevelingCheck:Hide()
			PawnUIFrame_ShowSocketingAdvisorCheck:Hide()
		end
		if not VgerCore.HasSpecs then
			PawnUIFrame_ShowSpecIconsCheck:Hide()
		end
		if not PawnCommon then
			VgerCore.Fail("Pawn UI OnShow handler was called before PawnCommon was initialized.")
			PawnUISwitchToTab(PawnUIHelpTabPage)
		elseif not PawnCommon.ShownGettingStarted then
			PawnCommon.ShownGettingStarted = true
			PawnUISwitchToTab(PawnUIHelpTabPage)
		else
			PawnUISwitchToTab(PawnUICompareTabPage)
		end
	end
end

-- Shows a tooltip for a given control if available.
-- The tooltip used will be the string with the name of the control plus "_Tooltip" on the end.
-- The title of the tooltip will be the text on a control with the same name plus "_Label" on the
-- end if available, or otherwise the actual text on the control if there is any.  If the tooltip text
-- OR title is missing, no tooltip is displayed.
function PawnUIFrame_TooltipOn(self)
	local TooltipText = getglobal(self:GetName() .. "_Tooltip")
	if TooltipText then
		local Label
		local FontString = getglobal(self:GetName() .. "_Label")
		if type(FontString) == "string" then
			Label = FontString
		elseif FontString then
			Label = FontString:GetText()
		elseif self.GetText and self:GetText() then
			Label = self:GetText()
		end
		if Label then
			GameTooltip:ClearLines()
			GameTooltip:SetOwner(self, "ANCHOR_BOTTOMRIGHT")
			GameTooltip:AddLine(Label, 1, 1, 1, 1)
			GameTooltip:AddLine(TooltipText, nil, nil, nil, 1, 1)
			GameTooltip:Show()
		end
	end
end

-- Hides the game tooltip.
function PawnUIFrame_TooltipOff()
	GameTooltip:Hide()
end

------------------------------------------------------------
-- PawnUIStringDialog methods
------------------------------------------------------------

-- Shows a dialog containing given prompt text, asking the user for a string.
-- Calls OKCallbackFunction with the typed string as the only input if the user clicked OK.
-- Calls CancelCallbackFunction if the user clicked Cancel.
function PawnUIGetString(Prompt, DefaultValue, OKCallbackFunction, CancelCallbackFunction, IsMultiLine)
	PawnUIGetStringCore(Prompt, DefaultValue, true, OKCallbackFunction, CancelCallbackFunction, IsMultiLine)
end

-- Shows a dialog with a copyable string.
-- Calls CallbackFunction when the user closes the dialog.
-- Note: Successfully tested with strings of about 900 characters.
function PawnUIShowCopyableString(Prompt, Value, CallbackFunction, IsMultiLine)
	PawnUIGetStringCore(Prompt, Value, false, CallbackFunction, nil, IsMultiLine)
	PawnUIStringDialog.TextBox:HighlightText()
end

-- Core function called by PawnUIGetString.
function PawnUIGetStringCore(Prompt, DefaultValue, Cancelable, OKCallbackFunction, CancelCallbackFunction, IsMultiLine)
	if PawnUIStringDialog and PawnUIStringDialog:IsVisible() then
		PawnUIStringDialog_CancelButton_OnClick()
	end
	if IsMultiLine then
		PawnUIStringDialog = PawnUIStringDialogMultiLine
	else
		PawnUIStringDialog = PawnUIStringDialogSingleLine
	end

	PawnUIStringDialog.PromptText:SetText(Prompt)
	PawnUIStringDialog.TextBox:SetText("") -- Causes the insertion point to move to the end on the next SetText
	PawnUIStringDialog.TextBox:SetText(DefaultValue)

	if Cancelable then
		PawnUIStringDialog.OKButton:Show()
		PawnUIStringDialog.OKButton:SetText(OKAY)
		PawnUIStringDialog.CancelButton:SetText(CANCEL)
	else
		PawnUIStringDialog.OKButton:Hide()
		PawnUIStringDialog.CancelButton:SetText(CLOSE)
	end
	PawnUIStringDialog.OKCallbackFunction = OKCallbackFunction
	PawnUIStringDialog.CancelCallbackFunction = CancelCallbackFunction

	PawnUIStringDialog:Show()
	PawnUIStringDialog.TextBox:SetFocus()
end

-- Cancels the string dialog if it's open.
function PawnUIGetStringCancel()
	if not PawnUIStringDialog or not PawnUIStringDialog:IsVisible() then return end
	PawnUIStringDialog_CancelButton_OnClick()
end

function PawnUIStringDialog_OKButton_OnClick()
	if not PawnUIStringDialog.OKButton:IsVisible() or not PawnUIStringDialog.OKButton:IsEnabled() then return end
	PawnUIStringDialog:Hide()
	if PawnUIStringDialog.OKCallbackFunction then PawnUIStringDialog.OKCallbackFunction(PawnUIStringDialog.TextBox:GetText()) end
end

function PawnUIStringDialog_CancelButton_OnClick()
	PawnUIStringDialog:Hide()
	if PawnUIStringDialog.CancelCallbackFunction then PawnUIStringDialog.CancelCallbackFunction() end
end

function PawnUIStringDialog_TextBox_OnTextChanged()
	if PawnUIStringDialog.TextBox:GetText() ~= "" then
		PawnUIStringDialog.OKButton:Enable()
	else
		PawnUIStringDialog.OKButton:Disable()
	end
end


------------------------------------------------------------

-- Initialize the quest advisor.
hooksecurefunc("QuestInfo_Display", PawnUI_OnQuestInfo_Display)
