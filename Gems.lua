-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2021 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
-- 
-- Gem information
------------------------------------------------------------


if VgerCore.IsShadowlands then


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
{ ID = 23094, Stats = { Intellect = 1 } }, -- Brilliant Blood Garnet
{ ID = 23095, Stats = { Strength = 1 } }, -- Bold Blood Garnet
{ ID = 28595, Stats = { Agility = 1 } }, -- Delicate Blood Garnet
{ ID = 23114, Stats = { CritRating = 1 } }, -- Smooth Golden Draenite
{ ID = 23115, Stats = { Stamina = 1 } }, -- Subtle Golden Draenite
{ ID = 23116, Stats = { CritRating = 1 } }, -- Rigid Azure Moonstone
{ ID = 23119, Stats = { Versatility = 1 } }, -- Sparkling Azure Moonstone

{ ID = 39900, Stats = { Strength = 1 } }, -- Bold Bloodstone
{ ID = 39905, Stats = { Agility = 1 } }, -- Delicate Bloodstone
{ ID = 39910, Stats = { HasteRating = 1 } }, -- Precise Bloodstone
{ ID = 39911, Stats = { Intellect = 1 } }, -- Brilliant Bloodstone
{ ID = 39909, Stats = { CritRating = 1 } }, -- Smooth Sun Crystal
{ ID = 39918, Stats = { HasteRating = 1 } }, -- Quick Sun Crystal
{ ID = 39915, Stats = { CritRating = 1 } }, -- Rigid Chalcedony
{ ID = 39919, Stats = { Stamina = 1 } }, -- Solid Chalcedony
{ ID = 39920, Stats = { Versatility = 1 } }, -- Sparkling Chalcedony

}


local PawnGemData2 =
{

-- No ilvl requirement
{ ID = 24027, Stats = { Strength = 2 } }, -- Bold Living Ruby
{ ID = 24028, Stats = { Agility = 2 } }, -- Delicate Living Ruby
{ ID = 24030, Stats = { Intellect = 2 } }, -- Brilliant Living Ruby
{ ID = 24048, Stats = { CritRating = 2 } }, -- Smooth Dawnstone
{ ID = 35315, Stats = { HasteRating = 2 } }, -- Quick Dawnstone
{ ID = 24033, Stats = { Stamina = 2 } }, -- Solid Star of Elune
{ ID = 24035, Stats = { Versatility = 2 } }, -- Sparkling Star of Elune
{ ID = 24051, Stats = { CritRating = 2 } }, -- Rigid Star of Elune

{ ID = 39996, Stats = { Strength = 2 } }, -- Bold Scarlet Ruby
{ ID = 39997, Stats = { Agility = 2 } }, -- Delicate Scarlet Ruby
{ ID = 39998, Stats = { Intellect = 2 } }, -- Brilliant Scarlet Ruby
{ ID = 40003, Stats = { HasteRating = 2 } }, -- Precise Scarlet Ruby
{ ID = 40002, Stats = { CritRating = 2 } }, -- Smooth Autumn's Glow
{ ID = 40017, Stats = { HasteRating = 2 } }, -- Quick Autumn's Glow
{ ID = 40008, Stats = { Stamina = 2 } }, -- Solid Sky Sapphire
{ ID = 40009, Stats = { Versatility = 2 } }, -- Sparkling Sky Sapphire
{ ID = 40014, Stats = { CritRating = 2 } }, -- Rigid Sky Sapphire

-- Requires ilvl 35
{ ID = 52081, Stats = { Strength = 2 } }, -- Bold Carnelian
{ ID = 52082, Stats = { Agility = 2 } }, -- Delicate Carnelian
{ ID = 52084, Stats = { Intellect = 2 } }, -- Brilliant Carnelian
{ ID = 52085, Stats = { HasteRating = 2 } }, -- Precise Carnelian
{ ID = 52091, Stats = { CritRating = 2 } }, -- Smooth Alicite
{ ID = 52093, Stats = { HasteRating = 2 } }, -- Quick Alicite
{ ID = 52094, Stats = { MasteryRating = 2 } }, -- Fractured Alicite
{ ID = 52086, Stats = { Stamina = 2 } }, -- Solid Zephyrite
{ ID = 52087, Stats = { Versatility = 2 } }, -- Sparkling Zephyrite
{ ID = 52089, Stats = { CritRating = 2 } }, -- Rigid Zephyrite

-- Requires ilvl 38
{ ID = 76560, Stats = { Agility = 2 } }, -- Delicate Pandarian Garnet
{ ID = 76561, Stats = { HasteRating = 2 } }, -- Precise Pandarian Garnet
{ ID = 76562, Stats = { Intellect = 2 } }, -- Brilliant Pandarian Garnet
{ ID = 76564, Stats = { Strength = 2 } }, -- Bold Pandarian Garnet
{ ID = 76565, Stats = { CritRating = 2 } }, -- Smooth Sunstone
{ ID = 76567, Stats = { HasteRating = 2 } }, -- Quick Sunstone
{ ID = 76568, Stats = { MasteryRating = 2 } }, -- Fractured Sunstone
{ ID = 76502, Stats = { CritRating = 2 } }, -- Rigid Lapis Lazuli
{ ID = 76505, Stats = { Versatility = 2 } }, -- Sparkling Lapis Lazuli
{ ID = 76506, Stats = { Stamina = 2 } }, -- Solid Lapis Lazuli

-- Requires ilvl 44
{ ID = 115803, Stats = { CritRating = 2 } }, -- Critical Strike Taladite
{ ID = 115804, Stats = { HasteRating = 2 } }, -- Haste Taladite
{ ID = 115805, Stats = { MasteryRating = 2 } }, -- Mastery Taladite
{ ID = 115807, Stats = { Versatility = 2 } }, -- Versatility Taladite
{ ID = 115808, Stats = { Stamina = 2 } }, -- Stamina Taladite

}


