-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2024 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Gem information (Cataclysm Classic)
------------------------------------------------------------


if VgerCore.IsCataclysm then


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
{ ID = 28460, R = true, Stats = { Intellect = 4 } }, -- Brilliant Tourmaline


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 28467, Y = true, Stats = { CritRating = 4 } }, -- Smooth Amber
{ ID = 28468, Y = true, Stats = { HitRating = 4 } }, -- Rigid Amber
{ ID = 28470, Y = true, Stats = { DodgeRating = 4 } }, -- Subtle Amber


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 28463, B = true, Stats = { Stamina = 6 } }, -- Solid Zircon
{ ID = 28464, B = true, Stats = { Spirit = 4 } }, -- Sparkling Zircon


}


--========================================
-- Colored level 70 uncommon-quality gems
--========================================
local PawnGemData70Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 23095, R = true, Stats = { Strength = 6 } }, -- Bold Blood Garnet
{ ID = 23097, R = true, Stats = { Agility = 6 } }, -- Delicate Blood Garnet
{ ID = 23113, R = true, Stats = { Intellect = 6 } }, -- Brilliant Blood Garnet


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 23098, R = true, Y = true, Stats = { CritRating = 3, Strength = 3 } }, -- Inscribed Flame Spessarite
{ ID = 23099, R = true, Y = true, Stats = { HasteRating = 3, Intellect = 3 } }, -- Reckless Flame Spessarite
{ ID = 23101, R = true, Y = true, Stats = { CritRating = 3, Intellect = 3 } }, -- Potent Flame Spessarite
{ ID = 31869, R = true, Y = true, Stats = { CritRating = 3, Agility = 3 } }, -- Deadly Flame Spessarite


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 23115, Y = true, Stats = { DodgeRating = 6 } }, -- Subtle Golden Draenite
{ ID = 28290, Y = true, Stats = { CritRating = 6 } }, -- Smooth Golden Draenite


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
{ ID = 23110, R = true, B = true, Stats = { Agility = 3, Stamina = 4 } }, -- Shifting Shadow Draenite
{ ID = 23111, R = true, B = true, Stats = { Strength = 3, Stamina = 4 } }, -- Sovereign Shadow Draenite
{ ID = 31866, R = true, B = true, Stats = { HitRating = 3, Intellect = 3 } }, -- Veiled Shadow Draenite


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
{ ID = 24032, R = true, Stats = { DodgeRating = 8 } }, -- Subtle Living Ruby
{ ID = 24036, R = true, Stats = { ParryRating = 8 } }, -- Flashing Living Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 24058, R = true, Y = true, Stats = { CritRating = 4, Strength = 4 } }, -- Inscribed Noble Topaz
{ ID = 24059, R = true, Y = true, Stats = { CritRating = 4, Intellect = 4 } }, -- Potent Noble Topaz
{ ID = 24060, R = true, Y = true, Stats = { HasteRating = 4, Intellect = 4 } }, -- Reckless Noble Topaz
{ ID = 31868, R = true, Y = true, Stats = { CritRating = 4, Agility = 4 } }, -- Deadly Noble Topaz
{ ID = 35316, R = true, Y = true, Stats = { HasteRating = 4, Intellect = 4 } }, -- Reckless Noble Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 24047, Y = true, Stats = { Intellect = 8 } }, -- Brilliant Dawnstone
{ ID = 24048, Y = true, Stats = { CritRating = 8 } }, -- Smooth Dawnstone
{ ID = 24052, Y = true, Stats = { DodgeRating = 8 } }, -- Subtle Dawnstone
{ ID = 24053, Y = true, Stats = { ResilienceRating = 8 } }, -- Mystic Dawnstone
{ ID = 35315, Y = true, Stats = { HasteRating = 8 } }, -- Quick Dawnstone


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 24062, Y = true, B = true, Stats = { DodgeRating = 4, Stamina = 6 } }, -- Regal Talasite
{ ID = 24066, Y = true, B = true, Stats = { CritRating = 4, SpellPenetration = 5 } }, -- Radiant Talasite
{ ID = 24067, Y = true, B = true, Stats = { CritRating = 4, Stamina = 6 } }, -- Jagged Talasite
{ ID = 33782, Y = true, B = true, Stats = { ResilienceRating = 4, Stamina = 6 } }, -- Steady Talasite
{ ID = 35318, Y = true, B = true, Stats = { HasteRating = 4, Stamina = 6 } }, -- Forceful Talasite


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
{ ID = 24055, R = true, B = true, Stats = { Agility = 4, Stamina = 6 } }, -- Shifting Nightseye
{ ID = 24056, R = true, B = true, Stats = { Intellect = 4, Stamina = 6 } }, -- Timeless Nightseye
{ ID = 24057, R = true, B = true, Stats = { Intellect = 4, Spirit = 4 } }, -- Purified Nightseye
{ ID = 24061, R = true, B = true, Stats = { HitRating = 4, Agility = 4 } }, -- Glinting Nightseye
{ ID = 31867, R = true, B = true, Stats = { HitRating = 4, Intellect = 4 } }, -- Veiled Nightseye
{ ID = 35707, R = true, B = true, Stats = { DodgeRating = 4, Stamina = 6 } }, -- Regal Nightseye


}


