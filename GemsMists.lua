-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2025 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Gem information (Mists of Pandaria Classic)
------------------------------------------------------------


if VgerCore.IsMists then


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
local PawnGemData70Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 23094, R = true, Stats = { Intellect = 6 } }, -- Brilliant Blood Garnet
{ ID = 23095, R = true, Stats = { Strength = 6 } }, -- Bold Blood Garnet
{ ID = 23097, R = true, Stats = { Agility = 6 } }, -- Delicate Blood Garnet


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
{ ID = 24030, R = true, Stats = { Intellect = 8 } }, -- Brilliant Living Ruby
{ ID = 24036, R = true, Stats = { ParryRating = 8 } }, -- Flashing Living Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 24058, R = true, Y = true, Stats = { CritRating = 4, Strength = 4 } }, -- Inscribed Noble Topaz
{ ID = 24059, R = true, Y = true, Stats = { CritRating = 4, Intellect = 4 } }, -- Potent Noble Topaz
{ ID = 24060, R = true, Y = true, Stats = { HasteRating = 4, Intellect = 4 } }, -- Reckless Noble Topaz
{ ID = 31868, R = true, Y = true, Stats = { CritRating = 4, Agility = 4 } }, -- Deadly Noble Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 24032, Y = true, Stats = { DodgeRating = 8 } }, -- Subtle Dawnstone
{ ID = 24048, Y = true, Stats = { CritRating = 8 } }, -- Smooth Dawnstone
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
{ ID = 32195, R = true, Stats = { Intellect = 10 } }, -- Brilliant Crimson Spinel
{ ID = 32199, R = true, Stats = { ParryRating = 10 } }, -- Flashing Crimson Spinel


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

{ ID = 32198, Y = true, Stats = { DodgeRating = 10 } }, -- Subtle Lionseye
{ ID = 32205, Y = true, Stats = { CritRating = 10 } }, -- Smooth Lionseye
{ ID = 32209, Y = true, Stats = { ResilienceRating = 10 } }, -- Mystic Lionseye
{ ID = 35761, Y = true, Stats = { HasteRating = 10 } }, -- Quick Lionseye


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 32223, Y = true, B = true, Stats = { DodgeRating = 5, Stamina = 7 } }, -- Regal Seaspray Emerald
{ ID = 32224, Y = true, B = true, Stats = { CritRating = 5, SpellPenetration = 6 } }, -- Radiant Seaspray Emerald
{ ID = 32226, Y = true, B = true, Stats = { CritRating = 5, Stamina = 7 } }, -- Jagged Seaspray Emerald
{ ID = 35758, Y = true, B = true, Stats = { ResilienceRating = 5, Stamina = 7 } }, -- Steady Seaspray Emerald
{ ID = 35759, Y = true, B = true, Stats = { HasteRating = 5, Stamina = 7 } }, -- Forceful Seaspray Emerald


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


------------------------------------------------------------
-- Meta gems: Earthstorm
------------------------------------------------------------

{ ID = 25896, Stats = { Stamina = 18 } }, -- Powerful Earthstorm Diamond
{ ID = 25897, Stats = { Intellect = 12 } }, -- Bracing Earthstorm Diamond
{ ID = 25898, Stats = { DodgeRating = 12 } }, -- Tenacious Earthstorm Diamond
{ ID = 25901, Stats = { Intellect = 12 } }, -- Insightful Earthstorm Diamond
{ ID = 32409, Stats = { Agility = 12 } }, -- Relentless Earthstorm Diamond

------------------------------------------------------------
-- Meta gems: Skyfire
------------------------------------------------------------

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

{ ID = 39946, R = true, Y = true, Stats = { Intellect = 6, HasteRating = 6 } }, -- Reckless Huge Citrine
{ ID = 39947, R = true, Y = true, Stats = { Strength = 6, CritRating = 6 } }, -- Inscribed Huge Citrine
{ ID = 39949, R = true, Y = true, Stats = { Strength = 6, DodgeRating = 6 } }, -- Champion's Huge Citrine
{ ID = 39950, R = true, Y = true, Stats = { Strength = 6, ResilienceRating = 6 } }, -- Resplendent Huge Citrine
{ ID = 39951, R = true, Y = true, Stats = { Strength = 6, HasteRating = 6 } }, -- Fierce Huge Citrine
{ ID = 39952, R = true, Y = true, Stats = { Agility = 6, CritRating = 6 } }, -- Deadly Huge Citrine
{ ID = 39954, R = true, Y = true, Stats = { Agility = 6, ResilienceRating = 6 } }, -- Lucent Huge Citrine
{ ID = 39955, R = true, Y = true, Stats = { Agility = 6, HasteRating = 6 } }, -- Deft Huge Citrine
{ ID = 39956, R = true, Y = true, Stats = { Intellect = 6, CritRating = 6 } }, -- Potent Huge Citrine
{ ID = 39958, R = true, Y = true, Stats = { Intellect = 6, ResilienceRating = 6 } }, -- Willful Huge Citrine
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

