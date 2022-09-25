-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0535


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=59.82, Avoidance=27.23, CritRating=40.13, HasteRating=30.67, Indestructible=0.01, Leech=10.07, MasteryRating=53.46, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=90.86, Strength=71.85, Versatility=77.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=2.42, HasteRating=1.47, Indestructible=0.01, Leech=0.01, MasteryRating=2.10, MaxDamage=1.74, MinDamage=1.74, MovementSpeed=0.03, Strength=3.67, Versatility=1.60 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.99, HasteRating=2.74, Indestructible=0.01, Leech=0.01, MasteryRating=2.48, MaxDamage=2.99, MinDamage=2.99, MovementSpeed=0.03, Strength=4.33, Versatility=1.89 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=3.43, Avoidance=0.02, CritRating=1.36, HasteRating=1.43, Indestructible=0.01, Leech=0.01, MasteryRating=1.57, MaxDamage=2.62, MinDamage=2.62, MovementSpeed=0.03, Versatility=1.56 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=42.58, Armor=116.93, Avoidance=0.02, CritRating=28.56, HasteRating=39.36, Indestructible=0.01, Leech=47.24, MasteryRating=15.68, MaxDamage=29.61, MinDamage=29.61, MovementSpeed=0.01, Stamina=54.41, Versatility=64.90 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.64, HasteRating=1.77, Indestructible=0.01, Intellect=3.49, Leech=0.01, MasteryRating=2.25, MovementSpeed=0.02, Versatility=1.69 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=3.33, Avoidance=0.02, CritRating=1.90, HasteRating=1.55, Indestructible=0.01, Leech=0.01, MasteryRating=1.60, MaxDamage=2.72, MinDamage=2.72, MovementSpeed=0.03, Versatility=1.58 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=48.32, Armor=133.39, Avoidance=21.64, CritRating=16.41, HasteRating=28.84, Indestructible=0.01, Leech=34.36, MasteryRating=41.26, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=76.22, Versatility=55.46 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=1.47, HasteRating=1.59, Indestructible=0.01, Intellect=3.49, Leech=0.85, MasteryRating=1.36, MovementSpeed=0.01, Versatility=1.52 }
)

if VgerCore.EvokersExist then

	PawnAddPluginScaleFromTemplate(
		ScaleProviderName,
		13, -- Evoker
		1, -- Devastation
		{ }
	)

	PawnAddPluginScaleFromTemplate(
		ScaleProviderName,
		13, -- Evoker
		2, -- Preservation
		{ }
	)

