-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Gem information (Burning Crusade Classic)
------------------------------------------------------------


if VgerCore.IsBurningCrusade then


--========================================
-- Colored level 60 common-quality vendor gems
--========================================
local PawnGemData60Common =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 28458, R = true, Stats = { Strength = 4 } }, -- Bold Tourmaline
{ ID = 28459, R = true, Stats = { Agility = 4 } }, -- Delicate Tourmaline
{ ID = 28460, R = true, Stats = { Healing = 9, SpellDamage = 3 } }, -- Teardrop Tourmaline
{ ID = 28461, R = true, Stats = { SpellDamage = 5 } }, -- Runed Tourmaline
{ ID = 28462, R = true, Stats = { Ap = 8 } }, -- Bright Tourmaline


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 28466, Y = true, Stats = { Intellect = 4 } }, -- Brilliant Amber
{ ID = 28467, Y = true, Stats = { CritRating = 4 } }, -- Smooth Amber
{ ID = 28468, Y = true, Stats = { HitRating = 4 } }, -- Rigid Amber
{ ID = 28469, Y = true, Stats = { SpellCritRating = 4 } }, -- Gleaming Amber
{ ID = 28470, Y = true, Stats = { DefenseRating = 4 } }, -- Thick Amber


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 28463, B = true, Stats = { Stamina = 6 } }, -- Solid Zircon
{ ID = 28464, B = true, Stats = { Spirit = 4 } }, -- Sparkling Zircon
{ ID = 28465, B = true, Stats = { Mp5 = 1 } }, -- Lustrous Zircon


}


--========================================
-- Colored level 70 uncommon-quality gems
--========================================
local PawnGemData70Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 23094, R = true, Stats = { Healing = 13, SpellDamage = 5 } }, -- Teardrop Blood Garnet
{ ID = 23095, R = true, Stats = { Strength = 6 } }, -- Bold Blood Garnet
{ ID = 23096, R = true, Stats = { SpellDamage = 7 } }, -- Runed Blood Garnet
{ ID = 23097, R = true, Stats = { Agility = 6 } }, -- Delicate Blood Garnet
{ ID = 28595, R = true, Stats = { Ap = 12 } }, -- Bright Blood Garnet


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 23098, R = true, Y = true, Stats = { CritRating = 3, Strength = 3 } }, -- Inscribed Flame Spessarite
{ ID = 23099, R = true, Y = true, Stats = { Healing = 7, SpellDamage = 3, Intellect = 3 } }, -- Luminous Flame Spessarite
{ ID = 23100, R = true, Y = true, Stats = { HitRating = 3, Agility = 3 } }, -- Glinting Flame Spessarite
{ ID = 23101, R = true, Y = true, Stats = { SpellCritRating = 3, SpellDamage = 4 } }, -- Potent Flame Spessarite
{ ID = 31866, R = true, Y = true, Stats = { SpellHitRating = 3, SpellDamage = 4 } }, -- Veiled Flame Spessarite
{ ID = 31869, R = true, Y = true, Stats = { CritRating = 3, Ap = 6 } }, -- Wicked Flame Spessarite


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 23113, Y = true, Stats = { Intellect = 6 } }, -- Brilliant Golden Draenite
{ ID = 23114, Y = true, Stats = { SpellCritRating = 6 } }, -- Gleaming Golden Draenite
{ ID = 23115, Y = true, Stats = { DefenseRating = 6 } }, -- Thick Golden Draenite
{ ID = 23116, Y = true, Stats = { HitRating = 6 } }, -- Rigid Golden Draenite
{ ID = 28290, Y = true, Stats = { CritRating = 6 } }, -- Smooth Golden Draenite
{ ID = 31860, Y = true, Stats = { SpellHitRating = 6 } }, -- Great Golden Draenite


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 23103, Y = true, B = true, Stats = { SpellCritRating = 3, SpellPenetration = 4 } }, -- Radiant Deep Peridot
{ ID = 23104, Y = true, B = true, Stats = { CritRating = 3, Stamina = 4 } }, -- Jagged Deep Peridot
{ ID = 23105, Y = true, B = true, Stats = { DefenseRating = 3, Stamina = 4 } }, -- Enduring Deep Peridot
{ ID = 23106, Y = true, B = true, Stats = { Mp5 = 1, Intellect = 3 } }, -- Dazzling Deep Peridot


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 23118, B = true, Stats = { Stamina = 9 } }, -- Solid Azure Moonstone
{ ID = 23119, B = true, Stats = { Spirit = 6 } }, -- Sparkling Azure Moonstone
{ ID = 23120, B = true, Stats = { SpellPenetration = 6 } }, -- Stormy Azure Moonstone
{ ID = 23121, B = true, Stats = { Mp5 = 2 } }, -- Lustrous Azure Moonstone


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 23100, R = true, B = true, Stats = { Strength = 3, Stamina = 4 } }, -- Sovereign Shadow Draenite
{ ID = 23108, R = true, B = true, Stats = { SpellDamage = 4, Stamina = 4 } }, -- Glowing Shadow Draenite
{ ID = 23109, R = true, B = true, Stats = { Healing = 7, SpellDamage = 3, Mp5 = 1 } }, -- Royal Shadow Draenite
{ ID = 23110, R = true, B = true, Stats = { Agility = 3, Stamina = 4 } }, -- Shifting Shadow Draenite
{ ID = 31862, R = true, B = true, Stats = { Ap = 6, Stamina = 4 } }, -- Balanced Shadow Draenite
{ ID = 31864, R = true, B = true, Stats = { Ap = 6, Mp5 = 1 } }, -- Infused Shadow Draenite


}