--========================================
-- Colored level 70 epic-quality gems
--========================================
local PawnGemData70Epic =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 32193, R = true, Stats = { Strength = 10 } }, -- Bold Crimson Spinel
{ ID = 32194, R = true, Stats = { Agility = 10 } }, -- Delicate Crimson Spinel
{ ID = 32198, R = true, Stats = { DodgeRating = 10 } }, -- Subtle Crimson Spinel
{ ID = 32199, R = true, Stats = { ParryRating = 10 } }, -- Flashing Crimson Spinel
{ ID = 32204, R = true, Stats = { Intellect = 10 } }, -- Brilliant Crimson Spinel


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 32217, R = true, Y = true, Stats = { CritRating = 5, Strength = 5 } }, -- Inscribed Pyrestone
{ ID = 32218, R = true, Y = true, Stats = { CritRating = 5, Intellect = 5 } }, -- Potent Pyrestone
{ ID = 32219, R = true, Y = true, Stats = { HasteRating = 5, Intellect = 5 } }, -- Reckless Pyrestone
{ ID = 32222, R = true, Y = true, Stats = { CritRating = 5, Agility = 5 } }, -- Deadly Pyrestone


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 32205, Y = true, Stats = { CritRating = 10 } }, -- Smooth Lionseye
{ ID = 32208, Y = true, Stats = { DodgeRating = 10 } }, -- Subtle Lionseye
{ ID = 32209, Y = true, Stats = { ResilienceRating = 10 } }, -- Mystic Lionseye
{ ID = 35761, Y = true, Stats = { HasteRating = 10 } }, -- Quick Lionseye


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 32223, Y = true, B = true, Stats = { DodgeRating = 5, Stamina = 7 } }, -- Regal Seaspray Emerald
{ ID = 32224, Y = true, B = true, Stats = { CritRating = 5, SpellPenetration = 6 } }, -- Radiant Seaspray Emerald
{ ID = 32226, Y = true, B = true, Stats = { CritRating = 5, Stamina = 7 } }, -- Jagged Seaspray Emerald
{ ID = 35759, Y = true, B = true, Stats = { HasteRating = 5, Stamina = 7 } }, -- Forceful Seaspray Emerald
{ ID = 35758, Y = true, B = true, Stats = { ResilienceRating = 5, Stamina = 7 } }, -- Steady Seaspray Emerald


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
{ ID = 32212, R = true, B = true, Stats = { Agility = 5, Stamina = 7 } }, -- Shifting Shadowsong Amethyst
{ ID = 32215, R = true, B = true, Stats = { Intellect = 5, Stamina = 7 } }, -- Timeless Shadowsong Amethyst
{ ID = 32216, R = true, B = true, Stats = { Intellect = 5, Spirit = 5 } }, -- Purified Shadowsong Amethyst
{ ID = 32220, R = true, B = true, Stats = { HitRating = 5, Agility = 5 } }, -- Glinting Shadowsong Amethyst
{ ID = 32221, R = true, B = true, Stats = { HitRating = 5, Intellect = 5 } }, -- Veiled Shadowsong Amethyst


}