{ ID = 39933, Y = true, B = true, Stats = { CritRating = 6, Stamina = 9 } }, -- Jagged Dark Jade
{ ID = 39938, Y = true, B = true, Stats = { DodgeRating = 6, Stamina = 9 } }, -- Regal Dark Jade
{ ID = 39975, Y = true, B = true, Stats = { HitRating = 6, Stamina = 9 } }, -- Nimble Dark Jade
{ ID = 39977, Y = true, B = true, Stats = { ResilienceRating = 6, Stamina = 9 } }, -- Steady Dark Jade
{ ID = 39978, Y = true, B = true, Stats = { HasteRating = 6, Stamina = 9 } }, -- Forceful Dark Jade
{ ID = 39980, Y = true, B = true, Stats = { CritRating = 6, Spirit = 6 } }, -- Misty Dark Jade
{ ID = 39981, Y = true, B = true, Stats = { HitRating = 6, HasteRating = 6 } }, -- Lightning Dark Jade
{ ID = 39982, Y = true, B = true, Stats = { ResilienceRating = 6, Spirit = 6 } }, -- Turbid Dark Jade
{ ID = 39983, Y = true, B = true, Stats = { HasteRating = 6, Spirit = 6 } }, -- Energized Dark Jade
{ ID = 39990, Y = true, B = true, Stats = { CritRating = 6, SpellPenetration = 8 } }, -- Radiant Dark Jade
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
{ ID = 39939, R = true, B = true, Stats = { ParryRating = 6, Stamina = 9 } }, -- Defender's Shadow Crystal
{ ID = 39940, R = true, B = true, Stats = { ExpertiseRating = 6, Stamina = 9 } }, -- Guardian's Shadow Crystal
{ ID = 39941, R = true, B = true, Stats = { Intellect = 6, Spirit = 6 } }, -- Purified Shadow Crystal
{ ID = 39942, R = true, B = true, Stats = { Agility = 6, HitRating = 6 } }, -- Glinting Shadow Crystal
{ ID = 39945, R = true, B = true, Stats = { Intellect = 6, SpellPenetration = 8 } }, -- Mysterious Shadow Crystal
{ ID = 39948, R = true, B = true, Stats = { Strength = 6, HitRating = 6 } }, -- Etched Shadow Crystal
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
{ ID = 39998, R = true, Stats = { Intellect = 16 } }, -- Brilliant Scarlet Ruby
{ ID = 40001, R = true, Stats = { ParryRating = 16 } }, -- Flashing Scarlet Ruby
{ ID = 40003, R = true, Stats = { ExpertiseRating = 16 } }, -- Precise Scarlet Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 40037, R = true, Y = true, Stats = { Strength = 8, CritRating = 8 } }, -- Inscribed Monarch Topaz
{ ID = 40039, R = true, Y = true, Stats = { Strength = 8, DodgeRating = 8 } }, -- Champion's Monarch Topaz
{ ID = 40040, R = true, Y = true, Stats = { Strength = 8, ResilienceRating = 8 } }, -- Resplendent Monarch Topaz
{ ID = 40041, R = true, Y = true, Stats = { Strength = 8, HasteRating = 8 } }, -- Fierce Monarch Topaz
{ ID = 40043, R = true, Y = true, Stats = { Agility = 8, CritRating = 8 } }, -- Deadly Monarch Topaz
{ ID = 40045, R = true, Y = true, Stats = { Agility = 8, ResilienceRating = 8 } }, -- Lucent Monarch Topaz
{ ID = 40046, R = true, Y = true, Stats = { Agility = 8, HasteRating = 8 } }, -- Deft Monarch Topaz
{ ID = 40047, R = true, Y = true, Stats = { Intellect = 8, HasteRating = 8 } }, -- Reckless Monarch Topaz
{ ID = 40048, R = true, Y = true, Stats = { Intellect = 8, CritRating = 8 } }, -- Potent Monarch Topaz
{ ID = 40050, R = true, Y = true, Stats = { Intellect = 8, ResilienceRating = 8 } }, -- Willful Monarch Topaz
{ ID = 40056, R = true, Y = true, Stats = { DodgeRating = 8, ParryRating = 8 } }, -- Stalwart Monarch Topaz
{ ID = 40059, R = true, Y = true, Stats = { ExpertiseRating = 8, DodgeRating = 8 } }, -- Resolute Monarch Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 40000, Y = true, Stats = { DodgeRating = 16 } }, -- Subtle Autumn's Glow
{ ID = 40002, Y = true, Stats = { CritRating = 16 } }, -- Smooth Autumn's Glow
{ ID = 40016, Y = true, Stats = { ResilienceRating = 16 } }, -- Mystic Autumn's Glow
{ ID = 40017, Y = true, Stats = { HasteRating = 16 } }, -- Quick Autumn's Glow


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 40031, Y = true, B = true, Stats = { DodgeRating = 8, Stamina = 12 } }, -- Regal Forest Emerald
{ ID = 40086, Y = true, B = true, Stats = { CritRating = 8, Stamina = 12 } }, -- Jagged Forest Emerald
{ ID = 40088, Y = true, B = true, Stats = { HitRating = 8, DodgeRating = 8 } }, -- Nimble Forest Emerald
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
{ ID = 40024, R = true, B = true, Stats = { Agility = 8, HitRating = 8 } }, -- Glinting Twilight Opal
{ ID = 40025, R = true, B = true, Stats = { Intellect = 8, Stamina = 12 } }, -- Timeless Twilight Opal
{ ID = 40026, R = true, B = true, Stats = { Intellect = 8, Spirit = 8 } }, -- Purified Twilight Opal
{ ID = 40028, R = true, B = true, Stats = { Intellect = 8, SpellPenetration = 10 } }, -- Mysterious Twilight Opal
{ ID = 40032, R = true, B = true, Stats = { ParryRating = 8, Stamina = 12 } }, -- Defender's Twilight Opal
{ ID = 40034, R = true, B = true, Stats = { ExpertiseRating = 8, Stamina = 12 } }, -- Guardian's Twilight Opal
{ ID = 40038, R = true, B = true, Stats = { Strength = 8, HitRating = 8 } }, -- Etched Twilight Opal
{ ID = 40049, R = true, B = true, Stats = { Intellect = 8, HitRating = 8 } }, -- Veiled Twilight Opal
{ ID = 40058, R = true, B = true, Stats = { ExpertiseRating = 8, HitRating = 8 } }, -- Accurate Twilight Opal


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
{ ID = 40113, R = true, Stats = { Intellect = 20 } }, -- Brilliant Cardinal Ruby
{ ID = 40116, R = true, Stats = { ParryRating = 20 } }, -- Flashing Cardinal Ruby
{ ID = 40118, R = true, Stats = { ExpertiseRating = 20 } }, -- Precise Cardinal Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 40142, R = true, Y = true, Stats = { Strength = 10, CritRating = 10 } }, -- Inscribed Ametrine
{ ID = 40144, R = true, Y = true, Stats = { Strength = 10, DodgeRating = 10 } }, -- Champion's Ametrine
{ ID = 40145, R = true, Y = true, Stats = { Strength = 10, ResilienceRating = 10 } }, -- Resplendent Ametrine
{ ID = 40146, R = true, Y = true, Stats = { Strength = 10, HasteRating = 10 } }, -- Fierce Ametrine
{ ID = 40147, R = true, Y = true, Stats = { Agility = 10, CritRating = 10 } }, -- Deadly Ametrine
{ ID = 40149, R = true, Y = true, Stats = { Agility = 10, ResilienceRating = 10 } }, -- Lucent Ametrine
{ ID = 40150, R = true, Y = true, Stats = { Agility = 10, HasteRating = 10 } }, -- Deft Ametrine
{ ID = 40152, R = true, Y = true, Stats = { Intellect = 10, CritRating = 10 } }, -- Potent Ametrine
{ ID = 40154, R = true, Y = true, Stats = { Intellect = 10, ResilienceRating = 10 } }, -- Willful Ametrine
{ ID = 40155, R = true, Y = true, Stats = { Intellect = 10, HasteRating = 10 } }, -- Reckless Ametrine
{ ID = 40160, R = true, Y = true, Stats = { DodgeRating = 10, ParryRating = 10 } }, -- Stalwart Ametrine
{ ID = 40163, R = true, Y = true, Stats = { ExpertiseRating = 10, DodgeRating = 10 } }, -- Resolute Ametrine


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 40115, Y = true, Stats = { DodgeRating = 20 } }, -- Subtle King's Amber
{ ID = 40117, Y = true, Stats = { CritRating = 20 } }, -- Smooth King's Amber
{ ID = 40127, Y = true, Stats = { ResilienceRating = 20 } }, -- Mystic King's Amber
{ ID = 40128, Y = true, Stats = { HasteRating = 20 } }, -- Quick King's Amber


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 40138, Y = true, B = true, Stats = { DodgeRating = 10, Stamina = 15 } }, -- Regal Eye of Zul
{ ID = 40165, Y = true, B = true, Stats = { CritRating = 10, Stamina = 15 } }, -- Jagged Eye of Zul
{ ID = 40166, Y = true, B = true, Stats = { HitRating = 10, DodgeRating = 15 } }, -- Nimble Eye of Zul
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
{ ID = 40143, R = true, B = true, Stats = { Strength = 10, HitRating = 10 } }, -- Etched Dreadstone
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


}


