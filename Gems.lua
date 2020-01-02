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


--========================================
-- Colored level 70 uncommon-quality gems
--========================================
local PawnGemData70Uncommon =
{

{ 23094, "Intellect", 4 }, -- Brilliant Blood Garnet
{ 23095, "Strength", 4 }, -- Bold Blood Garnet
{ 28595, "Agility", 4 }, -- Delicate Blood Garnet
{ 23114, "CritRating", 4 }, -- Smooth Golden Draenite
{ 23115, "Stamina", 4 }, -- Subtle Golden Draenite
{ 23116, "CritRating", 4 }, -- Rigid Azure Moonstone
{ 23119, "Versatility", 4 }, -- Sparkling Azure Moonstone

}


--========================================
-- Colored level 70 rare-quality gems
--========================================
local PawnGemData70Rare =
{

{ 24027, "Strength", 5 }, -- Bold Living Ruby
{ 24028, "Agility", 5 }, -- Delicate Living Ruby
{ 24030, "Intellect", 5 }, -- Brilliant Living Ruby
{ 24048, "CritRating", 5 }, -- Smooth Dawnstone
{ 35315, "HasteRating", 5 }, -- Quick Dawnstone
{ 24033, "Stamina", 5 }, -- Solid Star of Elune
{ 24035, "Versatility", 5 }, -- Sparkling Star of Elune
{ 24051, "CritRating", 5 }, -- Rigid Star of Elune

}


--========================================
-- Colored level 70 epic-quality gems
--========================================
local PawnGemData70Epic =
{

{ 32193, "Strength", 6 }, -- Bold Crimson Spinel
{ 32194, "Agility", 6 }, -- Delicate Crimson Spinel
{ 32195, "Intellect", 6 }, -- Brilliant Crimson Spinel
{ 32205, "CritRating", 6 }, -- Smooth Lionseye
{ 35761, "HasteRating", 6 }, -- Quick Lionseye
{ 32200, "Stamina", 6 }, -- Solid Empyrean Sapphire
{ 32201, "Versatility", 6 }, -- Sparkling Empyrean Sapphire
{ 32210, "CritRating", 6 }, -- Rigid Empyrean Sapphire

}


--========================================
-- Colored level 80 uncommon-quality gems
--========================================
local PawnGemData80Uncommon =
{

{ 39900, "Strength", 4 }, -- Bold Bloodstone
{ 39905, "Agility", 4 }, -- Delicate Bloodstone
{ 39910, "HasteRating", 4 }, -- Precise Bloodstone
{ 39911, "Intellect", 4 }, -- Brilliant Bloodstone
{ 39909, "CritRating", 4 }, -- Smooth Sun Crystal
{ 39918, "HasteRating", 4 }, -- Quick Sun Crystal
{ 39915, "CritRating", 4 }, -- Rigid Chalcedony
{ 39919, "Stamina", 4 }, -- Solid Chalcedony
{ 39920, "Versatility", 4 }, -- Sparkling Chalcedony

}


--========================================
-- Colored level 80 rare-quality gems
--========================================
local PawnGemData80Rare =
{

{ 39996, "Strength", 5 }, -- Bold Scarlet Ruby
{ 39997, "Agility", 5 }, -- Delicate Scarlet Ruby
{ 39998, "Intellect", 5 }, -- Brilliant Scarlet Ruby
{ 40003, "HasteRating", 5 }, -- Precise Scarlet Ruby
{ 40002, "CritRating", 5 }, -- Smooth Autumn's Glow
{ 40017, "HasteRating", 5 }, -- Quick Autumn's Glow
{ 40008, "Stamina", 5 }, -- Solid Sky Sapphire
{ 40009, "Versatility", 5 }, -- Sparkling Sky Sapphire
{ 40014, "CritRating", 5 }, -- Rigid Sky Sapphire

}


--========================================
-- Colored level 80 epic-quality gems
--========================================
local PawnGemData80Epic =
{

{ 40111, "Strength", 6 }, -- Bold Cardinal Ruby
{ 40112, "Agility", 6 }, -- Delicate Cardinal Ruby
{ 40113, "Intellect", 6 }, -- Brilliant Cardinal Ruby
{ 40118, "HasteRating", 6 }, -- Precise Cardinal Ruby
{ 40117, "CritRating", 6 }, -- Smooth King's Amber
{ 40128, "HasteRating", 6 }, -- Quick King's Amber
{ 40119, "Stamina", 6 }, -- Solid Majestic Zircon
{ 40120, "Versatility", 6 }, -- Sparkling Majestic Zircon
{ 40125, "CritRating", 6 }, -- Rigid Majestic Zircon

}


--========================================
-- Colored level 85 uncommon-quality gems
--========================================
local PawnGemData85Uncommon =
{

{ 52081, "Strength", 5 }, -- Bold Carnelian
{ 52082, "Agility", 5 }, -- Delicate Carnelian
{ 52084, "Intellect", 5 }, -- Brilliant Carnelian
{ 52085, "HasteRating", 5 }, -- Precise Carnelian
{ 52091, "CritRating", 5 }, -- Smooth Alicite
{ 52093, "HasteRating", 5 }, -- Quick Alicite
{ 52094, "MasteryRating", 5 }, -- Fractured Alicite
{ 52086, "Stamina", 5 }, -- Solid Zephyrite
{ 52087, "Versatility", 5 }, -- Sparkling Zephyrite
{ 52089, "CritRating", 5 }, -- Rigid Zephyrite

}


