-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2021 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0412


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=44.91, Avoidance=0.02, CritRating=56.88, HasteRating=103.07, Indestructible=0.01, Leech=57.57, MasteryRating=132.89, MaxDamage=73.38, MinDamage=73.38, MovementSpeed=0.01, Stamina=130.91, Strength=73.68, Versatility=130.76 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=1.72, HasteRating=1.17, Indestructible=0.01, Leech=0.01, MasteryRating=1.80, MaxDamage=2.96, MinDamage=2.96, MovementSpeed=0.03, Strength=3.95, Versatility=1.30 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.52, HasteRating=1.56, Indestructible=0.01, Leech=0.01, MasteryRating=1.80, MaxDamage=2.65, MinDamage=2.65, MovementSpeed=0.03, Strength=4.05, Versatility=1.41 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=3.72, Avoidance=0.02, CritRating=1.20, HasteRating=1.18, Indestructible=0.01, Leech=0.01, MasteryRating=1.08, MaxDamage=3.63, MinDamage=3.63, MovementSpeed=0.03, Versatility=1.29 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=94.53, Armor=128.99, Avoidance=14.58, CritRating=63.15, HasteRating=67.78, Indestructible=0.01, Leech=95.42, MasteryRating=30.37, MaxDamage=99.98, MinDamage=99.98, MovementSpeed=0.01, Stamina=67.08, Versatility=108.29 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.27, HasteRating=1.67, Indestructible=0.01, Intellect=3.62, Leech=0.01, MasteryRating=1.30, MovementSpeed=0.02, Versatility=1.24 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=2.92, Avoidance=0.02, CritRating=1.27, HasteRating=1.21, Indestructible=0.01, Leech=0.01, MasteryRating=1.25, MaxDamage=2.21, MinDamage=2.21, MovementSpeed=0.03, Versatility=1.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=56.70, Armor=83.04, Avoidance=0.02, CritRating=32.97, HasteRating=28.41, Indestructible=0.01, Leech=76.72, MasteryRating=56.03, MaxDamage=33.44, MinDamage=33.44, MovementSpeed=0.01, Stamina=97.23, Versatility=71.35 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=0.69, HasteRating=0.97, Indestructible=0.01, Intellect=1.89, Leech=0.03, MasteryRating=0.01, MovementSpeed=0.01, Versatility=0.68 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=3.56, Avoidance=0.03, CritRating=1.30, HasteRating=1.53, Indestructible=0.01, Leech=0.01, MasteryRating=1.22, MaxDamage=2.40, MinDamage=2.40, MovementSpeed=0.02, Versatility=1.14 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=3.47, Avoidance=0.03, CritRating=1.46, HasteRating=1.28, Indestructible=0.01, Leech=0.01, MasteryRating=1.55, MaxDamage=3.25, MinDamage=3.25, MovementSpeed=0.02, Versatility=1.23 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=2.95, Avoidance=0.02, CritRating=1.09, HasteRating=1.45, Indestructible=0.01, Leech=0.01, MasteryRating=0.65, MaxDamage=1.88, MinDamage=1.88, MovementSpeed=0.03, Versatility=1.05 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.39, HasteRating=1.19, Indestructible=0.01, Intellect=3.71, Leech=0.01, MasteryRating=1.36, MovementSpeed=0.02, Versatility=1.31 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.17, HasteRating=1.12, Indestructible=0.01, Intellect=2.93, Leech=0.01, MasteryRating=0.98, MovementSpeed=0.02, Versatility=1.03 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=1.20, HasteRating=1.66, Indestructible=0.01, Intellect=3.89, Leech=0.01, MasteryRating=1.17, MovementSpeed=0.02, Versatility=1.41 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=97.21, Armor=47.85, Avoidance=4.54, CritRating=44.55, HasteRating=8.90, Indestructible=0.01, Leech=89.29, MasteryRating=46.20, MaxDamage=69.91, MinDamage=69.91, MovementSpeed=0.01, Stamina=94.55, Versatility=75.23 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=0.70, HasteRating=0.77, Indestructible=0.01, Intellect=1.76, Leech=0.03, MasteryRating=0.01, MovementSpeed=0.01, Versatility=0.69 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=3.46, Avoidance=0.02, CritRating=1.25, HasteRating=1.04, Indestructible=0.01, Leech=0.01, MasteryRating=1.24, MaxDamage=2.81, MinDamage=2.81, MovementSpeed=0.03, Stamina=0.15, Versatility=1.29 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=0.73, HasteRating=0.79, Indestructible=0.01, Intellect=2.13, Leech=0.03, MasteryRating=0.01, MovementSpeed=0.01, Versatility=0.77 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=15.00, Avoidance=0.02, CritRating=23.15, HasteRating=17.71, Indestructible=0.01, Leech=75.59, MasteryRating=52.14, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=41.77, Strength=44.36, Versatility=38.28 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.31, HasteRating=1.30, Indestructible=0.01, Leech=0.01, MasteryRating=1.47, MaxDamage=2.79, MinDamage=2.79, MovementSpeed=0.03, Strength=3.46, Versatility=1.26 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=0.57, HasteRating=0.65, Indestructible=0.01, Intellect=1.41, Leech=0.03, MasteryRating=0.04, MovementSpeed=0.01, Versatility=0.53 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=0.72, HasteRating=0.86, Indestructible=0.01, Intellect=1.80, Leech=0.03, MasteryRating=0.04, MovementSpeed=0.01, Versatility=0.69 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.24, HasteRating=1.60, Indestructible=0.01, Intellect=3.29, Leech=0.01, MasteryRating=1.26, MovementSpeed=0.02, Versatility=1.16 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=3.39, Avoidance=0.02, CritRating=1.42, HasteRating=1.22, Indestructible=0.01, Leech=0.01, MasteryRating=1.15, MaxDamage=4.79, MinDamage=4.79, MovementSpeed=0.03, Versatility=1.14 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=2.85, Avoidance=0.02, CritRating=1.00, HasteRating=1.03, Indestructible=0.01, Leech=0.01, MasteryRating=0.71, MaxDamage=2.91, MinDamage=2.91, MovementSpeed=0.03, Versatility=1.02 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=3.44, Avoidance=0.02, CritRating=1.54, HasteRating=0.76, Indestructible=0.01, Leech=0.01, MasteryRating=1.12, MaxDamage=5.13, MinDamage=5.13, MovementSpeed=0.03, Versatility=1.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.30, HasteRating=1.27, Indestructible=0.01, Intellect=3.47, Leech=0.01, MasteryRating=1.20, MovementSpeed=0.02, Versatility=1.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=3.60, Avoidance=0.02, CritRating=1.24, HasteRating=1.52, Indestructible=0.01, Leech=0.01, MasteryRating=1.32, MaxDamage=3.13, MinDamage=3.13, MovementSpeed=0.03, Versatility=1.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=0.41, HasteRating=0.77, Indestructible=0.01, Intellect=1.62, Leech=0.03, MasteryRating=0.04, MovementSpeed=0.01, Versatility=0.62 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.22, HasteRating=2.03, Indestructible=0.01, Intellect=3.36, Leech=0.01, MasteryRating=1.87, MovementSpeed=0.02, Versatility=1.14 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.33, HasteRating=1.38, Indestructible=0.01, Intellect=3.51, Leech=0.01, MasteryRating=1.27, MovementSpeed=0.02, Versatility=1.25 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=1.41, HasteRating=1.65, Indestructible=0.01, Intellect=3.69, Leech=0.01, MasteryRating=1.51, MovementSpeed=0.02, Versatility=1.28 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.86, HasteRating=1.52, Indestructible=0.01, Leech=0.01, MasteryRating=1.74, MaxDamage=3.27, MinDamage=3.27, MovementSpeed=0.03, Strength=4.14, Versatility=1.51 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.59, HasteRating=1.68, Indestructible=0.01, Leech=0.01, MasteryRating=1.70, MaxDamage=2.39, MinDamage=2.39, MovementSpeed=0.03, Strength=3.97, Versatility=1.49 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=34.68, Avoidance=2.34, CritRating=41.70, HasteRating=43.59, Indestructible=0.01, Leech=102.10, MasteryRating=52.11, MaxDamage=44.29, MinDamage=44.29, MovementSpeed=0.01, Stamina=100.31, Strength=91.82, Versatility=92.10 }
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

if not VgerCore.IsClassic then
	PawnAddPluginScaleProvider(ScaleProviderName, PawnLocal.UI.AskMrRobotProvider, PawnMrRobotScaleProvider_AddScales)
else
	-- These scales aren't useful on WoW Classic, so skip them.
	PawnMrRobotScaleProvider_AddScales = nil
end
