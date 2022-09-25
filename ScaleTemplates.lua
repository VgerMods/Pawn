-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Scale templates
------------------------------------------------------------


-- Test code for getting spec IDs matched up:
--/script local Index; for Index = 1, GetNumSpecializations() do local ID, Name = GetSpecializationInfo(Index) VgerCore.Message("(" .. Index .. ") Spec ID " .. ID .. " is " .. Name) end

-- Returns the template from PawnScaleTemplates for a given class ID and spec ID.
function PawnFindScaleTemplate(ClassID, SpecID)
	local _, Template

	if VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath then
		for _, Template in pairs(PawnScaleTemplatesClassic) do
			if Template.ClassID == ClassID then return Template end
		end
	else
		for _, Template in pairs(PawnScaleTemplates) do
			if Template.ClassID == ClassID and Template.SpecID == SpecID then return Template end
		end
	end

	VgerCore.Fail("Failed to find a scale template for class " .. tostring(ClassID) .. " and spec " .. tostring(SpecID))
end

-- Returns a starter set of stat values for a given template row returned by PawnFindScaleTemplate.
function PawnGetStatValuesForTemplate(Template, NoStats)
	local ScaleValues, StatName

	if NoStats then
		ScaleValues = {}
	else
		if VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath then
			ScaleValues =
			{
				["Stamina"] = 0.01,
				["Armor"] = 0.1,

				-- These should really be multiplied on Classic Era, but this is just a template so the values aren't that important.
				["HitRating"] = 1,
				["SpellHitRating"] = 1,
				["CritRating"] = 1,
				["SpellCritRating"] = 1,
				["HasteRating"] = 1,
				["SpellHasteRating"] = 1,
				["ExpertiseRating"] = 1,
				["SpellPenetration"] = 1,
				-- ["AxeRating"] = 1,
				-- ["2HAxeRating"] = 1,
				-- ["DaggerRating"] = 1,
				-- ["SwordRating"] = 1,
				-- ["2HSwordRating"] = 1,
				-- ["MaceRating"] = 1,
				-- ["2HMaceRating"] = 1,
				-- ["UnarmedRating"] = 1,
				-- ["GunRating"] = 1,
				-- ["BowRating"] = 1,
				-- ["CrossbowRating"] = 1,
				["Ap"] = 0.5,
				["Rap"] = 0.4,
				["FeralAp"] = 0.5,

				["SpellDamage"] = 0.855,
				["Healing"] = 0.455,

				["DefenseRating"] = 1,
				["DodgeRating"] = 1,
				["ParryRating"] = 1,
				["BlockRating"] = 1,
				["BlockValue"] = 0.65,
				["ResilienceRating"] = 1,

				["MetaSocketEffect"] = 36,

				["Mp5"] = 2.5,
				["Hp5"] = 2.5,
				["FireResist"] = 1,
				["ShadowResist"] = 1,
				["NatureResist"] = 1,
				["ArcaneResist"] = 1,
				["FrostResist"] = 1,
				["FireSpellDamage"] = 0.7,
				["ShadowSpellDamage"] = 0.7,
				["NatureSpellDamage"] = 0.7,
				["ArcaneSpellDamage"] = 0.7,
				["FrostSpellDamage"] = 0.7,
				["HolySpellDamage"] = 0.7,	

				["Dps"] = 3.4,
			}

			local UsesPhysicalAttacks, UsesSpells
			for _, StatName in pairs(Template.PrimaryStats) do
				ScaleValues[StatName] = 1

				if StatName == "Strength" or StatName == "Agility" then UsesPhysicalAttacks = true end
				if StatName == "Intellect" then UsesSpells = true end
			end

			-- For pure casters that never use strength or agility, remove stats like AP and DPS.
			if not UsesPhysicalAttacks then
				ScaleValues.Ap = nil
				ScaleValues.Rap = nil
				ScaleValues.FeralAp = nil
				ScaleValues.DefenseRating = nil
				ScaleValues.DodgeRating = nil
				ScaleValues.ParryRating = nil
				ScaleValues.Dps = nil
				ScaleValues.AxeRating = nil
				ScaleValues["2HAxeRating"] = nil
				ScaleValues.DaggerRating = nil
				ScaleValues.SwordRating = nil
				ScaleValues["2HSwordRating"] = nil
				ScaleValues.MaceRating = nil
				ScaleValues["2HMaceRating"] = nil
				ScaleValues.UnarmedRating = nil
				ScaleValues.GunRating = nil
				ScaleValues.BowRating = nil
				ScaleValues.CrossbowRating = nil
			end

			-- For non-casters, remove the spell stats.
			if not UsesSpells then
				ScaleValues.SpellCritRating = nil
				ScaleValues.SpellHitRating = nil
				ScaleValues.SpellHasteRating = nil
				ScaleValues.SpellDamage = nil
				ScaleValues.Healing = nil
				ScaleValues.Mp5 = nil
				ScaleValues.FireSpellDamage = nil
				ScaleValues.ShadowSpellDamage = nil
				ScaleValues.NatureSpellDamage = nil
				ScaleValues.ArcaneSpellDamage = nil
				ScaleValues.FrostSpellDamage = nil
				ScaleValues.HolySpellDamage = nil
			end

			-- Only druids can make use of feral AP.
			if Template.ClassID ~= 11 then
				ScaleValues.FeralAp = nil
			end

			-- Wrath merged some stats together.
			if VgerCore.IsWrath then
				ScaleValues.SpellCritRating = nil
				ScaleValues.SpellHitRating = nil
				ScaleValues.SpellHasteRating = nil
				ScaleValues.SpellPower = ScaleValues.SpellDamage
				ScaleValues.SpellDamage = nil
				ScaleValues.Healing = nil
			end
		else
			ScaleValues =
			{
				["Stamina"] = 0.01,

				["CritRating"] = 0.5,
				["HasteRating"] = 0.5,
				["MasteryRating"] = 0.5,
				["Versatility"] = 0.5,

				["MovementSpeed"] = 0.01,
				["Avoidance"] = 0.01,
				["Leech"] = 0.01,
				["Indestructible"] = 0.01,
			}

			ScaleValues[Template.PrimaryStat] = 1

			if Template.Role == "TANK" then
				ScaleValues.Stamina = 1
				ScaleValues.Armor = 1
			end	
		end
	end

	for _, StatName in pairs(PawnNeverUsableStats[Template.ClassID]) do
		ScaleValues[StatName] = PawnIgnoreStatValue
	end
	if Template.UnusableStats then
		for _, StatName in pairs(Template.UnusableStats) do
			ScaleValues[StatName] = PawnIgnoreStatValue

			if (VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath) and StatName == "IsShield" then
				ScaleValues.BlockRating = nil
				ScaleValues.BlockValue = nil
			end
		end
	end

	return ScaleValues