--========================================
-- Colored level 85 uncommon-quality gems
--========================================
PawnGemData85Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 52081, R = true, Stats = { Strength = 30 } }, -- Bold Carnelian
{ ID = 52082, R = true, Stats = { Agility = 30 } }, -- Delicate Carnelian
{ ID = 52083, R = true, Stats = { ParryRating = 30 } }, -- Flashing Carnelian
{ ID = 52084, R = true, Stats = { Intellect = 30 } }, -- Brilliant Carnelian
{ ID = 52085, R = true, Stats = { ExpertiseRating = 30 } }, -- Precise Carnelian


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 52106, R = true, Y = true, Stats = { DodgeRating = 15, Agility = 15 } }, -- Polished Hessonite
{ ID = 52107, R = true, Y = true, Stats = { ExpertiseRating = 15, DodgeRating = 15 } }, -- Resolute Hessonite
{ ID = 52108, R = true, Y = true, Stats = { Strength = 15, CritRating = 15 } }, -- Inscribed Hessonite
{ ID = 52109, R = true, Y = true, Stats = { CritRating = 15, Agility = 15 } }, -- Deadly Hessonite
{ ID = 52110, R = true, Y = true, Stats = { Intellect = 15, CritRating = 15 } }, -- Potent Hessonite
{ ID = 52111, R = true, Y = true, Stats = { Strength = 15, HasteRating = 15 } }, -- Fierce Hessonite
{ ID = 52112, R = true, Y = true, Stats = { HasteRating = 15, Agility = 15 } }, -- Deft Hessonite
{ ID = 52113, R = true, Y = true, Stats = { Intellect = 15, HasteRating = 15 } }, -- Reckless Hessonite
{ ID = 52114, R = true, Y = true, Stats = { Strength = 15, MasteryRating = 15 } }, -- Skillful Hessonite
{ ID = 52115, R = true, Y = true, Stats = { MasteryRating = 15, Agility = 15 } }, -- Adept Hessonite
{ ID = 52116, R = true, Y = true, Stats = { MasteryRating = 15, ParryRating = 15 } }, -- Fine Hessonite
{ ID = 52117, R = true, Y = true, Stats = { Intellect = 15, MasteryRating = 15 } }, -- Artful Hessonite
{ ID = 52118, R = true, Y = true, Stats = { ExpertiseRating = 15, MasteryRating = 15 } }, -- Keen Hessonite


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 52090, Y = true, Stats = { DodgeRating = 30 } }, -- Subtle Alicite
{ ID = 52091, Y = true, Stats = { CritRating = 30 } }, -- Smooth Alicite
{ ID = 52092, Y = true, Stats = { ResilienceRating = 30 } }, -- Mystic Alicite
{ ID = 52093, Y = true, Stats = { HasteRating = 30 } }, -- Quick Alicite
{ ID = 52094, Y = true, Stats = { MasteryRating = 30 } }, -- Fractured Alicite


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 52119, Y = true, B = true, Stats = { DodgeRating = 15, Stamina = 23 } }, -- Regal Jasper
{ ID = 52120, Y = true, B = true, Stats = { DodgeRating = 15, HitRating = 15 } }, -- Nimble Jasper
{ ID = 52121, Y = true, B = true, Stats = { CritRating = 15, Stamina = 23 } }, -- Jagged Jasper
{ ID = 52122, Y = true, B = true, Stats = { CritRating = 15, HitRating = 15 } }, -- Piercing Jasper
{ ID = 52123, Y = true, B = true, Stats = { Stamina = 23, ResilienceRating = 15 } }, -- Steady Jasper
{ ID = 52124, Y = true, B = true, Stats = { HasteRating = 15, Stamina = 23 } }, -- Forceful Jasper
{ ID = 52125, Y = true, B = true, Stats = { HasteRating = 15, HitRating = 15 } }, -- Lightning Jasper
{ ID = 52126, Y = true, B = true, Stats = { Stamina = 23, MasteryRating = 15 } }, -- Puissant Jasper
{ ID = 52127, Y = true, B = true, Stats = { Spirit = 15, MasteryRating = 15 } }, -- Zen Jasper
{ ID = 52128, Y = true, B = true, Stats = { HitRating = 15, MasteryRating = 15 } }, -- Sensei's Jasper


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 52086, B = true, Stats = { Stamina = 45 } }, -- Solid Zephyrite
{ ID = 52087, B = true, Stats = { Spirit = 30 } }, -- Sparkling Zephyrite
{ ID = 52088, B = true, Stats = { SpellPenetration = 30 } }, -- Stormy Zephyrite
{ ID = 52089, B = true, Stats = { HitRating = 30 } }, -- Rigid Zephyrite


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 52095, R = true, B = true, Stats = { Strength = 15, Stamina = 23 } }, -- Sovereign Nightstone
{ ID = 52096, R = true, B = true, Stats = { Agility = 15, Stamina = 23 } }, -- Shifting Nightstone
{ ID = 52097, R = true, B = true, Stats = { ParryRating = 15, Stamina = 23 } }, -- Defender's Nightstone
{ ID = 52098, R = true, B = true, Stats = { Intellect = 15, Stamina = 23 } }, -- Timeless Nightstone
{ ID = 52099, R = true, B = true, Stats = { ExpertiseRating = 15, Stamina = 23 } }, -- Guardian's Nightstone
{ ID = 52100, R = true, B = true, Stats = { Intellect = 15, Spirit = 15 } }, -- Purified Nightstone
{ ID = 52101, R = true, B = true, Stats = { Strength = 15, HitRating = 15 } }, -- Etched Nightstone
{ ID = 52102, R = true, B = true, Stats = { Agility = 15, HitRating = 15 } }, -- Glinting Nightstone
{ ID = 52103, R = true, B = true, Stats = { ParryRating = 15, HitRating = 15 } }, -- Retaliating Nightstone
{ ID = 52104, R = true, B = true, Stats = { Intellect = 15, HitRating = 15 } }, -- Veiled Nightstone
{ ID = 52105, R = true, B = true, Stats = { ExpertiseRating = 15, HitRating = 15 } }, -- Accurate Nightstone


}


