-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

--
-- Main non-UI code
------------------------------------------------------------

PawnVersion = 2.0706

-- Pawn requires this version of VgerCore:
local PawnVgerCoreVersionRequired = 1.17

-- Floating point math
local PawnEpsilon = 0.0000000001

-- Set to true once initialization completes
local PawnIsInitialized

-- Name of our private tooltip defined in PawnUI.xml
PawnPrivateTooltipName = "PawnPrivateTooltip1"

-- Caching
-- 	An item in the cache has the following properties: Name, NumLines, UnknownLines, Stats, SocketBonusStats, UnenchantedStats, UnenchantedSocketBonusStats, Values, Link, PrettyLink, Level, Rarity, ID, InvType, Texture, ShouldUseGems
--	(See PawnGetEmptyCachedItem.)
--	An entry in the Values table is an ordered array in the following format:
--	{ ScaleName, Value, UnenchantedValue }
local PawnItemCache = nil
local PawnItemCacheMaxSize = 200 -- thanks to bag arrows, this should be greater than the number of possible inventory slots

local PawnScaleTotals = { }


-- Best gem data
--	Best gem data is broken down first by scale name, then by socket, then by minimum item level.  "Gem info" is yet another table.
-- PawnScaleBestGems["Scale name"] = {
--	["PrismaticSocket"] = { [0] = { gem info }, },
--	["PrismaticSocketValue"] = { [0] = 234.56, }
--  ...and also Red, Yellow, Blue in place of Prismatic
-- }
PawnScaleBestGems = { }

PawnPlayerFullName = nil

-- Formatting
local PawnEnchantedAnnotationFormat = nil
local PawnUnenchantedAnnotationFormat = nil
local PawnNoValueAnnotationFormat = nil

-- Plugin scale providers

-- PawnScaleProviders["Wowhead"] = { ["Name"] = "Wowhead scales", ["Function"] = <function> }
PawnScaleProviders = { }
local PawnScaleProvidersInitialized = nil

-- "Constants"
local PawnCurrentScaleVersion = 1

local PawnTooltipAnnotation = " " .. PawnDiamondTexture -- diamond texture defined in Core.lua

local PawnScaleColorDarkFactor = 0.75 -- the unenchanted color is 75% of the enchanted color

PawnButtonPositionHidden = 0
PawnButtonPositionLeft = 1
PawnButtonPositionRight = 2

PawnImportScaleResultSuccess = 1
PawnImportScaleResultAlreadyExists = 2
PawnImportScaleResultTagError = 3

PawnIgnoreStatValue = -1000000
PawnBigUpgradeThreshold = 100 -- = 10000% upgrade: don't display upgrade numbers that large

-- Data used by PawnGetSlotsForItemType.
local PawnItemEquipLocToSlot1 =
{
	INVTYPE_HEAD = 1,
	INVTYPE_NECK = 2,
	INVTYPE_SHOULDER = 3,
	INVTYPE_BODY = 4,
	INVTYPE_CHEST = 5,
	INVTYPE_ROBE = 5,
	INVTYPE_WAIST = 6,
	INVTYPE_LEGS = 7,
	INVTYPE_FEET = 8,
	INVTYPE_WRIST = 9,
	INVTYPE_HAND = 10,
	INVTYPE_FINGER = 11,
	INVTYPE_TRINKET = 13,
	INVTYPE_CLOAK = 15,
	INVTYPE_WEAPON = 16,
	INVTYPE_SHIELD = 17,
	INVTYPE_2HWEAPON = 16,
	INVTYPE_WEAPONMAINHAND = 16,
	INVTYPE_RANGED = 16,
	INVTYPE_RANGEDRIGHT = 16,
	INVTYPE_WEAPONOFFHAND = 17,
	INVTYPE_HOLDABLE = 17,
	INVTYPE_TABARD = 19,
}
-- In Classic, ranged weapons get their own slot.
if VgerCore.RangedSlotExists then
	PawnItemEquipLocToSlot1.INVTYPE_RANGED = 18
	PawnItemEquipLocToSlot1.INVTYPE_RANGEDRIGHT = 18
	PawnItemEquipLocToSlot1.INVTYPE_RELIC = 18
	PawnItemEquipLocToSlot1.INVTYPE_THROWN = 18
end
local PawnItemEquipLocToSlot2 =
{
	INVTYPE_FINGER = 12,
	INVTYPE_TRINKET = 14,
	INVTYPE_WEAPON = 17,
}

-- Don't taint the global variable "_".
local _


------------------------------------------------------------


-- Called when an event that Pawn cares about is fired.
function PawnOnEvent(Event, arg1, arg2, ...)
	if Event == "UNIT_INVENTORY_CHANGED" and arg1 == "player" then
		PawnOnInventoryChanged()
	elseif Event == "ITEM_LOCKED" then
		PawnOnItemLocked(arg1, arg2)
		PawnOnInventoryChanged()
	elseif Event == "MERCHANT_UPDATE" then
		PawnOnItemLost(GetBuybackItemLink(GetNumBuybackItems()))
	elseif Event == "ADDON_LOADED" then
		PawnOnAddonLoaded(arg1)
	elseif Event == "PLAYER_SPECIALIZATION_CHANGED" and arg1 == "player" then
		PawnOnSpecChanged()
	elseif Event == "ARTIFACT_UPDATE" then
		PawnOnArtifactUpdated(arg1)
	elseif Event == "GROUP_ROSTER_UPDATE" then
		PawnShowPlayingWithVgerEasterEgg()
	elseif Event == "PLAYER_LOGIN" then
		PawnInitialize()
	elseif Event == "PLAYER_LOGOUT" then
		PawnOnLogout()
	end
end