local PawnGemData3 =
{

-- No ilvl requirement
{ ID = 32193, Stats = { Strength = 3 } }, -- Bold Crimson Spinel
{ ID = 32194, Stats = { Agility = 3 } }, -- Delicate Crimson Spinel
{ ID = 32195, Stats = { Intellect = 3 } }, -- Brilliant Crimson Spinel
{ ID = 32205, Stats = { CritRating = 3 } }, -- Smooth Lionseye
{ ID = 35761, Stats = { HasteRating = 3 } }, -- Quick Lionseye
{ ID = 32200, Stats = { Stamina = 3 } }, -- Solid Empyrean Sapphire
{ ID = 32201, Stats = { Versatility = 3 } }, -- Sparkling Empyrean Sapphire
{ ID = 32210, Stats = { CritRating = 3 } }, -- Rigid Empyrean Sapphire

{ ID = 40111, Stats = { Strength = 3 } }, -- Bold Cardinal Ruby
{ ID = 40112, Stats = { Agility = 3 } }, -- Delicate Cardinal Ruby
{ ID = 40113, Stats = { Intellect = 3 } }, -- Brilliant Cardinal Ruby
{ ID = 40118, Stats = { HasteRating = 3 } }, -- Precise Cardinal Ruby
{ ID = 40117, Stats = { CritRating = 3 } }, -- Smooth King's Amber
{ ID = 40128, Stats = { HasteRating = 3 } }, -- Quick King's Amber
{ ID = 40119, Stats = { Stamina = 3 } }, -- Solid Majestic Zircon
{ ID = 40120, Stats = { Versatility = 3 } }, -- Sparkling Majestic Zircon
{ ID = 40125, Stats = { CritRating = 3 } }, -- Rigid Majestic Zircon

-- Requires ilvl 35
{ ID = 52206, Stats = { Strength = 3 } }, -- Bold Inferno Ruby
{ ID = 52207, Stats = { Intellect = 3 } }, -- Brilliant Inferno Ruby
{ ID = 52212, Stats = { Agility = 3 } }, -- Delicate Inferno Ruby
{ ID = 52230, Stats = { HasteRating = 3 } }, -- Precise Inferno Ruby
{ ID = 52219, Stats = { MasteryRating = 3 } }, -- Fractured Amberjewel
{ ID = 52232, Stats = { HasteRating = 3 } }, -- Quick Amberjewel
{ ID = 52241, Stats = { CritRating = 3 } }, -- Smooth Amberjewel
{ ID = 52235, Stats = { CritRating = 3 } }, -- Rigid Ocean Sapphire
{ ID = 52242, Stats = { Stamina = 3 } }, -- Solid Ocean Sapphire
{ ID = 52244, Stats = { Versatility = 3 } }, -- Sparkling Ocean Sapphire

-- Requires ilvl 38
{ ID = 76692, Stats = { Agility = 3 } }, -- Delicate Primordial Ruby
{ ID = 76693, Stats = { HasteRating = 3 } }, -- Precise Primordial Ruby
{ ID = 76694, Stats = { Intellect = 3 } }, -- Brilliant Primordial Ruby
{ ID = 76696, Stats = { Strength = 3 } }, -- Bold Primordial Ruby
{ ID = 76697, Stats = { CritRating = 3 } }, -- Smooth Sun's Radiance
{ ID = 76699, Stats = { HasteRating = 3 } }, -- Quick Sun's Radiance
{ ID = 76700, Stats = { MasteryRating = 3 } }, -- Fractured Sun's Radiance
{ ID = 76636, Stats = { CritRating = 3 } }, -- Rigid River's Heart
{ ID = 76638, Stats = { Versatility = 3 } }, -- Sparkling River's Heart
{ ID = 76639, Stats = { Stamina = 3 } }, -- Solid River's Heart

-- Requires ilvl 44
{ ID = 115809, Stats = { CritRating = 3 } }, -- Greater Critical Strike Taladite
{ ID = 115811, Stats = { HasteRating = 3 } }, -- Greater Haste Taladite
{ ID = 115812, Stats = { MasteryRating = 3 } }, -- Greater Mastery Taladite
{ ID = 115814, Stats = { Versatility = 3 } }, -- Greater Versatility Taladite
{ ID = 115815, Stats = { Stamina = 3 } }, -- Greater Stamina Taladite

}