--========================================
-- Colored level 85 rare-quality gems
--========================================
PawnGemData85Rare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 52206, R = true, Stats = { Strength = 40 } }, -- Bold Inferno Ruby
{ ID = 52207, R = true, Stats = { Intellect = 40 } }, -- Brilliant Inferno Ruby
{ ID = 52212, R = true, Stats = { Agility = 40 } }, -- Delicate Inferno Ruby
{ ID = 52216, R = true, Stats = { ParryRating = 40 } }, -- Flashing Inferno Ruby
{ ID = 52230, R = true, Stats = { ExpertiseRating = 40 } }, -- Precise Inferno Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 52204, R = true, Y = true, Stats = { MasteryRating = 20, Agility = 20 } }, -- Adept Ember Topaz
{ ID = 52205, R = true, Y = true, Stats = { Intellect = 20, MasteryRating = 20 } }, -- Artful Ember Topaz
{ ID = 52208, R = true, Y = true, Stats = { Intellect = 20, HasteRating = 20 } }, -- Reckless Ember Topaz
{ ID = 52209, R = true, Y = true, Stats = { CritRating = 20, Agility = 20 } }, -- Deadly Ember Topaz
{ ID = 52211, R = true, Y = true, Stats = { HasteRating = 20, Agility = 20 } }, -- Deft Ember Topaz
{ ID = 52214, R = true, Y = true, Stats = { Strength = 20, HasteRating = 20 } }, -- Fierce Ember Topaz
{ ID = 52215, R = true, Y = true, Stats = { MasteryRating = 20, ParryRating = 20 } }, -- Fine Ember Topaz
{ ID = 52222, R = true, Y = true, Stats = { Strength = 20, CritRating = 20 } }, -- Inscribed Ember Topaz
{ ID = 52224, R = true, Y = true, Stats = { ExpertiseRating = 20, MasteryRating = 20 } }, -- Keen Ember Topaz
{ ID = 52229, R = true, Y = true, Stats = { DodgeRating = 20, Agility = 20 } }, -- Polished Ember Topaz
{ ID = 52239, R = true, Y = true, Stats = { Intellect = 20, CritRating = 20 } }, -- Potent Ember Topaz
{ ID = 52240, R = true, Y = true, Stats = { Strength = 20, MasteryRating = 20 } }, -- Skillful Ember Topaz
{ ID = 52249, R = true, Y = true, Stats = { ExpertiseRating = 20, DodgeRating = 20 } }, -- Resolute Ember Topaz
{ ID = 68356, R = true, Y = true, Stats = { Intellect = 20, ResilienceRating = 20 } }, -- Willful Ember Topaz
{ ID = 68357, R = true, Y = true, Stats = { ResilienceRating = 20, Agility = 20 } }, -- Lucent Ember Topaz
{ ID = 68358, R = true, Y = true, Stats = { Strength = 20, ResilienceRating = 20 } }, -- Resplendent Ember Topaz


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 52219, Y = true, Stats = { MasteryRating = 40 } }, -- Fractured Amberjewel
{ ID = 52226, Y = true, Stats = { ResilienceRating = 40 } }, -- Mystic Amberjewel
{ ID = 52232, Y = true, Stats = { HasteRating = 40 } }, -- Quick Amberjewel
{ ID = 52241, Y = true, Stats = { CritRating = 40 } }, -- Smooth Amberjewel
{ ID = 52247, Y = true, Stats = { DodgeRating = 40 } }, -- Subtle Amberjewel


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 52218, Y = true, B = true, Stats = { HasteRating = 20, Stamina = 30 } }, -- Forceful Dream Emerald
{ ID = 52223, Y = true, B = true, Stats = { CritRating = 20, Stamina = 30 } }, -- Jagged Dream Emerald
{ ID = 52225, Y = true, B = true, Stats = { HasteRating = 20, HitRating = 20 } }, -- Lightning Dream Emerald
{ ID = 52227, Y = true, B = true, Stats = { DodgeRating = 20, HitRating = 20 } }, -- Nimble Dream Emerald
{ ID = 52228, Y = true, B = true, Stats = { CritRating = 20, HitRating = 20 } }, -- Piercing Dream Emerald
{ ID = 52231, Y = true, B = true, Stats = { Stamina = 30, MasteryRating = 20 } }, -- Puissant Dream Emerald
{ ID = 52233, Y = true, B = true, Stats = { DodgeRating = 20, Stamina = 30 } }, -- Regal Dream Emerald
{ ID = 52237, Y = true, B = true, Stats = { HitRating = 20, MasteryRating = 20 } }, -- Sensei's Dream Emerald
{ ID = 52245, Y = true, B = true, Stats = { Stamina = 30, ResilienceRating = 20 } }, -- Steady Dream Emerald
{ ID = 52250, Y = true, B = true, Stats = { Spirit = 20, MasteryRating = 20 } }, -- Zen Dream Emerald


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 52235, B = true, Stats = { HitRating = 40 } }, -- Rigid Ocean Sapphire
{ ID = 52242, B = true, Stats = { Stamina = 60 } }, -- Solid Ocean Sapphire
{ ID = 52244, B = true, Stats = { Spirit = 40 } }, -- Sparkling Ocean Sapphire
{ ID = 52246, B = true, Stats = { SpellPenetration = 40 } }, -- Stormy Ocean Sapphire


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 52203, R = true, B = true, Stats = { ExpertiseRating = 20, HitRating = 20 } }, -- Accurate Demonseye
{ ID = 52210, R = true, B = true, Stats = { Stamina = 30, ParryRating = 20 } }, -- Defender's Demonseye
{ ID = 52213, R = true, B = true, Stats = { Strength = 20, HitRating = 20 } }, -- Etched Demonseye
{ ID = 52217, R = true, B = true, Stats = { Intellect = 20, HitRating = 20 } }, -- Veiled Demonseye
{ ID = 52220, R = true, B = true, Stats = { HitRating = 20, Agility = 20 } }, -- Glinting Demonseye
{ ID = 52221, R = true, B = true, Stats = { ExpertiseRating = 20, Stamina = 30 } }, -- Guardian's Demonseye
{ ID = 52234, R = true, B = true, Stats = { HitRating = 20, ParryRating = 20 } }, -- Retaliating Demonseye
{ ID = 52236, R = true, B = true, Stats = { Intellect = 20, Spirit = 20 } }, -- Purified Demonseye
{ ID = 52238, R = true, B = true, Stats = { Stamina = 30, Agility = 20 } }, -- Shifting Demonseye
{ ID = 52243, R = true, B = true, Stats = { Strength = 20, Stamina = 30 } }, -- Sovereign Demonseye
{ ID = 52248, R = true, B = true, Stats = { Intellect = 20, Stamina = 30 } }, -- Timeless Demonseye


}


