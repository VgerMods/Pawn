-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2020 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
-- 
-- Gem information
------------------------------------------------------------


-- Gem table row format:
-- { ItemID, Class, "Stat1" Quantity1, "Stat2", Quantity2 }
-- 	ItemID: The item ID of this gem.
--	"Stat": The stat that this gem gives.
--	Quantity: How much of the stat that the gem gives.
--	("Stat", Quantity can be repeated again...)
--	Pawn will use the 9th slot for storing a cache of scale values.


local PawnGemData1 =
{

-- No ilvl requirement
{ 23094, "Intellect", 1 }, -- Brilliant Blood Garnet
{ 23095, "Strength", 1 }, -- Bold Blood Garnet
{ 28595, "Agility", 1 }, -- Delicate Blood Garnet
{ 23114, "CritRating", 1 }, -- Smooth Golden Draenite
{ 23115, "Stamina", 1 }, -- Subtle Golden Draenite
{ 23116, "CritRating", 1 }, -- Rigid Azure Moonstone
{ 23119, "Versatility", 1 }, -- Sparkling Azure Moonstone

{ 39900, "Strength", 1 }, -- Bold Bloodstone
{ 39905, "Agility", 1 }, -- Delicate Bloodstone
{ 39910, "HasteRating", 1 }, -- Precise Bloodstone
{ 39911, "Intellect", 1 }, -- Brilliant Bloodstone
{ 39909, "CritRating", 1 }, -- Smooth Sun Crystal
{ 39918, "HasteRating", 1 }, -- Quick Sun Crystal
{ 39915, "CritRating", 1 }, -- Rigid Chalcedony
{ 39919, "Stamina", 1 }, -- Solid Chalcedony
{ 39920, "Versatility", 1 }, -- Sparkling Chalcedony

}


local PawnGemData2 =
{

-- No ilvl requirement
{ 24027, "Strength", 2 }, -- Bold Living Ruby
{ 24028, "Agility", 2 }, -- Delicate Living Ruby
{ 24030, "Intellect", 2 }, -- Brilliant Living Ruby
{ 24048, "CritRating", 2 }, -- Smooth Dawnstone
{ 35315, "HasteRating", 2 }, -- Quick Dawnstone
{ 24033, "Stamina", 2 }, -- Solid Star of Elune
{ 24035, "Versatility", 2 }, -- Sparkling Star of Elune
{ 24051, "CritRating", 2 }, -- Rigid Star of Elune

{ 39996, "Strength", 2 }, -- Bold Scarlet Ruby
{ 39997, "Agility", 2 }, -- Delicate Scarlet Ruby
{ 39998, "Intellect", 2 }, -- Brilliant Scarlet Ruby
{ 40003, "HasteRating", 2 }, -- Precise Scarlet Ruby
{ 40002, "CritRating", 2 }, -- Smooth Autumn's Glow
{ 40017, "HasteRating", 2 }, -- Quick Autumn's Glow
{ 40008, "Stamina", 2 }, -- Solid Sky Sapphire
{ 40009, "Versatility", 2 }, -- Sparkling Sky Sapphire
{ 40014, "CritRating", 2 }, -- Rigid Sky Sapphire

-- Requires ilvl 35
{ 52081, "Strength", 2 }, -- Bold Carnelian
{ 52082, "Agility", 2 }, -- Delicate Carnelian
{ 52084, "Intellect", 2 }, -- Brilliant Carnelian
{ 52085, "HasteRating", 2 }, -- Precise Carnelian
{ 52091, "CritRating", 2 }, -- Smooth Alicite
{ 52093, "HasteRating", 2 }, -- Quick Alicite
{ 52094, "MasteryRating", 2 }, -- Fractured Alicite
{ 52086, "Stamina", 2 }, -- Solid Zephyrite
{ 52087, "Versatility", 2 }, -- Sparkling Zephyrite
{ 52089, "CritRating", 2 }, -- Rigid Zephyrite

-- Requires ilvl 38
{ 76560, "Agility", 2 }, -- Delicate Pandarian Garnet
{ 76561, "HasteRating", 2 }, -- Precise Pandarian Garnet
{ 76562, "Intellect", 2 }, -- Brilliant Pandarian Garnet
{ 76564, "Strength", 2 }, -- Bold Pandarian Garnet
{ 76565, "CritRating", 2 }, -- Smooth Sunstone
{ 76567, "HasteRating", 2 }, -- Quick Sunstone
{ 76568, "MasteryRating", 2 }, -- Fractured Sunstone
{ 76502, "CritRating", 2 }, -- Rigid Lapis Lazuli
{ 76505, "Versatility", 2 }, -- Sparkling Lapis Lazuli
{ 76506, "Stamina", 2 }, -- Solid Lapis Lazuli

-- Requires ilvl 44
{ 115803, "CritRating", 2 }, -- Critical Strike Taladite
{ 115804, "HasteRating", 2 }, -- Haste Taladite
{ 115805, "MasteryRating", 2 }, -- Mastery Taladite
{ 115807, "Versatility", 2 }, -- Versatility Taladite
{ 115808, "Stamina", 2 }, -- Stamina Taladite

}


