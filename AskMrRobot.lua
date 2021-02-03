-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2021 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0411


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=13.03, Avoidance=7.86, CritRating=28.76, HasteRating=37.82, Indestructible=0.01, Leech=33.80, MasteryRating=44.61, MaxDamage=7.36, MinDamage=7.36, MovementSpeed=0.01, Stamina=19.19, Strength=13.48, Versatility=54.67 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=2.69, HasteRating=1.79, Indestructible=0.01, Leech=0.01, MasteryRating=3.02, MaxDamage=1.73, MinDamage=1.73, MovementSpeed=0.03, Strength=2.54, Versatility=1.91 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=2.22, HasteRating=2.63, Indestructible=0.01, Leech=0.01, MasteryRating=2.44, MaxDamage=1.69, MinDamage=1.69, MovementSpeed=0.03, Strength=2.41, Versatility=2.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=2.56, Avoidance=0.02, CritRating=1.96, HasteRating=1.92, Indestructible=0.01, Leech=0.01, MasteryRating=1.87, MaxDamage=2.30, MinDamage=2.30, MovementSpeed=0.03, Versatility=2.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=16.45, Armor=25.88, Avoidance=2.98, CritRating=24.79, HasteRating=22.83, Indestructible=0.01, Leech=60.06, MasteryRating=12.08, MaxDamage=18.96, MinDamage=18.96, MovementSpeed=0.01, Stamina=9.21, Versatility=43.18 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=2.14, HasteRating=2.58, Indestructible=0.01, Intellect=2.46, Leech=0.01, MasteryRating=2.38, MovementSpeed=0.02, Versatility=1.89 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=2.08, Avoidance=0.02, CritRating=2.23, HasteRating=2.09, Indestructible=0.01, Leech=0.01, MasteryRating=2.16, MaxDamage=1.59, MinDamage=1.59, MovementSpeed=0.03, Versatility=1.74 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=10.39, Armor=24.22, Avoidance=1.78, CritRating=24.79, HasteRating=19.77, Indestructible=0.01, Leech=46.27, MasteryRating=39.35, MaxDamage=5.28, MinDamage=5.28, MovementSpeed=0.01, Stamina=17.31, Versatility=45.75 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=2.69, HasteRating=2.04, Indestructible=0.01, Intellect=3.28, Leech=1.64, MasteryRating=3.47, MovementSpeed=0.01, Versatility=2.96 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=2.52, Avoidance=0.03, CritRating=2.18, HasteRating=2.39, Indestructible=0.01, Leech=0.01, MasteryRating=2.36, MaxDamage=1.27, MinDamage=1.27, MovementSpeed=0.02, Versatility=1.84 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=2.37, Avoidance=0.03, CritRating=2.05, HasteRating=2.24, Indestructible=0.01, Leech=0.01, MasteryRating=2.59, MaxDamage=2.29, MinDamage=2.29, MovementSpeed=0.02, Versatility=1.93 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=2.27, Avoidance=0.02, CritRating=1.91, HasteRating=2.53, Indestructible=0.01, Leech=0.01, MasteryRating=1.33, MaxDamage=1.39, MinDamage=1.39, MovementSpeed=0.03, Versatility=1.80 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=2.11, HasteRating=1.87, Indestructible=0.01, Intellect=2.28, Leech=0.01, MasteryRating=1.02, MovementSpeed=0.02, Versatility=1.85 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.88, HasteRating=2.28, Indestructible=0.01, Intellect=2.33, Leech=0.01, MasteryRating=1.98, MovementSpeed=0.02, Versatility=1.93 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=2.31, HasteRating=2.61, Indestructible=0.01, Intellect=2.69, Leech=0.01, MasteryRating=2.19, MovementSpeed=0.02, Versatility=2.20 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=11.52, Armor=11.46, Avoidance=0.02, CritRating=21.82, HasteRating=17.05, Indestructible=0.01, Leech=21.54, MasteryRating=24.89, MaxDamage=7.96, MinDamage=7.96, MovementSpeed=0.01, Stamina=8.12, Versatility=28.46 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=1.88, HasteRating=1.09, Indestructible=0.01, Intellect=2.16, Leech=1.63, MasteryRating=2.41, MovementSpeed=0.01, Versatility=1.96 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=2.36, Avoidance=0.02, CritRating=2.05, HasteRating=1.19, Indestructible=0.01, Leech=0.01, MasteryRating=2.11, MaxDamage=2.29, MinDamage=2.29, MovementSpeed=0.03, Stamina=0.20, Versatility=2.06 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=2.36, HasteRating=0.48, Indestructible=0.01, Intellect=2.75, Leech=4.42, MasteryRating=2.89, MovementSpeed=0.01, Versatility=2.61 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=5.93, Avoidance=1.22, CritRating=17.25, HasteRating=12.58, Indestructible=0.01, Leech=31.31, MasteryRating=32.02, MaxDamage=7.30, MinDamage=7.30, MovementSpeed=0.01, Stamina=6.45, Strength=8.15, Versatility=21.57 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.81, HasteRating=2.39, Indestructible=0.01, Leech=0.01, MasteryRating=2.15, MaxDamage=1.73, MinDamage=1.73, MovementSpeed=0.03, Strength=2.18, Versatility=1.78 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=2.20, HasteRating=0.27, Indestructible=0.01, Intellect=2.63, Leech=1.23, MasteryRating=2.19, MovementSpeed=0.01, Versatility=2.31 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=3.19, HasteRating=3.06, Indestructible=0.01, Intellect=3.25, Leech=1.40, MasteryRating=4.69, MovementSpeed=0.01, Versatility=3.24 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=3.02, HasteRating=3.08, Indestructible=0.01, Intellect=2.49, Leech=0.01, MasteryRating=2.31, MovementSpeed=0.02, Versatility=1.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=2.23, Avoidance=0.02, CritRating=2.82, HasteRating=3.02, Indestructible=0.01, Leech=0.01, MasteryRating=2.01, MaxDamage=3.24, MinDamage=3.24, MovementSpeed=0.03, Versatility=1.76 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=2.46, Avoidance=0.02, CritRating=2.10, HasteRating=2.33, Indestructible=0.01, Leech=0.01, MasteryRating=1.56, MaxDamage=2.20, MinDamage=2.20, MovementSpeed=0.03, Versatility=1.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=2.31, Avoidance=0.02, CritRating=2.04, HasteRating=1.50, Indestructible=0.01, Leech=0.01, MasteryRating=1.85, MaxDamage=3.00, MinDamage=3.00, MovementSpeed=0.03, Versatility=1.89 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=3.10, HasteRating=2.52, Indestructible=0.01, Intellect=2.62, Leech=0.01, MasteryRating=0.98, MovementSpeed=0.02, Versatility=2.17 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=2.50, Avoidance=0.02, CritRating=2.18, HasteRating=2.73, Indestructible=0.01, Leech=0.01, MasteryRating=2.57, MaxDamage=1.94, MinDamage=1.94, MovementSpeed=0.03, Versatility=1.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=3.67, HasteRating=1.11, Indestructible=0.01, Intellect=3.37, Leech=3.58, MasteryRating=4.16, MovementSpeed=0.01, Versatility=3.13 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.78, HasteRating=2.77, Indestructible=0.01, Intellect=1.88, Leech=0.01, MasteryRating=2.68, MovementSpeed=0.02, Versatility=1.64 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=2.19, HasteRating=2.15, Indestructible=0.01, Intellect=2.40, Leech=0.01, MasteryRating=2.02, MovementSpeed=0.02, Versatility=1.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=2.27, HasteRating=2.97, Indestructible=0.01, Intellect=2.57, Leech=0.01, MasteryRating=2.40, MovementSpeed=0.02, Versatility=2.08 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=2.61, HasteRating=2.60, Indestructible=0.01, Leech=0.01, MasteryRating=2.93, MaxDamage=1.97, MinDamage=1.97, MovementSpeed=0.03, Strength=2.50, Versatility=2.13 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=2.16, HasteRating=2.69, Indestructible=0.01, Leech=0.01, MasteryRating=2.48, MaxDamage=1.27, MinDamage=1.27, MovementSpeed=0.03, Strength=2.34, Versatility=1.96 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=5.00, Avoidance=0.87, CritRating=8.91, HasteRating=10.24, Indestructible=0.01, Leech=26.77, MasteryRating=18.00, MaxDamage=8.00, MinDamage=8.00, MovementSpeed=0.01, Stamina=11.39, Strength=16.91, Versatility=30.01 }
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