--========================================
-- Level 70 crafted meta gems
--========================================
local PawnMetaGemData70Rare =
{


{ ID = 25896, Stats = { Stamina = 18 } }, -- Powerful Earthstorm Diamond
{ ID = 25897, Stats = { Intellect = 12 } }, -- Bracing Earthstorm Diamond
{ ID = 25898, Stats = { DodgeRating = 12 } }, -- Tenacious Earthstorm Diamond
{ ID = 25901, Stats = { Intellect = 12 } }, -- Insightful Earthstorm Diamond
{ ID = 32409, Stats = { Agility = 12 } }, -- Relentless Earthstorm Diamond
{ ID = 25890, Stats = { CritRating = 14 } }, -- Destructive Skyfire Diamond
{ ID = 25894, Stats = { CritRating = 12 } }, -- Swift Skyfire Diamond
{ ID = 34220, Stats = { CritRating = 12 } }, -- Chaotic Skyfire Diamond
{ ID = 35501, Stats = { DodgeRating = 12 } }, -- Eternal Earthstorm Diamond
{ ID = 35503, Stats = { Intellect = 12 } }, -- Ember Skyfire Diamond


}


--========================================
-- Colored level 80 uncommon-quality gems
--========================================
PawnGemData80Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 39900, R = true, Stats = { Strength = 12 } }, -- Bold Bloodstone
{ ID = 39905, R = true, Stats = { Agility = 12 } }, -- Delicate Bloodstone
{ ID = 39908, R = true, Stats = { ParryRating = 12 } }, -- Flashing Bloodstone
{ ID = 39910, R = true, Stats = { ExpertiseRating = 12 } }, -- Precise Bloodstone
{ ID = 39912, Y = true, Stats = { Intellect = 12 } }, -- Brilliant Bloodstone


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 39947, R = true, Y = true, Stats = { Strength = 6, CritRating = 6 } }, -- Inscribed Huge Citrine
{ ID = 39948, R = true, Y = true, Stats = { Strength = 6, HitRating = 6 } }, -- Etched Huge Citrine
{ ID = 39949, R = true, Y = true, Stats = { Strength = 6, DodgeRating = 6 } }, -- Champion's Huge Citrine
{ ID = 39950, R = true, Y = true, Stats = { Strength = 6, ResilienceRating = 6 } }, -- Resplendent Huge Citrine
{ ID = 39951, R = true, Y = true, Stats = { Strength = 6, HasteRating = 6 } }, -- Fierce Huge Citrine
{ ID = 39952, R = true, Y = true, Stats = { Agility = 6, CritRating = 6 } }, -- Deadly Huge Citrine
{ ID = 39954, R = true, Y = true, Stats = { Agility = 6, ResilienceRating = 6 } }, -- Lucent Huge Citrine
{ ID = 39955, R = true, Y = true, Stats = { Agility = 6, HasteRating = 6 } }, -- Deft Huge Citrine
{ ID = 39956, R = true, Y = true, Stats = { Intellect = 6, CritRating = 6 } }, -- Potent Huge Citrine
{ ID = 39958, R = true, Y = true, Stats = { Intellect = 6, ResilienceRating = 6 } }, -- Willful Huge Citrine
{ ID = 39959, R = true, Y = true, Stats = { Intellect = 6, HasteRating = 6 } }, -- Reckless Huge Citrine
{ ID = 39964, R = true, Y = true, Stats = { DodgeRating = 6, ParryRating = 6 } }, -- Stalwart Huge Citrine
{ ID = 39967, R = true, Y = true, Stats = { ExpertiseRating = 6, DodgeRating = 6 } }, -- Resolute Huge Citrine


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 39907, R = true, Stats = { DodgeRating = 12 } }, -- Subtle Sun Crystal
{ ID = 39914, Y = true, Stats = { CritRating = 12 } }, -- Smooth Sun Crystal
{ ID = 39917, Y = true, Stats = { ResilienceRating = 12 } }, -- Mystic Sun Crystal
{ ID = 39918, Y = true, Stats = { HasteRating = 12 } }, -- Quick Sun Crystal


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 39968, Y = true, B = true, Stats = { Intellect = 6, Stamina = 9 } }, -- Timeless Dark Jade
{ ID = 39974, Y = true, B = true, Stats = { CritRating = 6, Stamina = 9 } }, -- Jagged Dark Jade
{ ID = 39975, Y = true, B = true, Stats = { HitRating = 6, Stamina = 9 } }, -- Vivid Dark Jade
{ ID = 39976, Y = true, B = true, Stats = { DodgeRating = 6, Stamina = 9 } }, -- Regal Dark Jade
{ ID = 39977, Y = true, B = true, Stats = { ResilienceRating = 6, Stamina = 9 } }, -- Steady Dark Jade
{ ID = 39978, Y = true, B = true, Stats = { HasteRating = 6, Stamina = 9 } }, -- Forceful Dark Jade
{ ID = 39979, Y = true, B = true, Stats = { Intellect = 6, Spirit = 6 } }, -- Seer's Dark Jade
{ ID = 39980, Y = true, B = true, Stats = { CritRating = 6, Spirit = 6 } }, -- Misty Dark Jade
{ ID = 39981, Y = true, B = true, Stats = { HitRating = 6, Spirit = 6 } }, -- Shining Dark Jade
{ ID = 39982, Y = true, B = true, Stats = { ResilienceRating = 6, Spirit = 6 } }, -- Turbid Dark Jade
{ ID = 39983, Y = true, B = true, Stats = { HasteRating = 6, Spirit = 6 } }, -- Intricate Dark Jade
{ ID = 39986, Y = true, B = true, Stats = { HitRating = 6, HasteRating = 6 } }, -- Lightning Dark Jade
{ ID = 39989, Y = true, B = true, Stats = { HasteRating = 6, Spirit = 6 } }, -- Energized Dark Jade
{ ID = 39990, Y = true, B = true, Stats = { CritRating = 6, SpellPenetration = 8 } }, -- Radiant Dark Jade
{ ID = 39991, Y = true, B = true, Stats = { HitRating = 6, SpellPenetration = 8 } }, -- Tense Dark Jade
{ ID = 39992, Y = true, B = true, Stats = { HasteRating = 6, SpellPenetration = 8 } }, -- Shattered Dark Jade


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 39915, B = true, Stats = { HitRating = 12 } }, -- Rigid Chalcedony
{ ID = 39919, B = true, Stats = { Stamina = 18 } }, -- Solid Chalcedony
{ ID = 39920, B = true, Stats = { Spirit = 12 } }, -- Sparkling Chalcedony
{ ID = 39932, B = true, Stats = { SpellPenetration = 15 } }, -- Stormy Chalcedony


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 39934, R = true, B = true, Stats = { Strength = 6, Stamina = 9 } }, -- Sovereign Shadow Crystal
{ ID = 39935, R = true, B = true, Stats = { Agility = 6, Stamina = 9 } }, -- Shifting Shadow Crystal
{ ID = 39936, R = true, B = true, Stats = { Intellect = 6, Stamina = 9 } }, -- Timeless Shadow Crystal
{ ID = 39938, R = true, B = true, Stats = { DodgeRating = 6, Stamina = 9 } }, -- Regal Shadow Crystal
{ ID = 39939, R = true, B = true, Stats = { ParryRating = 6, Stamina = 9 } }, -- Defender's Shadow Crystal
{ ID = 39940, R = true, B = true, Stats = { ExpertiseRating = 6, Stamina = 9 } }, -- Guardian's Shadow Crystal
{ ID = 39941, R = true, B = true, Stats = { Intellect = 6, Spirit = 6 } }, -- Purified Shadow Crystal
{ ID = 39942, R = true, B = true, Stats = { Agility = 6, HitRating = 6 } }, -- Glinting Shadow Crystal
{ ID = 39945, R = true, B = true, Stats = { Intellect = 6, SpellPenetration = 8 } }, -- Mysterious Shadow Crystal
{ ID = 39957, R = true, B = true, Stats = { Intellect = 6, HitRating = 6 } }, -- Veiled Shadow Crystal
{ ID = 39966, R = true, B = true, Stats = { ExpertiseRating = 6, HitRating = 6 } }, -- Accurate Shadow Crystal


}


