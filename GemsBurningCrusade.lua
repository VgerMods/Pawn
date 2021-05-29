-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2021 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
-- 
-- Gem information (Burning Crusade Classic)
------------------------------------------------------------


if VgerCore.IsBurningCrusade then


--========================================
-- Colored level 60 common-quality vendor gems
--========================================
local PawnGemDataCommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 28458, R = true, Stats = { Strength = 4 } }, -- Bold Tourmaline
{ ID = 28459, R = true, Stats = { Agility = 4 } }, -- Delicate Tourmaline
{ ID = 28460, R = true, Stats = { Intellect = 4 } }, -- Brilliant Tourmaline


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 28467, Y = true, Stats = { CritRating = 4 } }, -- Smooth Amber
{ ID = 28470, Y = true, Stats = { DodgeRating = 4 } }, -- Subtle Amber


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 28463, B = true, Stats = { Stamina = 6 } }, -- Solid Zircon
{ ID = 28464, B = true, Stats = { Spirit = 4 } }, -- Sparkling Zircon
{ ID = 28468, B = true, Stats = { HitRating = 4 } }, -- Rigid Zircon


}


--========================================
-- Colored level 70 uncommon-quality gems
--========================================
local PawnGemDataUncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 23094, R = true, Stats = { Intellect = 6 } }, -- Brilliant Blood Garnet
{ ID = 23095, R = true, Stats = { Strength = 6 } }, -- Bold Blood Garnet
{ ID = 28595, R = true, Stats = { Agility = 6 } }, -- Delicate Blood Garnet


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 23098, R = true, Y = true, Stats = { CritRating = 3, Strength = 3 } }, -- Inscribed Flame Spessarite
-- { ID = 23099, R = true, Y = true, Stats = { HasteRating = 3, Intellect = 3 } }, -- Reckless Flame Spessarite
{ ID = 23101, R = true, Y = true, Stats = { CritRating = 3, Intellect = 3 } }, -- Potent Flame Spessarite
{ ID = 31869, R = true, Y = true, Stats = { CritRating = 3, Agility = 3 } }, -- Deadly Flame Spessarite


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 23114, Y = true, Stats = { CritRating = 6 } }, -- Smooth Golden Draenite
{ ID = 23115, Y = true, Stats = { DodgeRating = 6 } }, -- Subtle Golden Draenite


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 23103, Y = true, B = true, Stats = { CritRating = 3, SpellPenetration = 4 } }, -- Radiant Deep Peridot
{ ID = 23104, Y = true, B = true, Stats = { CritRating = 3, Stamina = 4 } }, -- Jagged Deep Peridot
{ ID = 23105, Y = true, B = true, Stats = { DodgeRating = 3, Stamina = 4 } }, -- Regal Deep Peridot


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 23116, B = true, Stats = { HitRating = 6 } }, -- Rigid Azure Moonstone
{ ID = 23118, B = true, Stats = { Stamina = 9 } }, -- Solid Azure Moonstone
{ ID = 23119, B = true, Stats = { Spirit = 6 } }, -- Sparkling Azure Moonstone
{ ID = 23120, B = true, Stats = { SpellPenetration = 8 } }, -- Stormy Azure Moonstone


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 23100, R = true, B = true, Stats = { HitRating = 3, Agility = 3 } }, -- Glinting Shadow Draenite
{ ID = 23108, R = true, B = true, Stats = { Intellect = 3, Stamina = 4 } }, -- Timeless Shadow Draenite
{ ID = 23109, R = true, B = true, Stats = { Intellect = 3, Spirit = 3 } }, -- Purified Shadow Draenite
{ ID = 23110, R = true, B = true, Stats = { Stamina = 4, Agility = 3 } }, -- Shifting Shadow Draenite
{ ID = 23111, R = true, B = true, Stats = { Strength = 3, Stamina = 4 } }, -- Sovereign Shadow Draenite
{ ID = 31866, R = true, B = true, Stats = { Intellect = 3, HitRating = 3 } }, -- Veiled Shadow Draenite


}


