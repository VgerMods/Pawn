-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.
--
-- Tooltip parsing strings
------------------------------------------------------------

-- For conciseness
local L = PawnLocal.TooltipParsing

if PawnLocal.ThousandsSeparator == "NBSP" then PawnLocal.ThousandsSeparator = "\194\160" end
local Key, Value
for Key, Value in pairs(L) do
	L[Key] = gsub(Value, "#", "(-?[%%d%%., ]+)")
end

------------------------------------------------------------
-- Tooltip parsing expressions
------------------------------------------------------------

-- These strings indicate that a given line might contain multiple stats, such as complex enchantments
-- (ZG, AQ) and gems.  These are sorted in priority order.  If a string earlier in the table is present, any
-- string later in the table can be ignored.
PawnSeparators =
{
	", ",
	"/",
	" & ",
	" " .. L.MultiStatSeparator1 .. " ", -- and
}

-- Lines that match any of the following patterns will cause all further tooltip parsing to stop.
PawnKillLines =
{
	"^ \n$", -- The blank line before set items before WoW 2.3
	" %(%d+/%d+%)$", -- The (1/8) on set items for all versions of WoW
}
-- MobInfo-2 compatibility
if MI_LightBlue and MI_TXT_DROPPED_BY then
	tinsert(PawnKillLines, "^" .. MI_LightBlue .. MI_TXT_DROPPED_BY)
end

-- Lines that begin with any of the following strings will not be searched for separator strings.
PawnSeparatorIgnorePrefixes =
{
	'"', -- double quote
	L.Equip,
	L.Use,
	L.ChanceOnHit,
}

-- This is a list of regular expression substitutions that Pawn performs to normalize stat names before running
-- them through the normal gauntlet of expressions.
PawnNormalizationRegexes =
{
	{"^|c........(.+)$", "%1"}, -- "|cFF 0FF 0Heroic" --> "Heroic"
	{"^([%w%s%.]+) %+(%d+)%%?$", "+%2 %1"}, -- "Stamina +5" --> "+5 Stamina"
	{L.NormalizationEnchant, "%1"}, -- "Enchanted: +50 Strength" --> "+50 Strength" (ENCHANTED_TOOLTIP_LINE)
}