--========================================
-- Colored level 85 epic-quality gems
--========================================
PawnGemData85Epic =
{

------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 71879, R = true, Stats = { Agility = 50 } }, -- Delicate Queen's Garnet
{ ID = 71880, R = true, Stats = { ExpertiseRating = 50 } }, -- Precise Queen's Garnet
{ ID = 71881, R = true, Stats = { Intellect = 50 } }, -- Brilliant Queen's Garnet
{ ID = 71882, R = true, Stats = { ParryRating = 50 } }, -- Flashing Queen's Garnet
{ ID = 71883, R = true, Stats = { Strength = 50 } }, -- Bold Queen's Garnet


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 71840, R = true, Y = true, Stats = { CritRating = 25, Agility = 25 } }, -- Deadly Lava Coral
{ ID = 71841, R = true, Y = true, Stats = { ExpertiseRating = 25, CritRating = 25 } }, -- Crafty Lava Coral
{ ID = 71842, R = true, Y = true, Stats = { Intellect = 25, CritRating = 25 } }, -- Potent Lava Coral
{ ID = 71843, R = true, Y = true, Stats = { Strength = 25, CritRating = 25 } }, -- Inscribed Lava Coral
{ ID = 71844, R = true, Y = true, Stats = { DodgeRating = 25, Agility = 25 } }, -- Polished Lava Coral
{ ID = 71845, R = true, Y = true, Stats = { ExpertiseRating = 25, DodgeRating = 25 } }, -- Resolute Lava Coral
{ ID = 71846, R = true, Y = true, Stats = { DodgeRating = 25, ParryRating = 25 } }, -- Stalwart Lava Coral
{ ID = 71847, R = true, Y = true, Stats = { Strength = 25, DodgeRating = 25 } }, -- Champion's Lava Coral
{ ID = 71848, R = true, Y = true, Stats = { HasteRating = 25, Agility = 25 } }, -- Deft Lava Coral
{ ID = 71849, R = true, Y = true, Stats = { ExpertiseRating = 25, HasteRating = 25 } }, -- Wicked Lava Coral
{ ID = 71850, R = true, Y = true, Stats = { Intellect = 25, HasteRating = 25 } }, -- Reckless Lava Coral
{ ID = 71851, R = true, Y = true, Stats = { Strength = 25, HasteRating = 25 } }, -- Fierce Lava Coral
{ ID = 71852, R = true, Y = true, Stats = { MasteryRating = 25, Agility = 25 } }, -- Adept Lava Coral
{ ID = 71853, R = true, Y = true, Stats = { ExpertiseRating = 25, MasteryRating = 25 } }, -- Keen Lava Coral
{ ID = 71854, R = true, Y = true, Stats = { Intellect = 25, MasteryRating = 25 } }, -- Artful Lava Coral
{ ID = 71855, R = true, Y = true, Stats = { MasteryRating = 25, ParryRating = 25 } }, -- Fine Lava Coral
{ ID = 71856, R = true, Y = true, Stats = { Strength = 25, MasteryRating = 25 } }, -- Skillful Lava Coral
{ ID = 71857, R = true, Y = true, Stats = { ResilienceRating = 25, Agility = 25 } }, -- Lucent Lava Coral
{ ID = 71858, R = true, Y = true, Stats = { ExpertiseRating = 25, ResilienceRating = 25 } }, -- Tenuous Lava Coral
{ ID = 71859, R = true, Y = true, Stats = { Intellect = 25, ResilienceRating = 25 } }, -- Willful Lava Coral
{ ID = 71860, R = true, Y = true, Stats = { ResilienceRating = 25, ParryRating = 25 } }, -- Splendid Lava Coral
{ ID = 71861, R = true, Y = true, Stats = { Strength = 25, ResilienceRating = 25 } }, -- Resplendent Lava Coral


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 71874, Y = true, Stats = { CritRating = 50 } }, -- Smooth Lightstone
{ ID = 71875, Y = true, Stats = { DodgeRating = 50 } }, -- Subtle Lightstone
{ ID = 71876, Y = true, Stats = { HasteRating = 50 } }, -- Quick Lightstone
{ ID = 71877, Y = true, Stats = { MasteryRating = 50 } }, -- Fractured Lightstone
{ ID = 71878, Y = true, Stats = { ResilienceRating = 50 } }, -- Mystic Lightstone


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 71822, Y = true, B = true, Stats = { Spirit = 25, CritRating = 25 } }, -- Misty Elven Peridot
{ ID = 71823, Y = true, B = true, Stats = { CritRating = 25, HitRating = 25 } }, -- Piercing Elven Peridot
{ ID = 71824, Y = true, B = true, Stats = { HasteRating = 25, HitRating = 25 } }, -- Lightning Elven Peridot
{ ID = 71825, Y = true, B = true, Stats = { HitRating = 25, MasteryRating = 25 } }, -- Sensei's Elven Peridot
{ ID = 71826, Y = true, B = true, Stats = { SpellPenetration = 25, MasteryRating = 25 } }, -- Infused Elven Peridot
{ ID = 71827, Y = true, B = true, Stats = { Spirit = 25, MasteryRating = 25 } }, -- Zen Elven Peridot
{ ID = 71828, Y = true, B = true, Stats = { HitRating = 25, ResilienceRating = 25 } }, -- Balanced Elven Peridot
{ ID = 71829, Y = true, B = true, Stats = { SpellPenetration = 25, ResilienceRating = 25 } }, -- Vivid Elven Peridot
{ ID = 71830, Y = true, B = true, Stats = { Spirit = 25, ResilienceRating = 25 } }, -- Turbid Elven Peridot
{ ID = 71831, Y = true, B = true, Stats = { CritRating = 25, SpellPenetration = 25 } }, -- Radiant Elven Peridot
{ ID = 71832, Y = true, B = true, Stats = { HasteRating = 25, SpellPenetration = 25 } }, -- Shattered Elven Peridot
{ ID = 71833, Y = true, B = true, Stats = { HasteRating = 25, Spirit = 25 } }, -- Energized Elven Peridot
{ ID = 71834, Y = true, B = true, Stats = { CritRating = 25, Stamina = 37 } }, -- Jagged Elven Peridot
{ ID = 71835, Y = true, B = true, Stats = { DodgeRating = 25, Stamina = 37 } }, -- Regal Elven Peridot
{ ID = 71836, Y = true, B = true, Stats = { HasteRating = 25, Stamina = 37 } }, -- Forceful Elven Peridot
{ ID = 71837, Y = true, B = true, Stats = { HitRating = 25, DodgeRating = 25 } }, -- Nimble Elven Peridot
{ ID = 71838, Y = true, B = true, Stats = { Stamina = 37, MasteryRating = 25 } }, -- Puissant Elven Peridot
{ ID = 71839, Y = true, B = true, Stats = { Stamina = 37, ResilienceRating = 25 } }, -- Steady Elven Peridot


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 71817, B = true, Stats = { HitRating = 50 } }, -- Rigid Deepholm Iolite
{ ID = 71820, B = true, Stats = { Stamina = 75 } }, -- Solid Deepholm Iolite
{ ID = 71819, B = true, Stats = { Spirit = 50 } }, -- Sparkling Deepholm Iolite
{ ID = 71818, B = true, Stats = { SpellPenetration = 50 } }, -- Stormy Deepholm Iolite


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 71862, R = true, B = true, Stats = { HitRating = 25, Agility = 25 } }, -- Glinting Shadow Spinel
{ ID = 71863, R = true, B = true, Stats = { ExpertiseRating = 25, HitRating = 25 } }, -- Accurate Shadow Spinel
{ ID = 71864, R = true, B = true, Stats = { Intellect = 25, HitRating = 25 } }, -- Veiled Shadow Spinel
{ ID = 71865, R = true, B = true, Stats = { HitRating = 25, ParryRating = 25 } }, -- Retaliating Shadow Spinel
{ ID = 71866, R = true, B = true, Stats = { Strength = 25, HitRating = 25 } }, -- Etched Shadow Spinel
{ ID = 71867, R = true, B = true, Stats = { Intellect = 25, SpellPenetration = 25 } }, -- Mysterious Shadow Spinel
{ ID = 71868, R = true, B = true, Stats = { Intellect = 25, Spirit = 25 } }, -- Purified Shadow Spinel
{ ID = 71869, R = true, B = true, Stats = { Stamina = 37, Agility = 25 } }, -- Shifting Shadow Spinel
{ ID = 71870, R = true, B = true, Stats = { ExpertiseRating = 25, Stamina = 37 } }, -- Guardian's Shadow Spinel
{ ID = 71871, R = true, B = true, Stats = { Intellect = 25, Stamina = 37 } }, -- Timeless Shadow Spinel
{ ID = 71872, R = true, B = true, Stats = { Stamina = 37, ParryRating = 25 } }, -- Defender's Shadow Spinel
{ ID = 71873, R = true, B = true, Stats = { Strength = 25, Stamina = 37 } }, -- Sovereign Shadow Spinel

}


--========================================
-- Level 85 rare-quality cogwheels
--========================================
PawnCogwheelData85Rare =
{


------------------------------------------------------------
-- Cogwheels
------------------------------------------------------------

{ ID = 59477, Stats = { DodgeRating = 208 } }, -- Subtle Cogwheel
{ ID = 59478, Stats = { CritRating = 208 } }, -- Smooth Cogwheel
{ ID = 59479, Stats = { HasteRating = 208 } }, -- Quick Cogwheel
{ ID = 59480, Stats = { MasteryRating = 208 } }, -- Fractured Cogwheel
{ ID = 59489, Stats = { ExpertiseRating = 208 } }, -- Precise Cogwheel
{ ID = 59491, Stats = { ParryRating = 208 } }, -- Flashing Cogwheel
{ ID = 59493, Stats = { HitRating = 208 } }, -- Rigid Cogwheel
{ ID = 59496, Stats = { Spirit = 208 } }, -- Sparkling Cogwheel
{ ID = 68660, Stats = { ResilienceRating = 208 } }, -- Mystic Cogwheel


}


--========================================
-- Level 85 crafted meta gems
--========================================
PawnMetaGemData85Rare =
{


------------------------------------------------------------
-- Meta gems: Shadowspirit
------------------------------------------------------------

{ ID = 52289, Stats = { MasteryRating = 54 } }, -- Fleet Shadowspirit Diamond
{ ID = 52291, Stats = { CritRating = 54 } }, -- Chaotic Shadowspirit Diamond
{ ID = 52292, Stats = { Intellect = 54 } }, -- Bracing Shadowspirit Diamond
{ ID = 52293, Stats = { Stamina = 81 } }, -- Eternal Shadowspirit Diamond
{ ID = 52294, Stats = { Stamina = 81 } }, -- Austere Shadowspirit Diamond
{ ID = 52295, Stats = { Stamina = 81 } }, -- Effulgent Shadowspirit Diamond
{ ID = 52296, Stats = { Intellect = 54 } }, -- Ember Shadowspirit Diamond
{ ID = 52297, Stats = { Spirit = 54 } }, -- Revitalizing Shadowspirit Diamond
{ ID = 52298, Stats = { CritRating = 54 } }, -- Destructive Shadowspirit Diamond
{ ID = 52299, Stats = { Stamina = 81 } }, -- Powerful Shadowspirit Diamond
{ ID = 52300, Stats = { CritRating = 54 } }, -- Enigmatic Shadowspirit Diamond
{ ID = 52301, Stats = { CritRating = 54 } }, -- Impassive Shadowspirit Diamond
{ ID = 52302, Stats = { Intellect = 54 } }, -- Forlorn Shadowspirit Diamond
{ ID = 68778, Stats = { Agility = 54 } }, -- Agile Shadowspirit Diamond
{ ID = 68779, Stats = { Strength = 54 } }, -- Reverberating Shadowspirit Diamond
{ ID = 68780, Stats = { Intellect = 54 } }, -- Burning Shadowspirit Diamond


}