-- Initializes Pawn after all saved variables have been loaded.
function PawnInitialize()
	-- This only needs to happen once.  If it's ever triggered again for any reason, bail out now.
	if PawnIsInitialized then return end

	local _

	-- Check the current version of VgerCore.
	if (not VgerCore) or (not VgerCore.Version) or (VgerCore.Version < PawnVgerCoreVersionRequired) then
		if DEFAULT_CHAT_FRAME then DEFAULT_CHAT_FRAME:AddMessage("|cfffe8460" .. PawnLocal.NeedNewerVgerCoreMessage) end
		message(PawnLocal.NeedNewerVgerCoreMessage)
		return
	end

	-- Check the user's current locale, and show a message if it isn't the right one for this version of Pawn.
	local CurrentLocale = GetLocale()
	local CurrentLocaleIsSupported
	local SupportedLocale
	local LanguageList = PawnLocalizedLanguages
	for _, SupportedLocale in pairs(LanguageList) do
		if CurrentLocale == SupportedLocale then
			CurrentLocaleIsSupported = true
			break
		end
	end
	if not CurrentLocaleIsSupported then
		-- No need to translate this string...
		local WrongLocaleMessage = "Sorry, this version of Pawn is for English, French, German, Italian, Korean, Portuguese, Russian, Spanish, Simplified Chinese, and Traditional Chinese only."
		VgerCore.Message(VgerCore.Color.Salmon .. WrongLocaleMessage)
		message(WrongLocaleMessage)
	end

	-- Set up slash commands
	SLASH_PAWN1 = "/pawn"
	SlashCmdList["PAWN"] = PawnCommand

	-- Set any unset options to their default values.  If the user is a new Pawn user, all options
	-- will be set to default values.  If upgrading, only missing options will be set to default values.
	PawnInitializeOptions()

	-- Check for and set default keybindings.
	PawnSetDefaultKeybindings()

	-- Adjust UI elements.
	PawnUI_InventoryPawnButton_Move()

	-- Hook into events.

	-- UI functions
	hooksecurefunc("DeleteCursorItem",
		function()
			PawnOnItemLost(PawnLastCursorItemLink)
		end)
	hooksecurefunc("PickupMerchantItem",
		function(Index)
			if Index == 0 then PawnOnItemLost(PawnLastCursorItemLink) end
		end)

	-- Main game tooltip
	if not VgerCore.IsMainline then
		-- SetAuctionItem was removed in 8.3.0 but is still there on Classic.  The (incorrect) way that BankItems hooks this function
		-- causes the detection to fail, so just directly check the version.
		hooksecurefunc(GameTooltip, "SetAuctionItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetAuctionItem", ...) end)
		hooksecurefunc(GameTooltip, "SetAuctionSellItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetAuctionSellItem", ...) end)
	end
	if VgerCore.IsMainline then
		hooksecurefunc(GameTooltip, "SetItemKey", function(self, ItemID, ItemLevel, Suffix, ...) PawnUpdateTooltip("GameTooltip", "SetItemKey", ItemID, ItemLevel, Suffix, ...) end)
	end
	hooksecurefunc(GameTooltip, "SetBagItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetBagItem", ...) end)
	hooksecurefunc(GameTooltip, "SetBuybackItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetBuybackItem", ...) end)
	if GameTooltip.SetExistingSocketGem then
		-- Gems don't exist in WoW Classic.
		hooksecurefunc(GameTooltip, "SetExistingSocketGem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetExistingSocketGem", ...) end)
	end
	if GameTooltip.SetGuildBankItem then
		-- Guild banks don't exist in WoW Classic.
		hooksecurefunc(GameTooltip, "SetGuildBankItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetGuildBankItem", ...) end)
	end
	if GameTooltip.SetHeirloomByItemID then
		-- ...and neither do heirlooms.
		hooksecurefunc(GameTooltip, "SetHeirloomByItemID", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetHeirloomByItemID", ...) end)
	end
	hooksecurefunc(GameTooltip, "SetHyperlink", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetHyperlink", ...) end)
	hooksecurefunc(GameTooltip, "SetInboxItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetInboxItem", ...) end)
	hooksecurefunc(GameTooltip, "SetInventoryItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetInventoryItem", ...) end)
	hooksecurefunc(GameTooltip, "SetItemByID", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetItemByID", ...) end)
	hooksecurefunc(GameTooltip, "SetLootItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetLootItem", ...) end)
	hooksecurefunc(GameTooltip, "SetLootRollItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetLootRollItem", ...) end)
	hooksecurefunc(GameTooltip, "SetMerchantItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetMerchantItem", ...) end)
	hooksecurefunc(GameTooltip, "SetQuestItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetQuestItem", ...) end)
	hooksecurefunc(GameTooltip, "SetQuestLogItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetQuestLogItem", ...) end)
	hooksecurefunc(GameTooltip, "SetSendMailItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetSendMailItem", ...) end)
	if GameTooltip.SetSocketGem then
		-- Gems don't exist in Classic.
		hooksecurefunc(GameTooltip, "SetSocketGem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetSocketGem", ...) end)
	end
	hooksecurefunc(GameTooltip, "SetTradePlayerItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetTradePlayerItem", ...) end)
	if GameTooltip.SetRecipeResultItem then
		hooksecurefunc(GameTooltip, "SetRecipeResultItem",
			function(self, ...)
				local ItemLink = C_TradeSkillUI.GetRecipeItemLink(...)
				PawnUpdateTooltip("GameTooltip", "SetHyperlink", ItemLink)
			end)
	end
	hooksecurefunc(GameTooltip, "SetTradeTargetItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetTradeTargetItem", ...) end)
	if GameTooltip.SetVoidItem then
		hooksecurefunc(GameTooltip, "SetVoidItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetVoidItem", ...) end)
		hooksecurefunc(GameTooltip, "SetVoidDepositItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetVoidDepositItem", ...) end)
		hooksecurefunc(GameTooltip, "SetVoidWithdrawalItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetVoidWithdrawalItem", ...) end)
	end
	hooksecurefunc(GameTooltip, "SetTrainerService",
		function(self, Index)
			local ItemLink = GetTrainerServiceItemLink(Index)
			if ItemLink then PawnUpdateTooltip("GameTooltip", "SetHyperlink", ItemLink) end
		end)
	if GameTooltip.SetWeeklyReward then
		hooksecurefunc(GameTooltip, "SetWeeklyReward", function(self, ...) PawnUpdateTooltip("GameTooltip", "SetWeeklyReward", ...) end)
	end
	if C_ItemInteraction and C_ItemInteraction.SetItemConversionOutputTooltip then
		hooksecurefunc(C_ItemInteraction, "SetItemConversionOutputTooltip", function(self, ...) PawnUpdateTooltip("GameTooltip", "__ItemInteraction_SetItemConversionOutputTooltip_ignored", ...) end)
	end
	hooksecurefunc(GameTooltip, "Hide",
		function(self, ...)
			PawnLastHoveredItem = nil
			-- Hacky fix to prevent the green tooltip border from "leaking" if the next thing that is hovered over is not an item.
			-- (Without this, hovering over an upgrade item and then a spell button would still get you a green border.)
			if PawnCommon.ColorTooltipBorder then PawnSetTooltipBorderColor(GameTooltip, 1, 1, 1) end
		end)

	-- World quest embedded tooltips
	hooksecurefunc("EmbeddedItemTooltip_SetItemByQuestReward",
		function(self, QuestLogIndex, QuestID, ...)
			if PawnCommon.ShowQuestUpgradeAdvisor then
				local ItemName, ItemTexture = GetQuestLogRewardInfo(QuestLogIndex, QuestID)
				if ItemName and ItemTexture then
					PawnUpdateTooltip(self.Tooltip:GetName(), "SetQuestLogItem", "reward", QuestLogIndex, QuestID, ...)
					self.Tooltip:Show() -- resizes the tooltip's boundaries in case our annotation made it wider
				end
			end
		end)

	-- The item link tooltip (only hook it if it's an actual item)
	hooksecurefunc(ItemRefTooltip, "SetHyperlink",
		function(self, ItemLink, ...)
			-- Attach an icon to the tooltip first so that an existing icon can be hidden if the new hyperlink doesn't have one.
			PawnAttachIconToTooltip(ItemRefTooltip, false, ItemLink)
			if PawnGetHyperlinkType(ItemLink) ~= "item" then return end
			PawnUpdateTooltip("ItemRefTooltip", "SetHyperlink", ItemLink, ...)
		end)
	ItemRefTooltip:HookScript("OnEnter", function() local _; _, PawnLastHoveredItem = ItemRefTooltip:GetItem() end)
	ItemRefTooltip:HookScript("OnLeave", function() PawnLastHoveredItem = nil end)
	ItemRefTooltip:HookScript("OnMouseUp",
		function(object, button)
			if button == "RightButton" then
				local _, ItemLink = ItemRefTooltip:GetItem()
				if ItemLink then PawnUI_SetCompareItemAndShow(2, ItemLink) end
			end
		end)

	-- The group loot roll window
	local LootRollClickHandler =
		function(object, button)
			if button == "RightButton" then
				local ItemLink = GetLootRollItemLink(object:GetParent().rollID)
				PawnUI_SetCompareItemAndShow(2, ItemLink)
			end
		end
	GroupLootFrame1.IconFrame:HookScript("OnMouseUp", LootRollClickHandler)
	GroupLootFrame2.IconFrame:HookScript("OnMouseUp", LootRollClickHandler)
	GroupLootFrame3.IconFrame:HookScript("OnMouseUp", LootRollClickHandler)
	GroupLootFrame4.IconFrame:HookScript("OnMouseUp", LootRollClickHandler)
	GroupLootFrame1:HookScript("OnShow", PawnUI_GroupLootFrame_OnShow)
	GroupLootFrame2:HookScript("OnShow", PawnUI_GroupLootFrame_OnShow)
	GroupLootFrame3:HookScript("OnShow", PawnUI_GroupLootFrame_OnShow)
	GroupLootFrame4:HookScript("OnShow", PawnUI_GroupLootFrame_OnShow)

	-- The loot history window
	hooksecurefunc("LootHistoryFrame_UpdateItemFrame", PawnUI_LootHistoryFrame_UpdateItemFrame)

	-- The loot won window
	hooksecurefunc("LootWonAlertFrame_SetUp", PawnUI_LootWonAlertFrame_SetUp)

	-- The "currently equipped" tooltips (two, in case of rings, trinkets, and dual wielding)
	hooksecurefunc(ShoppingTooltip1, "SetCompareItem",
		function(self, ...)
			local _, ItemLink1 = ShoppingTooltip1:GetItem()
			PawnUpdateTooltip("ShoppingTooltip1", "SetCompareItem", ItemLink1, ...)
			PawnAttachIconToTooltip(ShoppingTooltip1, true)
			local _, ItemLink2 = ShoppingTooltip2:GetItem()
			if ItemLink2 and ShoppingTooltip2:IsShown() then
				PawnUpdateTooltip("ShoppingTooltip2", "SetHyperlink", ItemLink2, ...)
				PawnAttachIconToTooltip(ShoppingTooltip2, true)
			end
		end)
	hooksecurefunc(ItemRefShoppingTooltip1, "SetCompareItem",
		function(self, ...)
			local _, ItemLink1 = ItemRefShoppingTooltip1:GetItem()
			PawnUpdateTooltip("ItemRefShoppingTooltip1", "SetCompareItem", ItemLink1, ...)
			PawnAttachIconToTooltip(ItemRefShoppingTooltip1, true)
			local _, ItemLink2 = ItemRefShoppingTooltip2:GetItem()
			if ItemLink2 and ItemRefShoppingTooltip2:IsShown() then
				PawnUpdateTooltip("ItemRefShoppingTooltip2", "SetHyperlink", ItemLink2, ...)
				PawnAttachIconToTooltip(ItemRefShoppingTooltip2, true)
			end
		end)

	-- MultiTips compatibility
	if MultiTips then
		VgerCore.HookInsecureFunction(ItemRefTooltip2, "SetHyperlink", function(self, ItemLink, ...) PawnUpdateTooltip("ItemRefTooltip2", "SetHyperlink", ItemLink, ...) PawnAttachIconToTooltip(ItemRefTooltip2, false, ItemLink) end)
		VgerCore.HookInsecureFunction(ItemRefTooltip3, "SetHyperlink", function(self, ItemLink, ...) PawnUpdateTooltip("ItemRefTooltip3", "SetHyperlink", ItemLink, ...) PawnAttachIconToTooltip(ItemRefTooltip3, false, ItemLink) end)
		VgerCore.HookInsecureFunction(ItemRefTooltip4, "SetHyperlink", function(self, ItemLink, ...) PawnUpdateTooltip("ItemRefTooltip4", "SetHyperlink", ItemLink, ...) PawnAttachIconToTooltip(ItemRefTooltip4, false, ItemLink) end)
		VgerCore.HookInsecureFunction(ItemRefTooltip5, "SetHyperlink", function(self, ItemLink, ...) PawnUpdateTooltip("ItemRefTooltip5", "SetHyperlink", ItemLink, ...) PawnAttachIconToTooltip(ItemRefTooltip5, false, ItemLink) end)
	end

	-- EquipCompare compatibility
	if ComparisonTooltip1 then
		if ComparisonTooltip1.SetHyperlinkCompareItem then VgerCore.HookInsecureFunction(ComparisonTooltip1, "SetHyperlinkCompareItem", function(self, ItemLink, ...) PawnUpdateTooltip("ComparisonTooltip1", "SetHyperlinkCompareItem", ItemLink, ...) PawnAttachIconToTooltip(ComparisonTooltip1, true) end) end
		if ComparisonTooltip1.SetInventoryItem then VgerCore.HookInsecureFunction(ComparisonTooltip1, "SetInventoryItem", function(self, ...) PawnUpdateTooltip("ComparisonTooltip1", "SetInventoryItem", ...) PawnAttachIconToTooltip(ComparisonTooltip1, true) end) end -- EquipCompare with CharactersViewer
		if ComparisonTooltip1.SetHyperlink then VgerCore.HookInsecureFunction(ComparisonTooltip1, "SetHyperlink", function(self, ItemLink, ...) PawnUpdateTooltip("ComparisonTooltip1", "SetHyperlink", ItemLink, ...) PawnAttachIconToTooltip(ComparisonTooltip1, true) end) end -- EquipCompare with Armory
	end
	if ComparisonTooltip2 then
		if ComparisonTooltip2.SetHyperlinkCompareItem then VgerCore.HookInsecureFunction(ComparisonTooltip2, "SetHyperlinkCompareItem", function(self, ItemLink, ...) PawnUpdateTooltip("ComparisonTooltip2", "SetHyperlinkCompareItem", ItemLink, ...) PawnAttachIconToTooltip(ComparisonTooltip2, true) end) end
		if ComparisonTooltip2.SetInventoryItem then VgerCore.HookInsecureFunction(ComparisonTooltip2, "SetInventoryItem", function(self, ...) PawnUpdateTooltip("ComparisonTooltip2", "SetInventoryItem", ...) PawnAttachIconToTooltip(ComparisonTooltip2, true) end) end -- EquipCompare with CharactersViewer
		if ComparisonTooltip2.SetHyperlink then VgerCore.HookInsecureFunction(ComparisonTooltip2, "SetHyperlink", function(self, ItemLink, ...) PawnUpdateTooltip("ComparisonTooltip2", "SetHyperlink", ItemLink, ...) PawnAttachIconToTooltip(ComparisonTooltip2, true) end) end -- EquipCompare with Armory
	end

	-- Outfitter compatibility
	if Outfitter and Outfitter._ExtendedCompareTooltip then
		VgerCore.HookInsecureFunction(Outfitter._ExtendedCompareTooltip, "AddShoppingLink", function(self, pTitle, pName, pLink, ...) PawnUpdateTooltip("OutfitterCompareTooltip" .. self.NumTooltipsShown, "SetHyperlink", pLink) end)
	end

	-- AtlasLoot Enhanced compatibility
	if AtlasLootTooltip then
		VgerCore.HookInsecureFunction(AtlasLootTooltip, "SetHyperlink", function(self, ...) PawnUpdateTooltip("AtlasLootTooltip", "SetHyperlink", ...) end)
		VgerCore.HookInsecureFunction(AtlasLootTooltip, "SetItemByID", function(self, ...) PawnUpdateTooltip("AtlasLootTooltip", "SetItemByID", ...) end)
	end

	-- LinkWrangler compatibility -- hook the Link Wrangler item link tooltips.
	if LinkWrangler then
		LinkWrangler.RegisterCallback("Pawn", PawnLinkWranglerOnTooltip, "refresh")
		LinkWrangler.RegisterCallback("Pawn", PawnLinkWranglerOnTooltip, "refreshcomp")
	end

	-- ArkInventory integration: register the pawnupgrade() and pawnnotupgrade() rules
	if ArkInventoryRules then
		local arkInventoryModule = ArkInventoryRules:NewModule("Pawn")
		ArkInventoryRules.Register(arkInventoryModule, "PAWNUPGRADE", ArkInventoryRulePawnUpgrade)
		ArkInventoryRules.Register(arkInventoryModule, "PAWNNOTUPGRADE", ArkInventoryRulePawnNotUpgrade)
	end

	-- In-bag upgrade icons
	if VgerCore.IsMainline then
		PawnOriginalIsContainerItemAnUpgrade = IsContainerItemAnUpgrade
		PawnIsContainerItemAnUpgrade = function(bagID, slot, ...)
			if PawnCommon.ShowBagUpgradeAdvisor then
				local _, Count, _, _, _, _, ItemLink = GetContainerItemInfo(bagID, slot)
				if not Count then return false end -- If the stack count is 0, it's clearly not an upgrade
				if not ItemLink then return nil end -- If we didn't get an item link, but there's an item there, try again later
				return PawnShouldItemLinkHaveUpgradeArrow(ItemLink, true) -- true means to check player level
			else
				---@diagnostic disable-next-line: redundant-parameter
				return PawnOriginalIsContainerItemAnUpgrade(bagID, slot, ...)
			end
		end
		PawnUpdateItemUpgradeIcon = function(self)
			if self.isExtended then return end
			local IsUpgrade = PawnIsContainerItemAnUpgrade(self.GetBagID and self:GetBagID() or self:GetParent():GetID(), self:GetID())

			if IsUpgrade == nil then
				self.UpgradeIcon:SetShown(false)
				self:SetScript("OnUpdate", self.TryUpdateItemUpgradeIcon or ContainerFrameItemButton_TryUpdateItemUpgradeIcon)
			else
				self.UpgradeIcon:SetShown(IsUpgrade)
				self:SetScript("OnUpdate", nil)
			end
		end
	end

	if ContainerFrameItemButtonMixin and ContainerFrameItemButtonMixin.UpdateItemUpgradeIcon then
		-- Dragonflight onward

		-- First, hook ContainerFrameItemButtonMixin to affect all future bag frames.
		hooksecurefunc(ContainerFrameItemButtonMixin, "UpdateItemUpgradeIcon", PawnUpdateItemUpgradeIcon)
		-- Unfortunately, the Mixin is not a prototype so changes are not retroactive to bags that have already been created,
		-- so now we need to update all of those.
		for i = 1, NUM_TOTAL_BAG_FRAMES do
			local Bag = _G["ContainerFrame" .. i]
			if Bag.Items then
				for j, Button in Bag:EnumerateItems() do
					hooksecurefunc(Button, "UpdateItemUpgradeIcon", PawnUpdateItemUpgradeIcon)
				end
			end
		end
	elseif ContainerFrame_UpdateItemUpgradeIcons then
		-- Legion through Shadowlands

		-- Changing IsContainerItemAnUpgrade now causes taint errors, and replacing this function with a copy of itself
		-- works on its own, but breaks other addons that hook this function like CanIMogIt. So, our best option appears to
		-- be to just let the default version run, and then change its results immediately after.
		hooksecurefunc("ContainerFrameItemButton_UpdateItemUpgradeIcon", PawnUpdateItemUpgradeIcon)
	end

	-- Dragonflight professions UI
	if C_TradeSkillUI and C_TradeSkillUI.SetTooltipRecipeResultItem then
		hooksecurefunc(C_TradeSkillUI, "SetTooltipRecipeResultItem", function(self, ...) PawnUpdateTooltip("GameTooltip", "C_TradeSkillUI.SetTooltipRecipeResultItem") end)
	end

	-- We're now effectively initialized.  Just the last steps of scale initialization remain.
	PawnIsInitialized = true

	-- If any of our dependencies have already loaded, pretend that they just loaded now.
	if IsAddOnLoaded("Blizzard_InspectUI") then PawnOnAddonLoaded("Blizzard_InspectUI") end
	if IsAddOnLoaded("Blizzard_ItemSocketingUI") then PawnOnAddonLoaded("Blizzard_ItemSocketingUI") end
	if IsAddOnLoaded("Blizzard_ArtifactUI") then PawnOnAddonLoaded("Blizzard_ArtifactUI") end

	-- Now, load any plugins that are ready to be loaded.
	PawnInitializePlugins()

	-- Go through the user's scales and check them for errors.
	for ScaleName, _ in pairs(PawnCommon.Scales) do
		PawnCorrectScaleErrors(ScaleName)
	end

	-- Warn them if Pawn might be broken due to changing the thousands or decimal separator.
	if GetLocale() ~= "frFR" or not VgerCore.IsClassic then
		-- The separator strings are completely wrong on French WoW Classic.  :(
		if (LARGE_NUMBER_SEPERATOR and PawnLocal.ThousandsSeparator ~= LARGE_NUMBER_SEPERATOR) or
		(DECIMAL_SEPERATOR and PawnLocal.DecimalSeparator ~= DECIMAL_SEPERATOR) then
			VgerCore.Fail("Pawn may provide incorrect advice due to a potential addon conflict: Pawn is not compatible with Combat Numbers Separator, Titan Panel Artifact Power, or other addons that change the way that numbers appear. Or, if you're seeing this right after a patch, please let Vger know which language you're playing in.")
		end
	end

	-- If auto-spec is on, check their spec now in case they switched on a different PC.
	if GetSpecialization then
		PawnOnSpecChanged()
	end

	-- Then, recalculate totals.
	-- This must be done after checking for errors is completed on all scales because it can trigger other recalculations.
	for ScaleName, _ in pairs(PawnCommon.Scales) do
		PawnRecalculateScaleTotal(ScaleName)
	end

end

function PawnOnLogout()
	-- Uninitialize all scale provider plugins.
	PawnUnitializePlugins()
	-- Clear out cached best item lists for all disabled scales.
	if (not PawnCommon.ShowUpgradesOnTooltips) and (not PawnCommon.ShowLootUpgradeAdvisor) and (not PawnCommon.ShowQuestUpgradeAdvisor) then
		-- The user has disabled all upgrade options, so clear out all upgrade information.
		PawnInvalidateBestItems()
	else
		local Scale, _
		for _, Scale in pairs(PawnCommon.Scales) do
			local CharacterOptions = Scale.PerCharacterOptions[PawnPlayerFullName]
			if CharacterOptions and not CharacterOptions.Visible then
				-- If this scale is hidden for this character, we can remove the character options table entirely since
				-- Visible and BestItems are currently the only two members and we want to clear out BestItems for
				-- invisible scales.  (If more members are added in the future, this will need to be fleshed out.)
				Scale.PerCharacterOptions[PawnPlayerFullName] = nil
			end
		end
	end
end

function PawnOnAddonLoaded(AddonName)
	-- Is Pawn hasn't initialized yet, skip this.  We'll rerun this from PawnInitialize later.
	if not PawnIsInitialized then return end

	if AddonName == "Blizzard_InspectUI" then
		-- After the inspect UI is loaded, we want to hook it to add the Pawn button.
		PawnUI_InspectPawnButton_Attach()
	elseif AddonName == "Blizzard_ItemSocketingUI" then
		-- After the socketing UI is loaded, it gets a Pawn button too.
		PawnUI_SocketingPawnButton_Attach()
	elseif AddonName == "Blizzard_ArtifactUI" then
		-- After the artifact UI is loaded, watch the relic sockets.
		PawnUI_HookArtifactUI()
	end
end

-- Resets all Pawn options and scales.  Used to set the saved variable to a default state.
function PawnResetOptions()
	PawnCommon = nil
	PawnOptions = nil
	PawnInitializeOptions()
end

-- Sets values for any options that don't have a value set yet.  Useful when upgrading.  This method can also be
-- called by any code that might run before initialization finishes to ensure that PawnCommon exists and is set up.
function PawnInitializeOptions()
	local _

	-- If either of the options tables don't exist yet, create them now.
	if not PawnCommon then PawnCommon = {} end
	if not PawnOptions then PawnOptions = {} end

	-- We need to know the player's full name for some server-specific settings.
	PawnPlayerFullName = UnitName("player") .. "-" .. GetRealmName()
	-- Save the last known player name to PawnOptions so that we can detect character renames and server
	-- transfers in the future.
	PawnOptions.LastPlayerFullName = PawnPlayerFullName

	-- Now, migrate all settings over to PawnCommon, and upgrade to the current version from any previous version
	-- of Pawn (or none at all).  Settings are respected in this order of preference:
	-- 1. Global settings in PawnCommon
	-- 2. Per-character settings in PawnOptions (used prior to Pawn 1.3)
	-- 3. The default values for the settings.
	PawnMigrateSetting("Debug", false)
	PawnMigrateSetting("Digits", 1)
	PawnMigrateSetting("ShowItemID", false)
	PawnMigrateSetting("AlignNumbersRight", false)
	PawnMigrateSetting("ButtonPosition", PawnButtonPositionRight)
	PawnMigrateSetting("ShowTooltipIcons", true)

	-- Set default values for other new options.
	if PawnCommon.ShowUpgradesOnTooltips == nil then PawnCommon.ShowUpgradesOnTooltips = true end
	if PawnCommon.ShowValuesForUpgradesOnly == nil then PawnCommon.ShowValuesForUpgradesOnly = true end
	if PawnCommon.ColorTooltipBorder == nil then PawnCommon.ColorTooltipBorder = true end
	if PawnCommon.ShowUpgradeAdvisors ~= nil then
		-- If the user's upgrading from Pawn 1.5.4 or earlier, migrate the single upgrade advisors setting into the two settings in 1.5.5.
		if PawnCommon.ShowLootUpgradeAdvisor == nil then PawnCommon.ShowLootUpgradeAdvisor = PawnCommon.ShowUpgradeAdvisors end
		if PawnCommon.ShowQuestUpgradeAdvisor == nil then PawnCommon.ShowQuestUpgradeAdvisor = PawnCommon.ShowUpgradeAdvisors end
		PawnCommon.ShowUpgradeAdvisors = nil
	else
		-- Otherwise just default them to on.
		if PawnCommon.ShowLootUpgradeAdvisor == nil then PawnCommon.ShowLootUpgradeAdvisor = true end
		if PawnCommon.ShowQuestUpgradeAdvisor == nil then PawnCommon.ShowQuestUpgradeAdvisor = true end
	end
	if PawnCommon.ShowSocketingAdvisor == nil then PawnCommon.ShowSocketingAdvisor = true end

	-- Now, migrate all scales from this character over to PawnCommon.
	local ScaleName, Scale
	if not PawnCommon.Scales then PawnCommon.Scales = {} end
	if PawnOptions.Scales then
		-- Looks like there's one or more scales on this character that need to be migrated.
		for ScaleName, Scale in pairs(PawnOptions.Scales) do
			if PawnCommon.Scales[ScaleName] then
				-- This scale name already exists, so we have to make it unique first.
				-- First, try just appending the player name.
				-- If that's not good enough, start trying sequential numbers.  (Sigh; why do people need
				-- to make things so complicated?  Did you really need ten characters with the same name
				-- and identically named scales on each one?)
				ScaleName = ScaleName .. " (" .. UnitName("player") .. ")"
				local ScaleNameBase = ScaleName .. " ("
				local i = 0
				while PawnCommon.Scales[ScaleName] do
					i = i + 1
					ScaleName = ScaleNameBase .. i .. ")"
				end
			end

			-- We now have a unique name for this scale, so transfer it over to the master scale list.
			PawnCommon.Scales[ScaleName] = Scale
			Scale.PerCharacterOptions = { }
			Scale.PerCharacterOptions[PawnPlayerFullName] = { }
			if not Scale.Hidden then
				Scale.PerCharacterOptions[PawnPlayerFullName].Visible = true
			end
			Scale.NormalizationFactor = PawnOptions.NormalizationFactor
			Scale.Hidden = nil
		end
	end
	-- Now that migration is complete, remove all migrated scales from the per-character options.
	PawnOptions.Scales = nil

	-- These options have been removed or otherwise are no longer useful.
	PawnOptions.ShowItemLevel = nil
	PawnOptions.ShownGettingStarted = nil
	PawnOptions.NormalizationFactor = nil
	PawnCommon.ShowUnenchanted = nil
	PawnCommon.ShowAsterisks = nil
	PawnCommon.ShowBoth1HAnd2HUpgrades = nil
	PawnCommon.ShowSpace = nil

	-- Remove any stale scales from previous versions that might have accumulated.
	-- the user might have accumulated.
	local ScalesToDelete = { }
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if Scale.Provider == "PawnPlaceholder" or Scale.Provider == "Starter" or Scale.Provider == "Wowhead" then tinsert(ScalesToDelete, ScaleName) end
	end
	for _, ScaleName in pairs(ScalesToDelete) do
		PawnCommon.Scales[ScaleName] = nil
		PawnRecalculateScaleTotal(ScaleName) -- removes information from the cache
	end

	-- Some features were deleted in WoW 6.0.
	PawnCommon.ShowReforgingAdvisor = nil

	-- And some more in WoW 7.1.
	PawnCommon.IgnoreItemUpgrades = nil

	-- Any new stuff since the last version they used?
	if not PawnCommon.LastVersion then PawnCommon.LastVersion = 0 end
	if not PawnOptions.LastVersion then PawnOptions.LastVersion = 0 end
	if PawnCommon.LastVersion < 1.9 then
		-- When upgrading to 1.9, enable the "ignore sockets on low-level items" option.
		PawnCommon.IgnoreGemsWhileLeveling = true
	end
	if PawnCommon.LastVersion < 2.0000 then
		-- The new "show spec icons" option is enabled by default.
		PawnCommon.ShowSpecIcons = true
	end
	if PawnOptions.LastVersion < 2.0000 then
		-- When upgrading each character to 2.0, turn on the auto-scale option, but just once.
		PawnOptions.AutoSelectScales = true
	end
	if PawnCommon.LastVersion < 2.0101 then
		-- The new Bag Upgrade Advisor is on by default, but it's not supported in Classic.
		if VgerCore.IsMainline then
			PawnCommon.ShowBagUpgradeAdvisor = true
		else
			PawnCommon.ShowBagUpgradeAdvisor = false
		end
	end
	if PawnOptions.LastVersion < 2.0219 then
		-- The item squish happened in WoW 8.0, so relic item levels changed.
		PawnOptions.Artifacts = nil
	end
	if PawnOptions.LastVersion < 2.0227 then
		-- The relic advisor is off by default as of 2.2.27.
		PawnCommon.ShowRelicUpgrades = false
	end
	if PawnCommon.LastVersion < 2.0232 then
		-- When upgrading to 2.2.32, turn off this annoying debug option if they still had it on.
		PawnCommon.DebugCache = nil
	end
	if PawnCommon.LastVersion < 2.0244 then
		-- The "show item level upgrades" option is new for 2.2.44 and on by default, but NOT in Classic.
		if VgerCore.IsMainline then
			PawnCommon.ShowItemLevelUpgrades = true
		else
			PawnCommon.ShowItemLevelUpgrades = false
		end
	end
	if PawnCommon.LastVersion < 2.0403 then
		-- Pawn 2.4 came out with patch 9.0 and the level squish, so reset everything.
		-- Pawn 2.4.3 improved this behavior, so do it one last time.
		PawnInvalidateBestItems()
	end
	if PawnOptions.LastVersion < 2.0400 then
		-- The best item level data is still per-character, so we have to wait until first logon for that character.
		-- If we already did that back in 2.4.0 we don't need to do this part again.
		PawnClearBestItemLevelData()
	end
	if PawnCommon.LastVersion < 2.0402 and VgerCore.DeathKnightsExist then
		-- Frost death knights can fully use 2H weapons again, but the setting to hide 2H upgrades is persistent.
		-- Clear it this one time; people can go back to hiding them if they want.
		local FrostDK = PawnCommon.Scales["\"MrRobot\":DEATHKNIGHT2"]
		if FrostDK then FrostDK.DoNotShow2HUpgrades = false end
	end
	if ((VgerCore.IsMainline) and PawnCommon.LastVersion < PawnMrRobotLastUpdatedVersion) or
		((VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath) and PawnCommon.LastVersion < PawnClassicLastUpdatedVersion) then
		-- If the Ask Mr. Robot scales have been updated since the last time they used Pawn, re-scan gear.
		PawnInvalidateBestItems()
	end
	PawnCommon.LastVersion = PawnVersion
	PawnOptions.LastVersion = PawnVersion

	-- Pawn on WoW Classic doesn't have Automatic mode.
	if not VgerCore.SpecsExist then
		PawnOptions.AutoSelectScales = false
	end

	-- Finally, this stuff needs to get done after options are changed.
	PawnRecreateAnnotationFormats()

end

-- If the specified setting does not exist in the common settings list, this function first tries to migrate it from the
-- current character's settings (from Pawn 1.2 or earlier).  If it's not there either, it's set to a default value.
function PawnMigrateSetting(SettingName, Default)
	if PawnCommon[SettingName] ~= nil then
		PawnOptions[SettingName] = nil
		return
	end
	if PawnOptions[SettingName] ~= nil then
		PawnCommon[SettingName] = PawnOptions[SettingName]
		PawnOptions[SettingName] = nil
		return
	end
	PawnCommon[SettingName] = Default
end

-- Once per new version of Pawn that adds keybindings, bind the new actions to default keys.
function PawnSetDefaultKeybindings()
	-- SaveBindings doesn't work on WoW Classic.
	if not VgerCore.IsMainline then return end

	-- It's possible that this will happen before the main initialization code, so we need to ensure that the
	-- default Pawn options have been set already.  Doing this multiple times is harmless.
	if not PawnCommon then VgerCore.Fail("Can't set keybindings until Pawn starts to initialize.") return end

	if PawnOptions.LastKeybindingsSet == nil then PawnOptions.LastKeybindingsSet = 0 end
	local BindingSet = false

	-- Keybindings for opening the Pawn UI and setting comparison items.
	if PawnOptions.LastKeybindingsSet < 1 then
		BindingSet = PawnSetKeybindingIfAvailable(PAWN_TOGGLE_UI_DEFAULT_KEY, "PAWN_TOGGLE_UI") or BindingSet
		BindingSet = PawnSetKeybindingIfAvailable(PAWN_COMPARE_LEFT_DEFAULT_KEY, "PAWN_COMPARE_LEFT") or BindingSet
		BindingSet = PawnSetKeybindingIfAvailable(PAWN_COMPARE_RIGHT_DEFAULT_KEY, "PAWN_COMPARE_RIGHT") or BindingSet
	end

	-- If any keybindings were changed, save the user's bindings.
	if BindingSet then
		local CurrentBindingSet = GetCurrentBindingSet()
		if CurrentBindingSet == 1 or CurrentBindingSet == 2 then
			SaveBindings(CurrentBindingSet)
		else
			VgerCore.Fail("GetCurrentBindingSet() returned unexpected value: " .. tostring(CurrentBindingSet))
		end
	end

	-- Record that we've set those keybindings, so we don't try to set them again in the future, even if
	-- the user clears them.
	PawnOptions.LastKeybindingsSet = 1
end

-- Sets a keybinding to its default value if it's not already assigned to something else.  Returns true if anything was changed.
function PawnSetKeybindingIfAvailable(Key, Binding)
	-- Is this key already bound?
	local ExistingBinding = GetBindingAction(Key, true) -- true: check overrides as well (ElvUI compatibility)
	if not ExistingBinding or ExistingBinding == "" then
		-- Bind this key to its default Pawn action.
		SetBinding(Key, Binding)
		return true
	else
		-- This key is already bound, so do nothing.
		return false
	end
end

-- Returns an empty Pawn scale table.
function PawnGetEmptyScale()
	return
	{
		["UpgradesFollowSpecialization"] = (PawnArmorSpecializationLevel ~= nil),
		["PerCharacterOptions"] = { },
		["Values"] = { },
	}
end

-- Returns the default Pawn scale table, either for the current player's spec, or for the supplied class and spec if non-nil.
function PawnGetDefaultScale(ClassID, SpecID, NoStats)
	local _
	if ClassID == nil then
		_, _, ClassID = UnitClass("player")
	end
	if not VgerCore.SpecsExist then
		SpecID = nil
	elseif SpecID == nil then
		SpecID = GetSpecialization()
	end
	local Template = PawnFindScaleTemplate(ClassID, SpecID)
	local ScaleValues = PawnGetStatValuesForTemplate(Template, NoStats)
	return
	{
		["ClassID"] = ClassID,
		["SpecID"] = SpecID,
		["UpgradesFollowSpecialization"] = (PawnArmorSpecializationLevel ~= nil),
		["PerCharacterOptions"] = { },
		["Values"] = ScaleValues,
	}
end

-- LinkWrangler compatibility
function PawnLinkWranglerOnTooltip(Tooltip, ItemLink)
	if not PawnIsInitialized then return end
	if not Tooltip then return end
	PawnUpdateTooltip(Tooltip:GetName(), "SetHyperlink", ItemLink)
	PawnAttachIconToTooltip(Tooltip, false, ItemLink)
end

-- ArkInventory rules
function GetPawnStatusForArkInventoryRule(...)
	if not PawnIsInitialized then VgerCore.Fail("Can't check to see if items are upgrades until Pawn is initialized") return end

	local Info = ArkInventoryRules.Object.info
	if not Info or ArkInventoryRules.Object.class ~= "item" then return false end

	-- Use the same logic for determining whether or not an arrow should be shown, for consistency
	local ItemLink = Info.h
	return PawnIsItemDefinitivelyAnUpgrade(ItemLink, true)
end

function ArkInventoryRulePawnUpgrade(...)
	local fn = "PAWNUPGRADE" -- Rule name for errors

	-- For pawnupgrade(), we only want to return true if Pawn is sure that it is an upgrade.
	-- This means for nil or false, we return false.
	return GetPawnStatusForArkInventoryRule(...) == true
end

function ArkInventoryRulePawnNotUpgrade(...)
	local fn = "PAWNNOTUPGRADE" -- Rule name for errors

	-- For pawnnotupgrade(), we only want to return true if Pawn is sure that it is not an upgrade
	-- This means for nil or true, we return false.
	return GetPawnStatusForArkInventoryRule(...) == false
end

-- This is a variant of PawnShouldItemLinkHaveUpgradeArrow for the ArkInventory rules.
-- It decidedly does not offer an opinion on items that are not gear or do not have stats. This means a true is a definitive upgrade
-- and a false is definitively not an upgrade. Otherwise, this function returns nil.
-- Returns:
--   true: This item is indeed an upgrade for something.
--   false: This item is not an upgrade.
--   nil: We're not sure or don't care because it isn't gear.
function PawnIsItemDefinitivelyAnUpgrade(ItemLink, CheckLevel)
	-- REVIEW: This was copied from PawnShouldItemLinkHaveUpgradeArrow. This stuff could use some refactoring.

	if not PawnIsInitialized then VgerCore.Fail("Can't check to see if items are upgrades until Pawn is initialized") return nil end

	local _, _, _, _, MinLevel = GetItemInfo(ItemLink)

	-- If it doesn't have a minlevel, we don't care because it isn't gear
	if MinLevel == nil then return nil end

	-- If the gear minlevel is higher than the player, we don't care to determine if it is an upgrade, since they can't use it yet
	-- but may not want to mark it as not an upgrade
	if CheckLevel and UnitLevel("player") < MinLevel then return nil end

	if PawnCanItemHaveStats(ItemLink) then
		local Item = PawnGetItemData(ItemLink)
		-- If there are no stats, we don't know what's happening, so we won't make a judgment
		if Item == nil or Item.Link == nil then return nil end
		local UpgradeInfo, ItemLevelIncrease = PawnIsItemAnUpgrade(Item)
		-- If upgrade info was returned, it's an upgrade OR if there is an item level increase, it's an upgrade
		return UpgradeInfo ~= nil or (PawnCommon.ShowItemLevelUpgrades and ItemLevelIncrease ~= nil)
	elseif PawnCommon.ShowRelicUpgrades and PawnCanItemBeArtifactUpgrade(ItemLink) then
		-- If there is relic upgrade information, it's an upgrade.
		return PawnGetRelicUpgradeInfo(ItemLink) ~= nil
	else
		-- If the item can't have stats, it isn't gear (probably), so we don't care.
		return nil
	end
end

-- If debugging is enabled, show a message; otherwise, do nothing.
function PawnDebugMessage(Message)
	if PawnCommon.Debug then
		VgerCore.Message(Message)
	end
end

-- Processes a Pawn slash command.
function PawnCommand(Command)
	if Command == "" then
		PawnUIShow()
	elseif Command == "debug on" then
		PawnCommon.Debug = true
		PawnResetTooltips()
		if PawnUIFrame_DebugCheck then PawnUIFrame_DebugCheck:SetChecked(PawnCommon.Debug) end
	elseif Command == "debug off" then
		PawnCommon.Debug = false
		PawnResetTooltips()
		if PawnUIFrame_DebugCheck then PawnUIFrame_DebugCheck:SetChecked(PawnCommon.Debug) end
	elseif Command == "backup" then
		PawnUIExportAllScales()
	elseif strsub(Command, 1, 7) == "tooltip" then
		local ItemLink = strsub(Command, 9)
		local ItemID = tonumber(ItemLink)
		ItemRefTooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
		if ItemID then
			ItemRefTooltip:SetHyperlink("item:" .. ItemID)
		else
			if strsub(ItemLink, 1, 5) ~= "item:" then ItemLink = "item:" .. ItemLink end
			ItemRefTooltip:SetHyperlink(ItemLink)
		end
		ItemRefTooltip:Show()
	elseif strsub(Command, 1, 7) == "compare" then
		local CompareIndex, ItemLink1, ItemLink2
		if strsub(Command, 9, 13) == "left " then
			local SplitIndex = strfind(Command, " right ", 13, true)
			if SplitIndex and SplitIndex + 7 < strlen(Command) then
				-- Left Item1 Right Item2
				ItemLink1 = strsub(Command, 14, SplitIndex - 1)
				ItemLink2 = strsub(Command, SplitIndex + 7)
			else
				-- Left Item1
				ItemLink1 = strsub(Command, 14)
			end
		elseif strsub(Command, 9, 14) == "right " then
			-- Right Item2
			ItemLink2 = strsub(Command, 15)
		else
			-- Item2
			ItemLink2 = strsub(Command, 9)
		end
		if ItemLink1 and strlen(ItemLink1) == 0 then ItemLink1 = nil end
		if ItemLink2 and strlen(ItemLink2) == 0 then ItemLink2 = nil end
		if ItemLink1 or ItemLink2 then
			if ItemLink2 then
				local IsReady2 = (GetItemInfo(ItemLink2) ~= nil)
				if IsReady2 then
					PawnUI_SetCompareItemAndShow(2, ItemLink2)
				else
					C_Timer.After(1, function() PawnUI_SetCompareItemAndShow(2, ItemLink2) end)
				end
			end
			if ItemLink1 then
				local IsReady1 = (GetItemInfo(ItemLink1) ~= nil)
				if IsReady1 then
					PawnUI_SetCompareItemAndShow(1, ItemLink1)
				else
					C_Timer.After(1, function() PawnUI_SetCompareItemAndShow(1, ItemLink1) end)
				end
			end
		else
			VgerCore.Message("Usage: /pawn compare [ left ItemID | ItemLink [ right ]] ItemID | ItemLink")
			VgerCore.Message("  /pawn compare 16795")
			VgerCore.Message("  /pawn compare left item:16795:0:0")
			VgerCore.Message("  /pawn compare left |cffa335ee|Hitem:16795|h[Arcanist Crown]|h|r right 16914")
		end
	else
		PawnUsage()
	end
end

-- Displays Pawn usage information.
function PawnUsage()
	VgerCore.Message(" ")
	VgerCore.MultilineMessage(PawnLocal.Usage)
	VgerCore.Message(" ")
end

-- Returns an empty item for use in the item cache.
function PawnGetEmptyCachedItem(NewItemLink, NewItemName, NewNumLines)
	-- Also includes properties set to nil by default: Stats, SocketBonusStats, UnenchantedState, UnenchantedSocketBonusStats, Values, Level, ItemID
	return { Name = NewItemName, NumLines = NewNumLines, UnknownLines = {}, Link = NewItemLink }
end

-- Searches the item cache for an item, and either returns the correct cached item, or nil.
function PawnGetCachedItem(ItemLink, ItemName, NumLines)
	-- If the item cache is empty, skip all this...
	if (not PawnItemCache) or (#PawnItemCache == 0) then return end
	-- If debug mode is on, the cache is disabled.
	if PawnCommon.Debug then return end

	-- Otherwise, search the item cache for this item.
	local _
	for _, CachedItem in pairs(PawnItemCache) do
		if (not NumLines) or (NumLines == CachedItem.NumLines) then
			if ItemLink and CachedItem.Link then
				if ItemLink == CachedItem.Link then
					if PawnCommon.DebugCache then
						VgerCore.Message(VgerCore.Color.Green .. "    Found item in cache!")
					end
					return CachedItem
				end
			end
		end
	end
	if PawnCommon.DebugCache then
		VgerCore.Message(VgerCore.Color.Salmon .. "    Item was not in the cache.")
	end
end

-- Removes a single stale item from the cache.
function PawnUncacheItem(CachedItem)
	-- If debug mode is on, the cache is disabled.
	if PawnCommon.Debug or CachedItem == nil or PawnItemCache == nil then return end

	local Index = VgerCore.IndexOf(PawnItemCache, CachedItem)
	if Index then
		tremove(PawnItemCache, Index)
		if PawnCommon.DebugCache then
			VgerCore.Message("Successfully removed " .. tostring(CachedItem.Link) .. " from the cache.")
		end
	else
		VgerCore.Fail("Failed to uncache " .. tostring(CachedItem.Link) .. " because we didn't find it in the cache.")
	end
end

-- Adds an item to the item cache, removing existing items if necessary to make room.
function PawnCacheItem(CachedItem)
	-- If debug mode is on, the cache is disabled.
	if PawnCommon.Debug then return end

	-- Cache it.
	if PawnItemCacheMaxSize <= 0 then return end
	if not PawnItemCache then PawnItemCache = {} end
	tinsert(PawnItemCache, CachedItem)
	while #PawnItemCache > PawnItemCacheMaxSize do
		tremove(PawnItemCache, 1)
	end
end

-- Clears the item cache.
function PawnClearCache()
	PawnItemCache = nil
	-- We should also clear out the gem cache when doing this.
	PawnClearCacheValuesOnly()
end

-- Clears only the calculated values for items in the cache, retaining things like stats.
function PawnClearCacheValuesOnly()
	local CachedItem, _
	-- First, the main item cache.
	if PawnItemCache then
		for _, CachedItem in pairs(PawnItemCache) do
			CachedItem.Values = nil
		end
	end
	-- Then, the gem caches.  For each gem meta-table, look at the gem table (which is in
	-- column 3) and then clear out that table's item data cache.
	local GemQualityData, GemData
	for _, GemQualityData in pairs(PawnGemQualityLevels) do
		for _, GemData in pairs(GemQualityData[2]) do
			GemData.Item = nil
		end
	end
	-- Then, the Compare tab's cache.
	if PawnUI_ClearCacheValues then PawnUI_ClearCacheValues() end
end

-- Clears all calculated values and causes them to be recalculated the next time tooltips are displayed.  The stats
-- will not be re-read next time, however.
function PawnResetTooltips()
	-- Clear out the calculated values in the cache, leaving item data.
	PawnClearCacheValuesOnly()
	-- Then, attempt to reset tooltips where possible.  On-hover tooltips don't need to be reset manually, but the
	-- item link tooltip does.
	PawnResetTooltip("ItemRefTooltip")
	PawnResetTooltip("ItemRefTooltip2") -- MultiTips compatibility
	PawnResetTooltip("ItemRefTooltip3") -- MultiTips compatibility
	PawnResetTooltip("ItemRefTooltip4") -- MultiTips compatibility
	PawnResetTooltip("ItemRefTooltip5") -- MultiTips compatibility
	PawnResetTooltip("ComparisonTooltip1") -- EquipCompare compatibility
	PawnResetTooltip("ComparisonTooltip2") -- EquipCompare compatibility
	PawnResetTooltip("AtlasLootTooltip") -- AtlasLoot compatibility
	-- Update advisors.
	if LootHistoryFrame then LootHistoryFrame_FullUpdate(LootHistoryFrame) end
end

-- Attempts to reset a single tooltip, causing Pawn values to be recalculated.  Returns true if successful.
function PawnResetTooltip(TooltipName)
	local Tooltip = _G[TooltipName]
	if not Tooltip or not Tooltip.IsShown or not Tooltip:IsShown() or not Tooltip.GetItem then return end

	local _, ItemLink = Tooltip:GetItem()
	if not ItemLink then return end

	Tooltip:SetOwner(UIParent, "ANCHOR_PRESERVE")
	Tooltip:SetHyperlink(ItemLink)
	Tooltip:Show()
	return true
end

-- Recalculates the total value of all stats in a scale, as well as all of the best gems for that scale.
function PawnRecalculateScaleTotal(ScaleName)
	local _

	-- Find the appropriate scale.
	local ThisScale = PawnCommon.Scales[ScaleName]
	local ThisScaleValues
	if ThisScale then ThisScaleValues = ThisScale.Values end
	if not ThisScaleValues then
		-- If the passed-in scale doesn't exist, remove it from our cache and exit.
		PawnScaleTotals[ScaleName] = nil
		PawnScaleBestGems[ScaleName] = nil
		return
	end

	-- Calculate the total.  When calculating the total value for a scale, ignore sockets.
	local Total = 0
	for StatName, Value in pairs(ThisScaleValues) do
		if Value and Value > 0 then
			if StatName ~= "PrismaticSocket" then
				Total = Total + Value
			else
				VgerCore.Fail("Socket values should always be zero, but " .. StatName .. " is " .. Value .. ".")
			end
		end
	end
	PawnScaleTotals[ScaleName] = Total

	-- Now recalculate all of the best gems for this scale.
	if not PawnScaleBestGems[ScaleName] then
		PawnScaleBestGems[ScaleName] =
		{
			["PrismaticSocket"] = { },
			["PrismaticSocketValue"] = { },
			["RedSocket"] = { },
			["RedSocketValue"] = { },
			["YellowSocket"] = { },
			["YellowSocketValue"] = { },
			["BlueSocket"] = { },
			["BlueSocketValue"] = { },
			["MetaSocket"] = { },
			["MetaSocketValue"] = { },		}
	end
	local ThisScaleBestGems = PawnScaleBestGems[ScaleName]

	local QualityLevelData
	for _, QualityLevelData in pairs(PawnGemQualityLevels) do
		local ItemLevel = QualityLevelData[1]
		local GemData = QualityLevelData[2]

		if PawnCommon.Debug then
			VgerCore.Message("")
			VgerCore.Message("GEMS FOR ITEM LEVEL " .. tostring(ItemLevel))
			VgerCore.Message("")
		end

		local BestPrismatic
		BestPrismatic, ThisScaleBestGems.PrismaticSocket[ItemLevel] = PawnFindBestGems(ScaleName, GemData)
		ThisScaleBestGems.PrismaticSocketValue[ItemLevel] = BestPrismatic

		-- Classic Era and the retail realms don't have colored sockets, so don't bother trying to calculate for those.
		if not VgerCore.IsClassic and not VgerCore.IsMainline then
			local BestRed
			BestRed, ThisScaleBestGems.RedSocket[ItemLevel] = PawnFindBestGems(ScaleName, GemData, true, false, false)
			ThisScaleBestGems.RedSocketValue[ItemLevel] = BestRed

			local BestYellow
			BestYellow, ThisScaleBestGems.YellowSocket[ItemLevel] = PawnFindBestGems(ScaleName, GemData, false, true, false)
			ThisScaleBestGems.YellowSocketValue[ItemLevel] = BestYellow

			local BestBlue
			BestBlue, ThisScaleBestGems.BlueSocket[ItemLevel] = PawnFindBestGems(ScaleName, GemData, false, false, true)
			ThisScaleBestGems.BlueSocketValue[ItemLevel] = BestBlue
		end
	end

	-- Now the meta gems.
	if not VgerCore.IsClassic and not VgerCore.IsMainline then
		for _, QualityLevelData in pairs(PawnMetaGemQualityLevels) do
			local ItemLevel = QualityLevelData[1]
			local GemData = QualityLevelData[2]

			if PawnCommon.Debug then
				VgerCore.Message("")
				VgerCore.Message("META GEMS FOR ITEM LEVEL " .. tostring(ItemLevel))
				VgerCore.Message("")
			end

			local BestMeta
			BestMeta, ThisScaleBestGems.MetaSocket[ItemLevel] = PawnFindBestGems(ScaleName, GemData)
			ThisScaleBestGems.MetaSocketValue[ItemLevel] = BestMeta
		end
	end

end

-- Recreates the tooltip annotation format strings.
function PawnRecreateAnnotationFormats()
	-- REVIEW: When the number of digits is set to 0, we should use commas (PawnLocal.ThousandsSeparator) instead
	-- of a format string.  (These would have to be functions instead of just a format string.)
	PawnNoValueAnnotationFormat = "%s%s:"
	PawnUnenchantedAnnotationFormat = PawnNoValueAnnotationFormat .. "  %." .. PawnCommon.Digits .. "f"
	PawnEnchantedAnnotationFormat = PawnUnenchantedAnnotationFormat .. "  %s(%." .. PawnCommon.Digits .. "f " .. PawnLocal.BaseValueWord .. ")"
end

local function PawnCheckItemTypeCore(ItemLink, AllowEquippable, AllowStatGems, AllowRelics)
	local _, _, _, InvType, _, ItemClassID, ItemSubClassID = GetItemInfoInstant(ItemLink)
	if (InvType == nil or InvType == "") then
		-- If the item isn't equippable don't bother parsing it, unless it's a gem or relic.
		return
			(AllowStatGems and ItemClassID == LE_ITEM_CLASS_GEM and ItemSubClassID ~= LE_ITEM_GEM_ARTIFACTRELIC) or
			(AllowRelics and ItemClassID == LE_ITEM_CLASS_GEM and ItemSubClassID == LE_ITEM_GEM_ARTIFACTRELIC)
	elseif ((not VgerCore.RangedSlotExists) and (InvType == "INVTYPE_RELIC" or InvType == "INVTYPE_THROWN")) or InvType == "INVTYPE_TABARD" or InvType == "INVTYPE_BAG" or InvType == "INVTYPE_BODY" then
		-- Old (grey, pre-artifact) relics might have sockets and therefore "stats" but they aren't equippable anymore so they shouldn't get values, so just bail out now.
		-- Thrown items, tabards, bags, and shirts (invtype_body) can also never have stats.
		return false
	end
	-- Otherwise, this is an equippable item.
	return AllowEquippable
end

function PawnCanItemHaveStats(ItemLink)
	return PawnCheckItemTypeCore(ItemLink, true, true, false) -- filter for equippable items and stat gems
end

function PawnCanItemBeArtifactUpgrade(ItemLink)
	return PawnCheckItemTypeCore(ItemLink, false, false, true) -- filter for relics only
end

function PawnCanItemHaveUpgradeArrow(ItemLink)
	return PawnCheckItemTypeCore(ItemLink, true, true, true)
end

-- Gets the item data for a specific item link.  Retrieves the information from the cache when possible; otherwise, it gets fresh information.
-- Return value type is the same as PawnGetCachedItem.
function PawnGetItemData(ItemLink)
	if not ItemLink then return end

	-- Only item links are supported; other links are not.
	if PawnGetHyperlinkType(ItemLink) ~= "item" then return end

	if PawnCommon.DebugCache then
		VgerCore.Message("  Getting item data for " .. ItemLink)
		VgerCore.Message("    because: " .. debugstack(2, 1, 0))
	end

	-- If this type of item can't ever have stats (food, for example), just bail out.
	-- We don't use this codepath in the case of artifact relics.
	if not PawnCanItemHaveStats(ItemLink) then return end

	-- If we have an item link, we can extract basic data from it from the user's WoW cache (not the Pawn item cache).
	-- We get a new, normalized version of ItemLink so that items don't end up in the cache multiple times if they're requested
	-- using different styles of links that all point to the same item.
	local ItemID, _, _, InvType, ItemTexture = GetItemInfoInstant(ItemLink)
	local ItemName, NewItemLink, ItemRarity, ItemLevel = GetItemInfo(ItemLink)
	if NewItemLink then
		ItemLink = NewItemLink
	else
		-- We didn't get a new item link.  This is almost certainly because the item is not in the user's local WoW cache.
		-- REVIEW: In the future, would it be possible to detect this case, and then poll the tooltip until item information
		-- comes back, and THEN parse and annotate it?  There's also an OnTooltipSetItem event, and also an Item mixin.
	end

	-- Now, with that information, we can look up the item in the Pawn item cache.
	local CachedItem = PawnGetCachedItem(ItemLink, ItemName)
	if not CachedItem and not NewItemLink then
		-- The item isn't in the user's WoW cache or Pawn cache.  Bail out now.
		if PawnCommon.DebugCache then VgerCore.Message("Pawn debug cache: PawnGetItemData is bailing out because it didn't get item data in time for " .. ItemLink) end
		return
	end
	if CachedItem and CachedItem.Values then
		if VgerCore.IsMainline then
			return CachedItem
		end
	end
	-- If Item is non-null but Item.Values is null, we're not done yet!
	local Item
	if VgerCore.IsMainline then
		Item = CachedItem
	end
	-- On Classic versions, we don't know for sure yet if our cached item is workable: it might have had incomplete data. We'll continue as if we didn't find anything in the
	-- cache, and then only count it as a valid cache hit if the item tooltip had the correct number of lines.

	-- If we don't have a cached item at all, that means we have to load a tooltip and parse it.
	if not Item then
		Item = PawnGetEmptyCachedItem(ItemLink, ItemName)
		Item.Rarity = ItemRarity
		Item.Level = GetDetailedItemLevelInfo(ItemLink) or ItemLevel -- The level from GetItemInfo doesn't take into effect upgrades or heirloom scaling
		Item.ID = ItemID
		if InvType ~= "" then Item.InvType = InvType end
		Item.Texture = ItemTexture
		if PawnCommon.Debug then
			PawnDebugMessage(" ")
			PawnDebugMessage("====================")
			local IDs = PawnGetItemIDsForDisplay(ItemLink)
			if IDs then
				PawnDebugMessage(ItemLink .. VgerCore.Color.Green .. " (" .. tostring(IDs) .. VgerCore.Color.Green .. ")")
			else
				PawnDebugMessage(ItemLink)
			end
		end

		-- First the enchanted stats.
		Item.Stats, Item.SocketBonusStats, Item.UnknownLines, Item.PrettyLink = PawnGetStatsFromTooltipWithMethod(PawnPrivateTooltipName, true, "SetHyperlink", Item.Link)
		Item.NumLines = (_G[PawnPrivateTooltipName]):NumLines()
		if CachedItem then
			-- Okay, we had already found this item in the cache, but we didn't know at the time if the cached version of the item is reliable. We'll consider it as reliable if the tooltip
			-- now has the same number of lines as it did last time.
			if Item.NumLines == CachedItem.NumLines then
				if PawnCommon.DebugCache then
					VgerCore.Message(VgerCore.Color.Green .. "    Cached item and this tooltip both had " .. Item.NumLines .. " lines, so using cached item")
				end
				if CachedItem.Values then
					return CachedItem
				end
			else
				-- The item in the cache has a different number of lines than this new item, so remove the old item from the cache, and then we'll add the new one later.
				PawnUncacheItem(CachedItem)
				if PawnCommon.DebugCache then
					VgerCore.Message(VgerCore.Color.Salmon .. "    Tooltip has " .. Item.NumLines .. " lines but cached line had " .. CachedItem.NumLines .. ", so removing old item from cache")
				end
			end
		else
			if PawnCommon.DebugCache then
				VgerCore.Message("    Tooltip has " .. Item.NumLines .. " lines")
			end
		end

		if (not VgerCore.RangedSlotExists) and (InvType == "INVTYPE_RANGED" or InvType == "INVTYPE_RANGEDRIGHT") then
			-- We convert ranged weapons into the correct "handedness" of weapons since there's no ranged slot anymore.
			if Item.Stats and Item.Stats.IsWand then
				InvType = "INVTYPE_WEAPONMAINHAND"
			else
				InvType = "INVTYPE_2HWEAPON"
			end
			Item.InvType = InvType
		elseif InvType == "INVTYPE_ROBE" then
			-- Robes are just really long chest armor.
			InvType = "INVTYPE_CHEST"
			Item.InvType = InvType
		end

		-- Then, the unenchanted stats.  But, we only need to do this if the item is enchanted or socketed.  PawnUnenchantItemLink
		-- will return nil if the item isn't enchanted, so we can skip that process.
		local UnenchantedItemLink = PawnUnenchantItemLink(ItemLink)
		-- As of WoW 6.2.3, Item.Level is incorrect for upgraded items because GetItemInfo returns the wrong value.  PawnUnenchantItemLink could
		-- be enhanced here to get a number to add (+10) for upgradeable items if we decide we need that info.
		if UnenchantedItemLink then
			PawnDebugMessage(" ")
			PawnDebugMessage(PawnLocal.UnenchantedStatsHeader)
			--if PawnCommon.Debug then VgerCore.Message("  Base item link: " .. tostring(PawnEscapeString(UnenchantedItemLink))) end
			Item.UnenchantedStats, Item.UnenchantedSocketBonusStats = PawnGetStatsForItemLink(UnenchantedItemLink, true)
			if not Item.UnenchantedStats then
				PawnDebugMessage(PawnLocal.FailedToGetUnenchantedItemMessage)
			end
		else
			-- If there was no unenchanted item link, then it's because the original item was not
			-- enchanted.  So, the unenchanted item is the enchanted item; copy the stats over.
			-- (Don't just copy the reference, because then changes to one stat table would also
			-- change the other!)
			local TableCopy = {}
			local StatName
			if Item.Stats then
				for StatName, Value in pairs(Item.Stats) do
					TableCopy[StatName] = Value
				end
			end
			Item.UnenchantedStats = TableCopy
			TableCopy = {}
			if Item.SocketBonusStats then
				for StatName, Value in pairs(Item.SocketBonusStats) do
					TableCopy[StatName] = Value
				end
			end
			Item.UnenchantedSocketBonusStats = TableCopy
		end

		-- MetaSocketEffect is special: if it's present in the unenchanted version of an item it should appear
		-- in the enchanted version too, if the enchanted version's socket is full.
		if Item.UnenchantedStats and Item.Stats and Item.UnenchantedStats.MetaSocketEffect and not Item.Stats.MetaSocketEffect and not Item.Stats.MetaSocket then
			PawnDebugMessage("")
			PawnDebugMessage("Copying meta socket effect (" .. Item.UnenchantedStats.MetaSocketEffect .. ") from base to current.")
			Item.Stats.MetaSocketEffect = Item.UnenchantedStats.MetaSocketEffect
		end

		-- Enchanted items should not get points for empty sockets, nor do they get socket bonuses if there are any empty sockets.
		if Item.Stats and (Item.Stats.PrismaticSocket or Item.Stats.RedSocket or Item.Stats.YellowSocket or Item.Stats.BlueSocket or Item.Stats.MetaSocket) then
			PawnDebugMessage("")
			PawnDebugMessage("Counting empty sockets as 0 for current value.")
			Item.SocketBonusStats = {}
			Item.Stats.PrismaticSocket = nil
			Item.Stats.RedSocket = nil
			Item.Stats.YellowSocket = nil
			Item.Stats.BlueSocket = nil
			if Item.Stats.MetaSocket then
				Item.Stats.MetaSocket = nil
				Item.Stats.MetaSocketEffect = nil
			end
		end

		-- If the item doesn't have any stats, don't cache it.  This is done to work around a problem a few people were seeing where
		-- Pawn would get item data, then fail to get it, and then cache the results anyway.  This is a pretty crappy solution, but
		-- hopefully it works until something better can be found.  It's not as bad now that Pawn doesn't bother scanning tooltips for
		-- items that can never have stats, like food and junk.
		if Item.UnenchantedStats == nil or next(Item.UnenchantedStats) == nil then
			if PawnCommon.DebugCache then
				-- You should only see this on purely cosmetic equippable items, like stuff from Griftah, holiday gear, and and few particularly
				-- odd trinkets.
				VgerCore.Message("Not caching because the item didn't have any stats: " .. tostring(ItemLink))
			end
			return
		end

		-- Fix a bug where in Spanish, off-hand holdable items are getting treated as off-hand weapons because they're translated the same.
		if Item.InvType == "INVTYPE_HOLDABLE" then
			if Item.Stats then
				Item.Stats.IsOffHand = nil
				Item.Stats.IsFrill = 1
			end
			if Item.UnenchantedStats then
				Item.UnenchantedStats.IsOffHand = nil
				Item.UnenchantedStats.IsFrill = 1
			end
		end

		-- Determine if this item could ever be equipped by this class.
		Item.CanEquip = true
		local StatName
		local _, _, ClassID = UnitClass("player")
		for _, StatName in pairs(PawnNeverUsableStats[ClassID]) do
			if Item.Stats[StatName] then
				Item.CanEquip = false
				break
			end
		end

		-- Cache this item so we don't have to re-parse next time.
		PawnCacheItem(Item)
	end -- if item isn't cached

	-- Recalculate the scale values for the item only if necessary.
	PawnRecalculateItemValuesIfNecessary(Item)

	return Item
end

-- Gets the item data for a gem, given a table of gem data from Gems.lua.
-- This function does not add gem details to the Pawn item cache.
-- Return value type is the same as PawnGetCachedItem.
function PawnGetGemData(GemData)
	-- If we've already called this function for this gem, keep the stored data.
	if GemData.Item then return GemData.Item end

	local ItemID = GemData.ID
	local ItemName, ItemLink, ItemRarity, ItemLevel, _, _, _, _, _, ItemTexture = GetItemInfo(ItemID)
	if ItemLink == nil or ItemName == nil then
		-- If the gem doesn't exist in the user's local cache, we'll have to fake up some info for it.
		ItemLink = format(PawnLocal.GenericGemLink, ItemID, ItemID)
		ItemName = format(PawnLocal.GenericGemName, ItemID)
	end
	local Item = PawnGetEmptyCachedItem(ItemLink, ItemName)
	Item.ID = ItemID
	Item.Rarity = ItemRarity
	Item.Level = GetDetailedItemLevelInfo(ItemLink) or ItemLevel
	Item.Texture = ItemTexture
	Item.UnenchantedStats = GemData.Stats or { }
	PawnRecalculateItemValuesIfNecessary(Item, true) -- Ignore the user's normalization factor when determining these gem values.

	-- Save this value for next time.
	GemData.Item = Item
	return Item
end

function PawnGetItemLinkFromTooltip(TooltipName, MethodName, Param1, ...)
	VgerCore.Assert(TooltipName, "TooltipName must be non-null!")
	VgerCore.Assert(MethodName, "MethodName must be non-null!")
	if (not TooltipName) or (not MethodName) then return end

	-- First, find the tooltip.
	local Tooltip = _G[TooltipName]
	if not Tooltip then return end

	-- If we have a tooltip, try to get an item link from it.
	local ItemLink, _
	if (MethodName == "SetHyperlink") and Param1 then
		-- Special case: if the method is SetHyperlink, then we already have an item link.
		-- (Normally, GetItem will work, but SetHyperlink is used by some mod compatibility code.)
		ItemLink = Param1
	elseif Tooltip.GetItem then
		_, ItemLink = Tooltip:GetItem()
	end

	return ItemLink
end

-- Gets the item data for a specific item.  Retrieves the information from the cache when possible; otherwise, gets it from the tooltip specified.  Only use this if you don't have an item link; otherwise use PawnGetItemData(ItemLink).
-- Return value type is the same as PawnGetCachedItem.
function PawnGetItemDataFromTooltip(TooltipName, MethodName, Param1, ...)
	local ItemName, ItemNameLineNumber = PawnGetItemNameFromTooltip(TooltipName)
	if (not ItemName) or (not ItemNameLineNumber) then return end
	local Tooltip = _G[TooltipName]
	local ItemNumLines = Tooltip:NumLines()
	local ItemLink = PawnGetItemLinkFromTooltip(TooltipName, MethodName, Param1, ...)
	local Item = PawnGetCachedItem(ItemLink, ItemName, ItemNumLines)
	if Item and Item.Values then
		return Item
	end
	-- If Item is non-null but Item.Values is null, we're not done yet!

	-- Ugh, the tooltip doesn't have item information and this item isn't in the Pawn item cache, so we'll have to try to parse this tooltip.
	if not Item then
		Item = PawnGetEmptyCachedItem(ItemLink, ItemName, ItemNumLines)
		PawnDebugMessage(" ")
		PawnDebugMessage("====================")
		PawnDebugMessage(VgerCore.Color.Green .. ItemName)

		-- Since we don't have an item link, we have to just read stats from the original tooltip, so we only get enchanted values.
		PawnFixStupidTooltipFormatting(TooltipName)
		Item.Stats, Item.SocketBonusStats, Item.UnknownLines = PawnGetStatsFromTooltip(TooltipName, true)
		PawnDebugMessage(PawnLocal.FailedToGetItemLinkMessage)

		-- Cache this item so we don't have to re-parse next time.
		PawnCacheItem(Item)
	end

	-- Recalculate the scale values for the item only if necessary.
	PawnRecalculateItemValuesIfNecessary(Item)

	return Item
end

-- 	Returns: Item, SlotHadItem
-- 		Item: The same information as PawnGetItemData, but based on an inventory slot index instead of an item link.
--		SlotHadItem: true if the slot had an item in it, whether or not we were successful in getting item data.
-- If requested, data for the base unenchanted item can be returned instead; otherwise, the actual item is returned.
function PawnGetItemDataForInventorySlot(Slot, Unenchanted, UnitName)
	if UnitName == nil then UnitName = "player" end
	local ItemLink = GetInventoryItemLink(UnitName, Slot)
	if not ItemLink then return nil, false end
	if Unenchanted then
		local UnenchantedItem = PawnUnenchantItemLink(ItemLink)
		if UnenchantedItem then ItemLink = UnenchantedItem end
	end
	local Item = PawnGetItemData(ItemLink)

	-- Workaround for game bug with artifact off-hands
	if Slot == INVSLOT_OFFHAND and Item and Item.Rarity == 6 then
		local MainHandLink = GetInventoryItemLink("player", INVSLOT_MAINHAND)
		if MainHandLink then
			Item.Level = GetDetailedItemLevelInfo(MainHandLink) or Item.Level
		end
	end

	return Item, true
end

-- Recalculates the scale values for a cached item if necessary, and returns them.
--	 Parameters: Item, NoNormalization
--		Item: The item to update.
--		NoNormalization: If true, ignores the user's normalization factor.
-- 	Returns: Values
--		Values: The item's table of item values.  Only includes enabled scales with nonzero values.
function PawnRecalculateItemValuesIfNecessary(Item, NoNormalization)
	-- We now have stats for the item.  If values aren't already calculated for the item, calculate those.  This happens when we have
	-- just retrieved the stats for the item, and also when the item values were cleared from the cache but not the stats.
	if not Item.Values then
		-- Calculate each of the values for which there are scales.
		Item.Values = PawnGetAllItemValues(Item.Stats, Item.Level, Item.SocketBonusStats, Item.UnenchantedStats, Item.UnenchantedSocketBonusStats, true, NoNormalization)

		PawnDebugMessage(" ")
	end

	return Item.Values
end

-- Returns a single scale value (in both its enchanted and unenchanted forms) for a cached item.  Returns nil for any values that are not present.
function PawnGetSingleValueFromItem(Item, ScaleName)
	if PawnIsScaleVisible(ScaleName) then
		-- If they've enabled this scale, its value should already be calculated.
		local ValuesTable = PawnRecalculateItemValuesIfNecessary(Item)
		if not ValuesTable then return end

		-- The scale values are sorted alphabetically, so we need to go through the list.
		local Count = #ValuesTable
		for i = 1, Count do
			local Value = ValuesTable[i]
			if Value[1] == ScaleName then
				return Value[2], Value[3]
			end
		end

		-- If we didn't find a value, it's because this item doesn't have a value for this scale.
		return 0, 0
	end

	-- If this scale isn't enabled, just calculate it as a one-off.
	local Value, UnenchantedValue
	Value = PawnGetItemValue(Item.Stats, Item.Level, Item.SocketBonusStats, ScaleName, false, false)
	UnenchantedValue = PawnGetItemValue(Item.UnenchantedStats, Item.Level, Item.UnenchantedSocketBonusStats, ScaleName, false, false)
	return Value, UnenchantedValue
end

local ItemLevelSearchPattern1 = gsub(ITEM_LEVEL, "%%d", "(%%d+)")
local ItemLevelSearchPattern2 = gsub(ITEM_LEVEL_PLUS, "%%d%+", "(%%d+)%%+")

local TooltipUpdateCounter = 0

-- Updates a specific tooltip.
function PawnUpdateTooltip(TooltipName, MethodName, Param1, ...)
	if not PawnCommon.Scales then return end

	local Tooltip = _G[TooltipName]
	if not Tooltip then
		VgerCore.Fail("Where'd the tooltip go?  I seem to have misplaced it.")
		return
	end

	-- Start by getting the item link.
	local ItemLink = PawnGetItemLinkFromTooltip(TooltipName, MethodName, Param1, ...)

	if PawnCommon.DebugCache then
		TooltipUpdateCounter = TooltipUpdateCounter + 1
		VgerCore.Message("==========")
		VgerCore.Message("[" .. TooltipUpdateCounter .. "] Updating " .. TooltipName .. " (" .. Tooltip:NumLines() .. " lines): " .. (ItemLink or "(no item link)"))
	end

	-- Then get the item or relic data.
	local Item, IsRelic
	if ItemLink then
		if PawnCanItemBeArtifactUpgrade(ItemLink) then
			-- This is a relic item, so we just get upgrade info directly.
			IsRelic = true
		else
			-- This is the normal case: a normal item for which we have an item link.
			Item = PawnGetItemData(ItemLink)
		end
	else
		-- If there was no item link, try the degenerate case of trying to read directly from the tooltip instead of using our special parsing tooltip.
		Item = PawnGetItemDataFromTooltip(TooltipName, MethodName, Param1, ...)
	end

	-- If there's no item data, then something failed, so we can't update this tooltip, except to show item IDs.
	local TooltipWasUpdated, UpgradeInfo, ItemLevelIncrease, BestItemFor, SecondBestItemFor, NeedsEnhancements

	if Item then
		-- If this is a regular item, do the regular calculations to see if it's an upgrade.
		if PawnCommon.ShowUpgradesOnTooltips then UpgradeInfo, ItemLevelIncrease, BestItemFor, SecondBestItemFor, NeedsEnhancements = PawnIsItemAnUpgrade(Item) end

		-- If this is the main GameTooltip, remember the item that was hovered over.
		-- AtlasLoot compatibility: enable hover comparison for AtlasLoot tooltips too.
		if ItemLink and TooltipName == "GameTooltip" or TooltipName == "AtlasLootTooltip" or TooltipName == "GameTooltipTooltip" then -- "TooltipTooltip" isn't a typo; it's an embedded tooltip
			PawnLastHoveredItem = Item.Link
		end
	elseif IsRelic then
		-- If this is a relic, we use a special relic-only codepath for this.
		if not PawnIsHoveringSocketedRelic then
			if PawnCommon.ShowRelicUpgrades then UpgradeInfo = PawnGetRelicUpgradeInfo(ItemLink) end
		end
	end

	-- If necessary, add a blank line to the tooltip.
	if
		(Item and not PawnCommon.ShowValuesForUpgradesOnly and Item.Values and #Item.Values > 0) or
		(Item and PawnCommon.ShowUpgradesOnTooltips and (UpgradeInfo or BestItemFor or SecondBestItemFor))
	then
		Tooltip:AddLine(" ")
	end

	local Annotated, TooltipWasUpdated

	if Item then
		-- Add the scale values and upgrade info to the tooltip.
		PawnAddValuesToTooltip(Tooltip, Item.Values, UpgradeInfo, BestItemFor, SecondBestItemFor, NeedsEnhancements, Item.InvType)

		local Annotated
		if Item.UnknownLines and Item.Values and #Item.Values > 0 then
			Annotated = PawnAnnotateTooltipLines(TooltipName, Item.UnknownLines)
		end

		-- Add the item level info to the tooltip.
		if ItemLevelIncrease and PawnCommon.ShowItemLevelUpgrades then
			-- Find which line of the tooltip (2-4) contains the text "Item Level" and annotate that.
			local i, AnnotatedItemLevel
			for i = 2, 5 do
				local LeftLine = _G[TooltipName .. "TextLeft" .. i]
				if LeftLine then
					local LeftLineText = LeftLine:GetText()
					if LeftLineText and LeftLineText ~= "" and (strfind(LeftLineText, ItemLevelSearchPattern1) or strfind(LeftLineText, ItemLevelSearchPattern2)) then
						-- This is the line.  Add an arrow to the end.
						AnnotatedItemLevel = true
						LeftLine:SetText(LeftLineText .. "  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+" .. ItemLevelIncrease)
					end
				end
			end
			if not AnnotatedItemLevel then
				-- If it wasn't in the tooltip (for example, on Classic), just add it to the bottom.
				PawnAddTooltipLine(Tooltip, PawnLocal.ItemLevelTooltipLine .. ":  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+" .. ItemLevelIncrease, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB)
			end
			TooltipWasUpdated = true
		end

		TooltipWasUpdated = true
	elseif IsRelic then
		-- Add relic upgrade info to the tooltip.
		PawnAddRelicUpgradesToTooltip(TooltipName, UpgradeInfo)
		TooltipWasUpdated = true
	end

	-- Color or reset the tooltip border as necessary.
	if PawnCommon.ColorTooltipBorder then
		if UpgradeInfo or (ItemLevelIncrease and PawnCommon.ShowItemLevelUpgrades) then PawnSetTooltipBorderColor(Tooltip, 0, 1, 0) else PawnSetTooltipBorderColor(Tooltip, 1, 1, 1) end
	end

	-- Add the item ID to the tooltip if known.
	if PawnCommon.ShowItemID and ItemLink then
		local IDs = PawnGetItemIDsForDisplay(ItemLink)
		if IDs then
			PawnAddTooltipLine(Tooltip, PawnLocal.ItemIDTooltipLine .. ":  " .. IDs, VgerCore.Color.OrangeR, VgerCore.Color.OrangeG, VgerCore.Color.OrangeB)
			TooltipWasUpdated = true
		end
	end

	if PawnCommon.DebugCache then
		PawnAddTooltipLine(Tooltip, "[Pawn update #" .. TooltipUpdateCounter .. "]", VgerCore.Color.BlueR, VgerCore.Color.BlueG, VgerCore.Color.BlueB)
	end

	-- Show the updated tooltip.
	if TooltipWasUpdated then Tooltip:Show() end

	if Item and PawnCommon.DebugDoubleTooltips and TooltipName == "GameTooltip" then
		VgerCore.Message("===== Annotating " .. TooltipName .. " for " .. tostring(Item.Name) .. ": =====")
		VgerCore.Message(debugstack(5))
	end
end

-- A wrapper for Tooltip:SetBackdropBorderColor that continues to work in WoW 9.1.5+.
function PawnSetTooltipBorderColor(Tooltip, r, g, b, a)
	if a == nil then a = 1 end
	if Tooltip.SetBackdropBorderColor then
		Tooltip:SetBackdropBorderColor(r, g, b, a)
	elseif Tooltip.NineSlice.TopEdge then
		-- Seems like this SHOULD work:
		-- Tooltip.NineSlice:SetBorderColor(r, g, b, a)
		-- ...but for some reason it doesn't (in the 9.1.5 PTR), so just do it manually for now.
		Tooltip.NineSlice.TopLeftCorner:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.TopRightCorner:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.BottomLeftCorner:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.BottomRightCorner:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.TopEdge:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.BottomEdge:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.LeftEdge:SetVertexColor(r, g, b, a)
		Tooltip.NineSlice.RightEdge:SetVertexColor(r, g, b, a)
	else
		VgerCore.Fail("Pawn doesn't know how to change tooltip border colors in this version of WoW.")
	end
end

-- Returns a sorted list of all scale values for an item (and its unenchanted version, if supplied).
-- Parameters:
-- 	Item: A table of item stats in the format returned by GetStatsFromTooltip.
--	ItemLevel: The item's level.
-- 	SocketBonus: A table of socket bonus values in the format returned by GetStatsFromTooltip.
-- 	UnenchantedItem: A table of unenchanted item values in the format returned by GetStatsFromTooltip.
-- 	UnenchantedItemSocketBonus: A table of unenchanted item socket bonuses in the format returned by GetStatsFromTooltip.
--	DebugMessages: If true, debug messages will be printed.
--	NoNormalization: If true, the user's normalization factor will be ignored.
-- Return value: ItemValues
-- 	ItemValues: A sorted table of scale values in the following format: { {"Scale 1", 100, 90, ...}, {"\"Provider\":Scale2", 200, 175, ...} }.
--	Values for scales that are not currently enabled are not included.
function PawnGetAllItemValues(Item, ItemLevel, SocketBonus, UnenchantedItem, UnenchantedItemSocketBonus, DebugMessages, NoNormalization)
	local ItemValues = {}
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		local ShowScale = PawnIsScaleVisible(ScaleName)
		if ShowScale then -- Skip all disabled scales.  PawnGetSingleValueFromItem will calculate them on-demand if necessary.
			if ShowScale and DebugMessages then
				PawnDebugMessage(" ")
				PawnDebugMessage(PawnGetScaleLocalizedName(ScaleName) .. " --------------------")
			end
			local Value
			local UnenchantedValue
			if UnenchantedItem then
				UnenchantedValue = PawnGetItemValue(UnenchantedItem, ItemLevel, UnenchantedItemSocketBonus, ScaleName, ShowScale and DebugMessages, NoNormalization)
			end
			if Item then
				if ShowScale and DebugMessages and PawnCommon.ShowEnchanted then
					PawnDebugMessage(" ")
					PawnDebugMessage(PawnLocal.EnchantedStatsHeader)
				end
				Value = PawnGetItemValue(Item, ItemLevel, SocketBonus, ScaleName, ShowScale and DebugMessages and PawnCommon.ShowEnchanted, NoNormalization)
			end

			-- Add these values to the table.
			if Value == nil then Value = 0 end
			if UnenchantedValue == nil then UnenchantedValue = 0 end
			if Value > 0 or UnenchantedValue > 0 then
				tinsert(ItemValues, {ScaleName, Value, UnenchantedValue, PawnGetScaleLocalizedName(ScaleName)})
			end
		end
	end

	-- Sort the table, then return it.
	sort(ItemValues, PawnItemValueCompare)
	return ItemValues
end

-- Adds an array of item values to a tooltip, handling formatting options.
-- Parameters: Tooltip, ItemValues, UpgradeInfo, BestItemFor, SecondBestItemFor, InvType, OnlyFirstValue
-- 	Tooltip: The tooltip to annotate.  (Not a name.)
-- 	ItemValues: An array of item values to use to annotate the tooltip, in the format returned by PawnGetAllItemValues.
--	UpgradeInfo: An array of item upgrade information, in the format returned by PawnIsItemAnUpgrade.
--	BestItemFor, SecondBestItemFor: A table of scales for which this is the best or second-best item available, in the format returned by PawnIsItemAnUpgrade.
-- 	NeedsEnhancements: True if the item needs enhancements.
--	InvType: Optionally, the type of item this is.
--	OnlyFirstValue: If true, only the first value (the "enchanted" one) is used, regardless of the user's settings.
function PawnAddValuesToTooltip(Tooltip, ItemValues, UpgradeInfo, BestItemFor, SecondBestItemFor, NeedsEnhancements, InvType, OnlyFirstValue)
	-- First, check input arguments.
	if type(Tooltip) ~= "table" then
		VgerCore.Fail("Tooltip must be a valid tooltip, not '" .. type(Tooltip) .. "'.")
		return
	end
	if not ItemValues then return end

	-- Loop through all of the item value subtables.
	local _, _, ClassID = UnitClass("player")
	local Entry, _
	for _, Entry in pairs(ItemValues) do
		local ScaleName, Value, UnenchantedValue, LocalizedName = Entry[1], Entry[2], Entry[3], Entry[4]
		local Scale = PawnCommon.Scales[ScaleName]
		VgerCore.Assert(Scale ~= nil, "Scale name in item value list doesn't exist!")

		if PawnIsScaleVisible(ScaleName) then
			-- Ignore values that we don't want to display.
			if OnlyFirstValue then
				UnenchantedValue = 0
			else
				if not PawnCommon.ShowEnchanted then Value = 0 end
			end

			-- Override the localized name if the scale was designed for only the current class, and it's not a user scale.
			if Scale.ClassID == ClassID and Scale.SpecID and Scale.Provider then
				local _, LocalizedSpecName = PawnGetSpecializationInfoForClassID(ClassID, Scale.SpecID)
				LocalizedName = LocalizedSpecName
			end
			-- Add the spec icon if present, and if that feature isn't disabled.
			if PawnCommon.ShowSpecIcons and Scale.IconTexturePath then
				LocalizedName = "|T" .. Scale.IconTexturePath .. ":0|t " .. LocalizedName
			end

			local TooltipText = nil
			local TextColor = PawnGetScaleColor(ScaleName)
			local UnenchantedTextColor = PawnGetScaleColor(ScaleName, true)

			if PawnCommon.ShowValuesForUpgradesOnly then
				TooltipText = format(PawnNoValueAnnotationFormat, TextColor, LocalizedName)
			elseif Value and Value > 0 and UnenchantedValue and UnenchantedValue > 0 and math.abs(Value - UnenchantedValue) >= ((10 ^ -PawnCommon.Digits) / 2) then
				TooltipText = format(PawnEnchantedAnnotationFormat, TextColor, LocalizedName, tostring(Value), UnenchantedTextColor, tostring(UnenchantedValue))
			elseif Value and Value > 0 then
				TooltipText = format(PawnUnenchantedAnnotationFormat, TextColor, LocalizedName, tostring(Value))
			elseif UnenchantedValue and UnenchantedValue > 0 then
				TooltipText = format(PawnUnenchantedAnnotationFormat, TextColor, LocalizedName, tostring(UnenchantedValue))
			end

			-- Add info to the tooltip if this item is an upgrade or best-in-slot.
			if TooltipText then
				local ThisUpgrade, _
				WasUpgradeOrBest = false
				if UpgradeInfo then
					for _, ThisUpgrade in pairs(UpgradeInfo) do
						if ThisUpgrade.ScaleName == ScaleName then
							if ThisUpgrade.PercentUpgrade >= PawnBigUpgradeThreshold then -- 100 = 10,000%
								-- For particularly huge upgrades, don't say ridiculous things like "999999999% upgrade"
								TooltipText = format(PawnLocal.TooltipBigUpgradeAnnotation, TooltipText, "")
							elseif NeedsEnhancements then
								TooltipText = format(PawnLocal.TooltipUpgradeNeedsEnhancementsAnnotation, TooltipText, 100 * ThisUpgrade.PercentUpgrade, "")
							else
								TooltipText = format(PawnLocal.TooltipUpgradeAnnotation, TooltipText, 100 * ThisUpgrade.PercentUpgrade, "")
							end
							WasUpgradeOrBest = true
							break
						end
					end
				elseif BestItemFor and BestItemFor[ScaleName] then
					WasUpgradeOrBest = true
					if PawnCommon.ShowValuesForUpgradesOnly then
						TooltipText = format(PawnLocal.TooltipBestAnnotationSimple, TooltipText)
					else
						TooltipText = format(PawnLocal.TooltipBestAnnotation, TooltipText)
					end
				elseif SecondBestItemFor and SecondBestItemFor[ScaleName] then
					WasUpgradeOrBest = true
					if PawnCommon.ShowValuesForUpgradesOnly then
						TooltipText = format(PawnLocal.TooltipSecondBestAnnotationSimple, TooltipText)
					else
						TooltipText = format(PawnLocal.TooltipSecondBestAnnotation, TooltipText)
					end
				end
				if not WasUpgradeOrBest and PawnCommon.ShowValuesForUpgradesOnly then TooltipText = nil end

				PawnAddTooltipLine(Tooltip, TooltipText)
			end
		end
	end

end

function PawnAddTooltipLine(Tooltip, Text, r, g, b)
	if not Text then return end
	VgerCore.Assert(Tooltip, "PawnAddTooltipLine: Tooltip must not be nil")

	-- This could be optimized a bit, but it's not incredibly necessary.
	if PawnCommon.AlignNumbersRight then
		local Pos = VgerCore.StringFindReverse(Text, ": ") -- search for a colon followed by a space so we don't get texture escape sequences
		local Left = strsub(Text, 0, Pos - 1) -- ignore the colon
		local Right = strsub(Text, 0, 10) .. strsub(Text, Pos + 3) -- add the color string and ignore the spaces following the colon
		Tooltip:AddDoubleLine(Left, Right, r, g, b)
	else
		Tooltip:AddLine(Text, r, g, b)
	end
end

-- Returns the total scale values of all equipped items.  Only counts enchanted values.  Returns nil if item information
-- is unavailable for any item currently equipped.
-- Parameters: UnitName
--		UnitName: The name of the unit from whom the inventory item should be retrieved.  Defaults to "player".
-- Return value: ItemValues, Count, EpicItemLevel, AverageItemLevel
-- 		ItemValues: Same as PawnGetAllItemValues, or nil if unsuccessful.
--		Count: The number of item values calculated.
--		AverageItemLevel: An average item level for all equipped items.
function PawnGetInventoryItemValues(UnitName)
	local Total = {}
	local TotalItemLevel = 0
	local SlotStats
	local Slot
	local _
	local MainHandArtifactLevel
	for Slot = 1, 18 do
		if Slot ~= 4 then -- Skip slots 0, 4, and 19 (they're not gear).
			local ItemID = GetInventoryItemID(UnitName, Slot)
			local Item = PawnGetItemDataForInventorySlot(Slot, false, UnitName)
			if Item then
				ItemValues = PawnGetAllItemValues(Item.Stats, Item.Level, Item.SocketBonusStats)
				-- Add the item's level to our running total.  If it's a 2H weapon AND the off-hand slot is empty, double its value.
				-- (We can't assume that the off-hand is empty just because the main hand slot contains a 2H weapon... stupid
				-- Titan's Grip warriors.)
				local ThisItemLevel = Item.Level
				if not ThisItemLevel then
					-- If we have item information but no level, bail out rather than return inaccurate totals.
					return
				end
				if Slot == 16 then
					local _, _, _, _, _, _, _, _, InvType = GetItemInfo(GetInventoryItemLink(UnitName, Slot))
					if (InvType == "INVTYPE_2HWEAPON" or InvType == "INVTYPE_RANGED" or InvType == "INVTYPE_RANGEDRIGHT") and GetInventoryItemID(UnitName, 17) == nil then
						-- Some ranged weapons are now two-handed too.  If they're using a ranged weapon with no off-hand, count it as a two-hander.
						ThisItemLevel = ThisItemLevel * 2
					end
					if Item.Rarity == 6 then MainHandArtifactLevel = Item.Level end
				elseif Slot == 17 and MainHandArtifactLevel then
					-- If we're checking the off-hand slot and the main-hand slot contained an artifact, use that item level instead of
					-- what the game reports for the off-hand, because the off-hand appears as level 750 when inspecting someone, sigh.
					-- (Bug introduced in 7.0; still present as of 7.1.5.)
					ThisItemLevel = MainHandArtifactLevel
				end
				if ThisItemLevel then
					TotalItemLevel = TotalItemLevel + ThisItemLevel
				end
				-- Now, add these values to our running totals.
				for _, Entry in pairs(ItemValues) do
					local ScaleName, Value = Entry[1], Entry[2]
					PawnAddStatToTable(Total, ScaleName, Value) -- (not actually stats, but the function does what we want)
				end
			elseif Slot == 13 or Slot == 14 or (VgerCore.RangedSlotExists and Slot == 18) then
				-- Failures to get stats from trinkets is normal, so don't bail out.  See if we can get the item level in a simpler way.
				-- (Same with the relic slot in WoW Classic.)
				local ItemLink = GetInventoryItemLink(UnitName, Slot)
				if ItemLink then
					local ThisItemLevel = GetDetailedItemLevelInfo(ItemLink)
					if ThisItemLevel then
						TotalItemLevel = TotalItemLevel + ThisItemLevel
					end
				end
			elseif ItemID then
				-- If we have an item link but no item data, then the player HAS an item in that slot but we don't have data.
				-- So we should just bail out now to avoid reporting inaccurate totals.  BUT, we should go ahead and query for
				-- information on the other items before we do so that we have everything by the next time this is called.
				while Slot <= 18 do
					Item = PawnGetItemDataForInventorySlot(Slot, false, UnitName)
					Slot = Slot + 1
				end
				return
			end
		end
	end
	-- Once we're done, we need to convert our addition table to one that we can return.
	local TotalValues = {}
	local Count = 0
	for ScaleName, Value in pairs(Total) do
		tinsert(TotalValues, { ScaleName, Value, 0, PawnGetScaleLocalizedName(ScaleName) })
		Count = Count + 1
	end
	sort(TotalValues, PawnItemValueCompare)
	-- Return our totals.
	TotalItemLevel = math.floor(TotalItemLevel / (VgerCore.RangedSlotExists and 17 or 16) + .05)
	return TotalValues, Count, TotalItemLevel
end

-- Works around annoying inconsistencies in the way that Blizzard formats tooltip text.
-- Enchantments and random item properties ("of the whale") are formatted like this: "|cffffffff+15 Intellect|r\r\n".
-- We correct this here.
function PawnFixStupidTooltipFormatting(TooltipName)
	local Tooltip = _G[TooltipName]
	if not Tooltip then return end
	local i
	for i = 1, Tooltip:NumLines() do
		local LeftLine = _G[TooltipName .. "TextLeft" .. i]
		local Text = LeftLine:GetText()
		local Updated = false
		if Text and strfind(Text, "\n", 1, true) ~= 1 then
			-- First, look for a color.
			if strfind(Text, "|cffffffff", 1, true) == 1 then
				Text = strsub(Text, 11)
				LeftLine:SetTextColor(1, 1, 1)
				Updated = true
			end
			-- Then, look for a trailing \r\n, unless that's all that's left of the string.
			if (strlen(Text) > 2) and (strbyte(Text, -1) == 10) then
				Text = strsub(Text, 1, -4)
				Updated = true
			end
			-- Then, look for a trailing color restoration flag.
			if strfind(Text, "|r", strlen(Text) - 1, true) then
				Text = strsub(Text, 1, -3)
				Updated = true
			end
			-- Update the tooltip with the new string.
			if Updated then
				--VgerCore.Message("Old: [" .. PawnEscapeString(LeftLine:GetText()) .. "]")
				LeftLine:SetText(Text)
				--VgerCore.Message("New: [" .. PawnEscapeString(Text) .. "]")
			end
		end
	end
end

-- Calls a method on a tooltip and then returns stats from that tooltip.
-- Parameters: TooltipName, DebugMessages, Method
--		TooltipName: The name of the tooltip to use.
--		DebugMessages: If true, debug messages will be shown.
--		Method: The name of the method to call on the tooltip, followed optionally by arguments to that method.
-- Return value: Same as PawnGetStatsFromTooltip, or nil if unsuccessful.
function PawnGetStatsFromTooltipWithMethod(TooltipName, DebugMessages, MethodName, ...)
	if not TooltipName or not MethodName then
		VgerCore.Fail("PawnGetStatsFromTooltipWithMethod requires a valid tooltip name and method name.")
		return
	end
	local Tooltip = _G[TooltipName]
	Tooltip:ClearLines() -- Without ClearLines, sometimes SetHyperlink seems to fail when called rapidly
	if TooltipName == PawnPrivateTooltipName then
		-- Pawn 1.9.18: Curse user Bodar suggests reanchoring the tooltip to ensure that future updates work
		Tooltip:SetOwner(UIParent, "ANCHOR_NONE")
	end
	local Method = Tooltip[MethodName]
	Method(Tooltip, ...)
	PawnFixStupidTooltipFormatting(TooltipName)
	return PawnGetStatsFromTooltip(TooltipName, DebugMessages)
end

-- Reads the stats for a given item ID, eventually calling PawnGetStatsFromTooltip.
-- Parameters: ItemID, DebugMessages
--		ItemID: The item ID for which to get stats.
--		DebugMessages: If true, debug messages will be shown.
-- Return value: Same as PawnGetStatsFromTooltip, or nil if unsuccessful.
function PawnGetStatsForItemID(ItemID, DebugMessages)
	if not ItemID then
		VgerCore.Fail("PawnGetStatsForItemID requires a valid item ID.")
		return
	end
	return PawnGetStatsForItemLink("item:" .. ItemID, DebugMessages)
end

-- Reads the stats for a given item link, eventually calling PawnGetStatsFromTooltip.
-- Parameters: ItemLink, DebugMessages
--		ItemLink: The item link for which to get stats.
--		DebugMessages: If true, debug messages will be shown.
-- Return value: Same as PawnGetStatsFromTooltip, or nil if unsuccessful.
function PawnGetStatsForItemLink(ItemLink, DebugMessages)
	if not ItemLink then
		VgerCore.Fail("PawnGetStatsForItemLink requires a valid item link.")
		return
	end
	-- Other types of hyperlinks, such as enchant, quest, or spell are ignored by Pawn.
	if PawnGetHyperlinkType(ItemLink) ~= "item" then return end

	local Tooltip = _G[PawnPrivateTooltipName]
	Tooltip:ClearLines() -- Without this, sometimes SetHyperlink seems to fail when called rapidly
	Tooltip:SetHyperlink(ItemLink)
	PawnFixStupidTooltipFormatting(PawnPrivateTooltipName)
	return PawnGetStatsFromTooltip(PawnPrivateTooltipName, DebugMessages)
end

-- Returns the stats of an equipped item, eventually calling PawnGetStatsFromTooltip.
-- 	Parameters: Slot
-- 		Slot: The slot number (0-19).  If not looping through all slots, use GetInventorySlotInfo("HeadSlot") to get the number.
--		DebugMessages: If true, debug messages will be shown.
--		UnitName: The name of the unit from whom the inventory item should be retrieved.  Defaults to "player".
-- Return value: Same as PawnGetStatsFromTooltip, or nil if unsuccessful.
function PawnGetStatsForInventorySlot(Slot, DebugMessages, UnitName)
	if type(Slot) ~= "number" then
		VgerCore.Fail("PawnGetStatsForInventorySlot requires a valid slot number.  Did you mean to use GetInventorySlotInfo to get a number?")
		return
	end
	if not UnitName then UnitName = "player" end
	return PawnGetStatsFromTooltipWithMethod(PawnPrivateTooltipName, DebugMessages, "SetInventoryItem", UnitName, Slot)
end

-- Reads the stats from a tooltip.
-- Returns a table mapping stat name with a quantity of that statistic.
-- For example, ReturnValue["Strength"] = 12.
-- Parameters: TooltipName, DebugMessages
--		TooltipName: The tooltip to read.
--		DebugMessages: If true (default), debug messages will be shown.
-- Return value: Stats, SocketBonusStats, UnknownLines, PrettyLink
--		Stats: The table of stats for the item.
--		SocketBonusStats: The table of stats for the item's socket bonus.
--		UnknownLines: A list of lines in the tooltip that were not understood.
--		PrettyLink: A beautified item link, if available.
function PawnGetStatsFromTooltip(TooltipName, DebugMessages)
	local Tooltip = _G[TooltipName]
	if DebugMessages == nil then DebugMessages = true end

	-- Get the item name.  It could be on line 2 if the first line is "Currently Equipped".
	local ItemName, ItemNameLineNumber = PawnGetItemNameFromTooltip(TooltipName)
	if (not ItemName) or (not ItemNameLineNumber) then
		if PawnCommon.DebugCache then VgerCore.Message("Pawn debug cache: PawnGetStatsFromTooltip exiting because the item in " .. TooltipName .. " had no name") end
		return
	end

	-- Now, read the tooltip for stats.
	local Stats, SocketBonusStats, UnknownLines = {}, {}, {}
	local HadUnknown = false
	local ItemHasSocketBonus = false
	local SocketBonusIsValid = false
	local UnderstoodAnyLinesYet = false
	local LookForNBSP = GetLocale() == "frFR"

	for i = ItemNameLineNumber + 1, Tooltip:NumLines() do
		local LeftLine = _G[TooltipName .. "TextLeft" .. i]
		local LeftLineText = LeftLine:GetText()
		if not LeftLineText then break end

		-- Look for this line in the "kill lines" list.  If it's there, we're done.
		local IsKillLine = false
		-- Dirty, dirty hack for artifacts: check the color of the text; if it's artifact gold and it's not at the beginning of the tooltip, then treat it as a kill line.
		if i > ItemNameLineNumber + 2 and strfind(LeftLineText, "|cFFE6CC80", 1, true) == 1 then
			IsKillLine = true
		end
		if not IsKillLine then
			local ThisKillLine
			for _, ThisKillLine in pairs(PawnKillLines) do
				if strfind(LeftLineText, ThisKillLine) then
					-- This is a known ignored kill line; stop now.
					IsKillLine = true
					break
				end
			end
		end
		if IsKillLine then break end

		for Side = 1, 2 do
			local CurrentParseText, RegexTable, CurrentDebugMessages, IgnoreErrors
			if Side == 1 then
				CurrentParseText = LeftLineText
				RegexTable = PawnRegexes
				CurrentDebugMessages = DebugMessages
				IgnoreErrors = false
			else
				local RightLine = _G[TooltipName .. "TextRight" .. i]
				CurrentParseText = RightLine:GetText()
				if (not CurrentParseText) or (CurrentParseText == "") then break end
				RegexTable = PawnRightHandRegexes
				CurrentDebugMessages = false
				IgnoreErrors = true
			end

			-- Just for French: replace any non-breaking spaces in the string with regular spaces.
			if LookForNBSP then
				CurrentParseText = gsub(CurrentParseText, "\194\160", " ")
			end

			local ThisLineIsSocketBonus = false
			if Side == 1 and strfind(CurrentParseText, PawnLocal.TooltipParsing.SocketBonusPrefix, 1, true) then
				-- This line is the socket bonus.
				ThisLineIsSocketBonus = true
				ItemHasSocketBonus = true
				if LeftLine.GetTextColor then
					SocketBonusIsValid = (LeftLine:GetTextColor() == 0) -- green's red component is 0, but grey's red component is .5
					if SocketBonusIsValid then
						PawnDebugMessage("  Socket bonus (valid):")
					else
						PawnDebugMessage("  Socket bonus (invalid):")
					end
				else
					PawnDebugMessage(VgerCore.Color.Blue .. "  Socket bonus (not sure if valid):")
					SocketBonusIsValid = true
				end
				CurrentParseText = strsub(CurrentParseText, strlen(PawnLocal.TooltipParsing.SocketBonusPrefix) + 1)
			end

			local Understood
			if ThisLineIsSocketBonus then
				Understood = PawnLookForSingleStat(RegexTable, SocketBonusStats, CurrentParseText, CurrentDebugMessages)
			else
				Understood = PawnLookForSingleStat(RegexTable, Stats, CurrentParseText, CurrentDebugMessages)
			end

            if Understood and not UnderstoodAnyLinesYet then
                -- If this is the first full line on the tooltip we've understood, and there were lines before this that we didn't understand, they don't count.
                -- They were probably things like "Mythic".
                UnderstoodAnyLinesYet = true
                HadUnknown = false
                UnknownLines = {}
            end

			if not Understood then
				-- We don't understand this line.  Let's see if it's a complex stat.

				-- First, check to see if it starts with any of the ignore prefixes, such as "Use:".
				local IgnoreLine = false
				local ThisPrefix
				for _, ThisPrefix in pairs(PawnSeparatorIgnorePrefixes) do
					if strfind(CurrentParseText, ThisPrefix, 1, true) == 1 then
						-- We know that this line doesn't contain a complex stat, so ignore it.
						IgnoreLine = true
						if CurrentDebugMessages then PawnDebugMessage(VgerCore.Color.Blue .. format(PawnLocal.DidntUnderstandMessage, PawnEscapeString(CurrentParseText))) end
						if not Understood and not IgnoreErrors then HadUnknown = true UnknownLines[CurrentParseText] = 1 end
						break
					end
				end

				-- If this line wasn't ignorable, try to break it up.
				if not IgnoreLine then
					-- We'll assume the entire line was understood for now, but if we find any PART that
					-- we don't understand, we'll clear the "understood" flag again.
					Understood = true

					local Pos = 1
					local NextPos = 0
					local InnerStatLine = nil
					local InnerUnderstood = nil

					while Pos < strlen(CurrentParseText) do
						local ThisSeparator
						for _, ThisSeparator in pairs(PawnSeparators) do
							NextPos = strfind(CurrentParseText, ThisSeparator, Pos, false)
							if NextPos then
								-- One of the separators was found.  Check this string.
								InnerStatLine = strsub(CurrentParseText, Pos, NextPos - 1)
								if ThisLineIsSocketBonus then
									InnerUnderstood = PawnLookForSingleStat(RegexTable, SocketBonusStats, InnerStatLine, CurrentDebugMessages)
								else
									InnerUnderstood = PawnLookForSingleStat(RegexTable, Stats, InnerStatLine, CurrentDebugMessages)
								end
								if not InnerUnderstood then
									-- We don't understand this line.
									Understood = false
									if CurrentDebugMessages then PawnDebugMessage(VgerCore.Color.Blue .. format(PawnLocal.DidntUnderstandMessage, PawnEscapeString(InnerStatLine))) end
									if not Understood and not IgnoreErrors then HadUnknown = true UnknownLines[InnerStatLine] = 1 end
								end
								-- Regardless of the outcome, advance to the next position.
								Pos = NextPos + strlen(ThisSeparator)
								break
							end -- (if NextPos...)
							-- If we didn't find that separator, continue the for loop to try the next separator.
						end -- (for ThisSeparator...)
						if (Pos > 1) and (not NextPos) then
							-- If there are no more separators left in the string, but we did find one before that, then we have
							-- one last string to check: everything after the last separator.
							InnerStatLine = strsub(CurrentParseText, Pos)
							if ThisLineIsSocketBonus then
								InnerUnderstood = PawnLookForSingleStat(RegexTable, SocketBonusStats, InnerStatLine, CurrentDebugMessages)
							else
								InnerUnderstood = PawnLookForSingleStat(RegexTable, Stats, InnerStatLine, CurrentDebugMessages)
							end
							if not InnerUnderstood then
								-- We don't understand this line.
								Understood = false
								if CurrentDebugMessages then PawnDebugMessage(VgerCore.Color.Blue .. format(PawnLocal.DidntUnderstandMessage, PawnEscapeString(InnerStatLine))) end
								if not Understood and not IgnoreErrors then HadUnknown = true UnknownLines[InnerStatLine] = 1 end
							end
							break
						elseif not NextPos then
							-- If there are no more separators in the string and we hadn't found any before that, we're done.
							Understood = false
							if CurrentDebugMessages then PawnDebugMessage(VgerCore.Color.Blue .. format(PawnLocal.DidntUnderstandMessage, PawnEscapeString(CurrentParseText))) end
							if not Understood and not IgnoreErrors then HadUnknown = true UnknownLines[CurrentParseText] = 1 end
							break
						end
						-- Continue on to the next portion of the string.  The loop ends when we run out of string.
					end -- (while Pos...)
				end -- (if not IgnoreLine...)
			end
		end
	end

	-- Before returning, some stats require special handling.

	if Stats["IsRanged"] and Stats["IsRanged"] > 1 then
		-- Fix for non-Russian locales: INVTYPE_RANGED and INVTYPE_RANGEDRIGHT evaluate to the same thing, so don't count
		-- IsRanged for double.  (In Russian, they're translated differently.)
		Stats["IsRanged"] = 1
	end

	if Stats["IsMainHand"] or Stats["IsOneHand"] or Stats["IsOffHand"] or Stats["IsTwoHand"] or Stats["IsRanged"] then
		-- Only perform this conversion if this is an actual weapon.  This works around a problem that occurs when you
		-- enchant your ring with weapon damage and then Pawn would try to calculate DPS for your ring with no Min/MaxDamage.
		local Min = Stats["MinDamage"]
		if not Min then Min = 0 end
		local Max = Stats["MaxDamage"]
		if not Max then Max = 0 end
		if (Min > 0 or Max > 0) and Stats["Speed"] then
			-- Convert damage to DPS if *either* minimum or maximum damage is present.  (A few annoying items
			-- like the Brewfest steins have only max damage.)
			PawnAddStatToTable(Stats, "Dps", (Min + Max) / Stats["Speed"] / 2)
		else
			local WeaponStats = 0
			if Stats["MinDamage"] then WeaponStats = WeaponStats + 1 end
			if Stats["MaxDamage"] then WeaponStats = WeaponStats + 1 end
			if Stats["Speed"] then WeaponStats = WeaponStats + 1 end
			VgerCore.Assert(WeaponStats == 0 or WeaponStats == 3, "Pawn couldn't read speed and damage stats from " .. ItemName .. "; translation problem?")
		end
	end

	if Stats["IsMainHand"] then
		PawnAddStatToTable(Stats, "MainHandDps", Stats["Dps"])
		PawnAddStatToTable(Stats, "MainHandSpeed", Stats["Speed"])
		PawnAddStatToTable(Stats, "MainHandMinDamage", Stats["MinDamage"])
		PawnAddStatToTable(Stats, "MainHandMaxDamage", Stats["MaxDamage"])
		PawnAddStatToTable(Stats, "IsMelee", 1)
		Stats["IsMainHand"] = nil
	end

	if Stats["IsShield"] then
		-- Shields aren't off-hand weapons.
		Stats["IsOffHand"] = nil
	end
	if Stats["IsOffHand"] and Stats["Dps"] then
		-- Spanish translates INVTYPE_WEAPONOFFHAND and INVTYPE_HOLDABLE the same, but holdable off-hand frill
		-- items aren't weapons. So only add these stats if the item has DPS, which should be true for all weapons and no off-hand frill items.
		-- (We don't have access to the INVTYPE here.)
		PawnAddStatToTable(Stats, "OffHandDps", Stats["Dps"])
		PawnAddStatToTable(Stats, "OffHandSpeed", Stats["Speed"])
		PawnAddStatToTable(Stats, "OffHandMinDamage", Stats["MinDamage"])
		PawnAddStatToTable(Stats, "OffHandMaxDamage", Stats["MaxDamage"])
		PawnAddStatToTable(Stats, "IsMelee", 1)
	end

	if Stats["IsOneHand"] then
		PawnAddStatToTable(Stats, "OneHandDps", Stats["Dps"])
		PawnAddStatToTable(Stats, "OneHandSpeed", Stats["Speed"])
		PawnAddStatToTable(Stats, "OneHandMinDamage", Stats["MinDamage"])
		PawnAddStatToTable(Stats, "OneHandMaxDamage", Stats["MaxDamage"])
		PawnAddStatToTable(Stats, "IsMelee", 1)
		Stats["IsOneHand"] = nil
	end

	if Stats["IsTwoHand"] then
		PawnAddStatToTable(Stats, "TwoHandDps", Stats["Dps"])
		PawnAddStatToTable(Stats, "TwoHandSpeed", Stats["Speed"])
		PawnAddStatToTable(Stats, "TwoHandMinDamage", Stats["MinDamage"])
		PawnAddStatToTable(Stats, "TwoHandMaxDamage", Stats["MaxDamage"])
		PawnAddStatToTable(Stats, "IsMelee", 1)
		-- Also need to convert weapon stats for two-handed weapons, since two-handed appears on the left and weapon type appears on the right.
		PawnAddStatToTable(Stats, "Is2HAxe", Stats["IsAxe"])
		Stats["IsAxe"] = nil
		PawnAddStatToTable(Stats, "Is2HMace", Stats["IsMace"])
		Stats["IsMace"] = nil
		PawnAddStatToTable(Stats, "Is2HSword", Stats["IsSword"])
		Stats["IsSword"] = nil

		Stats["IsTwoHand"] = nil
	end

	if Stats["IsMelee"] and Stats["IsRanged"] then
		VgerCore.Fail("Weapon that is both melee and ranged was converted to both Melee* and Ranged* stats")
	end

	if Stats["IsMelee"] then
		PawnAddStatToTable(Stats, "MeleeDps", Stats["Dps"])
		PawnAddStatToTable(Stats, "MeleeSpeed", Stats["Speed"])
		PawnAddStatToTable(Stats, "MeleeMinDamage", Stats["MinDamage"])
		PawnAddStatToTable(Stats, "MeleeMaxDamage", Stats["MaxDamage"])
		Stats["IsMelee"] = nil

		-- Feral attack power conversion (Wrath)
		local FeralAp = PawnGetFeralAp(Stats["Dps"])
		if FeralAp and FeralAp > 0 then PawnAddStatToTable(Stats, "FeralAp", FeralAp) end
	end

	if Stats["IsRanged"] then
		PawnAddStatToTable(Stats, "RangedDps", Stats["Dps"])
		PawnAddStatToTable(Stats, "RangedSpeed", Stats["Speed"])
		PawnAddStatToTable(Stats, "RangedMinDamage", Stats["MinDamage"])
		PawnAddStatToTable(Stats, "RangedMaxDamage", Stats["MaxDamage"])
		Stats["IsRanged"] = nil
	end

	if Stats["MetaSocket"] then
		-- For each meta socket, add credit for meta socket effects.
		-- Enchanted items will get the benefit of meta sockets on their unenchanted version later.
		PawnAddStatToTable(Stats, "MetaSocketEffect", Stats["MetaSocket"])
	end

	-- Now, socket bonuses require special handling.
	if ItemHasSocketBonus then
		if SocketBonusIsValid then
			-- If the socket bonus is valid (green), then just add those stats directly to the main stats table and be done with it.
			PawnDebugMessage("   (Including socket bonus stats because requirements were met)")
			PawnAddStatsToTable(Stats, SocketBonusStats)
			SocketBonusStats = {}
		else
			-- If the socket bonus is not valid, then we need to check for sockets.
			if Stats["PrismaticSocket"] or Stats["RedSocket"] or Stats["YellowSocket"] or Stats["BlueSocket"] or Stats["MetaSocket"] then
				-- There are sockets left, so the player could still meet the requirements.
				PawnDebugMessage("   (Socket bonus requirements could potentially be met)")
			else
				-- There are no sockets left and the socket bonus requirements were not met.  Ignore the
				-- socket bonus, since the user purposely chose to mis-socket.
				PawnDebugMessage("   (Ignoring socket bonus stats since the requirements were not met)")
				SocketBonusStats = {}
			end
		end
	end

	-- Done!
	local _, PrettyLink = Tooltip:GetItem()
	if not HadUnknown then UnknownLines = nil end
	return Stats, SocketBonusStats, UnknownLines, PrettyLink
end

-- Looks for a single string in the regex table, and adds it to the stats table if it finds it.
-- Parameters: Stats, ThisString, DebugMessages
--		RegexTable: The regular expression table to look through.
--		Stats: The stats table to modify if anything is found.
--		ThisString: The string to look for.
--		DebugMessages: If true, debug messages will be shown.
-- Return value: Understood
--		Understood: True if the string was understood (even if empty or ignored), otherwise false.
function PawnLookForSingleStat(RegexTable, Stats, ThisString, DebugMessages)
	-- First, perform a series of normalizations on the string.  For example, "Stamina +5" should
	-- be converted to "+5 Stamina" so we don't need two strings for everything.
	ThisString = strtrim(ThisString)
	local Entry, Count
	for _, Entry in pairs(PawnNormalizationRegexes) do
		---@diagnostic disable-next-line: deprecated
		local Regex, Replacement = unpack(Entry)
		local OldString = ThisString
		ThisString, Count = gsub(ThisString, Regex, Replacement, 1)
		--if Count > 0 then PawnDebugMessage("Normalized string using \"" .. PawnEscapeString(Regex) .. "\" -- was " .. PawnEscapeString(OldString) .. " and is now " .. PawnEscapeString(ThisString)) end
	end

	-- Now, look for the string in the main regex table.
	local Props, Matches = PawnFindStringInRegexTable(ThisString, RegexTable)
	if not Props then
		-- We don't understand this.  Return false to indicate this, so the caller can handle the case.
		return false
	else
		-- We understand this.  It could either be an ignored line like "Soulbound", or an actual stat.
		-- The same code handles both cases; just keep going until we find a stat of nil; in the ignored case, we hit this immediately.
		local Index = 2
		while true do
			local Stat, Number, Source = Props[Index], tonumber(Props[Index + 1]), Props[Index + 2]
			if not Stat then break end -- There are no more stats left to process.
			if not Number then Number = 1 end

			if Source == PawnMultipleStatsExtract or Source == PawnSingleStatMultiplier or Source == nil then
				-- This is a variable number of a stat, the standard case.
				local MatchIndex
				if Source == PawnMultipleStatsExtract then
					MatchIndex = math.abs(Number)
				else
					MatchIndex = 1
				end
				local ExtractedValue = Matches[MatchIndex]
				if not ExtractedValue then
					VgerCore.Fail("Didn't extract a value for " .. Stat .. ".  Is the translation missing a capture (#)?")
					ExtractedValue = 0
				end
				if Stat ~= "Speed" and (PawnLocal.ThousandsSeparator ~= "" or (PawnLocal.ThousandsSeparator == PawnLocal.DecimalSeparator)) then
					-- Skip this for Speed because Spanish uses the wrong character for speed, and speed would never be >=1,000
					-- In 7.0, Russian also used the comma for both thousands and decimal separators, so use the same logic then.
					-- Remove commas in numbers.  We need to use % in case it's a dot, and we need to
					-- skip this entirely in case there's no large number separator at all (Spanish).
					ExtractedValue = gsub(ExtractedValue, "%" .. PawnLocal.ThousandsSeparator, "")
				end
				if PawnLocal.DecimalSeparator ~= "." then
					-- If this is the German client or any other version that uses something other than "." for
					-- the decimal separator, we need to substitute here, because tonumber() parses things
					-- in English format only.
					ExtractedValue = gsub(ExtractedValue, PawnLocal.DecimalSeparator, ".")
				end
				if Stat == "Speed" and VgerCore.IsClassic and GetLocale() == "frFR" then
					-- In French WoW Classic, the weapon speed value uses a comma for the decimal even though everything else uses a period.
					-- UGH BLIZZARD WHY MUST YOU DO THIS TO ME
					ExtractedValue = gsub(ExtractedValue, ",", ".")
				end
				ExtractedValue = tonumber(ExtractedValue) -- broken onto multiple lines because gsub() returns multiple values and tonumber accepts multiple arguments
				if Number < 0 then ExtractedValue = -ExtractedValue end
				if Source == PawnSingleStatMultiplier then ExtractedValue = ExtractedValue * Number end
				if DebugMessages then PawnDebugMessage(format(PawnLocal.FoundStatMessage, ExtractedValue, Stat)) end
				PawnAddStatToTable(Stats, Stat, ExtractedValue)
			elseif Source == PawnMultipleStatsFixed then
				-- This is a fixed number of a stat, such as a socket (1).
				if DebugMessages then PawnDebugMessage(format(PawnLocal.FoundStatMessage, Number, Stat)) end
				PawnAddStatToTable(Stats, Stat, Number)
			else
				VgerCore.Fail("Incorrect source value of '" .. Source .. "' for regex: " .. Props[1])
			end

			Index = Index + 3
		end
	end

	return true
end

-- Gets the name of an item given a tooltip name, and the line on which the item appears.
-- Normally this is line 1, but it can be line 2 if the first line is "Currently Equipped".
-- Parameters: TooltipName
--		TooltipName: The name of the tooltip to read.
-- Return value: ItemName, LineNumber
--		ItemName: The name of the item in the tooltip, or nil if the tooltip didn't have one.
--		LineNumber: The line number on which the name was found, or nil if no item was found.
function PawnGetItemNameFromTooltip(TooltipName)
	-- First, get the tooltip details.
	local TooltipTopLine = _G[TooltipName .. "TextLeft1"]
	if not TooltipTopLine then return end
	local ItemName = TooltipTopLine:GetText()
	if not ItemName or ItemName == "" or ItemName == RETRIEVING_ITEM_INFO then return end

	-- If this is a Currently Equipped tooltip, skip the first line.
	if ItemName == CURRENTLY_EQUIPPED then
		ItemNameLineNumber = 2
		TooltipTopLine = _G[TooltipName .. "TextLeft2"]
		if not TooltipTopLine then return end
		return TooltipTopLine:GetText(), 2
	end
	return ItemName, 1
end

-- Annotates zero or more lines in a tooltip with the name TooltipName, adding a (?) to the end
-- of each line specified by index in the list Lines.
-- Returns true if any lines were annotated.
function PawnAnnotateTooltipLines(TooltipName, Lines)
	-- Temporarily disabling this feature to see if anyone misses it.
	if not PawnCommon.ShowAsterisks then return end

	if not Lines then return false end
	local Annotated = false
	local Tooltip = _G[TooltipName]
	local LineCount = Tooltip:NumLines()
	for i = 2, LineCount do
		local LeftLine = _G[TooltipName .. "TextLeft" .. i]
		if LeftLine then
			local LeftLineText = LeftLine:GetText()
			if Lines[LeftLineText] then
				-- Getting the line text can fail in the following scenario, observable with MobInfo-2:
				-- 1. Other mod modifies a tooltip to include unrecognized text.
				-- 2. Pawn reads the tooltip, noting those unrecognized lines and remembering them so that they
				-- can get marked with (?) later.
				-- 3. Something causes the tooltip to be refreshed.  For example, picking up the item.  All customizations
				-- by Pawn and other mods are lost.
				-- 4. Pawn re-annotates the tooltip with (?) before the other mod has added the lines that are supposed
				-- to get the (?).
				-- In this case, we just ignore the problem and leave off the (?), since we can't really come back later.
				LeftLine:SetText(LeftLineText .. PawnTooltipAnnotation)
				Annotated = true
			end
		end
	end
	return Annotated
end

-- Adds an amount of one stat to a table of stats, increasing the value if
-- it's already there, or adding it if it isn't.
function PawnAddStatToTable(Stats, Stat, Amount)
	if not Amount or Amount == 0 then return end
	if Stats[Stat] then
		Stats[Stat] = Stats[Stat] + Amount
	else
		Stats[Stat] = Amount
	end
end

-- Adds the contents of one stat table to another.
function PawnAddStatsToTable(Dest, Source)
	if not Dest then
		VgerCore.Fail("PawnAddStatsToTable requires a destination table!")
		return
	end
	if not Source then return end
	for Stat, Quantity in pairs(Source) do
		PawnAddStatToTable(Dest, Stat, Quantity)
	end
end

-- Looks for the first regular expression in a given table that matches the given string.
-- Parameters: String, RegexTable
--		String: The string to look for.
--		RegexTable: The table of regular expressions to look through.
--	Return value: Props, Matches
--		Props: The row from the table with a matching regex.
--		Matches: The array of captured matches.
-- 		Returns nil, nil if no matches were found.
--		Returns {}, {} if the string was ignored.
function PawnFindStringInRegexTable(String, RegexTable)
	if (String == nil) or (String == "") or (String == " ") then return {}, {} end
	local Entry
	for _, Entry in pairs(RegexTable) do
		LastRegex = Entry[1]
		LastStat = Entry[2]
		local StartPos, EndPos, m1, m2, m3, m4, m5 = strfind(String, LastRegex)
		if StartPos then return Entry, { m1, m2, m3, m4, m5 } end
	end
	return nil, nil
end

-- Calculates the value of an item.
--	Parameters: Item, ItemLevel, SocketBonus, ScaleName, DebugMessages, NoNormalization
--		Item: Item stats in the format returned by GetStatsFromTooltip.
--		ItemLevel: The item's level.
--		SocketBonus: Socket bonus stats in the format returned by GetStatsFromTooltip.
--		ScaleName: The scale to use.
--		DebugMessages: If true, debug messages will be shown if appropriate.
--		NoNormalization: If true, the user's normalization factor will be ignored.
--	Returns: Value, TotalSocketValue
--		Value: The numeric value of an item based on the given scale values.  (example: 21.75)
--		TotalSocketValue: The total value of the sockets and socket bonus if applicable. (This is already factored into the total value.)
--		SocketBonusValue: The total value of the socket bonus, IF it's worthwhile. (This is already factored into the previous two values.)
function PawnGetItemValue(Item, ItemLevel, SocketBonus, ScaleName, DebugMessages, NoNormalization)
	-- If either the item or scale is empty, exit now.
	if (not Item) or (not ScaleName) then return end
	local ScaleOptions = PawnCommon.Scales[ScaleName]
	if not ScaleOptions then return end
	local ScaleValues = ScaleOptions.Values
	if not ScaleValues then return end

	-- Calculate the value.
	local Total = 0
	local TotalSocketValue = 0
	local ProperSocketValue = 0
	local SocketBonusValue = 0
	local IsUnusable
	local ThisValue, Stat, Quantity
	for Stat, Quantity in pairs(Item) do
		ThisValue = ScaleValues[Stat]
		if VgerCore.IsMainline then
			-- When not in Classic:
			-- Attack Power gets converted into Strength or Agility, whichever is most valuable.
			-- BUG: Since Attack Power doesn't appear in the Values tab, it also won't show on the Compare tab.  The Compare tab
			-- would need extra handling for Attack Power.
			if Stat == "Ap" then
				local StrengthValue = ScaleValues["Strength"] or 0
				local AgilityValue = ScaleValues["Agility"] or 0
				if AgilityValue > StrengthValue then
					Stat = "Agility"
				else
					Stat = "Strength"
				end
				ThisValue = ScaleValues[Stat]
			end
		end
		-- This isn't an unusable stat, is it?
		if ThisValue and ThisValue <= PawnIgnoreStatValue then
			Total = 0
			IsUnusable = true
			if DebugMessages then PawnDebugMessage(format(PawnLocal.UnusableStatMessage, Stat)) end
			break
		end
		-- Sockets need to be considered separately since their value depends on the item's level.
		if
			Stat ~= "PrismaticSocket" and
			Stat ~= "RedSocket" and
			Stat ~= "YellowSocket" and
			Stat ~= "BlueSocket" and
			Stat ~= "MetaSocket" and
			Stat ~= "MetaSocketEffect"
		then
			if ThisValue then
				-- This stat has a value; add it to the running total.
				if ScaleValues.SpeedBaseline and (
					Stat == "Speed" or
					Stat == "MeleeSpeed" or
					Stat == "MainHandSpeed" or
					Stat == "OffHandSpeed" or
					Stat == "OneHandSpeed" or
					Stat == "TwoHandSpeed" or
					Stat == "RangedSpeed"
				) then
					-- Speed is a special case; subtract SpeedBaseline from the speed value.
					Quantity = Quantity - ScaleValues.SpeedBaseline
				end
				Total = Total + Quantity * ThisValue
				if DebugMessages then PawnDebugMessage(format(PawnLocal.ValueCalculationMessage, Quantity, Stat, ThisValue, Quantity * ThisValue)) end
			end
		end
	end

	local ThisScaleBestGems = PawnScaleBestGems[ScaleName]
	if not IsUnusable then
		if ThisScaleBestGems then

			local ShouldIncludeSockets = (not PawnCommon.IgnoreGemsWhileLeveling) or (ItemLevel ~= nil and ItemLevel >= PawnMinimumItemLevelToConsiderGems)

			-- Decide what to do with sockets.
			if ShouldIncludeSockets and (
				Item.PrismaticSocket or
				Item.RedSocket or
				Item.YellowSocket or
				Item.BlueSocket or
				Item.MetaSocket or
				Item.MetaSocketEffect
			) then

				local GemQualityLevel = PawnGetGemQualityForItem(PawnGemQualityLevels, ItemLevel)
				local MetaGemQualityLevel = PawnGetGemQualityForItem(PawnMetaGemQualityLevels, ItemLevel)

				local SocketValue = function(Stat, QualityLevel)
					local Quantity = Item[Stat]
					if Quantity then
						local ThisValue = ThisScaleBestGems[Stat .. "Value"][QualityLevel]
						if ThisValue then
							if DebugMessages then PawnDebugMessage(format(PawnLocal.ValueCalculationMessage, Quantity, Stat, ThisValue, Quantity * ThisValue)) end
							return Quantity * ThisValue
						else
							if DebugMessages then PawnDebugMessage("   No known value for " .. Quantity .. " " .. Stat) end
						end
					end
					return 0
				end

				local BasicSocketsCount = (Item.PrismaticSocket or 0) + (Item.RedSocket or 0) + (Item.YellowSocket or 0) + (Item.BlueSocket or 0)

				-- First, find the total value of the sockets assuming we ignore the socket bonus.
				local BestGemName = PawnGetGemListString(ScaleName, true, ItemLevel, "Prismatic")
				local BestGemValue = ThisScaleBestGems["PrismaticSocketValue"][GemQualityLevel] or 0
				local MissocketedValue = BasicSocketsCount * BestGemValue

				-- Then, see if we can get a better value by going for the socket bonus.
				if SocketBonus then
					for Stat, Quantity in pairs(SocketBonus) do
						ThisValue = ScaleValues[Stat]
						if ThisValue then
							SocketBonusValue = SocketBonusValue + ThisValue * Quantity
							if DebugMessages then PawnDebugMessage(format(PawnLocal.ValueCalculationMessage, Quantity, Stat, ThisValue, Quantity * ThisValue)) end
						end
					end
					if DebugMessages then PawnDebugMessage(format(PawnLocal.SocketBonusValueCalculationMessage, SocketBonusValue)) end
					ProperSocketValue =
						SocketValue("PrismaticSocket", GemQualityLevel) +
						SocketValue("RedSocket", GemQualityLevel) +
						SocketValue("YellowSocket", GemQualityLevel) +
						SocketValue("BlueSocket", GemQualityLevel) +
						SocketBonusValue
				end -- if SocketBonus

				if MissocketedValue > ProperSocketValue then
					if DebugMessages then PawnDebugMessage(string.format(PawnLocal.MissocketWorthwhileMessage, BestGemName)) end
					TotalSocketValue = MissocketedValue
					SocketBonusValue = 0
				else
					TotalSocketValue = ProperSocketValue
				end

				-- Finally, meta sockets are just kind of their own separate thing.
				TotalSocketValue = TotalSocketValue + SocketValue("MetaSocket", MetaGemQualityLevel)
				ThisValue = ScaleValues.MetaSocketEffect
				if ThisValue then
					Stat = "MetaSocketEffect"
					Quantity = Item[Stat]
					if Quantity then
						TotalSocketValue = TotalSocketValue + Quantity * ThisValue
						if DebugMessages then PawnDebugMessage(format(PawnLocal.ValueCalculationMessage, Quantity, Stat, ThisValue, Quantity * ThisValue)) end
					end
				end

				Total = Total + TotalSocketValue
			end -- if ShouldIncludeSockets

		else
			-- This error case is acceptable if we're calculating data FOR the gems themselves.  (In that case, normalization will be off.)
			-- If it happens at any other time, we'd want to know about it.
			VgerCore.Assert(NoNormalization, "Item value calculation will be incomplete because we don't have best gem data and thus can't calculate values for sockets.")
		end
	end

	-- Perform normalizations on the total if that option is enabled.
	if (not IsUnusable) and (not NoNormalization) and PawnScaleTotals[ScaleName] and PawnScaleTotals[ScaleName] > 0 then
		if ScaleOptions.NormalizationFactor and ScaleOptions.NormalizationFactor > 0 then
			if DebugMessages then PawnDebugMessage(format(PawnLocal.NormalizationMessage, PawnScaleTotals[ScaleName])) end
			Total = ScaleOptions.NormalizationFactor * Total / PawnScaleTotals[ScaleName]
		end
	end

	if DebugMessages then PawnDebugMessage(format(PawnLocal.TotalValueMessage, Total)) end

	return Total, TotalSocketValue, SocketBonusValue
end

-- Returns a friendly description of the best gems to use for a given scale.
--		GemListString: A string description of the best gems to use.
--		IsVague: true if the returned string is not particularly specific.
function PawnGetGemListString(ScaleName, ListAll, ItemLevel, Color)
	Socket = Socket or "Prismatic"
	local Gems = PawnScaleBestGems[ScaleName]
	if Gems and Gems[Color .. "Socket"] then
		local GemQuality = PawnGetGemQualityForItem(PawnGemQualityLevels, ItemLevel)
		local GemTable = Gems[Color .. "Socket"][GemQuality]

		if ListAll or (Color == "Prismatic" and #GemTable > 2) then
			local _, GemInfo, GemList
			local Separator
			if ListAll then Separator = "\n" else Separator = ", " end
			for _, GemInfo in pairs(GemTable) do
				local ThisGemName
				local Item = PawnGetGemData(GemInfo)
				if Item and Item.Name then
					ThisGemName = Item.Name
				else
					GemList = nil
					break
				end
				if GemList then
					GemList = GemList .. (Separator .. ThisGemName)
				else
					GemList = ThisGemName
				end
			end
			if GemList then return GemList end
		end
		if #GemTable == 1 then
			-- There's exactly one best gem for this scale, so return its name.
			-- If it's in the Pawn cache, use its name from there.
			local Item = PawnGetGemData(GemTable[1])
			if Item and Item.Name then
				return Item.Name
			end
		elseif #GemTable == 2 then
			-- If there are exactly two best gems, we can include those names.
			local Item = PawnGetGemData(GemTable[1])
			if Item and Item.Name then
				local ItemName1 = Item.Name
				Item = PawnGetGemData(GemTable[2])
				if Item and Item.Name then
					return format(PawnLocal.GemList2, ItemName1, Item.Name)
				end
			end
		elseif Color == "Red" or Color == "Yellow" or Color == "Blue" then
			-- If there are three or more best gems AND it's a specific color, we can at least return the socket color.
			return _G[toupper(Color) .. "_GEM"], true
		end
	end

	-- If we don't have something better to display, so be it.
	return "?", true
end

-- Returns the type of hyperlink passed in, or nil if it's not a hyperlink.
-- Possible values include: item, enchant, quest, spell
function PawnGetHyperlinkType(Hyperlink)
	-- First, try colored links.
	local _, _, LinkType = strfind(Hyperlink, "^|c%x%x%x%x%x%x%x%x|H(.-):")
	if not LinkType then
		-- Then, try links prepended with |H.  (Outfitter does this.)
		_, _, LinkType = strfind(Hyperlink, "^|H(.-):")
	end
	if not LinkType then
		-- Then, try raw links.
		_, _, LinkType = strfind(Hyperlink, "^(.-):")
	end
	return LinkType
end

-- If the item link is of the clickable form, strip off the initial hyperlink portion.
function PawnStripLeftOfItemLink(ItemLink)
	local _, _, InnerLink = strfind(ItemLink, "^|%x+|H(.+)")
	if InnerLink then return InnerLink else return ItemLink end
end

-- Extracts the item ID from an ItemLink string and returns it, or nil if unsuccessful.
function PawnGetItemIDFromLink(ItemLink)
	local Pos, _, ItemID = strfind(PawnStripLeftOfItemLink(ItemLink), "^item:(%-?%d+):?")
	if Pos then return tonumber(ItemID) else return nil end
end

-- If the upgrade level passed in is upgradeable with valor, return the new upgrade level, otherwise return nil.
local function PawnDoValorUpgrade(UpgradeLevel)
	if UpgradeLevel1 == "529" or UpgradeLevel1 == "530" then
		-- Note: This only covers Warlords of Draenor upgradeable items, not legacy items, but realistically you're probably
		-- not ever going to want to upgrade those.  (If it ever becomes useful, it sounds like LibItemUpgradeInfo handles all of the edge cases.)
		return "531"
	else
		return nil
	end
end

-- Returns a new item link that represents an unenchanted version of the original item link.
-- Return values:
--		ItemLink - The unenchanted item link, or nil if unsuccessful or the item is not unenchanted.
--		WasUpgraded - True if the item was upgraded while being "unenchanted."  (Always false if "ignore valor and baleful upgrades" is off.)
-- (But if EvenIfNotEnchanted is true, the item link will be processed even if the item wasn't enchanted.)
function PawnUnenchantItemLink(ItemLink, EvenIfNotEnchanted)
	local TrimmedItemLink = PawnStripLeftOfItemLink(ItemLink)
	local Pos, _, ItemID, EnchantID, GemID1, GemID2, GemID3, GemID4, SuffixID, MoreInfo, ViewAtLevel, SpecializationID, UpgradeLevel1, Difficulty, NumBonusIDs, BonusID1, BonusID2, BonusID3, BonusID4, BonusID5, BonusID6, BonusID7, BonusID8, BonusID9, BonusID10, BonusID11, BonusID12 = strfind(TrimmedItemLink, "^item:(%-?%d+):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%-?%d*):?(%-?%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*):?(%d*)")
	-- Note: After the specified number of bonus IDs would be UpgradeLevel2, which could be the level at which the item was acquired for timewarped items, or
	-- the Valor upgrade level.
	-- Note: This code is gross and you should be ashamed.

	if Pos then
		-- If this is a valor-upgradeable item that isn't fully upgraded, for purposes of calculation we always assume a fully-upgraded item is the "base."
		-- The upgrade value will always come after the list of bonus IDs, as UpgradeLevel2.
		NumBonusIDs = tonumber(NumBonusIDs) or 0
		VgerCore.Assert(NumBonusIDs <= 12, "Pawn didn't expect to find " .. tostring(NumBonusIDs) .. " bonus IDs on that complicated-ass item. Item stats may not be correct.")
		local WasUpgraded = false -- This feature was removed in Pawn 2.1.4.

		if
			EvenIfNotEnchanted or
			EnchantID ~= "0" or EnchantID == "" or EnchantID == nil or
			GemID1 ~= "0" or GemID1 == "" or GemID1 == nil or
			GemID2 ~= "0" or GemID2 == "" or GemID2 == nil or
			GemID3 ~= "0" or GemID3 == "" or GemID3 == nil or
			GemID4 ~= "0" or GemID4 == "" or GemID4 == nil or
			WasUpgraded
		then
			-- This item is enchanted.  Return a new link.
			if SuffixID == nil or SuffixID == "" then SuffixID = "0" end
			if MoreInfo == nil or MoreInfo == "" then MoreInfo = "0" end
			if SpecializationID == nil or SpecializationID == "" then SpecializationID = "0" end
			if UpgradeLevel1 == nil or UpgradeLevel1 == "" then UpgradeLevel1 = "0" end
			if Difficulty == nil or Difficulty == "" then Difficulty = "0" end
			if NumBonusIDs == nil or NumBonusIDs == "" then NumBonusIDs = "0" end
			if BonusID1 == nil or BonusID1 == "" then BonusID1 = "0" end
			if BonusID2 == nil or BonusID2 == "" then BonusID2 = "0" end
			if BonusID3 == nil or BonusID3 == "" then BonusID3 = "0" end
			if BonusID4 == nil or BonusID4 == "" then BonusID4 = "0" end
			if BonusID5 == nil or BonusID5 == "" then BonusID5 = "0" end
			if BonusID6 == nil or BonusID6 == "" then BonusID6 = "0" end
			if BonusID7 == nil or BonusID7 == "" then BonusID7 = "0" end
			if BonusID8 == nil or BonusID8 == "" then BonusID8 = "0" end
			if BonusID9 == nil or BonusID9 == "" then BonusID9 = "0" end
			if BonusID10 == nil or BonusID10 == "" then BonusID10 = "0" end
			if BonusID11 == nil or BonusID11 == "" then BonusID11 = "0" end
			if BonusID12 == nil or BonusID12 == "" then BonusID12 = "0" end
			return "item:" .. ItemID .. ":0:0:0:0:0:" .. SuffixID .. ":" .. MoreInfo .. ":" .. 0 .. ":" .. SpecializationID .. ":" .. UpgradeLevel1 .. ":" .. Difficulty .. ":" .. NumBonusIDs .. ":" .. BonusID1 .. ":" .. BonusID2 .. ":" .. BonusID3 .. ":" .. BonusID4 .. ":" .. BonusID5 .. ":" .. BonusID6 .. ":" .. BonusID7 .. ":" .. BonusID8 .. ":" .. BonusID9 .. ":" .. BonusID10 .. ":" .. BonusID11 .. ":" .. BonusID12, WasUpgraded
		else
			-- This item is not enchanted.  Return nil.
			return nil
		end
	else
		-- We couldn't parse this item link.  Return nil.
		-- This is a normal case—for example, battle pet item links.
		--VgerCore.Fail("Could not parse the item link: " .. PawnEscapeString(ItemLink))
		return nil
	end
end

-- Returns a nice-looking string that shows the item IDs for an item, its enchantments, and its gems.
function PawnGetItemIDsForDisplay(ItemLink, Formatted)
	local Pos, _, ItemID, MoreInfo = strfind(ItemLink, "^|%x+|Hitem:(%-?%d+)([^|]+)|")
	if not Pos then
		Pos, _, ItemID, MoreInfo = strfind(ItemLink, "^item:(%-?%d+)(:?.*)")
		if not Pos then return end
	end

	if MoreInfo then
		-- Strip off stray colons and :0.
		Pos = strlen(MoreInfo)
		while Pos >= 1 and strsub(MoreInfo, Pos, Pos) == ":" do Pos = Pos - 1 end
		MoreInfo = strsub(MoreInfo, 1, Pos)
		Pos = strlen(MoreInfo)
		while Pos >= 2 and strsub(MoreInfo, Pos - 1, Pos) == ":0" do Pos = Pos - 2 end
		MoreInfo = strsub(MoreInfo, 1, Pos)
		-- Strip off the character level too if that's the only thing after the ID.
		local ColonsAndLevel = "::::::::" .. UnitLevel("player")
		Pos = strlen(MoreInfo) - strlen(ColonsAndLevel)
		if strsub(MoreInfo, Pos) == ColonsAndLevel then MoreInfo = strsub(MoreInfo, 1, Pos) end
	end

	if Formatted == nil then Formatted = true end

	if MoreInfo and MoreInfo ~= "" then
		if Formatted then
			return ItemID .. VgerCore.Color.Silver .. MoreInfo .. "|r"
		else
			return "item:" .. ItemID .. MoreInfo
		end
	else
		if Formatted then
			return ItemID
		else
			return "item:" .. ItemID
		end
	end
end

-- Reads a Pawn scale tag, and breaks it into parts.
-- 	Parameters: ScaleTag
--		ScaleTag: A Pawn scale tag.  Example:  '(Pawn:v1:"Healbot":Stamina=1,Intellect=1.24)'
--	Return value: Name, Values; or nil if unsuccessful, or if the version number is too high.
--		Name: The scale name.
--		Values: A table of scale stats and values.  Example: {["Stamina"] = 1, ["Intellect"] = 1.24}
function PawnParseScaleTag(ScaleTag)
	-- Read the scale and perform basic validation.
	local Pos, _, Version, Name, ValuesString = strfind(ScaleTag, "^%s*%(%s*Pawn%s*:%s*v(%d+)%s*:%s*\"([^\"]+)\"%s*:%s*(.+)%s*%)%s*$")
	Version = tonumber(Version)
	if (not Pos) or (not Version) or (not Name) or (Name == "") or (not ValuesString) or (ValuesString == "") then return end
	if Version > PawnCurrentScaleVersion then return end

	-- Now, parse the values string for stat names and values.
	local Values = {}
	local SpecID
	local function SplitStatValuePair(Pair)
		local Pos, _, Stat, Value = strfind(Pair, "^%s*([%a%d]+)%s*=%s*(%-?[%d%.a-zA-Z]+)%s*,$")
		if Stat == "Class" then
			Value = PawnGetClassIDFromName(Value)
		elseif Stat == "Spec" then
			SpecID = Value -- processed later, in case they list Spec before Class
		elseif Value == "X" or Value == "x" then
			Value = PawnIgnoreStatValue
		else
			Value = tonumber(Value)
		end
		if Pos and Stat and (Stat ~= "") and Value then
			Values[Stat] = Value
		end
	end
	---@diagnostic disable-next-line: discard-returns
	gsub(ValuesString .. ",", "[^,]*,", SplitStatValuePair)
	if SpecID and Values.Class then
		Values.Spec = PawnGetSpecIDFromName(Values.Class, SpecID)
	end

	-- Looks like everything worked.
	return Name, Values
end

local ClassNameToIDMap =
{
	["WARRIOR"] = 1, ["PALADIN"] = 2, ["HUNTER"] = 3, ["ROGUE"] = 4, ["PRIEST"] = 5, ["DEATHKNIGHT"] = 6, ["SHAMAN"] = 7, ["MAGE"] = 8, ["WARLOCK"] = 9, ["MONK"] = 10, ["DRUID"] = 11, ["DEMONHUNTER"] = 12, ["EVOKER"] = 13,
}
local SpecNameToIDMap =
{
	[1] = { ARMS = 1, FURY = 2, PROTECTION = 3 },
	[2] = { HOLY = 1, PROTECTION = 2, RETRIBUTION = 3 },
	[3] = { BEASTMASTERY = 1, MARKSMANSHIP = 2, SURVIVAL = 3 },
	[4] = { ASSASSINATION = 1, OUTLAW = 2, SUBTLETY = 3 },
	[5] = { DISCIPLINE = 1, HOLY = 2, SHADOW = 3 },
	[6] = { BLOOD = 1, FROST = 2, UNHOLY = 3 },
	[7] = { ELEMENTAL = 1, ENHANCEMENT = 2, RESTORATION = 3 },
	[8] = { ARCANE = 1, FIRE = 2, FROST = 3 },
	[9] = { AFFLICTION = 1, DEMONOLOGY = 2, DESTRUCTION = 3 },
	[10] = { BREWMASTER = 1, MISTWEAVER = 2, WINDWALKER = 3 },
	[11] = { BALANCE = 1, FERAL = 2, GUARDIAN = 3, RESTORATION = 4 },
	[12] = { HAVOC = 1, VENGEANCE = 2 },
	[13] = { DEVASTATION = 1, PRESERVATION = 2}
}
local ClassIDToEnglishNameMap =
{
	[1] = "Warrior", [2] = "Paladin", [3] = "Hunter", [4] = "Rogue", [5] = "Priest", [6] = "DeathKnight", [7] = "Shaman", [8] = "Mage", [9] = "Warlock", [10] = "Monk", [11] = "Druid", [12] = "DemonHunter", [13] = "Evoker",
}
local SpecIDToEnglishNameMap =
{
	[1] = { [1] = "Arms", [2] = "Fury", [3] = "Protection" },
	[2] = { [1] = "Holy", [2] = "Protection", [3] = "Retribution" },
	[3] = { [1] = "BeastMastery", [2] = "Marksmanship", [3] = "Survival" },
	[4] = { [1] = "Assassination", [2] = "Outlaw", [3] = "Subtlety" },
	[5] = { [1] = "Discipline", [2] = "Holy", [3] = "Shadow" },
	[6] = { [1] = "Blood", [2] = "Frost", [3] = "Unholy" },
	[7] = { [1] = "Elemental", [2] = "Enhancement", [3] = "Restoration" },
	[8] = { [1] = "Arcane", [2] = "Fire", [3] = "Frost" },
	[9] = { [1] = "Affliction", [2] = "Demonology", [3] = "Destruction" },
	[10] = { [1] = "Brewmaster", [2] = "Mistweaver", [3] = "Windwalker" },
	[11] = { [1] = "Balance", [2] = "Feral", [3] = "Guardian", [4] = "Restoration" },
	[12] = { [1] = "Havoc", [2] = "Vengeance" },
	[13] = { [1] = "Devastation", [2] = "Preservation" },
}

-- Returns a class ID number (1-12) from the string passed in, or nil if the string isn't a class name.
function PawnGetClassIDFromName(Name)
	local ClassID = ClassNameToIDMap[string.upper(Name)]
	if ClassID then return ClassID end

	-- If it's not a name, try a number.
	ClassID = tonumber(Name)
	if ClassID and ClassIDToEnglishNameMap[ClassID] then return ClassID end -- make sure it's a real class ID

	return nil
end

-- Returns a spec ID number (1-4) from the string passed in, or nil if the string isn't a spec name.
function PawnGetSpecIDFromName(ClassID, Name)
	local SpecTable = SpecNameToIDMap[ClassID]
	if not SpecTable then return end
	local SpecID = SpecTable[string.upper(Name)]
	if SpecID then return SpecID end

	-- If it's not a name, try a number.
	SpecID = tonumber(Name)
	if SpecID and SpecIDToEnglishNameMap[ClassID][SpecID] then return SpecID end -- make sure it's a real spec ID for this class

	return nil
end

-- Returns an unlocalized English class name from the class ID number.
function PawnGetEnglishClassNameFromID(ClassID)
	return ClassIDToEnglishNameMap[ClassID]
end

-- Returns an unlocalized English class name from the class and spec ID numbers.
function PawnGetEnglishSpecNameFromID(ClassID, SpecID)
	local SpecTable = SpecIDToEnglishNameMap[ClassID]
	if not SpecTable then return end
	return SpecTable[SpecID]
end

-- Corrects errors in scales: either human errors, or to correct for bugs in current or past versions of Pawn.
function PawnCorrectScaleErrors(ScaleName)
	local ThisScaleOptions = PawnCommon.Scales[ScaleName]
	if not ThisScaleOptions then return end
	local ThisScale = ThisScaleOptions.Values
	if not ThisScale then
		ThisScale = { }
		ThisScaleOptions.Values = ThisScale
	end

	-- Pawn 1.5.5 adds an option to follow armor specialization when upgrading.
	if ThisScaleOptions.UpgradesFollowSpecialization == nil then ThisScaleOptions.UpgradesFollowSpecialization = (PawnArmorSpecializationLevel ~= nil) end

	-- Pawn 1.3 adds per-character options to each scale.
	if ThisScaleOptions.PerCharacterOptions == nil then ThisScaleOptions.PerCharacterOptions = {} end
	if ThisScaleOptions.PerCharacterOptions[PawnPlayerFullName] == nil then ThisScaleOptions.PerCharacterOptions[PawnPlayerFullName] = {} end

	-- Some versions of Pawn call resilience rating Resilience and some call it ResilienceRating.
	PawnReplaceStat(ThisScale, "Resilience", "ResilienceRating")

	-- Early versions of Pawn 0.7.x had a typo in the configuration UI so that none of the special DPS stats worked.
	PawnReplaceStat(ThisScale, "MeleeDPS", "MeleeDps")
	PawnReplaceStat(ThisScale, "RangedDPS", "RangedDps")
	PawnReplaceStat(ThisScale, "MainHandDPS", "MainHandDps")
	PawnReplaceStat(ThisScale, "OffHandDPS", "OffHandDps")
	PawnReplaceStat(ThisScale, "OneHandDPS", "OneHandDps")
	PawnReplaceStat(ThisScale, "TwoHandDPS", "TwoHandDps")

	-- Pawn 1.7 makes smart gem socketing mandatory.
	ThisScaleOptions.SmartGemSocketing = nil
	ThisScaleOptions.SmartMetaGemSocketing = nil
	ThisScaleOptions.GemQualityLevel = nil
	ThisScaleOptions.MetaGemQualityLevel = nil
	ThisScaleOptions.CogwheelQualityLevel = nil
	ThisScale.PrismaticSocket = nil
	ThisScale.RedSocket = nil
	ThisScale.YellowSocket = nil
	ThisScale.BlueSocket = nil
	ThisScale.CogwheelSocket = nil
	ThisScale.ColorlessSocket = nil
	ThisScale.MetaSocket = nil

	-- These stats aren't used in the live OR classic realms.
	ThisScale.Mana = nil
	ThisScale.Health = nil
	ThisScale.BaseArmor = nil
	ThisScale.IsRelic = nil
	ThisScale.BonusArmor = nil
	ThisScale.Multistrike = nil

	-- These were introduced in Classic versions.
	if not (VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath) then
		ThisScale.SpellPenetration = nil
	end
	if not (VgerCore.IsBurningCrusade or VgerCore.IsWrath) then
		ThisScale.ExpertiseRating = nil
		ThisScale.ResilienceRating = nil
	end

	-- Spell power appeared in Wrath but disappeared again later.
	if not VgerCore.IsWrath then
		ThisScale.SpellPower = nil
	end

	-- Pawn 1.9.7 makes it impossible to ignore primary stats, since they're on all armor now.
	if ThisScale.Stamina == PawnIgnoreStatValue then ThisScale.Stamina = nil end
	if ThisScale.Strength == PawnIgnoreStatValue then ThisScale.Strength = nil end
	if ThisScale.Agility == PawnIgnoreStatValue then ThisScale.Agility = nil end
	if ThisScale.Intellect == PawnIgnoreStatValue then ThisScale.Intellect = nil end

	-- Versions of Pawn before 2.1.16 had an error where the Role property was being incorrectly set to true/false
	-- due to an API change.  If that happened to this scale, fix it.
	if ThisScaleOptions.Role == true or ThisScaleOptions.Role == false then ThisScaleOptions.Role = nil end

	-- Patch 9.0 removed the Corruption stat, though it still shows up on items.
	ThisScale.Corruption = nil

	-- Patch 9.2 removed the effects of domination shards outside of the Maw.
	ThisScale.DominationSocket = nil

	-- Wrath Classic merges SpellDamage and Healing into SpellPower, and melee and spell ratings.
	if VgerCore.IsWrath then
		PawnCombineStats(ThisScale, "SpellPower", "SpellDamage")
		PawnCombineStats(ThisScale, "SpellPower", "Healing")
		PawnCombineStats(ThisScale, "HitRating", "SpellHitRating")
		PawnCombineStats(ThisScale, "CritRating", "SpellCritRating")
		PawnCombineStats(ThisScale, "HasteRating", "SpellHasteRating")
	end
end

-- Replaces one incorrect stat with a correct stat.
function PawnReplaceStat(ThisScale, OldStat, NewStat)
	if ThisScale[OldStat] then
		if not ThisScale[NewStat] then ThisScale[NewStat] = ThisScale[OldStat] end
		ThisScale[OldStat] = nil
	end
end

-- Combines two stats into one.  For example, combines HitRating and SpellHitRating, putting the larger of the
-- two values in HitRating.
function PawnCombineStats(ThisScale, PrimaryStat, SecondaryStat)
	if ThisScale[SecondaryStat] then
		if ThisScale[PrimaryStat] and ThisScale[PrimaryStat] > ThisScale[SecondaryStat] then
			-- If the primary stat is larger, do nothing.
		else
			-- If the secondary stat is larger, increase the value of the primary to the secondary.
			ThisScale[PrimaryStat] = ThisScale[SecondaryStat]
		end
		-- Regardless, clear out the secondary stat afterward.
		ThisScale[SecondaryStat] = nil
	end
end

-- Causes the Pawn private tooltip to be shown when next hovering an item.
--function PawnTestShowPrivateTooltip()
--	_G[PawnPrivateTooltipName]:SetOwner(UIParent, "ANCHOR_TOPRIGHT")
--end

-- Hides the Pawn private tooltip (normal).
--function PawnTestHidePrivateTooltip()
--	_G[PawnPrivateTooltipName]:SetOwner(UIParent, "ANCHOR_NONE")
--	_G[PawnPrivateTooltipName]:Hide()
--end

-- Depending on the user's current tooltip icon settings, show and hide icons as appropriate.
function PawnToggleTooltipIcons()
	PawnAttachIconToTooltip(ItemRefTooltip)
	PawnAttachIconToTooltip(ShoppingTooltip1, true)
	PawnAttachIconToTooltip(ShoppingTooltip2, true)

	-- MultiTips compatibility
	PawnAttachIconToTooltip(ItemRefTooltip2)
	PawnAttachIconToTooltip(ItemRefTooltip3)
	PawnAttachIconToTooltip(ItemRefTooltip4)
	PawnAttachIconToTooltip(ItemRefTooltip5)

	-- EquipCompare compatibility
	PawnAttachIconToTooltip(ComparisonTooltip1, true)
	PawnAttachIconToTooltip(ComparisonTooltip2, true)
end

-- If tooltip icons are enabled, attaches an icon to the upper-left corner of a tooltip.  Otherwise, hides
-- any icons attached to that tooltip if they exist.
-- Optionally, the caller may include an item link so this function doesn't need to get one.
function PawnAttachIconToTooltip(Tooltip, AttachAbove, ItemLink)
	-- If the tooltip doesn't exist, exit now.
	if not Tooltip then return end

	-- Find the right texture to use, but skip all this if the user has icons turned off.
	local TextureName
	if PawnCommon.ShowTooltipIcons then
		-- Don't retrieve an item link if one was passed in.
		if not ItemLink then
			local _
			_, ItemLink = Tooltip:GetItem()
		end
		if ItemLink then
			TextureName = GetItemIcon(ItemLink)
		end
	end

	-- Now, if we don't have a texture to use, or icons are disabled, hide this icon if it's visible
	-- and then exit.
	local IconFrame = Tooltip.PawnIconFrame
	if not TextureName then
		if IconFrame then
			IconFrame:Hide()
			IconFrame.PawnIconTexture = nil
			Tooltip.PawnIconFrame = nil
		end
		return
	end

	-- Create the icon's frame if it doesn't already exist.
	if not IconFrame then
		IconFrame = CreateFrame("Frame", nil, Tooltip)
		Tooltip.PawnIconFrame = IconFrame
		IconFrame:SetWidth(37)
		IconFrame:SetHeight(37)

		local IconTexture = IconFrame:CreateTexture(nil, "BACKGROUND")
		IconTexture:SetTexture(TextureName)
		IconTexture:SetAllPoints(IconFrame)
		IconFrame.PawnIconTexture = IconTexture
	else
		-- If the icon already existed, then we just need to update the texture.
		IconFrame.PawnIconTexture:SetTexture(TextureName)
	end

	-- Attach the icon frame and show it.
	if AttachAbove then
		IconFrame:SetPoint("BOTTOMLEFT", Tooltip, "TOPLEFT", 2, -2)
	else
		IconFrame:SetPoint("TOPRIGHT", Tooltip, "TOPLEFT", 2, -2)
	end
	IconFrame:Show()

	return IconFrame
end

-- Hides any icons on a tooltip, if there are any.
function PawnHideTooltipIcon(TooltipName)
	-- Find the tooltip.  If it doesn't exist, we can skip out now.
	local Tooltip = _G[TooltipName]
	if not Tooltip then return end

	-- Is there an icon on it?  If not, exit.
	local IconFrame = Tooltip.PawnIconFrame
	if not IconFrame then return end

	-- Hide the icon frame if it's there, and remove the reference to it so it can be garbage-collected.
	IconFrame:Hide()
	IconFrame.PawnIconTexture = nil
	Tooltip.PawnIconFrame = nil
end

-- Comparer function for use in sort that sorts strings alphabetically, ignoring case, and also ignoring a
-- 10-character color format at the beginning of the string.
function PawnColoredStringCompare(a, b)
	return strlower(strsub(a, 11)) < strlower(strsub(b, 11))
end

-- Comparer function for use in sort that sorts sub-tables alphabetically by the localized name in the sub-table, ignoring case.
function PawnItemValueCompare(a, b)
	return strlower(a[4]) < strlower(b[4])
end

-- Takes an ItemEquipLoc and returns one or two slot IDs where that item type can be equipped.
-- Bags are not supported.
function PawnGetSlotsForItemType(ItemEquipLoc)
	if (not ItemEquipLoc) or (ItemEquipLoc == "") then return end
	return PawnItemEquipLocToSlot1[ItemEquipLoc], PawnItemEquipLocToSlot2[ItemEquipLoc]
end

-- Given a particular item level and a list of gem tables, return the appropriate gem quality level for an item of the given level.
-- If ItemLevel is nil, then the highest gem quality is assumed.
function PawnGetGemQualityForItem(GemQualityLevels, ItemLevel)
	if not ItemLevel then return GemQualityLevels[1][1] end

	local _, GemQualityData, GemLevel
	for _, GemQualityData in pairs(GemQualityLevels) do
		GemLevel = GemQualityData[1]
		if ItemLevel >= GemLevel then return GemLevel end
	end
	VgerCore.Fail("Couldn't find an appropriate gem quality level for an item of level " .. tostring(ItemLevel) .. " in the specified item table.")
	return GemLevel
end

-- Given a weapon's DPS, returns the amount of feral attack power the weapon would grant a druid.
function PawnGetFeralAp(Dps)

	-- In Classic Era and Burning Crusade, feral AP was just a regular stat.
	-- In Cataclysm, it was removed entirely.
	-- Only in Wrath was it a special fake stat that appeared on tooltips.
	if not VgerCore.IsWrath then return 0 end

	if not Dps then return 0 end
	local FeralAp = math.floor((Dps - 54.8) * 14)
	if FeralAp < 0 then
		return 0
	else
		return FeralAp
	end

end

-- Finds the best gems for a particular scale in one or more colors.
-- 	Parameters: ScaleName, GemTable
--		ScaleName: The name of the scale for which to find gems.
--		GemTable: The gem table to search through.
--		RedOnly, YellowOnly, BlueOnly: Filters the results to only gems of a certain color.
--	Return value: Value, GemList
--		Value: The value of the best gem or gems for the chosen colors.
--		GemList: A table of gems of that value.  Each item in the list is in the standard Pawn item table format, and
--			the list is sorted alphabetically by name.
function PawnFindBestGems(ScaleName, GemTable, RedOnly, YellowOnly, BlueOnly)
	local BestScore = 0
	local BestItems = { }

	-- Go through the list of gems, checking each item that matches one of the find criteria.
	local GemData, ThisGem, _
	for _, GemData in pairs(GemTable) do
		ThisGem = PawnGetGemData(GemData)
		if ThisGem then
			if ((not RedOnly) or GemData.R) and ((not YellowOnly) or GemData.Y) and ((not BlueOnly) or GemData.B) then
				local ThisValue = PawnGetItemValue(ThisGem.UnenchantedStats, ThisGem.Level, nil, ScaleName, false, true)
				if ThisValue and ThisValue > BestScore then
					-- This gem is better than any we've found so far.
					BestScore = ThisValue
					wipe(BestItems)
					tinsert(BestItems, ThisGem)
				elseif ThisValue and ThisValue == BestScore then
					-- This gem is tied with the best gems we've found so far.
					tinsert(BestItems, ThisGem)
				end
			end
		else
			VgerCore.Fail("Failed to get information about gem " .. GemData.ID)
		end
	end

	-- Now we have a list of the best gems.  Sort them alphabetically.
	sort(BestItems, PawnItemComparer)

	-- In debug mode, display them.
	if PawnCommon.Debug then
		VgerCore.Message("=== Best gems for " .. PawnGetScaleLocalizedName(ScaleName) .. ": ===")
		for _, ThisGem in pairs(BestItems) do
			VgerCore.Message("  " .. ThisGem.Link)
		end
		VgerCore.Message(" --> Score: " .. tostring(BestScore))
	end

	-- Return the value and list of gems.
	return BestScore, BestItems

end

-- Refreshes a cached item with new information if available.  Currently meant only for refreshing
-- best-gem item data, which often doesn't have a name or texture, with that information.
-- Returns true if it did anything.
function PawnRefreshCachedItem(Item)
	if not Item then
		VgerCore.Fail("PawnRefreshCachedItem requires an item table.")
		return false
	end

	-- Request the new information.
	local ItemName, _, _, _, _, _, _, _, _, ItemTexture = GetItemInfo(Item.ID)
	if not ItemName then
		-- The client doesn't have any further information on this item yet, so bail out.
		return false
	end

	-- Save this new information into the cached item record.
	Item.Name = ItemName
	Item.Texture = ItemTexture
	return true
end

-- Determines if an item is an upgrade for any of the current user's enabled scales, and if so, by how much.
-- Parameters:
--	Item: The item table for the item in question.
--	DoNotRescan: If best item data is not available, just return nil instead of rescanning.
-- Returns nothing if the item is not an upgrade and is not one of the player's best items.  Otherwise:
--	UpgradeInfo, ItemLevelIncrease, BestItemFor, SecondBestItemFor, NeedsEnhancements
--	UpgradeInfo: a sorted table of upgrades, with each element being another table:
--		{ { ScaleName, LocalizedScaleName, PercentUpgrade, ExistingItem }, ... }
--		ScaleName: the raw scale name.
--		LocalizedScaleName: the localized scale name, suitable for display.
--		PercentUpgrade: for example, for an item that is a 15% upgrade over the current item, .15.
--		ExistingItemLink: the item that would be replaced if the user upgraded to the item passed in, in its unenchanted (not display-ready) form.
--	ItemLevelIncrease: the number of item levels that this item increases the player's score, or nil if it's not an item level upgrade.
--	BestItemFor, SecondBestItemFor: a table of scales for which this item is already the player's best or second-best item, or nil if none.
--		{ ["Scale1"] = true, ["Scale2"] = true }
--	NeedsEnhancements: true if the item requires enhancements (Valor or Empowered Apexis Fragment).
function PawnIsItemAnUpgrade(Item, DoNotRescan)

	-- Before we begin, check for unsupported item types and bail out early if appropriate.
	if Item and type(Item) ~= "table" then
		VgerCore.Fail("Item must be a table of item stats, not '" .. type(Item) .. "'.")
		return
	end
	-- If an artifact is involved, we only compare using item level, since artifacts are complicated and one item can fill multiple slots.
	local CompareUsingItemLevelOnly = (Item.Rarity == 6)
	local InvType = Item.InvType
	if not InvType or InvType == "" or InvType == "INVTYPE_BAG" or InvType == "INVTYPE_QUIVER" or InvType == "INVTYPE_TABARD" or InvType == "INVTYPE_BODY" or ((not VgerCore.RangedSlotExists) and (InvType == "INVTYPE_THROWN" or InvType == "INVTYPE_AMMO" or InvType == "INVTYPE_RELIC")) then return nil end
	local SkipScoreBasedUpgrades = InvType == "INVTYPE_TRINKET"
	local UnenchantedItemLink, NeedsEnhancements = PawnUnenchantItemLink(Item.Link, true)
	VgerCore.Assert(UnenchantedItemLink ~= nil, "PawnIsItemAnUpgrade failed to get an item link for item " .. tostring(Item.ID))

	if InvType == "INVTYPE_WEAPON" or InvType == "INVTYPE_WEAPONMAINHAND" or InvType == "INVTYPE_WEAPONOFFHAND" or InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" or InvType == "INVTYPE_2HWEAPON" or InvType == "INVTYPE_RANGED" then
		-- Don't show 1H upgrades if using a 2H item, and vice-versa.
		-- And, don't show any weapons or off-hands as upgrades if they have an artifact equipped.
		local MainWeaponLink = GetInventoryItemLink("player", INVSLOT_MAINHAND) or GetInventoryItemLink("player", INVSLOT_OFFHAND)
		if MainWeaponLink then
			local MainWeapon = PawnGetItemData(MainWeaponLink)
			if MainWeapon then
				if MainWeapon.Rarity == 6 then
					-- They're wielding an artifact, so ignore handedness checks.
					if InvType == "INVTYPE_WEAPON" or InvType == "INVTYPE_WEAPONMAINHAND" or InvType == "INVTYPE_WEAPONOFFHAND" or InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" or InvType == "INVTYPE_2HWEAPON" then
						-- If they're wielding an artifact weapon and also looking at an artifact weapon, it can't be an upgrade, since artifact weapons are spec-specific.  So, bail out.
						if Item.Rarity == 6 then
							SkipScoreBasedUpgrades = true
						end
						-- Otherwise, compare the new non-artifact weapon using item level only.
						CompareUsingItemLevelOnly = true
					end
				elseif MainWeapon.InvType == "INVTYPE_2HWEAPON" then
					-- They're using a two-handed weapon.  Bail out now if this is a one-handed weapon.
					if InvType == "INVTYPE_WEAPON" or InvType == "INVTYPE_WEAPONMAINHAND" or InvType == "INVTYPE_WEAPONOFFHAND" or InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" then SkipScoreBasedUpgrades = true end
				else
					-- They're using a one-handed weapon.  Bail out now if this is a two-handed weapon.
					if InvType == "INVTYPE_2HWEAPON" then SkipScoreBasedUpgrades = true end
				end
			end
		end
	end -- if InvType == ...

	local _
	local UpgradeTable, BestItemTable, SecondBestItemTable
	local ScaleName, Scale
	if not SkipScoreBasedUpgrades then
		for ScaleName, Scale in pairs(PawnCommon.Scales) do
			InvType = Item.InvType -- need to reset this here since it gets nil'ed out in the coming while loop

			if PawnIsScaleVisible(ScaleName) and not
				(Scale.DoNotShow1HUpgrades and (InvType == "INVTYPE_WEAPON" or InvType == "INVTYPE_WEAPONMAINHAND" or InvType == "INVTYPE_WEAPONOFFHAND" or InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE")) and not
				(Scale.DoNotShow2HUpgrades and InvType == "INVTYPE_2HWEAPON") and
				((PawnArmorSpecializationLevel == nil) or (not Scale.UpgradesFollowSpecialization) or PawnIsArmorBestTypeForPlayer(Item))
			then
				-- Find the best item for that slot.  Or, if a second-best item is available, compare versus that.
				local CharacterOptions = Scale.PerCharacterOptions[PawnPlayerFullName]
				if not CharacterOptions then
					VgerCore.Fail("PerCharacterOptions should be initialized before using PawnIsItemAnUpgrade.")
					return nil
				end
				if PawnOptions.UpgradeTracking and not CharacterOptions.BestItems then
					if DoNotRescan then return nil end
					-- If best item data hasn't been calculated yet, go ahead and calculate it now.
					PawnFindBestItems(ScaleName)
				end

				local InvType2 = nil
				local TwoSlotsForThisItemType = (InvType == "INVTYPE_FINGER")
				if InvType == "INVTYPE_WEAPON" then
					-- Check one-handed weapons against both the main hand and off hand, and report the best upgrade.
					-- (One-handed weapons aren't stored past the initial scan, so we don't need to check those.)
					if PawnOptions.UpgradeTracking then InvType = "INVTYPE_WEAPONMAINHAND" end
					if Scale.Values.IsOffHand == nil or Scale.Values.IsOffHand > PawnIgnoreStatValue then
						-- Only try putting off-hand weapons in the off hand if they fit there!
						-- And don't bother if upgrade tracking is off; we'll check both weapon slots anyway.
						if PawnOptions.UpgradeTracking then InvType2 = "INVTYPE_WEAPONOFFHAND" end
						TwoSlotsForThisItemType = true
					end
				elseif InvType == "INVTYPE_ROBE" then
					-- Robes are chest armor.
					InvType = "INVTYPE_CHEST"
				elseif InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" then
					-- Treat shields and held in off hand items the same as off-hand weapons since they go into the same slot.
					InvType = "INVTYPE_WEAPONOFFHAND"
				end
				-- TODO: A MH weapon can actually upgrade an OH weapon if the following are true:
				-- 1) The new MH weapon isn't better than the current MH one (because then it would upgrade that instead)
				-- 2) The current best MH weapon is a one-hander
				-- 3) The new MH weapon is better than the old OH weapon
				-- But, it's not clear how best to present this to the user, so this case (and the vice-versa case) is ignored for now.
				local ThisValue = nil
				local NewTableEntry = nil

				while InvType do
					local BestData = nil
					if PawnOptions.UpgradeTracking and not CompareUsingItemLevelOnly then
						BestData = CharacterOptions.BestItems[InvType]
					else
						-- If upgrade tracking is disabled, manually create a BestData table based on the currently-equipped items for this slot.
						local Slot1, Slot2, Item1, Item2, SlotHadItem1, SlotHadItem2, ItemLink1, ItemLink2, Value1, Value2
						Slot1 = PawnItemEquipLocToSlot1[InvType]
						if Slot1 then Item1, SlotHadItem1 = PawnGetItemDataForInventorySlot(Slot1, true) end
						if SlotHadItem1 and not Item1 then return end -- If there is an item in the slot but we don't have data yet, we can't evaluate upgrades yet.
						if Item1 then ItemLink1 = PawnUnenchantItemLink(Item1.Link, true) end
						if not TwoSlotsForThisItemType and ItemLink1 and UnenchantedItemLink == ItemLink1 then return end -- If this item is already equipped, it can't be an upgrade for any scale.
						if TwoSlotsForThisItemType then Slot2 = PawnItemEquipLocToSlot2[InvType] end -- Don't check the off-hand slot for weapon upgrades if they can't dual-wield
						if Slot2 then Item2 = PawnGetItemDataForInventorySlot(Slot2, true) end
						if SlotHadItem2 and not Item2 then return end -- If there is an item in the slot but we don't have data yet, we can't evaluate upgrades yet.
						if Item2 then ItemLink2 = PawnUnenchantItemLink(Item2.Link, true) end
						if not TwoSlotsForThisItemType and ItemLink2 and UnenchantedItemLink == PawnUnenchantItemLink(Item2.Link, true) then return end
						VgerCore.Assert(Value1 == nil and Value2 == nil, "Where's the value coming from?")
						if CompareUsingItemLevelOnly then
							if Item1 then Value1 = Item1.Level end
							if Item2 then Value2 = Item2.Level end
						else
							if Item1 then _, Value1 = PawnGetSingleValueFromItem(Item1, ScaleName) end
							if Item2 then _, Value2 = PawnGetSingleValueFromItem(Item2, ScaleName) end
						end

						if Value1 and Value2 then
							if Value1 >= Value2 then
								BestData = { Value1, ItemLink1, PawnGetMaxLevelItemIsUsefulHeirloom(Item1), Value2, ItemLink2, PawnGetMaxLevelItemIsUsefulHeirloom(Item2) }
							else
								BestData = { Value2, ItemLink2, PawnGetMaxLevelItemIsUsefulHeirloom(Item2), Value1, ItemLink1, PawnGetMaxLevelItemIsUsefulHeirloom(Item1) }
							end
						elseif TwoSlotsForThisItemType then
							-- If it's possible to equip two of these and the player only has one, then any new item is an upgrade.
						elseif Value1 and not Value2 then
							BestData = { Value1, ItemLink1, PawnGetMaxLevelItemIsUsefulHeirloom(Item1) }
						elseif Value2 and not Value1 then
							BestData = { Value2, ItemLink2, PawnGetMaxLevelItemIsUsefulHeirloom(Item2) }
						end
					end
					if BestData then
						local BestValue = BestData[4] or BestData[1]
						local BestItem = BestData[5] or BestData[2]
						local BestMaxHeirloomLevel = BestData[6] or BestData[3]
						if BestValue then
							-- Don't bother looking for this item's value if we don't have a best item for this slot.
							if not ThisValue then
								if CompareUsingItemLevelOnly then
									ThisValue = Item.Level
								else
									_, ThisValue = PawnGetSingleValueFromItem(Item, ScaleName)
								end
							end

							if UnenchantedItemLink == BestData[2] and not (Item.InvType == "INVTYPE_WEAPON" and InvType == "INVTYPE_WEAPONOFFHAND") then
								-- If the item IS the first best item for a scale, then it can't be an upgrade.  (Technically that's only the case if
								-- the item is unique or unique-equipped, but Pawn currently can't determine that.)
								-- If the item is a one-handed weapon and we're currently evaluating the off-hand weapon slot, call it a second-best item instead of best.
								NewTableEntry = nil
								if BestItemTable == nil then BestItemTable = { [ScaleName] = true } else BestItemTable[ScaleName] = true end
								break
							elseif UnenchantedItemLink == BestData[5] or UnenchantedItemLink == BestData[2] then
								-- If it's the second-best item for a scale it's not an upgrade either.
								NewTableEntry = nil
								if SecondBestItemTable == nil then SecondBestItemTable = { [ScaleName] = true } else SecondBestItemTable[ScaleName] = true end
								break
							elseif TwoSlotsForThisItemType and BestData[4] == nil then
								-- There's an empty slot for this item to go into.
								NewTableEntry = { ["ScaleName"] = ScaleName, ["LocalizedScaleName"] = Scale.LocalizedName or ScaleName, ["PercentUpgrade"] = PawnBigUpgradeThreshold }
							elseif ThisValue > BestValue * 1.005 then
								-- Hooray, it's an upgrade!  Add it to the table.
								-- (Only count upgrades that are at least 0.5% better.)
								local Difference = ThisValue - BestValue
								local PercentUpgrade
								if CompareUsingItemLevelOnly then
									if Item.CanEquip then
										PercentUpgrade = PawnBigUpgradeThreshold
									end
								else
									PercentUpgrade = Difference / (BestValue + PawnEpsilon) -- Epsilon is abused here to account for no-stat items.
								end
								if NewTableEntry then
									-- We already found a best item for another inventory type.
									if PercentUpgrade > NewTableEntry.PercentUpgrade then
										NewTableEntry.PercentUpgrade = PercentUpgrade
										NewTableEntry.ExistingItemLink = BestItem
									end
								else
									if PercentUpgrade then
										NewTableEntry = { ["ScaleName"] = ScaleName, ["LocalizedScaleName"] = Scale.LocalizedName or ScaleName, ["PercentUpgrade"] = PercentUpgrade, ["ExistingItemLink"] = BestItem }
									end
								end
							end
						end
					else
						-- Not having best item data for a particular slot isn't a bizarre case; it will happen often for low-level characters
						-- who don't have any helms or shoulders.
						if not ThisValue then _, ThisValue = PawnGetSingleValueFromItem(Item, ScaleName) end
						if ThisValue and ThisValue > 0 then
							NewTableEntry = { ["ScaleName"] = ScaleName, ["LocalizedScaleName"] = Scale.LocalizedName or ScaleName, ["PercentUpgrade"] = PawnBigUpgradeThreshold }
						end
					end

					-- If this item counts as two types of items, now scan the other type.
					InvType = InvType2
					InvType2 = nil
				end -- loop through inventory types

				if NewTableEntry then
					if not UpgradeTable then UpgradeTable = { } end
					tinsert(UpgradeTable, NewTableEntry)
				end

			end -- if scale is visible
		end -- loop through scales
	end -- skipping trinkets

	if UpgradeTable then sort(UpgradeTable, PawnLocalizedScaleNameComparer) end

	local ItemLevelIncrease
	if PawnCommon.ShowItemLevelUpgrades then
		ItemLevelIncrease = PawnIsItemAnItemLevelUpgrade(Item)
	end

	-- -- Print out the contents of the upgrade table for debugging purposes.
	-- if UpgradeTable then
	-- 	VgerCore.Message(tostring(Item.Link) .. " is an upgrade for:")
	-- 	local Upgrade
	-- 	for _, Upgrade in pairs(UpgradeTable) do
	-- 		VgerCore.Message("    " .. Upgrade.LocalizedScaleName .. ": " .. tostring(100 * Upgrade.PercentUpgrade) .. "% upgrade from " .. tostring(Upgrade.ExistingItemLink))
	-- 	end
	-- else
	-- 	VgerCore.Message(tostring(Item.Link) .. " is not an upgrade.")
	-- end
	-- if BestItemTable then
	-- 	for ScaleName in pairs(BestItemTable) do
	-- 		VgerCore.Message("    " .. tostring(ScaleName) .. ": best item")
	-- 	end
	-- end
	-- if SecondBestItemTable then
	-- 	for ScaleName in pairs(SecondBestItemTable) do
	-- 		VgerCore.Message("    " .. tostring(ScaleName) .. ": second-best item")
	-- 	end
	-- end

	return UpgradeTable, ItemLevelIncrease, BestItemTable, SecondBestItemTable, NeedsEnhancements
end

-- Comparer function for tables with subtables including a LocalizedScaleName entry.
function PawnLocalizedScaleNameComparer(a, b)
	if not b then return a end
	if not a then return b end
	return strlower(a.LocalizedScaleName) < strlower(b.LocalizedScaleName)
end

-- Invalidates all lists of best items for all characters and scales.
function PawnInvalidateBestItems()
	local ScaleName
	for ScaleName, _ in pairs(PawnCommon.Scales) do
		PawnInvalidateBestItemsForScale(ScaleName)
	end
end

-- Invalidates ALL characters' best items for a single scale.  (This happens whenever that scale's values change.)
function PawnInvalidateBestItemsForScale(ScaleName)
	local Scale = PawnCommon.Scales[ScaleName]
	if not Scale then
		VgerCore.Fail("PawnInvalidateBestItemsForScale: ScaleName must be the name of an existing scale.")
		return
	end
	local CharacterName, CharacterOptions
	for CharacterName, CharacterOptions in pairs(Scale.PerCharacterOptions) do
		CharacterOptions.BestItems = nil
	end
end

-- Checks the player's equipped items for any new upgrades to his or her item sets.
function PawnCheckInventoryForUpgrades()
	local ScaleName
	for ScaleName, _ in pairs(PawnCommon.Scales) do
		PawnFindBestItems(ScaleName, true)
	end
	local Slot
	for Slot = 1, 18 do
		PawnAddItemToLevelTracker(PawnGetItemDataForInventorySlot(Slot))
	end
end

-- Looks through a player's gear and finds the best items they have for that scale.
-- If InventoryOnly is true, then only check currently equipped items, not other things like equipment sets, unless no best
-- item data is currently available, in which case everything will be scanned as normal.
function PawnFindBestItems(ScaleName, InventoryOnly)
	local Scale = PawnCommon.Scales[ScaleName]
	if not Scale then
		VgerCore.Fail("PawnFindBestItems: ScaleName must be the name of an existing scale.")
		return
	end
	local CharacterOptions = Scale.PerCharacterOptions[PawnPlayerFullName]
	if not CharacterOptions then
		VgerCore.Fail("PerCharacterOptions should be initialized before using PawnFindBestItems on that scale.")
		return
	end

	if not CharacterOptions.Visible then
		-- This scale is not visible for this character.  We should invalidate best item data for the scale if it's present,
		-- and if it's not, just exit quickly.
		CharacterOptions.BestItems = nil
		return
	end

	-- If upgrade tracking is disabled, skip all this; it's unnecessary.
	if not PawnOptions.UpgradeTracking then return end

	local OldCacheSize = PawnItemCacheMaxSize
	PawnItemCacheMaxSize = 500 -- temporarily increase maximum cache size for performance reasons

	-- Start with the best items that we already know of.  Obviously in most cases, your existing best items
	-- are already your best ones.  This is a persistent per-scale per-character option, not just per-scale.
	local BestItems = CharacterOptions.BestItems
	if not BestItems then
		BestItems = { }
		InventoryOnly = false -- need to scan everything if we don't have existing valid data
		CharacterOptions.BestItems = BestItems
	end
	-- = { ["INVTYPE_HEAD"] = { 123.45, "item:12345:0:0:3", heirloom level }, ...,  ["INVTYPE_FINGER"] = { 67.8, "item:67890:0:0:3", level, 50.50, second item link, second level }, ... }
	-- (Include a second-best item for INVTYPE_FINGER and INVTYPE_WEAPON)
	-- (ugh, if you ever have to change this again in the future, don't do raw array indices again... super-pain to add another index...)


	-- Helper function to check an item to see if it should go into BestItems, since we'll be performing this
	-- operation in different ways from multiple blocks of code.
	-- Returns true if the item is a new best or second-best item.
	local function CheckItem(ScaleName, BestItems, Item, PreviousItemLink)
		-- Skip trinkets because we can't reliably tell which trinkets are best.
		-- Also skip item classes that don't have stats, and items that have a zero value.
		if not Item then return end
		-- Never show upgrade information for artifacts.  Preventing them from going into your best item list
		-- ensures that you don't have to worry about an unequippable Havoc artifact being considered your best Vengeance
		-- item before you get your actual Vengeance artifact.
		if Item.Rarity == 6 then return end
		local InvType = Item.InvType
		if not InvType or InvType == "" or InvType == "INVTYPE_TRINKET" or InvType == "INVTYPE_BAG" or InvType == "INVTYPE_QUIVER" or InvType == "INVTYPE_TABARD" or InvType == "INVTYPE_BODY" then return end
		local _, Value = PawnGetSingleValueFromItem(Item, ScaleName)
		if Value <= 0 then return end
		local UnenchantedItemLink = PawnUnenchantItemLink(Item.Link, true)
		VgerCore.Assert(UnenchantedItemLink ~= nil, "PawnFindBestItems's CheckItem lambda failed to get an item link for item " .. tostring(Item.ID))

		-- For purposes of upgrades, treat all items that go in the off-hand as off-hand weapons.
		if InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" then
			InvType = "INVTYPE_WEAPONOFFHAND"
		elseif InvType == "INVTYPE_ROBE" then
			InvType = "INVTYPE_CHEST"
		elseif ((not VgerCore.RangedSlotExists) and (InvType == "INVTYPE_RANGED" or InvType == "INVTYPE_RANGEDRIGHT")) then
			-- A ranged weapon could be one-handed (wands) or two-handed (everything else) but it always goes in the main hand.
			InvType = "INVTYPE_WEAPONMAINHAND"
		end

		-- Okay, now do the calculations.
		local BestOfType = BestItems[InvType]
		if BestOfType == nil or BestOfType[1] == nil or Value > (BestOfType[1] + PawnEpsilon) then
			-- This item's an upgrade.
			if BestOfType == nil then
				BestOfType = { }
				BestItems[InvType] = BestOfType
			end
			if InvType == "INVTYPE_FINGER" or InvType == "INVTYPE_WEAPON" then
				-- If this is a ring or weapon, keep the current best item as a second-best item.
				BestOfType[4] = BestOfType[1]
				BestOfType[5] = BestOfType[2]
				BestOfType[6] = BestOfType[3]
			end
			BestOfType[1] = Value
			BestOfType[2] = UnenchantedItemLink
			BestOfType[3] = PawnGetMaxLevelItemIsUsefulHeirloom(Item)
			return true
		elseif
			-- Only rings and one-handed weapons have second-best versions tracked.
			(InvType == "INVTYPE_FINGER" or InvType == "INVTYPE_WEAPON") and
			-- If we don't have a second item stored at all, this is obviously the second best.
			-- Otherwise, the new item's value must be greater than the current second best.
			(BestOfType[4] == nil or Value > (BestOfType[4] + PawnEpsilon)) and
			-- The item's ID must be different from the best item of this type, OR it must be the same
			-- as the last item that was scanned, indicating that the player has two copies of that item.
			-- Otherwise, we assume that the player only has one, so it can't be both first and second best.
			(UnenchantedItemLink == PreviousItemLink or UnenchantedItemLink ~= BestOfType[2])
		then
			-- This item's an upgrade of the current second-best item.
			BestOfType[4] = Value
			BestOfType[5] = UnenchantedItemLink
			BestOfType[6] = PawnGetMaxLevelItemIsUsefulHeirloom(Item)
			return true
		end
		return false
	end
	-- (end of CheckItem)

	-- Obviously, check the player's currently equipped gear.
	local Slot, PreviousItemLink
	for Slot = 1, 18 do if Slot ~= 4 and Slot ~= 13 and Slot ~= 14 then -- Skip slots 0 (ammo), 4 (shirt), 13-14 (trinkets), and 19 (tabard)
		local Item = PawnGetItemDataForInventorySlot(Slot, true, "player")
		if Item then
			CheckItem(ScaleName, BestItems, Item, PreviousItemLink)
			PreviousItemLink = PawnUnenchantItemLink(Item.Link, true)
		end
	end end

	-- Now, scan all of the items in the player's equipment sets.
	if not InventoryOnly and VgerCore.EquipmentSetsExist then
		local _, i
		for _, i in pairs(C_EquipmentSet.GetEquipmentSetIDs()) do
			local _, _, EquipmentSetID = C_EquipmentSet.GetEquipmentSetInfo(i)
			local ItemLocations = C_EquipmentSet.GetItemLocations(EquipmentSetID)
			PreviousItemLink = nil
			for Slot = 1, 18 do if Slot ~= 4 and Slot ~= 13 and Slot ~= 14 then
				local Location = ItemLocations[Slot]
				if Location and Location > 1 then
					-- Getting the item link for an equipment set item is a pain in the ass...
					local ItemLink
					local IsOnPlayer, IsInBank, IsInBags, IsInVoidStorage, Slot, Bag, Tab, VoidSlot = EquipmentManager_UnpackLocation(Location)
					if IsInVoidStorage then
						-- The item link for this item should be GetVoidItemHyperlinkString(VoidSlot), but we'll never get here; location will
						-- be -1 (item unavailable) for items in void storage.
						ItemLink = nil --GetVoidItemHyperlinkString(VoidSlot) -- API no longer exists in 8.0
						VgerCore.Fail("Didn't expect to find an equipment set item in void storage!")
					elseif not IsInBags then
						VgerCore.Assert(IsOnPlayer or IsInBank, "Equipment set contains new location data that Pawn doesn't understand; EquipmentManager_UnpackLocation may have been updated.")
						ItemLink = GetInventoryItemLink("player", Slot)
					else
						if C_Container and C_Container.GetContainerItemLink then
							ItemLink = C_Container.GetContainerItemLink(Bag, Slot)
						else
							ItemLink = GetContainerItemLink(Bag, Slot)
						end
					end

					-- Now that we have an item link we can proceed as usual.
					if ItemLink then
						local Item = PawnGetItemData(PawnUnenchantItemLink(ItemLink, true))
						CheckItem(ScaleName, BestItems, Item, PreviousItemLink)
					end
				end
				PreviousItemLink = ItemLink
			end end
			wipe(ItemLocations)
		end
	end

	-- Now we've scanned all of the items we're going to scan.  Next we have to assign out one-handed items to the main
	-- hand and off-hand slots as appropriate.
	PawnAssignOneHandedBestItems(Scale, BestItems)

	-- Finally, to test this out, print out the list of best items to the console.
	--VgerCore.Message("------------------------------------------------------------")
	--VgerCore.Message(VgerCore.Color.Blue .. "Pawn found the best items for " .. PawnGetScaleLocalizedName(ScaleName) .. ".")
	--VgerCore.Message(" ")
	--local InvType, BestOfType
	--for InvType, BestOfType in pairs(BestItems) do
	--	local _, ItemLink = GetItemInfo(BestOfType[2])
	--	VgerCore.Message(InvType .. ": " .. ItemLink .. " = " .. tostring(BestOfType[1]))
	--	if BestOfType[4] then
	--		_, ItemLink = GetItemInfo(BestOfType[5])
	--		VgerCore.Message("    and " .. ItemLink .. " = " .. BestOfType[4])
	--	end
	--end
	--VgerCore.Message(" ")
	--VgerCore.Message(string.format("The item cache now contains %s items.", #PawnItemCache))

	-- Restore the original cache size.  The cache will be trimmed the next time we try to add an item to it.
	PawnItemCacheMaxSize = OldCacheSize
end

-- Helper function to assign one-handed weapons to the main hand and off-hand best item slots.
function PawnAssignOneHandedBestItems(Scale, BestItems)
	-- First, get the values of the four weapons we're considering.
	local BestMH, BestOH, Best1H, SecondBest1H = 0, 0, 0, 0
	if BestItems.INVTYPE_WEAPONMAINHAND then BestMH = BestItems.INVTYPE_WEAPONMAINHAND[1] or 0 end
	if BestItems.INVTYPE_WEAPONOFFHAND then BestOH = BestItems.INVTYPE_WEAPONOFFHAND[1] or 0 end
	if BestItems.INVTYPE_WEAPON then
		-- Before continuing, if the best one-hand weapons have already been assigned to the main hand and off
		-- hand slots, remove them.  (This needs to happen in two separate phases; if a weapon appears in both one-hand
		-- slots, then having it as the best main hand item should not remove it from both slots.)
		if BestItems.INVTYPE_WEAPONMAINHAND and BestItems.INVTYPE_WEAPONMAINHAND[2] == BestItems.INVTYPE_WEAPON[2] then
			BestItems.INVTYPE_WEAPON[1] = BestItems.INVTYPE_WEAPON[4]
			BestItems.INVTYPE_WEAPON[2] = BestItems.INVTYPE_WEAPON[5]
			BestItems.INVTYPE_WEAPON[3] = BestItems.INVTYPE_WEAPON[6]
			BestItems.INVTYPE_WEAPON[4] = nil
			BestItems.INVTYPE_WEAPON[5] = nil
			BestItems.INVTYPE_WEAPON[6] = nil
		elseif BestItems.INVTYPE_WEAPONMAINHAND and BestItems.INVTYPE_WEAPONMAINHAND[2] == BestItems.INVTYPE_WEAPON[5] then
			BestItems.INVTYPE_WEAPON[4] = nil
			BestItems.INVTYPE_WEAPON[5] = nil
			BestItems.INVTYPE_WEAPON[6] = nil
		end
		if BestItems.INVTYPE_WEAPONOFFHAND and BestItems.INVTYPE_WEAPONOFFHAND[2] == BestItems.INVTYPE_WEAPON[2] then
			BestItems.INVTYPE_WEAPON[1] = BestItems.INVTYPE_WEAPON[4]
			BestItems.INVTYPE_WEAPON[2] = BestItems.INVTYPE_WEAPON[5]
			BestItems.INVTYPE_WEAPON[3] = BestItems.INVTYPE_WEAPON[6]
			BestItems.INVTYPE_WEAPON[4] = nil
			BestItems.INVTYPE_WEAPON[5] = nil
			BestItems.INVTYPE_WEAPON[6] = nil
		elseif BestItems.INVTYPE_WEAPONOFFHAND and BestItems.INVTYPE_WEAPONOFFHAND[2] == BestItems.INVTYPE_WEAPON[5] then
			BestItems.INVTYPE_WEAPON[4] = nil
			BestItems.INVTYPE_WEAPON[5] = nil
			BestItems.INVTYPE_WEAPON[6] = nil
		end

		Best1H = BestItems.INVTYPE_WEAPON[1] or 0
		SecondBest1H = BestItems.INVTYPE_WEAPON[4] or 0
	end

	-- Also check if the user is allowed to put one-handed weapons in the off hand.  (Remember that shields
	-- and off-hand frill have been converted into off-hand weapons, and real off-hand weapons will have a
	-- value of zero if they can't be wielded.)
	local CanUseOH = (Scale.Values.IsOffHand == nil or Scale.Values.IsOffHand > PawnIgnoreStatValue)
	-- Now, find which of the scenarios produces the largest final value.
	if		CanUseOH and
			(Best1H + SecondBest1H) >= (Best1H + BestOH) and
			(Best1H + SecondBest1H) >= (BestMH + Best1H) and
			(Best1H + SecondBest1H) >= (BestMH + BestOH)
	then
		-- The best scenario is to use both of the one-handed weapons.
		if BestItems.INVTYPE_WEAPON and BestItems.INVTYPE_WEAPON[1] then
			BestItems.INVTYPE_WEAPONMAINHAND = { BestItems.INVTYPE_WEAPON[1], BestItems.INVTYPE_WEAPON[2], BestItems.INVTYPE_WEAPON[3] }
		else
			BestItems.INVTYPE_WEAPONMAINHAND = nil
		end
		if BestItems.INVTYPE_WEAPON and BestItems.INVTYPE_WEAPON[4] then
			BestItems.INVTYPE_WEAPONOFFHAND = { BestItems.INVTYPE_WEAPON[4], BestItems.INVTYPE_WEAPON[5], BestItems.INVTYPE_WEAPON[6] }
		else
			BestItems.INVTYPE_WEAPONOFFHAND = nil
		end
	elseif	CanUseOH and
			((Best1H + BestOH) >= (Best1H + SecondBest1H) and
			(Best1H + BestOH) >= (BestMH + Best1H) and
			(Best1H + BestOH) >= (BestMH + BestOH))
		or ((not CanUseOH) and
			(Best1H + BestOH) >= (BestMH + BestOH))
	then
		-- The best scenario is to use the best one-handed weapon in the main hand with the best off-hand weapon.
		if BestItems.INVTYPE_WEAPON and BestItems.INVTYPE_WEAPON[1] then
			BestItems.INVTYPE_WEAPONMAINHAND = { BestItems.INVTYPE_WEAPON[1], BestItems.INVTYPE_WEAPON[2], BestItems.INVTYPE_WEAPON[3] }
		else
			BestItems.INVTYPE_WEAPONMAINHAND = nil
		end
	elseif	CanUseOH and
			(BestMH + Best1H) >= (Best1H + SecondBest1H) and
			(BestMH + Best1H) >= (Best1H + BestOH) and
			(BestMH + Best1H) >= (BestMH + BestOH)
	then
		-- The best scenario is to use the best main hand weapon with the best one-handed weapon in the off hand.
		if BestItems.INVTYPE_WEAPON and BestItems.INVTYPE_WEAPON[1] then
			BestItems.INVTYPE_WEAPONOFFHAND = { BestItems.INVTYPE_WEAPON[1], BestItems.INVTYPE_WEAPON[2], BestItems.INVTYPE_WEAPON[3] }
		else
			BestItems.INVTYPE_WEAPONOFFHAND = nil
		end
	else
		-- The best scenario is to use the best main and off-hand weapons and ignore the one-handed weapons.
	end
	BestItems.INVTYPE_WEAPON = nil
end

-- Comparer function for use in sort that sorts items by their name.
function PawnItemComparer(a, b)
	if not b then return a end
	if not a then return b end
	return a.Name < b.Name
end

-- Called whenever the player's inventory changed.  We need to check their currently-equipped items whenever this happens.
PawnOnInventoryChanged = VgerCore.Throttle(.250, function()
	-- Ignore inventory change events before we've finished loading.
	if not PawnIsInitialized then return end
	if not PawnScaleProvidersInitialized then return end
	-- Ignore equipment change events when the player is in combat: they're unlikely to equip a NEW item in combat,
	-- and we wouldn't want this procedure to slow them down even a little.
	if InCombatLockdown() then return end

	PawnCheckInventoryForUpgrades()
end)

-- Called whenever the player vendors or destroys an item.  We need to check their best-item sets for that item and remove it
-- if they just got rid of one of their best items.
function PawnOnItemLost(ItemLink)
	if not ItemLink then return end
	ItemLink = PawnUnenchantItemLink(ItemLink, true)
	if not ItemLink then return end -- If it's, say, a battle pet.
	local _, _, _, _, _, _, _, _, InvType = GetItemInfo(ItemLink)
	if not InvType or InvType == "" or InvType == "INVTYPE_TRINKET" or InvType == "INVTYPE_BAG" or InvType == "INVTYPE_QUIVER" or InvType == "INVTYPE_TABARD" or InvType == "INVTYPE_BODY" then return end
	if InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" then
		InvType = "INVTYPE_WEAPONOFFHAND"
	elseif InvType == "INVTYPE_ROBE" then
		InvType = "INVTYPE_CHEST"
	elseif ((not VgerCore.RangedSlotExists) and (InvType == "INVTYPE_RANGED" or InvType == "INVTYPE_RANGEDRIGHT")) then
		-- A ranged weapon could be one-handed (wands) or two-handed (everything else) but it always goes in the main hand.
		InvType = "INVTYPE_WEAPONMAINHAND"
	end
	local InvType2 = nil
	if InvType == "INVTYPE_WEAPON" then
		InvType = "INVTYPE_WEAPONMAINHAND"
		InvType2 = "INVTYPE_WEAPONOFFHAND"
	end

	local ScaleName, Scale
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		local CharacterOptions = Scale.PerCharacterOptions[PawnPlayerFullName]
		if CharacterOptions then
			local BestItems = CharacterOptions.BestItems
			if BestItems then
				local RemovedItem = false
				-- Okay, this scale has a list of best items.  Look through the list and remove this item if present.
				local ItemsForSlot = BestItems[InvType]
				if ItemsForSlot and (ItemsForSlot[2] == ItemLink or ItemsForSlot[5] == ItemLink) then
					RemovedItem = true
				elseif InvType2 then
					ItemsForSlot = BestItems[InvType2]
					if ItemsForSlot and (ItemsForSlot[2] == ItemLink or ItemsForSlot[5] == ItemLink) then
						RemovedItem = true
					end
				end
				-- If they lost an item from this scale's list of best items, we need to invalidate the best items list for the scale.
				if RemovedItem then
					--VgerCore.Message(VgerCore.Color.Blue .. "Pawn: Warning! You just lost your best " .. _G[InvType] .. " from " .. PawnGetScaleLocalizedName(ScaleName) .. ". :(")
					CharacterOptions.BestItems = nil
				end
			end
		end
	end

	for Slot = 1, 18 do
		if PawnOptions.ItemLevels[Slot] and PawnOptions.ItemLevels[Slot].Link == ItemLink then
			if PawnCommon.ShowSlotDebugInfo then
				VgerCore.Message(Item.Link .. " was destroyed but it was your best in slot " .. Slot .. ", so clearing.")
			end
			PawnOptions.ItemLevels[Slot] = nil
		end
	end
end

-- When an item is locked due to being picked up, remember its ID in case they decide to delete it.
function PawnOnItemLocked(arg1, arg2)
	local ItemLink
	if arg2 == nil then
		ItemLink = GetInventoryItemLink("player", arg1)
	else
		if C_Container and C_Container.GetContainerItemLink then
			ItemLink = C_Container.GetContainerItemLink(arg1, arg2)
		else
			ItemLink = GetContainerItemLink(arg1, arg2)
		end
	end
	if ItemLink then
		PawnLastCursorItemLink = PawnUnenchantItemLink(ItemLink, true)
	else
		PawnLastCursorItemLink = nil
	end
end

-- Takes a list of items and trims it down to only those items that are interesting upgrades.  If none are upgrades, then
-- one of the items is chosen as most valuable.
-- Arguments: List
--	List: A table of items in this format: { Item, RewardType, Usable }
--		Item: An item data table.
--		RewardType: "reward" or "choice".  If "reward", the player is guaranteed to get this item, and it should not be selected as most valuable.
--		Usable: true or false.  If false, the player cannot currently use this item and thus it should not be presented as an upgrade.
--		Additional fields can be present.
-- Returns: List
--	List: The same table passed in, with one additional field added: { ..., Result }
--		Result: "upgrade" if the item is an upgrade, "vendor" if the item is the most valuable choice, "trinket" if the item is a trinket or relic, or nil if none of the above.
function PawnFindInterestingItems(List)
	local Info, _
	local HighestValue, HighestValueInfo = 0, nil
	local DoNotVendor

	for _, Info in pairs(List) do
		if Info.Item.InvType == "INVTYPE_TRINKET" or (Info.Item.ID and (IsArtifactRelicItem and IsArtifactRelicItem(Info.Item.ID))) then
			Info.Result = "trinket"
		end
		local UpgradeInfo, ItemLevelIncrease = PawnIsItemAnUpgrade(Info.Item)
		if Info.Usable and (UpgradeInfo or (PawnCommon.ShowItemLevelUpgrades and ItemLevelIncrease)) then
			-- If it's usable and an upgrade, mark it as such.
			Info.Result = "upgrade"
			-- If it's a choice item, then we shouldn't pick a choice item to vendor.
			if Info.RewardType == "choice" then DoNotVendor = true end
		elseif Info.RewardType == "choice" and (Info.Item.InvType == "INVTYPE_TRINKET" or (Info.Item.ID and (IsArtifactRelicItem and IsArtifactRelicItem(Info.Item.ID)))) then
			-- If one of the choices is a trinket, don't mark any items as vendor items.
			DoNotVendor = true
		elseif (not DoNotVendor) and Info.RewardType == "choice" then
			-- If we haven't already found a choice item upgrade, and this is a choice item, see
			-- if it's the best thing to vendor.
			if Info.Item.Link then
				local _, _, _, _, _, _, _, _, _, _, Value = GetItemInfo(Info.Item.Link)
				if Value and Value > HighestValue then
					HighestValue = Value
					HighestValueInfo = Info
				end
			end
		end
	end

	if (not DoNotVendor) and HighestValueInfo then
		HighestValueInfo.Result = "vendor"
	end

	return List
end

-- Given an item table, returns true if the item is of the player's armor specialization OR if it's not armor
-- at all.  Returns false if it's the wrong type of armor for the current character's class and level.
function PawnIsArmorBestTypeForPlayer(Item)
	local Stats = Item.UnenchantedStats
	if not Stats then return false end
	-- If the item isn't armor then we don't need to check anything.
	if (not Stats.IsCloth) and (not Stats.IsLeather) and (not Stats.IsMail) and (not Stats.IsPlate) then return true end
	-- Different versions of the game have different levels at which classes learn armor types and grow out of older ones.
	local Level = UnitLevel("player")
	local IsLevelForBestArmorType = Level >= PawnBestArmorMinimumLevel
	local IsLevelForSpecialization = PawnArmorSpecializationLevel ~= nil and Level >= PawnArmorSpecializationLevel
	-- Now, the rest depends on the user's class.
	local _, Class = UnitClass("player")
	if Class == "MAGE" or Class == "PRIEST" or Class == "WARLOCK" then
		if Stats.IsCloth then return true else return false end
	elseif Class == "DRUID" or Class == "ROGUE" or Class == "MONK" or Class == "DEMONHUNTER" then
		if IsLevelForSpecialization then
			if Stats.IsLeather then return true else return false end
		elseif Stats.IsLeather or Stats.IsCloth then
			return true
		else
			return false
		end
	elseif Class == "HUNTER" or Class == "SHAMAN" or Class == "EVOKER" then
		if IsLevelForSpecialization then
			if Stats.IsMail then return true else return false end
		elseif Stats.IsLeather or Stats.IsCloth then
			return true
		elseif IsLevelForBestArmorType and Stats.IsMail then
			return true
		else
			return false
		end
	elseif Class == "DEATHKNIGHT" or Class == "PALADIN" or Class == "WARRIOR" then
		if IsLevelForSpecialization then
			if Stats.IsPlate then return true else return false end
		elseif Stats.IsPlate then
			return IsLevelForBestArmorType
		else
			return true
		end
	end
	VgerCore.Fail("PawnIsArmorBestTypeForPlayer didn't know how to handle this item.")
end

-- Appends the strings in a table together with commas and a conjunction ("or ") as appropriate.  The conjunction can be nil, but if it isn't, it should end in a space.
function PawnConcatenateWithConjunction(Table, Conjunction)
	local Size = #Table
	if Conjunction == nil then Conjunction = "" end
	if Size == 0 then
		return ""
	elseif Size == 1 then
		return Table[1]
	elseif Size == 2 then
		return Table[1] .. " " .. Conjunction .. Table[2]
	else
		local Concatenated = ""
		local Index = 1
		local Item, _
		for _, Item in ipairs(Table) do
			if Index == Size then
				Concatenated = Concatenated .. Conjunction .. Item
			else
				Concatenated = Concatenated .. Item .. ", "
			end
			Index = Index + 1
		end
		return Concatenated
	end
end

-- Returns the maximum level an item is a useful heirloom item, or 0 if it never is.  As long as the player's level
-- is equal to or less than this number, this item is always considered superior to other items that don't meet
-- these same requirements.
function PawnGetMaxLevelItemIsUsefulHeirloom(Item)
	if Item.Rarity == 6 then
		-- This is an artifact, so the player won't get anything better until level 50.
		return 49
	-- (In Shadowlands, heirloom XP scaling was removed. But it might come back in a future Classic version.)
	-- elseif Item.UnenchantedStats and Item.UnenchantedStats.MaxScalingLevel then
	-- 	-- This item scales until you reach MaxScalingLevel.
	-- 	return Item.UnenchantedStats.MaxScalingLevel - 1
	else
		-- This item doesn't scale.
		return 0
	end
end

function PawnIsItemAnArtifact(Item)
	if Item and Item.Rarity and Item.Rarity == 6 then return true else return false end
end

function PawnOnSpecChanged()
	if not PawnIsReady() then return end

	-- Don't do anything if they've turned off auto-scales.
	if not PawnOptions.AutoSelectScales then return end

	local _, _, ClassID = UnitClass("player")
	local SpecID = GetSpecialization()
	-- If the player hasn't chosen a spec yet, choose one for them.
	if SpecID == 5 then
		SpecID = PawnNewbieSpec[ClassID]
	end

	-- Disable all scales that don't match the current spec, activate any that do, and then select one
	-- of them in the UI.
	-- Right now, we only take scales from a provider into account, because some code assumes that only one
	-- scale can ever be enabled in Automatic mode.
	local ScaleName, Scale, LastEnabledScaleName, MadeChanges
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		local IsVisible = PawnIsScaleVisible(ScaleName)
		if Scale.ClassID == ClassID and Scale.SpecID == SpecID and Scale.Provider ~= nil then
			if not IsVisible then
				PawnSetScaleVisible(ScaleName, true)
				LastEnabledScaleName = ScaleName
				MadeChanges = true
			end
		else
			if IsVisible then
				PawnSetScaleVisible(ScaleName, false)
				MadeChanges = true
			end
		end
	end
	if MadeChanges then
		-- Don't reset the UI if their spec didn't actually change—this notification can be a bit spammy.
		PawnClearCache()
		PawnInvalidateBestItems()

		PawnUICurrentScale = nil -- Let the refresh method re-set this
		PawnUIFrame_ScaleSelector_Refresh()
		PawnUI_SelectScale(PawnUICurrentScale)
	end
end

function PawnEnableAllScalesForClass()
	local _, _, ClassID = UnitClass("player")
	local ScaleName, Scale, LastEnabledScaleName
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		PawnSetScaleVisible(ScaleName, Scale.ClassID == ClassID)
	end
	PawnUIFrame_ScaleSelector_Refresh()
end

-- Returns the name of a scale that's designed for the specified class and spec, if there is one,
-- or nil if there isn't.  (SpecID is optional, in case of Classic.)
function PawnFindScaleForSpec(ClassID, SpecID)
	if not ClassID then return nil end

	local ScaleName, Scale
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if Scale.ClassID == ClassID and (SpecID == nil or Scale.SpecID == SpecID) and Scale.Provider then return ScaleName end
	end

	return nil
end

-- Called whenever the artifact UI is used.
function PawnOnArtifactUpdated(NewItem)
	-- Compatibility fix with AethysRotation and any other addon that scans artifacts at startup
	if not PawnOptions then return nil end

	-- Get details about this artifact and then cache them.
	local ArtifactItemID, _, ArtifactName = C_ArtifactUI.GetArtifactInfo()
	if not ArtifactItemID then return end
	-- Workaround: the hunter artifact Talonclaw has a longer name than GetArtifactInfo() returns, so when it's seen on tooltips, the strings don't match.  Use the longer name if available.
	--   Item and GetArtifactInfo return: "Talonclaw"
	--   Artifact UI and relic tooltips show: "Talonclaw, Spear of the Wild Gods"
	ArtifactName = C_ArtifactUI.GetArtifactArtInfo().titleName or ArtifactName

	local Artifacts = PawnOptions.Artifacts
	if not Artifacts then
		Artifacts = {}
		PawnOptions.Artifacts = Artifacts
	end
	local ThisArtifact = Artifacts[ArtifactItemID]
	if not ThisArtifact then
		ThisArtifact = { ["Relics"] = {} }
		Artifacts[ArtifactItemID] = ThisArtifact
	end

	ThisArtifact.Name = ArtifactName

	local NumRelicSlots = C_ArtifactUI.GetNumRelicSlots() or 0
	local RelicIndex
	for RelicIndex = 1, NumRelicSlots do
		local _, _, _, ThisRelicItemLink = C_ArtifactUI.GetRelicInfo(RelicIndex)
		local LockedReason = C_ArtifactUI.GetRelicLockedReason(RelicIndex)

		if LockedReason == nil then
			-- Only count relic slots that are unlocked.  (Previously, this had "or UnitLevel("player") >= 110", but that ended up being annoying.)
			local ThisRelic = ThisArtifact.Relics[RelicIndex]
			if not ThisRelic then
				ThisRelic = {}
				ThisArtifact.Relics[RelicIndex] = ThisRelic
			end
			ThisRelic.Type = C_ArtifactUI.GetRelicSlotType(RelicIndex)
			if ThisRelicItemLink then
				-- And, there's a relic for this slot.
				local RelicItemLevel = PawnGetItemLevelIncreaseProvidedByRelic(ThisRelicItemLink)
				ThisRelic.ItemLevel = RelicItemLevel
			end
			-- It's possible for us to not get an item link for the exiting relic if this is called right after logging in (because, for example, another
			-- addon is simulating the shift-right-click).  In that case, we want to just keep whatever we already had cached—don't clear it out.
		else
			-- This relic slot is locked.  If we have anything saved for this slot, clear it out; it was probably saved due to a bug in an earlier Pawn version.
			ThisArtifact.Relics[RelicIndex] = nil
		end

	end
end

-- This function does the same as C_ArtifactUI.GetItemLevelIncreaseProvidedByRelic, but provides two fixes:
-- (1) It works in WoW 7.2, which the in-game method doesn't
-- (2) It works on level-scaled relics, which GetItemStats doesn't
--
-- Also, this method ignores bonus item levels imbued by the Netherlight Crucible.
local PawnTempRelicTable = {}
function PawnGetItemLevelIncreaseProvidedByRelic(ItemLink)
	local Parts = PawnTempRelicTable
	wipe(Parts)

	PawnGetItemLinkParts(ItemLink, Parts)
	-- GetItemStats() on a relic that was looted at 110 and then passed on to a lower-level character will return the stats for the item as if it were dropped at the current, lower level, even though it has the proper stats for a level 110 relic and has a level 110 requirement.  So, adjust the item link to work around that GetItemStats bug.
	local NumParts = #Parts
	if NumParts >= 14 then
		-- Copy the looted ilvl portion of the item link to the player ilvl part of the link.
		local NumBonusIDs = Parts[13]
		local ScalingLevelIndex = 13 + NumBonusIDs + 1
		if NumParts >= ScalingLevelIndex then
			local ScalingLevel = Parts[ScalingLevelIndex]
			if ScalingLevel >= 98 and ScalingLevel <= 110 then
				Parts[9] = ScalingLevel
				ItemLink = PawnGetItemLinkFromParts(Parts)
			else
				-- 0 is a normal case, for non-scaling relics, which don't have this problem and don't need adjustment.
				VgerCore.Assert(ScalingLevel == 0, "Relic level adjustment may have done the wrong thing: changing from " .. tostring(Parts[9]) .. " to " .. tostring(ScalingLevel) .. " due to NumBonusIDs = " .. NumBonusIDs)
			end
		end
	end

	local Stats = Parts
	wipe(Stats)
	Stats = GetItemStats(ItemLink, Stats)
	return Stats.RELIC_ITEM_LEVEL_INCREASE
end

function PawnGetItemLinkParts(ItemLink, ReusableTable)
   local Parts = ReusableTable or {}
   local Match
   for Match in gmatch(ItemLink, ":(%-?%d*)") do
	  if strlen(Match) == 0 then
		 tinsert(Parts, 0)
	  else
		 tinsert(Parts, tonumber(Match))
	  end
   end
   return Parts
end

function PawnGetItemLinkFromParts(Parts)
	return "item:" .. table.concat(Parts, ":")
end

function PawnPrintArtifactDebugInfo()
	VgerCore.Message(" ")
	VgerCore.Message("Pawn knows about these artifacts:")
	local ArtifactItemID, Artifact, UpgradeInfo
	for ArtifactItemID, Artifact in pairs(PawnOptions.Artifacts) do
		VgerCore.Message(ITEM_QUALITY_COLORS[LE_ITEM_QUALITY_ARTIFACT].hex .. Artifact.Name .. "|r:")
		for RelicIndex = 1, 3 do
			local ThisRelic = Artifact.Relics[RelicIndex]
			if ThisRelic then
				local ContentsString = "  Slot " .. RelicIndex .. ": " .. tostring(ThisRelic.Type) .. ", "
				if ThisRelic.ItemLevel then
					ContentsString = ContentsString .. "+" .. ThisRelic.ItemLevel .. " item levels"
				else
					ContentsString = ContentsString .. "empty"
				end
				VgerCore.Message(ContentsString)
			end
		end
	end
end

function PawnGetRelicUpgradeInfo(RelicItemLink)
	-- If we haven't cached any artifacts yet, this can't possibly be an upgrade.
	if not PawnOptions.Artifacts then return end

	local RelicItemID = GetItemInfoInstant(RelicItemLink)
	local _, _, RelicType = C_ArtifactUI.GetRelicInfoByItemID(RelicItemID)
	if not RelicType then return end
	local RelicItemLevel = PawnGetItemLevelIncreaseProvidedByRelic(RelicItemLink)
	if not RelicItemLevel then return end

	local ArtifactItemID, Artifact, UpgradeInfo
	for ArtifactItemID, Artifact in pairs(PawnOptions.Artifacts) do
		local BestRelicItemLevelUpgrade = 0
		local RelicIndex, SlottedRelic
		for RelicIndex, SlottedRelic in pairs(Artifact.Relics) do
			--VgerCore.Message(Artifact.Name .. " slot " .. RelicIndex .. ": " .. SlottedRelic.Type .. " +" .. tostring(SlottedRelic.ItemLevel))
			if RelicType == SlottedRelic.Type then
				local ThisRelicItemLevelUpgrade = RelicItemLevel - (SlottedRelic.ItemLevel or 0)
				--VgerCore.Message("   Increase found: " .. ThisRelicItemLevelUpgrade)
				if ThisRelicItemLevelUpgrade > BestRelicItemLevelUpgrade then BestRelicItemLevelUpgrade = ThisRelicItemLevelUpgrade end
			end
		end
		if BestRelicItemLevelUpgrade > 0 then
			-- Hooray! This relic is an item level upgrade.
			if not UpgradeInfo then UpgradeInfo = {} end
			UpgradeInfo[Artifact.Name] = { ["ItemLevelIncrease"] = BestRelicItemLevelUpgrade }
		end
	end

	return UpgradeInfo
end

function PawnAddRelicUpgradesToTooltip(TooltipName, UpgradeInfo)
	if not UpgradeInfo then return end
	local Tooltip = _G[TooltipName]
	if not Tooltip then
		VgerCore.Fail("Unable to update tooltip " .. tostring(TooltipName) .. " with relic upgrade info because we couldn't find it")
		return
	end

	local i
	local Lines = Tooltip:NumLines()
	for i = 1, Lines do
		local LeftLine = _G[TooltipName .. "TextLeft" .. i]
		local ArtifactName = LeftLine:GetText()

		local ArtifactUpgradeInfo = UpgradeInfo[ArtifactName]
		if ArtifactUpgradeInfo then
			if PawnCommon.AlignNumbersRight then
				local RightLine = _G[TooltipName .. "TextRight" .. i]
				RightLine:SetText(format(PawnLocal.TooltipRelicUpgradeAnnotation, "", ArtifactUpgradeInfo.ItemLevelIncrease, ""))
				RightLine:Show()
			else
				LeftLine:SetText(format(PawnLocal.TooltipRelicUpgradeAnnotation, tostring(ArtifactName) .. ":", ArtifactUpgradeInfo.ItemLevelIncrease, ""))
			end
		end
	end
end

function PawnAddItemToLevelTracker(Item)
	-- PawnOptions.ItemLevels = {
	--   [1] = {
	--      [1] = {
	--        ["Link"] = "|Hitem:12345:...",
	--        ["ID"] = 12345,
	--        ["Level"] = 450,
	--        -- ["AlsoFitsIn"] = 17, -- for items that can fit in a second slot
	--      },
	--      -- [2] also present for ring/trinket/weapon
	-- 	  }
	--   ...
	--   [18] -- one entry for each slot 1-18, skipping 14
	-- }

	if not Item then
		return
	end

	local Slot1, Slot2 = PawnGetSlotsForItemType(Item.InvType)
	if not Slot1 then return end
	if not Item.Level then return end

	if not PawnOptions.ItemLevels then
		PawnOptions.ItemLevels = {}
	end

	-- First, check to see if we already know about this item.
	local Known1 = PawnOptions.ItemLevels[Slot1]
	if Known1 and Item.Link == Known1.Link then return end
	local Known2 = PawnOptions.ItemLevels[Slot2]
	if Known2 and Item.Link == Known2.Link then return end

	-- Okay, it's an equippable item that we aren't tracking, so check it.
	local PutNewItemInSlot
	if not Known1 then
		-- There's not already an item in that slot, so let's put this one there.
		PutNewItemInSlot = Slot1
	elseif Item.Level > Known1.Level then
		-- This item is better than their current best in the primary slot.
		-- Before overwriting it, let's see if that item needs to be bumped down to another slot.
		local BumpSlot = Known1.AlsoFitsIn
		if BumpSlot and (PawnOptions.ItemLevels[BumpSlot] == nil or Known1.Level > PawnOptions.ItemLevels[BumpSlot].Level) then
			-- Yes, bump the existing item in the primary slot down to the other slot it fits in.
			if PawnCommon.ShowSlotDebugInfo then
				VgerCore.Message("Bumping " .. Known1.Link .. " down from slot " .. Slot1 .. " to " .. Known1.AlsoFitsIn .. ".")
			end
			PawnOptions.ItemLevels[BumpSlot] = Known1
			PawnOptions.ItemLevels[BumpSlot].AlsoFitsIn = Slot1
		end
		-- Okay, now put this item in our records for this slot.
		PutNewItemInSlot = Slot1
	elseif Slot2 and not Known2 then
		PutNewItemInSlot = Slot2
	elseif Slot2 and Item.Level > Known2.Level then
		-- This item is better than their current best in the secondary slot.
		-- But before overwriting, check to see if it needs to be bumped UP to the primary slot: rare, but possible.
		local BumpSlot = Known2.AlsoFitsIn
		if BumpSlot and (PawnOptions.ItemLevels[BumpSlot] == nil or Known2.Level > PawnOptions.ItemLevels[BumpSlot].Level) then
			-- Yes, bump the existing item in the primary slot down to the other slot it fits in.
			if PawnCommon.ShowSlotDebugInfo then
				VgerCore.Message("Bumping " .. Known2.Link .. " up from slot " .. Slot2 .. " to " .. Known2.AlsoFitsIn .. ".")
			end
			PawnOptions.ItemLevels[BumpSlot] = Known2
			PawnOptions.ItemLevels[BumpSlot].AlsoFitsIn = Slot2
		end
		-- Okay, now put this item in our records for this slot.
		PutNewItemInSlot = Slot2
	end

	if PutNewItemInSlot then
		if PawnCommon.ShowSlotDebugInfo then
			VgerCore.Message(Item.Link .. " is now your best item in slot " .. PutNewItemInSlot .. ".")
		end
		local AlsoFitsIn
		if PutNewItemInSlot == Slot1 and Slot2 ~= nil then
			AlsoFitsIn = Slot2
		elseif PutNewItemInSlot == Slot2 then
			AlsoFitsIn = Slot1
		end
		PawnOptions.ItemLevels[PutNewItemInSlot] = { ["Link"] = Item.Link, ["ID"] = PawnGetItemIDFromLink(Item.Link), ["Level"] = Item.Level, ["AlsoFitsIn"] = AlsoFitsIn }

		if PawnCommon.ShowSlotDebugInfo then
			PawnShowSlotDebugInfo()
		end
	end
end

function PawnShowSlotDebugInfo()
	if not PawnOptions.ItemLevels then return end
	local BestItemsDebugInfo = "Best items: "
	local Slot
	for Slot = 1, 18 do
		if PawnOptions.ItemLevels[Slot] then
			BestItemsDebugInfo = BestItemsDebugInfo .. tostring(PawnOptions.ItemLevels[Slot].Link) .. "=" .. PawnOptions.ItemLevels[Slot].Level .. " "
		end
	end
	VgerCore.Message(BestItemsDebugInfo)
end

-- If this is an item level upgrade versus any of your items, returns the ilvl difference, or otherwise nil.
function PawnIsItemAnItemLevelUpgrade(Item)
	if not Item or not Item.Level or not PawnOptions.ItemLevels then return end
	if not Item.CanEquip then return end

	local Slot1, Slot2 = PawnGetSlotsForItemType(Item.InvType)
	if (Slot1 and PawnOptions.ItemLevels[Slot1] and Item.Link == PawnOptions.ItemLevels[Slot1].Link) or (Slot2 and PawnOptions.ItemLevels[Slot2] and Item.Link == PawnOptions.ItemLevels[Slot2].Link) then
		-- If the item is already one of your best, it can't be an upgrade.
		return
	end

	local Difference
	if Slot1 and PawnOptions.ItemLevels[Slot1] and Item.Level > PawnOptions.ItemLevels[Slot1].Level then
		Difference = Item.Level - PawnOptions.ItemLevels[Slot1].Level
	end
	if Slot2 and PawnOptions.ItemLevels[Slot2] and Item.Level > PawnOptions.ItemLevels[Slot2].Level + (Difference or 0) then
		Difference = Item.Level - PawnOptions.ItemLevels[Slot2].Level
	end
	return Difference
end

-- Returns: IsPlayingWith, UnitID
--   IsPlayingWith: True if the the user is playing with the target player.
--   UnitID: The unit ID of the target player ("party3" etc.).
function PawnIsPlayingWith(TargetName, TargetRealm)
	-- If this player IS the target, then obviously not.
	if UnitName("player") == TargetName then return false end

	-- Is this player on the target's realm?
	local IsOnTargetRealm = GetRealmName() == TargetRealm

	-- Look through the current group roster for the target.
	local _, i
	if IsInRaid() then
	   local TargetNameAndRealm = IsOnTargetRealm and TargetName or (TargetName .. "-" .. TargetRealm)
	   for i = 1, GetNumGroupMembers() do
		  local Name = GetRaidRosterInfo(i)
		  if Name == TargetNameAndRealm then return true, ("raid" .. i) end
	   end
	else
	   for i = 1, GetNumSubgroupMembers() do
		  local Name, Realm = UnitName("party" .. i)
		  if Name == TargetName and ((Realm == TargetRealm) or (Realm == nil and IsOnTargetRealm)) then return true, ("party" .. i) end
	   end
	end

	-- Guess the target isn't in the group!
	return false

 end

 -- Shows the "you're playing with Vger" Easter Egg if appropriate.
 -- Pass true to always show the Easter Egg regardless of current group configuration.
 function PawnShowPlayingWithVgerEasterEgg(Test)
	-- Should we show it?
	local UnitID
	if Test then
		UnitID = "player"
	else
		if not VgerCore.IsMainline then return end
		if PawnCommon.HasPlayedWithVger then return end
		local Show
		Show, UnitID = PawnIsPlayingWith("Vger", "Azjol-Nerub")
		if not Show then return end
	end

	-- Okay, we're gonna do it!

	LoadAddOn("Blizzard_TalkingHeadUI")

	TalkingHeadFrame_Reset(TalkingHeadFrame, "Hello!  I created your favorite addon Pawn.  Looks like we're playing together, so feel free to say hi, and have a great day!", "Vger")
	TalkingHeadFrame.MainFrame.Model:SetUnit("player")
	TalkingHeadFrame_FadeinFrames()
	TalkingHeadFrame:Show()
	TalkingHeadFrame.MainFrame.Model:RefreshCamera()
	Model_ApplyUICamera(TalkingHeadFrame.MainFrame.Model, 105) -- Head and torso
	TalkingHeadFrame.MainFrame.Model:SetAnimation(60) -- Talking animation
	PlaySound(101228, "DIALOG") -- "Do you know who I am?"

	C_Timer.After(15, function() TalkingHeadFrame_FadeoutFrames() end)

	-- Once this has happened, don't ever do it again.
	PawnCommon.HasPlayedWithVger = true
end

------------------------------------------------------------
-- Pawn API
------------------------------------------------------------

-- Returns true if Pawn is ready to calculate scores and upgrades and all of that stuff.  (It's false while the user's UI is still loading.)
function PawnIsReady()
	return PawnIsInitialized
end

-- Resets all custom Pawn scales.
function PawnResetScales()
	return PawnResetScalesCore(true, false)
end

-- Resets all read-only scales from scale providers.
function PawnResetProviderScales()
	return PawnResetScalesCore(false, true)
end

-- Common code for scale resetting functions.
function PawnResetScalesCore(ResetCustomScales, ResetProviderScales)
	if not PawnIsInitialized then VgerCore.Fail("Can't reset scales until Pawn is initialized") return end

	local ScaleName, Scale, _
	local ScalesToRemove = {}
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if (ResetProviderScales and Scale.Provider) or (ResetCustomScales and ScaleProvider == nil) then tinsert(ScalesToRemove, ScaleName) end
	end
	for _, ScaleName in pairs(ScalesToRemove) do
		PawnCommon.Scales[ScaleName] = nil
	end
	PawnResetTooltips()
	return true
end

-- Adds a new scale with no values.  Returns true if successful.
function PawnAddEmptyScale(ScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't add scales until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: PawnAddEmptyScale(\"ScaleName\")")
		return false
	elseif PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName cannot be the name of an existing scale, and is case-sensitive.")
		return false
	end

	PawnCommon.Scales[ScaleName] = PawnGetEmptyScale()
	PawnCommon.Scales[ScaleName].PerCharacterOptions[PawnPlayerFullName] = { }
	PawnCommon.Scales[ScaleName].PerCharacterOptions[PawnPlayerFullName].Visible = true
	PawnRecalculateScaleTotal(ScaleName)
	return true
end

-- Adds a new scale with the default values.  Returns true if successful.
-- The scale returned will be for the current class and spec unless they're supplied as parameters.
function PawnAddDefaultScale(ScaleName, ClassID, SpecID)
	if not PawnIsInitialized then VgerCore.Fail("Can't add scales until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: PawnAddDefaultScale(\"ScaleName\")")
		return false
	elseif PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName cannot be the name of an existing scale, and is case-sensitive.")
		return false
	end

	PawnCommon.Scales[ScaleName] = PawnGetDefaultScale(ClassID, SpecID)
	PawnCommon.Scales[ScaleName].PerCharacterOptions[PawnPlayerFullName] = { }
	PawnCommon.Scales[ScaleName].PerCharacterOptions[PawnPlayerFullName].Visible = true
	PawnRecalculateScaleTotal(ScaleName)
	PawnResetTooltips()
	return true
end

-- Deletes a scale.  Returns true if successful.
function PawnDeleteScale(ScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't delete scales until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: PawnDeleteScale(\"ScaleName\")")
		return false
	elseif not PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return false
	elseif PawnScaleIsReadOnly(ScaleName) then
		VgerCore.Fail("ScaleName cannot be the name of a read-only scale.")
		return false
	end

	PawnCommon.Scales[ScaleName] = nil
	PawnRecalculateScaleTotal(ScaleName)
	PawnResetTooltips()
	return true
end

-- Renames an existing scale.  Returns true if successful.
function PawnRenameScale(OldScaleName, NewScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't rename scales until Pawn is initialized") return end

	if (not OldScaleName) or (OldScaleName == "") or (not NewScaleName) or (NewScaleName == "") then
		VgerCore.Fail("OldScaleName and NewScaleName cannot be empty.  Usage: PawnRenameScale(\"OldScaleName\", \"NewScaleName\")")
		return false
	elseif OldScaleName == NewScaleName then
		VgerCore.Fail("OldScaleName and NewScaleName cannot be the same.")
		return false
	elseif not PawnCommon.Scales[OldScaleName] then
		VgerCore.Fail("OldScaleName must be the name of an existing scale, and is case-sensitive.")
		return false
	elseif PawnCommon.Scales[NewScaleName] then
		VgerCore.Fail("NewScaleName cannot be the name of an existing scale, and is case-sensitive.")
		return false
	elseif PawnScaleIsReadOnly(ScaleName) then
		VgerCore.Fail("ScaleName cannot be the name of a read-only scale.")
		return false
	end

	PawnCommon.Scales[NewScaleName] = PawnCommon.Scales[OldScaleName]
	PawnCommon.Scales[OldScaleName] = nil
	PawnRecalculateScaleTotal(OldScaleName)
	PawnRecalculateScaleTotal(NewScaleName)
	PawnResetTooltips()
	return true
end

-- Creates a new scale based on an old one.  Returns true if successful.
function PawnDuplicateScale(OldScaleName, NewScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't duplicate scales until Pawn is initialized") return end

	if (not OldScaleName) or (OldScaleName == "") or (not NewScaleName) or (NewScaleName == "") then
		VgerCore.Fail("OldScaleName and NewScaleName cannot be empty.  Usage: PawnDuplicateScale(\"OldScaleName\", \"NewScaleName\")")
		return false
	elseif OldScaleName == NewScaleName then
		VgerCore.Fail("OldScaleName and NewScaleName cannot be the same.")
		return false
	elseif not PawnCommon.Scales[OldScaleName] then
		VgerCore.Fail("OldScaleName must be the name of an existing scale, and is case-sensitive.")
		return false
	elseif PawnCommon.Scales[NewScaleName] then
		VgerCore.Fail("NewScaleName cannot be the name of an existing scale, and is case-sensitive.")
		return false
	end

	-- Create the copy.
	PawnCommon.Scales[NewScaleName] = {}
	PawnCommon.Scales[NewScaleName].Color = PawnCommon.Scales[OldScaleName].Color
	PawnCommon.Scales[NewScaleName].Role = PawnCommon.Scales[OldScaleName].Role
	PawnCommon.Scales[NewScaleName].ClassID = PawnCommon.Scales[OldScaleName].ClassID
	PawnCommon.Scales[NewScaleName].SpecID = PawnCommon.Scales[OldScaleName].SpecID
	PawnCommon.Scales[NewScaleName].IconTexturePath = PawnCommon.Scales[OldScaleName].IconTexturePath
	PawnCommon.Scales[NewScaleName].NormalizationFactor = PawnCommon.Scales[OldScaleName].NormalizationFactor
	PawnCommon.Scales[NewScaleName].PerCharacterOptions = {}
	PawnCommon.Scales[NewScaleName].PerCharacterOptions[PawnPlayerFullName] = {}
	PawnCommon.Scales[NewScaleName].PerCharacterOptions[PawnPlayerFullName].Visible = true
	PawnCommon.Scales[NewScaleName].Values = {}
	local NewScale = PawnCommon.Scales[NewScaleName].Values
	for StatName, Value in pairs(PawnCommon.Scales[OldScaleName].Values) do
		NewScale[StatName] = Value
	end

	-- Do post-copy calculations, and we're done.
	PawnRecalculateScaleTotal(NewScaleName)
	PawnResetTooltips()
	return true
end

-- Returns the value of one stat in a scale, or nil if unsuccessful.
function PawnGetStatValue(ScaleName, StatName)
	if not PawnIsInitialized then VgerCore.Fail("Can't get a stat value until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") or (not StatName) or (StatName == "") then
		VgerCore.Fail("ScaleName and StatName cannot be empty.  Usage: x = PawnGetStatValue(\"ScaleName\", \"StatName\")")
		return nil
	elseif not PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end

	return PawnCommon.Scales[ScaleName].Values[StatName]
end

-- Returns true if a particular scale exists, or false if not.
function PawnDoesScaleExist(ScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't check scales until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: x = PawnDoesScaleExist(\"ScaleName\")")
		return false
	end

	if PawnCommon.Scales[ScaleName] then
		return true
	else
		return false
	end
end

-- Returns a table of all stats and their values for a particular scale, or nil if unsuccessful.
-- This returns the actual internal table of stat values, so be careful not to modify it!
function PawnGetAllStatValues(ScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't get scale info until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: x = PawnGetAllStatValues(\"ScaleName\")")
		return nil
	elseif not PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end

	--local TableCopy = {}
	--for StatName, Value in pairs(PawnCommon.Scales[ScaleName].Values) do
	--	TableCopy[StatName] = Value
	--end
	--return TableCopy
	return PawnCommon.Scales[ScaleName].Values
end

-- Sets the value of one stat in a scale.  Returns true if successful.
-- Use 0 or nil as the Value to remove a stat from the scale.
function PawnSetStatValue(ScaleName, StatName, Value)
	if not PawnIsInitialized then VgerCore.Fail("Can't change scales until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") or (not StatName) or (StatName == "") then
		VgerCore.Fail("ScaleName and StatName cannot be empty.  Usage: PawnSetStatValue(\"ScaleName\", \"StatName\", Value)")
		return false
	elseif not PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return false
	elseif PawnScaleIsReadOnly(ScaleName) then
		VgerCore.Fail("ScaleName cannot be the name of a read-only scale.")
		return false
	end

	if Value == 0 then Value = nil end
	PawnCommon.Scales[ScaleName].Values[StatName] = Value
	PawnRecalculateScaleTotal(ScaleName) -- also recalculates socket values
	PawnInvalidateBestItemsForScale(ScaleName)
	PawnResetTooltips()
	return true
end

-- Returns the number of visible scales for the current character.
function PawnGetVisibleScaleCount()
	local Count = 0
	local ScaleName, Scale
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if PawnIsScaleVisible(ScaleName) and ((not Scale.Provider) or (Scale.ProviderActive)) then
			Count = Count + 1
		end
	end

	return Count
end

-- Returns a table of all Pawn scale names.  Returns all custom scales not from scale providers, whether visible or not.
-- For more information in one big table, use PawnGetAllScalesEx.  This method is provided here for backwards compatibility.
-- DEPRECATED
function PawnGetAllScales()
	if not PawnIsInitialized then VgerCore.Fail("Can't get scale list until Pawn is initialized") return end

	local TableCopy = {}
	local ScaleName, Scale
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if (not Scale.Provider) or (Scale.ProviderActive) then
			-- Don't include scales from a provider that isn't active any longer.  (Abandoned provider scales)
			tinsert(TableCopy, ScaleName)
		end
	end
	sort(TableCopy, VgerCore.CaseInsensitiveComparer)
	return TableCopy
end

-- Return a sorted table of all Pawn scale names and some data about each scale.
-- Each element in the table returned is a table with these values:
-- 	{ Name, LocalizedName, Header, IsVisible }
-- 	Name: The internal name of the scale.  Examples: "My custom scale"; "\"Wowhead\":DruidFeralDps"
-- 	LocalizedName: The display name of the scale.  Examples: "My custom scale"; "Druid feral DPS"
-- 	Header: The header text to display above this scale.  Examples: "Vger's scales"; "Wowhead scales"
-- 	IsVisible: Whether or not this scale is visible for the current character.  Examples: true, true
--	IsProvider: Whether or not this scale comes from a scale provider.  Examples: true, false
function PawnGetAllScalesEx()
	if not PawnIsInitialized then VgerCore.Fail("Can't get scale list until Pawn is initialized") return end

	local TableCopy = {}
	local ScaleName, Scale
	local ActiveScalesHeader = format(PawnLocal.VisibleScalesHeader, UnitName("player"))
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		local IsVisible = PawnIsScaleVisible(ScaleName)
		local ScaleData =
		{
			["Name"] = ScaleName,
			["LocalizedName"] = Scale.LocalizedName or ScaleName,
			["IsVisible"] = IsVisible,
			["IsProvider"] = Scale.Provider ~= nil
		}
		if IsVisible then
			ScaleData.Header = ActiveScalesHeader
		elseif Scale.Provider and Scale.ProviderActive then
			ScaleData.Header = PawnScaleProviders[Scale.Provider].Name
		else
			ScaleData.Header = PawnLocal.HiddenScalesHeader
		end
		if (not Scale.Provider) or (Scale.ProviderActive) then
			-- Don't include scales from a provider that isn't active any longer.  (Abandoned provider scales)
			tinsert(TableCopy, ScaleData)
		--else
		--	VgerCore.Message("Not including " .. ScaleName .. " because it seems to be abandoned.")
		end
	end
	sort(TableCopy, PawnGetAllScalesExComparer)

	return TableCopy
end

-- Sort function used by PawnGetAllScalesEx.  Returns true if a should sort before b.
function PawnGetAllScalesExComparer(a, b)
	if not b then return a end
	if not a then return b end
	-- First, if one is visible and the other is not, then sort the visible ones first.
	local AVisible = a.IsVisible
	local BVisible = b.IsVisible
	if AVisible and not BVisible then return true end
	if BVisible and not AVisible then return false end
	-- They're both the same visibility.  Sort custom (non-provider) scales first.
	local AIsProvider = a.IsProvider
	local BIsProvider = b.IsProvider
	if AIsProvider and not BIsProvider then return false end
	if BIsProvider and not AIsProvider then return true end
	-- Then, sort by provider.
	if AIsProvider or BIsProvider then
		local AProvider = PawnGetProviderNameFromScale(a.Name)
		local BProvider = PawnGetProviderNameFromScale(b.Name)
		if AProvider and BProvider and AProvider ~= BProvider then
			return strlower(PawnGetProviderLocalizedName(AProvider)) < strlower(PawnGetProviderLocalizedName(BProvider))
		end
	end
	-- If both scales are from the same provider, then just sort by display name, case-insensitive.
	return strlower(a.LocalizedName) < strlower(b.LocalizedName)
end

-- Changes the normalization factor for a scale.  (Expected values are 1/true and 0/false/nil.)
function PawnSetScaleNormalizationFactor(ScaleName, Value)
	if not PawnIsInitialized then VgerCore.Fail("Can't alter scales until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if not ScaleName or ScaleName == "" or not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return false
	elseif PawnScaleIsReadOnly(ScaleName) then
		VgerCore.Fail("Can't change a read-only scale.")
		return false
	end

	if Value == true then Value = 1 elseif Value == 0 or Value == false then Value = nil end
	Scale.NormalizationFactor = Value
	PawnInvalidateBestItemsForScale(PawnUICurrentScale) -- it'll be the same items as before, but with new values
	PawnResetTooltips()
	return true
end

-- Creates a Pawn scale tag for a scale.
--	Parameters: ScaleName
--		ScaleName: The name of a Pawn scale.
--	Return value: ScaleTag, or nil if unsuccessful.
--		ScaleTag: A Pawn scale tag.  Example:  '( Pawn: v1: "Healbot": Stamina=1, Intellect=1.24, IsSword=X )'
function PawnGetScaleTag(ScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't export scales until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: PawnGetScaleTag(\"ScaleName\")")
		return
	elseif not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return
	elseif not Scale.Values then
		return
	end

	-- Concatenate the stats.
	local ScaleFriendlyName = PawnGetScaleLocalizedName(ScaleName)
	local ScaleTag = "( Pawn: v" .. PawnCurrentScaleVersion .. ": \"" .. ScaleFriendlyName .. "\": "
	local AddComma = false
	local TemplateStats
	if Scale.ClassID then
		ScaleTag = ScaleTag .. "Class=" .. PawnGetEnglishClassNameFromID(Scale.ClassID)
		if Scale.SpecID then
			ScaleTag = ScaleTag .. ", Spec=" .. PawnGetEnglishSpecNameFromID(Scale.ClassID, Scale.SpecID)
		end
		AddComma = true
		TemplateStats = PawnGetStatValuesForTemplate(PawnFindScaleTemplate(Scale.ClassID, Scale.SpecID), true)
	end
	local IncludeThis
	for StatName, Value in pairs(Scale.Values) do
		local IncludeThis = (Value and Value ~= 0)
		if IncludeThis and TemplateStats and Value == TemplateStats[StatName] then
			-- If class and spec are included, don't include things that are already in the template.
			IncludeThis = false
		end
		if IncludeThis then
			if AddComma then ScaleTag = ScaleTag .. ", " end
			local ValueAsString
			if Value == PawnIgnoreStatValue then
				ValueAsString = "X"
			else
				ValueAsString = tostring(Value)
			end
			ScaleTag = ScaleTag .. StatName .. "=" .. ValueAsString
			AddComma = true
		end
	end

	ScaleTag = ScaleTag .. " )"
	return ScaleTag
end

-- Imports a Pawn scale tag, adding that scale to the current character.
--	Parameters: ScaleTag, Overwrite
--		ScaleTag: A Pawn scale tag to add.  Example:  '( Pawn: v1: "Healbot": Stamina=1, Intellect=1.24 )'
--		Overwrite: If true, this function will overwrite an existing scale with the same name.
--	Return value: Status, ScaleName
--		Status: One of the PawnImportScaleResult* constants.
--		ScaleName: The name of the Pawn scale specified by ScaleTag, or nil if ScaleTag could not be parsed.
function PawnImportScale(ScaleTag, Overwrite)
	if not PawnIsInitialized then VgerCore.Fail("Can't import scales until Pawn is initialized") return end

	local ScaleName, Values = PawnParseScaleTag(ScaleTag)
	if not ScaleName then
		-- This tag couldn't be parsed.
		return PawnImportScaleResultTagError
	end

	-- The "Class" and "Spec" parameters aren't actually stat values, so take them out of the list now.
	local UnlocalizedClassName, IconTexturePath, Role
	local ClassID = Values.Class
	Values.Class = nil
	if ClassID then _, UnlocalizedClassName = PawnGetClassInfo(ClassID) end
	local SpecID = Values.Spec
	Values.Spec = nil
	if SpecID and not ClassID then
		SpecID = nil
	elseif SpecID and (not VgerCore.SpecsExist) then
		SpecID = nil
	end
	if SpecID then _, _, _, IconTexturePath, Role = PawnGetSpecializationInfoForClassID(ClassID, SpecID) end

	local AlreadyExists = PawnCommon.Scales[ScaleName] ~= nil
	if AlreadyExists and (PawnScaleIsReadOnly(ScaleName) or not Overwrite) then
		-- A scale with this name already exists.  You can't import a scale with the same name as an existing one,
		-- unless you specify Overwrite = true.
		return PawnImportScaleResultAlreadyExists, ScaleName
	end

	-- Looks like everything's okay.  Import the scale.  If the scale already exists but Overwrite = true was passed,
	-- don't change other options about this scale, such as the color.

	if not AlreadyExists then
		if ClassID and (SpecID or not VgerCore.SpecsExist) then
			PawnCommon.Scales[ScaleName] = PawnGetDefaultScale(ClassID, SpecID, true)
			local Color = strsub(RAID_CLASS_COLORS[UnlocalizedClassName].colorStr, 3)
			-- Choose a lighter color for death knights so it's easier to read.
			if ClassID == 6 then Color = "ff4d6b" end
			PawnCommon.Scales[ScaleName].Color = Color
		else
			PawnCommon.Scales[ScaleName] = PawnGetEmptyScale()
		end
		PawnCommon.Scales[ScaleName].PerCharacterOptions[PawnPlayerFullName] = { }
		PawnCommon.Scales[ScaleName].PerCharacterOptions[PawnPlayerFullName].Visible = true
	end
	local NewScale = PawnCommon.Scales[ScaleName]
	NewScale.ClassID = ClassID
	NewScale.SpecID = SpecID
	NewScale.IconTexturePath = IconTexturePath
	NewScale.Role = Role

	-- Merge the scale tag's stats into the template's (or the existing scale's) stats.
	local StatName, Value
	for StatName, Value in pairs(Values) do
		NewScale.Values[StatName] = Value
	end
	PawnCorrectScaleErrors(ScaleName)

	PawnRecalculateScaleTotal(ScaleName)
	if AlreadyExists then PawnInvalidateBestItemsForScale(ScaleName) end
	PawnResetTooltips()
	return PawnImportScaleResultSuccess, ScaleName
end

-- Sets the visibility of all scales from a particular scale provider to be visible or hidden in a single operation.
function PawnSetAllScaleProviderScalesVisible(ProviderInternalName, Visible)
	if not PawnIsInitialized then VgerCore.Fail("Can't show or hide providers until Pawn is initialized") return end

	if (not PawnPlayerFullName) then
		VgerCore.Fail("PawnSetAllScaleProviderScalesVisible failed because Pawn didn't know your character's name yet.")
		return nil
	end
	if (not ProviderInternalName) or (ProviderInternalName == "") then
		VgerCore.Fail("ProviderInternalName cannot be empty.  Usage: PawnSetAllScaleProviderScalesVisible(\"ProviderInternalName\", Visible)")
		return nil
	end

	-- Using the provider internal name provided, produce a prefix that we'll search for in the list of scales.  This works because
	-- the format of a provider scale is "ProviderName":ScaleName.
	local ScaleNamePrefix = PawnGetProviderScaleName(ProviderInternalName, "")

	-- Loop through all scales and turn them on or off.
	local ScaleName, Scale
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if strfind(ScaleName, ScaleNamePrefix, 1, true) == 1 then
			if Scale.PerCharacterOptions == nil then Scale.PerCharacterOptions = {} end
			if Scale.PerCharacterOptions[PawnPlayerFullName] == nil then Scale.PerCharacterOptions[PawnPlayerFullName] = {} end
			Scale.PerCharacterOptions[PawnPlayerFullName].Visible = Visible
			PawnResetTooltips()
		end
	end
	return true
end

-- Enables or disables the auto-scale feature.
function PawnSetAutoSelectScales(Enable)
	VgerCore.Assert(Enable ~= nil, "Enable parameter must be true or false.")
	if PawnOptions.AutoSelectScales == Enable then return end

	PawnOptions.AutoSelectScales = Enable
	if Enable then
		PawnOnSpecChanged()
	else
		PawnEnableAllScalesForClass()
	end
end

-- Sets whether or not a scale is visible.  If Visible is nil, it will be considered as false.
function PawnSetScaleVisible(ScaleName, Visible)
	if not PawnIsInitialized then VgerCore.Fail("Can't show and hide scales until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: PawnSetScaleVisible(\"ScaleName\", Visible)")
		return nil
	elseif not PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName (" .. tostring(ScaleName) .. ") must be the name of an existing scale, and is case-sensitive.")
		return nil
	end

	local Scale = PawnCommon.Scales[ScaleName]
	if Scale.PerCharacterOptions == nil then Scale.PerCharacterOptions = {} end
	if Scale.PerCharacterOptions[PawnPlayerFullName] == nil then Scale.PerCharacterOptions[PawnPlayerFullName] = {} end
	if Scale.PerCharacterOptions[PawnPlayerFullName].Visible ~= Visible then
		Scale.PerCharacterOptions[PawnPlayerFullName].Visible = Visible
		PawnResetTooltips()
	end
	return true
end

-- Returns true if a given scale is visible in tooltips.
function PawnIsScaleVisible(ScaleName)
	if not PawnCommon then VgerCore.Fail("Can't check scale visibility until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: x = PawnIsScaleVisible(\"ScaleName\")")
		return nil
	elseif not PawnCommon.Scales[ScaleName] then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end

	local Scale = PawnCommon.Scales[ScaleName]
	if Scale.PerCharacterOptions == nil then
		VgerCore.Fail("All per-character options for " .. ScaleName .. " were missing.")
		return false
	end
	if Scale.PerCharacterOptions[PawnPlayerFullName] == nil then return false end
	return Scale.PerCharacterOptions[PawnPlayerFullName].Visible
end

-- Gets the color of a scale in hex format.  If the scale doesn't specify a color, the default is returned.
-- If Unenchanted is true, then the unenchanted color for the scale is returned.
function PawnGetScaleColor(ScaleName, Unenchanted)
	if not PawnIsInitialized then VgerCore.Fail("Can't get scale colors until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: rrggbb = PawnGetScaleColor(\"ScaleName\", Unenchanted)")
		return VgerCore.Color.Blue
	end
	local Scale = PawnCommon.Scales[ScaleName]
	if not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return VgerCore.Color.Blue
	end

	if Unenchanted then
		if Scale.UnenchantedColor and strlen(Scale.UnenchantedColor) == 6 then return "|cff" .. Scale.UnenchantedColor end
		return VgerCore.Color.DarkBlue
	else
		if Scale.Color and strlen(Scale.Color) == 6 then return "|cff" .. Scale.Color end
		return VgerCore.Color.Blue
	end
end

-- Sets the color of a scale in six-character hex format.  The unenchanted color for the scale will also be set
-- to a slightly darker color. (Use nil for HexColor to reset the scale to the default color.)
function PawnSetScaleColor(ScaleName, HexColor)
	if not PawnIsInitialized then VgerCore.Fail("Can't change scale colors until Pawn is initialized") return end

	if (not ScaleName) or (ScaleName == "") then
		VgerCore.Fail("ScaleName cannot be empty.  Usage: PawnGetScaleColor(\"ScaleName\", \"rrggbb\")")
		return nil
	end
	local Scale = PawnCommon.Scales[ScaleName]
	if not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end
	if HexColor and strlen(HexColor) ~= 6 then
		VgerCore.Fail("HexColor must be a six-digit hexadecimal color code, such as '66c0ff'.")
		return nil
	end

	if HexColor then
		local r, g, b = VgerCore.HexToRGB(HexColor)
		Scale.Color = HexColor
		Scale.UnenchantedColor = VgerCore.RGBToHex(r * PawnScaleColorDarkFactor, g * PawnScaleColorDarkFactor, b * PawnScaleColorDarkFactor)
	else
		Scale.Color = nil
		Scale.UnenchantedColor = nil
	end
end

-- Gets whether a stat is a 1-handed weapon stat, a 2-handed weapon stat, or neither.  (Only tracks things that go into either the main hand
-- or off-hand slot.  Ranged weapons are neither.)
function PawnGetWeaponSetForStat(StatName)
	if StatName == "IsAxe" or StatName == "IsDagger" or StatName == "IsFist" or StatName == "IsMace" or StatName == "IsSword" or StatName == "IsWarglaive" or StatName == "IsOffHand" or StatName == "IsFrill" then
		return 1
	elseif StatName == "Is2HAxe" or StatName == "Is2HMace" or StatName == "IsPolearm" or StatName == "IsStaff" or StatName == "Is2HSword" then
		return 2
	else
		return nil
	end
end

-- Gets whether or not upgrades are shown for either 1- or 2-handed weapons.
function PawnGetShowUpgradesForWeapons(ScaleName, WeaponSet)
	if not PawnIsInitialized then VgerCore.Fail("Can't change upgrade settings until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if (not ScaleName) or (ScaleName == "") or not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end
	if WeaponSet ~= 1 and WeaponSet ~= 2 then
		VgerCore.Fail("WeaponSet must be 1 or 2.")
		return nil
	end

	if WeaponSet == 1 then
		return not Scale.DoNotShow1HUpgrades
	else
		return not Scale.DoNotShow2HUpgrades
	end
end

-- Sets whether or not upgrades are shown for either 1- or 2-handed weapons.
function PawnSetShowUpgradesForWeapons(ScaleName, WeaponSet, ShowUpgrades)
	if not PawnIsInitialized then VgerCore.Fail("Can't change weapon upgrade settings until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if (not ScaleName) or (ScaleName == "") or not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end
	if WeaponSet ~= 1 and WeaponSet ~= 2 then
		VgerCore.Fail("WeaponSet must be 1 or 2.")
		return nil
	end

	if WeaponSet == 1 then
		Scale.DoNotShow1HUpgrades = not ShowUpgrades
	else
		Scale.DoNotShow2HUpgrades = not ShowUpgrades
	end
	PawnInvalidateBestItemsForScale(ScaleName)
	PawnResetTooltips()
end

-- Gets whether only the current player's best armor type is shown for upgrades after level 50.
function PawnGetUpgradesFollowSpecialization(ScaleName)
	if not PawnIsInitialized then VgerCore.Fail("Can't get armor upgrade settings until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if (not ScaleName) or (ScaleName == "") or not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end

	return Scale.UpgradesFollowSpecialization
end

-- Sets whether only the current player's best armor type is shown for upgrades after level 50.
function PawnSetUpgradesFollowSpecialization(ScaleName, FollowSpecialization)
	if not PawnIsInitialized then VgerCore.Fail("Can't change armor upgrade settings until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if (not ScaleName) or (ScaleName == "") or not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end

	if FollowSpecialization then
		Scale.UpgradesFollowSpecialization = true
	else
		Scale.UpgradesFollowSpecialization = false
	end
	PawnInvalidateBestItemsForScale(ScaleName)
	PawnResetTooltips()
end

-- Sets whether the upgrade tracking feature is enabled for this character.
function PawnSetUpgradeTracking(Enabled)
	if PawnOptions.UpgradeTracking == Enabled then return end

	PawnOptions.UpgradeTracking = Enabled
	PawnInvalidateBestItems()
	PawnResetTooltips()
end

-- Returns true if a scale is read-only.
function PawnScaleIsReadOnly(ScaleName)
	if not PawnCommon then VgerCore.Fail("Can't check scale read-only status until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	return Scale and Scale.Provider ~= nil
end

-- Returns the localized name for a scale if it has one.  Otherwise, it returns the scale's unlocalized name.
function PawnGetScaleLocalizedName(ScaleName)
	if not PawnCommon then VgerCore.Fail("Can't get scale names until Pawn is initialized") return end

	local Scale = PawnCommon.Scales[ScaleName]
	if Scale and Scale.LocalizedName then
		return Scale.LocalizedName
	else
		return ScaleName
	end
end

-- Uninitialize the plugin infrastructure and clean up our stale data.  We'll do this upon logging out or reloading the UI.
function PawnUnitializePlugins()
	-- Remove values from all read-only scales from providers so they don't get serialized to SavedVariables unnecessarily.
	local ScaleName, Scale
	for ScaleName, Scale in pairs(PawnCommon.Scales) do
		if Scale.Provider then
			Scale.ProviderActive = nil
			Scale.Values = nil
			Scale.Header = nil
		end
	end

	-- Clear out the provider data.
	PawnScaleProviders = nil
end

-- Initializes all delay-loaded scale providers.
function PawnInitializePlugins()
	-- This only needs to be done once.  PawnAddPluginScaleProvider will take care of anything that needs to
	-- happen after this is called.
	if PawnScaleProvidersInitialized then return end
	PawnScaleProvidersInitialized = true

	-- Go through the list of scale providers and call their initialization function.  They'll create all of their
	-- scales as necessary.
	local Provider, _
	for _, Provider in pairs(PawnScaleProviders) do
		if Provider.Function then
			-- After we call each provider's initialization function, empty it out so that function can be
			-- garbage-collected if necessary.
			Provider.Function()
			Provider.Function = nil
		end
	end
end

-- Registers a plugin scale provider.
-- Arguments: ProviderInternalName, LocalizedName
--	ProviderInternalName: An unlocalized internal name for the scale provider.
--	LocalizedName: The localized name for the scale provider, to show up in the UI.
-- 	Function: A function to call that adds the scales when it is time.
function PawnAddPluginScaleProvider(ProviderInternalName, LocalizedName, Function)
	-- If the scale provider already exists, ignore the second registration.
	if PawnScaleProviders[ProviderInternalName] then return end

	if strfind(ProviderInternalName, "\"") then
		VgerCore.Fail("Pawn scale providers cannot include double quotes ('\"') in their name.")
		return
	end

	if PawnScaleProvidersInitialized then
		-- If we've already initialized scale providers, just do this one immediately.
		PawnScaleProviders[ProviderInternalName] = { ["Name"] = LocalizedName }
		Function()
	else
		-- Otherwise, we'll get to it later.
		VgerCore.Assert(Function, "Scale provider \"" .. LocalizedName .. "\" was registered but won't initialize properly because no initialization function was specified.")
		PawnScaleProviders[ProviderInternalName] = { ["Name"] = LocalizedName, ["Function"] = Function }
	end
end

-- Given a scale provider name and a scale name, returns the full name of a scale from a provider.
function PawnGetProviderScaleName(ProviderInternalName, ScaleInternalName)
	return "\"" .. ProviderInternalName .. "\":" .. ScaleInternalName
end

-- Given a scale internal name, return the provider internal name.
function PawnGetProviderNameFromScale(ScaleInternalName)
	-- If this isn't a provider scale, then just return the scale name.
	if not ScaleInternalName or strbyte(ScaleInternalName) ~= 34 then return ScaleInternalName end -- 34 is "

	-- Otherwise, get the provider name.
	local Pos = strfind(ScaleInternalName, "\"", 2, true)
	if not Pos then
		VgerCore.Fail("Didn't understand the provider name in the scale " .. tostring(ScaleInternalName) .. ".")
		return ScaleInternalName
	end
	return strsub(ScaleInternalName, 2, Pos - 1)
end

-- Given a provider internal name, return the localized name.
function PawnGetProviderLocalizedName(ProviderInternalName)
	local Provider = PawnScaleProviders[ProviderInternalName]
	if not Provider then
		VgerCore.Fail("Pawn scale provider \"" .. tostring(ProviderInternalName) .. " is not registered yet so we can't get its display name.")
		return ProviderInternalName
	end

	return Provider.Name
end

-- Adds a plugin scale to Pawn.  Plugin scales are read-only once added, and are not saved; they must be added on every login.
-- If this plugin scale already exists (it was added this session), it will be overwritten.
function PawnAddPluginScale(ProviderInternalName, ScaleInternalName, LocalizedName, Color, Values, NormalizationFactor, WeaponSetToHideUpgradesFor)
	if not PawnScaleProviders[ProviderInternalName] then
		VgerCore.Fail("A scale provider with that name is not registered.  Use PawnAddPluginScaleProvider first.")
		return
	end

	if not PawnCommon then VgerCore.Fail("Can't add plugin scales until Pawn starts to initialize.") return end

	-- Now, add this new scale to the master list (starting with default scale options), or if it's already there, update it with the data from the scale provider.
	local ScaleFullName = PawnGetProviderScaleName(ProviderInternalName, ScaleInternalName)
	local NewScale
	if PawnCommon.Scales[ScaleFullName] then
		NewScale = PawnCommon.Scales[ScaleFullName]
	else
		NewScale = PawnGetEmptyScale()
	end
	NewScale.ProviderActive = true
	NewScale.Provider = ProviderInternalName
	NewScale.LocalizedName = LocalizedName
	NewScale.Header = PawnScaleProviders[ProviderInternalName].Name
	NewScale.NormalizationFactor = NormalizationFactor
	-- If the plugin supplied any stat values of 0, remove them now.
	for StatName, Value in pairs(Values) do
		if Value == 0 then Values[StatName] = nil end
	end
	NewScale.Values = Values
	if not NewScale.PerCharacterOptions then NewScale.PerCharacterOptions = {} end
	if not NewScale.PerCharacterOptions[PawnPlayerFullName] then NewScale.PerCharacterOptions[PawnPlayerFullName] = {} end
	if not PawnCommon.Scales[ScaleFullName] then PawnCommon.Scales[ScaleFullName] = NewScale end
	if NewScale.DoNotShow1HUpgrades == nil then NewScale.DoNotShow1HUpgrades = (WeaponSetToHideUpgradesFor == 1) end
	if NewScale.DoNotShow2HUpgrades == nil then NewScale.DoNotShow2HUpgrades = (WeaponSetToHideUpgradesFor == 2) end

	if not NewScale.Color then PawnSetScaleColor(ScaleFullName, Color) end -- If the user has customized the color, don't overwrite theirs.
end

-- Adds a plugin scale from Pawn, starting from one of Pawn's existing templates.
function PawnAddPluginScaleFromTemplate(ProviderInternalName, ClassID, SpecID, Stats, NormalizationFactor)
	if not PawnScaleProviders[ProviderInternalName] then
		VgerCore.Fail("A scale provider with that name is not registered.  Use PawnAddPluginScaleProvider first.")
		return
	end

	if not PawnCommon then VgerCore.Fail("Can't add plugin scales until Pawn starts to initialize.") return end

	local LocalizedClassName, UnlocalizedClassName = PawnGetClassInfo(ClassID)
	local _, LocalizedSpecName, IconTexturePath, Role
	if SpecID then
		_, LocalizedSpecName, _, IconTexturePath, Role = PawnGetSpecializationInfoForClassID(ClassID, SpecID)
	end

	local Template = PawnFindScaleTemplate(ClassID, SpecID)
	if not Template then VgerCore.Fail("Can't add this plugin scale because the class " .. tostring(LocalizedClassName) .. " ID " .. tostring(ClassID) .. " and/or spec " .. tostring(LocalizedSpecName) .. " ID " .. tostring(SpecID) .. " wasn't found.") return end

	-- Build up the values table.
	local ScaleValues = PawnGetStatValuesForTemplate(Template)
	if Stats then
		local StatName, Value
		for StatName, Value in pairs(Stats) do
			ScaleValues[StatName] = Stats[StatName]
		end
	end

	local Color
	if RAID_CLASS_COLORS[UnlocalizedClassName].colorStr then
		-- Sometime other addons try to change RAID_CLASS_COLORS and don't include colorStr. If that happens, just skip this scale color.
		Color = strsub(RAID_CLASS_COLORS[UnlocalizedClassName].colorStr, 3)
	else
		VgerCore.Fail("An addon changed the class color for " .. UnlocalizedClassName .. " but didn't finish the job. That class will show up in the wrong color in Pawn.")
	end
	-- Choose a lighter color for death knights and evokers so it's easier to read.
	if ClassID == 6 then Color = "ff4d6b" end
	if ClassID == 13 then Color = "8cc2b7" end

	-- Then, transfer control to the regular plugin scale codepath.
	local ScaleInternalName = UnlocalizedClassName .. (SpecID or "")
	local LocalizedScaleName = LocalizedSpecName and (LocalizedClassName .. ": " .. LocalizedSpecName) or LocalizedClassName
	PawnAddPluginScale(
		ProviderInternalName,
		ScaleInternalName,
		LocalizedScaleName,
		Color,
		ScaleValues,
		NormalizationFactor,
		Template.HideUpgrades
	)

	-- Finally, make a few more customizations to that scale.
	local NewScale = PawnCommon.Scales[PawnGetProviderScaleName(ProviderInternalName, ScaleInternalName)]
	if not NewScale then return end

	NewScale.ClassID = ClassID
	NewScale.SpecID = SpecID
	NewScale.IconTexturePath = IconTexturePath
	NewScale.Role = Role

	return NewScale
end

-- Wraps the GetClassInfo function so that it can be called on WoW Classic.
-- (On WoW Classic, returns something like "Druid", "DRUID".)
function PawnGetClassInfo(ClassID)
	if GetClassInfo then return GetClassInfo(ClassID) end

	local UnlocalizedClassName
	if ClassID == 1 then
		UnlocalizedClassName = "WARRIOR"
	elseif ClassID == 2 then
		UnlocalizedClassName = "PALADIN"
	elseif ClassID == 3 then
		UnlocalizedClassName = "HUNTER"
	elseif ClassID == 4 then
		UnlocalizedClassName = "ROGUE"
	elseif ClassID == 5 then
		UnlocalizedClassName = "PRIEST"
	elseif ClassID == 7 then
		UnlocalizedClassName = "SHAMAN"
	elseif ClassID == 8 then
		UnlocalizedClassName = "MAGE"
	elseif ClassID == 9 then
		UnlocalizedClassName = "WARLOCK"
	elseif ClassID == 11 then
		UnlocalizedClassName = "DRUID"
	else
		VgerCore.Fail("Unknown class ID: " .. tostring(ClassID))
	end

	return LOCALIZED_CLASS_NAMES_MALE[UnlocalizedClassName], UnlocalizedClassName
end

if not VgerCore.SpecsExist then
	-- Classic doesn't have a Guardian spec for druids, so rename.
	PawnLocal.Specs[11][3].Name = PawnLocal.Specs[11][2].Name .. " (" .. TANK .. ")"
	PawnLocal.Specs[11][2].Name = PawnLocal.Specs[11][2].Name .. " (" .. DAMAGER .. ")"
	-- And, back then, Outlaw was called Combat.
	PawnLocal.Specs[4][2].Name = COMBAT
end

-- Wraps the GetSpecializationInfoForClassID function so that it can be called on WoW Classic.
-- On WoW Classic, this only returns: _, LocalizedSpecName, _, IconID, Role
function PawnGetSpecializationInfoForClassID(ClassID, SpecID)
	if GetSpecializationInfoForClassID then return GetSpecializationInfoForClassID(ClassID, SpecID) end

	local SpecInfo = PawnLocal.Specs[ClassID][SpecID]
	-- The second-to-last parameter should be SpecInfo.Icon, but many of the icons used in BfA aren't valid on Classic.
	return nil, SpecInfo.Name, nil, nil, SpecInfo.Role
end

-- To generate PawnLocal.Specs to place into Localization.lua:
-- /script PawnGenerateLocalizedSpecsTable()
-- function PawnGenerateLocalizedSpecsTable()
-- 	local String = "PawnLocal.Specs =\r\n{\r\n"

-- 	local ClassID, SpecID
-- 	for ClassID = 1, GetNumClasses() do
-- 		String = String .. "    [" .. ClassID .. "] = {\r\n"
-- 		for SpecID = 1, GetNumSpecializationsForClassID(ClassID) do
-- 			local _, LocalizedSpecName, _, IconID, Role = GetSpecializationInfoForClassID(ClassID, SpecID)
-- 			String = String .. "        { Name=\"" .. LocalizedSpecName .. "\", Icon=" .. IconID .. ", Role=\"" .. Role .. "\" },\r\n"
-- 		end
-- 		String = String .. "    },\r\n"
-- 	end

-- 	String = String .. "}"
-- 	PawnUIShowCopyableString("PawnLocal.Specs", String, nil, true)
-- end

-- Returns the unenchanted item link of the best item that a user has for a particular scale and inventory type.
-- Parameters:
--	ScaleName: The scale to find a best item for.
--	InvType: An inventory type (ItemEquipLoc) for which to find a best item, such as "INVTYPE_HEAD".
--	Index: If 1 or nil, return the best item for that slot.  If 2, return the second-best item for that slot.  (Most types don't have a second-best item.)
--	DoNotRescan: If true, don't rescan for best items if information is not available.
function PawnGetBestItemLink(ScaleName, InvType, Index, DoNotRescan)
	if not PawnIsInitialized then VgerCore.Fail("Can't get best item lists until Pawn is initialized") return nil end
	if not InvType or InvType == "" or InvType == "INVTYPE_TRINKET" or InvType == "INVTYPE_BAG" or InvType == "INVTYPE_QUIVER" or InvType == "INVTYPE_TABARD" or InvType == "INVTYPE_BODY" then return nil end

	Index = Index or 1
	if Index ~= 1 and Index ~= 2 then
		VgerCore.Fail("Index must be 1 or 2.")
		return nil
	end
	local Scale = PawnCommon.Scales[ScaleName]
	if not Scale then
		VgerCore.Fail("ScaleName must be the name of an existing scale, and is case-sensitive.")
		return nil
	end
	local CharacterOptions = Scale.PerCharacterOptions[PawnPlayerFullName]
	if not CharacterOptions then
		VgerCore.Fail("This method can't be used if per-character options haven't been set up for this scale yet.")
		return nil
	end
	local BestItems = CharacterOptions.BestItems
	if not BestItems then
		if DoNotRescan then return end
		PawnFindBestItems(ScaleName)
		if not BestItems then return end
	end

	if InvType == "INVTYPE_WEAPON" then
		if Index == 2 then InvType = "INVTYPE_WEAPONOFFHAND" Index = 1 else InvType = "INVTYPE_WEAPONMAINHAND" end
	elseif InvType == "INVTYPE_SHIELD" or InvType == "INVTYPE_HOLDABLE" then
		InvType = "INVTYPE_WEAPONOFFHAND"
	elseif InvType == "INVTYPE_ROBE" then
		InvType = "INVTYPE_CHEST"
	elseif ((not VgerCore.RangedSlotExists) and (InvType == "INVTYPE_RANGED" or InvType == "INVTYPE_RANGEDRIGHT")) then
		-- All ranged weapons go in the main hand now.
		InvType = "INVTYPE_WEAPONMAINHAND"
	end
	local BestData = BestItems[InvType]
	if not BestData then return nil end

	return BestData[3 * Index - 1]
end

-- Shortcut for PawnIsItemAnUpgrade that takes in an item ID.
-- Returns data in the same format as PawnIsItemAnUpgrade.
function PawnIsItemIDAnUpgrade(ItemID)
	if not PawnIsInitialized then VgerCore.Fail("Can't check to see if items are upgrades until Pawn is initialized") return end
	local Item = PawnGetItemData("item:" .. ItemID)
	if not Item then return end
	return PawnIsItemAnUpgrade(Item)
end

-- This is largely the same as getting the item data for a link and then calling PawnIsItemAnUpgrade on it,
-- but this one also works with relics, can support minimum level requirements, and so on.  It's intended as the
-- easiest way to answer the question "should this item have a green arrow?".
-- Returns:
--   true: This item is indeed an upgrade for something.
--   false: This item is not an upgrade.
--   nil: We're not sure yet.
function PawnShouldItemLinkHaveUpgradeArrow(ItemLink, CheckLevel, EvenOnClassic)
	-- TEMPORARY HACK: If EvenOnClassic=true wasn't passed in and this is a Classic version, just return false.
	-- This intentionally breaks integration with bag addons for now to resolve performance issues.
	if (not EvenOnClassic) and (not VgerCore.IsMainline) then return false end

	if not PawnIsInitialized then VgerCore.Fail("Can't check to see if items are upgrades until Pawn is initialized") return end

	--if PawnOptions.DebugBagArrows then VgerCore.Message("Checking upgrade information for " .. tostring(ItemLink)) end

	local _, _, _, _, MinLevel = GetItemInfo(ItemLink)
	if MinLevel == nil then return nil end
	if CheckLevel and UnitLevel("player") < MinLevel then return false end
	if PawnCanItemHaveStats(ItemLink) then
		local Item = PawnGetItemData(ItemLink)
		if Item == nil or Item.Link == nil then return nil end -- If we don't have stats for the item yet, ask again later.
		if PawnOptions.DebugBagArrows then
			local UpgradeInfo, ItemLevelIncrease, BestItemFor, SecondBestItemFor, NeedsEnhancements = PawnIsItemAnUpgrade(Item)
			if UpgradeInfo ~= nil then
				if PawnOptions.DebugBagArrows then VgerCore.Message("Found upgrade for " .. ItemLink) end
				local i
				for i = 1, #UpgradeInfo do
					local u = UpgradeInfo[i]
					if PawnOptions.DebugBagArrows then VgerCore.Message("  " .. u.LocalizedScaleName .. ": +" .. u.PercentUpgrade .. "% vs. " .. tostring(u.ExistingItemLink)) end
				end
			end
			return UpgradeInfo ~= nil
		else
			local UpgradeInfo, ItemLevelIncrease = PawnIsItemAnUpgrade(Item)
			return UpgradeInfo ~= nil or (PawnCommon.ShowItemLevelUpgrades and ItemLevelIncrease ~= nil)
		end
	elseif PawnCommon.ShowRelicUpgrades and PawnCanItemBeArtifactUpgrade(ItemLink) then
		return PawnGetRelicUpgradeInfo(ItemLink) ~= nil
	else
		return false -- If the item can never be an upgrade to anything, don't check again.
	end
end

-- Clears the best item level data for this character only.
function PawnClearBestItemLevelData()
	PawnOptions.ItemLevels = nil
	local Slot
	for Slot = 1, 18 do
		PawnAddItemToLevelTracker(PawnGetItemDataForInventorySlot(Slot))
	end
end

-- Shows or hides the Pawn UI.
function PawnUIShow()
	if not PawnIsInitialized or not PawnUIFrame then
		VgerCore.Fail("Pawn UI is not loaded!")
		return
	end
	if PawnUIFrame:IsShown() then
		PawnUIFrame:Hide()
	else
		PawnUIFrame:Show()
	end
end
