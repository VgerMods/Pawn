-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

--
-- UI strings
------------------------------------------------------------

local L


------------------------------------------------------------
-- Master table of stats
------------------------------------------------------------

-- For conciseness
L = PawnLocal.Stats

local PawnStatNormal = 1
local PawnStatUnignorable = 2
local PawnStatItemType = 3

-- The master list of all stats that Pawn supports.
-- First column is the friendly translated name of the stat.
-- Second column is the Pawn name of the stat; this can't be translated.
-- Third column is the description of the stat; if not present, then it won't show up on the Values tab.
-- Fourth column is true if the stat can't be ignored.
-- Fifth column is an optional chunk of text instead of the "1 ___ is worth:" prompt.
-- Sixth column is optional, and determines which versions of WoW the stat shows up in.
-- If only a name is present, the row becomes an uneditable header in the UI and is otherwise ignored.
local PawnStatsUnfiltered =
{
	{STAT_CATEGORY_ATTRIBUTES},
	{SPELL_STAT1_NAME, "Strength", L.StrengthInfo, PawnStatUnignorable},
	{SPELL_STAT2_NAME, "Agility", L.AgilityInfo, PawnStatUnignorable},
	{SPELL_STAT4_NAME, "Intellect", L.IntellectInfo, PawnStatUnignorable},
	{SPELL_STAT3_NAME, "Stamina", L.StaminaInfo, PawnStatUnignorable},
	{SPELL_STAT5_NAME, "Spirit", L.SpiritInfo, PawnStatUnignorable, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ARMOR, "Armor", L.ArmorInfo, PawnStatUnignorable},

	{STAT_CATEGORY_ENHANCEMENTS},
	{ITEM_MOD_HIT_RATING_SHORT, "HitRating", L.HitInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_HIT_SPELL_RATING_SHORT, "SpellHitRating", L.SpellHitInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true }},
	{L.Crit, "CritRating", L.CritInfo},
	{ITEM_MOD_CRIT_SPELL_RATING_SHORT, "SpellCritRating", L.SpellCritInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true }},
	{STAT_HASTE, "HasteRating", L.HasteInfo, PawnStatNormal, nil, { PawnStatBurningCrusade = true, PawnStatWrath = true, PawnStatMainline = true }},
	{ITEM_MOD_HASTE_SPELL_RATING_SHORT or (STAT_HASTE .. " (" .. PLAYERSTAT_SPELL_COMBAT .. ")"), "SpellHasteRating", L.HasteInfo, PawnStatNormal, nil, { PawnStatBurningCrusade = true }},
	{ITEM_MOD_ARMOR_PENETRATION_RATING_SHORT, "ArmorPenetration", L.ArmorPenetrationInfo, PawnStatNormal, nil, { PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_EXPERTISE_RATING_SHORT, "ExpertiseRating", L.ExpertiseInfo, PawnStatNormal, nil, { PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_SPELL_PENETRATION_SHORT, "SpellPenetration", L.SpellPenetrationInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{STAT_MASTERY, "MasteryRating", L.MasteryInfo, PawnStatNormal, nil, { PawnStatMainline = true }},
	{STAT_VERSATILITY, "Versatility", L.VersatilityInfo, PawnStatNormal, nil, { PawnStatMainline = true }},
	{ITEM_MOD_ATTACK_POWER_SHORT, "Ap", L.ApInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_RANGED_ATTACK_POWER_SHORT, "Rap", L.RapInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_FERAL_ATTACK_POWER_SHORT, "FeralAp", L.FeralApInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.SpellDamage, "SpellDamage", L.SpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true }},
	{L.Healing, "Healing", L.HealingInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true }},
	{ITEM_MOD_SPELL_POWER_SHORT, "SpellPower", L.SpellPowerInfo, PawnStatNormal, nil, { PawnStatWrath = true }},
	{ITEM_MOD_DEFENSE_SKILL_RATING_SHORT, "DefenseRating", L.DefenseInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_DODGE_RATING_SHORT, "DodgeRating", L.DodgeInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_PARRY_RATING_SHORT , "ParryRating", L.ParryInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_BLOCK_RATING_SHORT, "BlockRating", L.BlockRatingInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_BLOCK_VALUE_SHORT, "BlockValue", L.BlockValueInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_RESILIENCE_RATING_SHORT, "ResilienceRating", L.ResilienceInfo, PawnStatNormal, nil, { PawnStatBurningCrusade = true, PawnStatWrath = true }},

	{L.Sockets, nil, nil, nil, nil, { PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{EMPTY_SOCKET_META, "MetaSocketEffect", L.MetaSocketEffectInfo, PawnStatNormal, nil, { PawnStatBurningCrusade = true, PawnStatWrath = true }},

	{L.MinorStats},
	{STAT_MOVEMENT_SPEED, "MovementSpeed", L.MovementSpeedInfo, PawnStatNormal, nil, { PawnStatMainline = true }},
	{STAT_AVOIDANCE, "Avoidance", L.AvoidanceInfo, PawnStatNormal, nil, { PawnStatMainline = true }},
	{STAT_LIFESTEAL, "Leech", L.LeechInfo, PawnStatNormal, nil, { PawnStatMainline = true }},
	{STAT_STURDINESS, "Indestructible", L.IndestructibleInfo, PawnStatNormal, L.IndestructibleIs, { PawnStatMainline = true }},
	{ITEM_MOD_POWER_REGEN0_SHORT, "Mp5", L.Mp5Info, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{ITEM_MOD_HEALTH_REGEN_SHORT, "Hp5", L.Hp5Info, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{RESISTANCE2_NAME, "FireResist", L.FireResistInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{RESISTANCE3_NAME, "NatureResist", L.NatureResistInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{RESISTANCE4_NAME, "FrostResist", L.FrostResistInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{RESISTANCE5_NAME, "ShadowResist", L.ShadowResistInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{RESISTANCE6_NAME, "ArcaneResist", L.ArcaneResistInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.FireSpellDamage, "FireSpellDamage", L.FireSpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.ShadowSpellDamage, "ShadowSpellDamage", L.ShadowSpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.NatureSpellDamage, "NatureSpellDamage", L.NatureSpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.ArcaneSpellDamage, "ArcaneSpellDamage", L.ArcaneSpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.FrostSpellDamage, "FrostSpellDamage", L.FrostSpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.HolySpellDamage, "HolySpellDamage", L.HolySpellDamageInfo, PawnStatNormal, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},

	{L.WeaponStats},
	{STAT_DPS_SHORT, "Dps", L.DpsInfo, PawnStatUnignorable},
	{WEAPON_SPEED, "Speed", L.SpeedInfo, PawnStatUnignorable, L.SpeedIs},

	{L.ArmorTypes},
	{L.Cloth, "IsCloth", L.ClothInfo, PawnStatItemType},
	{L.Leather, "IsLeather", L.LeatherInfo, PawnStatItemType},
	{L.Mail, "IsMail", L.MailInfo, PawnStatItemType},
	{L.Plate, "IsPlate", L.PlateInfo, PawnStatItemType},
	{L.Shield, "IsShield", L.ShieldInfo, PawnStatItemType},

	{L.WeaponTypes},
	{L.WeaponType1HAxe, "IsAxe", L.WeaponType1HAxeInfo, PawnStatItemType},
	{L.WeaponType2HAxe, "Is2HAxe", L.WeaponType2HAxeInfo, PawnStatItemType},
	{L.WeaponTypeBow, "IsBow", L.WeaponTypeBowInfo, PawnStatItemType},
	{L.WeaponTypeCrossbow, "IsCrossbow", L.WeaponTypeCrossbowInfo, PawnStatItemType},
	{L.WeaponTypeDagger, "IsDagger", L.WeaponTypeDaggerInfo, PawnStatItemType},
	{L.WeaponTypeFistWeapon, "IsFist", L.WeaponTypeFistWeaponInfo, PawnStatItemType},
	{L.WeaponTypeGun, "IsGun", L.WeaponTypeGunInfo, PawnStatItemType},
	{L.WeaponType1HMace, "IsMace", L.WeaponType1HMaceInfo, PawnStatItemType},
	{L.WeaponType2HMace, "Is2HMace", L.WeaponType2HMaceInfo, PawnStatItemType},
	{L.WeaponTypePolearm, "IsPolearm", L.WeaponTypePolearmInfo, PawnStatItemType},
	{L.WeaponTypeStaff, "IsStaff", L.WeaponTypeStaffInfo, PawnStatItemType},
	{L.WeaponType1HSword, "IsSword", L.WeaponType1HSwordInfo, PawnStatItemType},
	{L.WeaponType2HSword, "Is2HSword", L.WeaponType2HSwordInfo, PawnStatItemType},
	{L.WeaponTypeThrown, "IsThrown", L.WeaponTypeThrownInfo, PawnStatItemType, nil, { PawnStatClassic = true, PawnStatBurningCrusade = true, PawnStatWrath = true }},
	{L.WeaponTypeWand, "IsWand", L.WeaponTypeWandInfo, PawnStatItemType},
	{L.WeaponTypeWarglaive, "IsWarglaive", L.WeaponTypeWarglaiveInfo, PawnStatItemType, nil, { PawnStatMainline = true }},
	{L.WeaponTypeOffHand, "IsOffHand", L.WeaponTypeOffHandInfo, PawnStatItemType},
	{L.WeaponTypeFrill, "IsFrill", L.WeaponTypeFrillInfo, PawnStatItemType},

	{L.SpecialWeaponStats},
	{L.WeaponMinDamage, "MinDamage", L.WeaponMinDamageInfo, PawnStatUnignorable},
	{L.WeaponMaxDamage, "MaxDamage", L.WeaponMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponMeleeDps, "MeleeDps", L.WeaponMeleeDpsInfo, PawnStatUnignorable},
	{L.WeaponMeleeMinDamage, "MeleeMinDamage", L.WeaponMeleeMinDamageInfo, PawnStatUnignorable},
	{L.WeaponMeleeMaxDamage, "MeleeMaxDamage", L.WeaponMeleeMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponMeleeSpeed, "MeleeSpeed", L.WeaponMeleeSpeedInfo, PawnStatUnignorable},
	{L.WeaponRangedDps, "RangedDps", L.WeaponRangedDpsInfo, PawnStatUnignorable},
	{L.WeaponRangedMinDamage, "RangedMinDamage", L.WeaponRangedMinDamageInfo, PawnStatUnignorable},
	{L.WeaponRangedMaxDamage, "RangedMaxDamage", L.WeaponRangedMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponRangedSpeed, "RangedSpeed", L.WeaponRangedSpeedInfo, PawnStatUnignorable},
	{L.WeaponMainHandDps, "MainHandDps", L.WeaponMainHandDpsInfo, PawnStatUnignorable},
	{L.WeaponMainHandMinDamage, "MainHandMinDamage", L.WeaponMainHandMinDamageInfo, PawnStatUnignorable},
	{L.WeaponMainHandMaxDamage, "MainHandMaxDamage", L.WeaponMainHandMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponMainHandSpeed, "MainHandSpeed", L.WeaponMainHandSpeedInfo, PawnStatUnignorable},
	{L.WeaponOffHandDps, "OffHandDps", L.WeaponOffHandDpsInfo, PawnStatUnignorable},
	{L.WeaponOffHandMinDamage, "OffHandMinDamage", L.WeaponOffHandMinDamageInfo, PawnStatUnignorable},
	{L.WeaponOffHandMaxDamage, "OffHandMaxDamage", L.WeaponOffHandMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponOffHandSpeed, "OffHandSpeed", L.WeaponOffHandSpeedInfo, PawnStatUnignorable},
	{L.WeaponOneHandDps, "OneHandDps", L.WeaponOneHandDpsInfo, PawnStatUnignorable},
	{L.WeaponOneHandMinDamage, "OneHandMinDamage", L.WeaponOneHandMinDamageInfo, PawnStatUnignorable},
	{L.WeaponOneHandMaxDamage, "OneHandMaxDamage", L.WeaponOneHandMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponOneHandSpeed, "OneHandSpeed", L.WeaponOneHandSpeedInfo, PawnStatUnignorable},
	{L.WeaponTwoHandDps, "TwoHandDps", L.WeaponTwoHandDpsInfo, PawnStatUnignorable},
	{L.WeaponTwoHandMinDamage, "TwoHandMinDamage", L.WeaponTwoHandMinDamageInfo, PawnStatUnignorable},
	{L.WeaponTwoHandMaxDamage, "TwoHandMaxDamage", L.WeaponTwoHandMaxDamageInfo, PawnStatUnignorable},
	{L.WeaponTwoHandSpeed, "TwoHandSpeed", L.WeaponTwoHandSpeedInfo, PawnStatUnignorable},
	{L.SpeedBaseline, "SpeedBaseline", L.SpeedBaselineInfo, PawnStatUnignorable, L.SpeedBaselineIs},
}

-- Filter this list based on expansion level.
local i, Stat
PawnStats = {}

for i, Stat in pairs(PawnStatsUnfiltered) do
	if	(Stat[6] == nil) or
		(Stat[6].PawnStatClassic and VgerCore.IsClassic) or
		(Stat[6].PawnStatBurningCrusade and VgerCore.IsBurningCrusade) or
		(Stat[6].PawnStatWrath and VgerCore.IsWrath) or
		(Stat[6].PawnStatMainline and VgerCore.IsMainline) then
		Stat[6] = nil
		tinsert(PawnStats, Stat)
	end
end


------------------------------------------------------------
-- UI strings
------------------------------------------------------------

-- For conciseness
L = PawnLocal.UI


-- Translation note: All of the strings ending in _Text should be translated; those will show up in the UI.  The strings ending
-- in _Tooltip are only used in tooltips, and can be safely left out.  If you don't want to translate them right now, delete those
-- lines or set them to nil, and Pawn won't show tooltips for those UI elements.


-- Configuration UI
PawnUITabLabels =
{
	L.ScaleTab,
	L.ValuesTab,
	L.CompareTab,
	L.GemsTab,
	L.OptionsTab,
	L.HelpTab,
	L.AboutTab,
}

PawnUIHeaders = -- (%s is the name of the current scale)
{
	L.ScaleHeader, -- Scale tab
	L.ValuesHeader, -- Values tab
	L.CompareHeader, -- Compare tab
	L.GemsHeader, -- Gems tab
	L.OptionsHeader, -- Options tab
	L.HelpHeader, -- Getting Started tab
	L.AboutHeader, -- About tab
}

-- Configuration UI, Scale selector
PawnUIFrame_ScaleSelector_Header_Text = L.ScaleSelectorHeader
PawnUIFrame_ScaleSelector_NoneWarning_Text = L.ScaleSelectorNoneWarning
PawnUIFrame_ShowScaleCheck_Label_Text = L.ScaleSelectorShowScale
PawnUIFrame_ShowScaleCheck_Tooltip = L.ScaleSelectorShowScaleTooltip
PawnUIFrame_ScaleSelector_ShowingSuggestionsFor_Text = L.ScaleSelectorShowingSuggestionsFor

-- Configuration UI, Scale tab
PawnUIFrame_ScalesWelcomeLabel_Text = L.ScaleWelcome

PawnUIFrame_RenameScaleButton_Text = L.ScaleRename
PawnUIFrame_RenameScaleButton_Tooltip = L.ScaleRenameTooltip
PawnUIFrame_DeleteScaleButton_Text = DELETE
PawnUIFrame_DeleteScaleButton_Tooltip = L.ScaleDeleteTooltip
PawnUIFrame_ScaleColorSwatch_Label_Text = L.ScaleChangeColor
PawnUIFrame_ScaleColorSwatch_Tooltip = L.ScaleChangeColorTooltip
PawnUIFrame_ScaleTypeLabel_NormalScaleText = L.ScaleTypeNormal
PawnUIFrame_ScaleTypeLabel_ReadOnlyScaleText = L.ScaleTypeReadOnly

PawnUIFrame_ScaleSettingsShareHeader_Text = L.ScaleShareHeader

PawnUIFrame_ImportScaleButton_Text = L.ScaleImport
PawnUIFrame_ImportScaleButton_Tooltip = L.ScaleImportTooltip
PawnUIFrame_ExportScaleButton_Text = L.ScaleExport
PawnUIFrame_ExportScaleButton_Tooltip = L.ScaleExportTooltip

PawnUIFrame_ScaleSettingsNewHeader_Text = L.ScaleNewHeader

PawnUIFrame_CopyScaleButton_Text = L.ScaleCopy
PawnUIFrame_CopyScaleButton_Label_Text = L.ScaleCopyTooltip
PawnUIFrame_NewScaleButton_Text = L.ScaleEmpty
PawnUIFrame_NewScaleButton_Label_Text = L.ScaleEmptyTooltip
PawnUIFrame_NewScaleFromDefaultsButton_Text = L.ScaleDefaults
PawnUIFrame_NewScaleFromDefaultsButton_Label_Text = L.ScaleDefaultsTooltip

PawnUIFrame_AutoSelectScalesWelcome_Text = L.ScaleAutoWelcome

PawnUIFrame_AutoSelectScalesOnButton_Text = L.ScaleAutoOn
PawnUIFrame_AutoSelectScalesOnButton_Subtext = L.ScaleAutoOn2
PawnUIFrame_AutoSelectScalesOnButton_Tooltip = L.ScaleAutoOnTooltip
PawnUIFrame_AutoSelectScalesOffButton_Text = L.ScaleAutoOff
PawnUIFrame_AutoSelectScalesOffButton_Subtext = L.ScaleAutoOff2
PawnUIFrame_AutoSelectScalesOffButton_Tooltip = L.ScaleAutoOffTooltip

-- Configuration UI, Values tab
PawnUIFrame_ValuesWelcomeLabel_NormalText = L.ValuesWelcome
PawnUIFrame_ValuesWelcomeLabel_NoScalesText = L.ValuesWelcomeNoScales
PawnUIFrame_ValuesWelcomeLabel_ReadOnlyScaleText = L.ValuesWelcomeReadOnly

PawnUIFrame_ClearValueButton_Text = L.ValuesRemove
PawnUIFrame_ClearValueButton_Tooltip = L.ValuesRemoveTooltip

PawnUIFrame_IgnoreStatCheck_Tooltip = L.ValuesIgnoreStatTooltip

PawnUIFrame_NoUpgradesCheck_Tooltip = L.ValuesDoNotShowUpgradesTooltip

PawnUIFrame_FollowSpecializationCheck_Text = format(L.ValuesFollowSpecialization, PawnArmorSpecializationLevel)
PawnUIFrame_FollowSpecializationCheck_Tooltip = format(L.ValuesFollowSpecializationTooltip, PawnArmorSpecializationLevel, PawnArmorSpecializationLevel, PawnArmorSpecializationLevel)

PawnUIFrame_NormalizeValuesCheck_Text = L.ValuesNormalize
PawnUIFrame_NormalizeValuesCheck_Tooltip = L.ValuesNormalizeTooltip

-- Configuration UI, Compare tab
PawnUIFrame_VersusHeader_Text = L.CompareVersus -- Short for "versus."  Appears between the names of the two items.
PawnUIFrame_VersusHeader_NoItem = L.CompareSlotEmpty -- Text displayed next to empty item slots.

PawnUIFrame_CompareMissingItemInfo_TextRight = L.CompareWelcomeRight

PawnUIFrame_ClearItemsButton_Label = L.CompareClearItems
PawnUIFrame_ClearItemsButton_Tooltip = L.CompareClearItemsTooltip
PawnUIFrame_EquippedItemsHeader_Text = L.CompareEquipped
PawnUIFrame_BestItemsHeader_Text = L.CompareYourBest

PawnUIFrame_CompareSwapButton_Text = L.CompareSwap
PawnUIFrame_CompareSwapButton_Tooltip = L.CompareSwapTooltip

-- Configuration UI, Gems tab
PawnUIFrame_GemsHeaderLabel_Text = L.GemsWelcome

PawnUIFrame_BestGemsRadio_Text = L.GemsShowBest
PawnUIFrame_BestGemsRadio_Tooltip = L.GemsShowBestTooltip
PawnUIFrame_GemsForItemLevelRadio_Text = L.GemsShowForItemLevel
PawnUIFrame_GemsForItemLevelRadio_Tooltip = L.GemsShowForItemLevelTooltip
PawnUIFrame_GemQualityLevelBox_Label = L.GemsQualityLevel
PawnUIFrame_GemQualityLevelBox_Tooltip = L.GemsQualityLevelTooltip

-- Configuration UI, Options tab
PawnUIFrame_OptionsHeaderLabel_Text = L.OptionsWelcome

PawnUIFrame_TooltipOptionsHeaderLabel_Text = L.OptionsTooltipHeader
PawnUIFrame_EnchantedValuesCheck_Text = L.OptionsCurrentValue
PawnUIFrame_EnchantedValuesCheck_Tooltip = L.OptionsCurrentValueTooltip
PawnUIFrame_ShowIconsCheck_Text = L.OptionsInventoryIcon
PawnUIFrame_ShowIconsCheck_Tooltip = L.OptionsInventoryIconTooltip
PawnUIFrame_ShowSpecIconsCheck_Text = L.OptionsTooltipSpecIcon
PawnUIFrame_ShowSpecIconsCheck_Tooltip = L.OptionsTooltipSpecIconTooltip
PawnUIFrame_ShowExtraSpaceCheck_Text = L.OptionsBlankLine
PawnUIFrame_ShowExtraSpaceCheck_Tooltip = L.OptionsBlankLineTooltip
PawnUIFrame_AlignRightCheck_Text = L.OptionsAlignRight
PawnUIFrame_AlignRightCheck_Tooltip = L.OptionsAlignRightTooltip
PawnUIFrame_ColorTooltipBorderCheck_Text = L.OptionsColorBorder
PawnUIFrame_ColorTooltipBorderCheck_Tooltip = L.OptionsColorBorderTooltip
PawnUIFrame_TooltipUpgradeHeaderLabel_Text = L.OptionsUpgradeHeader
PawnUIFrame_TooltipUpgradeOnRadio_Text = L.OptionsTooltipValuesAndUpgrades
PawnUIFrame_TooltipUpgradeOnRadio_Tooltip = L.OptionsTooltipValuesAndUpgradesTooltip
PawnUIFrame_TooltipUpgradeOnUpgradesOnlyRadio_Text = L.OptionsTooltipUpgradesOnly
PawnUIFrame_TooltipUpgradeOnUpgradesOnlyRadio_Tooltip = L.OptionsTooltipUpgradesOnlyTooltip
PawnUIFrame_TooltipUpgradeOffRadio_Text = L.OptionsTooltipValuesOnly
PawnUIFrame_TooltipUpgradeOffRadio_Tooltip = L.OptionsTooltipValuesOnlyTooltip

PawnUIFrame_UpgradeOptionsHeaderLabel_Text = L.OptionsUpgradeSettingsHeader
PawnUIFrame_UpgradeTrackingHeaderLabel_Text = L.OptionsUpgradeTrackingHeader
PawnUIFrame_UpgradeTrackingOffRadio_Text = L.OptionsUpgradeTrackingOff
PawnUIFrame_UpgradeTrackingOffRadio_Tooltip = L.OptionsUpgradeTrackingOffTooltip
PawnUIFrame_UpgradeTrackingOnRadio_Text = L.OptionsUpgradeTrackingOn
PawnUIFrame_UpgradeTrackingOnRadio_Tooltip = L.OptionsUpgradeTrackingOnTooltip
PawnUIFrame_IgnoreGemsWhileLevelingCheck_Text = L.OptionsIgnoreGemsWhileLevelingCheck
PawnUIFrame_IgnoreGemsWhileLevelingCheck_Tooltip = L.OptionsIgnoreGemsWhileLevelingCheckTooltip
PawnUIFrame_IgnoreItemUpgradesCheck_Text = L.OptionsIgnoreItemUpgradesCheck -- unused currently
PawnUIFrame_IgnoreItemUpgradesCheck_Tooltip = L.OptionsIgnoreItemUpgradesCheckTooltip -- unused currently

PawnUIFrame_AdvisorOptionsHeaderLabel_Text = L.OptionsAdvisorHeader
PawnUIFrame_ShowBagUpgradeAdvisorCheck_Text = L.OptionsBagUpgradeAdvisor
PawnUIFrame_ShowBagUpgradeAdvisorCheck_Tooltip = L.OptionsBagUpgradeAdvisorTooltip
PawnUIFrame_ShowLootUpgradeAdvisorCheck_Text = L.OptionsLootAdvisor
PawnUIFrame_ShowLootUpgradeAdvisorCheck_Tooltip = L.OptionsLootAdvisorTooltip
PawnUIFrame_ShowQuestUpgradeAdvisorCheck_Text = L.OptionsQuestUpgradeAdvisor
PawnUIFrame_ShowQuestUpgradeAdvisorCheck_Tooltip = L.OptionsQuestUpgradeAdvisorTooltip
PawnUIFrame_ShowSocketingAdvisorCheck_Text = L.OptionsSocketingAdvisor
PawnUIFrame_ShowSocketingAdvisorCheck_Tooltip = L.OptionsSocketingAdvisorTooltip
PawnUIFrame_ShowBoth1HAnd2HUpgradesCheck_Text = L.OptionsUpgradesForBothWeaponTypes
PawnUIFrame_ShowBoth1HAnd2HUpgradesCheck_Tooltip = L.OptionsUpgradesForBothWeaponTypesTooltip
PawnUIFrame_ShowItemLevelUpgradesCheck_Text = L.OptionsShowItemLevelUpgrades
PawnUIFrame_ShowItemLevelUpgradesCheck_Tooltip = L.OptionsShowItemLevelUpgradesTooltip

PawnUIFrame_OtherOptionsHeaderLabel_Text = L.OptionsOtherHeader
PawnUIFrame_DebugCheck_Text = L.OptionsDebug
PawnUIFrame_DebugCheck_Tooltip = L.OptionsDebugTooltip
PawnUIFrame_ButtonPositionHeaderLabel_Text = L.OptionsButtonPosition
PawnUIFrame_ButtonRightRadio_Text = L.OptionsButtonPositionRight
PawnUIFrame_ButtonRightRadio_Tooltip = L.OptionsButtonPositionRightTooltip
PawnUIFrame_ButtonLeftRadio_Text = L.OptionsButtonPositionLeft
PawnUIFrame_ButtonLeftRadio_Tooltip = L.OptionsButtonPositionLeftTooltip
PawnUIFrame_ButtonOffRadio_Text = L.OptionsButtonHidden
PawnUIFrame_ButtonOffRadio_Tooltip = L.OptionsButtonHiddenTooltip
PawnUIFrame_ShowItemIDsCheck_Text = L.OptionsItemIDs
PawnUIFrame_ShowItemIDsCheck_Tooltip = L.OptionsItemIDsTooltip
PawnUIFrame_ResetUpgradesButton_Text = L.OptionsResetUpgrades
PawnUIFrame_ResetUpgradesButton_Tooltip = L.OptionsResetUpgradesTooltip

-- Configuration UI, Help tab
PawnUIFrame_GettingStartedLabel_Text = L.HelpText

-- Configuration UI, About tab
PawnUIFrame_AboutHeaderLabel_Text = format(PETITION_CREATOR, "Vger-Azjol-Nerub")
PawnUIFrame_AboutVersionLabel_Text = L.AboutVersion
PawnUIFrame_AboutTranslationLabel_Text = L.AboutTranslation -- Translators: credit yourself here... "Klingon translation by Stovokor"
PawnUIFrame_ReadmeLabel_Text = L.AboutReadme
PawnUIFrame_WebsiteLabel_Text = L.AboutWebsite
PawnUIFrame_MrRobotLabel_Text = L.AboutMrRobot

-- Interface Options page
PawnInterfaceOptionsFrame_OptionsHeaderLabel_Text = L.InterfaceOptionsWelcome
PawnInterfaceOptionsFrame_OptionsSubHeaderLabel_Text = L.InterfaceOptionsBody

-- Bindings UI
BINDING_HEADER_PAWN = "Pawn"
BINDING_NAME_PAWN_TOGGLE_UI = L.KeyBindingShowUI -- Show or hide the Pawn UI
PAWN_TOGGLE_UI_DEFAULT_KEY = "P" -- Default key to assign to this command
BINDING_NAME_PAWN_COMPARE_LEFT = L.KeyBindingCompareItemLeft -- Set the currently hovered item to be the left-side Compare item
PAWN_COMPARE_LEFT_DEFAULT_KEY = "[" -- Default key to assign to this command
BINDING_NAME_PAWN_COMPARE_RIGHT = L.KeyBindingCompareItemRight -- Set the currently hovered item to be the right-side Compare item
PAWN_COMPARE_RIGHT_DEFAULT_KEY = "]" -- Default key to assign to this command