--========================================
-- Colored level 70 rare-quality gems
--========================================
local PawnGemData70Rare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 24027, R = true, Stats = { Strength = 8 } }, -- Bold Living Ruby
{ ID = 24028, R = true, Stats = { Agility = 8 } }, -- Delicate Living Ruby
{ ID = 24029, R = true, Stats = { Healing = 18, SpellDamage = 6 } }, -- Teardrop Living Ruby
{ ID = 24030, R = true, Stats = { SpellDamage = 9 } }, -- Runed Living Ruby
{ ID = 24031, R = true, Stats = { Ap = 16 } }, -- Bright Living Ruby
{ ID = 24032, R = true, Stats = { DodgeRating = 8 } }, -- Subtle Living Ruby
{ ID = 24036, R = true, Stats = { ParryRating = 8 } }, -- Flashing Living Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 24058, R = true, Y = true, Stats = { CritRating = 4, Strength = 4 } }, -- Inscribed Noble Topaz
{ ID = 24059, R = true, Y = true, Stats = { SpellCritRating = 4, SpellDamage = 5 } }, -- Potent Noble Topaz
{ ID = 24060, R = true, Y = true, Stats = { Healing = 9, SpellDamage = 3, Intellect = 4 } }, -- Luminous Noble Topaz
{ ID = 24061, R = true, Y = true, Stats = { HitRating = 4, Agility = 4 } }, -- Glinting Noble Topaz
{ ID = 31867, R = true, Y = true, Stats = { SpellHitRating = 4, SpellDamage = 5 } }, -- Veiled Noble Topaz
{ ID = 31868, R = true, Y = true, Stats = { CritRating = 4, Ap = 8 } }, -- Wicked Noble Topaz
{ ID = 35316, R = true, Y = true, Stats = { SpellHasteRating = 4, SpellDamage = 5 } }, -- Reckless Noble Topaz (PHASE 5)


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 24047, Y = true, Stats = { Intellect = 8 } }, -- Brilliant Dawnstone
{ ID = 24048, Y = true, Stats = { CritRating = 8 } }, -- Smooth Dawnstone
{ ID = 24050, Y = true, Stats = { SpellCritRating = 8 } }, -- Gleaming Dawnstone
{ ID = 24051, Y = true, Stats = { HitRating = 8 } }, -- Rigid Dawnstone
{ ID = 24052, Y = true, Stats = { DefenseRating = 8 } }, -- Thick Dawnstone
{ ID = 24053, Y = true, Stats = { ResilienceRating = 8 } }, -- Mystic Dawnstone
{ ID = 31861, Y = true, Stats = { SpellHitRating = 8 } }, -- Great Dawnstone
{ ID = 35315, Y = true, Stats = { SpellHasteRating = 8 } }, -- Quick Dawnstone (PHASE 5)


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 24062, Y = true, B = true, Stats = { DefenseRating = 4, Stamina = 6 } }, -- Enduring Talasite
{ ID = 24065, Y = true, B = true, Stats = { Intellect = 4, Mp5 = 2 } }, -- Dazzling Talasite
{ ID = 24066, Y = true, B = true, Stats = { SpellCritRating = 4, SpellPenetration = 5 } }, -- Radiant Talasite
{ ID = 24067, Y = true, B = true, Stats = { CritRating = 4, Stamina = 6 } }, -- Jagged Talasite
{ ID = 33782, Y = true, B = true, Stats = { ResilienceRating = 4, Stamina = 6 } }, -- Steady Talasite
{ ID = 35318, Y = true, B = true, Stats = { SpellHasteRating = 4, Stamina = 6 } }, -- Forceful Talasite (PHASE 5)


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 24033, B = true, Stats = { Stamina = 12 } }, -- Solid Star of Elune
{ ID = 24035, B = true, Stats = { Spirit = 8 } }, -- Sparkling Star of Elune
{ ID = 24037, B = true, Stats = { Mp5 = 3 } }, -- Lustrous Star of Elune
{ ID = 24039, B = true, Stats = { SpellPenetration = 10 } }, -- Stormy Star of Elune


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 24054, R = true, B = true, Stats = { Strength = 4, Stamina = 6 } }, -- Sovereign Nightseye
{ ID = 24055, R = true, B = true, Stats = { Agility = 4, Stamina = 6 } }, -- Shifting Nightseye
{ ID = 24056, R = true, B = true, Stats = { SpellDamage = 5, Stamina = 6 } }, -- Glowing Nightseye
{ ID = 24057, R = true, B = true, Stats = { Healing = 9, SpellDamage = 3, Mp5 = 2 } }, -- Royal Nightseye
{ ID = 31863, R = true, B = true, Stats = { Ap = 8, Stamina = 6 } }, -- Balanced Nightseye
{ ID = 31865, R = true, B = true, Stats = { Ap = 8, Mp5 = 2 } }, -- Infused Nightseye
{ ID = 35707, R = true, B = true, Stats = { DodgeRating = 4, Stamina = 6 } }, -- Regal Nightseye (PHASE 5)


}


