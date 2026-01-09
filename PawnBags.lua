-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2026 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Default bag integration
------------------------------------------------------------

PawnBags = {}

local _

local function ContainerFrameItemButton_Update(self)
	if self.isExtended then return end

	-- TODO: If they have any bag replacement addons, disable all of this.
	-- You'll need to add a way to register bag replacement addons, like PawnRegisterThirdPartyTooltip.

	-- TODO: Update PawnUIFrame_ShowBagUpgradeAdvisorCheck_OnClick in PawnUI.lua.

	local ItemInfo
	local IsUpgrade
	if PawnCommon.ShowBagUpgradeAdvisor then
		ItemInfo = C_Container.GetContainerItemInfo(self.GetBagID and self:GetBagID() or self:GetParent():GetID(), self:GetID())
		if not ItemInfo or not ItemInfo.stackCount then
			-- If the stack count is 0, it's clearly not an upgrade
			IsUpgrade = false
			self.PawnLastCheckedItemLink = nil
		elseif not ItemInfo.hyperlink then
			-- If we didn't get an item link, but there's an item there, try again later
			IsUpgrade = nil
			self.PawnLastCheckedItemLink = nil
		else
			-- If we've already checked this item in this slot, we can skip updates.
			if self.PawnLastCheckedItemLink == ItemInfo.hyperlink then return end

			-- Otherwise, see what Pawn says.
			IsUpgrade = PawnShouldItemLinkHaveUpgradeArrow(ItemInfo.hyperlink, true) -- true means to check player level
			if IsUpgrade ~= nil then
				self.PawnLastCheckedItemLink = ItemInfo.hyperlink
			else
				self.PawnLastCheckedItemLink = nil
			end
		end
	else
		IsUpgrade = false
	end

	if IsUpgrade == nil then
		self.UpgradeIcon:Hide()
		if ItemInfo then
			C_Timer.After(0, function()
				ContainerFrameItemButton_Update(self)
			end)
		end
	else
		self.UpgradeIcon:SetShown(IsUpgrade)
	end
end

local function ContainerFrameMixin_UpdateItems(self)
	for _, ItemButton in self:EnumerateValidItems() do
		ContainerFrameItemButton_Update(ItemButton)
	end
end

function PawnBags:Initialize()
	-- Hook ContainerFrameMixin to affect all future bag frames.
	hooksecurefunc(ContainerFrameMixin, "UpdateItems", ContainerFrameMixin_UpdateItems)
	-- It's a Mixin, not a prototype, so changes are not retroactive to bags that have already been created. So update all of those too.
	hooksecurefunc(ContainerFrameCombinedBags, "UpdateItems", ContainerFrameMixin_UpdateItems)
	for i = 1, NUM_TOTAL_BAG_FRAMES do
		local Bag = _G["ContainerFrame" .. i]
		hooksecurefunc(Bag, "UpdateItems", ContainerFrameMixin_UpdateItems)
	end
end