--========================================
-- Colored level 80 rare-quality gems
--========================================
PawnGemData80Rare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 39996, R = true, Stats = { Strength = 16 } }, -- Bold Scarlet Ruby
{ ID = 39997, R = true, Stats = { Agility = 16 } }, -- Delicate Scarlet Ruby
{ ID = 40000, R = true, Stats = { DodgeRating = 16 } }, -- Subtle Scarlet Ruby
{ ID = 40001, R = true, Stats = { ParryRating = 16 } }, -- Flashing Scarlet Ruby
{ ID = 40002, R = true, Stats = { ArmorPenetration = 16 } }, -- Fractured Scarlet Ruby
{ ID = 40003, R = true, Stats = { ExpertiseRating = 16 } }, -- Precise Scarlet Ruby
{ ID = 40012, R = true, Stats = { Intellect = 16 } }, -- Brilliant Scarlet Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 40037, R = true, Y = true, Stats = { Strength = 8, CritRating = 8 } }, -- Inscribed Monarch Topaz
{ ID = 40038, R = true, Y = true, Stats = { Strength = 8, HitRating = 8 } }, -- Etched Monarch Topaz
{ ID = 40039, R = true, Y = true, Stats = { Strength = 8, DodgeRating = 8 } }, -- Champion's Monarch Topaz
{ ID = 40040, R = true, Y = true, Stats = { Strength = 8, ResilienceRating = 8 } }, -- Resplendent Monarch Topaz
{ ID = 40041, R = true, Y = true, Stats = { Strength = 8, HasteRating = 8 } }, -- Fierce Monarch Topaz
{ ID = 40043, R = true, Y = true, Stats = { Agility = 8, CritRating = 8 } }, -- Deadly Monarch Topaz
{ ID = 40045, R = true, Y = true, Stats = { Agility = 8, ResilienceRating = 8 } }, -- Lucent Monarch Topaz
{ ID = 40046, R = true, Y = true, Stats = { Agility = 8, HasteRating = 8 } }, -- Deft Monarch Topaz
{ ID = 40048, R = true, Y = true, Stats = { Intellect = 8, CritRating = 8 } }, -- Potent Monarch Topaz
{ ID = 40050, R = true, Y = true, Stats = { Intellect = 8, ResilienceRating = 8 } }, -- Durable Monarch Topaz
{ ID = 40051, R = true, Y = true, Stats = { Intellect = 8, HasteRating = 8 } }, -- Reckless Monarch Topaz
{ ID = 40052, R = true, Y = true, Stats = { Agility = 8, CritRating = 8 } }, -- Deadly Monarch Topaz
{ ID = 40056, R = true, Y = true, Stats = { DodgeRating = 8, ParryRating = 8 } }, -- Stalwart Monarch Topaz
{ ID = 40059, R = true, Y = true, Stats = { ExpertiseRating = 8, DodgeRating = 8 } }, -- Resolute Monarch Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 40013, Y = true, Stats = { CritRating = 16 } }, -- Smooth Autumn's Glow
{ ID = 40015, Y = true, Stats = { DodgeRating = 16 } }, -- Subtle Autumn's Glow
{ ID = 40016, Y = true, Stats = { ResilienceRating = 16 } }, -- Mystic Autumn's Glow
{ ID = 40017, Y = true, Stats = { HasteRating = 16 } }, -- Quick Autumn's Glow


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 40086, Y = true, B = true, Stats = { CritRating = 8, Stamina = 12 } }, -- Jagged Forest Emerald
{ ID = 40088, Y = true, B = true, Stats = { HitRating = 8, DodgeRating = 8 } }, -- Nimble Forest Emerald
{ ID = 40089, Y = true, B = true, Stats = { DodgeRating = 8, Stamina = 12 } }, -- Regal Forest Emerald
{ ID = 40090, Y = true, B = true, Stats = { ResilienceRating = 8, Stamina = 12 } }, -- Steady Forest Emerald
{ ID = 40091, Y = true, B = true, Stats = { HasteRating = 8, Stamina = 12 } }, -- Forceful Forest Emerald
{ ID = 40095, Y = true, B = true, Stats = { CritRating = 8, Spirit = 8 } }, -- Misty Forest Emerald
{ ID = 40098, Y = true, B = true, Stats = { CritRating = 8, SpellPenetration = 10 } }, -- Radiant Forest Emerald
{ ID = 40099, Y = true, B = true, Stats = { HitRating = 8, HasteRating = 8 } }, -- Lightning Forest Emerald
{ ID = 40102, Y = true, B = true, Stats = { ResilienceRating = 8, Spirit = 8 } }, -- Turbid Forest Emerald
{ ID = 40104, Y = true, B = true, Stats = { HasteRating = 8, Spirit = 8 } }, -- Energized Forest Emerald
{ ID = 40106, Y = true, B = true, Stats = { HasteRating = 8, SpellPenetration = 10 } }, -- Shattered Forest Emerald


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 40008, B = true, Stats = { Stamina = 24 } }, -- Solid Sky Sapphire
{ ID = 40009, B = true, Stats = { Spirit = 16 } }, -- Sparkling Sky Sapphire
{ ID = 40011, B = true, Stats = { SpellPenetration = 20 } }, -- Stormy Sky Sapphire
{ ID = 40014, B = true, Stats = { HitRating = 16 } }, -- Rigid Sky Sapphire


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 40022, R = true, B = true, Stats = { Strength = 8, Stamina = 12 } }, -- Sovereign Twilight Opal
{ ID = 40023, R = true, B = true, Stats = { Agility = 8, Stamina = 12 } }, -- Shifting Twilight Opal
{ ID = 40025, R = true, B = true, Stats = { Intellect = 8, Stamina = 12 } }, -- Timeless Twilight Opal
{ ID = 40026, R = true, B = true, Stats = { Intellect = 8, Spirit = 8 } }, -- Purified Twilight Opal
{ ID = 40028, R = true, B = true, Stats = { Intellect = 8, SpellPenetration = 10 } }, -- Mysterious Twilight Opal
{ ID = 40030, R = true, B = true, Stats = { Agility = 8, HitRating = 8 } }, -- Glinting Twilight Opal
{ ID = 40031, R = true, B = true, Stats = { DodgeRating = 8, Stamina = 12 } }, -- Regal Twilight Opal
{ ID = 40032, R = true, B = true, Stats = { ParryRating = 8, Stamina = 12 } }, -- Defender's Twilight Opal
{ ID = 40033, R = true, B = true, Stats = { CritRating = 8, Stamina = 12 } }, -- Jagged Forest Emerald
{ ID = 40034, R = true, B = true, Stats = { ExpertiseRating = 8, Stamina = 12 } }, -- Guardian's Twilight Opal
{ ID = 40049, R = true, B = true, Stats = { Intellect = 8, HitRating = 8 } }, -- Veiled Twilight Opal
{ ID = 40058, R = true, B = true, Stats = { ExpertiseRating = 8, HitRating = 8 } }, -- Accurate Twilight Opal
{ ID = 40085, R = true, B = true, Stats = { Intellect = 8, Stamina = 12 } }, -- Timeless Twilight Opal


}


