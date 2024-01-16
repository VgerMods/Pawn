-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2024 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0805


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Strength=7.13, Armor=2.78, Stamina=2.24, MaxDamage=1.33, MinDamage=1.33, HasteRating=5.27, MasteryRating=4.40, CritRating=4.12, Versatility=3.51, Leech=0.78, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Strength=19.02, MaxDamage=8.50, MinDamage=8.50, CritRating=10.72, HasteRating=9.31, MasteryRating=8.31, Versatility=6.57, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Strength=10.89, MaxDamage=7.22, MinDamage=7.22, HasteRating=7.08, MasteryRating=6.00, CritRating=4.74, Versatility=3.65, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=13.38, MaxDamage=12.19, MinDamage=12.19, CritRating=9.21, HasteRating=7.91, Versatility=6.37, MasteryRating=5.87, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Armor=17.61, Agility=15.59, Stamina=5.19, MaxDamage=4.86, MinDamage=4.86, HasteRating=10.64, CritRating=9.22, Versatility=8.81, MasteryRating=7.09, Leech=1.50, Avoidance=1.20, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Intellect=11.38, HasteRating=7.88, CritRating=6.16, MasteryRating=5.14, Versatility=4.96, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=10.88, MaxDamage=8.85, MinDamage=8.85, HasteRating=6.63, CritRating=6.44, Versatility=5.03, MasteryRating=4.72, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Armor=10.33, Agility=7.96, Stamina=3.72, MaxDamage=1.91, MinDamage=1.91, HasteRating=6.46, Versatility=6.05, MasteryRating=5.00, CritRating=4.31, Leech=1.32, Avoidance=0.30, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Intellect=19.64, HasteRating=19.98, MasteryRating=10.86, CritRating=10.06, Versatility=9.99, Leech=0.27, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	3, -- Augmentation
	{ Intellect=6.23, MasteryRating=9.11, HasteRating=7.56, CritRating=6.32, Versatility=4.56, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	1, -- Devastation
	{ Intellect=15.48, CritRating=8.78, HasteRating=8.46, Versatility=6.27, MasteryRating=5.44, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	2, -- Preservation
	{ Intellect=32.84, MasteryRating=21.12, CritRating=16.42, Versatility=12.84, HasteRating=12.02, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=14.56, MaxDamage=6.30, MinDamage=6.30, HasteRating=8.21, CritRating=6.64, MasteryRating=5.61, Versatility=5.09, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=11.53, MaxDamage=11.19, MinDamage=11.19, HasteRating=5.96, Versatility=4.88, MasteryRating=4.86, CritRating=4.61, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=15.23, MaxDamage=10.71, MinDamage=10.71, HasteRating=8.13, CritRating=7.77, Versatility=6.34, MasteryRating=4.51, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Intellect=13.19, MasteryRating=6.85, CritRating=5.24, Versatility=5.18, HasteRating=3.88, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Intellect=8.44, HasteRating=5.09, Versatility=3.44, MasteryRating=2.73, CritRating=2.54, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Intellect=12.76, HasteRating=6.38, Versatility=6.10, MasteryRating=6.07, CritRating=3.19, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=5.72, MaxDamage=2.81, MinDamage=2.81, Stamina=2.01, Armor=1.36, Versatility=3.95, CritRating=3.24, MasteryRating=2.68, HasteRating=2.63, Avoidance=2.31, Leech=0.95, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Intellect=48.85, HasteRating=56.31, CritRating=34.30, Versatility=33.60, MasteryRating=28.16, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=9.30, MaxDamage=7.28, MinDamage=7.28, Stamina=0.04, Versatility=4.65, CritRating=4.49, MasteryRating=3.77, HasteRating=2.33, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Intellect=13.14, CritRating=7.35, HasteRating=6.82, MasteryRating=5.39, Versatility=4.17, Leech=0.24, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Strength=7.50, Stamina=3.14, Armor=2.58, MaxDamage=2.11, MinDamage=2.11, HasteRating=4.71, MasteryRating=4.48, Versatility=3.66, CritRating=3.14, Leech=2.07, Avoidance=0.32, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Strength=11.83, MaxDamage=8.92, MinDamage=8.92, HasteRating=6.94, Versatility=5.14, CritRating=5.05, MasteryRating=4.25, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Intellect=14.39, HasteRating=9.04, CritRating=6.20, Versatility=5.99, MasteryRating=4.52, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Intellect=13.22, MasteryRating=6.61, CritRating=6.27, Versatility=5.73, HasteRating=3.78, Leech=0.30, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Intellect=13.17, HasteRating=7.53, MasteryRating=6.28, CritRating=6.13, Versatility=5.39, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ MaxDamage=14.70, MinDamage=14.70, Agility=9.45, HasteRating=6.15, CritRating=4.41, Versatility=4.22, MasteryRating=3.08, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=14.45, MaxDamage=13.18, MinDamage=13.18, HasteRating=10.07, Versatility=7.06, CritRating=6.94, MasteryRating=5.04, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ MaxDamage=18.23, MinDamage=18.23, Agility=11.47, Versatility=5.74, HasteRating=5.14, MasteryRating=4.88, CritRating=3.96, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Intellect=13.78, CritRating=7.40, HasteRating=7.12, Versatility=5.41, MasteryRating=4.41, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ MaxDamage=18.29, MinDamage=18.29, Agility=17.08, HasteRating=11.19, MasteryRating=10.91, Versatility=6.48, CritRating=6.15, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Intellect=25.01, CritRating=12.50, Versatility=12.08, MasteryRating=10.40, HasteRating=7.84, Leech=0.22, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Intellect=13.91, HasteRating=8.25, MasteryRating=6.11, Versatility=5.93, CritRating=5.86, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Intellect=15.01, HasteRating=7.50, CritRating=6.34, Versatility=6.28, MasteryRating=5.34, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Intellect=16.30, HasteRating=9.49, MasteryRating=7.14, CritRating=6.78, Versatility=6.53, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Strength=12.32, MaxDamage=8.72, MinDamage=8.72, HasteRating=8.18, CritRating=5.98, Versatility=5.04, MasteryRating=4.59, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Strength=9.44, MaxDamage=5.66, MinDamage=5.66, HasteRating=5.75, CritRating=4.58, Versatility=4.44, MasteryRating=4.16, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Strength=6.92, Armor=3.85, MaxDamage=3.62, MinDamage=3.62, Stamina=3.38, HasteRating=6.56, Versatility=5.92, CritRating=4.67, MasteryRating=4.37, Leech=2.70, Avoidance=1.49, Indestructible=0.01, MovementSpeed=0.01 }
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
