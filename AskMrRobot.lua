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
	{ Armor=51.52, Avoidance=0.02, CritRating=31.16, HasteRating=18.37, Indestructible=0.01, Leech=19.16, MasteryRating=35.72, MaxDamage=13.45, MinDamage=13.45, MovementSpeed=0.01, Stamina=72.91, Strength=55.44, Versatility=58.63 }
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
	{ Avoidance=0.02, CritRating=1.89, HasteRating=2.60, Indestructible=0.01, Leech=0.01, MasteryRating=2.27, MaxDamage=2.92, MinDamage=2.92, MovementSpeed=0.03, Strength=3.97, Versatility=1.86 }
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
	{ Avoidance=0.03, CritRating=1.59, HasteRating=1.64, Indestructible=0.01, Intellect=3.49, Leech=0.01, MasteryRating=2.21, MovementSpeed=0.02, Versatility=1.63 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=3.16, Avoidance=0.02, CritRating=1.86, HasteRating=1.40, Indestructible=0.01, Leech=0.01, MasteryRating=1.51, MaxDamage=2.65, MinDamage=2.65, MovementSpeed=0.03, Versatility=1.49 }
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

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=4.05, Avoidance=0.03, CritRating=1.77, HasteRating=2.24, Indestructible=0.01, Leech=0.01, MasteryRating=1.38, MaxDamage=2.27, MinDamage=2.27, MovementSpeed=0.02, Versatility=1.60 }
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
	{ Agility=3.42, Avoidance=0.02, CritRating=1.53, HasteRating=1.84, Indestructible=0.01, Leech=0.01, MasteryRating=1.01, MaxDamage=2.06, MinDamage=2.06, MovementSpeed=0.03, Versatility=1.51 }
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
	{ Armor=26.83, Avoidance=0.02, CritRating=16.93, HasteRating=4.42, Indestructible=0.01, Leech=43.05, MasteryRating=47.20, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=49.47, Strength=56.50, Versatility=41.06 }
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
	{ Avoidance=0.02, CritRating=1.43, HasteRating=0.97, Indestructible=0.01, Intellect=3.27, Leech=0.80, MasteryRating=1.65, MovementSpeed=0.01, Versatility=1.41 }
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
	{ Agility=3.01, Avoidance=0.02, CritRating=1.26, HasteRating=1.40, Indestructible=0.01, Leech=0.01, MasteryRating=1.06, MaxDamage=2.73, MinDamage=2.73, MovementSpeed=0.03, Versatility=1.39 }
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
	{ Avoidance=0.03, CritRating=1.32, HasteRating=1.85, Indestructible=0.01, Intellect=3.61, Leech=0.01, MasteryRating=1.19, MovementSpeed=0.02, Versatility=1.62 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=3.62, Avoidance=0.02, CritRating=1.61, HasteRating=1.92, Indestructible=0.01, Leech=0.01, MasteryRating=1.62, MaxDamage=2.44, MinDamage=2.44, MovementSpeed=0.03, Versatility=1.50 }
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
	{ Avoidance=0.03, CritRating=1.65, HasteRating=1.74, Indestructible=0.01, Intellect=3.35, Leech=0.01, MasteryRating=2.11, MovementSpeed=0.02, Versatility=1.50 }
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
	{ Avoidance=0.03, CritRating=2.03, HasteRating=2.09, Indestructible=0.01, Intellect=4.08, Leech=0.01, MasteryRating=1.98, MovementSpeed=0.02, Versatility=1.76 }
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
	{ Avoidance=0.02, CritRating=1.89, HasteRating=2.52, Indestructible=0.01, Leech=0.01, MasteryRating=2.40, MaxDamage=2.12, MinDamage=2.12, MovementSpeed=0.03, Strength=4.02, Versatility=2.03 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=24.86, Avoidance=20.01, CritRating=18.97, HasteRating=34.29, Indestructible=0.01, Leech=23.22, MasteryRating=31.19, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=36.43, Strength=47.68, Versatility=43.64 }
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

if VgerCore.IsShadowlands then
	PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.AskMrRobotProvider, PawnMrRobotScaleProvider_AddScales)
else
	-- These scales aren't useful on WoW Classic versions, so skip them.
	PawnMrRobotScaleProvider_AddScales = nil
end