--========================================
-- Colored level 90 uncommon-quality gems
--========================================
local PawnGemData90Uncommon =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 76560, R = true, Stats = { Agility = 120 } }, -- Delicate Pandarian Garnet
{ ID = 76561, R = true, Stats = { ExpertiseRating = 240 } }, -- Precise Pandarian Garnet
{ ID = 76562, R = true, Stats = { Intellect = 120 } }, -- Brilliant Pandarian Garnet
{ ID = 76563, R = true, Stats = { ParryRating = 240 } }, -- Flashing Pandarian Garnet
{ ID = 76564, R = true, Stats = { Strength = 120 } }, -- Bold Pandarian Garnet


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 76526, R = true, Y = true, Stats = { CritRating = 120, Agility = 60 } }, -- Deadly Tiger Opal
{ ID = 76527, R = true, Y = true, Stats = { ExpertiseRating = 120, CritRating = 120 } }, -- Crafty Tiger Opal
{ ID = 76528, R = true, Y = true, Stats = { Intellect = 60, CritRating = 120 } }, -- Potent Tiger Opal
{ ID = 76529, R = true, Y = true, Stats = { Strength = 60, CritRating = 120 } }, -- Inscribed Tiger Opal
{ ID = 76530, R = true, Y = true, Stats = { DodgeRating = 120, Agility = 60 } }, -- Polished Tiger Opal
{ ID = 76531, R = true, Y = true, Stats = { ExpertiseRating = 120, DodgeRating = 120 } }, -- Resolute Tiger Opal
{ ID = 76532, R = true, Y = true, Stats = { DodgeRating = 120, ParryRating = 120 } }, -- Stalwart Tiger Opal
{ ID = 76533, R = true, Y = true, Stats = { Strength = 60, DodgeRating = 120 } }, -- Champion's Tiger Opal
{ ID = 76534, R = true, Y = true, Stats = { HasteRating = 120, Agility = 60 } }, -- Deft Tiger Opal
{ ID = 76535, R = true, Y = true, Stats = { ExpertiseRating = 120, HasteRating = 120 } }, -- Wicked Tiger Opal
{ ID = 76536, R = true, Y = true, Stats = { Intellect = 60, HasteRating = 120 } }, -- Reckless Tiger Opal
{ ID = 76537, R = true, Y = true, Stats = { Strength = 60, HasteRating = 120 } }, -- Fierce Tiger Opal
{ ID = 76538, R = true, Y = true, Stats = { MasteryRating = 120, Agility = 60 } }, -- Adept Tiger Opal
{ ID = 76539, R = true, Y = true, Stats = { ExpertiseRating = 120, MasteryRating = 120 } }, -- Keen Tiger Opal
{ ID = 76540, R = true, Y = true, Stats = { Intellect = 60, MasteryRating = 120 } }, -- Artful Tiger Opal
{ ID = 76541, R = true, Y = true, Stats = { MasteryRating = 120, ParryRating = 120 } }, -- Fine Tiger Opal
{ ID = 76542, R = true, Y = true, Stats = { Strength = 60, MasteryRating = 120 } }, -- Skillful Tiger Opal
{ ID = 76543, R = true, Y = true, Stats = { ResilienceRating = 60, Agility = 60 } }, -- Lucent Tiger Opal
{ ID = 76544, R = true, Y = true, Stats = { ExpertiseRating = 120, ResilienceRating = 60 } }, -- Tenuous Tiger Opal
{ ID = 76545, R = true, Y = true, Stats = { Intellect = 60, ResilienceRating = 60 } }, -- Willful Tiger Opal
{ ID = 76546, R = true, Y = true, Stats = { ResilienceRating = 60, ParryRating = 120 } }, -- Splendid Tiger Opal
{ ID = 76547, R = true, Y = true, Stats = { Strength = 60, ResilienceRating = 60 } }, -- Resplendent Tiger Opal


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 76565, Y = true, Stats = { CritRating = 240 } }, -- Smooth Sunstone
{ ID = 76566, Y = true, Stats = { DodgeRating = 240 } }, -- Subtle Sunstone
{ ID = 76567, Y = true, Stats = { HasteRating = 240 } }, -- Quick Sunstone
{ ID = 76568, Y = true, Stats = { MasteryRating = 240 } }, -- Fractured Sunstone
{ ID = 76569, Y = true, Stats = { ResilienceRating = 120 } }, -- Mystic Sunstone


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 76507, Y = true, B = true, Stats = { Spirit = 120, CritRating = 120 } }, -- Misty Alexandrite
{ ID = 76508, Y = true, B = true, Stats = { CritRating = 120, HitRating = 120 } }, -- Piercing Alexandrite
{ ID = 76509, Y = true, B = true, Stats = { HasteRating = 120, HitRating = 120 } }, -- Lightning Alexandrite
{ ID = 76510, Y = true, B = true, Stats = { HitRating = 120, MasteryRating = 120 } }, -- Sensei's Alexandrite
{ ID = 76511, Y = true, B = true, Stats = { SpellPenetration = 60, MasteryRating = 120 } }, -- Effulgent Alexandrite
{ ID = 76512, Y = true, B = true, Stats = { Spirit = 120, MasteryRating = 120 } }, -- Zen Alexandrite
{ ID = 76513, Y = true, B = true, Stats = { HitRating = 120, ResilienceRating = 60 } }, -- Balanced Alexandrite
{ ID = 76514, Y = true, B = true, Stats = { SpellPenetration = 60, ResilienceRating = 60 } }, -- Vivid Alexandrite
{ ID = 76515, Y = true, B = true, Stats = { Spirit = 120, ResilienceRating = 60 } }, -- Turbid Alexandrite
{ ID = 76517, Y = true, B = true, Stats = { CritRating = 120, SpellPenetration = 60 } }, -- Radiant Alexandrite
{ ID = 76518, Y = true, B = true, Stats = { HasteRating = 120, SpellPenetration = 60 } }, -- Shattered Alexandrite
{ ID = 76519, Y = true, B = true, Stats = { HasteRating = 120, Spirit = 120 } }, -- Energized Alexandrite
{ ID = 76520, Y = true, B = true, Stats = { CritRating = 120, Stamina = 90 } }, -- Jagged Alexandrite
{ ID = 76521, Y = true, B = true, Stats = { DodgeRating = 120, Stamina = 90 } }, -- Regal Alexandrite
{ ID = 76522, Y = true, B = true, Stats = { HasteRating = 120, Stamina = 90 } }, -- Forceful Alexandrite
{ ID = 76523, Y = true, B = true, Stats = { HitRating = 120, Stamina = 90 } }, -- Nimble Alexandrite
{ ID = 76524, Y = true, B = true, Stats = { Stamina = 90, MasteryRating = 120 } }, -- Puissant Alexandrite
{ ID = 76525, Y = true, B = true, Stats = { Stamina = 90, ResilienceRating = 60 } }, -- Steady Alexandrite


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 76502, B = true, Stats = { HitRating = 240 } }, -- Rigid Lapis Lazuli
{ ID = 76504, B = true, Stats = { SpellPenetration = 120 } }, -- Stormy Lapis Lazuli
{ ID = 76505, B = true, Stats = { Spirit = 240 } }, -- Sparkling Lapis Lazuli
{ ID = 76506, B = true, Stats = { Stamina = 180 } }, -- Solid Lapis Lazuli


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 76548, R = true, B = true, Stats = { HitRating = 120, Agility = 60 } }, -- Glinting Roguestone
{ ID = 76549, R = true, B = true, Stats = { ExpertiseRating = 120, HitRating = 120 } }, -- Accurate Roguestone
{ ID = 76550, R = true, B = true, Stats = { Intellect = 60, HitRating = 120 } }, -- Veiled Roguestone
{ ID = 76551, R = true, B = true, Stats = { HitRating = 120, ParryRating = 120 } }, -- Retaliating Roguestone
{ ID = 76552, R = true, B = true, Stats = { Strength = 60, HitRating = 120 } }, -- Etched Roguestone
{ ID = 76553, R = true, B = true, Stats = { Intellect = 60, SpellPenetration = 60 } }, -- Mysterious Roguestone
{ ID = 76554, R = true, B = true, Stats = { Intellect = 60, Spirit = 120 } }, -- Purified Roguestone
{ ID = 76555, R = true, B = true, Stats = { Stamina = 90, Agility = 60 } }, -- Shifting Roguestone
{ ID = 76556, R = true, B = true, Stats = { ExpertiseRating = 120, Stamina = 90 } }, -- Guardian's Roguestone
{ ID = 76557, R = true, B = true, Stats = { Intellect = 60, Stamina = 90 } }, -- Timeless Roguestone
{ ID = 76558, R = true, B = true, Stats = { Stamina = 90, ParryRating = 120 } }, -- Defender's Roguestone
{ ID = 76559, R = true, B = true, Stats = { Strength = 60, Stamina = 90 } }, -- Sovereign Roguestone
{ ID = 89675, R = true, B = true, Stats = { Strength = 60, SpellPenetration = 60 } }, -- Tense Roguestone
{ ID = 89678, R = true, B = true, Stats = { Agility = 60, SpellPenetration = 60 } }, -- Assassin's Roguestone


}


