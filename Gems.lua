-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2026 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.md for more information.
--
-- Gem information
------------------------------------------------------------


-- Gem table row format:
-- { ID, S, R, Y, B, [Item] }
-- ID: The gem's item ID
-- Stats: A table of stats that the gem gives
-- R: true if it's a red gem
-- Y: true if it's a yellow gem
-- B: true if it's a blue gem
-- Item: The cached item data for the gem, used by PawnGetGemData


local Pawn1StatGems =
{

-- Burning Crusade uncommon
{ ID = 23094, R = true, Y = true, B = true, Stats = { Intellect = 1 } }, -- Brilliant Blood Garnet
{ ID = 23095, R = true, Y = true, B = true, Stats = { Strength = 1 } }, -- Bold Blood Garnet
{ ID = 28595, R = true, Y = true, B = true, Stats = { Agility = 1 } }, -- Delicate Blood Garnet
{ ID = 23114, R = true, Y = true, B = true, Stats = { CritRating = 1 } }, -- Smooth Golden Draenite
{ ID = 23115, R = true, Y = true, B = true, Stats = { Stamina = 1 } }, -- Subtle Golden Draenite
{ ID = 23116, R = true, Y = true, B = true, Stats = { CritRating = 1 } }, -- Rigid Azure Moonstone
{ ID = 23119, R = true, Y = true, B = true, Stats = { Versatility = 1 } }, -- Sparkling Azure Moonstone

-- Wrath of the Lich King uncommon
{ ID = 39900, R = true, Y = true, B = true, Stats = { Strength = 1 } }, -- Bold Bloodstone
{ ID = 39905, R = true, Y = true, B = true, Stats = { Agility = 1 } }, -- Delicate Bloodstone
{ ID = 39910, R = true, Y = true, B = true, Stats = { HasteRating = 1 } }, -- Precise Bloodstone
{ ID = 39911, R = true, Y = true, B = true, Stats = { Intellect = 1 } }, -- Brilliant Bloodstone
{ ID = 39909, R = true, Y = true, B = true, Stats = { CritRating = 1 } }, -- Smooth Sun Crystal
{ ID = 39918, R = true, Y = true, B = true, Stats = { HasteRating = 1 } }, -- Quick Sun Crystal
{ ID = 39915, R = true, Y = true, B = true, Stats = { CritRating = 1 } }, -- Rigid Chalcedony
{ ID = 39919, R = true, Y = true, B = true, Stats = { Stamina = 1 } }, -- Solid Chalcedony
{ ID = 39920, R = true, Y = true, B = true, Stats = { Versatility = 1 } }, -- Sparkling Chalcedony

}


