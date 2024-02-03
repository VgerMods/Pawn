-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2024 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0809


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Strength=6.18, Armor=2.49, Stamina=2.07, MaxDamage=1.30, MinDamage=1.30, HasteRating=5.32, MasteryRating=4.35, CritRating=3.97, Versatility=3.55, Leech=0.81, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Strength=13.71, MaxDamage=6.63, MinDamage=6.63, CritRating=9.68, MasteryRating=7.50, HasteRating=5.88, Versatility=5.69, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Strength=8.46, MaxDamage=5.63, MinDamage=5.63, MasteryRating=6.05, HasteRating=5.75, CritRating=4.72, Versatility=3.33, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=9.21, MaxDamage=8.54, MinDamage=8.54, CritRating=7.61, HasteRating=5.71, Versatility=5.40, MasteryRating=4.99, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Armor=15.14, Agility=12.12, Stamina=4.45, MaxDamage=3.99, MinDamage=3.99, HasteRating=9.09, CritRating=8.78, Versatility=8.41, MasteryRating=6.06, Leech=1.90, Avoidance=0.98, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Intellect=8.22, CritRating=6.09, HasteRating=5.63, Versatility=4.78, MasteryRating=4.38, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=7.84, MaxDamage=6.08, MinDamage=6.08, CritRating=5.87, HasteRating=5.07, Versatility=4.59, MasteryRating=4.23, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Armor=8.26, Agility=6.53, Stamina=3.13, MaxDamage=2.05, MinDamage=2.05, HasteRating=7.06, Versatility=6.39, MasteryRating=5.68, CritRating=4.71, Avoidance=0.67, Leech=0.10, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Intellect=14.56, HasteRating=13.24, MasteryRating=7.36, CritRating=7.26, Versatility=6.62, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	3, -- Augmentation
	{ Intellect=5.16, MasteryRating=7.68, CritRating=5.41, HasteRating=5.18, Versatility=3.84, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	1, -- Devastation
	{ Intellect=12.38, CritRating=8.78, HasteRating=6.50, Versatility=6.19, MasteryRating=5.12, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	13, -- Evoker
	2, -- Preservation
	{ Intellect=26.77, MasteryRating=15.34, CritRating=14.64, Versatility=12.21, HasteRating=11.68, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=10.26, MaxDamage=4.71, MinDamage=4.71, CritRating=5.82, HasteRating=5.42, MasteryRating=4.85, Versatility=4.54, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=8.56, MaxDamage=8.18, MinDamage=8.18, HasteRating=4.80, Versatility=4.65, CritRating=4.56, MasteryRating=4.28, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=11.62, MaxDamage=8.05, MinDamage=8.05, CritRating=7.32, HasteRating=6.40, Versatility=6.16, MasteryRating=3.91, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Intellect=10.42, MasteryRating=6.32, CritRating=5.43, Versatility=5.38, HasteRating=4.22, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Intellect=7.43, HasteRating=4.33, Versatility=4.06, MasteryRating=3.11, CritRating=2.72, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Intellect=10.55, Versatility=5.68, MasteryRating=5.39, HasteRating=4.69, CritRating=4.22, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=4.75, MaxDamage=2.33, MinDamage=2.33, Stamina=1.85, Armor=1.31, Versatility=3.74, CritRating=3.32, MasteryRating=2.76, HasteRating=2.49, Avoidance=2.07, Leech=0.87, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Intellect=38.65, HasteRating=42.55, CritRating=27.58, Versatility=27.51, MasteryRating=21.28, Leech=0.82, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=9.11, MaxDamage=7.39, MinDamage=7.39, Stamina=0.04, CritRating=5.38, Versatility=5.26, HasteRating=4.22, MasteryRating=3.94, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Intellect=10.00, CritRating=6.93, HasteRating=6.04, MasteryRating=5.89, Versatility=4.03, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Strength=6.01, Stamina=2.66, Armor=2.21, MaxDamage=1.85, MinDamage=1.85, HasteRating=4.48, MasteryRating=4.32, Versatility=3.82, CritRating=2.99, Leech=1.63, Avoidance=0.69, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Strength=9.70, MaxDamage=7.64, MinDamage=7.64, HasteRating=5.96, Versatility=5.40, CritRating=5.24, MasteryRating=4.14, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Intellect=11.02, HasteRating=6.81, CritRating=6.19, Versatility=5.96, MasteryRating=3.82, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Intellect=10.72, MasteryRating=5.90, CritRating=5.71, Versatility=4.88, HasteRating=3.17, Leech=0.03, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Intellect=10.13, HasteRating=6.68, CritRating=6.45, MasteryRating=5.93, Versatility=5.52, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ MaxDamage=10.69, MinDamage=10.69, Agility=6.87, HasteRating=4.74, CritRating=4.11, Versatility=4.05, MasteryRating=2.73, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=11.07, MaxDamage=9.82, MinDamage=9.82, HasteRating=8.32, Versatility=6.59, CritRating=6.46, MasteryRating=4.16, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ MaxDamage=13.64, MinDamage=13.64, Agility=8.74, Versatility=5.07, MasteryRating=4.29, CritRating=4.09, HasteRating=4.03, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Intellect=9.88, CritRating=7.25, Versatility=5.17, HasteRating=4.97, MasteryRating=3.91, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ MaxDamage=12.10, MinDamage=12.10, Agility=10.91, HasteRating=7.16, MasteryRating=6.43, CritRating=6.06, Versatility=5.85, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Intellect=19.26, CritRating=9.67, Versatility=9.03, MasteryRating=7.57, HasteRating=6.95, Leech=0.94, Avoidance=0.02, Indestructible=0.01, MovementSpeed=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Intellect=10.84, HasteRating=6.78, CritRating=6.24, Versatility=5.89, MasteryRating=5.88, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Intellect=10.78, CritRating=5.89, Versatility=5.49, HasteRating=5.25, MasteryRating=4.96, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Intellect=13.04, HasteRating=7.57, CritRating=7.17, MasteryRating=6.70, Versatility=6.43, Avoidance=0.03, MovementSpeed=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Strength=9.08, MaxDamage=6.83, MinDamage=6.83, HasteRating=6.28, CritRating=5.83, Versatility=4.77, MasteryRating=4.06, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Strength=7.14, MaxDamage=4.64, MinDamage=4.64, HasteRating=4.70, CritRating=4.55, Versatility=4.37, MasteryRating=3.83, MovementSpeed=0.03, Avoidance=0.02, Indestructible=0.01, Leech=0.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Strength=5.65, Armor=3.41, Stamina=3.16, MaxDamage=3.04, MinDamage=3.04, HasteRating=6.96, Versatility=5.97, CritRating=5.02, MasteryRating=4.64, Leech=2.01, Avoidance=1.46, Indestructible=0.01, MovementSpeed=0.01 }
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
