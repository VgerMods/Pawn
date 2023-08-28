-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2023 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
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
	{ Strength=5.94, Armor=2.40, Stamina=2.14, MaxDamage=1.18, MinDamage=1.18, HasteRating=4.32, MasteryRating=3.38, CritRating=3.13, Versatility=2.88, Leech=0.35, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Strength=12.21, MaxDamage=5.00, MinDamage=5.00, CritRating=8.18, MasteryRating=6.13, HasteRating=4.80, Versatility=4.48, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Strength=5.89, MaxDamage=3.90, MinDamage=3.90, MasteryRating=3.80, HasteRating=2.82, CritRating=2.80, Versatility=2.02, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=7.03, MaxDamage=6.54, MinDamage=6.54, CritRating=4.15, HasteRating=3.38, Versatility=3.04, MasteryRating=3.01, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Armor=9.37, Agility=6.30, Stamina=3.14, MaxDamage=1.77, MinDamage=1.77, HasteRating=4.26, CritRating=4.15, Versatility=3.97, MasteryRating=2.84, Avoidance=0.59, Leech=0.46, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Intellect=7.96, CritRating=4.39, MasteryRating=4.21, HasteRating=4.02, Versatility=3.29, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=7.49, MaxDamage=5.87, MinDamage=5.87, CritRating=4.46, HasteRating=4.17, MasteryRating=3.66, Versatility=3.49, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Armor=7.42, Agility=5.78, Stamina=3.02, MaxDamage=1.36, MinDamage=1.36, HasteRating=5.37, Versatility=4.67, MasteryRating=4.24, CritRating=3.58, Leech=0.98, Avoidance=0.08, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Intellect=11.51, HasteRating=9.86, MasteryRating=6.26, CritRating=6.06, Versatility=4.93, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

if VgerCore.EvokersExist then


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	3, -- Augmentation
	{ Intellect=5.08, MasteryRating=4.53, CritRating=3.81, HasteRating=3.60, Versatility=2.43, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	1, -- Devastation
	{ Intellect=11.50, CritRating=6.61, MasteryRating=5.43, Versatility=4.38, HasteRating=4.11, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	2, -- Preservation
	{ Intellect=25.50, MasteryRating=13.90, CritRating=10.60, Versatility=10.45, HasteRating=8.40, Leech=0.12, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

end

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=8.85, MaxDamage=3.96, MinDamage=3.96, CritRating=4.42, HasteRating=4.02, MasteryRating=3.81, Versatility=3.26, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=7.49, MaxDamage=7.20, MinDamage=7.20, CritRating=3.74, Versatility=3.51, MasteryRating=3.32, HasteRating=2.90, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=7.92, MaxDamage=4.88, MinDamage=4.88, CritRating=3.96, HasteRating=3.95, Versatility=3.53, MasteryRating=2.69, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Intellect=8.52, MasteryRating=4.26, Versatility=3.75, CritRating=3.71, HasteRating=2.74, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Intellect=6.44, HasteRating=3.22, Versatility=2.96, MasteryRating=2.12, CritRating=1.74, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Intellect=9.09, MasteryRating=4.54, Versatility=4.18, HasteRating=3.00, CritRating=2.94, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=4.68, MaxDamage=3.08, MinDamage=3.08, Stamina=1.85, Armor=1.24, Versatility=2.66, CritRating=2.24, MasteryRating=2.06, HasteRating=1.77, Avoidance=1.38, Leech=0.56, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Intellect=37.05, HasteRating=27.96, CritRating=23.61, Versatility=19.36, MasteryRating=13.98, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=6.32, MaxDamage=4.80, MinDamage=4.80, Stamina=0.04, Versatility=3.16, CritRating=3.06, MasteryRating=2.53, HasteRating=1.58, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Intellect=10.32, CritRating=6.76, HasteRating=5.94, MasteryRating=5.04, Versatility=3.38, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Strength=5.55, Stamina=3.09, Armor=2.30, MaxDamage=1.52, MinDamage=1.52, HasteRating=3.54, MasteryRating=3.53, Versatility=2.93, CritRating=2.36, Leech=0.36, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Strength=8.59, MaxDamage=6.42, MinDamage=6.42, HasteRating=4.30, Versatility=4.07, CritRating=3.92, MasteryRating=3.10, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Intellect=15.10, HasteRating=9.44, CritRating=8.16, Versatility=7.13, MasteryRating=5.17, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Intellect=10.52, MasteryRating=5.26, CritRating=5.21, Versatility=5.07, HasteRating=3.35, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Intellect=8.42, HasteRating=5.10, MasteryRating=4.74, CritRating=4.22, Versatility=3.61, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ MaxDamage=11.90, MinDamage=11.90, Agility=8.12, HasteRating=4.06, CritRating=3.98, Versatility=3.43, MasteryRating=2.72, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=6.12, MaxDamage=6.11, MinDamage=6.11, Versatility=3.06, CritRating=2.98, MasteryRating=1.64, HasteRating=1.55, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ MaxDamage=13.08, MinDamage=13.08, Agility=8.80, CritRating=4.40, Versatility=4.11, MasteryRating=4.09, HasteRating=2.20, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Intellect=9.58, CritRating=5.04, Versatility=3.68, HasteRating=3.40, MasteryRating=3.07, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ MaxDamage=11.14, MinDamage=11.14, Agility=9.59, MasteryRating=5.90, HasteRating=5.04, CritRating=4.22, Versatility=3.78, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Intellect=17.45, CritRating=8.72, Versatility=8.43, MasteryRating=5.32, HasteRating=5.26, Leech=0.55, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Intellect=9.28, HasteRating=4.77, MasteryRating=4.57, CritRating=4.17, Versatility=3.78, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Intellect=8.37, HasteRating=4.42, CritRating=3.67, Versatility=3.56, MasteryRating=3.15, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Intellect=11.16, MasteryRating=5.91, HasteRating=5.21, CritRating=4.76, Versatility=4.48, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Strength=7.30, MaxDamage=5.22, MinDamage=5.22, CritRating=3.96, HasteRating=3.90, Versatility=3.10, MasteryRating=2.83, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Strength=6.47, MaxDamage=3.38, MinDamage=3.38, HasteRating=3.37, MasteryRating=3.26, Versatility=3.07, CritRating=3.03, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Strength=5.23, Armor=3.52, Stamina=3.33, MaxDamage=2.17, MinDamage=2.17, HasteRating=6.22, Versatility=4.66, CritRating=4.41, MasteryRating=4.15, Leech=1.60, Avoidance=0.50, Indestructible=0.01, MovementSpeed=0.01 }
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