local Pawn2StatGems =
{

-- Burning Crusade rare
{ ID = 24027, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Living Ruby
{ ID = 24028, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Living Ruby
{ ID = 24030, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Living Ruby
{ ID = 24048, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Dawnstone
{ ID = 35315, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Dawnstone
{ ID = 24033, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Star of Elune
{ ID = 24035, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Star of Elune
{ ID = 24051, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Star of Elune

-- Wrath of the Lich King rare
{ ID = 39996, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Scarlet Ruby
{ ID = 39997, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Scarlet Ruby
{ ID = 39998, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Scarlet Ruby
{ ID = 40003, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Precise Scarlet Ruby
{ ID = 40002, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Autumn's Glow
{ ID = 40017, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Autumn's Glow
{ ID = 40008, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Sky Sapphire
{ ID = 40009, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Sky Sapphire
{ ID = 40014, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Sky Sapphire

-- Cataclysm uncommon
{ ID = 52081, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Carnelian
{ ID = 52082, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Carnelian
{ ID = 52084, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Carnelian
{ ID = 52085, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Precise Carnelian
{ ID = 52091, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Alicite
{ ID = 52093, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Alicite
{ ID = 52094, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Fractured Alicite
{ ID = 52086, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Zephyrite
{ ID = 52087, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Zephyrite
{ ID = 52089, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Zephyrite

-- Mists of Pandaria uncommon
{ ID = 76560, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Pandarian Garnet
{ ID = 76561, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Precise Pandarian Garnet
{ ID = 76562, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Pandarian Garnet
{ ID = 76564, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Pandarian Garnet
{ ID = 76565, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Sunstone
{ ID = 76567, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Sunstone
{ ID = 76568, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Fractured Sunstone
{ ID = 76502, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Lapis Lazuli
{ ID = 76505, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Lapis Lazuli
{ ID = 76506, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Lapis Lazuli

-- Warlords of Draenor uncommon
{ ID = 115803, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Critical Strike Taladite
{ ID = 115804, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Haste Taladite
{ ID = 115805, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Mastery Taladite
{ ID = 115807, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Versatility Taladite
{ ID = 115808, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Stamina Taladite

-- Cataclysm rare
{ ID = 52206, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Inferno Ruby
{ ID = 52207, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Inferno Ruby
{ ID = 52212, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Inferno Ruby
{ ID = 52230, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Precise Inferno Ruby
{ ID = 52219, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Fractured Amberjewel
{ ID = 52232, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Amberjewel
{ ID = 52241, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Amberjewel
{ ID = 52235, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Ocean Sapphire
{ ID = 52242, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Ocean Sapphire
{ ID = 52244, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Ocean Sapphire

-- Mists of Pandaria rare
{ ID = 76692, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Primordial Ruby
{ ID = 76693, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Precise Primordial Ruby
{ ID = 76694, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Primordial Ruby
{ ID = 76696, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Primordial Ruby
{ ID = 76697, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Sun's Radiance
{ ID = 76699, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Sun's Radiance
{ ID = 76700, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Fractured Sun's Radiance
{ ID = 76636, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid River's Heart
{ ID = 76638, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling River's Heart
{ ID = 76639, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid River's Heart

-- Warlords of Draenor rare
{ ID = 115809, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Greater Critical Strike Taladite
{ ID = 115811, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Greater Haste Taladite
{ ID = 115812, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Greater Mastery Taladite
{ ID = 115814, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Greater Versatility Taladite
{ ID = 115815, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Greater Stamina Taladite

}


local Pawn3StatGems =
{

-- Burning Crusade epic
{ ID = 32193, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Crimson Spinel
{ ID = 32194, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Crimson Spinel
{ ID = 32195, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Crimson Spinel
{ ID = 32205, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth Lionseye
{ ID = 35761, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Lionseye
{ ID = 32200, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid Empyrean Sapphire
{ ID = 32201, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling Empyrean Sapphire
{ ID = 32210, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid Empyrean Sapphire

-- Wrath of the Lich King epic
{ ID = 40111, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Cardinal Ruby
{ ID = 40112, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Cardinal Ruby
{ ID = 40113, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Cardinal Ruby
{ ID = 40118, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Precise Cardinal Ruby
{ ID = 40117, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth King's Amber
{ ID = 40128, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick King's Amber
{ ID = 40119, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid Majestic Zircon
{ ID = 40120, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling Majestic Zircon
{ ID = 40125, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid Majestic Zircon

-- Cataclysm epic
{ ID = 71879, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Queen's Garnet
{ ID = 71880, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Precise Queen's Garnet
{ ID = 71881, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Queen's Garnet
{ ID = 71883, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Queen's Garnet
{ ID = 71874, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth Lightstone
{ ID = 71876, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Lightstone
{ ID = 71877, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Fractured Lightstone
{ ID = 71817, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid Deepholm Iolite
{ ID = 71819, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling Deepholm Iolite
{ ID = 71820, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid Deepholm Iolite

-- Legion uncommon
{ ID = 130215, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Deadly Deep Amber
{ ID = 130216, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Azsunite
{ ID = 130217, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Versatile Skystone
{ ID = 130218, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Masterful Queen's Opal

-- Warlords of Draenor epic
{ ID = 127760, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Immaculate Critical Strike Taladite
{ ID = 127761, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Immaculate Haste Taladite
{ ID = 127762, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Immaculate Mastery Taladite
{ ID = 127764, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Immaculate Versatility Taladite
{ ID = 127765, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Immaculate Stamina Taladite

-- Battle for Azeroth uncommon
{ ID = 153710, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Deadly Solstone
{ ID = 153711, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Golden Beryl
{ ID = 153712, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Versatile Kyanite
{ ID = 153713, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Masterful Kubiline

-- Shadowlands uncommon
{ ID = 173121, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Deadly Jewel Doublet
{ ID = 173122, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Jewel Doublet
{ ID = 173124, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Masterful Jewel Doublet
{ ID = 173123, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Versatile Jewel Doublet

}


local Pawn4StatGems =
{

-- Legion rare
{ ID = 130219, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Deadly Eye of Prophecy
{ ID = 130220, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Quick Dawnlight
{ ID = 130221, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Versatile Maelstrom Sapphire
{ ID = 130222, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Masterful Shadowruby

-- Battle for Azeroth rare
{ ID = 154126, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Deadly Amberblaze
{ ID = 154127, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Quick Owlseye
{ ID = 154128, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Versatile Royal Quartz
{ ID = 154129, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Masterful Tidal Amethyst

-- Shadowlands rare
{ ID = 173127, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Deadly Jewel Cluster
{ ID = 173128, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Quick Jewel Cluster
{ ID = 173130, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Masterful Jewel Cluster
{ ID = 173129, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Versatile Jewel Cluster

}


local Pawn5StatGems =
{

-- Legion epic
{ ID = 151580, R = true, Y = true, B = true, Stats = { CritRating = 5 } }, -- Deadly Deep Chemirine
{ ID = 151583, R = true, Y = true, B = true, Stats = { HasteRating = 5 } }, -- Quick Lightsphene
{ ID = 151584, R = true, Y = true, B = true, Stats = { MasteryRating = 5 } }, -- Masterful Argulite
{ ID = 151585, R = true, Y = true, B = true, Stats = { Versatility = 5 } }, -- Versatile Labradorite

-- Battle for Azeroth epic
{ ID = 168639, R = true, Y = true, B = true, Stats = { CritRating = 5 } }, -- Deadly Lava Lazuli
{ ID = 168641, R = true, Y = true, B = true, Stats = { HasteRating = 5 } }, -- Quick Sand Spinel
{ ID = 168642, R = true, Y = true, B = true, Stats = { Versatility = 5 } }, -- Versatile Dark Opal
{ ID = 168640, R = true, Y = true, B = true, Stats = { MasteryRating = 5 } }, -- Masterful Sea Currant

}


local DragonIslesUncommonGems =
{

-- Dragonflight uncommon tier-3 quality
{ ID = 192902, R = true, Y = true, B = true, Stats = { CritRating = 2, HasteRating = 2 } }, -- Crafty Queen's Ruby
{ ID = 192905, R = true, Y = true, B = true, Stats = { Versatility = 2, MasteryRating = 2 } }, -- Zen Mystic Sapphire
{ ID = 192908, R = true, Y = true, B = true, Stats = { HasteRating = 2, Versatility = 2 } }, -- Energized Vibrant Emerald
{ ID = 192912, R = true, Y = true, B = true, Stats = { MasteryRating = 2, CritRating = 2 } }, -- Sensei's Sundered Onyx
{ ID = 192916, R = true, Y = true, B = true, Stats = { Stamina = 6 } }, -- Solid Eternity Amber

}


local DragonIslesRareGems =
{

-- Dragonflight rare tier-3 quality
{ ID = 192919, R = true, Y = true, B = true, Stats = { CritRating = 5, HasteRating = 2 } }, -- Crafty Alexstraszite
{ ID = 192922, R = true, Y = true, B = true, Stats = { CritRating = 5, MasteryRating = 2 } }, -- Sensei's Alexstraszite
{ ID = 192925, R = true, Y = true, B = true, Stats = { CritRating = 5, Versatility = 2 } }, -- Radiant Alexstraszite
{ ID = 192928, R = true, Y = true, B = true, Stats = { CritRating = 6 } }, -- Deadly Alexstraszite
{ ID = 192932, R = true, Y = true, B = true, Stats = { Versatility = 5, CritRating = 2 } }, -- Radiant Malygite
{ ID = 192935, R = true, Y = true, B = true, Stats = { Versatility = 5, HasteRating = 2 } }, -- Energized Malygite
{ ID = 192938, R = true, Y = true, B = true, Stats = { Versatility = 5, MasteryRating = 2 } }, -- Zen Malygite
{ ID = 192942, R = true, Y = true, B = true, Stats = { Versatility = 6 } }, -- Stormy Malygite
{ ID = 192945, R = true, Y = true, B = true, Stats = { HasteRating = 5, CritRating = 2 } }, -- Crafty Ysemerald
{ ID = 192948, R = true, Y = true, B = true, Stats = { HasteRating = 5, MasteryRating = 2 } }, -- Keen Ysemerald
{ ID = 192952, R = true, Y = true, B = true, Stats = { HasteRating = 5, Versatility = 2 } }, -- Energized Ysemerald
{ ID = 192955, R = true, Y = true, B = true, Stats = { HasteRating = 6 } }, -- Quick Ysemerald
{ ID = 192958, R = true, Y = true, B = true, Stats = { MasteryRating = 5, CritRating = 2 } }, -- Sensei's Neltharite
{ ID = 192961, R = true, Y = true, B = true, Stats = { MasteryRating = 5, HasteRating = 2 } }, -- Keen Neltharite
{ ID = 192964, R = true, Y = true, B = true, Stats = { MasteryRating = 5, Versatility = 2 } }, -- Zen Neltharite
{ ID = 192967, R = true, Y = true, B = true, Stats = { MasteryRating = 6 } }, -- Fractured Neltharite
{ ID = 192970, R = true, Y = true, B = true, Stats = { Stamina = 8, CritRating = 2 } }, -- Jagged Nozdorite
{ ID = 192973, R = true, Y = true, B = true, Stats = { Stamina = 8, HasteRating = 2 } }, -- Forceful Nozdorite
{ ID = 192976, R = true, Y = true, B = true, Stats = { Stamina = 8, MasteryRating = 2 } }, -- Puissant Nozdorite
{ ID = 192979, R = true, Y = true, B = true, Stats = { Stamina = 8, Versatility = 2 } }, -- Steady Nozdorite

}


local WarWithinGems =
{

-- The War Within tier-3 quality
{ ID = 213455, R = true, Y = true, B = true, Stats = { CritRating = 10, HasteRating = 3 } }, -- Quick Ruby
{ ID = 213458, R = true, Y = true, B = true, Stats = { CritRating = 10, MasteryRating = 3 } }, -- Masterful Ruby
{ ID = 213461, R = true, Y = true, B = true, Stats = { CritRating = 10, Versatility = 3 } }, -- Versatile Ruby
{ ID = 213464, R = true, Y = true, B = true, Stats = { CritRating = 12 } }, -- Deadly Ruby
{ ID = 213467, R = true, Y = true, B = true, Stats = { Versatility = 10, CritRating = 3 } }, -- Deadly Sapphire
{ ID = 213470, R = true, Y = true, B = true, Stats = { Versatility = 10, HasteRating = 3 } }, -- Quick Sapphire
{ ID = 213473, R = true, Y = true, B = true, Stats = { Versatility = 10, MasteryRating = 3 } }, -- Masterful Sapphire
{ ID = 213476, R = true, Y = true, B = true, Stats = { Versatility = 12 } }, -- Versatile Sapphire
{ ID = 213479, R = true, Y = true, B = true, Stats = { HasteRating = 10, CritRating = 3 } }, -- Deadly Emerald
{ ID = 213482, R = true, Y = true, B = true, Stats = { HasteRating = 10, MasteryRating = 3 } }, -- Masterful Emerald
{ ID = 213485, R = true, Y = true, B = true, Stats = { HasteRating = 10, Versatility = 3 } }, -- Versatile Emerald
{ ID = 213488, R = true, Y = true, B = true, Stats = { HasteRating = 12 } }, -- Quick Emerald
{ ID = 213491, R = true, Y = true, B = true, Stats = { MasteryRating = 10, CritRating = 3 } }, -- Deadly Onyx
{ ID = 213494, R = true, Y = true, B = true, Stats = { MasteryRating = 10, HasteRating = 3 } }, -- Quick Onyx
{ ID = 213497, R = true, Y = true, B = true, Stats = { MasteryRating = 10, Versatility = 3 } }, -- Versatile Onyx
{ ID = 213500, R = true, Y = true, B = true, Stats = { MasteryRating = 12 } }, -- Masterful Onyx
{ ID = 213503, R = true, Y = true, B = true, Stats = { Stamina = 10, CritRating = 3 } }, -- Deadly Amber
{ ID = 213506, R = true, Y = true, B = true, Stats = { Stamina = 10, HasteRating = 3 } }, -- Quick Amber
{ ID = 213509, R = true, Y = true, B = true, Stats = { Stamina = 10, MasteryRating = 3 } }, -- Masterful Amber
{ ID = 213512, R = true, Y = true, B = true, Stats = { Stamina = 10, Versatility = 3 } }, -- Versatile Amber
{ ID = 213517, R = true, Y = true, B = true, Stats = { Stamina = 18 } }, -- Solid Amber

}


local MidnightGems =
{

-- Midnight tier-2 (non-flawless) quality
{ ID = 240856, R = true, Y = true, B = true, Stats = { HasteRating = 9 } }, -- Quick Peridot
{ ID = 240858, R = true, Y = true, B = true, Stats = { HasteRating = 7, CritRating = 3 } }, -- Deadly Peridot
{ ID = 240860, R = true, Y = true, B = true, Stats = { HasteRating = 7, MasteryRating = 3 } }, -- Masterful Peridot
{ ID = 240862, R = true, Y = true, B = true, Stats = { HasteRating = 7, Versatility = 3 } }, -- Versatile Peridot
{ ID = 240864, R = true, Y = true, B = true, Stats = { MasteryRating = 9 } }, -- Masterful Amethyst
{ ID = 240866, R = true, Y = true, B = true, Stats = { MasteryRating = 7, CritRating = 3 } }, -- Deadly Amethyst
{ ID = 240868, R = true, Y = true, B = true, Stats = { MasteryRating = 7, HasteRating = 3 } }, -- Quick Amethyst
{ ID = 240870, R = true, Y = true, B = true, Stats = { MasteryRating = 7, Versatility = 3 } }, -- Versatile Amethyst
{ ID = 240872, R = true, Y = true, B = true, Stats = { CritRating = 9 } }, -- Deadly Garnet
{ ID = 240874, R = true, Y = true, B = true, Stats = { CritRating = 7, HasteRating = 3 } }, -- Quick Garnet
{ ID = 240876, R = true, Y = true, B = true, Stats = { CritRating = 7, MasteryRating = 3 } }, -- Masterful Garnet
{ ID = 240878, R = true, Y = true, B = true, Stats = { CritRating = 7, Versatility = 3 } }, -- Versatile Garnet
{ ID = 240880, R = true, Y = true, B = true, Stats = { Versatility = 9 } }, -- Versatile Lapis
{ ID = 240882, R = true, Y = true, B = true, Stats = { Versatility = 7, CritRating = 3 } }, -- Deadly Lapis
{ ID = 240884, R = true, Y = true, B = true, Stats = { Versatility = 7, HasteRating = 3 } }, -- Quick Lapis
{ ID = 240886, R = true, Y = true, B = true, Stats = { Versatility = 7, MasteryRating = 3 } }, -- Masterful Lapis

}


--========================================

-- The master list of all tables of Pawn gem data

-- Gem data metatable row format:
-- { MinItemLevel, GemData }
-- 	MinItemLevel: Minimum item level required to use that gem quality level (inclusive)
-- 	GemData: The table of gem data (as specified above)

-- The rows must be specified in descending MinItemLevel order, with the last row
-- in each table having MinItemLevel 0.

PawnGemQualityLevels =
{
	{ 233, MidnightGems }, -- Voidspire raid finder
	{ 83, WarWithinGems }, -- Nerub-ar Palace raid finder
	{ 80, DragonIslesRareGems },
	{ 70, DragonIslesUncommonGems }, -- Vault of the Incarnates raid finder and Dragon Isles dungeons
	{ 60, Pawn5StatGems },
	{ 50, Pawn4StatGems }, -- Shadowlands dungeons
	{ 45, Pawn3StatGems },
	{ 33, Pawn2StatGems }, -- Magister's Terrace
	{ 0, Pawn1StatGems },
}

PawnMetaGemQualityLevels = nil
PawnCogwheelQualityLevels = nil
PawnCrystalOfFearQualityLevels = nil

PawnMinimumItemLevelToConsiderGems = 83 -- Sockets on items below this ilvl are ignored by default
