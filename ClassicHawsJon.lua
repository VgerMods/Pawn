-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2025 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- WoW Classic Era, Burning Crusade Classic, and Wrath Classic scales sourced from HawsJon
-- http://tbcwowaddons.weebly.com/pawn.html
-- WoW Cataclysm Classic scales from the WoWSims team
-- https://wowsims.github.io
-- WoW Mists of Pandaria Classic scales from Wowhead
-- https://wowhead.com
------------------------------------------------------------

local ScaleProviderName = "Classic"

PawnClassicLastUpdatedVersion = 2.1100


function PawnClassicScaleProvider_AddScales()

	if VgerCore.IsClassic or VgerCore.IsBurningCrusade then

		-- Level 60 rating conversions
		local HitRatingPer, SpellHitRatingPer, CritRatingPer, SpellCritRatingPer, HasteRatingPer, SpellHasteRatingPer, ExpertiseRatingPer, ArmorPenetrationPer, SpellPenetrationPer, DefenseRatingPer, DodgeRatingPer, ParryRatingPer, BlockRatingPer

		-- We use the same stat weights for Classic and Burning Crusade Classic, but on Classic Era, these stats all appear as percentages,
		-- so we pre-multiply each stat weight by the rating multiplier. These weights were originally designed for Burning Crusade, so
		-- they don't require any further modification on Burning Crusade Classic (including prepatch) servers.
		if VgerCore.IsClassic then
			HitRatingPer = 9.37931
			SpellHitRatingPer = 8
			CritRatingPer = 8.5
			SpellCritRatingPer = 8
			HasteRatingPer = 8.03
			SpellHasteRatingPer = 8.03
			ExpertiseRatingPer = 2.34483
			ArmorPenetrationPer = 3.75
			SpellPenetrationPer = 1
			DefenseRatingPer = 1.5
			DodgeRatingPer = 9.44
			ParryRatingPer = 9.44
			BlockRatingPer = 6.9
		else
			HitRatingPer = 1
			SpellHitRatingPer = 1
			CritRatingPer = 1
			SpellCritRatingPer = 1
			HasteRatingPer = 1
			SpellHasteRatingPer = 1
			ExpertiseRatingPer = 1
			ArmorPenetrationPer = 1
			SpellPenetrationPer = 1
			DefenseRatingPer = 1
			DodgeRatingPer = 1
			ParryRatingPer = 1
			BlockRatingPer = 1
		end

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			1, -- Balance
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.38, Mana=0.032, Spirit=0.34, Mp5=0.58, Healing=0, SpellDamage=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0.64, ShadowSpellDamage=0, NatureSpellDamage=0.43, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*1.21, SpellCritRating=SpellCritRatingPer*0.62, SpellHasteRating=SpellHasteRatingPer*0.8, SpellPenetration=SpellPenetrationPer*0.21,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			2, -- Feral (Damage)
			{ Strength=1.48, Agility=1, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.59, Rap=0, FeralAp=0.59, HitRating=HitRatingPer*0.61, ExpertiseRating=ExpertiseRatingPer*0.61, CritRating=CritRatingPer*0.59, HasteRating=HasteRatingPer*0.43, ArmorPenetration=ArmorPenetrationPer*0.4,
			Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, Healing=0.025, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.02, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			3, -- Feral (Tank)
			{ Strength=0.2, Agility=0.48, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0.34, HitRating=HitRatingPer*0.16, ExpertiseRating=ExpertiseRatingPer*0.18, CritRating=CritRatingPer*0.15, HasteRating=HasteRatingPer*0.31, ArmorPenetration=ArmorPenetrationPer*0.2,
			Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, Healing=0.025, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.025, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=1, Health=0.08, Hp5=2, Armor=0.1, DefenseRating=DefenseRatingPer*0.26, DodgeRating=DodgeRatingPer*0.38, ParryRating=ParryRatingPer*0, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			4, -- Restoration
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=1, Mana=0.09, Spirit=0.87, Mp5=1.7, Healing=1.21, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0.35, SpellHasteRating=SpellHasteRatingPer*0.49, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			1, -- Beast Mastery
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.4, Ap=0.43, Rap=0.43, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*0.05, CritRating=CritRatingPer*0.8, HasteRating=HasteRatingPer*0.5, ArmorPenetration=ArmorPenetrationPer*0.17,
			Intellect=0.8, Mana=0.075, Spirit=0.05, Mp5=2.4, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			2, -- Marksmanship
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.55, Rap=0.55, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*0.05, CritRating=CritRatingPer*0.6, HasteRating=HasteRatingPer*0.4, ArmorPenetration=ArmorPenetrationPer*0.37,
			Intellect=0.9, Mana=0.085, Spirit=0.05, Mp5=2.4, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			3, -- Survival
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=1, RangedDps=2.4, Ap=0.55, Rap=0.55, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*0.05, CritRating=CritRatingPer*0.65, HasteRating=HasteRatingPer*0.4, ArmorPenetration=ArmorPenetrationPer*0.28,
			Intellect=0.8, Mana=0.075, Spirit=0.05, Mp5=2.4, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			1, -- Arcane
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.46, Mana=0.038, Spirit=0.59, Mp5=1.13, Healing=0, SpellDamage=1, FireSpellDamage=0.064, FrostSpellDamage=0.52, ArcaneSpellDamage=0.88, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0.87, SpellCritRating=SpellCritRatingPer*0.6, SpellHasteRating=SpellHasteRatingPer*0.59, SpellPenetration=SpellPenetrationPer*0.09,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			2, -- Fire
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.44, Mana=0.036, Spirit=0.066, Mp5=0.9, Healing=0, SpellDamage=1, FireSpellDamage=0.94, FrostSpellDamage=0.32, ArcaneSpellDamage=0.168, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0.93, SpellCritRating=SpellCritRatingPer*0.77, SpellHasteRating=SpellHasteRatingPer*0.82, SpellPenetration=SpellPenetrationPer*0.09,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			3, -- Frost
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.37, Mana=0.032, Spirit=0.06, Mp5=0.8, Healing=0, SpellDamage=1, FireSpellDamage=0.05, FrostSpellDamage=0.95, ArcaneSpellDamage=0.13, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*1.22, SpellCritRating=SpellCritRatingPer*0.58, SpellHasteRating=SpellHasteRatingPer*0.63, SpellPenetration=SpellPenetrationPer*0.07,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			1, -- Holy
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=1, Mana=0.009, Spirit=0.28, Mp5=1.24, Healing=0.54, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0.46, SpellHasteRating=SpellHasteRatingPer*0.39, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0.01, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			2, -- Protection
			{ IsOffHand=PawnIgnoreStatValue, Strength=0.2, Agility=0.6, Dps=0, MeleeDps=1.77, RangedDps=0, Ap=0.06, Rap=0, FeralAp=0, HitRating=HitRatingPer*0.16, ExpertiseRating=ExpertiseRatingPer*0.27, CritRating=CritRatingPer*0.15, HasteRating=HasteRatingPer*0.5, ArmorPenetration=ArmorPenetrationPer*0.09,
			Intellect=0.5, Mana=0.045, Spirit=0.05, Mp5=1, Healing=0, SpellDamage=0.44, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0.44, SpellPower=0, SpellHitRating=SpellHitRatingPer*0.78, SpellCritRating=SpellCritRatingPer*0.6, SpellHasteRating=SpellHasteRatingPer*0.12, SpellPenetration=SpellPenetrationPer*0.03,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=DefenseRatingPer*0.7, DodgeRating=DodgeRatingPer*0.7, ParryRating=ParryRatingPer*0.6, BlockRating=BlockRatingPer*0.6, BlockValue=0.15, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			3, -- Retribution
			{ Strength=1, Agility=0.64, Dps=0, MeleeDps=5.4, RangedDps=0, Ap=0.41, Rap=0, FeralAp=0, HitRating=HitRatingPer*0.84, ExpertiseRating=ExpertiseRatingPer*0.87, CritRating=CritRatingPer*0.66, HasteRating=HasteRatingPer*0.25, ArmorPenetration=ArmorPenetrationPer*0.09,
			Intellect=0.34, Mana=0.032, Spirit=0.05, Mp5=1, Healing=0, SpellDamage=0.33, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0.33, SpellPower=0, SpellHitRating=SpellHitRatingPer*0.21, SpellCritRating=SpellCritRatingPer*0.12, SpellHasteRating=SpellHasteRatingPer*0.04, SpellPenetration=SpellPenetrationPer*0.015,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			1, -- Discipline
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=1, Mana=0.09, Spirit=0.48, Mp5=1.19, Healing=0.72, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0.32, SpellHasteRating=SpellHasteRatingPer*0.57, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			2, -- Holy
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=1, Mana=0.09, Spirit=0.73, Mp5=1.35, Healing=0.81, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0.24, SpellHasteRating=SpellHasteRatingPer*0.60, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			3, -- Shadow
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.19, Mana=0.017, Spirit=0.21, Mp5=1, Healing=0, SpellDamage=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=1, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*1.12, SpellCritRating=SpellCritRatingPer*0.76, SpellHasteRating=SpellHasteRatingPer*0.65, SpellPenetration=SpellPenetrationPer*0.08,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			1, -- Assassination
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*1.1, CritRating=CritRatingPer*0.81, HasteRating=HasteRatingPer*0.9, ArmorPenetration=ArmorPenetrationPer*0.24, MeleeMinDamage=1.25, MeleeMaxDamage=1.25,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.12, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			2, -- Combat
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*1.1, CritRating=CritRatingPer*0.81, HasteRating=HasteRatingPer*0.9, ArmorPenetration=ArmorPenetrationPer*0.24, MeleeMinDamage=0.875, MeleeMaxDamage=0.875,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.12, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			3, -- Subtlety
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*1.1, CritRating=CritRatingPer*0.81, HasteRating=HasteRatingPer*0.9, ArmorPenetration=ArmorPenetrationPer*0.24, MeleeMinDamage=1.25, MeleeMaxDamage=1.25,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.12, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			nil,
			{ IsCloth=PawnIgnoreStatValue, IsLeather=PawnIgnoreStatValue, IsMail=PawnIgnoreStatValue, IsPlate=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue, IsRanged=PawnIgnoreStatValue, MainHandDps=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=2, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*1.1, CritRating=CritRatingPer*0.81, HasteRating=HasteRatingPer*0.9, ArmorPenetration=ArmorPenetrationPer*0.24, MeleeSpeed=-80, SpeedBaseline=2.9,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.12, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		).LocalizedName = select(1, PawnGetClassInfo(4)) .. ": " .. SECONDARYHANDSLOT

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			1, -- Elemental
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.31, Mana=0.024, Spirit=0.09, Mp5=1.14, Healing=0, SpellDamage=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=1, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0.9, SpellCritRating=SpellCritRatingPer*1.05, SpellHasteRating=SpellHasteRatingPer*0.9, SpellPenetration=SpellPenetrationPer*0.38,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.12, BlockRating=BlockRatingPer*0.01, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			2, -- Enhancement
			{ Strength=1, Agility=0.87, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.5, Rap=0, FeralAp=0, HitRating=HitRatingPer*0.67, ExpertiseRating=ExpertiseRatingPer*1.5, CritRating=CritRatingPer*0.98, HasteRating=HasteRatingPer*0.64, ArmorPenetration=ArmorPenetrationPer*0.12,
			Intellect=0.34, Mana=0.032, Spirit=0.05, Mp5=1, Healing=0, SpellDamage=0.3, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.3, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0.223, SpellCritRating=SpellCritRatingPer*0.326, SpellHasteRating=SpellHasteRatingPer*0.08, SpellPenetration=SpellPenetrationPer*0.11,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			3, -- Restoration
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=1, Mana=0.009, Spirit=0.61, Mp5=1.33, Healing=0.9, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0.48, SpellHasteRating=SpellHasteRatingPer*0.74, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0.01, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			1, -- Affliction
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.4, Mana=0.03, Spirit=0.1, Mp5=1, Healing=0, SpellDamage=1, FireSpellDamage=0.35, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.91, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*1.2, SpellCritRating=SpellCritRatingPer*0.39, SpellHasteRating=SpellHasteRatingPer*0.78, SpellPenetration=SpellPenetrationPer*0.08,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			2, -- Demonology
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.4, Mana=0.03, Spirit=0.5, Mp5=1, Healing=0, SpellDamage=1, FireSpellDamage=0.80, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.8, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*1.2, SpellCritRating=SpellCritRatingPer*0.66, SpellHasteRating=SpellHasteRatingPer*0.7, SpellPenetration=SpellPenetrationPer*0.08,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			3, -- Destruction
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=HitRatingPer*0, ExpertiseRating=ExpertiseRatingPer*0, CritRating=CritRatingPer*0, HasteRating=HasteRatingPer*0, ArmorPenetration=ArmorPenetrationPer*0,
			Intellect=0.34, Mana=0.028, Spirit=0.25, Mp5=0.65, Healing=0, SpellDamage=1, FireSpellDamage=0.23, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.95, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*1.6, SpellCritRating=SpellCritRatingPer*0.87, SpellHasteRating=SpellHasteRatingPer*1.15, SpellPenetration=SpellPenetrationPer*0.08,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			1, -- Arms
			{ Strength=1, Agility=0.69, Dps=0, MeleeDps=5.31, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=HitRatingPer*1, ExpertiseRating=ExpertiseRatingPer*1, CritRating=CritRatingPer*0.85, HasteRating=HasteRatingPer*0.57, ArmorPenetration=ArmorPenetrationPer*1.1,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.05, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			2, -- Fury
			{ Strength=1, Agility=0.57, Dps=0, MeleeDps=5.22, RangedDps=0, Ap=0.54, Rap=0, FeralAp=0, HitRating=HitRatingPer*0.57, ExpertiseRating=ExpertiseRatingPer*0.57, CritRating=CritRatingPer*0.7, HasteRating=HasteRatingPer*0.41, ArmorPenetration=ArmorPenetrationPer*0.47,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=0.1, Health=0.01, Hp5=1, Armor=0.005, DefenseRating=DefenseRatingPer*0.05, DodgeRating=DodgeRatingPer*0.05, ParryRating=ParryRatingPer*0.12, BlockRating=BlockRatingPer*0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04, MetaSocketEffect=36, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			3, -- Protection
			{ IsOffHand=PawnIgnoreStatValue, Strength=0.33, Agility=0.59, Dps=0, MeleeDps=3.13, RangedDps=0, Ap=0.06, Rap=0, FeralAp=0, HitRating=HitRatingPer*0.67, ExpertiseRating=ExpertiseRatingPer*0.67, CritRating=CritRatingPer*0.28, HasteRating=HasteRatingPer*0.21, ArmorPenetration=ArmorPenetrationPer*0.19,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, Healing=0, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=SpellHitRatingPer*0, SpellCritRating=SpellCritRatingPer*0, SpellHasteRating=SpellHasteRatingPer*0, SpellPenetration=SpellPenetrationPer*0,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=DefenseRatingPer*0.81, DodgeRating=DodgeRatingPer*0.7, ParryRating=ParryRatingPer*0.58, BlockRating=BlockRatingPer*0.59, BlockValue=0.35, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2, MetaSocketEffect=36, }
		)

	elseif VgerCore.IsWrath then ------------------------------------------------------------

		local Scale

		Scale = PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			1, -- Blood
			{ Strength=1, Agility=0.48, Dps=0, MeleeDps=3.4, RangedDps=0, Ap=0.35, Rap=0, FeralAp=0, HitRating=0.87, ExpertiseRating=0.86, CritRating=0.54, HasteRating=0.52, ArmorPenetration=0.95,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)
		Scale.LocalizedName = Scale.LocalizedName .. " " .. DAMAGER

		Scale = PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			2, -- Frost (tank)
			{ Strength=1, Agility=0.78, Dps=0, MeleeDps=3.48, RangedDps=0, Ap=0.37, Rap=0, FeralAp=0, HitRating=1.03, ExpertiseRating=0.84, CritRating=0.46, HasteRating=0.29, ArmorPenetration=0.63,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=0.89, DodgeRating=0.72, ParryRating=0.54, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocketEffect=35, }
		)
		Scale.LocalizedName = Scale.LocalizedName .. " " .. TANK

		Scale = PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			3, -- Unholy
			{ Strength=1, Agility=0.31, Dps=0, MeleeDps=2.09, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0, HitRating=0.66, ExpertiseRating=0.51, CritRating=0.45, HasteRating=0.48, ArmorPenetration=0.32,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)
		Scale.LocalizedName = Scale.LocalizedName .. " " .. DAMAGER

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			1, -- Balance
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.21, ExpertiseRating=0, CritRating=0.62, HasteRating=0.8, ArmorPenetration=0,
			Intellect=0.38, Mana=0.032, Spirit=0.34, Mp5=0.58, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0.64, ShadowSpellDamage=0, NatureSpellDamage=0.43, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.21,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			2, -- Feral (Damage)
			{ Strength=1.35, Agility=1, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.61, Rap=0, FeralAp=0.61, HitRating=0.59, ExpertiseRating=0.59, CritRating=0.47, HasteRating=0.41, ArmorPenetration=0.59,
			Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			3, -- Feral (Tank)
			{ Strength=0.41, Agility=0.47, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0.34, HitRating=0.16, ExpertiseRating=0.18, CritRating=0.15, HasteRating=0.31, ArmorPenetration=0.2,
			Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, SpellPower=0.025, NatureSpellDamage=0.025, HolySpellDamage=0, SpellPenetration=0,
			Stamina=1, Health=0.055, Hp5=2, Armor=0.15, DefenseRating=0.26, DodgeRating=0.56, ParryRating=0, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			4, -- Restoration
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.35, HasteRating=1, ArmorPenetration=0,
			Intellect=0.66, Mana=0.036, Spirit=0.94, Mp5=1.8, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0.88, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			1, -- Beast Mastery
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.46, Rap=0.46, FeralAp=0, HitRating=1.08, ExpertiseRating=0.05, CritRating=0.84, HasteRating=0.16, ArmorPenetration=0.96,
			Intellect=0.55, Mana=0.03, Spirit=0.05, Mp5=2.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			2, -- Marksmanship
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.46, Rap=0.46, FeralAp=0, HitRating=1.08, ExpertiseRating=0.05, CritRating=0.84, HasteRating=0.16, ArmorPenetration=0.96,
				Intellect=0.55, Mana=0.03, Spirit=0.05, Mp5=2.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
				Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			3, -- Survival
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.46, Rap=0.46, FeralAp=0, HitRating=1.08, ExpertiseRating=0.05, CritRating=0.84, HasteRating=0.16, ArmorPenetration=0.96,
			Intellect=0.55, Mana=0.03, Spirit=0.05, Mp5=2.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			1, -- Arcane
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0.87, ExpertiseRating=0, CritRating=0.6, HasteRating=0.59, ArmorPenetration=0,
			Intellect=0.46, Mana=0.025, Spirit=0.42, Mp5=1.13, FireSpellDamage=0.064, FrostSpellDamage=0.22, ArcaneSpellDamage=0.95, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.09,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			2, -- Fire
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0.93, ExpertiseRating=0, CritRating=0.77, HasteRating=0.82, ArmorPenetration=0,
			Intellect=0.44, Mana=0.024, Spirit=0.46, Mp5=0.9, FireSpellDamage=0.95, FrostSpellDamage=0.32, ArcaneSpellDamage=0.168, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.09,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			3, -- Frost
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.22, ExpertiseRating=0, CritRating=0.58, HasteRating=0.63, ArmorPenetration=0,
			Intellect=0.37, Mana=0.02, Spirit=0.38, Mp5=0.8, FireSpellDamage=0.05, FrostSpellDamage=0.95, ArcaneSpellDamage=0.13, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.07,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			1, -- Holy
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.46, HasteRating=0.39, ArmorPenetration=0,
			Intellect=1, Mana=0.009, Spirit=0.28, Mp5=1.6, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0.01, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			2, -- Protection
			{ Strength=0.74, Agility=0.8, Dps=0, MeleeDps=1.77, RangedDps=0, Ap=0.13, Rap=0, FeralAp=0, HitRating=0.78, ExpertiseRating=0.27, CritRating=0.6, HasteRating=0.42, ArmorPenetration=0.14,
			Intellect=0.5, Mana=0.045, Spirit=0.05, Mp5=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0.4, SpellPower=0.4, SpellPenetration=0.03,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=0.7, DodgeRating=0.7, ParryRating=0.6, BlockRating=0.6, BlockValue=0.15, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			3, -- Retribution
			{ Strength=1, Agility=0.46, Dps=0, MeleeDps=5.5, RangedDps=0, Ap=0.41, Rap=0, FeralAp=0, HitRating=0.84, ExpertiseRating=0.52, CritRating=0.44, HasteRating=0.35, ArmorPenetration=0.3,
			Intellect=0.24, Mana=0.013, Spirit=0.05, Mp5=1.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0.2, SpellPower=0.2, SpellPenetration=0.010,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			1, -- Discipline
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.68, HasteRating=0.59, ArmorPenetration=0,
			Intellect=1, Mana=0.055, Spirit=0.42, Mp5=1.8, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0.58, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			2, -- Holy
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.42, HasteRating=0.58, ArmorPenetration=0,
			Intellect=0.83, Mana=0.046, Spirit=1, Mp5=2.44, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0.7, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			3, -- Shadow
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.12, ExpertiseRating=0, CritRating=0.61, HasteRating=0.56, ArmorPenetration=0,
			Intellect=0.19, Mana=0.01, Spirit=0.21, Mp5=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=1, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			1, -- Assassination
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.85, HasteRating=0.81, ArmorPenetration=1, MeleeMinDamage=1.25, MeleeMaxDamage=1.25,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			2, -- Combat
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.97, HasteRating=0.7, ArmorPenetration=1, MeleeMinDamage=0.875, MeleeMaxDamage=0.875,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			3, -- Subtlety
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.85, HasteRating=0.81, ArmorPenetration=1, MeleeMinDamage=1.25, MeleeMaxDamage=1.25,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			nil,
			{ IsCloth=PawnIgnoreStatValue, IsLeather=PawnIgnoreStatValue, IsMail=PawnIgnoreStatValue, IsPlate=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue, IsRanged=PawnIgnoreStatValue, MainHandDps=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=2, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.85, HasteRating=0.8, ArmorPenetration=1, MeleeSpeed=-80, SpeedBaseline=2.9,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		).LocalizedName = select(1, PawnGetClassInfo(4)) .. ": " .. SECONDARYHANDSLOT

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			1, -- Elemental
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.94, ExpertiseRating=0, CritRating=0.68, HasteRating=1.01, ArmorPenetration=0,
			Intellect=0.19, Mana=0.008, Spirit=0.09, Mp5=1.14, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.95, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.38,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			2, -- Enhancement
			{ Strength=0.65, Agility=1, Dps=0, MeleeDps=3.4, RangedDps=0, Ap=0.59, Rap=0, FeralAp=0, HitRating=1.8, ExpertiseRating=1.53, CritRating=0.98, HasteRating=0.76, ArmorPenetration=0.47,
			Intellect=1, Mana=0.03, Spirit=0.05, Mp5=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.3, HolySpellDamage=0, SpellPower=0.53, SpellPenetration=0.11,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			3, -- Restoration
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.95, HasteRating=1.8, ArmorPenetration=0,
			Intellect=0.75, Mana=0.009, Spirit=0.61, Mp5=0.95, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			1, -- Affliction
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.13, ExpertiseRating=0, CritRating=0.4, HasteRating=0.64, ArmorPenetration=0,
			Intellect=0.15, Mana=0.008, Spirit=0.51, Mp5=1, FireSpellDamage=0.6, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.6, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			2, -- Demonology
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.18, ExpertiseRating=0, CritRating=0.42, HasteRating=0.68, ArmorPenetration=0,
			Intellect=0.15, Mana=0.008, Spirit=0.48, Mp5=1, FireSpellDamage=0.6, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.6, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			3, -- Destruction
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.39, ExpertiseRating=0, CritRating=0.61, HasteRating=0.8, ArmorPenetration=0,
			Intellect=0.23, Mana=0.012, Spirit=0.55, Mp5=1, FireSpellDamage=0.6, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.6, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			1, -- Arms
			{ Strength=1, Agility=0.69, Dps=0, MeleeDps=5.31, RangedDps=0, Ap=0.52, Rap=0, FeralAp=0, HitRating=0.88, ExpertiseRating=1.21, CritRating=0.85, HasteRating=0.57, ArmorPenetration=1.1,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			2, -- Fury
			{ Strength=1, Agility=0.77, Dps=0, MeleeDps=5.22, RangedDps=0, Ap=0.66, Rap=0, FeralAp=0, HitRating=0.55, ExpertiseRating=1.5, CritRating=0.93, HasteRating=0.79, ArmorPenetration=1.38,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocketEffect=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			3, -- Protection
			{ IsOffHand=PawnIgnoreStatValue,
			Strength=0.33, Agility=0.59, Dps=0, MeleeDps=3.13, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0, HitRating=0.67, ExpertiseRating=0.94, CritRating=0.28, HasteRating=0.21, ArmorPenetration=0.29,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=0.81, DodgeRating=0.7, ParryRating=0.58, BlockRating=0.59, BlockValue=0.35, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocketEffect=35, }
		)

	elseif VgerCore.IsCataclysm then ------------------------------------------------------------

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			1, -- Blood
			{ Strength=2.45, Agility=1.2, Intellect=0, Stamina=3, Spirit=0, Armor=1, HitRating=6, CritRating=1.65, HasteRating=1.58, MasteryRating=7, ExpertiseRating=5, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=2.5, ParryRating=2.44, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=12.29, MetaSocketEffect=72, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			2, -- Frost
			{ Strength=2.92, Agility=0, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.03, HitRating=1.22, CritRating=1.06, HasteRating=1.3, MasteryRating=1.11, ExpertiseRating=0.56, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=6.05, OffHandDps=3.85, OneHandDps=6.05, TwoHandDps=6.05, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			3, -- Unholy
			{ Strength=4.49, Agility=0, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.03, HitRating=2.6, CritRating=2.12, HasteRating=2.4, MasteryRating=1.65, ExpertiseRating=0.94, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=6.13, MetaSocketEffect=72, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			1, -- Balance
			{ Strength=0, Agility=0, Intellect=1.3, Stamina=0.01, Spirit=1.27, Armor=0.005, HitRating=1.27, CritRating=0.41, HasteRating=0.8, MasteryRating=0.56, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			2, -- Feral
			{ Strength=0.38, Agility=1, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=0.36, CritRating=0.32, HasteRating=0.3, MasteryRating=0.33, ExpertiseRating=0.34, SpellPenetration=0, Ap=0.37, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=1.54, MetaSocketEffect=72, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			3, -- Guardian
			{ Strength=0.1, Agility=1, Intellect=0, Stamina=1.18, Spirit=0, Armor=0.33, HitRating=0.23, CritRating=0.41, HasteRating=0.06, MasteryRating=0.31, ExpertiseRating=0.46, SpellPenetration=0, Ap=0.09, SpellPower=0, DodgeRating=0.69, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=0, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			4, -- Restoration
			{ Strength=0, Agility=0, Intellect=0.38, Stamina=0.01, Spirit=0.34, Armor=0.005, HitRating=0, CritRating=0.69, HasteRating=0.77, MasteryRating=1, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			1, -- Beast Mastery
			{ Strength=0, Agility=2.65, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.12, CritRating=1.19, HasteRating=0.97, MasteryRating=0.55, ExpertiseRating=0, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, RangedDps=6.32, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			2, -- Marksmanship
			{ Strength=0, Agility=3.05, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.25, CritRating=1.39, HasteRating=1.33, MasteryRating=1.15, ExpertiseRating=0, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, RangedDps=6.32, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			3, -- Survival
			{ Strength=0, Agility=3.27, Intellect=0, Stamina=0.5, Spirit=0, Armor=0.005, HitRating=2.16, CritRating=1.17, HasteRating=0.89, MasteryRating=0.88, ExpertiseRating=0, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, RangedDps=3.75, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			1, -- Arcane
			{ Strength=0, Agility=0, Intellect=1.8, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=1.52, CritRating=0.65, HasteRating=0.7, MasteryRating=0.67, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			2, -- Fire
			{ Strength=0, Agility=0, Intellect=1.33, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=1.09, CritRating=0.62, HasteRating=0.82, MasteryRating=0.46, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			3, -- Frost
			{ Strength=0, Agility=0, Intellect=0.48, Stamina=0.01, Spirit=0.42, Armor=0.005, HitRating=0.38, CritRating=0.58, HasteRating=0.94, MasteryRating=1, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0.09, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			1, -- Holy
			{ Strength=0, Agility=0, Intellect=1.375, Stamina=0.01, Spirit=1.125, Armor=0.005, HitRating=0, CritRating=0.75, HasteRating=0.85, MasteryRating=0.5, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			2, -- Protection
			{ Strength=0.5, Agility=0, Intellect=0, Stamina=1.14, Spirit=0, Armor=0.04, HitRating=0.75, CritRating=0.2, HasteRating=0.3, MasteryRating=1, ExpertiseRating=0.75, SpellPenetration=0, Ap=0.15, SpellPower=0, DodgeRating=0.6, ParryRating=0.6, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=3.33, OneHandDps=3.33, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			3, -- Retribution
			{ Strength=2.28, Agility=0, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.33, CritRating=1.1, HasteRating=1, MasteryRating=1.23, ExpertiseRating=1.88, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=8.14, MetaSocketEffect=72, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			1, -- Discipline
			{ Strength=0, Agility=0, Intellect=0.11, Stamina=0.01, Spirit=0.47, Armor=0.005, HitRating=0.87, CritRating=0.74, HasteRating=1.65, MasteryRating=1, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			2, -- Holy
			{ Strength=0, Agility=0, Intellect=0.11, Stamina=0.01, Spirit=0.47, Armor=0.005, HitRating=0.87, CritRating=0.74, HasteRating=1.65, MasteryRating=1, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			3, -- Shadow
			{ Strength=0, Agility=0, Intellect=1, Stamina=0.01, Spirit=0.9, Armor=0.005, HitRating=0.85, CritRating=0.42, HasteRating=0.76, MasteryRating=0.48, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=0.79, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			1, -- Assassination
			{ Strength=1.05, Agility=2.64, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.62, CritRating=1.18, HasteRating=1.27, MasteryRating=1.35, ExpertiseRating=1.2, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=3, OffHandDps=0.97, OneHandDps=3, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			2, -- Combat
			{ Strength=1.05, Agility=2.85, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.21, CritRating=0.9, HasteRating=1.36, MasteryRating=1.33, ExpertiseRating=1.74, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=4.31, OffHandDps=1.32, OneHandDps=4.31, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			3, -- Subtlety
			{ Strength=1.05, Agility=3.84, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.19, CritRating=1.42, HasteRating=1.58, MasteryRating=0.95, ExpertiseRating=1.76, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=7.16, OffHandDps=1.07, OneHandDps=7.16, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			1, -- Elemental
			{ Strength=0, Agility=0, Intellect=1.24, Stamina=0.01, Spirit=0.59, Armor=0.005, HitRating=0.59, CritRating=0.34, HasteRating=0.57, MasteryRating=0.49, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			2, -- Enhancement
			{ Strength=0, Agility=2.47, Intellect=0.07, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=1.49, CritRating=0.84, HasteRating=0.66, MasteryRating=1.21, ExpertiseRating=1.3, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=3.05, OffHandDps=2.56, OneHandDps=3.05, TwoHandDps=3.05, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			3, -- Restoration
			{ Strength=0, Agility=0, Intellect=0.22, Stamina=0.01, Spirit=0.05, Armor=0.005, HitRating=0, CritRating=0.67, HasteRating=1.29, MasteryRating=1, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0.08, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			1, -- Affliction
			{ Strength=0, Agility=0, Intellect=1.26, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=0.93, CritRating=0.52, HasteRating=0.58, MasteryRating=0.38, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			2, -- Demonology
			{ Strength=0, Agility=0, Intellect=1.27, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=0.92, CritRating=0.51, HasteRating=2.75, MasteryRating=0.76, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			3, -- Destruction
			{ Strength=0, Agility=0, Intellect=1.25, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=0.87, CritRating=0.48, HasteRating=0.55, MasteryRating=0.47, ExpertiseRating=0, SpellPenetration=0, Ap=0, SpellPower=1, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, OneHandDps=0, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			1, -- Arms
			{ Strength=2.21, Agility=1.12, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.77, CritRating=1.45, HasteRating=0.68, MasteryRating=0.89, ExpertiseRating=1.75, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=9.22, MetaSocketEffect=72, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			2, -- Fury
			{ Strength=2.2, Agility=1.14, Intellect=0, Stamina=0.01, Spirit=0, Armor=0.005, HitRating=2.35, CritRating=1.48, HasteRating=1.05, MasteryRating=0.95, ExpertiseRating=1.46, SpellPenetration=0, Ap=1, SpellPower=0, DodgeRating=0, ParryRating=0, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=0, MetaSocketEffect=72, MainHandDps=3.15, OffHandDps=1.63, OneHandDps=3.15, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			3, -- Protection
			{ Strength=1.4, Agility=0.26, Intellect=0, Stamina=12.442, Spirit=0, Armor=2.155, HitRating=0.736, CritRating=0.336, HasteRating=0.048, MasteryRating=7.415, ExpertiseRating=0.863, SpellPenetration=0, Ap=0.196, SpellPower=0, DodgeRating=4.801, ParryRating=4.801, BlockRating=0, ResilienceRating=0, Mp5=0, Hp5=0, ArcaneResist=0, FireResist=0, ShadowResist=0, NatureResist=0, FrostResist=0, FireSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, ArcaneSpellDamage=0, FrostSpellDamage=0, Dps=6.081, MetaSocketEffect=72, }
		)

	elseif VgerCore.IsMists then ------------------------------------------------------------

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			1, -- Blood
			{ MasteryRating=100, Strength=92, ParryRating=77, DodgeRating=77, Stamina=50, Armor=31, HitRating=15, ExpertiseRating=15, Agility=0, CritRating=0, HasteRating=0, Ap=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			2, -- Frost
			{ MeleeDps=335, Strength=100, ExpertiseRating=90, HitRating=81, HasteRating=56, CritRating=48, Ap=42, MasteryRating=36, Stamina=.1, Agility=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			3, -- Unholy
			{ MeleeDps=137, Strength=100, HitRating=65, ExpertiseRating=65, HasteRating=49, CritRating=44, Ap=40, MasteryRating=35, Stamina=.1, Agility=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			1, -- Balance
			{ Intellect=100, HitRating=90, Spirit=90, SpellPower=83, CritRating=52, HasteRating=50, MasteryRating=45, Stamina=.1, Agility=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			2, -- Feral
			{ Agility=100, MeleeDps=96, Strength=41, MasteryRating=41, Ap=39, HitRating=32, ExpertiseRating=32, CritRating=31, HasteRating=29, Stamina=.1, Intellect=0, Spirit=0, SpellPower=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			3, -- Guardian
			{ Agility=100, DodgeRating=82, MasteryRating=44, CritRating=41, HasteRating=24, HitRating=21, ExpertiseRating=21, Armor=18, Stamina=18, Ap=3, Strength=3, Intellect=0, Spirit=0, SpellPower=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			4, -- Restoration
			{ Intellect=100, SpellPower=85, HasteRating=80, Spirit=75, MasteryRating=65, CritRating=60, Stamina=.1, Strength=0, Agility=0, HitRating=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			1, -- Beast Mastery
			{ Agility=100, RangedDps=90, Speed=74, HitRating=64, ExpertiseRating=64, Ap=38, HasteRating=37, CritRating=31, MasteryRating=20, Stamina=.1, Strength=0, Intellect=0, SpellPower=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			2, -- Marksmanship
			{ Speed=100, RangedDps=83, Agility=42, HitRating=40, ExpertiseRating=40, HasteRating=18, CritRating=16, Ap=15, MasteryRating=11, Stamina=.1, Strength=0, Intellect=0, SpellPower=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0,MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			3, -- Survival
			{ Agility=100, RangedDps=78, Speed=75, ExpertiseRating=67, HitRating=67, Ap=39, CritRating=30, HasteRating=28, MasteryRating=17, Stamina=.1, Strength=0, Intellect=0, SpellPower=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			1, -- Arcane
			{ Intellect=100, SpellPower=83, HitRating=72, MasteryRating=56, HasteRating=50, CritRating=38, Stamina=.1, Strength=0, Agility=0, Spirit=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			2, -- Fire
			{ Intellect=100, HitRating=79, SpellPower=75, CritRating=65, HasteRating=55, MasteryRating=46, Stamina=.1, Strength=0, Agility=0, Spirit=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			3, -- Frost
			{ Intellect=100, SpellPower=81, HitRating=68, HasteRating=44, CritRating=41, MasteryRating=37, Stamina=.1, Strength=0, Agility=0, Spirit=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			10, -- Monk
			1, -- Brewmaster
			{ Agility=100, HitRating=65, ExpertiseRating=65, HasteRating=62, CritRating=54, ParryRating=50, Armor=46, DodgeRating=42, Ap=35, MasteryRating=31, Stamina=27, Intellect=0, Spirit=0, SpellPower=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			10, -- Monk
			2, -- Mistweaver
			{ Intellect=100, SpellPower=85, Spirit=75, HasteRating=60, CritRating=50, MasteryRating=40, Stamina=.1, Agility=0, Armor=0, HitRating=0, DodgeRating=0, ParryRating=0, ExpertiseRating=0, Ap=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			10, -- Monk
			3, -- Windwalker
			{ HitRating=100, Agility=86, ExpertiseRating=79, HasteRating=46, CritRating=37, Strength=33, Ap=31, MasteryRating=21, Stamina=.1, Intellect=0, Spirit=0, SpellPower=0, DodgeRating=0, ParryRating=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			1, -- Holy
			{ Intellect=100, Spirit=75, SpellPower=75, HasteRating=55, CritRating=50, MasteryRating=50, Stamina=.1, Strength=0, Agility=0, HitRating=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			2, -- Protection
			{ MasteryRating=100, HitRating=63, Armor=62, ExpertiseRating=41, HasteRating=39, Strength=38, DodgeRating=34, ParryRating=34, Stamina=29, CritRating=10, Agility=0, Intellect=0, Ap=0, SpellPower=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			3, -- Retribution
			{ Speed=100, MeleeDps=98, Strength=58, ExpertiseRating=41, HitRating=41, HasteRating=32, MasteryRating=26, Ap=24, CritRating=24, Stamina=.1, Agility=0, Intellect=0, SpellPower=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			1, -- Discipline
			{ Intellect=100, SpellPower=81, Spirit=80, CritRating=60, MasteryRating=55, HasteRating=50, Stamina=.1, ExpertiseRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			2, -- Holy
			{ Intellect=100, SpellPower=85, Spirit=81, HasteRating=62, CritRating=43, MasteryRating=33, Stamina=.1, HitRating=0, ExpertiseRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			3, -- Shadow
			{ Intellect=100, SpellPower=81, Spirit=61, HitRating=61, HasteRating=60, CritRating=44, MasteryRating=38, Stamina=.1, ExpertiseRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			1, -- Assassination
			{ MeleeDps=137, Speed=100, Agility=80, ExpertiseRating=78, HitRating=78, HasteRating=44, MasteryRating=34, CritRating=31, Strength=29, Ap=29, Stamina=.1, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			2, -- Combat
			{ Agility=100, MeleeDps=92, HitRating=66, ExpertiseRating=45, MasteryRating=39, Strength=38, HasteRating=38, CritRating=37, Ap=36, Stamina=.1, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			3, -- Subtlety
			{ MeleeDps=123, Agility=100, HitRating=46, ExpertiseRating=39, HasteRating=38, CritRating=34, MasteryRating=29, Strength=28, Ap=27, Stamina=.1, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			1, -- Elemental
			{ HitRating=100, Spirit=100, Intellect=83, SpellPower=70, HasteRating=37, MasteryRating=33, CritRating=31, Stamina=.1, Strength=0, Agility=0, ExpertiseRating=0, Ap=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			2, -- Enhancement
			{ Agility=100, HitRating=99, ExpertiseRating=99, MeleeDps=91, MasteryRating=45, Strength=42, CritRating=41, Ap=40, HasteRating=37, Stamina=.1, Intellect=0, SpellPower=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			3, -- Restoration
			{ Intellect=100, SpellPower=75, Spirit=65, HasteRating=60, MasteryRating=55, CritRating=40, Stamina=.1, Strength=0, Agility=0, HitRating=0, ExpertiseRating=0, DodgeRating=0, ParryRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			1, -- Affliction
			{ Intellect=100, SpellPower=82, MasteryRating=62, HasteRating=57, HitRating=47, CritRating=39, Stamina=.1, Spirit=0, ExpertiseRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			2, -- Demonology
			{ Intellect=100, SpellPower=83, HitRating=73, MasteryRating=45, HasteRating=42, CritRating=41, Stamina=.1, Spirit=0, ExpertiseRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			3, -- Destruction
			{ Intellect=100, SpellPower=81, HitRating=68, HasteRating=46, CritRating=43, MasteryRating=41, Stamina=.1, Spirit=0, ExpertiseRating=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			1, -- Arms
			{ Dps=459, Strength=100, HitRating=78, ExpertiseRating=67, CritRating=56, Ap=49, MasteryRating=44, HasteRating=33, Stamina=.1, Agility=0, DodgeRating=0, ParryRating=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			2, -- Fury
			{ Dps=136, ExpertiseRating=100, HitRating=100, CritRating=73, Strength=51, MasteryRating=34, HasteRating=24, Ap=24, Stamina=.1, Agility=0, DodgeRating=0, ParryRating=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			3, -- Protection
			{ ParryRating=100, DodgeRating=100, Strength=98, Stamina=70, MasteryRating=50, ExpertiseRating=30, HitRating=30, Armor=25, HasteRating=20, CritRating=10, Agility=0, Dps=0, ResilienceRating=0, MetaSocketEffect=16000, }
		)

	else
		VgerCore.Fail("Failed to set up default Pawn scales because we weren't sure which version of WoW this is.")
		return
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

	if VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath or VgerCore.IsCataclysm then
		-- Since Pawn doesn't have an Automatic mode until Mists of Pandaria, enable the template scales when logging in for the first time
		-- IF the player hasn't already added a non-provider scale.
		-- For death knights only, do a one-time re-show on 2.6.5 since for some reason it wasn't working for some people.
		if PawnClassicScaleProviderOptions.LastAdded < 2 or (Class == "DEATHKNIGHT" and PawnClassicScaleProviderOptions.LastAdded < 3) then
			PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
			if PawnGetVisibleScaleCount() == 0 then
				PawnEnableAllScalesForClass()
			end
		end
	end

	PawnClassicScaleProviderOptions.LastAdded = 3

	-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
	PawnClassicScaleProvider_AddScales = nil

end -- PawnClassicScaleProvider_AddScales

------------------------------------------------------------

if VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath or VgerCore.IsCataclysm or VgerCore.IsMists then
	-- Scales for all versions of WoW Classic are in this file.
	PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.StarterProvider, PawnClassicScaleProvider_AddScales)
else
	-- We use Ask Mr. Robot spec-specific scales instead on mainline WoW.
	PawnClassicScaleProvider_AddScales = nil
end