local PawnGemData3 =
{

-- No ilvl requirement
{ 32193, "Strength", 3 }, -- Bold Crimson Spinel
{ 32194, "Agility", 3 }, -- Delicate Crimson Spinel
{ 32195, "Intellect", 3 }, -- Brilliant Crimson Spinel
{ 32205, "CritRating", 3 }, -- Smooth Lionseye
{ 35761, "HasteRating", 3 }, -- Quick Lionseye
{ 32200, "Stamina", 3 }, -- Solid Empyrean Sapphire
{ 32201, "Versatility", 3 }, -- Sparkling Empyrean Sapphire
{ 32210, "CritRating", 3 }, -- Rigid Empyrean Sapphire

{ 40111, "Strength", 3 }, -- Bold Cardinal Ruby
{ 40112, "Agility", 3 }, -- Delicate Cardinal Ruby
{ 40113, "Intellect", 3 }, -- Brilliant Cardinal Ruby
{ 40118, "HasteRating", 3 }, -- Precise Cardinal Ruby
{ 40117, "CritRating", 3 }, -- Smooth King's Amber
{ 40128, "HasteRating", 3 }, -- Quick King's Amber
{ 40119, "Stamina", 3 }, -- Solid Majestic Zircon
{ 40120, "Versatility", 3 }, -- Sparkling Majestic Zircon
{ 40125, "CritRating", 3 }, -- Rigid Majestic Zircon

-- Requires ilvl 35
{ 52206, "Strength", 3 }, -- Bold Inferno Ruby
{ 52207, "Intellect", 3 }, -- Brilliant Inferno Ruby
{ 52212, "Agility", 3 }, -- Delicate Inferno Ruby
{ 52230, "HasteRating", 3 }, -- Precise Inferno Ruby
{ 52219, "MasteryRating", 3 }, -- Fractured Amberjewel
{ 52232, "HasteRating", 3 }, -- Quick Amberjewel
{ 52241, "CritRating", 3 }, -- Smooth Amberjewel
{ 52235, "CritRating", 3 }, -- Rigid Ocean Sapphire
{ 52242, "Stamina", 3 }, -- Solid Ocean Sapphire
{ 52244, "Versatility", 3 }, -- Sparkling Ocean Sapphire

-- Requires ilvl 38
{ 76692, "Agility", 3 }, -- Delicate Primordial Ruby
{ 76693, "HasteRating", 3 }, -- Precise Primordial Ruby
{ 76694, "Intellect", 3 }, -- Brilliant Primordial Ruby
{ 76696, "Strength", 3 }, -- Bold Primordial Ruby
{ 76697, "CritRating", 3 }, -- Smooth Sun's Radiance
{ 76699, "HasteRating", 3 }, -- Quick Sun's Radiance
{ 76700, "MasteryRating", 3 }, -- Fractured Sun's Radiance
{ 76636, "CritRating", 3 }, -- Rigid River's Heart
{ 76638, "Versatility", 3 }, -- Sparkling River's Heart
{ 76639, "Stamina", 3 }, -- Solid River's Heart

-- Requires ilvl 44
{ 115809, "CritRating", 3 }, -- Greater Critical Strike Taladite
{ 115811, "HasteRating", 3 }, -- Greater Haste Taladite
{ 115812, "MasteryRating", 3 }, -- Greater Mastery Taladite
{ 115814, "Versatility", 3 }, -- Greater Versatility Taladite
{ 115815, "Stamina", 3 }, -- Greater Stamina Taladite

}