--========================================
-- Colored level 70 epic-quality gems (PHASE 3+)
--========================================
local PawnGemData70Epic =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 32193, R = true, Stats = { Strength = 10 } }, -- Bold Crimson Spinel
{ ID = 32194, R = true, Stats = { Agility = 10 } }, -- Delicate Crimson Spinel
{ ID = 32195, R = true, Stats = { Healing = 22, SpellDamage = 8 } }, -- Teardrop Crimson Spinel
{ ID = 32196, R = true, Stats = { SpellDamage = 12 } }, -- Runed Crimson Spinel (PHASE 3)
{ ID = 32197, R = true, Stats = { Ap = 20 } }, -- Bright Crimson Spinel (PHASE 3)
{ ID = 32198, R = true, Stats = { DodgeRating = 10 } }, -- Subtle Crimson Spinel
{ ID = 32199, R = true, Stats = { ParryRating = 10 } }, -- Flashing Crimson Spinel


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 32217, R = true, Y = true, Stats = { CritRating = 5, Strength = 5 } }, -- Inscribed Pyrestone
{ ID = 32218, R = true, Y = true, Stats = { SpellCritRating = 5, SpellDamage = 6 } }, -- Potent Pyrestone
{ ID = 32219, R = true, Y = true, Stats = { Healing = 11, SpellDamage = 4, Intellect = 5 } }, -- Luminous Pyrestone
{ ID = 32220, R = true, Y = true, Stats = { HitRating = 5, Agility = 5 } }, -- Glinting Pyrestone
{ ID = 32221, R = true, Y = true, Stats = { SpellHitRating = 5, SpellDamage = 6 } }, -- Veiled Pyrestone
{ ID = 32222, R = true, Y = true, Stats = { CritRating = 5, Ap = 10 } }, -- Glinting Pyrestone
{ ID = 35760, R = true, Y = true, Stats = { SpellHasteRating = 5, SpellDamage = 6 } }, -- Reckless Pyrestone


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 32204, Y = true, Stats = { Intellect = 10 } }, -- Brilliant Lionseye
{ ID = 32205, Y = true, Stats = { CritRating = 10 } }, -- Smooth Lionseye
{ ID = 32206, Y = true, Stats = { HitRating = 10 } }, -- Rigid Lionseye
{ ID = 32207, Y = true, Stats = { SpellCritRating = 10 } }, -- Gleaming Lionseye
{ ID = 32208, Y = true, Stats = { DefenseRating = 10 } }, -- Thick Lionseye
{ ID = 32209, Y = true, Stats = { ResilienceRating = 10 } }, -- Mystic Lionseye
{ ID = 32210, Y = true, Stats = { SpellHitRating = 10 } }, -- Great Lionseye
{ ID = 35761, Y = true, Stats = { SpellHasteRating = 10 } }, -- Quick Lionseye (PHASE 5)


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 32223, Y = true, B = true, Stats = { DefenseRating = 5, Stamina = 7 } }, -- Enduring Seaspray Emerald
{ ID = 32224, Y = true, B = true, Stats = { SpellCritRating = 5, SpellPenetration = 6 } }, -- Radiant Seaspray Emerald
{ ID = 32225, Y = true, B = true, Stats = { Intellect = 5, Mp5 = 2 } }, -- Dazzling Seaspray Emerald
{ ID = 32226, Y = true, B = true, Stats = { CritRating, Stamina = 7 } }, -- Jagged Seaspray Emerald
{ ID = 35759, Y = true, B = true, Stats = { SpellHasteRating = 5, Stamina = 7 } }, -- Forceful Seaspray Emerald
{ ID = 35758, Y = true, B = true, Stats = { ResilienceRating = 5, Stamina = 7 } }, -- Steady Seaspray Emerald


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 32200, B = true, Stats = { Stamina = 15 } }, -- Solid Empyrean Sapphire
{ ID = 32201, B = true, Stats = { Spirit = 10 } }, -- Sparkling Empyrean Sapphire
{ ID = 32202, B = true, Stats = { Mp5 = 4 } }, -- Lustrous Empyrean Sapphire
{ ID = 32203, B = true, Stats = { SpellPenetration = 13 } }, -- Stormy Empyrean Sapphire


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 32211, R = true, B = true, Stats = { Strength = 5, Stamina = 7 } }, -- Sovereign Shadowsong Amethyst
{ ID = 32212, R = true, B = true, Stats = { Agility = 5, Stamina = 7 } }, -- Shifting Shadowsong Amethyst
{ ID = 32213, R = true, B = true, Stats = { Ap = 10, Stamina = 7 } }, -- Balanced Shadowsong Amethyst
{ ID = 32214, R = true, B = true, Stats = { Ap = 10, Mp5 = 2 } }, -- Infused Shadowsong Amethyst
{ ID = 32215, R = true, B = true, Stats = { SpellDamage = 6, Stamina = 7 } }, -- Glowing Shadowsong Amethyst
{ ID = 32216, R = true, B = true, Stats = { Healing = 11, SpellDamage = 4, Mp5 = 2 } }, -- Royal Shadowsong Amethyst
{ ID = 37503, R = true, B = true, Stats = { Healing = 11, SpellDamage = 4, Spirit = 5 } }, -- Purified Shadowsong Amethyst (PHASE 5)


}