--========================================
-- Colored level 85 rare-quality gems
--========================================
local PawnGemData85Rare =
{

{ 52206, "Strength", 6 }, -- Bold Inferno Ruby
{ 52207, "Intellect", 6 }, -- Brilliant Inferno Ruby
{ 52212, "Agility", 6 }, -- Delicate Inferno Ruby
{ 52230, "HasteRating", 6 }, -- Precise Inferno Ruby
{ 52219, "MasteryRating", 6 }, -- Fractured Amberjewel
{ 52232, "HasteRating", 6 }, -- Quick Amberjewel
{ 52241, "CritRating", 6 }, -- Smooth Amberjewel
{ 52235, "CritRating", 6 }, -- Rigid Ocean Sapphire
{ 52242, "Stamina", 6 }, -- Solid Ocean Sapphire
{ 52244, "Versatility", 6 }, -- Sparkling Ocean Sapphire

}


--========================================
-- Colored level 85 epic-quality gems
--========================================
local PawnGemData85Epic =
{

{ 71879, "Agility", 7 }, -- Delicate Queen's Garnet
{ 71880, "HasteRating", 7 }, -- Precise Queen's Garnet
{ 71881, "Intellect", 7 }, -- Brilliant Queen's Garnet
{ 71883, "Strength", 7 }, -- Bold Queen's Garnet
{ 71874, "CritRating", 7 }, -- Smooth Lightstone
{ 71876, "HasteRating", 7 }, -- Quick Lightstone
{ 71877, "MasteryRating", 7 }, -- Fractured Lightstone
{ 71817, "CritRating", 7 }, -- Rigid Deepholm Iolite
{ 71819, "Versatility", 7 }, -- Sparkling Deepholm Iolite
{ 71820, "Stamina", 7 }, -- Solid Deepholm Iolite

}


--========================================
-- Colored level 90 uncommon-quality gems
--========================================
local PawnGemData90Uncommon =
{

{ 76560, "Agility", 5 }, -- Delicate Pandarian Garnet
{ 76561, "HasteRating", 5 }, -- Precise Pandarian Garnet
{ 76562, "Intellect", 5 }, -- Brilliant Pandarian Garnet
{ 76564, "Strength", 5 }, -- Bold Pandarian Garnet
{ 76565, "CritRating", 5 }, -- Smooth Sunstone
{ 76567, "HasteRating", 5 }, -- Quick Sunstone
{ 76568, "MasteryRating", 5 }, -- Fractured Sunstone
{ 76502, "CritRating", 5 }, -- Rigid Lapis Lazuli
{ 76505, "Versatility", 5 }, -- Sparkling Lapis Lazuli
{ 76506, "Stamina", 5 }, -- Solid Lapis Lazuli

}


--========================================
-- Colored level 90 rare-quality gems
--========================================
local PawnGemData90Rare =
{

{ 76692, "Agility", 6 }, -- Delicate Primordial Ruby
{ 76693, "HasteRating", 6 }, -- Precise Primordial Ruby
{ 76694, "Intellect", 6 }, -- Brilliant Primordial Ruby
{ 76696, "Strength", 6 }, -- Bold Primordial Ruby
{ 76697, "CritRating", 6 }, -- Smooth Sun's Radiance
{ 76699, "HasteRating", 6 }, -- Quick Sun's Radiance
{ 76700, "MasteryRating", 6 }, -- Fractured Sun's Radiance
{ 76636, "CritRating", 6 }, -- Rigid River's Heart
{ 76638, "Versatility", 6 }, -- Sparkling River's Heart
{ 76639, "Stamina", 9 }, -- Solid River's Heart

}


--========================================
-- Level 100 crafted uncommon prismatic gems
--========================================
local PawnGemData100Uncommon =
{

{ 115803, "CritRating", 6 }, -- Critical Strike Taladite
{ 115804, "HasteRating", 6 }, -- Haste Taladite
{ 115805, "MasteryRating", 6 }, -- Mastery Taladite
{ 115807, "Versatility", 6 }, -- Versatility Taladite
{ 115808, "Stamina", 6 }, -- Stamina Taladite

}


--========================================
-- Level 100 crafted rare prismatic gems
--========================================
local PawnGemData100Rare =
{

{ 115809, "CritRating", 7 }, -- Greater Critical Strike Taladite
{ 115811, "HasteRating", 7 }, -- Greater Haste Taladite
{ 115812, "MasteryRating", 7 }, -- Greater Mastery Taladite
{ 115814, "Versatility", 7 }, -- Greater Versatility Taladite
{ 115815, "Stamina", 7 }, -- Greater Stamina Taladite

}