-- These regular expressions are used to parse item tooltips.
-- The first string is the regular expression to match.  Stat values should be denoted with "(%d+)".
-- Subsequent strings follow this pattern: Stat, Number, Source
-- Stat is the name of a statistic.
-- Number is either the amount of that stat to include, or the 1-based index into the matches array produced by the regex.
-- If it's an index, it can also be negative to mean that the stat should be subtracted instead of added.  If nil, defaults to 1.
-- Source is either PawnMultipleStatsFixed if Number is the amount of the stat, or PawnSingleStatMultiplier if Number is an
-- amount of the stat to multiply by the extracted number, or PawnMultipleStatsExtract or nil if Number is the matches array index.
-- Note that certain strings don't need to be translated: for example, the game defines
-- ITEM_BIND_ON_PICKUP to be "Binds when picked up" in English, and the correct string
-- in other languages automatically.
PawnRegexes =
{
	-- ========================================
	-- Common strings that are ignored (rare ones are at the bottom of the file)
	-- ========================================
	{L.HaventCollectedAppearance}, -- You haven't collected this appearance.
	{PawnGameConstant(ITEM_QUALITY0_DESC)}, -- Poor
	{PawnGameConstant(ITEM_QUALITY1_DESC)}, -- Common
	{PawnGameConstant(ITEM_QUALITY2_DESC)}, -- Uncommon
	{PawnGameConstant(ITEM_QUALITY3_DESC)}, -- Rare
	{PawnGameConstant(ITEM_QUALITY4_DESC)}, -- Epic
	{PawnGameConstant(ITEM_QUALITY5_DESC)}, -- Legendary
	{PawnGameConstant(ITEM_QUALITY7_DESC)}, -- Heirloom
	{L.RaidFinder}, -- Raid Finder
	{L.Flexible}, -- Flexible raids
	{L.Heroic}, -- Items from heroic dungeons
	{L.Elite}, -- one version of Regail's Band of the Endless (http://www.wowhead.com/item=90517)
	{L.HeroicElite}, -- one version of Regail's Band of the Endless (http://www.wowhead.com/item=90503)
	{L.Thunderforged}, -- one version of Shoulders of the Crackling Protector (http://ptr.wowhead.com/item=96329)
	{L.HeroicThunderforged}, -- one version of Shoulders of the Crackling Protector (http://ptr.wowhead.com/item=97073)
	{L.Timeless}, -- level 535 version of Ordon Legend-Keeper Spaulders (http://ptr.wowhead.com/item=101925)
	{L.Titanforged}, -- Legion items upgraded 15 item levels or more
	{L.Warforged}, -- level 559 Black Blood of Y'Shaarj (http://www.wowhead.com/item=105399)
	{L.HeroicWarforged}, -- level 572 Black Blood of Y'Shaarj (http://www.wowhead.com/item=105648)
	{"^" .. ITEM_LEVEL}, -- Item Level 200
	{L.UpgradeLevel}, -- Upgrade Level 0/2 (ITEM_UPGRADE_TOOLTIP_FORMAT)
	{PawnGameConstantIgnoredPlaceholder(EQUIPMENT_SETS)}, -- String is from the Blizzard UI, but only used by Outfitter
	{PawnGameConstant(ITEM_UNSELLABLE)}, -- No sell price
	{PawnGameConstant(ITEM_SOULBOUND)}, -- Soulbound
	{PawnGameConstant(ITEM_BIND_ON_EQUIP)}, -- Binds when equipped
	{PawnGameConstant(ITEM_BIND_ON_PICKUP)}, -- Binds when picked up
	{PawnGameConstant(ITEM_BIND_ON_USE)}, -- Binds when used
	{PawnGameConstant(ITEM_BIND_TO_ACCOUNT)}, -- Binds to account
	{PawnGameConstant(ITEM_ACCOUNTBOUND)}, -- Account Bound
	{PawnGameConstant(ITEM_BIND_TO_BNETACCOUNT)}, -- Binds to Battle.net account (Polished Spaulders of Valor)
	{PawnGameConstant(ITEM_BNETACCOUNTBOUND)}, -- Battle.net Account Bound (Polished Spaulders of Valor)
	{"^" .. PawnGameConstantUnwrapped(ITEM_UNIQUE)}, -- Unique; leave off the $ for Unique (20)
	{"^" .. PawnGameConstantUnwrapped(ITEM_UNIQUE_EQUIPPABLE)}, -- Unique-Equipped; leave off the $ for Unique-Equipped: Curios of the Shado-Pan Assault (1)
	{"^" .. PawnGameConstantUnwrapped(ITEM_BIND_QUEST)}, -- Leave off the $ for MonkeyQuest mod compatibility
	{PawnGameConstant(ITEM_STARTS_QUEST)}, -- This Item Begins a Quest
	{L.MultiStatHeading}, -- Multiple stats (Zen Wild Jade)
	{PawnGameConstant(PROFESSIONS_USED_IN_COOKING)}, -- Crafting Reagent
	{PawnGameConstant(ITEM_CONJURED)}, -- Conjured Item
	{PawnGameConstant(ITEM_PROSPECTABLE)}, -- Prospectable
	{PawnGameConstant(ITEM_MILLABLE)}, -- Millable
	{PawnGameConstant(ITEM_DISENCHANT_ANY_SKILL)}, -- Enchantable
	{PawnGameConstant(ITEM_DISENCHANT_NOT_DISENCHANTABLE)}, -- Cannot be disenchanted
	{PawnGameConstantIgnoredPlaceholder(ITEM_PROPOSED_ENCHANT)}, -- Appears in the trade window when an item is about to be enchanted ("Will receive +8 Stamina")
	{L.DisenchantingRequires}, -- Appears on item tooltips when the Disenchant ability is specified ("Disenchanting requires Enchanting (25)")
	{PawnGameConstant(ITEM_ENCHANT_DISCLAIMER)}, -- Item will not be traded!
	{L.Charges}, -- Brilliant Mana Oil
	{PawnGameConstant(LOCKED)}, -- Locked
	{PawnGameConstant(ENCRYPTED)}, -- Encrypted (does not seem to exist in the game yet)
	{PawnGameConstant(ITEM_SPELL_KNOWN)}, -- Already Known
	{PawnGameConstant(INVTYPE_HEAD)}, -- Head
	{PawnGameConstant(INVTYPE_NECK)}, -- Neck
	{PawnGameConstant(INVTYPE_SHOULDER)}, -- Shoulder
	{PawnGameConstant(INVTYPE_CLOAK)}, -- Back
	{PawnGameConstant(INVTYPE_ROBE)}, -- Chest
	{PawnGameConstant(INVTYPE_BODY)}, -- Shirt
	{PawnGameConstant(INVTYPE_TABARD)}, -- Tabard
	{PawnGameConstant(INVTYPE_WRIST)}, -- Wrist
	{PawnGameConstant(INVTYPE_HAND)}, -- Hands
	{PawnGameConstant(INVTYPE_WAIST)}, -- Waist
	{PawnGameConstant(INVTYPE_FEET)}, -- Feet
	{PawnGameConstant(INVTYPE_LEGS)}, -- Legs
	{PawnGameConstant(INVTYPE_FINGER)}, -- Finger
	{PawnGameConstant(INVTYPE_TRINKET)}, -- Trinket
	{PawnGameConstant(MOUNT)}, -- Cenarion War Hippogryph
	{PawnGameConstantIgnoredPlaceholder(ITEM_CLASSES_ALLOWED)}, -- Classes:
	{PawnGameConstantIgnoredPlaceholder(ITEM_RACES_ALLOWED)}, -- Races:
	{PawnGameConstantIgnoredNumberPlaceholder(DURABILITY_TEMPLATE)}, -- Durability X / Y
	{L.Duration},
	{L.CooldownRemaining},
	{"<.+>"}, -- Made by, Right-click to read, etc. (No ^$; can be prefixed by a color)
	{PawnGameConstantIgnoredPlaceholder(ITEM_WRITTEN_BY)}, -- Written by
	{L.BagSlots}, -- Bags of all kinds
	{L.TemporaryBuffSeconds}, -- Temporary item buff
	{L.TemporaryBuffMinutes}, -- Temporary item buff
	{PawnGameConstantIgnoredPlaceholder(ENCHANT_ITEM_REQ_SKILL)}, -- Seen on the enchanter-only ring enchantments when you're not an enchanter, and socketed jewelcrafter-only BoP gems
	{L.Corruption}, -- /pawn compare item:172198::::::::120:262::3:1:3524

	-- ========================================
	-- Strings that represent statistics that Pawn cares about
	-- ========================================
	{L.HeirloomLevelRange, "MaxScalingLevel"}, -- Scaling heirloom items
	{L.HeirloomXpBoost, "XpBoost", 1, PawnMultipleStatsFixed}, -- Experience-granting heirloom items
	{L.HeirloomXpBoost2, "XpBoost", 1, PawnMultipleStatsFixed}, -- unused in English
	{PawnGameConstant(INVTYPE_RANGED), "IsRanged", 1, PawnMultipleStatsFixed}, -- Ranged
	{PawnGameConstant(INVTYPE_RANGEDRIGHT), "IsRanged", 1, PawnMultipleStatsFixed}, -- Ranged (but the translation is different in Russian)
	{PawnGameConstant(INVTYPE_WEAPON), "IsOneHand", 1, PawnMultipleStatsFixed}, -- One-Hand
	{PawnGameConstant(INVTYPE_2HWEAPON), "IsTwoHand", 1, PawnMultipleStatsFixed}, -- Two-Hand
	{PawnGameConstant(INVTYPE_WEAPONMAINHAND), "IsMainHand", 1, PawnMultipleStatsFixed}, -- Main Hand
	{PawnGameConstant(INVTYPE_WEAPONOFFHAND), "IsOffHand", 1, PawnMultipleStatsFixed}, -- Off Hand
	{PawnGameConstant(INVTYPE_HOLDABLE), "IsFrill", 1, PawnMultipleStatsFixed}, -- Held In Off-Hand
	{L.WeaponDamage, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- Standard weapon (heirlooms can have decimal points in their damage values)
	{L.WeaponDamageExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Weapons with no damage range: Crossbow of the Albatross or Fine Light Crossbow, /pawn compare 15808
	{L.WeaponDamageFire, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- /pawn compare 19367
	{L.WeaponDamageFireExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Wand
	{L.WeaponDamageShadow, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- /pawn compare 18301
	{L.WeaponDamageShadowExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Battle Medic's Wand
	{L.WeaponDamageNature, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- /pawn compare 16997
	{L.WeaponDamageNatureExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Wand
	{L.WeaponDamageArcane, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- /pawn compare 13938
	{L.WeaponDamageArcaneExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Wand
	{L.WeaponDamageFrost, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- /pawn compare 19108
	{L.WeaponDamageFrostExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Wand
	{L.WeaponDamageHoly, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 2, PawnMultipleStatsExtract}, -- /pawn compare 22254
	{L.WeaponDamageHolyExact, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Wand
	{L.WeaponDamageEnchantment, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Weapon enchantments
	{L.WeaponDamageEquip, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Braided Eternium Chain (it's an item, not an enchantment)
	{L.Scope, "MinDamage", 1, PawnMultipleStatsExtract, "MaxDamage", 1, PawnMultipleStatsExtract}, -- Ranged weapon scopes
	{L.AllStats, "Strength", 1, PawnMultipleStatsExtract, "Agility", 1, PawnMultipleStatsExtract, "Stamina", 1, PawnMultipleStatsExtract, "Intellect", 1, PawnMultipleStatsExtract, "Spirit", 1, PawnMultipleStatsExtract}, -- Enchanted Pearl, Enchanted Tear, chest enchantments
	{L.Strength, "Strength"},
	{L.Agility, "Agility"},
	{L.Stamina, "Stamina"},
	{L.Intellect, "Intellect"}, -- negative Intellect: Kreeg's Mug
	{L.Spirit, "Spirit"},
	{L.EnchantmentTitaniumWeaponChain, "HasteRating", 28, PawnMultipleStatsFixed}, -- Weapon enchantment; also reduces disarm duration (may be obsolete?)
	{L.EnchantmentPyriumWeaponChain, "HasteRating", 8, PawnMultipleStatsFixed}, -- Weapon enchantment; also reduces disarm duration
	{L.EnchantmentLivingSteelWeaponChain, "CritRating", 13, PawnMultipleStatsFixed}, -- Weapon enchantment; also reduces disarm duration
	{L.Dodge, "DodgeRating"}, -- /pawn compare item:789::::::1754, or Classic arcanum and enchantment: /pawn compare item:19386:2622 /pawn compare item:21693:2545
	{L.Dodge2, "DodgeRating"}, -- unused in English
	{L.Dodge3, "DodgeRating"}, -- unused in English
	{L.DodgePercent, "DodgeRating"}, -- Classic, /pawn compare 11755
	{L.DodgeRating, "DodgeRating"}, -- Burning Crusade Classic, /pawn compare 11755
	{L.DodgeRating2, "DodgeRating"}, -- Burning Crusade Classic, /pawn compare 29323
	{L.DodgeRatingShort, "DodgeRating"}, -- Burning Crusade Classic, /pawn compare item:789::::::1754
	{L.Parry, "ParryRating"},
	{L.Parry2, "ParryRating"}, -- unused in English
	{L.ParryPercent, "ParryRating"}, -- Classic, /pawn compare 19351
	{L.ParryRating, "ParryRating"}, -- Burning Crusade Classic, /pawn compare 19351
	{L.ParryRatingShort, "ParryRating"}, -- Burning Crusade Classic, /pawn compare 24036
	{L.DefenseRating, "DefenseRating"}, -- Burning Crusade, /pawn compare 19867
	{L.DefenseRating2, "DefenseRating"}, -- Burning Crusade esMX or deDE, /pawn compare 29171
	{L.DefenseRatingSimple, "DefenseRating"}, -- Burning Crusade, /pawn compare item:789::::::89
	{L.DefenseSkill, "DefenseRating"}, -- Classic, /pawn compare 19867
	{L.DefenseSkillSimple, "DefenseRating"}, -- Classic, /pawn compare item:789::::::89
	{L.BlockPercent, "BlockRating"}, -- Classic, /pawn compare 18499
	{L.BlockRating, "BlockRating"}, -- Burning Crusade, /pawn compare 18499
	{L.BlockRating2, "BlockRating"}, -- Burning Crusade, /pawn compare 29323
	{L.Block, "BlockValue"}, -- Classic, /pawn compare 18499
	{L.BlockValue, "BlockValue"}, -- Classic, /pawn compare 18499
	{L.Dps}, -- Ignore this; DPS is calculated manually
	{L.DpsAdd, "Dps"},
	{L.EnchantmentFieryWeapon, "Dps", 4, PawnMultipleStatsFixed}, -- weapon enchantment
	{L.Crit, "CritRating"},
	{L.Crit2, "CritRating"},
	{L.CritPercent, "CritRating"}, -- Classic, /pawn compare 15062
	{L.CritRating, "CritRating"}, -- Burning Crusade, /pawn compare 15062
	{L.CritRating2, "CritRating"}, -- Burning Crusade, /pawn compare 30710
	{L.CritRating3, "CritRating"}, -- Burning Crusade, /pawn compare 28796
	{L.CritRatingShort, "CritRating"}, -- Burning Crusade, /pawn compare item:789::::::78
	{L.ScopeCrit, "CritRating"},
	{L.ScopeRangedCrit, "CritRating"}, -- Heartseeker Scope
	{L.SpellCrit, "SpellCritRating"}, -- Classic, /pawn compare 16947
	{L.SpellCritRating, "SpellCritRating"}, -- Burning Crusade, /pawn compare 16947
	{L.SpellCritRating2, "SpellCritRating"}, -- Burning Crusade, /pawn compare 24256
	{L.SpellCritRatingShort, "SpellCritRating"}, -- Burning Crusade, https://tbc.wowhead.com/item=24050/gleaming-dawnstone
	{L.SpellCritRatingShort2, "SpellCritRating"}, -- Burning Crusade, /pawn compare 29317 (socket bonus)
	{L.Hit, "HitRating"}, -- Classic, /pawn compare 16947
	{L.Hit2, "HitRating"}, -- unused in English
	{L.HitRating, "HitRating"}, -- Burning Crusade, /pawn compare 28182
	{L.HitRating2, "HitRating"}, -- Burning Crusade, /pawn compare 18500
	{L.HitRating3, "HitRating"}, -- Burning Crusade in Spanish, /pawn compare 32570
	{L.HitRatingShort, "HitRating"}, -- Burning Crusade, https://tbc.wowhead.com/item=24051/rigid-dawnstone
	{L.SpellHit, "SpellHitRating"}, -- /pawn compare 16795
	{L.SpellHitRating, "SpellHitRating"}, -- Burning Crusade, /pawn compare 16795
	{L.SpellHitRating2, "SpellHitRating"}, -- Burning Crusade, /pawn compare 24266
	{L.SpellHitRatingShort, "SpellHitRating"}, -- Burning Crusade, https://tbc.wowhead.com/item=31861/great-dawnstone
	{L.ExpertiseRating, "ExpertiseRating"}, -- Burning Crusade, /pawn compare 19351
	{L.ExpertiseRatingShort, "ExpertiseRating"}, -- Wrath, Precise Bloodstone
	{L.ArmorPenetration, "ArmorPenetration"},
	{L.ArmorPenetrationRating, "ArmorPenetration"}, -- Burning Crusade, /pawn compare 34703
	{L.ArmorPenetrationRating2, "ArmorPenetration"}, -- Burning Crusade, /pawn compare 41592 or 42642 depending on locale
	{L.ArmorPenetrationShort, "ArmorPenetration"}, -- Wrath, Fractured Scarlet Ruby
	{L.Resilience, "ResilienceRating"}, -- Mystic Dawnstone
	{L.Resilience2, "ResilienceRating"}, -- unused in English
	{L.ResilienceRating, "ResilienceRating"}, -- /pawn compare 29181
	{L.ResilienceRatingShort, "ResilienceRating"}, -- Burning Crusade, https://tbc.wowhead.com/item=24053/mystic-dawnstone
	{L.PvPPower, "Stamina"}, -- Stormy Chalcedony
	{L.EnchantmentCounterweight, "HasteRating"}, -- won't work on classic since the live string includes the word "haste" and it's worded differently in classic
	{L.Haste, "HasteRating"}, -- Leggings of the Betrayed
	{L.Haste2, "HasteRating"}, -- unused in English
	{L.HasteRating, "HasteRating"}, -- Burning Crusade, /pawn compare 32570
	{L.HasteRating2, "HasteRating"}, -- Burning Crusade esES, /pawn compare 32570
	{L.HasteRatingShort, "HasteRating"}, -- Wrath, Quick Sun Crystal / Burning Crusade, random-stat items only
	{L.SpellHasteRating, "SpellHasteRating"}, -- /pawn compare 34360
	{L.SpellHasteRatingShort, "SpellHasteRating"}, -- https://tbc.wowhead.com/item=35315/quick-dawnstone
	{L.SpellPenetration, "SpellPenetration"}, -- Burning Crusade, /pawn compare 21563
	{L.SpellPenetrationClassic, "SpellPenetration"}, -- Classic (pre-TBC), /pawn compare 21338
	{L.SpellPenetrationShort, "SpellPenetration"}, -- Burning Crusade, https://tbc.wowhead.com/item=24039/stormy-star-of-elune
	{L.Mastery, "MasteryRating"}, -- Zen Dream Emerald
	{L.Mastery2, "MasteryRating"}, -- unused in English
	{L.Versatility, "Versatility"}, -- http://wod.wowhead.com/item=100945
	{L.Leech, "Leech"}, -- http://wod.wowhead.com/item=100945
	{L.Avoidance, "Avoidance"}, -- http://wod.wowhead.com/item=100945
	{PawnGameConstant(STAT_STURDINESS), "Indestructible", 1, PawnMultipleStatsFixed}, -- http://wod.wowhead.com/item=100945
	{L.MovementSpeed, "MovementSpeed"}, -- http://wod.wowhead.com/item=100945
	{L.Ap, "Ap"}, -- /pawn compare item:789::::::1547
	{L.Ap2, "Ap"}, -- /pawn compare 15062
	{L.Ap3, "Ap"}, -- /pawn compare 18821
	{L.Rap, "Rap"}, -- Classic, /pawn compare 18473
	{L.Rap2, "Rap"}, -- Burning Crusade and Wrath Classic, /pawn compare 18713
	{L.FeralAp, "FeralAp"}, -- Classic, /pawn compare 22988
	{L.FeralApMoonkin, "FeralAp"}, -- Burning Crusade, /pawn compare 22988
	{L.FeralApWrath}, -- Wrath, /pawn compare 22988 (in Wrath it only appears on druid items and is not a real stat, but it shouldn't get an orange diamond)
	{L.Mp5, "Mp5"}, -- /pawn compare 22988
	{L.Mp52, "Mp5"}, -- /pawn compare item:789::::::2074
	{L.Mp53, "Mp5"}, -- Burning Crusade, socket bonus on /pawn compare 34360
	{L.Mp54, "Mp5"}, -- Burning Crusade, /script PawnUIGetAllTextForItem("item:24057") and /pawn compare 28522
	{L.Mp55, "Mp5"}, -- Burning Crusade, /pawn compare 28304
	{L.Hp5, "Hp5"}, -- (on live, we used to count 1 HP5 = 3 Stamina)
	{L.Hp52, "Hp5"}, -- Demon's Blood
	{L.Hp53, "Hp5"}, -- Aquamarine Signet of Regeneration or /pawn compare item:789::::::2110
	{L.Hp54, "Hp5"}, -- Lifestone
	{L.Hp55, "Hp5"}, -- /pawn compare item:789::::::-28
	{L.EnchantmentHealth, "Stamina", 1/12.5, PawnSingleStatMultiplier}, -- +100 health head/leg enchantment (counting 1 HP = 1/12.5 Stamina)
	{L.EnchantmentHealth2, "Stamina", 1/12.5, PawnSingleStatMultiplier}, -- +150 health enchantment (counting 1 HP = 1/12.5 Stamina)
	{L.Armor, "Armor"}, -- normal armor and cloak armor enchantments
	{L.Armor2, "Armor"}, -- unused in English
	{L.EnchantmentArmorKit, "Armor"}, -- armor kits
	{L.FireResist, "FireResist"}, -- /pawn compare 12609
	{L.NatureResist, "NatureResist"}, -- /pawn compare 12609
	{L.FrostResist, "FrostResist"}, -- /pawn compare 12609
	{L.ShadowResist, "ShadowResist"}, -- /pawn compare 12609
	{L.ArcaneResist, "ArcaneResist"}, -- /pawn compare 12609
	{L.SpellDamage, "SpellDamage", 1, PawnMultipleStatsExtract, "Healing", 1, PawnMultipleStatsExtract}, -- /pawn compare item:20686::::::2159 ("of Sorcery" on Classic)
	{L.SpellDamage2, "SpellDamage", 1, PawnMultipleStatsExtract, "Healing", 1, PawnMultipleStatsExtract}, -- /pawn compare 16947
	{L.SpellDamage3, "SpellDamage", 1, PawnMultipleStatsExtract, "Healing", 1, PawnMultipleStatsExtract}, -- French on Classic uses two different wordings:  /pawn compare 20641 vs. /pawn compare 10041
	{L.SpellDamage4, "SpellDamage", 1, PawnMultipleStatsExtract, "Healing", 1, PawnMultipleStatsExtract}, -- Simplified Chinese on Classic uses many different wordings:  /pawn compare 16923 vs. /pawn compare 18608
	{L.SpellDamage5, "SpellDamage", 1, PawnMultipleStatsExtract, "Healing", 1, PawnMultipleStatsExtract}, -- Burning Crusade, /pawn compare item:789::::::-36
	{L.SpellDamage6, "SpellDamage", 1, PawnMultipleStatsExtract, "Healing", 1, PawnMultipleStatsExtract}, -- Burning Crusade, /pawn compare 33467
	{L.SpellDamageAndHealing, "Healing", 1, PawnMultipleStatsExtract, "SpellDamage", 2, PawnMultipleStatsExtract}, -- Burning Crusade, /pawn compare 34360
	{L.SpellDamageAndHealing2, "Healing", 1, PawnMultipleStatsExtract, "SpellDamage", 2, PawnMultipleStatsExtract}, -- Burning Crusade, /pawn compare 28304
	{L.SpellDamageAndHealingEnchant, "Healing", 1, PawnMultipleStatsExtract, "SpellDamage", 2, PawnMultipleStatsExtract}, -- Burning Crusade, /script PawnUIGetAllTextForItem("item:16943:2566") (matches Short in some locales; don't double-dip)
	{L.SpellDamageAndHealingShort, "Healing", 1, PawnMultipleStatsExtract, "SpellDamage", 2, PawnMultipleStatsExtract}, -- Burning Crusade, /pawn compare item:789::::::2041
	{L.SpellDamageAndHealingShort2, "Healing", 1, PawnMultipleStatsExtract, "SpellDamage", 2, PawnMultipleStatsExtract}, -- Burning Crusade, /script PawnUIGetAllTextForItem("item:24060")
	{L.FireSpellDamage, "FireSpellDamage"}, -- /pawn compare item:789::::::1878
	{L.FireSpellDamage2, "FireSpellDamage"}, -- /pawn compare 944
	{L.FireSpellDamage3, "FireSpellDamage"}, -- /pawn compare item:789::::::-22
	{L.ShadowSpellDamage, "ShadowSpellDamage"}, -- /pawn compare item:789::::::1841
	{L.ShadowSpellDamage2, "ShadowSpellDamage"}, -- /pawn compare 1980
	{L.ShadowSpellDamage3, "ShadowSpellDamage"}, -- /pawn compare 19133, zhCN Classic only
	{L.ShadowSpellDamage4, "ShadowSpellDamage"}, -- /pawn compare item:789::::::-25
	{L.NatureSpellDamage, "NatureSpellDamage"}, -- /pawn compare item:789::::::1997
	{L.NatureSpellDamage2, "NatureSpellDamage"}, -- /pawn compare 18829
	{L.NatureSpellDamage3, "NatureSpellDamage"}, -- /pawn compare item:789::::::-24
	{L.ArcaneSpellDamage, "ArcaneSpellDamage"}, -- /pawn compare item:789::::::1801
	{L.ArcaneSpellDamage2, "ArcaneSpellDamage"}, -- /pawn compare 19308
	{L.ArcaneSpellDamage3, "ArcaneSpellDamage"}, -- /pawn compare item:789::::::-21
	{L.FrostSpellDamage, "FrostSpellDamage"}, -- /pawn compare item:789::::::1954
	{L.FrostSpellDamage2, "FrostSpellDamage"}, -- /pawn compare 944
	{L.FrostSpellDamage3, "FrostSpellDamage"}, -- /pawn compare item:789::::::-23
	{L.HolySpellDamage, "HolySpellDamage"},
	{L.HolySpellDamage2, "HolySpellDamage"}, -- /pawn compare 20504
	{L.HolySpellDamage3, "HolySpellDamage"}, -- /pawn compare 30642
	{L.Healing, "Healing"}, -- /pawn compare item:789::::::2028
	{L.Healing2, "Healing"}, -- /pawn compare 16947
	{L.Healing3, "Healing"}, -- Burning Crusade, /pawn compare item:789::::::-38
	{L.SpellPower, "SpellPower"}, -- /pawn tooltip 39998
	{L.SpellPower2, "SpellPower"}, -- /pawn compare 40585
	{L.SpellPower3, "SpellPower"}, -- /pawn compare item:20686::::::2159
	{PawnGameConstant(EMPTY_SOCKET_RED), "RedSocket", 1, PawnMultipleStatsFixed},
	{PawnGameConstant(EMPTY_SOCKET_YELLOW), "YellowSocket", 1, PawnMultipleStatsFixed},
	{PawnGameConstant(EMPTY_SOCKET_BLUE), "BlueSocket", 1, PawnMultipleStatsFixed},
	{PawnGameConstant(EMPTY_SOCKET_META), "MetaSocket", 1, PawnMultipleStatsFixed},
	{PawnGameConstant(EMPTY_SOCKET_COGWHEEL), "CogwheelSocket", 1, PawnMultipleStatsFixed},
	{PawnGameConstant(EMPTY_SOCKET_PRISMATIC), "PrismaticSocket", 1, PawnMultipleStatsFixed},
	{PawnGameConstant(EMPTY_SOCKET_DOMINATION or "UNUSED")}, -- domination sockets are now ignored

	-- In WoW Classic, crossbows, guns, and wands don't show "Ranged" and instead show the weapon type on the left.
	{L.Bow, "IsBow", 1, PawnMultipleStatsFixed, "IsRanged", 1, PawnMultipleStatsFixed},
	{L.Crossbow, "IsCrossbow", 1, PawnMultipleStatsFixed, "IsRanged", 1, PawnMultipleStatsFixed},
	{L.Gun, "IsGun", 1, PawnMultipleStatsFixed, "IsRanged", 1, PawnMultipleStatsFixed},
	{L.Wand, "IsWand", 1, PawnMultipleStatsFixed, "IsRanged", 1, PawnMultipleStatsFixed},
	{L.Thrown, "IsThrown", 1, PawnMultipleStatsFixed, "IsRanged", 1, PawnMultipleStatsFixed},

	-- ========================================
	-- Rare strings that are ignored (common ones are at the top of the file)
	-- ========================================
	{'^"'}, -- Flavor text
	{PawnGameConstantIgnoredPlaceholder(ITEM_MIN_LEVEL)}, -- "Requires Level XX"... but "Requires level XX to YY" we DO care about.
	{PawnGameConstantIgnoredPlaceholder(ITEM_REQ_SKILL)}, -- "Requires SKILL (XX)"
	{L.Requires2}, -- unused in English
}

-- These regexes work exactly the same as PawnRegexes, but they're used to parse the right side of tooltips.
-- Unrecognized stats on the right side are always ignored.
-- Two-handed Axes, Maces, and Swords will have their stats converted to the 2H version later.
PawnRightHandRegexes =
{
	{L.Speed, "Speed"},
	{L.Speed2, "Speed"}, -- unused in English
	{L.Axe, "IsAxe", 1, PawnMultipleStatsFixed},
	{L.Bow, "IsBow", 1, PawnMultipleStatsFixed},
	{L.Crossbow, "IsCrossbow", 1, PawnMultipleStatsFixed},
	{L.Dagger, "IsDagger", 1, PawnMultipleStatsFixed},
	{L.FistWeapon, "IsFist", 1, PawnMultipleStatsFixed},
	{L.Gun, "IsGun", 1, PawnMultipleStatsFixed},
	{L.Mace, "IsMace", 1, PawnMultipleStatsFixed},
	{L.Polearm, "IsPolearm", 1, PawnMultipleStatsFixed},
	{L.Staff, "IsStaff", 1, PawnMultipleStatsFixed},
	{L.Sword, "IsSword", 1, PawnMultipleStatsFixed},
	{L.Warglaives, "IsWarglaive", 1, PawnMultipleStatsFixed},
	{L.Wand, "IsWand", 1, PawnMultipleStatsFixed},
	{L.Cloth, "IsCloth", 1, PawnMultipleStatsFixed},
	{L.Leather, "IsLeather", 1, PawnMultipleStatsFixed},
	{L.Mail, "IsMail", 1, PawnMultipleStatsFixed},
	{L.Plate, "IsPlate", 1, PawnMultipleStatsFixed},
	{L.Shield, "IsShield", 1, PawnMultipleStatsFixed},
}

-- Each language has some regexes that aren't necessary for that particular language. For performance, let's remove those from the table right now.
-- TODO: For even more of a performance boost, filter out every regex that produces a stat that doesn't exist on the current version of the game.
local FilteredRegexes = {}
local _, Regex, LastRegex
local KeptCount, RemovedCount = 0, 0
for _, Regex in pairs(PawnRegexes) do
	if Regex[1] == "" or Regex[1] == "^UNUSED$" then
		RemovedCount = RemovedCount + 1
	elseif Regex[1] == nil then
		VgerCore.Fail("Localization error in regex table for " .. tostring(Regex[2]) .. " AFTER \"" .. VgerCore.Color.Blue .. PawnEscapeString(tostring(LastRegex)) .. "|r\".")
	else
		tinsert(FilteredRegexes, Regex)
		KeptCount = KeptCount + 1
		LastRegex = Regex[1]
	end
end
PawnRegexes = FilteredRegexes
--VgerCore.Message("Performance boost: removed " .. RemovedCount .. " regexes (" .. floor(100 * RemovedCount / (RemovedCount + KeptCount)) .. "%)")