--========================================
-- Level 70 crafted meta gems
--========================================
local PawnMetaGemData70Rare =
{

	
{ ID = 25896, Stats = { Stamina = 18 } }, -- Powerful Earthstorm Diamond
{ ID = 25897, Stats = { Healing = 26, SpellDamage = 9 } }, -- Bracing Earthstorm Diamond
{ ID = 25898, Stats = { DefenseRating = 12 } }, -- Tenacious Earthstorm Diamond
{ ID = 25901, Stats = { Intellect = 12 } }, -- Insightful Earthstorm Diamond
{ ID = 32409, Stats = { Agility = 12 } }, -- Relentless Earthstorm Diamond
{ ID = 25890, Stats = { SpellCritRating = 14 } }, -- Destructive Skyfire Diamond
{ ID = 25894, Stats = { Ap = 24 } }, -- Swift Skyfire Diamond
{ ID = 34220, Stats = { SpellCritRating = 12 } }, -- Chaotic Skyfire Diamond
{ ID = 35501, Stats = { DefenseRating = 12 } }, -- Eternal Earthstorm Diamond (PHASE 5)
{ ID = 35503, Stats = { SpellDamage = 14 } }, -- Ember Skyfire Diamond (PHASE 5)


}


--========================================


PawnGemQualityLevels =
{
	{ 151, PawnGemData70Epic }, -- Tier 6 (PHASE 3) (T4 / Karazhan is 115; T5 is 133; T6 is 151; Sunwell is 154)
	{ 100, PawnGemData70Rare }, -- Lowest-level level 70 item; heroic dungeons
	{ 90, PawnGemData70Uncommon }, -- Zangarmarsh gear gets green gems
	{ 0, PawnGemData60Common }, -- Hellfire Peninsula gear gets white gems
}

PawnMetaGemQualityLevels =
{
	{ 0, PawnMetaGemData70Rare },
}

PawnMinimumItemLevelToConsiderGems = 100

end -- if VgerCore.IsBurningCrusade