end


-- PawnScaleTemplates: Master list of scale templates for each class and spec. 
PawnScaleTemplates =
{

{
	["ClassID"] = 6, -- Death Knight
	["SpecID"] = 1, -- Blood
	["Role"] = "TANK",
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 6, -- Death Knight
	["SpecID"] = 2, -- Frost
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Strength",
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 6, -- Death Knight
	["SpecID"] = 3, -- Unholy
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 12, -- Demon Hunter
	["SpecID"] = 1, -- Havoc
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 12, -- Demon Hunter
	["SpecID"] = 2, -- Vengeance
	["Role"] = "TANK",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 1, -- Balance
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 2, -- Feral
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 3, -- Guardian
	["Role"] = "TANK",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 11, -- Druid
	["SpecID"] = 4, -- Restoration
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 13, -- Evoker
	["SpecID"] = 1, -- Devastation
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 13, -- Evoker
	["SpecID"] = 2, -- Preservation
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 3, -- Hunter
	["SpecID"] = 1, -- Beast Mastery
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsDagger", "IsPolearm", "IsStaff", "IsFist", "IsSword", "Is2HSword", "IsAxe", "Is2HAxe", "IsOffHand", "IsFrill" }
},

{
	["ClassID"] = 3, -- Hunter
	["SpecID"] = 2, -- Marksmanship
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsDagger", "IsPolearm", "IsStaff", "IsFist", "IsSword", "Is2HSword", "IsAxe", "Is2HAxe", "IsOffHand", "IsFrill" }
},

{
	["ClassID"] = 3, -- Hunter
	["SpecID"] = 3, -- Survival
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 8, -- Mage
	["SpecID"] = 1, -- Arcane
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 8, -- Mage
	["SpecID"] = 2, -- Fire
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 8, -- Mage
	["SpecID"] = 3, -- Frost
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 10, -- Monk
	["SpecID"] = 1, -- Brewmaster
	["Role"] = "TANK",
	["PrimaryStat"] = "Agility",
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 10, -- Monk
	["SpecID"] = 2, -- Mistweaver
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsOffHand" }
},

{
	["ClassID"] = 10, -- Monk
	["SpecID"] = 3, -- Windwalker
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFrill" }
},

{
	["ClassID"] = 2, -- Paladin
	["SpecID"] = 1, -- Holy
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = {}
},

{
	["ClassID"] = 2, -- Paladin
	["SpecID"] = 2, -- Protection
	["Role"] = "TANK",
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = {}
},

{
	["ClassID"] = 2, -- Paladin
	["SpecID"] = 3, -- Retribution
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = {}
},

{
	["ClassID"] = 5, -- Priest
	["SpecID"] = 1, -- Discipline
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 5, -- Priest
	["SpecID"] = 2, -- Holy
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 5, -- Priest
	["SpecID"] = 3, -- Shadow
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 4, -- Rogue
	["SpecID"] = 1, -- Assassination
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFist", "IsAxe", "IsMace", "IsSword", "IsBow", "IsCrossbow", "IsGun", "IsFrill" }
},

{
	["ClassID"] = 4, -- Rogue
	["SpecID"] = 2, -- Outlaw
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsBow", "IsCrossbow", "IsGun", "IsFrill" }
},

{
	["ClassID"] = 4, -- Rogue
	["SpecID"] = 3, -- Subtlety
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFist", "IsAxe", "IsMace", "IsSword", "IsBow", "IsCrossbow", "IsGun", "IsFrill" }
},

{
	["ClassID"] = 7, -- Shaman
	["SpecID"] = 1, -- Elemental
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsOffHand" }
},

{
	["ClassID"] = 7, -- Shaman
	["SpecID"] = 2, -- Enhancement
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Agility",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsShield", "IsFrill" }
},

