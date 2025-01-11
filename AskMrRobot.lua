-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2025 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.1003


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Strength=8.37, Armor=3.36, Stamina=2.42, MaxDamage=0.93, MinDamage=0.93, HasteRating=8.80, MasteryRating=6.59, CritRating=6.34, Versatility=5.87, Leech=1.24, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Strength=15.42, MaxDamage=5.75, MinDamage=5.75, CritRating=15.54, MasteryRating=11.26, HasteRating=8.99, Versatility=8.78, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Strength=9.88, MaxDamage=6.39, MinDamage=6.39, MasteryRating=9.59, HasteRating=9.03, CritRating=7.38, Versatility=5.07, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ MaxDamage=11.19, MinDamage=11.19, Agility=10.38, CritRating=11.69, HasteRating=9.10, Versatility=8.47, MasteryRating=7.16, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Armor=20.96, Agility=16.69, MaxDamage=7.46, MinDamage=7.46, Stamina=5.22, HasteRating=15.47, CritRating=15.36, Versatility=14.51, MasteryRating=10.31, Leech=3.71, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Intellect=10.66, CritRating=10.26, MasteryRating=9.81, HasteRating=9.50, Versatility=7.85, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=9.08, MaxDamage=7.09, MinDamage=7.09, CritRating=9.06, HasteRating=7.92, Versatility=7.57, MasteryRating=5.98, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Armor=10.51, Agility=7.26, Stamina=3.24, MaxDamage=2.02, MinDamage=2.02, HasteRating=10.47, Versatility=9.53, MasteryRating=7.55, CritRating=6.98, Leech=1.53, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Intellect=17.41, HasteRating=21.74, MasteryRating=12.92, CritRating=11.81, Versatility=10.90, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	3, -- Augmentation
	{ Intellect=5.54, MasteryRating=11.85, CritRating=8.31, HasteRating=7.67, Versatility=5.92, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	1, -- Devastation
	{ Intellect=14.08, CritRating=13.39, Versatility=9.71, HasteRating=9.48, MasteryRating=7.83, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	2, -- Preservation
	{ Intellect=28.89, MasteryRating=21.91, CritRating=20.47, Versatility=18.02, HasteRating=14.96, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=11.32, MaxDamage=5.51, MinDamage=5.51, CritRating=8.62, HasteRating=7.26, MasteryRating=6.84, Versatility=6.45, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=9.52, MaxDamage=9.48, MinDamage=9.48, Versatility=7.26, CritRating=7.14, HasteRating=6.53, MasteryRating=5.94, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=13.75, MaxDamage=9.79, MinDamage=9.79, CritRating=11.13, HasteRating=10.29, Versatility=9.65, MasteryRating=5.56, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Intellect=11.43, MasteryRating=8.76, Versatility=8.06, CritRating=7.91, HasteRating=5.98, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Intellect=7.99, HasteRating=6.18, Versatility=6.11, MasteryRating=4.55, CritRating=3.56, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Intellect=12.14, Versatility=8.42, MasteryRating=7.58, HasteRating=7.19, CritRating=5.70, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=5.29, MaxDamage=2.47, MinDamage=2.47, Stamina=1.98, Armor=1.55, Versatility=6.13, CritRating=5.25, MasteryRating=4.29, HasteRating=4.09, Avoidance=3.45, Leech=0.45, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Intellect=42.61, HasteRating=58.60, CritRating=38.24, Versatility=38.00, MasteryRating=29.30, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=10.70, MaxDamage=8.43, MinDamage=8.43, Stamina=0.04, CritRating=8.57, Versatility=8.35, MasteryRating=5.80, HasteRating=5.64, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Intellect=10.80, CritRating=10.43, HasteRating=9.28, MasteryRating=8.40, Versatility=5.22, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Strength=7.96, Stamina=3.06, Armor=2.95, MaxDamage=1.68, MinDamage=1.68, HasteRating=7.92, MasteryRating=7.40, Versatility=6.42, CritRating=5.28, Leech=3.15, Avoidance=2.13, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Strength=11.38, MaxDamage=8.71, MinDamage=8.71, HasteRating=9.13, Versatility=8.30, CritRating=8.14, MasteryRating=5.99, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Intellect=12.31, HasteRating=10.92, CritRating=10.05, Versatility=9.20, MasteryRating=5.46, Leech=1.00, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Intellect=4.24, MasteryRating=5.13, CritRating=4.73, Versatility=4.34, HasteRating=2.56, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Intellect=11.82, HasteRating=9.78, CritRating=9.74, MasteryRating=8.77, Versatility=8.36, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ MaxDamage=11.26, MinDamage=11.26, Agility=7.43, HasteRating=6.97, CritRating=6.17, Versatility=5.89, MasteryRating=3.59, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=12.00, MaxDamage=10.46, MinDamage=10.46, HasteRating=12.74, Versatility=10.08, CritRating=9.97, MasteryRating=6.37, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ MaxDamage=14.68, MinDamage=14.68, Agility=9.24, Versatility=7.28, CritRating=5.97, HasteRating=5.48, MasteryRating=5.16, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Intellect=11.42, CritRating=11.37, Versatility=8.40, HasteRating=7.74, MasteryRating=5.82, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ MaxDamage=14.91, MinDamage=14.91, Agility=14.14, HasteRating=11.67, CritRating=10.24, MasteryRating=10.19, Versatility=9.31, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Intellect=22.52, CritRating=15.90, Versatility=14.58, MasteryRating=10.54, HasteRating=10.05, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Intellect=12.15, HasteRating=9.51, CritRating=8.26, MasteryRating=7.95, Versatility=7.89, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Intellect=12.08, CritRating=8.55, Versatility=8.12, HasteRating=7.36, MasteryRating=6.89, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Intellect=14.60, CritRating=10.19, HasteRating=10.18, Versatility=9.24, MasteryRating=9.11, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Strength=10.17, MaxDamage=7.31, MinDamage=7.31, HasteRating=9.76, CritRating=8.78, Versatility=7.17, MasteryRating=5.51, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Strength=7.73, MaxDamage=5.04, MinDamage=5.04, HasteRating=7.04, CritRating=6.89, Versatility=6.15, MasteryRating=5.09, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Strength=7.69, Armor=5.06, Stamina=3.75, MaxDamage=3.66, MinDamage=3.66, HasteRating=11.19, Versatility=9.22, CritRating=8.05, MasteryRating=7.46, Leech=2.18, Avoidance=0.97, Indestructible=0.01, MovementSpeed=0.01 }
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