end

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=4.20, Avoidance=0.03, CritRating=1.80, HasteRating=2.46, Indestructible=0.01, Leech=0.01, MasteryRating=1.49, MaxDamage=2.35, MinDamage=2.35, MovementSpeed=0.02, Versatility=1.71 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=3.60, Avoidance=0.03, CritRating=1.98, HasteRating=1.58, Indestructible=0.01, Leech=0.01, MasteryRating=2.12, MaxDamage=3.77, MinDamage=3.77, MovementSpeed=0.02, Versatility=1.57 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=3.47, Avoidance=0.02, CritRating=1.60, HasteRating=1.95, Indestructible=0.01, Leech=0.01, MasteryRating=1.08, MaxDamage=2.17, MinDamage=2.17, MovementSpeed=0.03, Versatility=1.57 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.70, HasteRating=1.19, Indestructible=0.01, Intellect=3.40, Leech=0.01, MasteryRating=1.92, MovementSpeed=0.02, Versatility=1.57 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.67, HasteRating=1.64, Indestructible=0.01, Intellect=3.32, Leech=0.01, MasteryRating=1.47, MovementSpeed=0.02, Versatility=1.51 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=1.31, HasteRating=1.65, Indestructible=0.01, Intellect=3.60, Leech=0.01, MasteryRating=1.41, MovementSpeed=0.02, Versatility=1.64 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=37.20, Armor=40.77, Avoidance=0.02, CritRating=12.83, HasteRating=1.20, Indestructible=0.01, Leech=4.79, MasteryRating=19.18, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=22.99, Versatility=27.28 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=1.18, HasteRating=1.75, Indestructible=0.01, Intellect=2.87, Leech=0.80, MasteryRating=1.19, MovementSpeed=0.01, Versatility=1.22 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=2.77, Avoidance=0.02, CritRating=1.31, HasteRating=1.10, Indestructible=0.01, Leech=0.01, MasteryRating=1.41, MaxDamage=2.15, MinDamage=2.15, MovementSpeed=0.03, Stamina=0.18, Versatility=1.42 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=1.34, HasteRating=1.53, Indestructible=0.01, Intellect=3.17, Leech=0.91, MasteryRating=1.44, MovementSpeed=0.01, Versatility=1.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Avoidance=0.03, CritRating=1.12, HasteRating=0.98, Indestructible=0.01, Leech=0.02, MasteryRating=1.63, MaxDamage=2.89, MinDamage=2.89, MovementSpeed=0.01, Strength=2.78, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.49, HasteRating=1.80, Indestructible=0.01, Leech=0.01, MasteryRating=1.78, MaxDamage=2.70, MinDamage=2.70, MovementSpeed=0.03, Strength=3.35, Versatility=1.56 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=0.87, HasteRating=0.13, Indestructible=0.01, Intellect=2.16, Leech=0.63, MasteryRating=0.72, MovementSpeed=0.01, Versatility=0.98 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=1.38, HasteRating=1.12, Indestructible=0.01, Intellect=3.36, Leech=0.63, MasteryRating=1.81, MovementSpeed=0.01, Versatility=1.52 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.94, HasteRating=2.31, Indestructible=0.01, Intellect=3.79, Leech=0.01, MasteryRating=2.05, MovementSpeed=0.02, Versatility=1.71 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=4.29, Avoidance=0.02, CritRating=2.28, HasteRating=2.20, Indestructible=0.01, Leech=0.01, MasteryRating=2.13, MaxDamage=6.84, MinDamage=6.84, MovementSpeed=0.03, Versatility=1.87 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=2.94, Avoidance=0.02, CritRating=1.26, HasteRating=1.30, Indestructible=0.01, Leech=0.01, MasteryRating=1.11, MaxDamage=2.71, MinDamage=2.71, MovementSpeed=0.03, Versatility=1.33 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=4.08, Avoidance=0.02, CritRating=1.87, HasteRating=0.94, Indestructible=0.01, Leech=0.01, MasteryRating=1.62, MaxDamage=5.64, MinDamage=5.64, MovementSpeed=0.03, Versatility=1.80 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.47, HasteRating=1.86, Indestructible=0.01, Intellect=3.82, Leech=0.01, MasteryRating=1.32, MovementSpeed=0.02, Versatility=1.80 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=3.60, Avoidance=0.02, CritRating=1.59, HasteRating=2.00, Indestructible=0.01, Leech=0.01, MasteryRating=1.69, MaxDamage=2.28, MinDamage=2.28, MovementSpeed=0.03, Versatility=1.52 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=1.51, HasteRating=0.54, Indestructible=0.01, Intellect=3.12, Leech=1.16, MasteryRating=1.42, MovementSpeed=0.01, Versatility=1.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.66, HasteRating=1.82, Indestructible=0.01, Intellect=3.50, Leech=0.01, MasteryRating=2.25, MovementSpeed=0.02, Versatility=1.61 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.73, HasteRating=1.57, Indestructible=0.01, Intellect=3.64, Leech=0.01, MasteryRating=1.48, MovementSpeed=0.02, Versatility=1.70 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=2.17, HasteRating=2.16, Indestructible=0.01, Intellect=4.26, Leech=0.01, MasteryRating=2.14, MovementSpeed=0.02, Versatility=1.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.96, HasteRating=1.64, Indestructible=0.01, Leech=0.01, MasteryRating=1.94, MaxDamage=2.58, MinDamage=2.58, MovementSpeed=0.03, Strength=3.75, Versatility=1.69 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.74, HasteRating=2.14, Indestructible=0.01, Leech=0.01, MasteryRating=2.08, MaxDamage=2.12, MinDamage=2.12, MovementSpeed=0.03, Strength=3.74, Versatility=1.77 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=36.08, Avoidance=24.20, CritRating=14.12, HasteRating=40.16, Indestructible=0.01, Leech=16.98, MasteryRating=36.13, MaxDamage=48.55, MinDamage=48.55, MovementSpeed=0.01, Stamina=43.18, Strength=48.12, Versatility=50.81 }
)


------------------------------------------------------------

-- PawnMrRobotScaleProviderOptions.LastAdded keeps track of the last time that we tried to automatically enable scales for this character.
if not PawnMrRobotScaleProviderOptions then PawnMrRobotScaleProviderOptions = { } end
if not PawnMrRobotScaleProviderOptions.LastAdded then PawnMrRobotScaleProviderOptions.LastAdded = 0 end

local _, Class = UnitClass("player")
if PawnMrRobotScaleProviderOptions.LastClass ~= nil and Class ~= PawnMrRobotScaleProviderOptions.LastClass then
	-- If the character has changed class since last time, let's start over.
	PawnSetAllScaleProviderScalesVisible(ScaleProviderName, false)
	PawnMrRobotScaleProviderOptions.LastAdded = 0
end
PawnMrRobotScaleProviderOptions.LastClass = Class

-- These scales are new, and we don't need any upgrade logic yet.
PawnMrRobotScaleProviderOptions.LastAdded = 1

-- After this function terminates there's no need for it anymore, so cause it to self-destruct to save memory.
PawnMrRobotScaleProvider_AddScales = nil

end -- PawnMrRobotScaleProvider_AddScales

------------------------------------------------------------

if VgerCore.IsMainline then
	PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.AskMrRobotProvider, PawnMrRobotScaleProvider_AddScales)
else
	-- These scales aren't useful on WoW Classic versions, so skip them.
	PawnMrRobotScaleProvider_AddScales = nil
end