{
	["ClassID"] = 7, -- Shaman
	["SpecID"] = 3, -- Restoration
	["Role"] = "HEALER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = { "IsOffHand" }
},

{
	["ClassID"] = 9, -- Warlock
	["SpecID"] = 1, -- Affliction
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 9, -- Warlock
	["SpecID"] = 2, -- Demonology
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 9, -- Warlock
	["SpecID"] = 3, -- Destruction
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Intellect",
	["UnusableStats"] = {}
},

{
	["ClassID"] = 1, -- Warrior
	["SpecID"] = 1, -- Arms
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 1, -- Hide 1H upgrades
	["UnusableStats"] = { "IsFrill", "IsBow", "IsCrossbow", "IsGun" }
},

{
	["ClassID"] = 1, -- Warrior
	["SpecID"] = 2, -- Fury
	["Role"] = "DAMAGER",
	["PrimaryStat"] = "Strength",
	["UnusableStats"] = { "IsFrill", "IsBow", "IsCrossbow", "IsGun" }
},

{
	["ClassID"] = 1, -- Warrior
	["SpecID"] = 3, -- Protection
	["Role"] = "TANK",
	["PrimaryStat"] = "Strength",
	["HideUpgrades"] = 2, -- Hide 2H upgrades
	["UnusableStats"] = { "IsFrill", "IsBow", "IsCrossbow", "IsGun", "IsOffHand" }
},

}

PawnScaleTemplatesClassic =
{

{
	["ClassID"] = 6, -- Death Knight
	["PrimaryStats"] = { "Strength", "Agility", "Stamina" }
},

{
	["ClassID"] = 11, -- Druid
	["PrimaryStats"] = { "Strength", "Agility", "Stamina", "Intellect", "Spirit" }
},

{
	["ClassID"] = 3, -- Hunter
	["PrimaryStats"] = { "Strength", "Agility", "Intellect" }
},

{
	["ClassID"] = 8, -- Mage
	["PrimaryStats"] = { "Strength", "Agility", "Intellect", "Spirit" }
},

{
	["ClassID"] = 2, -- Paladin
	["PrimaryStats"] = { "Strength", "Agility", "Stamina", "Intellect" }
},

{
	["ClassID"] = 5, -- Priest
	["PrimaryStats"] = { "Intellect", "Spirit" }
},

{
	["ClassID"] = 4, -- Rogue
	["PrimaryStats"] = { "Strength", "Agility" }
},

{
	["ClassID"] = 7, -- Shaman
	["PrimaryStats"] = { "Strength", "Agility", "Intellect" }
},

{
	["ClassID"] = 9, -- Warlock
	["PrimaryStats"] = { "Stamina", "Intellect", "Spirit" }
},

{
	["ClassID"] = 1, -- Warrior
	["PrimaryStats"] = { "Strength", "Agility", "Stamina" }
},

}