--========================================
-- Level 100 crafted epic prismatic gems
--========================================
local PawnGemData100Epic =
{

{ 127760, "CritRating", 8 }, -- Immaculate Critical Strike Taladite
{ 127761, "HasteRating", 8 }, -- Immaculate Haste Taladite
{ 127762, "MasteryRating", 8 }, -- Immaculate Mastery Taladite
{ 127764, "Versatility", 8 }, -- Immaculate Versatility Taladite
{ 127765, "Stamina", 8 }, -- Immaculate Stamina Taladite

}


--========================================
-- Level 110 crafted uncommon prismatic gems
--========================================
local PawnGemData110Uncommon =
{

{ 130215, "CritRating", 7 }, -- Deadly Deep Amber
{ 130216, "HasteRating", 7 }, -- Quick Azsunite
{ 130217, "Versatility", 7 }, -- Versatile Skystone
{ 130218, "MasteryRating", 7 }, -- Masterful Queen's Opal

}


--========================================
-- Level 110 crafted rare prismatic gems
--========================================
local PawnGemData110Rare =
{

{ 130219, "CritRating", 9 }, -- Deadly Eye of Prophecy
{ 130220, "HasteRating", 9 }, -- Quick Dawnlight
{ 130221, "Versatility", 9 }, -- Versatile Maelstrom Sapphire
{ 130222, "MasteryRating", 9 }, -- Masterful Shadowruby

}


--========================================
-- Level 110 crafted epic prismatic gems
--========================================
local PawnGemData110Epic =
{

{ 151580, "CritRating", 11 }, -- Deadly Deep Chemirine
{ 151583, "HasteRating", 11 }, -- Quick Lightsphene
{ 151584, "MasteryRating", 11 }, -- Masterful Argulite
{ 151585, "Versatility", 11 }, -- Versatile Labradorite

}


--========================================
-- Level 120 crafted uncommon prismatic gems
--========================================
local PawnGemData120Uncommon =
{

{ 153710, "CritRating", 30 }, -- Deadly Solstone
{ 153711, "HasteRating", 30 }, -- Quick Golden Beryl
{ 153712, "Versatility", 30 }, -- Versatile Kyanite
{ 153713, "MasteryRating", 30 }, -- Masterful Kubiline

}


--========================================
-- Level 120 crafted rare prismatic gems
--========================================
local PawnGemData120Rare =
{

{ 154126, "CritRating", 40 }, -- Deadly Amberblaze
{ 154127, "HasteRating", 40 }, -- Quick Owlseye
{ 154128, "Versatility", 40 }, -- Versatile Royal Quartz
{ 154129, "MasteryRating", 40 }, -- Masterful Tidal Amethyst

}


--========================================
-- Level 120 crafted epic prismatic gems
--========================================
local PawnGemData120Epic =
{

{ 168639, "CritRating", 50 }, -- Deadly Lava Lazuli
{ 168641, "HasteRating", 50 }, -- Quick Sand Spinel
{ 168642, "Versatility", 50 }, -- Versatile Dark Opal
{ 168640, "MasteryRating", 50 }, -- Masterful Sea Currant

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
	{ 430, PawnGemData120Epic }, -- Azshara's Eternal Palace heroic
	{ 385, PawnGemData120Rare }, -- Darkshore warfront and Battle for Dazar'Alor raid finder
	{ 270, PawnGemData120Uncommon }, -- above Legion legendaries
	{ 225, PawnGemData110Epic }, -- Heroic Antorus
	{ 195, PawnGemData110Rare }, -- Heroic Tomb of Sargeras / higher than new Relinquished gear
	{ 153, PawnGemData110Uncommon }, -- Higher than Mythic Hellfire Citadel gear (heirlooms scale to 160)
	{ 141, PawnGemData100Epic }, -- Warlords of Draenor Mythic Blackrock Foundry / Heroic Hellfire Citadel
	{ 138, PawnGemData100Rare }, -- Warlords of Draenor Mythic Highmaul / Heroic Blackrock Foundry / Raid Finder Hellfire Citadel end bosses
	{ 136, PawnGemData100Uncommon }, -- Actual gem requirement for Immaculate versions
	{ 116, PawnGemData90Rare }, -- Mists of Pandaria heroics
	{ 114, PawnGemData90Uncommon }, -- Actual gem requirement
	{ 110, PawnGemData85Epic }, -- Dragon Soul normal mode
	{ 108, PawnGemData85Rare }, -- Cataclysm heroics
	{ 104, PawnGemData85Uncommon }, -- Cataclysm dungeons
	{ 102, PawnGemData80Epic }, -- Tier 10 sanctified epics (Sanctified Frost Witch's Regalia)
	{ 100, PawnGemData80Rare }, -- Wrath of the Lich King heroics
	{ 85, PawnGemData80Uncommon }, -- Low-level Wrath greens
	{ 80, PawnGemData70Epic }, -- Burning Crusade epics (Cataclysm Harness)
	{ 70, PawnGemData70Rare }, -- Burning Crusade level 70 non-heroics
	{ 0, PawnGemData70Uncommon },
}

PawnMinimumItemLevelToConsiderGems = 310 -- Sockets on items below this ilvl are ignored
