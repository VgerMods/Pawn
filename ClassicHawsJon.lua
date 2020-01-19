-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2020 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- WoW Classic scales sourced from HawsJon
-- http://tbcwowaddons.weebly.com/pawn.html
------------------------------------------------------------

local ScaleProviderName = "Classic"

PawnClassicLastUpdatedVersion = 2.0318


function PawnClassicScaleProvider_AddScales()

	PawnAddPluginScaleFromTemplate(
		ScaleProviderName,
		11, -- Druid
		1, -- Balance
		{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0, HasteRating=0, ArmorPenetration=0,
		Intellect=0.38, Mana=0.032, Spirit=0.34, Mp5=0.58, Healing=0, SpellDamage=1, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0.64, ShadowSpellDamage=0, NatureSpellDamage=0.43, HolySpellDamage=0, SpellPower=0, SpellHitRating=1.21, SpellCritRating=0.62, SpellHasteRating=0.8, SpellPenetration=0.21,
		Stamina=0.5, Health=0.05, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,  }
	)

	PawnAddPluginScaleFromTemplate(
		ScaleProviderName,
		11, -- Druid
		2, -- Feral
		{ Strength=1.48, Agility=1, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.59, Rap=0, FeralAp=0.59, HitRating=0.61, ExpertiseRating=0.61, CritRating=0.59, HasteRating=0.43, ArmorPenetration=0.4,
		Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, Healing=0.025, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=0, SpellCritRating=0, SpellHasteRating=0, SpellPenetration=0,
		Stamina=0.5, Health=0.05, Hp5=1, Armor=0.02, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,  }
	)
		
	PawnAddPluginScaleFromTemplate(
		ScaleProviderName,
		11, -- Druid
		3, -- Guardian
		{ Strength=0.2, Agility=0.48, Dps=0, MeleeDps=0, RangedDps=0, Ap=0.34, Rap=0, FeralAp=0.34, HitRating=0.16, ExpertiseRating=0.18, CritRating=0.15, HasteRating=0.31, ArmorPenetration=0.2,
		Intellect=0.1, Mana=0.009, Spirit=0.05, Mp5=0.3, Healing=0.025, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0.025, HolySpellDamage=0, SpellPower=0, SpellHitRating=0, SpellCritRating=0, SpellHasteRating=0, SpellPenetration=0,
		Stamina=1, Health=0.08, Hp5=2, Armor=0.1, DefenseRating=0.26, DodgeRating=0.38, ParryRating=0, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=1, FireResist=0.2, FrostResist=0.2, ArcaneResist=0.2, ShadowResist=0.2, NatureResist=0.2,
		 }
	)

	PawnAddPluginScaleFromTemplate(
		ScaleProviderName,
		11, -- Druid
		4, -- Restoration
		{ Strength=0, Agility=0.05, Dps=0, MeleeDps=0, RangedDps=0, Ap=0, Rap=0, FeralAp=0, HitRating=0, ExpertiseRating=0, CritRating=0, HasteRating=0, ArmorPenetration=0,
		Intellect=1, Mana=0.09, Spirit=0.87, Mp5=1.7, Healing=1.21, SpellDamage=0, FireSpellDamage=0, FrostSpellDamage=0, ArcaneSpellDamage=0, ShadowSpellDamage=0, NatureSpellDamage=0, HolySpellDamage=0, SpellPower=0, SpellHitRating=0, SpellCritRating=0.35, SpellHasteRating=0.49, SpellPenetration=0,
		Stamina=0.5, Health=0.05, Hp5=1, Armor=0.005, DefenseRating=0.05, DodgeRating=0.05, ParryRating=0.05, BlockRating=0, BlockValue=0, ResilienceRating=0.2, AllResist=0.2, FireResist=0.04, FrostResist=0.04, ArcaneResist=0.04, ShadowResist=0.04, NatureResist=0.04,  }
	)

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