--========================================
-- Colored level 80 epic-quality gems
--========================================
PawnGemData80Epic =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 40111, R = true, Stats = { Strength = 20 } }, -- Bold Cardinal Ruby
{ ID = 40112, R = true, Stats = { Agility = 20 } }, -- Delicate Cardinal Ruby
{ ID = 40115, R = true, Stats = { DodgeRating = 20 } }, -- Subtle Cardinal Ruby
{ ID = 40116, R = true, Stats = { ParryRating = 20 } }, -- Flashing Cardinal Ruby
{ ID = 40117, R = true, Stats = { ArmorPenetration = 20 } }, -- Fractured Cardinal Ruby
{ ID = 40118, R = true, Stats = { ExpertiseRating = 20 } }, -- Precise Cardinal Ruby
{ ID = 40123, R = true, Stats = { Intellect = 20 } }, -- Brilliant Cardinal Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 40142, R = true, Y = true, Stats = { Strength = 10, CritRating = 10 } }, -- Inscribed Ametrine
{ ID = 40143, R = true, Y = true, Stats = { Strength = 10, HitRating = 10 } }, -- Etched Ametrine
{ ID = 40144, R = true, Y = true, Stats = { Strength = 10, DodgeRating = 10 } }, -- Champion's Ametrine
{ ID = 40145, R = true, Y = true, Stats = { Strength = 10, ResilienceRating = 10 } }, -- Resplendent Ametrine
{ ID = 40146, R = true, Y = true, Stats = { Strength = 10, HasteRating = 10 } }, -- Fierce Ametrine
{ ID = 40147, R = true, Y = true, Stats = { Agility = 10, CritRating = 10 } }, -- Deadly Ametrine
{ ID = 40149, R = true, Y = true, Stats = { Agility = 10, ResilienceRating = 10 } }, -- Lucent Ametrine
{ ID = 40150, R = true, Y = true, Stats = { Agility = 10, HasteRating = 10 } }, -- Deft Ametrine
{ ID = 40152, R = true, Y = true, Stats = { Intellect = 10, CritRating = 10 } }, -- Potent Ametrine
{ ID = 40154, R = true, Y = true, Stats = { Intellect = 10, ResilienceRating = 10 } }, -- Durable Ametrine
{ ID = 40155, R = true, Y = true, Stats = { Intellect = 10, HasteRating = 10 } }, -- Reckless Ametrine
{ ID = 40156, R = true, Y = true, Stats = { Agility = 10, CritRating = 10 } }, -- Wicked Ametrine
{ ID = 40157, R = true, Y = true, Stats = { Agility = 10, HitRating = 10 } }, -- Pristine Ametrine
{ ID = 40158, R = true, Y = true, Stats = { Agility = 10, ResilienceRating = 10 } }, -- Empowered Ametrine
{ ID = 40159, R = true, Y = true, Stats = { Agility = 10, HasteRating = 10 } }, -- Stark Ametrine
{ ID = 40160, R = true, Y = true, Stats = { DodgeRating = 10, ParryRating = 10 } }, -- Stalwart Ametrine
{ ID = 40163, R = true, Y = true, Stats = { ExpertiseRating = 10, DodgeRating = 10 } }, -- Resolute Ametrine


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 40124, Y = true, Stats = { CritRating = 20 } }, -- Smooth King's Amber
{ ID = 40126, Y = true, Stats = { DodgeRating = 20 } }, -- Subtle King's Amber
{ ID = 40127, Y = true, Stats = { ResilienceRating = 20 } }, -- Mystic King's Amber
{ ID = 40128, Y = true, Stats = { HasteRating = 20 } }, -- Quick King's Amber


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 40165, Y = true, B = true, Stats = { CritRating = 10, Stamina = 15 } }, -- Jagged Eye of Zul
{ ID = 40166, Y = true, B = true, Stats = { HitRating = 10, DodgeRating = 15 } }, -- Nimble Eye of Zul
{ ID = 40167, Y = true, B = true, Stats = { DodgeRating = 10, Stamina = 15 } }, -- Regal Eye of Zul
{ ID = 40168, Y = true, B = true, Stats = { ResilienceRating = 10, Stamina = 15 } }, -- Steady Eye of Zul
{ ID = 40169, Y = true, B = true, Stats = { HasteRating = 10, Stamina = 15 } }, -- Forceful Eye of Zul
{ ID = 40171, Y = true, B = true, Stats = { CritRating = 10, Spirit = 10 } }, -- Misty Eye of Zul
{ ID = 40172, Y = true, B = true, Stats = { HitRating = 10, HasteRating = 10 } }, -- Lightning Eye of Zul
{ ID = 40173, Y = true, B = true, Stats = { ResilienceRating = 10, Spirit = 10 } }, -- Turbid Eye of Zul
{ ID = 40174, Y = true, B = true, Stats = { HasteRating = 10, Spirit = 10 } }, -- Energized Eye of Zul
{ ID = 40180, Y = true, B = true, Stats = { CritRating = 10, SpellPenetration = 13 } }, -- Radiant Eye of Zul
{ ID = 40182, Y = true, B = true, Stats = { HasteRating = 10, SpellPenetration = 13 } }, -- Shattered Eye of Zul


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 40119, B = true, Stats = { Stamina = 30 } }, -- Solid Majestic Zircon
{ ID = 40120, B = true, Stats = { Spirit = 20 } }, -- Sparkling Majestic Zircon
{ ID = 40122, B = true, Stats = { SpellPenetration = 25 } }, -- Stormy Majestic Zircon
{ ID = 40125, B = true, Stats = { HitRating = 20 } }, -- Rigid Majestic Zircon


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 40129, R = true, B = true, Stats = { Strength = 10, Stamina = 15 } }, -- Sovereign Dreadstone
{ ID = 40130, R = true, B = true, Stats = { Agility = 10, Stamina = 15 } }, -- Shifting Dreadstone
{ ID = 40131, R = true, B = true, Stats = { Agility = 10, HitRating = 10 } }, -- Glinting Dreadstone
{ ID = 40132, R = true, B = true, Stats = { Intellect = 10, Stamina = 15 } }, -- Timeless Dreadstone
{ ID = 40133, R = true, B = true, Stats = { Intellect = 10, Spirit = 10 } }, -- Purified Dreadstone
{ ID = 40135, R = true, B = true, Stats = { Intellect = 10, SpellPenetration = 13 } }, -- Mysterious Dreadstone
{ ID = 40139, R = true, B = true, Stats = { ParryRating = 10, Stamina = 15 } }, -- Defender's Dreadstone
{ ID = 40141, R = true, B = true, Stats = { ExpertiseRating = 10, Stamina = 15 } }, -- Guardian's Dreadstone
{ ID = 40153, R = true, B = true, Stats = { SpellPower = 12, HitRating = 10 } }, -- Veiled Dreadstone
{ ID = 40162, R = true, B = true, Stats = { ExpertiseRating = 10, HitRating = 10 } }, -- Accurate Dreadstone


}


