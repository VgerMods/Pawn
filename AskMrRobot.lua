-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2020 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Ask Mr. Robot scales
------------------------------------------------------------

local ScaleProviderName = "MrRobot"

PawnMrRobotLastUpdatedVersion = 2.0245


function PawnMrRobotScaleProvider_AddScales()


PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	1, -- Blood
	{ Armor=28.19, Avoidance=15.08, CritRating=29.85, HasteRating=24.80, Indestructible=0.01, Leech=11.40, MasteryRating=27.44, MaxDamage=0.01, MinDamage=0.01, MovementSpeed=0.01, Stamina=25.61, Strength=19.44, Versatility=51.16 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	2, -- Frost
	{ Avoidance=0.02, CritRating=1.69, HasteRating=1.35, Indestructible=0.01, Leech=0.01, MasteryRating=1.85, MaxDamage=1.18, MinDamage=1.18, MovementSpeed=0.03, Strength=1.87, Versatility=1.46 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	6, -- Death Knight
	3, -- Unholy
	{ Avoidance=0.02, CritRating=1.67, HasteRating=1.75, Indestructible=0.01, Leech=0.01, MasteryRating=1.40, MaxDamage=1.30, MinDamage=1.30, MovementSpeed=0.03, Strength=1.82, Versatility=1.49 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	1, -- Havoc
	{ Agility=1.82, Avoidance=0.02, CritRating=1.49, HasteRating=1.70, Indestructible=0.01, Leech=0.01, MasteryRating=1.05, MaxDamage=1.62, MinDamage=1.62, MovementSpeed=0.03, Versatility=1.47 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	12, -- Demon Hunter
	2, -- Vengeance
	{ Agility=9.90, Armor=46.73, Avoidance=0.02, CritRating=21.90, HasteRating=23.62, Indestructible=0.01, Leech=18.11, MasteryRating=4.11, MaxDamage=0.02, MinDamage=0.02, MovementSpeed=0.01, Stamina=17.20, Versatility=35.21 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	1, -- Balance
	{ Avoidance=0.03, CritRating=1.79, HasteRating=2.20, Indestructible=0.01, Intellect=1.97, Leech=0.01, MasteryRating=2.14, MovementSpeed=0.02, Versatility=1.62 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	2, -- Feral
	{ Agility=1.89, Avoidance=0.02, CritRating=2.15, HasteRating=1.67, Indestructible=0.01, Leech=0.01, MasteryRating=1.91, MaxDamage=1.47, MinDamage=1.47, MovementSpeed=0.03, Versatility=1.60 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	3, -- Guardian
	{ Agility=7.85, Armor=27.72, Avoidance=5.96, CritRating=14.08, HasteRating=11.49, Indestructible=0.01, Leech=9.52, MasteryRating=17.48, MaxDamage=4.71, MinDamage=4.71, MovementSpeed=0.01, Stamina=9.83, Versatility=18.72 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	11, -- Druid
	4, -- Restoration
	{ Avoidance=0.02, CritRating=3.18, HasteRating=3.42, Indestructible=0.01, Intellect=3.45, Leech=4.31, MasteryRating=3.62, MovementSpeed=0.01, Versatility=3.44 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	1, -- Beast Mastery
	{ Agility=1.95, Avoidance=0.03, CritRating=1.58, HasteRating=1.62, Indestructible=0.01, Leech=0.01, MasteryRating=1.64, MaxDamage=1.06, MinDamage=1.06, MovementSpeed=0.02, Versatility=1.48 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	2, -- Marksmanship
	{ Agility=1.80, Avoidance=0.03, CritRating=1.53, HasteRating=1.67, Indestructible=0.01, Leech=0.01, MasteryRating=1.82, MaxDamage=1.71, MinDamage=1.71, MovementSpeed=0.02, Versatility=1.41 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	3, -- Hunter
	3, -- Survival
	{ Agility=1.89, Avoidance=0.02, CritRating=1.63, HasteRating=2.09, Indestructible=0.01, Leech=0.01, MasteryRating=1.33, MaxDamage=1.15, MinDamage=1.15, MovementSpeed=0.03, Versatility=1.53 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	1, -- Arcane
	{ Avoidance=0.03, CritRating=1.76, HasteRating=1.68, Indestructible=0.01, Intellect=1.91, Leech=0.01, MasteryRating=1.45, MovementSpeed=0.02, Versatility=1.58 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	2, -- Fire
	{ Avoidance=0.03, CritRating=1.68, HasteRating=1.71, Indestructible=0.01, Intellect=1.80, Leech=0.01, MasteryRating=1.50, MovementSpeed=0.02, Versatility=1.45 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	8, -- Mage
	3, -- Frost
	{ Avoidance=0.03, CritRating=1.49, HasteRating=1.69, Indestructible=0.01, Intellect=1.76, Leech=0.01, MasteryRating=1.77, MovementSpeed=0.02, Versatility=1.48 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	1, -- Brewmaster
	{ Agility=14.18, Armor=28.67, Avoidance=9.05, CritRating=3.38, HasteRating=11.36, Indestructible=0.01, Leech=12.35, MasteryRating=27.22, MaxDamage=10.07, MinDamage=10.07, MovementSpeed=0.01, Stamina=12.64, Versatility=14.85 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	2, -- Mistweaver
	{ Avoidance=0.02, CritRating=2.79, HasteRating=0.03, Indestructible=0.01, Intellect=3.11, Leech=3.42, MasteryRating=2.30, MovementSpeed=0.01, Versatility=2.97 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	10, -- Monk
	3, -- Windwalker
	{ Agility=1.55, Avoidance=0.02, CritRating=1.38, HasteRating=1.05, Indestructible=0.01, Leech=0.01, MasteryRating=1.32, MaxDamage=1.41, MinDamage=1.41, MovementSpeed=0.03, Stamina=0.21, Versatility=1.47 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	1, -- Holy
	{ Avoidance=0.02, CritRating=1.91, HasteRating=0.19, Indestructible=0.01, Intellect=2.36, Leech=1.40, MasteryRating=2.68, MovementSpeed=0.01, Versatility=2.06 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	2, -- Protection
	{ Armor=17.06, Avoidance=5.51, CritRating=13.12, HasteRating=7.56, Indestructible=0.01, Leech=10.00, MasteryRating=27.19, MaxDamage=11.70, MinDamage=11.70, MovementSpeed=0.01, Stamina=13.28, Strength=7.54, Versatility=19.08 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	2, -- Paladin
	3, -- Retribution
	{ Avoidance=0.02, CritRating=1.53, HasteRating=1.77, Indestructible=0.01, Leech=0.01, MasteryRating=1.60, MaxDamage=1.39, MinDamage=1.39, MovementSpeed=0.03, Strength=1.79, Versatility=1.50 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	1, -- Discipline
	{ Avoidance=0.02, CritRating=2.16, HasteRating=2.71, Indestructible=0.01, Intellect=2.52, Leech=1.30, MasteryRating=1.72, MovementSpeed=0.01, Versatility=2.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	2, -- Holy
	{ Avoidance=0.02, CritRating=3.10, HasteRating=0.26, Indestructible=0.01, Intellect=3.52, Leech=3.48, MasteryRating=3.94, MovementSpeed=0.01, Versatility=3.19 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	5, -- Priest
	3, -- Shadow
	{ Avoidance=0.03, CritRating=1.79, HasteRating=2.16, Indestructible=0.01, Intellect=1.81, Leech=0.01, MasteryRating=1.66, MovementSpeed=0.02, Versatility=1.48 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	1, -- Assassination
	{ Agility=1.76, Avoidance=0.02, CritRating=1.75, HasteRating=1.81, Indestructible=0.01, Leech=0.01, MasteryRating=1.65, MaxDamage=2.45, MinDamage=2.45, MovementSpeed=0.03, Versatility=1.42 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	2, -- Outlaw
	{ Agility=1.75, Avoidance=0.02, CritRating=1.51, HasteRating=1.47, Indestructible=0.01, Leech=0.01, MasteryRating=1.41, MaxDamage=1.63, MinDamage=1.63, MovementSpeed=0.03, Versatility=1.39 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	4, -- Rogue
	3, -- Subtlety
	{ Agility=1.79, Avoidance=0.02, CritRating=1.57, HasteRating=1.35, Indestructible=0.01, Leech=0.01, MasteryRating=1.41, MaxDamage=2.53, MinDamage=2.53, MovementSpeed=0.03, Versatility=1.43 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	1, -- Elemental
	{ Avoidance=0.03, CritRating=1.68, HasteRating=1.69, Indestructible=0.01, Intellect=1.80, Leech=0.01, MasteryRating=1.09, MovementSpeed=0.02, Versatility=1.50 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	2, -- Enhancement
	{ Agility=1.86, Avoidance=0.02, CritRating=1.66, HasteRating=2.00, Indestructible=0.01, Leech=0.01, MasteryRating=1.51, MaxDamage=1.46, MinDamage=1.46, MovementSpeed=0.03, Versatility=1.49 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	7, -- Shaman
	3, -- Restoration
	{ Avoidance=0.02, CritRating=4.28, HasteRating=0.50, Indestructible=0.01, Intellect=3.18, Leech=3.88, MasteryRating=3.27, MovementSpeed=0.01, Versatility=2.96 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	1, -- Affliction
	{ Avoidance=0.03, CritRating=1.53, HasteRating=1.79, Indestructible=0.01, Intellect=1.70, Leech=0.01, MasteryRating=1.82, MovementSpeed=0.02, Versatility=1.34 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	2, -- Demonology
	{ Avoidance=0.03, CritRating=1.83, HasteRating=2.06, Indestructible=0.01, Intellect=2.03, Leech=0.01, MasteryRating=2.00, MovementSpeed=0.02, Versatility=1.68 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	9, -- Warlock
	3, -- Destruction
	{ Avoidance=0.03, CritRating=1.73, HasteRating=1.92, Indestructible=0.01, Intellect=1.86, Leech=0.01, MasteryRating=1.80, MovementSpeed=0.02, Versatility=1.52 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	1, -- Arms
	{ Avoidance=0.02, CritRating=1.74, HasteRating=1.71, Indestructible=0.01, Leech=0.01, MasteryRating=1.40, MaxDamage=1.35, MinDamage=1.35, MovementSpeed=0.03, Strength=1.68, Versatility=1.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	2, -- Fury
	{ Avoidance=0.02, CritRating=1.53, HasteRating=1.89, Indestructible=0.01, Leech=0.01, MasteryRating=1.62, MaxDamage=0.86, MinDamage=0.86, MovementSpeed=0.03, Strength=1.61, Versatility=1.37 }
)

PawnAddPluginScaleFromTemplate(
	ScaleProviderName,
	1, -- Warrior
	3, -- Protection
	{ Armor=17.04, Avoidance=7.36, CritRating=13.47, HasteRating=15.18, Indestructible=0.01, Leech=11.24, MasteryRating=20.61, MaxDamage=2.74, MinDamage=2.74, MovementSpeed=0.01, Stamina=15.24, Strength=19.32, Versatility=26.25 }
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
