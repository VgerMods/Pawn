-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Gem information
------------------------------------------------------------


if VgerCore.IsMainline then


-- Gem table row format:
-- { ID, S, R, Y, B, [Item] }
-- ID: The gem's item ID
-- Stats: A table of stats that the gem gives
-- R: true if it's a red gem
-- Y: true if it's a yellow gem
-- B: true if it's a blue gem
-- Item: The cached item data for the gem, used by PawnGetGemData


local PawnGemData1 =
{

-- No ilvl requirement
{ ID = 23094, R = true, Y = true, B = true, Stats = { Intellect = 1 } }, -- Brilliant Blood Garnet
{ ID = 23095, R = true, Y = true, B = true, Stats = { Strength = 1 } }, -- Bold Blood Garnet
{ ID = 28595, R = true, Y = true, B = true, Stats = { Agility = 1 } }, -- Delicate Blood Garnet
{ ID = 23114, R = true, Y = true, B = true, Stats = { CritRating = 1 } }, -- Smooth Golden Draenite
{ ID = 23115, R = true, Y = true, B = true, Stats = { Stamina = 1 } }, -- Subtle Golden Draenite
{ ID = 23116, R = true, Y = true, B = true, Stats = { CritRating = 1 } }, -- Rigid Azure Moonstone
{ ID = 23119, R = true, Y = true, B = true, Stats = { Versatility = 1 } }, -- Sparkling Azure Moonstone

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


local PawnGemData2 =
{

-- No ilvl requirement
{ ID = 24027, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Living Ruby
{ ID = 24028, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Living Ruby
{ ID = 24030, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Living Ruby
{ ID = 24048, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Dawnstone
{ ID = 35315, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Dawnstone
{ ID = 24033, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Star of Elune
{ ID = 24035, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Star of Elune
{ ID = 24051, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Star of Elune

{ ID = 39996, R = true, Y = true, B = true, Stats = { Strength = 2 } }, -- Bold Scarlet Ruby
{ ID = 39997, R = true, Y = true, B = true, Stats = { Agility = 2 } }, -- Delicate Scarlet Ruby
{ ID = 39998, R = true, Y = true, B = true, Stats = { Intellect = 2 } }, -- Brilliant Scarlet Ruby
{ ID = 40003, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Precise Scarlet Ruby
{ ID = 40002, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Smooth Autumn's Glow
{ ID = 40017, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Quick Autumn's Glow
{ ID = 40008, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Solid Sky Sapphire
{ ID = 40009, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Sparkling Sky Sapphire
{ ID = 40014, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Rigid Sky Sapphire

-- Requires ilvl 35
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

-- Requires ilvl 38
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

-- Requires ilvl 44
{ ID = 115803, R = true, Y = true, B = true, Stats = { CritRating = 2 } }, -- Critical Strike Taladite
{ ID = 115804, R = true, Y = true, B = true, Stats = { HasteRating = 2 } }, -- Haste Taladite
{ ID = 115805, R = true, Y = true, B = true, Stats = { MasteryRating = 2 } }, -- Mastery Taladite
{ ID = 115807, R = true, Y = true, B = true, Stats = { Versatility = 2 } }, -- Versatility Taladite
{ ID = 115808, R = true, Y = true, B = true, Stats = { Stamina = 2 } }, -- Stamina Taladite

}


local PawnGemData3 =
{

-- No ilvl requirement
{ ID = 32193, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Crimson Spinel
{ ID = 32194, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Crimson Spinel
{ ID = 32195, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Crimson Spinel
{ ID = 32205, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth Lionseye
{ ID = 35761, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Lionseye
{ ID = 32200, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid Empyrean Sapphire
{ ID = 32201, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling Empyrean Sapphire
{ ID = 32210, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid Empyrean Sapphire

{ ID = 40111, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Cardinal Ruby
{ ID = 40112, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Cardinal Ruby
{ ID = 40113, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Cardinal Ruby
{ ID = 40118, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Precise Cardinal Ruby
{ ID = 40117, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth King's Amber
{ ID = 40128, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick King's Amber
{ ID = 40119, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid Majestic Zircon
{ ID = 40120, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling Majestic Zircon
{ ID = 40125, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid Majestic Zircon

-- Requires ilvl 35
{ ID = 52206, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Inferno Ruby
{ ID = 52207, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Inferno Ruby
{ ID = 52212, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Inferno Ruby
{ ID = 52230, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Precise Inferno Ruby
{ ID = 52219, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Fractured Amberjewel
{ ID = 52232, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Amberjewel
{ ID = 52241, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth Amberjewel
{ ID = 52235, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid Ocean Sapphire
{ ID = 52242, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid Ocean Sapphire
{ ID = 52244, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling Ocean Sapphire

-- Requires ilvl 38
{ ID = 76692, R = true, Y = true, B = true, Stats = { Agility = 3 } }, -- Delicate Primordial Ruby
{ ID = 76693, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Precise Primordial Ruby
{ ID = 76694, R = true, Y = true, B = true, Stats = { Intellect = 3 } }, -- Brilliant Primordial Ruby
{ ID = 76696, R = true, Y = true, B = true, Stats = { Strength = 3 } }, -- Bold Primordial Ruby
{ ID = 76697, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Smooth Sun's Radiance
{ ID = 76699, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Quick Sun's Radiance
{ ID = 76700, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Fractured Sun's Radiance
{ ID = 76636, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Rigid River's Heart
{ ID = 76638, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Sparkling River's Heart
{ ID = 76639, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Solid River's Heart

-- Requires ilvl 44
{ ID = 115809, R = true, Y = true, B = true, Stats = { CritRating = 3 } }, -- Greater Critical Strike Taladite
{ ID = 115811, R = true, Y = true, B = true, Stats = { HasteRating = 3 } }, -- Greater Haste Taladite
{ ID = 115812, R = true, Y = true, B = true, Stats = { MasteryRating = 3 } }, -- Greater Mastery Taladite
{ ID = 115814, R = true, Y = true, B = true, Stats = { Versatility = 3 } }, -- Greater Versatility Taladite
{ ID = 115815, R = true, Y = true, B = true, Stats = { Stamina = 3 } }, -- Greater Stamina Taladite

}


local PawnGemData4 =
{

-- Requires ilvl 36
{ ID = 71879, R = true, Y = true, B = true, Stats = { Agility = 4 } }, -- Delicate Queen's Garnet
{ ID = 71880, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Precise Queen's Garnet
{ ID = 71881, R = true, Y = true, B = true, Stats = { Intellect = 4 } }, -- Brilliant Queen's Garnet
{ ID = 71883, R = true, Y = true, B = true, Stats = { Strength = 4 } }, -- Bold Queen's Garnet
{ ID = 71874, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Smooth Lightstone
{ ID = 71876, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Quick Lightstone
{ ID = 71877, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Fractured Lightstone
{ ID = 71817, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Rigid Deepholm Iolite
{ ID = 71819, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Sparkling Deepholm Iolite
{ ID = 71820, R = true, Y = true, B = true, Stats = { Stamina = 4 } }, -- Solid Deepholm Iolite

-- Requires ilvl 44
{ ID = 130215, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Deadly Deep Amber
{ ID = 130216, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Quick Azsunite
{ ID = 130217, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Versatile Skystone
{ ID = 130218, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Masterful Queen's Opal

{ ID = 127760, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Immaculate Critical Strike Taladite
{ ID = 127761, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Immaculate Haste Taladite
{ ID = 127762, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Immaculate Mastery Taladite
{ ID = 127764, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Immaculate Versatility Taladite
{ ID = 127765, R = true, Y = true, B = true, Stats = { Stamina = 4 } }, -- Immaculate Stamina Taladite

-- Requires ilvl 50
{ ID = 153710, R = true, Y = true, B = true, Stats = { CritRating = 4 } }, -- Deadly Solstone
{ ID = 153711, R = true, Y = true, B = true, Stats = { HasteRating = 4 } }, -- Quick Golden Beryl
{ ID = 153712, R = true, Y = true, B = true, Stats = { Versatility = 4 } }, -- Versatile Kyanite
{ ID = 153713, R = true, Y = true, B = true, Stats = { MasteryRating = 4 } }, -- Masterful Kubiline

}


local PawnGemData6 =
{

-- Requires ilvl 44
{ ID = 130219, R = true, Y = true, B = true, Stats = { CritRating = 6 } }, -- Deadly Eye of Prophecy
{ ID = 130220, R = true, Y = true, B = true, Stats = { HasteRating = 6 } }, -- Quick Dawnlight
{ ID = 130221, R = true, Y = true, B = true, Stats = { Versatility = 6 } }, -- Versatile Maelstrom Sapphire
{ ID = 130222, R = true, Y = true, B = true, Stats = { MasteryRating = 6 } }, -- Masterful Shadowruby

-- Requires ilvl 50
{ ID = 154126, R = true, Y = true, B = true, Stats = { CritRating = 6 } }, -- Deadly Amberblaze
{ ID = 154127, R = true, Y = true, B = true, Stats = { HasteRating = 6 } }, -- Quick Owlseye
{ ID = 154128, R = true, Y = true, B = true, Stats = { Versatility = 6 } }, -- Versatile Royal Quartz
{ ID = 154129, R = true, Y = true, B = true, Stats = { MasteryRating = 6 } }, -- Masterful Tidal Amethyst

}


local PawnGemData7 =
{

-- Requires ilvl 44
{ ID = 151580, R = true, Y = true, B = true, Stats = { CritRating = 7 } }, -- Deadly Deep Chemirine
{ ID = 151583, R = true, Y = true, B = true, Stats = { HasteRating = 7 } }, -- Quick Lightsphene
{ ID = 151584, R = true, Y = true, B = true, Stats = { MasteryRating = 7 } }, -- Masterful Argulite
{ ID = 151585, R = true, Y = true, B = true, Stats = { Versatility = 7 } }, -- Versatile Labradorite

-- Requires ilvl 50
{ ID = 168639, R = true, Y = true, B = true, Stats = { CritRating = 7 } }, -- Deadly Lava Lazuli
{ ID = 168641, R = true, Y = true, B = true, Stats = { HasteRating = 7 } }, -- Quick Sand Spinel
{ ID = 168642, R = true, Y = true, B = true, Stats = { Versatility = 7 } }, -- Versatile Dark Opal
{ ID = 168640, R = true, Y = true, B = true, Stats = { MasteryRating = 7 } }, -- Masterful Sea Currant

}


local PawnGemData12 =
{

-- No ilvl requirement
{ ID = 173121, R = true, Y = true, B = true, Stats = { CritRating = 12 } }, -- Deadly Jewel Doublet
{ ID = 173122, R = true, Y = true, B = true, Stats = { HasteRating = 12 } }, -- Quick Jewel Doublet
{ ID = 173124, R = true, Y = true, B = true, Stats = { MasteryRating = 12 } }, -- Masterful Jewel Doublet
{ ID = 173123, R = true, Y = true, B = true, Stats = { Versatility = 12 } }, -- Versatile Jewel Doublet

}


local PawnGemData16 =
{

-- No ilvl requirement
{ ID = 173127, R = true, Y = true, B = true, Stats = { CritRating = 16 } }, -- Deadly Jewel Cluster
{ ID = 173128, R = true, Y = true, B = true, Stats = { HasteRating = 16 } }, -- Quick Jewel Cluster
{ ID = 173130, R = true, Y = true, B = true, Stats = { MasteryRating = 16 } }, -- Masterful Jewel Cluster
{ ID = 173129, R = true, Y = true, B = true, Stats = { Versatility = 16 } }, -- Versatile Jewel Cluster

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
	{ 175, PawnGemData16 }, -- Rank 1 crafted Shadowlands legendaries (177 is rank 4 covenant armor)
	{ 144, PawnGemData12 }, -- Mythic Ny'alotha is 140
	{ 115, PawnGemData7 }, -- Azshara's Eternal Palace heroic
	{ 105, PawnGemData6 },
	{ 100, PawnGemData4 }, -- Early level 50 endgame gear
	{ 44, PawnGemData3 }, -- Don't show gems with a level requirement before 44
	{ 0, PawnGemData1 },
}

PawnMetaGemQualityLevels =
{
	{0, {} }, -- There are no meta gems anymore.
}

PawnMinimumItemLevelToConsiderGems = 144 -- Sockets on items below this ilvl are ignored by default

end -- if VgerCore.IsMainline