-- PawnNewbieSpec: Which spec should we give advice for before level 10?
PawnNewbieSpec =
{
	[1] = -- Warrior
	1, -- Arms

	[2] = -- Paladin
	3, -- Retribution

	[3] = -- Hunter
	2, -- Marksmanship

	[4] = -- Rogue
	1, -- Assassination

	[5] = -- Priest
	3, -- Shadow

	[6] = -- Death Knight
	2, -- Frost

	[7] = -- Shaman
	1, -- Elemental

	[8] = -- Mage
	1, -- Arcane

	[9] = -- Warlock
	2, -- Destruction

	[10] = -- Monk
	3, -- Windwalker

	[11] = -- Druid
	1, -- Balance

	[12] = -- Demon Hunter
	2, -- Vengeance

	[13] = -- Evoker
	2, -- Devastation
}

-- PawnNeverUsableStats: Master list of stats that are NEVER usable for each class, regardless of spec. 
PawnNeverUsableStats =
{
	[1] = -- Warrior
	{ "IsWand", "IsWarglaive" },

	[2] = -- Paladin
	{ "IsDagger", "IsFist", "IsStaff", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsOffHand", "IsThrown" },

	[3] = -- Hunter
	{ "IsWand", "IsMace", "Is2HMace", "IsWarglaive", "IsPlate", "IsShield" },

	[4] = -- Rogue
	{ "IsPolearm", "IsStaff", "Is2HAxe", "Is2HMace", "Is2HSword", "IsWand", "IsWarglaive", "IsMail", "IsPlate", "IsShield" },

	[5] = -- Priest
	{ "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "IsSword", "Is2HSword", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield", "IsThrown" },

	[6] = -- Death Knight
	{ "IsDagger", "IsFist", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsStaff", "IsWarglaive", "IsShield", "IsThrown" },

	[7] = -- Shaman
	{ "IsPolearm", "IsSword", "Is2HSword", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsPlate", "IsThrown" },

	[8] = -- Mage
	{ "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield", "IsThrown" },

	[9] = -- Warlock
	{ "IsAxe", "Is2HAxe", "IsFist", "IsPolearm", "Is2HSword", "IsMace", "Is2HMace", "IsWarglaive", "IsBow", "IsCrossbow", "IsGun", "IsOffHand", "IsLeather", "IsMail", "IsPlate", "IsShield", "IsThrown" },

	[10] = -- Monk
	{ "IsDagger", "Is2HAxe", "Is2HMace", "Is2HSword", "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsWarglaive", "IsMail", "IsPlate", "IsShield", "IsOffHand", "IsThrown" },

	[11] = -- Druid
	{ "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsAxe", "Is2HAxe", "IsSword", "Is2HSword", "IsWarglaive", "IsOffHand", "IsMail", "IsPlate", "IsShield", "IsThrown" },
	-- Note: feral and guardian artifacts are actually off-hand items, even though druids can't normally equip them.

	[12] = -- Demon Hunter
	{ "IsDagger", "IsMace", "IsWand", "IsBow", "IsCrossbow", "IsGun", "Is2HAxe", "Is2HMace", "Is2HSword", "IsPolearm", "IsStaff", "IsMail", "IsPlate", "IsShield", "IsThrown" },

	[13] = -- Evoker
	{  "IsWand", "IsBow", "IsCrossbow", "IsGun", "IsPolearm", "IsWarglaive", "IsOffHand", "IsPlate", "IsShield", "IsThrown" },
}

if VgerCore.IsClassic then
	-- Shamans didn't learn to dual-wield until Burning Crusade.
	tinsert(PawnNeverUsableStats[7], "IsOffHand")
end

if VgerCore.IsClassic or VgerCore.IsBurningCrusade then
	-- Rogues didn't learn to use axes until Wrath of the Lich King.
	tinsert(PawnNeverUsableStats[4], "IsAxe")
end