--========================================
-- Colored level 90 rare-quality gems
--========================================
local PawnGemData90Rare =
{


------------------------------------------------------------
-- Red gems
------------------------------------------------------------

{ ID = 76692, R = true, Stats = { Agility = 160 } }, -- Delicate Primordial Ruby
{ ID = 76693, R = true, Stats = { ExpertiseRating = 320 } }, -- Precise Primordial Ruby
{ ID = 76694, R = true, Stats = { Intellect = 160 } }, -- Brilliant Primordial Ruby
{ ID = 76695, R = true, Stats = { ParryRating = 320 } }, -- Flashing Primordial Ruby
{ ID = 76696, R = true, Stats = { Strength = 160 } }, -- Bold Primordial Ruby


------------------------------------------------------------
-- Orange gems
------------------------------------------------------------

{ ID = 76658, R = true, Y = true, Stats = { CritRating = 160, Agility = 80 } }, -- Deadly Vermilion Onyx
{ ID = 76659, R = true, Y = true, Stats = { ExpertiseRating = 160, CritRating = 160 } }, -- Crafty Vermilion Onyx
{ ID = 76660, R = true, Y = true, Stats = { Intellect = 80, CritRating = 160 } }, -- Potent Vermilion Onyx
{ ID = 76661, R = true, Y = true, Stats = { Strength = 80, CritRating = 160 } }, -- Inscribed Vermilion Onyx
{ ID = 76662, R = true, Y = true, Stats = { DodgeRating = 160, Agility = 80 } }, -- Polished Vermilion Onyx
{ ID = 76663, R = true, Y = true, Stats = { ExpertiseRating = 160, DodgeRating = 160 } }, -- Resolute Vermilion Onyx
{ ID = 76664, R = true, Y = true, Stats = { DodgeRating = 160, ParryRating = 160 } }, -- Stalwart Vermilion Onyx
{ ID = 76665, R = true, Y = true, Stats = { Strength = 80, DodgeRating = 160 } }, -- Champion's Vermilion Onyx
{ ID = 76666, R = true, Y = true, Stats = { HasteRating = 160, Agility = 80 } }, -- Deft Vermilion Onyx
{ ID = 76667, R = true, Y = true, Stats = { ExpertiseRating = 160, HasteRating = 160 } }, -- Wicked Vermilion Onyx
{ ID = 76668, R = true, Y = true, Stats = { Intellect = 80, HasteRating = 160 } }, -- Reckless Vermilion Onyx
{ ID = 76669, R = true, Y = true, Stats = { Strength = 80, HasteRating = 160 } }, -- Fierce Vermilion Onyx
{ ID = 76670, R = true, Y = true, Stats = { MasteryRating = 160, Agility = 80 } }, -- Adept Vermilion Onyx
{ ID = 76671, R = true, Y = true, Stats = { ExpertiseRating = 160, MasteryRating = 160 } }, -- Keen Vermilion Onyx
{ ID = 76672, R = true, Y = true, Stats = { Intellect = 80, MasteryRating = 160 } }, -- Artful Vermilion Onyx
{ ID = 76673, R = true, Y = true, Stats = { MasteryRating = 160, ParryRating = 160 } }, -- Fine Vermilion Onyx
{ ID = 76674, R = true, Y = true, Stats = { Strength = 80, MasteryRating = 160 } }, -- Skillful Vermilion Onyx
{ ID = 76675, R = true, Y = true, Stats = { ResilienceRating = 80, Agility = 80 } }, -- Lucent Vermilion Onyx
{ ID = 76676, R = true, Y = true, Stats = { ExpertiseRating = 160, ResilienceRating = 80 } }, -- Tenuous Vermilion Onyx
{ ID = 76677, R = true, Y = true, Stats = { Intellect = 80, ResilienceRating = 80 } }, -- Willful Vermilion Onyx
{ ID = 76678, R = true, Y = true, Stats = { ResilienceRating = 80, ParryRating = 160 } }, -- Splendid Vermilion Onyx
{ ID = 76679, R = true, Y = true, Stats = { Strength = 80, ResilienceRating = 80 } }, -- Resplendent Vermilion Onyx


------------------------------------------------------------
-- Yellow gems
------------------------------------------------------------

{ ID = 76697, Y = true, Stats = { CritRating = 320 } }, -- Smooth Sun's Radiance
{ ID = 76698, Y = true, Stats = { DodgeRating = 320 } }, -- Subtle Sun's Radiance
{ ID = 76699, Y = true, Stats = { HasteRating = 320 } }, -- Quick Sun's Radiance
{ ID = 76700, Y = true, Stats = { MasteryRating = 320 } }, -- Fractured Sun's Radiance
{ ID = 76701, Y = true, Stats = { ResilienceRating = 160 } }, -- Mystic Sun's Radiance


------------------------------------------------------------
-- Green gems
------------------------------------------------------------

{ ID = 76640, Y = true, B = true, Stats = { Spirit = 160, CritRating = 160 } }, -- Misty Wild Jade
{ ID = 76641, Y = true, B = true, Stats = { CritRating = 160, HitRating = 160 } }, -- Piercing Wild Jade
{ ID = 76642, Y = true, B = true, Stats = { HasteRating = 160, HitRating = 160 } }, -- Lightning Wild Jade
{ ID = 76643, Y = true, B = true, Stats = { HitRating = 160, MasteryRating = 160 } }, -- Sensei's Wild Jade
{ ID = 76644, Y = true, B = true, Stats = { SpellPenetration = 80, MasteryRating = 160 } }, -- Effulgent Wild Jade
{ ID = 76645, Y = true, B = true, Stats = { Spirit = 160, MasteryRating = 160 } }, -- Zen Wild Jade
{ ID = 76646, Y = true, B = true, Stats = { HitRating = 160, ResilienceRating = 80 } }, -- Balanced Wild Jade
{ ID = 76647, Y = true, B = true, Stats = { SpellPenetration = 80, ResilienceRating = 80 } }, -- Vivid Wild Jade
{ ID = 76648, Y = true, B = true, Stats = { Spirit = 160, ResilienceRating = 80 } }, -- Turbid Wild Jade
{ ID = 76649, Y = true, B = true, Stats = { CritRating = 160, SpellPenetration = 80 } }, -- Radiant Wild Jade
{ ID = 76650, Y = true, B = true, Stats = { HasteRating = 160, SpellPenetration = 80 } }, -- Shattered Wild Jade
{ ID = 76651, Y = true, B = true, Stats = { HasteRating = 160, Spirit = 160 } }, -- Energized Wild Jade
{ ID = 76652, Y = true, B = true, Stats = { CritRating = 160, Stamina = 120 } }, -- Jagged Wild Jade
{ ID = 76653, Y = true, B = true, Stats = { DodgeRating = 160, Stamina = 120 } }, -- Regal Wild Jade
{ ID = 76654, Y = true, B = true, Stats = { HasteRating = 160, Stamina = 120 } }, -- Forceful Wild Jade
{ ID = 76655, Y = true, B = true, Stats = { HitRating = 160, Stamina = 120 } }, -- Nimble Wild Jade
{ ID = 76656, Y = true, B = true, Stats = { Stamina = 120, MasteryRating = 160 } }, -- Puissant Wild Jade
{ ID = 76657, Y = true, B = true, Stats = { Stamina = 120, ResilienceRating = 80 } }, -- Steady Wild Jade


------------------------------------------------------------
-- Blue gems
------------------------------------------------------------

{ ID = 76636, B = true, Stats = { HitRating = 320 } }, -- Rigid River's Heart
{ ID = 76637, B = true, Stats = { SpellPenetration = 160 } }, -- Stormy River's Heart
{ ID = 76638, B = true, Stats = { Spirit = 320 } }, -- Sparkling River's Heart
{ ID = 76639, B = true, Stats = { Stamina = 240 } }, -- Solid River's Heart


------------------------------------------------------------
-- Purple gems
------------------------------------------------------------

{ ID = 76680, R = true, B = true, Stats = { HitRating = 160, Agility = 80 } }, -- Glinting Imperial Amethyst
{ ID = 76681, R = true, B = true, Stats = { ExpertiseRating = 160, HitRating = 160 } }, -- Accurate Imperial Amethyst
{ ID = 76682, R = true, B = true, Stats = { Intellect = 80, HitRating = 160 } }, -- Veiled Imperial Amethyst
{ ID = 76683, R = true, B = true, Stats = { HitRating = 160, ParryRating = 160 } }, -- Retaliating Imperial Amethyst
{ ID = 76684, R = true, B = true, Stats = { Strength = 80, HitRating = 160 } }, -- Etched Imperial Amethyst
{ ID = 76685, R = true, B = true, Stats = { Intellect = 80, SpellPenetration = 80 } }, -- Mysterious Imperial Amethyst
{ ID = 76686, R = true, B = true, Stats = { Intellect = 80, Spirit = 160 } }, -- Purified Imperial Amethyst
{ ID = 76687, R = true, B = true, Stats = { Stamina = 120, Agility = 80 } }, -- Shifting Imperial Amethyst
{ ID = 76688, R = true, B = true, Stats = { ExpertiseRating = 160, Stamina = 120 } }, -- Guardian's Imperial Amethyst
{ ID = 76689, R = true, B = true, Stats = { Intellect = 80, Stamina = 120 } }, -- Timeless Imperial Amethyst
{ ID = 76690, R = true, B = true, Stats = { Stamina = 120, ParryRating = 160 } }, -- Defender's Imperial Amethyst
{ ID = 76691, R = true, B = true, Stats = { Strength = 80, Stamina = 120 } }, -- Sovereign Imperial Amethyst
{ ID = 89674, R = true, B = true, Stats = { Strength = 80, SpellPenetration = 80 } }, -- Tense Imperial Amethyst


}