local PawnGemData4 =
{

-- Requires ilvl 36
{ 71879, "Agility", 4 }, -- Delicate Queen's Garnet
{ 71880, "HasteRating", 4 }, -- Precise Queen's Garnet
{ 71881, "Intellect", 4 }, -- Brilliant Queen's Garnet
{ 71883, "Strength", 4 }, -- Bold Queen's Garnet
{ 71874, "CritRating", 4 }, -- Smooth Lightstone
{ 71876, "HasteRating", 4 }, -- Quick Lightstone
{ 71877, "MasteryRating", 4 }, -- Fractured Lightstone
{ 71817, "CritRating", 4 }, -- Rigid Deepholm Iolite
{ 71819, "Versatility", 4 }, -- Sparkling Deepholm Iolite
{ 71820, "Stamina", 4 }, -- Solid Deepholm Iolite

-- Requires ilvl 44
{ 130215, "CritRating", 4 }, -- Deadly Deep Amber
{ 130216, "HasteRating", 4 }, -- Quick Azsunite
{ 130217, "Versatility", 4 }, -- Versatile Skystone
{ 130218, "MasteryRating", 4 }, -- Masterful Queen's Opal

{ 127760, "CritRating", 4 }, -- Immaculate Critical Strike Taladite
{ 127761, "HasteRating", 4 }, -- Immaculate Haste Taladite
{ 127762, "MasteryRating", 4 }, -- Immaculate Mastery Taladite
{ 127764, "Versatility", 4 }, -- Immaculate Versatility Taladite
{ 127765, "Stamina", 4 }, -- Immaculate Stamina Taladite

-- Requires ilvl 50
{ 153710, "CritRating", 4 }, -- Deadly Solstone
{ 153711, "HasteRating", 4 }, -- Quick Golden Beryl
{ 153712, "Versatility", 4 }, -- Versatile Kyanite
{ 153713, "MasteryRating", 4 }, -- Masterful Kubiline

}


local PawnGemData6 =
{

-- Requires ilvl 44
{ 130219, "CritRating", 6 }, -- Deadly Eye of Prophecy
{ 130220, "HasteRating", 6 }, -- Quick Dawnlight
{ 130221, "Versatility", 6 }, -- Versatile Maelstrom Sapphire
{ 130222, "MasteryRating", 6 }, -- Masterful Shadowruby

-- Requires ilvl 50
{ 154126, "CritRating", 6 }, -- Deadly Amberblaze
{ 154127, "HasteRating", 6 }, -- Quick Owlseye
{ 154128, "Versatility", 6 }, -- Versatile Royal Quartz
{ 154129, "MasteryRating", 6 }, -- Masterful Tidal Amethyst

}


local PawnGemData7 =
{

-- Requires ilvl 44
{ 151580, "CritRating", 7 }, -- Deadly Deep Chemirine
{ 151583, "HasteRating", 7 }, -- Quick Lightsphene
{ 151584, "MasteryRating", 7 }, -- Masterful Argulite
{ 151585, "Versatility", 7 }, -- Versatile Labradorite

-- Requires ilvl 50
{ 168639, "CritRating", 7 }, -- Deadly Lava Lazuli
{ 168641, "HasteRating", 7 }, -- Quick Sand Spinel
{ 168642, "Versatility", 7 }, -- Versatile Dark Opal
{ 168640, "MasteryRating", 7 }, -- Masterful Sea Currant

}


local PawnGemData12 =
{

-- No ilvl requirement
{ 173121, "CritRating", 12 }, -- Deadly Jewel Doublet
{ 173122, "HasteRating", 12 }, -- Quick Jewel Doublet
{ 173124, "MasteryRating", 12 }, -- Masterful Jewel Doublet
{ 173123, "Versatility", 12 }, -- Versatile Jewel Doublet

}


local PawnGemData16 =
{

-- No ilvl requirement
{ 173127, "CritRating", 16 }, -- Deadly Jewel Cluster
{ 173128, "HasteRating", 16 }, -- Quick Jewel Cluster
{ 173130, "MasteryRating", 16 }, -- Masterful Jewel Cluster
{ 173129, "Versatility", 16 }, -- Versatile Jewel Cluster

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
	{ 190, PawnGemData16 }, -- Second tier of crafted Shadowlands legendaries
	{ 144, PawnGemData12 }, -- Mythic Ny'alotha is 140
	{ 115, PawnGemData7 }, -- Azshara's Eternal Palace heroic
	{ 105, PawnGemData6 },
	{ 100, PawnGemData4 }, -- Early level 50 endgame gear
	{ 44, PawnGemData3 }, -- Don't show gems with a level requirement before 44
	{ 0, PawnGemData1 },
}

PawnMinimumItemLevelToConsiderGems = 100 -- Sockets on items below this ilvl are ignored by default