--========================================
-- Colored level 70 rare-quality gems
--========================================
local PawnGemDataRare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 24027, R = true, Stats = { Strength = 8 } }, -- Bold Living Ruby
{ ID = 24028, R = true, Stats = { Agility = 8 } }, -- Delicate Living Ruby
{ ID = 24030, R = true, Stats = { Intellect = 8 } }, -- Brilliant Living Ruby
{ ID = 24036, R = true, Stats = { ParryRating = 8 } }, -- Flashing Living Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 24058, R = true, Y = true, Stats = { CritRating = 4, Strength = 4 } }, -- Inscribed Noble Topaz
{ ID = 24059, R = true, Y = true, Stats = { Intellect = 4, CritRating = 4 } }, -- Potent Noble Topaz
-- { ID = 24060, R = true, Y = true, Stats = { Intellect = 4, HasteRating = 4 } }, -- Reckless Noble Topaz
{ ID = 31868, R = true, Y = true, Stats = { CritRating = 4, Agility = 4 } }, -- Deadly Noble Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 24032, Y = true, Stats = { DodgeRating = 8 } }, -- Subtle Dawnstone
{ ID = 24048, Y = true, Stats = { CritRating = 8 } }, -- Smooth Dawnstone
{ ID = 24053, Y = true, Stats = { ResilienceRating = 8 } }, -- Mystic Dawnstone
-- { ID = 35315, Y = true, Stats = { HasteRating = 8 } }, -- Quick Dawnstone


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 24065, Y = true, B = true, Stats = { Intellect = 4, Mp5 = 2 } }, -- Dazzling Talasite
{ ID = 24066, Y = true, B = true, Stats = { CritRating = 4, SpellPenetration = 5 } }, -- Radiant Talasite
{ ID = 24067, Y = true, B = true, Stats = { CritRating = 4, Stamina = 6 } }, -- Jagged Talasite
{ ID = 33782, Y = true, B = true, Stats = { Stamina = 6, ResilienceRating = 4 } }, -- Steady Talasite
-- { ID = 35318, Y = true, B = true, Stats = { HasteRating = 4, Stamina = 6 } }, -- Forceful Talasite
{ ID = 35707, Y = true, B = true, Stats = { DodgeRating = 4, Stamina = 6 } }, -- Regal Talasite


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 24033, B = true, Stats = { Stamina = 12 } }, -- Solid Star of Elune
{ ID = 24035, B = true, Stats = { Spirit = 8 } }, -- Sparkling Star of Elune
{ ID = 24039, B = true, Stats = { SpellPenetration = 10 } }, -- Stormy Star of Elune
{ ID = 24051, B = true, Stats = { HitRating = 8 } }, -- Rigid Star of Elune


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 24054, R = true, B = true, Stats = { Strength = 4, Stamina = 6 } }, -- Sovereign Nightseye
{ ID = 24055, R = true, B = true, Stats = { Stamina = 6, Agility = 4 } }, -- Shifting Nightseye
{ ID = 24056, R = true, B = true, Stats = { Intellect = 5, Stamina = 6 } }, -- Timeless Nightseye
{ ID = 24061, R = true, B = true, Stats = { HitRating = 4, Agility = 4 } }, -- Glinting Nightseye
{ ID = 31867, R = true, B = true, Stats = { Intellect = 4, HitRating = 4 } }, -- Veiled Nightseye


}


--========================================
-- Colored level 70 epic-quality gems
--========================================
local PawnGemDataEpic =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 32193, R = true, Stats = { Strength = 10 } }, -- Bold Crimson Spinel
{ ID = 32194, R = true, Stats = { Agility = 10 } }, -- Delicate Crimson Spinel
{ ID = 32195, R = true, Stats = { Intellect = 10 } }, -- Brilliant Crimson Spinel
{ ID = 32199, R = true, Stats = { ParryRating = 10 } }, -- Flashing Crimson Spinel


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 32217, R = true, Y = true, Stats = { CritRating = 5, Strength = 5 } }, -- Inscribed Pyrestone
{ ID = 32218, R = true, Y = true, Stats = { Intellect = 5, CritRating = 5 } }, -- Potent Pyrestone
-- { ID = 32219, R = true, Y = true, Stats = { Intellect = 5, HasteRating = 5 } }, -- Reckless Pyrestone
{ ID = 32222, R = true, Y = true, Stats = { CritRating = 5, Agility = 5 } }, -- Deadly Pyrestone


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 32198, Y = true, Stats = { DodgeRating = 10 } }, -- Subtle Lionseye
{ ID = 32205, Y = true, Stats = { CritRating = 10 } }, -- Smooth Lionseye
{ ID = 32209, Y = true, Stats = { ResilienceRating = 10 } }, -- Mystic Lionseye
-- { ID = 35761, Y = true, Stats = { HasteRating = 10 } }, -- Quick Lionseye


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 32223, Y = true, B = true, Stats = { DodgeRating = 5, Stamina = 7 } }, -- Regal Seaspray Emerald
{ ID = 32224, Y = true, B = true, Stats = { CritRating = 5, SpellPenetration = 6 } }, -- Radiant Seaspray Emerald
{ ID = 32225, Y = true, B = true, Stats = { Intellect = 5, Mp5 = 2 } }, -- Dazzling Seaspray Emerald
{ ID = 32226, Y = true, B = true, Stats = { CritRating = 5, Stamina = 7 } }, -- Jagged Seaspray Emerald
{ ID = 35758, Y = true, B = true, Stats = { Stamina = 7, ResilienceRating = 5 } }, -- Steady Seaspray Emerald
-- { ID = 35759, Y = true, B = true, Stats = { HasteRating = 5, Stamina = 7 } }, -- Forceful Seaspray Emerald


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 32200, B = true, Stats = { Stamina = 15 } }, -- Solid Empyrean Sapphire
{ ID = 32201, B = true, Stats = { Spirit = 10 } }, -- Sparkling Empyrean Sapphire
{ ID = 32203, B = true, Stats = { SpellPenetration = 13 } }, -- Stormy Empyrean Sapphire
{ ID = 32206, B = true, Stats = { HitRating = 10 } }, -- Rigid Empyrean Sapphire


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 32211, R = true, B = true, Stats = { Strength = 5, Stamina = 7 } }, -- Sovereign Shadowsong Amethyst
{ ID = 32212, R = true, B = true, Stats = { Stamina = 7, Agility = 5 } }, -- Shifting Shadowsong Amethyst
{ ID = 32215, R = true, B = true, Stats = { Intellect = 5, Stamina = 7 } }, -- Timeless Shadowsong Amethyst
{ ID = 32220, R = true, B = true, Stats = { HitRating = 5, Agility = 5 } }, -- Glinting Shadowsong Amethyst
{ ID = 32221, R = true, B = true, Stats = { Intellect = 5, HitRating = 5 } }, -- Veiled Shadowsong Amethyst


}


