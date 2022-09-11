-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- WoW Classic scales sourced from HawsJon
-- http://tbcwowaddons.weebly.com/pawn.html
------------------------------------------------------------

local ScaleProviderName = "Classic"

PawnClassicLastUpdatedVersion = 2.0607


function PawnClassicScaleProvider_AddScales()

	if VgerCore.IsClassic or VgerCore.IsBurningCrusade then

		-- Level 60 rating conversions
		local HitRatingPer, SpellHitRatingPer, CritRatingPer, SpellCritRatingPer, HasteRatingPer, SpellHasteRatingPer, ExpertiseRatingPer, ArmorPenetrationPer, SpellPenetrationPer, DefenseRatingPer, DodgeRatingPer, ParryRatingPer, BlockRatingPer

		-- We use the same stat weights for Classic and Burning Crusade Classic, but on Classic, these stats all appear as percentages,
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
			MetaSocket=35, }
		)
		Scale.LocalizedName = Scale.LocalizedName .. " " .. DAMAGER

		Scale = PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			2, -- Frost (tank)
			{ Strength=1, Agility=0.78, Dps=0, MeleeDps=3.48, RangedDps=0, Ap=0.37, Rap=0, FeralAp=0, HitRating=1.03, ExpertiseRating=0.84, CritRating=0.46, HasteRating=0.29, ArmorPenetration=0.63,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=0.89, DodgeRating=0.72, ParryRating=0.54, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocket=35, }
		)
		Scale.LocalizedName = Scale.LocalizedName .. " " .. TANK

		Scale = PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			6, -- Death Knight
			3, -- Unholy
			{ Strength=1, Agility=0.31, Dps=0, MeleeDps=2.09, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0, HitRating=0.66, ExpertiseRating=0.51, CritRating=0.45, HasteRating=0.48, ArmorPenetration=0.32,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)
		Scale.LocalizedName = Scale.LocalizedName .. " " .. DAMAGER

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			1, -- Balance
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.21, ExpertiseRating=0, CritRating=0.62, HasteRating=0.8, ArmorPenetration=0,
			Intellect=0.38, Mana=0.032, Spirit=0.34, Mp5=0.58, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0.64, ShadowSpellDamage=0, NatureSpellDamage=0.43, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.21,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			2, -- Feral (Damage)
			{ Strength=1.35, Agility=1, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.61, Rap=0, FeralAp=0.61, HitRating=0.59, ExpertiseRating=0.59, CritRating=0.47, HasteRating=0.41, ArmorPenetration=0.59,
			Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			3, -- Feral (Tank)
			{ Strength=0.41, Agility=0.47, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0.34, HitRating=0.16, ExpertiseRating=0.18, CritRating=0.15, HasteRating=0.31, ArmorPenetration=0.2,
			Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, SpellPower=0.025, NatureSpellDamage=0.025, HolySpellDamage=0, SpellPenetration=0,
			Stamina=1, Health=0.055, Hp5=2, Armor=0.15, DefenseRating=0.26, DodgeRating=0.56, ParryRating=0, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			11, -- Druid
			4, -- Restoration
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.35, HasteRating=1, ArmorPenetration=0,
			Intellect=0.66, Mana=0.036, Spirit=0.94, Mp5=1.8, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0.88, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			1, -- Beast Mastery
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.46, Rap=0.46, FeralAp=0, HitRating=1.08, ExpertiseRating=0.05, CritRating=0.84, HasteRating=0.16, ArmorPenetration=0.96,
			Intellect=0.55, Mana=0.03, Spirit=0.05, Mp5=2.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			2, -- Marksmanship
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.46, Rap=0.46, FeralAp=0, HitRating=1.08, ExpertiseRating=0.05, CritRating=0.84, HasteRating=0.16, ArmorPenetration=0.96,
				Intellect=0.55, Mana=0.03, Spirit=0.05, Mp5=2.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
				Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			3, -- Hunter
			3, -- Survival
			{ Strength=0.05, Agility=1, Dps=0, MeleeDps=0.75, RangedDps=2.6, Ap=0.46, Rap=0.46, FeralAp=0, HitRating=1.08, ExpertiseRating=0.05, CritRating=0.84, HasteRating=0.16, ArmorPenetration=0.96,
			Intellect=0.55, Mana=0.03, Spirit=0.05, Mp5=2.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			1, -- Arcane
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0.87, ExpertiseRating=0, CritRating=0.6, HasteRating=0.59, ArmorPenetration=0,
			Intellect=0.46, Mana=0.025, Spirit=0.42, Mp5=1.13, FireSpellDamage=0.064, FrostSpellDamage=0.22, ArcaneSpellDamage=0.95, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.09,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			2, -- Fire
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0.93, ExpertiseRating=0, CritRating=0.77, HasteRating=0.82, ArmorPenetration=0,
			Intellect=0.44, Mana=0.024, Spirit=0.46, Mp5=0.9, FireSpellDamage=0.95, FrostSpellDamage=0.32, ArcaneSpellDamage=0.168, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.09,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			8, -- Mage
			3, -- Frost
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.22, ExpertiseRating=0, CritRating=0.58, HasteRating=0.63, ArmorPenetration=0,
			Intellect=0.37, Mana=0.02, Spirit=0.38, Mp5=0.8, FireSpellDamage=0.05, FrostSpellDamage=0.95, ArcaneSpellDamage=0.13, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.07,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			1, -- Holy
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.46, HasteRating=0.39, ArmorPenetration=0,
			Intellect=1, Mana=0.009, Spirit=0.28, Mp5=1.6, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0.01, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			2, -- Protection
			{ Strength=0.74, Agility=0.8, Dps=0, MeleeDps=1.77, RangedDps=0, Ap=0.13, Rap=0, FeralAp=0, HitRating=0.78, ExpertiseRating=0.27, CritRating=0.6, HasteRating=0.42, ArmorPenetration=0.14,
			Intellect=0.5, Mana=0.045, Spirit=0.05, Mp5=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0.4, SpellPower=0.4, SpellPenetration=0.03,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=0.7, DodgeRating=0.7, ParryRating=0.6, BlockRating=0.6, BlockValue=0.15, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			2, -- Paladin
			3, -- Retribution
			{ Strength=1, Agility=0.46, Dps=0, MeleeDps=5.5, RangedDps=0, Ap=0.41, Rap=0, FeralAp=0, HitRating=0.84, ExpertiseRating=0.52, CritRating=0.44, HasteRating=0.35, ArmorPenetration=0.3,
			Intellect=0.24, Mana=0.013, Spirit=0.05, Mp5=1.4, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0.2, SpellPower=0.2, SpellPenetration=0.010,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			1, -- Discipline
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.68, HasteRating=0.59, ArmorPenetration=0,
			Intellect=1, Mana=0.055, Spirit=0.42, Mp5=1.8, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0.58, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			2, -- Holy
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.42, HasteRating=0.58, ArmorPenetration=0,
			Intellect=0.83, Mana=0.046, Spirit=1, Mp5=2.44, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0.7, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			5, -- Priest
			3, -- Shadow
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.12, ExpertiseRating=0, CritRating=0.61, HasteRating=0.56, ArmorPenetration=0,
			Intellect=0.19, Mana=0.01, Spirit=0.21, Mp5=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=1, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			1, -- Assassination
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.85, HasteRating=0.81, ArmorPenetration=1, MeleeMinDamage=1.25, MeleeMaxDamage=1.25,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			2, -- Combat
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.97, HasteRating=0.7, ArmorPenetration=1, MeleeMinDamage=0.875, MeleeMaxDamage=0.875,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			3, -- Subtlety
			{ IsOffHand=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=3, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.85, HasteRating=0.81, ArmorPenetration=1, MeleeMinDamage=1.25, MeleeMaxDamage=1.25,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			4, -- Rogue
			nil,
			{ IsCloth=PawnIgnoreStatValue, IsLeather=PawnIgnoreStatValue, IsMail=PawnIgnoreStatValue, IsPlate=PawnIgnoreStatValue, IsShield=PawnIgnoreStatValue, IsRanged=PawnIgnoreStatValue, MainHandDps=PawnIgnoreStatValue, IsFrill=PawnIgnoreStatValue,
			Strength=0.5, Agility=1, Dps=0, MeleeDps=2, RangedDps=0, Ap=0.45, Rap=0, FeralAp=0, HitRating=0.92, ExpertiseRating=0.84, CritRating=0.85, HasteRating=0.8, ArmorPenetration=1, MeleeSpeed=-80, SpeedBaseline=2.9,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		).LocalizedName = select(1, PawnGetClassInfo(4)) .. ": " .. SECONDARYHANDSLOT

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			1, -- Elemental
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.94, ExpertiseRating=0, CritRating=0.68, HasteRating=1.01, ArmorPenetration=0,
			Intellect=0.19, Mana=0.008, Spirit=0.09, Mp5=1.14, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.95, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.38,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			2, -- Enhancement
			{ Strength=0.65, Agility=1, Dps=0, MeleeDps=3.4, RangedDps=0, Ap=0.59, Rap=0, FeralAp=0, HitRating=1.8, ExpertiseRating=1.53, CritRating=0.98, HasteRating=0.76, ArmorPenetration=0.47,
			Intellect=1, Mana=0.03, Spirit=0.05, Mp5=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.3, HolySpellDamage=0, SpellPower=0.53, SpellPenetration=0.11,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			7, -- Shaman
			3, -- Restoration
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0.95, HasteRating=1.8, ArmorPenetration=0,
			Intellect=0.75, Mana=0.009, Spirit=0.61, Mp5=0.95, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			1, -- Affliction
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.13, ExpertiseRating=0, CritRating=0.4, HasteRating=0.64, ArmorPenetration=0,
			Intellect=0.15, Mana=0.008, Spirit=0.51, Mp5=1, FireSpellDamage=0.6, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.6, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			2, -- Demonology
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.18, ExpertiseRating=0, CritRating=0.42, HasteRating=0.68, ArmorPenetration=0,
			Intellect=0.15, Mana=0.008, Spirit=0.48, Mp5=1, FireSpellDamage=0.6, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.6, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			9, -- Warlock
			3, -- Destruction
			{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=1.39, ExpertiseRating=0, CritRating=0.61, HasteRating=0.8, ArmorPenetration=0,
			Intellect=0.23, Mana=0.012, Spirit=0.55, Mp5=1, FireSpellDamage=0.6, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0.6, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=1, SpellPenetration=0.08,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			1, -- Arms
			{ Strength=1, Agility=0.69, Dps=0, MeleeDps=5.31, RangedDps=0, Ap=0.52, Rap=0, FeralAp=0, HitRating=0.88, ExpertiseRating=1.21, CritRating=0.85, HasteRating=0.57, ArmorPenetration=1.1,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			2, -- Fury
			{ Strength=1, Agility=0.77, Dps=0, MeleeDps=5.22, RangedDps=0, Ap=0.66, Rap=0, FeralAp=0, HitRating=0.55, ExpertiseRating=1.5, CritRating=0.93, HasteRating=0.79, ArmorPenetration=1.38,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=0.3, Health=0.03, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.12, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,
			MetaSocket=35, }
		)

		PawnAddPluginScaleFromTemplate(
			ScaleProviderName,
			1, -- Warrior
			3, -- Protection
			{ IsOffHand=PawnIgnoreStatValue,
			Strength=0.33, Agility=0.59, Dps=0, MeleeDps=3.13, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0, HitRating=0.67, ExpertiseRating=0.94, CritRating=0.28, HasteRating=0.21, ArmorPenetration=0.29,
			Intellect=0, Mana=0, Spirit=0.05, Mp5=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellPenetration=0,
			Stamina=1, Health=0.09, Hp5=2, Armor=0.02, DefenseRating=0.81, DodgeRating=0.7, ParryRating=0.58, BlockRating=0.59, BlockValue=0.35, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
			MetaSocket=35, }
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

	-- Since Pawn doesn't have an Automatic mode on Classic, enable the template scales when logging in for the first time
	-- IF the player hasn't already added a non-provider scale.
	-- For death knights only, do a one-time re-show on 2.6.5 since for some reason it wasn't working for some people.
	if PawnClassicScaleProviderOptions.LastAdded < 2 or (Class == "DEATHKNIGHT" and PawnClassicScaleProviderOptions.LastAdded < 3) then
		PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
		if PawnGetVisibleScaleCount() == 0 then
			PawnEnableAllScalesForClass()
		end
	end

	PawnClassicScaleProviderOptions.LastAdded = 3

	-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
	PawnClassicScaleProvider_AddScales = nil

end -- PawnClassicScaleProvider_AddScales

------------------------------------------------------------

if VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath then
	-- Scales for all versions of WoW Classic are in this file.
	PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.StarterProvider, PawnClassicScaleProvider_AddScales)
else
	-- We use Ask Mr. Robot spec-specific scales instead on mainline WoW.
	PawnClassicScaleProvider_AddScales = nil
end