local PawnGemData4 =
{

-- Requires ilvl 36
{ ID = 71879, Stats = { Agility = 4 } }, -- Delicate Queen's Garnet
{ ID = 71880, Stats = { HasteRating = 4 } }, -- Precise Queen's Garnet
{ ID = 71881, Stats = { Intellect = 4 } }, -- Brilliant Queen's Garnet
{ ID = 71883, Stats = { Strength = 4 } }, -- Bold Queen's Garnet
{ ID = 71874, Stats = { CritRating = 4 } }, -- Smooth Lightstone
{ ID = 71876, Stats = { HasteRating = 4 } }, -- Quick Lightstone
{ ID = 71877, Stats = { MasteryRating = 4 } }, -- Fractured Lightstone
{ ID = 71817, Stats = { CritRating = 4 } }, -- Rigid Deepholm Iolite
{ ID = 71819, Stats = { Versatility = 4 } }, -- Sparkling Deepholm Iolite
{ ID = 71820, Stats = { Stamina = 4 } }, -- Solid Deepholm Iolite

-- Requires ilvl 44
{ ID = 130215, Stats = { CritRating = 4 } }, -- Deadly Deep Amber
{ ID = 130216, Stats = { HasteRating = 4 } }, -- Quick Azsunite
{ ID = 130217, Stats = { Versatility = 4 } }, -- Versatile Skystone
{ ID = 130218, Stats = { MasteryRating = 4 } }, -- Masterful Queen's Opal

{ ID = 127760, Stats = { CritRating = 4 } }, -- Immaculate Critical Strike Taladite
{ ID = 127761, Stats = { HasteRating = 4 } }, -- Immaculate Haste Taladite
{ ID = 127762, Stats = { MasteryRating = 4 } }, -- Immaculate Mastery Taladite
{ ID = 127764, Stats = { Versatility = 4 } }, -- Immaculate Versatility Taladite
{ ID = 127765, Stats = { Stamina = 4 } }, -- Immaculate Stamina Taladite

-- Requires ilvl 50
{ ID = 153710, Stats = { CritRating = 4 } }, -- Deadly Solstone
{ ID = 153711, Stats = { HasteRating = 4 } }, -- Quick Golden Beryl
{ ID = 153712, Stats = { Versatility = 4 } }, -- Versatile Kyanite
{ ID = 153713, Stats = { MasteryRating = 4 } }, -- Masterful Kubiline

}


