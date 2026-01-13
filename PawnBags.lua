-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2026 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.md for more information.
--
-- Pawn bag upgrade advisor: default bag integration
--
-- If you're the author of a bag addon and want to integrate with Pawn, the APIs you want aren't here.
-- Feel free to reach out! But the general steps are:
-- 	1. For each item, call PawnShouldItemLinkHaveUpgradeArrow(link, true).
-- 	2. If it returns nil, Pawn can't answer the question yet (or doing so would slow down the game), so check back soon on a timer.
-- 	3. Otherwise, it will return true or false, so use that to show or hide the arrow.
-- 	4. Call PawnRegisterThirdPartyBag("My addon name", { RefreshAll = ... } ) to be notified whenever all of the green arrow state
--		should be cleared due to a settings change. That also disables virtually all of the code in this file for best performance.
------------------------------------------------------------

PawnBags = {}
local _

local IsInitialized

local NumberOfContainerFrames = NUM_TOTAL_BAG_FRAMES or NUM_CONTAINER_FRAMES
local PawnBagsRefreshCounter = 1

local ButtonsNeedingUpdate = {}
local NumberOfButtonsNeedingUpdate = 0

local RetryButtonsNeedingUpdate, UpdateItemButtonUpgradeIcon -- forward declarations... what is this, C?
function RetryButtonsNeedingUpdate()
	if NumberOfButtonsNeedingUpdate == 0 then return end

	local ButtonsToRetry = ButtonsNeedingUpdate
	ButtonsNeedingUpdate = {}
	NumberOfButtonsNeedingUpdate = 0

	for _, Button in pairs(ButtonsToRetry) do
		UpdateItemButtonUpgradeIcon(Button)
	end
end

function UpdateItemButtonUpgradeIcon(self)
	if self.isExtended then return end
	if PawnIsAThirdPartyBagRegistered then return end

	local ItemInfo
	local IsUpgrade
	if PawnCommon.ShowBagUpgradeAdvisor then
		ItemInfo = C_Container.GetContainerItemInfo(self.GetBagID and self:GetBagID() or self:GetParent():GetID(), self:GetID())
		if not ItemInfo or not ItemInfo.stackCount then
			-- If the stack count is 0, it's clearly not an upgrade
			IsUpgrade = false
			self.PawnLastCheckedRefresh = nil
			self.PawnLastCheckedItemLink = nil
		elseif not ItemInfo.hyperlink then
			-- If we didn't get an item link, but there's an item there, try again later
			IsUpgrade = nil
			self.PawnLastCheckedRefresh = nil
			self.PawnLastCheckedItemLink = nil
		else
			-- If we've already checked this item in this slot, since the last refresh, we can skip updates.
			if self.PawnLastCheckedRefresh == PawnBagsRefreshCounter and self.PawnLastCheckedItemLink == ItemInfo.hyperlink then return end

			-- Otherwise, see what Pawn says. This is throttled to return nil if asked too much in a single frame, so we'll set a retry timer later below.
			IsUpgrade = PawnShouldItemLinkHaveUpgradeArrow(ItemInfo.hyperlink, true) -- true means to check player level
			if IsUpgrade ~= nil then
				self.PawnLastCheckedRefresh = PawnBagsRefreshCounter
				self.PawnLastCheckedItemLink = ItemInfo.hyperlink
			else
				self.PawnLastCheckedRefresh = nil
				self.PawnLastCheckedItemLink = nil
			end
		end
	else
		IsUpgrade = false
		self.PawnLastCheckedRefresh = nil
		self.PawnLastCheckedItemLink = nil
	end

	if IsUpgrade == nil then
		if NumberOfButtonsNeedingUpdate == 0 then C_Timer.After(0, RetryButtonsNeedingUpdate) end
		NumberOfButtonsNeedingUpdate = NumberOfButtonsNeedingUpdate + 1
		tinsert(ButtonsNeedingUpdate, self)
	else
		self.UpgradeIcon:SetShown(IsUpgrade)
	end
end

local function UpdateContainerFrameUpgradeIcons(self)
	if PawnIsAThirdPartyBagRegistered then return end

	if VgerCore.IsMainline then
		for _, ItemButton in self:EnumerateValidItems() do
			UpdateItemButtonUpgradeIcon(ItemButton)
		end
	else
		local ItemButtonNamePrefix = self:GetName() .. "Item"
		for i = 1, self.size, 1 do
			local ItemButton = _G[ItemButtonNamePrefix .. i]
			UpdateItemButtonUpgradeIcon(ItemButton)
		end
	end
end

-- Call this to initialize the Pawn bag advisor after the core addon functionality is initialized.
-- This won't do anything if the feature is disabled.
function PawnBags:Initialize()
	if not PawnCommon.ShowBagUpgradeAdvisor then return false end
	if PawnIsAThirdPartyBagRegistered then return false end
	if IsInitialized then return true end

	if VgerCore.IsMainline then
		hooksecurefunc(ContainerFrameMixin, "UpdateItems", UpdateContainerFrameUpgradeIcons)
		-- Hooking the mixin is not retroactive to bags that have already been created. So update all of those too.
		hooksecurefunc(ContainerFrameCombinedBags, "UpdateItems", UpdateContainerFrameUpgradeIcons)
		for i = 1, NumberOfContainerFrames do
			local Bag = _G["ContainerFrame" .. i]
			hooksecurefunc(Bag, "UpdateItems", UpdateContainerFrameUpgradeIcons)
		end
	else
		hooksecurefunc("ContainerFrame_Update", UpdateContainerFrameUpgradeIcons)
	end
	IsInitialized = true
	return true
end

-- Clears out the cached upgrade information from all items on all bag frames.
function PawnBags:RefreshAll()
	PawnBags:Initialize()

	PawnBagsRefreshCounter = PawnBagsRefreshCounter + 1
	if VgerCore.IsMainline then
		if ContainerFrameCombinedBags:IsShown() then UpdateContainerFrameUpgradeIcons(ContainerFrameCombinedBags) end
	end
	for i = 1, NumberOfContainerFrames do
		local Bag = _G["ContainerFrame" .. i]
		if Bag:IsShown() then UpdateContainerFrameUpgradeIcons(Bag) end
	end
end

-- Returns true if the feature is enabled.
function PawnBags:IsEnabled()
	return not not PawnCommon.ShowBagUpgradeAdvisor
end

-- Enables or disables the feature.
function PawnBags:SetEnabled(Enabled)
	-- No need to do anything if we're not changing the setting.
	if ((not not Enabled) == (not not PawnCommon.ShowBagUpgradeAdvisor)) then return end

	PawnCommon.ShowBagUpgradeAdvisor = not not Enabled
	PawnBags:RefreshAll()
end