--========================================
-- Level 90 rare-quality cogwheels
--========================================
local PawnCogwheelData90Rare =
{


------------------------------------------------------------
-- Cogwheels
------------------------------------------------------------

{ ID = 77540, Stats = { DodgeRating = 567 } }, -- Subtle Tinker's Gear
{ ID = 77541, Stats = { CritRating = 567 } }, -- Smooth Tinker's Gear
{ ID = 77542, Stats = { HasteRating = 567 } }, -- Quick Tinker's Gear
{ ID = 77543, Stats = { ExpertiseRating = 567 } }, -- Precise Tinker's Gear
{ ID = 77544, Stats = { ParryRating = 567 } }, -- Flashing Tinker's Gear
{ ID = 77545, Stats = { HitRating = 567 } }, -- Rigid Tinker's Gear
{ ID = 77546, Stats = { Spirit = 567 } }, -- Sparkling Tinker's Gear
{ ID = 77547, Stats = { MasteryRating = 567 } }, -- Fractured Tinker's Gear


}


--========================================
-- Level 90 legendary-quality crystals of fear
--========================================
local PawnCrystalOfFearData90Legendary =
{


------------------------------------------------------------
-- Crystals of Fear
------------------------------------------------------------

{ ID = 89873, Stats = { Agility = 500 } }, -- Crystallized Dread
{ ID = 89881, Stats = { Strength = 500 } }, -- Crystallized Terror
{ ID = 89882, Stats = { Intellect = 500 } }, -- Crystallized Horror


}


--========================================
-- Level 90 crafted meta gems
--========================================
local PawnMetaGemData90Rare =
{


------------------------------------------------------------
-- Meta gems: Primal
------------------------------------------------------------

{ ID = 76879, Stats = { Intellect = 216, MetaSocketEffect = 1 } }, -- Ember Primal Diamond
{ ID = 76884, Stats = { MetaSocketEffect = 1, Agility = 216 } }, -- Agile Primal Diamond
{ ID = 76885, Stats = { Intellect = 216, MetaSocketEffect = 1 } }, -- Burning Primal Diamond
{ ID = 76886, Stats = { Strength = 216, MetaSocketEffect = 1 } }, -- Reverberating Primal Diamond
{ ID = 76887, Stats = { MetaSocketEffect = 1, MasteryRating = 432 } }, -- Fleet Primal Diamond
{ ID = 76888, Stats = { Spirit = 432, MetaSocketEffect = 1 } }, -- Revitalizing Primal Diamond
{ ID = 76890, Stats = { CritRating = 432, MetaSocketEffect = 1 } }, -- Destructive Primal Diamond
{ ID = 76891, Stats = { Stamina = 324, MetaSocketEffect = 1 } }, -- Powerful Primal Diamond
{ ID = 76892, Stats = { CritRating = 432, MetaSocketEffect = 1 } }, -- Enigmatic Primal Diamond
{ ID = 76893, Stats = { CritRating = 432, MetaSocketEffect = 1 } }, -- Impassive Primal Diamond
{ ID = 76894, Stats = { Intellect = 216, MetaSocketEffect = 1 } }, -- Forlorn Primal Diamond
{ ID = 76895, Stats = { Stamina = 324, MetaSocketEffect = 1 } }, -- Austere Primal Diamond
{ ID = 76896, Stats = { DodgeRating = 432, MetaSocketEffect = 1 } }, -- Eternal Primal Diamond
{ ID = 76897, Stats = { Stamina = 324, MetaSocketEffect = 1 } }, -- Effulgent Primal Diamond


}


--========================================


PawnGemQualityLevels =
{
	{ 463, PawnGemData90Rare }, -- Mists of Pandaria heroics
	{ 417, PawnGemData90Uncommon }, -- Actual gem requirement
	{ 397, PawnGemData85Epic }, -- Dragon Soul Normal gear
	{ 346, PawnGemData85Rare }, -- Level 85 heroic gear
	{ 315, PawnGemData85Uncommon }, -- Level 81 dungeons
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
	{ 417, PawnMetaGemData90Rare },
	{ 346, PawnMetaGemData85Rare },
	{ 200, PawnMetaGemData80Rare },
	{ 0, PawnMetaGemData70Rare },
}

PawnCogwheelQualityLevels =
{
	{ 417, PawnCogwheelData90Rare }, -- Actual gem requirement; Ghost Iron Dragonling is 450
	{ 0, PawnCogwheelData85Rare }, -- Bio-Optic Killshades
}

PawnCrystalOfFearQualityLevels =
{
	{ 0, PawnCrystalOfFearData90Legendary }, -- Kri'tak
}

PawnMinimumItemLevelToConsiderGems = 346 -- 346 during pre-patch; 417 at launch

end -- if VgerCore.IsMists