local PawnGemData6 =
{

-- Requires ilvl 44
{ ID = 130219, Stats = { CritRating = 6 } }, -- Deadly Eye of Prophecy
{ ID = 130220, Stats = { HasteRating = 6 } }, -- Quick Dawnlight
{ ID = 130221, Stats = { Versatility = 6 } }, -- Versatile Maelstrom Sapphire
{ ID = 130222, Stats = { MasteryRating = 6 } }, -- Masterful Shadowruby

-- Requires ilvl 50
{ ID = 154126, Stats = { CritRating = 6 } }, -- Deadly Amberblaze
{ ID = 154127, Stats = { HasteRating = 6 } }, -- Quick Owlseye
{ ID = 154128, Stats = { Versatility = 6 } }, -- Versatile Royal Quartz
{ ID = 154129, Stats = { MasteryRating = 6 } }, -- Masterful Tidal Amethyst

}


local PawnGemData7 =
{

-- Requires ilvl 44
{ ID = 151580, Stats = { CritRating = 7 } }, -- Deadly Deep Chemirine
{ ID = 151583, Stats = { HasteRating = 7 } }, -- Quick Lightsphene
{ ID = 151584, Stats = { MasteryRating = 7 } }, -- Masterful Argulite
{ ID = 151585, Stats = { Versatility = 7 } }, -- Versatile Labradorite

-- Requires ilvl 50
{ ID = 168639, Stats = { CritRating = 7 } }, -- Deadly Lava Lazuli
{ ID = 168641, Stats = { HasteRating = 7 } }, -- Quick Sand Spinel
{ ID = 168642, Stats = { Versatility = 7 } }, -- Versatile Dark Opal
{ ID = 168640, Stats = { MasteryRating = 7 } }, -- Masterful Sea Currant

}


local PawnGemData12 =
{

-- No ilvl requirement
{ ID = 173121, Stats = { CritRating = 12 } }, -- Deadly Jewel Doublet
{ ID = 173122, Stats = { HasteRating = 12 } }, -- Quick Jewel Doublet
{ ID = 173124, Stats = { MasteryRating = 12 } }, -- Masterful Jewel Doublet
{ ID = 173123, Stats = { Versatility = 12 } }, -- Versatile Jewel Doublet

}


local PawnGemData16 =
{

-- No ilvl requirement
{ ID = 173127, Stats = { CritRating = 16 } }, -- Deadly Jewel Cluster
{ ID = 173128, Stats = { HasteRating = 16 } }, -- Quick Jewel Cluster
{ ID = 173130, Stats = { MasteryRating = 16 } }, -- Masterful Jewel Cluster
{ ID = 173129, Stats = { Versatility = 16 } }, -- Versatile Jewel Cluster

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
}

PawnMinimumItemLevelToConsiderGems = 144 -- Sockets on items below this ilvl are ignored by default

end -- if VgerCore.IsShadowlands