--========================================
-- Level 70 crafted meta gems
--========================================
local PawnMetaGemDataRare =
{


------------------------------------------------------------
-- Meta gems: Earthstorm
------------------------------------------------------------

{ ID = 25896, Stats = { Stamina = 18, MetaSocketEffect = 1 } }, -- Powerful Earthstorm Diamond
{ ID = 25897, Stats = { Intellect = 12, MetaSocketEffect = 1 } }, -- Bracing Earthstorm Diamond
{ ID = 25898, Stats = { DodgeRating = 12, MetaSocketEffect = 1 } }, -- Tenacious Earthstorm Diamond
{ ID = 25899, Stats = { MetaSocketEffect = 1 } }, -- Brutal Earthstorm Diamond
{ ID = 25901, Stats = { Intellect = 12, MetaSocketEffect = 1 } }, -- Insightful Earthstorm Diamond
{ ID = 32409, Stats = { MetaSocketEffect = 1, Agility = 12 } }, -- Relentless Earthstorm Diamond
{ ID = 35501, Stats = { DodgeRating = 12, MetaSocketEffect = 1 } }, -- Eternal Earthstorm Diamond


------------------------------------------------------------
-- Meta gems: Skyfire
------------------------------------------------------------

{ ID = 25890, Stats = { CritRating = 14, MetaSocketEffect = 1 } }, -- Destructive Skyfire Diamond
{ ID = 25893, Stats = { MetaSocketEffect = 1 } }, -- Mystical Skyfire Diamond
{ ID = 25894, Stats = { CritRating = 12, MetaSocketEffect = 1 } }, -- Swift Skyfire Diamond
{ ID = 25895, Stats = { MetaSocketEffect = 1 } }, -- Enigmatic Skyfire Diamond
{ ID = 32410, Stats = { MetaSocketEffect = 1 } }, -- Thundering Skyfire Diamond
{ ID = 34220, Stats = { CritRating = 12, MetaSocketEffect = 1 } }, -- Chaotic Skyfire Diamond
{ ID = 35503, Stats = { Intellect = 12, MetaSocketEffect = 1 } }, -- Ember Skyfire Diamond


}


PawnGemQualityLevels =
{
	-- { 154, PawnGemDataEpic }, -- Sunwell (gems not available yet) (T4 / Karazhan is 115; T5 is 133; T6 is 151; Sunwell is 154)
	{ 100, PawnGemDataRare }, -- Lowest-level level 70 item; heroic dungeons
	{ 90, PawnGemDataUncommon }, -- Zangarmarsh gear gets green gems
	{ 0, PawnGemDataCommon }, -- Hellfire Peninsula gear gets white gems
}

PawnMetaGemQualityLevels =
{
	{ 0, PawnMetaGemDataRare },
}

PawnMinimumItemLevelToConsiderGems = 85 -- Hellfire Ramparts level 60 dungeon blue
	
end -- if VgerCore.IsBurningCrusade