--========================================
-- Level 80 crafted meta gems
--========================================
PawnMetaGemData80Rare =
{


------------------------------------------------------------
-- Meta gems: Earthsiege
------------------------------------------------------------

{ ID = 41380, Stats = { Stamina = 32 } }, -- Austere Earthsiege Diamond (2% Increased Armor Value from Items)
{ ID = 41381, Stats = { CritRating = 21 } }, -- Persistent Earthsiege Diamond (Stun Duration Reduced by 10%)
{ ID = 41382, Stats = { Intellect = 21 } }, -- Trenchant Earthsiege Diamond (Stun Duration Reduced by 10%)
{ ID = 41385, Stats = { HasteRating = 21 } }, -- Invigorating Earthsiege Diamond (Sometimes Heal on Your Crits)
{ ID = 41389, Stats = { CritRating = 21 } }, -- Beaming Earthsiege Diamond (+2% Mana)
{ ID = 41395, Stats = { Intellect = 21 } }, -- Bracing Earthsiege Diamond (2% Reduced Threat)
{ ID = 41396, Stats = { DodgeRating = 21 } }, -- Eternal Earthsiege Diamond (+5% Shield Block Value)
{ ID = 41397, Stats = { Stamina = 32 } }, -- Powerful Earthsiege Diamond (Stun Duration Reduced by 10%)
{ ID = 41398, Stats = { Agility = 21 } }, -- Relentless Earthsiege Diamond (3% Increased Critical Damage)
{ ID = 41401, Stats = { Intellect = 21 } }, -- Insightful Earthsiege Diamond (Chance to restore mana on spellcast)


------------------------------------------------------------
-- Meta gems: Skyflare
------------------------------------------------------------

{ ID = 41285, Stats = { CritRating = 21 } }, -- Chaotic Skyflare Diamond (3% Increased Critical Damage)
{ ID = 41307, Stats = { CritRating = 25 } }, -- Destructive Skyflare Diamond (1% Spell Reflect)
{ ID = 41333, Stats = { Intellect = 21 } }, -- Ember Skyflare Diamond (+2% Intellect)
{ ID = 41335, Stats = { CritRating = 21 } }, -- Enigmatic Skyflare Diamond (Reduces Snare/Root Duration by 10%)
{ ID = 41339, Stats = { CritRating = 21 } }, -- Swift Skyflare Diamond (Minor Run Speed Increase)
{ ID = 41375, Stats = { Intellect = 21 } }, -- Tireless Skyflare Diamond (Minor Run Speed Increase)
{ ID = 41376, Stats = { Spirit = 22 } }, -- Revitalizing Skyflare Diamond (3% Increased Critical Healing Effect)
{ ID = 41377, Stats = { Stamina = 32 } }, -- Effulgent Skyflare Diamond (Reduce Spell Damage Taken by 2%)
{ ID = 41378, Stats = { Intellect = 21 } }, -- Forlorn Skyflare Diamond (Silence Duration Reduced by 10%)
{ ID = 41379, Stats = { CritRating = 21 } }, -- Impassive Skyflare Diamond (Fear Duration Reduced by 10%)
{ ID = 41400, Stats = {} }, -- Thundering Skyflare Diamond (Chance to Increase Melee/Ranged Attack Speed)


}


--========================================


PawnGemQualityLevels =
{
	{ 245, PawnGemData80Epic }, -- Trial of the Crusader 25 normal
	{ 200, PawnGemData80Rare }, -- Heroic dungeons and Naxx 10
	{ 165, PawnGemData80Uncommon }, -- Higher than any TBC gear
	{ 151, PawnGemData70Epic }, -- Tier 6 (T4 / Karazhan is 115; T5 is 133; T6 is 151; Sunwell is 154)
	{ 100, PawnGemData70Rare }, -- Lowest-level level 70 item; heroic dungeons
	{ 90, PawnGemData70Uncommon }, -- Zangarmarsh gear gets green gems
	{ 0, PawnGemData60Common }, -- Hellfire Peninsula gear gets white gems
}

PawnMetaGemQualityLevels =
{
	{ 200, PawnMetaGemData80Rare },
	{ 0, PawnMetaGemData70Rare },
}

PawnMinimumItemLevelToConsiderGems = 187

end -- if VgerCore.IsCataclysm
