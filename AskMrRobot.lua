-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2021 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0416


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=49.60, Avoidance=0.02, CritRating=20.77, HasteRating=21.45, Indestructible=0.01, Leech=2.89, MasteryRating=23.25, MaxDamage=6.21, MinDamage=6.21, MovementSpeed=0.01, Stamina=63.09, Strength=56.23, Versatility=41.33 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=1.40, HasteRating=0.82, Indestructible=0.01, Leech=0.01, MasteryRating=1.23, MaxDamage=2.03, MinDamage=2.03, MovementSpeed=0.03, Strength=2.76, Versatility=0.96 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.17, HasteRating=1.34, Indestructible=0.01, Leech=0.01, MasteryRating=1.39, MaxDamage=2.27, MinDamage=2.27, MovementSpeed=0.03, Strength=3.14, Versatility=1.10 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=2.63, Avoidance=0.02, CritRating=0.87, HasteRating=0.85, Indestructible=0.01, Leech=0.01, MasteryRating=0.76, MaxDamage=2.31, MinDamage=2.31, MovementSpeed=0.03, Versatility=0.91 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=78.20, Armor=192.99, Avoidance=30.74, CritRating=36.32, HasteRating=48.72, Indestructible=0.01, Leech=3.16, MasteryRating=28.97, MaxDamage=77.87, MinDamage=77.87, MovementSpeed=0.01, Stamina=119.99, Versatility=76.74 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.06, HasteRating=1.15, Indestructible=0.01, Intellect=2.81, Leech=0.01, MasteryRating=1.18, MovementSpeed=0.02, Versatility=1.01 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=2.66, Avoidance=0.02, CritRating=1.21, HasteRating=0.91, Indestructible=0.01, Leech=0.01, MasteryRating=1.20, MaxDamage=1.97, MinDamage=1.97, MovementSpeed=0.03, Versatility=0.95 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=82.31, Armor=201.28, Avoidance=0.02, CritRating=23.85, HasteRating=34.94, Indestructible=0.01, Leech=34.26, MasteryRating=46.02, MaxDamage=32.97, MinDamage=32.97, MovementSpeed=0.01, Stamina=130.01, Versatility=56.79 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=0.92, HasteRating=1.15, Indestructible=0.01, Intellect=2.67, Leech=0.51, MasteryRating=0.87, MovementSpeed=0.01, Versatility=0.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=2.82, Avoidance=0.03, CritRating=0.96, HasteRating=1.15, Indestructible=0.01, Leech=0.01, MasteryRating=0.78, MaxDamage=1.86, MinDamage=1.86, MovementSpeed=0.02, Versatility=0.91 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=2.60, Avoidance=0.03, CritRating=1.09, HasteRating=0.93, Indestructible=0.01, Leech=0.01, MasteryRating=1.19, MaxDamage=2.54, MinDamage=2.54, MovementSpeed=0.02, Versatility=0.92 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=2.42, Avoidance=0.02, CritRating=0.85, HasteRating=1.06, Indestructible=0.01, Leech=0.01, MasteryRating=0.65, MaxDamage=1.55, MinDamage=1.55, MovementSpeed=0.03, Versatility=0.81 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.06, HasteRating=0.78, Indestructible=0.01, Intellect=2.76, Leech=0.01, MasteryRating=1.22, MovementSpeed=0.02, Versatility=0.99 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.08, HasteRating=1.03, Indestructible=0.01, Intellect=2.67, Leech=0.01, MasteryRating=0.80, MovementSpeed=0.02, Versatility=0.94 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=0.89, HasteRating=1.16, Indestructible=0.01, Intellect=2.95, Leech=0.01, MasteryRating=1.00, MovementSpeed=0.02, Versatility=1.05 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=84.63, Armor=76.10, Avoidance=0.02, CritRating=17.32, HasteRating=6.52, Indestructible=0.01, Leech=11.93, MasteryRating=36.27, MaxDamage=14.55, MinDamage=14.55, MovementSpeed=0.01, Stamina=69.94, Versatility=42.41 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=0.94, HasteRating=0.90, Indestructible=0.01, Intellect=2.54, Leech=0.41, MasteryRating=0.45, MovementSpeed=0.01, Versatility=0.93 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=2.32, Avoidance=0.02, CritRating=0.88, HasteRating=0.68, Indestructible=0.01, Leech=0.01, MasteryRating=0.81, MaxDamage=1.81, MinDamage=1.81, MovementSpeed=0.03, Stamina=0.14, Versatility=0.90 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=1.02, HasteRating=0.78, Indestructible=0.01, Intellect=3.11, Leech=0.68, MasteryRating=1.44, MovementSpeed=0.01, Versatility=1.10 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=42.73, Avoidance=5.48, CritRating=22.96, HasteRating=18.46, Indestructible=0.01, Leech=45.00, MasteryRating=51.79, MaxDamage=59.80, MinDamage=59.80, MovementSpeed=0.01, Stamina=68.56, Strength=48.67, Versatility=39.99 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=0.98, HasteRating=1.04, Indestructible=0.01, Leech=0.01, MasteryRating=0.95, MaxDamage=2.11, MinDamage=2.11, MovementSpeed=0.03, Strength=2.54, Versatility=0.96 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=0.72, HasteRating=0.16, Indestructible=0.01, Intellect=2.03, Leech=0.40, MasteryRating=0.60, MovementSpeed=0.01, Versatility=0.79 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=1.09, HasteRating=0.60, Indestructible=0.01, Intellect=3.28, Leech=0.65, MasteryRating=1.13, MovementSpeed=0.01, Versatility=1.07 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.12, HasteRating=1.31, Indestructible=0.01, Intellect=2.92, Leech=0.01, MasteryRating=1.28, MovementSpeed=0.02, Versatility=1.02 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=2.73, Avoidance=0.02, CritRating=1.04, HasteRating=1.15, Indestructible=0.01, Leech=0.01, MasteryRating=0.84, MaxDamage=4.17, MinDamage=4.17, MovementSpeed=0.03, Versatility=0.95 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=2.31, Avoidance=0.02, CritRating=0.75, HasteRating=0.79, Indestructible=0.01, Leech=0.01, MasteryRating=0.69, MaxDamage=2.23, MinDamage=2.23, MovementSpeed=0.03, Versatility=0.77 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=2.99, Avoidance=0.02, CritRating=1.07, HasteRating=0.94, Indestructible=0.01, Leech=0.01, MasteryRating=0.79, MaxDamage=4.20, MinDamage=4.20, MovementSpeed=0.03, Versatility=0.99 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.02, HasteRating=0.90, Indestructible=0.01, Intellect=2.94, Leech=0.01, MasteryRating=1.19, MovementSpeed=0.02, Versatility=1.04 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=2.62, Avoidance=0.02, CritRating=0.92, HasteRating=1.02, Indestructible=0.01, Leech=0.01, MasteryRating=0.78, MaxDamage=2.29, MinDamage=2.29, MovementSpeed=0.03, Versatility=0.90 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=1.08, HasteRating=0.38, Indestructible=0.01, Intellect=2.71, Leech=0.73, MasteryRating=1.02, MovementSpeed=0.01, Versatility=0.98 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.02, HasteRating=1.24, Indestructible=0.01, Intellect=2.78, Leech=0.01, MasteryRating=1.38, MovementSpeed=0.02, Versatility=1.00 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.06, HasteRating=1.08, Indestructible=0.01, Intellect=2.96, Leech=0.01, MasteryRating=1.04, MovementSpeed=0.02, Versatility=1.00 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=1.05, HasteRating=1.26, Indestructible=0.01, Intellect=2.84, Leech=0.01, MasteryRating=1.10, MovementSpeed=0.02, Versatility=0.95 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.30, HasteRating=1.01, Indestructible=0.01, Leech=0.01, MasteryRating=1.14, MaxDamage=2.25, MinDamage=2.25, MovementSpeed=0.03, Strength=2.84, Versatility=0.99 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.02, HasteRating=1.07, Indestructible=0.01, Leech=0.01, MasteryRating=1.10, MaxDamage=1.45, MinDamage=1.45, MovementSpeed=0.03, Strength=2.67, Versatility=0.95 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=54.48, Avoidance=18.82, CritRating=26.05, HasteRating=29.92, Indestructible=0.01, Leech=26.51, MasteryRating=39.00, MaxDamage=17.20, MinDamage=17.20, MovementSpeed=0.01, Stamina=87.38, Strength=101.76, Versatility=60.51 }
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
