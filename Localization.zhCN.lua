﻿-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2019 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

-- 
-- Chinese (Simplified) resources
------------------------------------------------------------

local function PawnUseThisLocalization()
PawnLocal =
{
	["AverageItemLevelIgnoringRarityTooltipLine"] = "平均物品等级",
	["BackupCommand"] = "备份",
	["BaseValueWord"] = "基础",
	["CopyScaleEnterName"] = "为你的新属性权重起个名字,  %s 的备份名称为:",
	["DebugOffCommand"] = "侦错 关",
	["DebugOnCommand"] = "侦错 开",
	["DecimalSeparator"] = ".",
	["DeleteScaleConfirmation"] = "你确定你要删除 %s? 这将不能复原. 确定输入 \"%s\" :",
	["DidntUnderstandMessage"] = "   (?) 无法识别 \"%s\".",
	["EnchantedStatsHeader"] = "(当前值)",
	["EngineeringName"] = "工程师",
	["ExportAllScalesMessage"] = "按 Ctrl+C 复制你的属性权重数据，然后按 Ctrl+V 来粘贴到你电脑的文件里以作备份。",
	["ExportScaleMessage"] = "按 Ctrl+C 为 |cffffffff%s|r 复制下面的属性权重数据, 然后按 Ctrl+V 粘贴.",
	["FailedToGetItemLinkMessage"] = "从提示栏获取物品连接失败，这可能缘于一次模组冲突。",
	["FailedToGetUnenchantedItemMessage"] = "获取基本物品数值失败，这可能缘于一次模组冲突。",
	["FoundStatMessage"] = "   %d %s",
	["GemList2"] = "%s 或 %s",
	["GemListMany"] = "%d 提升潜力(点击Pawn按钮查看详细)",
	["GenericGemLink"] = "|Hitem:%d|h[宝石 %d]|h",
	["GenericGemName"] = "(宝石 %d)",
	["HiddenScalesHeader"] = "其它属性权重",
	["ImportScaleMessage"] = "按 Ctrl+V to 粘贴一个你从别处复制的属性权重数据于此处:",
	["ImportScaleTagErrorMessage"] = "Pawn 无法读取这个属性权重数据.  你的复制是完整的吗?  尝试重新复制一遍:",
	["ItemIDTooltipLine"] = "物品 ID",
	["ItemLevelTooltipLine"] = "物品等级",
	["LootUpgradeAdvisorHeader"] = "点击来同你的物品比较。|n",
	["LootUpgradeAdvisorHeaderMany"] = "|TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t 对于 %d 属性权重来说这件物品有提升.点击来同你的物品进行比较.",
	["MissocketWorthwhileMessage"] = "   -- 但是这最好只用  %s 宝石:",
	["NeedNewerVgerCoreMessage"] = "Pawn 需要一个新版本的 VgerCore. 请使用Pawn内置的VgerCore",
	["NewScaleDuplicateName"] = "这个名字已存在.  重新为你的属性权重起个名字:",
	["NewScaleEnterName"] = "为你的属性权重起个名字:",
	["NewScaleNoQuotes"] = "属性权重的名字不能有符号.  重新为你的属性权重起个名字:",
	["NormalizationMessage"] = "   ---- 规范化通过除以 %g",
	["NoScale"] = "(无)",
	["NoScalesDescription"] = "准备开始, 导入一个属性权重或者启用一个新的.",
	["NoStatDescription"] = "从左侧列表选择一个属性.",
	["Or"] = "或 ",
	["RenameScaleEnterName"] = "%s 的新名为:",
	["SocketBonusValueCalculationMessage"] = "   -- 插槽加成是值得的: %g",
	["StatNameText"] = "1 |cffffffff%s|r 价值:",
	["ThousandsSeparator"] = ",",
	["TooltipBestAnnotation"] = "%s  |cff8ec3e6(最佳)|r",
	["TooltipBestAnnotationSimple"] = "%s  插槽最佳",
	["TooltipBigUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00 提升%s|r",
	["TooltipDowngradeAnnotation"] = "%s  |TInterface\\\\AddOns\\\\Pawn\\\\Textures\\\\UpgradeArrow:0|t|cff00ff00-%.0f%% 将会降低%s|r",
	["TooltipRelicUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%d |4物品等级:物品等级;%s|r",
	["TooltipSecondBestAnnotation"] = "%s  |cff8ec3e6(次佳)|r",
	["TooltipSecondBestAnnotationSimple"] = "%s  次佳",
	["TooltipUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% 提升%s|r",
	["TooltipUpgradeFor1H"] = " 对于单手来说",
	["TooltipUpgradeFor2H"] = " 对于双手来说",
	["TooltipUpgradeNeedsEnhancementsAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% 升级潜力%s|r",
	["TooltipVersusLine"] = "%s|n  vs. %s%s|r",
	["TotalValueMessage"] = "   ---- 总计: %g",
	["UnenchantedStatsHeader"] = "(基本值)",
	["Unusable"] = "(不能用)",
	["UnusableStatMessage"] = "   -- %s 为无用的, 所以停止.",
	["Usage"] = [=[Pawn 作者： Vger-Azjol-Nerub
网址：www.vgermods.com
 
/pawn -- 显示或隐藏Pawn的界面
/pawn debug [ on | off ] -- 调试信息
/pawn backup -- 备份你的所有属性权重项目数据
 
想查看更多关于Pawn的信息，请查看Pawn插件文件夹里的(Readme.htm) 文件。]=],
	["ValueCalculationMessage"] = "   %g %s x %g each = %g",
	["VisibleScalesHeader"] = "%s的属性权重",
	["Stats"] = {
		["AgilityInfo"] = "敏捷，为敏捷型职业增加攻击强度。",
		--[[Translation missing --]]
		["AllResist"] = "All Resistances",
		--[[Translation missing --]]
		["AllResistInfo"] = "All Resistances.  Reduces the damage taken from any elemental attack.",
		--[[Translation missing --]]
		["ApInfo"] = "Attack Power.  Increases the damage of physical attacks.  Does not include attack power gained from strength and agility.",
		--[[Translation missing --]]
		["ArcaneResistInfo"] = "Arcane Resistance.  Reduces the damage taken from arcane-based attacks.  Does not include resistances from items that give All Resistances.",
		--[[Translation missing --]]
		["ArcaneSpellDamage"] = "Arcane Damage",
		--[[Translation missing --]]
		["ArcaneSpellDamageInfo"] = "Arcane damage.  Increases the damage dealt by your arcane spells.",
		["ArmorInfo"] = "基础护甲值。 不包含额外护甲（一般是绿色文字颜色）和部分职业使用技能等增加的额外护甲。",
		["ArmorTypes"] = "护甲类型",
		["AvoidanceInfo"] = "闪避，范围效果法术的伤害降低。",
		--[[Translation missing --]]
		["BlockRatingInfo"] = "Block chance.  Increases the chances of a successful shield block.",
		--[[Translation missing --]]
		["BlockValueInfo"] = "Shield block value.  Increases the damage that a shield absorbs when it successfully blocks.",
		["Cloth"] = "布甲",
		["ClothInfo"] = "物品类型为布甲。",
		["Crit"] = "爆击",
		["CritInfo"] = "爆击等级，影响近战、远程和法术的爆击几率。",
		--[[Translation missing --]]
		["DefenseInfo"] = "Defense skill.  Decreases the chance that you'll be hit by boss attacks.",
		--[[Translation missing --]]
		["DodgeInfo"] = "Dodge.  Increases the chance that you'll dodge attacks entirely.",
		["DpsInfo"] = "武器的每秒伤害。(如果你想要给不同类型的武器估分，前往 \"特殊武器属性\" 部分。)",
		--[[Translation missing --]]
		["FeralApInfo"] = "Feral Attack Power.  Increases the damage of druid attacks when in feral forms.  Does not include attack power gained from strength and agility.",
		--[[Translation missing --]]
		["FireResistInfo"] = "Fire Resistance.  Reduces the damage taken from fire-based attacks.  Does not include resistances from items that give All Resistances.",
		--[[Translation missing --]]
		["FireSpellDamage"] = "Fire Damage",
		--[[Translation missing --]]
		["FireSpellDamageInfo"] = "Fire damage.  Increases the damage dealt by your fire spells.",
		--[[Translation missing --]]
		["FrostResistInfo"] = "Frost Resistance.  Reduces the damage taken from frost-based attacks.  Does not include resistances from items that give All Resistances.",
		--[[Translation missing --]]
		["FrostSpellDamage"] = "Frost Damage",
		--[[Translation missing --]]
		["FrostSpellDamageInfo"] = "Frost damage.  Increases the damage dealt by your frost spells.",
		["HasteInfo"] = "急速等级，影响近战、远程和法术的攻击速度",
		--[[Translation missing --]]
		["Healing"] = "Spell Healing",
		--[[Translation missing --]]
		["HealingInfo"] = "Spell healing.  Increases the power of your healing spells.",
		--[[Translation missing --]]
		["HitInfo"] = "Hit.  Increases the chance that your physical attacks hit the target, especially bosses.",
		--[[Translation missing --]]
		["HolySpellDamage"] = "Holy Damage",
		--[[Translation missing --]]
		["HolySpellDamageInfo"] = "Holy damage.  Increases the damage dealt by your holy spells.",
		--[[Translation missing --]]
		["Hp5Info"] = "Health regeneration per 5 seconds.  Increases the rate at which you regenerate health.",
		["IndestructibleInfo"] = "永不磨损，你的装备不会有耐久度的损耗。",
		["IndestructibleIs"] = "|cffffffff坚不可摧|r 价值:",
		["IntellectInfo"] = "智力，为法术型职业增加法术强度。",
		["Leather"] = "皮甲",
		["LeatherInfo"] = "物品类型为皮甲。",
		["LeechInfo"] = "吸血，使你造成的一部分伤害和治疗量为你恢复生命值。",
		["Mail"] = "锁甲",
		["MailInfo"] = "物品类型为锁甲。",
		["MasteryInfo"] = "精通等级，从你投入点数最多的天赋树中获得的奖励。",
		["MinorStats"] = "副属性",
		["MovementSpeedInfo"] = "移动速度，使你的角色跑得更快。",
		--[[Translation missing --]]
		["Mp5"] = "Mana per 5",
		--[[Translation missing --]]
		["Mp5Info"] = "Mana regeneration per 5 seconds.  Affects your mana regeneration even when in combat.",
		--[[Translation missing --]]
		["NatureResistInfo"] = "Nature Resistance.  Reduces the damage taken from nature-based attacks.  Does not include resistances from items that give All Resistances.",
		--[[Translation missing --]]
		["NatureSpellDamage"] = "Nature Damage",
		--[[Translation missing --]]
		["NatureSpellDamageInfo"] = "Nature damage.  Increases the damage dealt by your nature spells.",
		--[[Translation missing --]]
		["ParryInfo"] = "Parry.  Increases the chance that you'll parry enemy attacks.",
		["Plate"] = "板甲",
		["PlateInfo"] = "物品类型为板甲。",
		--[[Translation missing --]]
		["RapInfo"] = "Ranged Attack Power.  Increases the damage of ranged physical attacks.  Does not include attack power gained from agility.",
		--[[Translation missing --]]
		["ShadowResistInfo"] = "Shadow Resistance.  Reduces the damage taken from shadow-based attacks.  Does not include resistances from items that give All Resistances.",
		--[[Translation missing --]]
		["ShadowSpellDamage"] = "Shadow Damage",
		--[[Translation missing --]]
		["ShadowSpellDamageInfo"] = "Shadow damage.  Increases the damage dealt by your shadow spells.",
		["Shield"] = "盾牌",
		["ShieldInfo"] = "物品类型为盾牌。",
		["Sockets"] = "插槽",
		["SpecialWeaponStats"] = "特殊武器属性",
		["SpeedBaseline"] = "速度基线",
		["SpeedBaselineInfo"] = "这个数值只是作为一个基数，并非用来实际计算。统计时候，是用装备实际速度减去这个数值然后进行计算。",
		["SpeedBaselineIs"] = "|cffffffff速度基线|r:",
		["SpeedInfo"] = "武器攻击速度，武器挥动时间间隔。(如果你喜欢快速武器，此数字应该为负数。前往 \"特殊武器属性\" 中的 \"速度基线\" 部分。)",
		["SpeedIs"] = "1 |cffffffff攻击速度|r 价值：",
		--[[Translation missing --]]
		["SpellCritInfo"] = "Spell critical strike.  Increases the chance that your spells will hit with increased potency.",
		--[[Translation missing --]]
		["SpellDamage"] = "Spell Damage",
		--[[Translation missing --]]
		["SpellDamageInfo"] = "Spell damage.  Increases the damage dealt by your offensive spells.",
		--[[Translation missing --]]
		["SpellHitInfo"] = "Spell Hit.  Increases the chance that your damaging spells hit the target, especially bosses.",
		--[[Translation missing --]]
		["SpiritInfo"] = "Spirit.  Affects your out-of-combat mana regeneration.",
		["StaminaInfo"] = "耐力，增加你的生命值上限。",
		["StrengthInfo"] = "力量，为力量型职业增加攻击强度。",
		["VersatilityInfo"] = "全能，造成的伤害和治疗提高效果，并降低收到的伤害。",
		["WeaponMainHandDps"] = "主手:每秒伤害",
		["WeaponMainHandDpsInfo"] = "主手武器每秒伤害。",
		["WeaponMainHandMaxDamage"] = "主手:伤害上限",
		["WeaponMainHandMaxDamageInfo"] = "主手武器伤害上限。",
		["WeaponMainHandMinDamage"] = "主手:伤害下限",
		["WeaponMainHandMinDamageInfo"] = "主手武器伤害下限。",
		["WeaponMainHandSpeed"] = "主手:攻速",
		["WeaponMainHandSpeedInfo"] = "主手武器攻击速度。",
		["WeaponMaxDamage"] = "主手:伤害上限",
		["WeaponMaxDamageInfo"] = "主手武器伤害上限。",
		["WeaponMeleeDps"] = "近战:每秒伤害",
		["WeaponMeleeDpsInfo"] = "近战武器每秒伤害。",
		["WeaponMeleeMaxDamage"] = "近战:伤害上限",
		["WeaponMeleeMaxDamageInfo"] = "近战武器伤害上限。",
		["WeaponMeleeMinDamage"] = "近战:伤害下限",
		["WeaponMeleeMinDamageInfo"] = "近战武器伤害下限。",
		["WeaponMeleeSpeed"] = "近战:攻速",
		["WeaponMeleeSpeedInfo"] = "近战武器攻击速度。",
		["WeaponMinDamage"] = "伤害下限",
		["WeaponMinDamageInfo"] = "武器伤害下限。",
		["WeaponOffHandDps"] = "副手:每秒伤害",
		["WeaponOffHandDpsInfo"] = "副手武器每秒伤害。",
		["WeaponOffHandMaxDamage"] = "副手:伤害上限",
		["WeaponOffHandMaxDamageInfo"] = "副手武器伤害上限。",
		["WeaponOffHandMinDamage"] = "副手:伤害下限",
		["WeaponOffHandMinDamageInfo"] = "副手武器伤害下限。",
		["WeaponOffHandSpeed"] = "副手:攻速",
		["WeaponOffHandSpeedInfo"] = "副手武器攻击速度。",
		["WeaponOneHandDps"] = "单手:每秒伤害",
		["WeaponOneHandDpsInfo"] = "单手武器每秒伤害，不包括主手或副手武器。",
		["WeaponOneHandMaxDamage"] = "单手:伤害上限",
		["WeaponOneHandMaxDamageInfo"] = "单手武器伤害上限，不包括主手或副手武器。",
		["WeaponOneHandMinDamage"] = "单手:伤害下限",
		["WeaponOneHandMinDamageInfo"] = "单手武器伤害下限，不包括主手或副手武器。",
		["WeaponOneHandSpeed"] = "单手:攻速",
		["WeaponOneHandSpeedInfo"] = "单手武器攻击速度，不包括主手或副手武器。",
		["WeaponRangedDps"] = "远程:每秒伤害",
		["WeaponRangedDpsInfo"] = "远程武器每秒伤害。",
		["WeaponRangedMaxDamage"] = "远程:伤害上限",
		["WeaponRangedMaxDamageInfo"] = "远程武器伤害上限。",
		["WeaponRangedMinDamage"] = "远程:伤害下限",
		["WeaponRangedMinDamageInfo"] = "远程武器伤害下限。",
		["WeaponRangedSpeed"] = "远程:攻速",
		["WeaponRangedSpeedInfo"] = "远程武器攻击速度。",
		["WeaponStats"] = "通用武器属性",
		["WeaponTwoHandDps"] = "双手:每秒伤害",
		["WeaponTwoHandDpsInfo"] = "双手武器每秒伤害。",
		["WeaponTwoHandMaxDamage"] = "双手:伤害上限",
		["WeaponTwoHandMaxDamageInfo"] = "双手武器伤害上限。",
		["WeaponTwoHandMinDamage"] = "双手:伤害下限",
		["WeaponTwoHandMinDamageInfo"] = "双手武器伤害下限。",
		["WeaponTwoHandSpeed"] = "双手:攻速",
		["WeaponTwoHandSpeedInfo"] = "双手武器攻击速度。",
		["WeaponType1HAxe"] = "单手斧",
		["WeaponType1HAxeInfo"] = "物品类型为单手斧。",
		["WeaponType1HMace"] = "单手锤",
		["WeaponType1HMaceInfo"] = "物品类型为单手锤。",
		["WeaponType1HSword"] = "单手剑",
		["WeaponType1HSwordInfo"] = "物品类型为单手剑。",
		["WeaponType2HAxe"] = "双手斧",
		["WeaponType2HAxeInfo"] = "物品类型为双手斧。",
		["WeaponType2HMace"] = "双手锤",
		["WeaponType2HMaceInfo"] = "物品类型为双手锤。",
		["WeaponType2HSword"] = "双手剑",
		["WeaponType2HSwordInfo"] = "物品类型为双手剑。",
		["WeaponTypeBow"] = "弓",
		["WeaponTypeBowInfo"] = "物品类型为弓。",
		["WeaponTypeCrossbow"] = "弩",
		["WeaponTypeCrossbowInfo"] = "物品类型为驽。",
		["WeaponTypeDagger"] = "匕首",
		["WeaponTypeDaggerInfo"] = "物品类型为匕首。",
		["WeaponTypeFistWeapon"] = "拳套",
		["WeaponTypeFistWeaponInfo"] = "物品类型为拳套。",
		["WeaponTypeFrill"] = "副手物品",
		["WeaponTypeFrillInfo"] = "物品类型为副手，通常为施法者装备的副手位置的物品，不是武器或盾牌。",
		["WeaponTypeGun"] = "枪械",
		["WeaponTypeGunInfo"] = "物品类型为枪械。",
		["WeaponTypeOffHand"] = "副手武器",
		["WeaponTypeOffHandInfo"] = "物品类型为副手。只能装备在副手位置的副手物品，而不是盾牌或者可以装备在这个位置的单手武器。",
		["WeaponTypePolearm"] = "长柄武器",
		["WeaponTypePolearmInfo"] = "物品类型为长柄武器。",
		["WeaponTypes"] = "武器类型",
		["WeaponTypeStaff"] = "法杖",
		["WeaponTypeStaffInfo"] = "物品类型为法杖。",
		["WeaponTypeWand"] = "魔杖",
		["WeaponTypeWandInfo"] = "物品类型为魔杖。",
		["WeaponTypeWarglaive"] = "战刃",
		["WeaponTypeWarglaiveInfo"] = "物品类型为战刃。",
	},
	["TooltipParsing"] = {
		["Agility"] = "^%+?# 敏捷$",
		--[[Translation missing --]]
		["AllResist"] = "^%+?# All Resistances$",
		["AllStats"] = "^%+?# 所有属性$",
		["Ap"] = "^%+?# 攻击强度$",
		--[[Translation missing --]]
		["Ap2"] = "^Equip: %+# Attack Power%.$",
		--[[Translation missing --]]
		["ArcaneResist"] = "^%+?# Arcane Resistance$",
		--[[Translation missing --]]
		["ArcaneSpellDamage"] = "^%+# Arcane Spell Damage$",
		--[[Translation missing --]]
		["ArcaneSpellDamage2"] = "^Equip: Increases damage done by Arcane spells and effects by up to #%.$",
		["Armor"] = "^#点护甲$",
		["Armor2"] = "^UNUSED$",
		["Avoidance"] = "^%+# 闪避$",
		["Axe"] = "^斧$",
		["BagSlots"] = "^%d+格容器 .+$",
		--[[Translation missing --]]
		["Block"] = "^%+?# Block$",
		--[[Translation missing --]]
		["BlockPercent"] = "^Equip: Increases your chance to block attacks with a shield by #%%%.$",
		--[[Translation missing --]]
		["BlockValue"] = "^Equip: Increases the block value of your shield by #%%%.$",
		["Bow"] = "^弓$",
		["ChanceOnHit"] = "击中时可能：",
		["Charges"] = "^.+ Charges?$",
		["Cloth"] = "^布甲$",
		["CooldownRemaining"] = "^冷却时间剩余：",
		["Crit"] = "^%+?# 爆击$",
		["Crit2"] = "^UNUSED$",
		--[[Translation missing --]]
		["CritPercent"] = "^Equip: Improves your chance to get a critical strike by #%%%.$",
		["Crossbow"] = "^弩$",
		["Dagger"] = "^匕首$",
		--[[Translation missing --]]
		["DefenseSkill"] = "^Equip: Increased Defense %+#.$",
		["DefenseSkillSimple"] = "^%+?# Defense$",
		["DisenchantingRequires"] = "^分解需要",
		["Dodge"] = "^%+?#%%? 躲闪$",
		["Dodge2"] = "^UNUSED$",
		--[[Translation missing --]]
		["DodgePercent"] = "^Equip: Increases your chance to dodge an attack by #%%%.$",
		["Dps"] = "^%（每秒伤害#）$",
		["DpsAdd"] = "^Adds # damage per second$",
		["Duration"] = "^耐久度:",
		["Elite"] = "^精锐$",
		["EnchantmentArmorKit"] = "^%+# 护甲$",
		["EnchantmentCounterweight"] = "^平衡锤 %(%+# 急速%",
		["EnchantmentFieryWeapon"] = "^灼热武器$",
		["EnchantmentHealth"] = "^%+# 生命$",
		["EnchantmentHealth2"] = "^%+# 生命值$",
		["EnchantmentLivingSteelWeaponChain"] = "^活化钢武器链$",
		["EnchantmentPyriumWeaponChain"] = "^燃钢武器链$",
		["EnchantmentTitaniumWeaponChain"] = "^泰坦神铁武器链$",
		["Equip"] = "装备：",
		--[[Translation missing --]]
		["FeralAp"] = "^Equip: %+# Attack Power in Cat, Bear, and Dire Bear forms only%.$",
		--[[Translation missing --]]
		["FireResist"] = "^%+?# Fire Resistance$",
		--[[Translation missing --]]
		["FireSpellDamage"] = "^%+# Fire Spell Damage$",
		--[[Translation missing --]]
		["FireSpellDamage2"] = "^Equip: Increases damage done by Fire spells and effects by up to #%.$",
		["FistWeapon"] = "^拳套$",
		["Flexible"] = "弹性级别",
		--[[Translation missing --]]
		["FrostResist"] = "^%+?# Frost Resistance$",
		--[[Translation missing --]]
		["FrostSpellDamage"] = "^%+# Frost Spell Damage$",
		--[[Translation missing --]]
		["FrostSpellDamage2"] = "^Equip: Increases damage done by Frost spells and effects by up to #%.$",
		["Gun"] = "^枪械$",
		["Haste"] = "^%+?# 急速$",
		["Haste2"] = "^UNUSED$",
		["HaventCollectedAppearance"] = "^你尚未收藏过此外观$",
		--[[Translation missing --]]
		["Healing"] = "^%+# Healing Spells$",
		--[[Translation missing --]]
		["Healing2"] = "^Equip: Increases healing done by spells and effects by up to #%.$",
		["HeirloomLevelRange"] = "^需要等级 %d+ 到 (%d+)",
		["HeirloomXpBoost"] = "^装备： 获得的经验值提高",
		["HeirloomXpBoost2"] = "^UNUSED$",
		["Heroic"] = "^英雄级别$",
		["HeroicElite"] = "^英雄精锐级别$",
		["HeroicThunderforged"] = "英雄雷霆",
		["HeroicWarforged"] = "英雄战火",
		--[[Translation missing --]]
		["Hit"] = "^Equip: Improves your chance to hit by #%%%.$",
		--[[Translation missing --]]
		["Hit2"] = "^UNUSED$",
		--[[Translation missing --]]
		["HolySpellDamage"] = "^%+# Holy Spell Damage$",
		--[[Translation missing --]]
		["HolySpellDamage2"] = "^Equip: Increases damage done by Holy spells and effects by up to #%.$",
		["Hp5"] = "^装备: 每5秒恢复#生命力。$",
		["Hp52"] = "^装备: 每5秒恢复#生命力。$",
		["Hp53"] = "^每5秒恢复#生命力$",
		["Hp54"] = "^每5秒恢复#生命力。$",
		["Intellect"] = "^%+?# 智力$",
		["Leather"] = "^皮甲$",
		["Leech"] = "^%+# 吸血$",
		["Mace"] = "^锤$",
		["Mail"] = "^锁甲$",
		["Mastery"] = "^%+?# 精通$",
		["Mastery2"] = "^UNUSED$",
		["MetaGemRequirements"] = "|cff%x%x%x%x%x%x需要",
		["MovementSpeed"] = "^%+# 加速$",
		--[[Translation missing --]]
		["Mp5"] = "^Equip: Restores # mana per 5 sec%.$",
		["Mp52"] = "^%+?# mana every 5 sec%.$",
		["MultiStatHeading"] = "^多项统计$",
		["MultiStatSeparator1"] = "和",
		["Multistrike"] = "^%+# 溅射$",
		--[[Translation missing --]]
		["NatureResist"] = "^%+?# Nature Resistance$",
		--[[Translation missing --]]
		["NatureSpellDamage"] = "^%+# Nature Spell Damage$",
		--[[Translation missing --]]
		["NatureSpellDamage2"] = "^Equip: Increases damage done by Nature spells and effects by up to #%.$",
		["NormalizationEnchant"] = "^附魔：(.*)$",
		["Parry"] = "^%+?# 招架$",
		["Parry2"] = "^UNUSED$",
		["Plate"] = "^板甲$",
		["Polearm"] = "^长柄武器$",
		["PvPPower"] = "^%+?# PvP强度$",
		["RaidFinder"] = "^随机团队$",
		--[[Translation missing --]]
		["Rap"] = "^Equip: %+# ranged Attack Power%.$",
		["Requires2"] = "^UNUSED$",
		["Resilience"] = "^%+?# PvP韧性$",
		["Resilience2"] = "^UNUSED$",
		["Scope"] = "^瞄准镜%（%+# 伤害%）$",
		["ScopeCrit"] = "^瞄准镜 %(%+# 爆击%)$",
		["ScopeRangedCrit"] = "^%+?# 远程爆击$",
		--[[Translation missing --]]
		["ShadowResist"] = "^%+?# Shadow Resistance$",
		--[[Translation missing --]]
		["ShadowSpellDamage"] = "^%+# Shadow Spell Damage$",
		--[[Translation missing --]]
		["ShadowSpellDamage2"] = "^Equip: Increases damage done by Shadow spells and effects by up to #%.$",
		["Shield"] = "^盾牌$",
		["SocketBonusPrefix"] = "镶孔奖励：",
		["Speed"] = "^速度 #$",
		["Speed2"] = "^UNUSED$",
		--[[Translation missing --]]
		["SpellCrit"] = "^Equip: Improves your chance to get a critical strike with spells by #%%%.$",
		--[[Translation missing --]]
		["SpellDamage"] = "^%+# Spell Damage$",
		--[[Translation missing --]]
		["SpellDamage2"] = "^Equip: Increases damage and healing done by magical spells and effects by up to #%.$",
		--[[Translation missing --]]
		["SpellHit"] = "^Equip: Improves your chance to hit with spells by #%%%.$",
		["SpellPower"] = "^%+?# 法术强度$",
		["Spirit"] = "^%+?# 精神$",
		["Staff"] = "^法杖$",
		["Stamina"] = "^%+?# 耐力$",
		["Strength"] = "^%+?# 力量$",
		["Sword"] = "^剑$",
		["TemporaryBuffMinutes"] = "^.+%(%d+ 分钟%)$",
		["TemporaryBuffSeconds"] = "^.+%(%d+ 秒%)$",
		["Thunderforged"] = "雷霆",
		["Timeless"] = "永恒",
		["Titanforged"] = "^泰坦造物$",
		["UpgradeLevel"] = "^升级：",
		["Use"] = "使用：",
		["Versatility"] = "^%+# 全能$",
		["Wand"] = "^魔杖$",
		["Warforged"] = "战火",
		["Warglaives"] = "^战刃$",
		["WeaponDamage"] = "^# %- #点伤害$",
		["WeaponDamageArcane"] = "^%+?# %- #点奥术伤害$",
		["WeaponDamageArcaneExact"] = "^%+?# 点奥术伤害$",
		["WeaponDamageEnchantment"] = "^%+?# 武器伤害$",
		["WeaponDamageEquip"] = "^装备： %+?# 武器伤害%。",
		["WeaponDamageExact"] = "^%+?# 伤害$",
		["WeaponDamageFire"] = "^%+?# %- #点火焰伤害$",
		["WeaponDamageFireExact"] = "^%+?# 点火焰伤害$",
		["WeaponDamageFrost"] = "^%+?# %- #点冰霜伤害$",
		["WeaponDamageFrostExact"] = "^%+?# 点冰霜伤害$",
		["WeaponDamageHoly"] = "^%+?# %- #点神圣伤害$",
		["WeaponDamageHolyExact"] = "^%+?# 点神圣伤害$",
		["WeaponDamageNature"] = "^%+?# %- #点自然伤害$",
		["WeaponDamageNatureExact"] = "^%+?# 点自然伤害$",
		["WeaponDamageShadow"] = "^%+?# %- #点暗影伤害$",
		["WeaponDamageShadowExact"] = "^%+?# 点暗影伤害$",
	},
	["UI"] = {
		["AboutHeader"] = "关于 Pawn",
		["AboutMrRobot"] = "现在Pawn插件的属性权重标准是参考了Ask Mr. Robot网站提供的标准属性权重，这个网站提供了根据你角色的天赋和现有装备计算如何提升和现阶段的属性权重。有兴趣可以去askmrrobot.com尝试使用。（译者注，似乎不支持国服，尝试国服角色总是报错）",
		["AboutReadme"] = "新手？看看“准备开始”标签。",
		["AboutTab"] = "关于",
		["AboutTranslation"] = "国服简中汉化：五十五颗土豆#5630",
		["AboutVersion"] = "版本 %s",
		["AboutWebsite"] = [=[想要更多作者Vger的插件，请访问vgermods.com。

国服简中汉化：五十五颗土豆#5630   |   NGA论坛ID：bigbamboo  如果有汉化问题反馈请联系我]=],
		["AskMrRobotProvider"] = "Ask Mr. Robot 标准属性权重",
		["CompareClearItems"] = "清除",
		["CompareClearItemsTooltip"] = "移除两件对照的物品.",
		["CompareColoredSockets"] = "彩色插槽",
		["CompareEquipped"] = "已装备",
		["CompareGemTotalValue"] = "宝石的价值",
		["CompareHeader"] = "用 %s 进行对比",
		["CompareOtherHeader"] = "其他",
		["CompareSlotEmpty"] = "(空)",
		["CompareSocketBonus"] = "镶孔奖励",
		["CompareSocketsHeader"] = "插槽",
		["CompareSpecialEffects"] = "特殊效果",
		["CompareSwap"] = "< 对调 >",
		["CompareSwapTooltip"] = "将两边物品对调.",
		["CompareTab"] = "比较",
		["CompareVersus"] = "—vs.—",
		["CompareWelcomeRight"] = [=[然后, 将一个物品放入此栏.

Pawn 会将它与你装备的物品进行对比.]=],
		["CompareYourBest"] = "最好的槽",
		["GemsColorHeader"] = "%s 宝石",
		["GemsHeader"] = "适合 %s 的宝石",
		["GemsNoneFound"] = "没有相应的宝石被发现。",
		["GemsQualityLevel"] = "宝石的品质",
		["GemsQualityLevelTooltip"] = [=[以物品等级来推荐宝石。

例如，如果选择 "463" 等级，Pawn将显示的宝石，适合使用在463等级：熊猫人之谜英雄副本战利品。]=],
		["GemsShowBest"] = "显示最好的宝石",
		["GemsShowBestTooltip"] = "显示了目前可以选择的最好的宝石。有些低级装备可能显示过于高级的宝石。",
		["GemsShowForItemLevel"] = "输入物品等级以推荐适合的宝石：",
		["GemsShowForItemLevelTooltip"] = "为输入的物品等级显示适合的宝石。",
		["GemsTab"] = "珠宝",
		["GemsWelcome"] = "选择一个选项，让Pawn来帮你推荐插什么宝石：",
		["HelpHeader"] = "欢迎使用 Pawn!",
		["HelpTab"] = "准备开始",
		["HelpText"] = [=[Pawn 根据装备属性权重来计算评分，通过统计的分数来直观的看出，装备的整体属性收益对你来说是提升了还是降低了。

每条属性都有它对应的评分，也就是你所启用的评分标准。一个默认的天赋评分标准，会列出哪些属性对你有帮助，以及每一点属性所拥有的价值评分。一般一个职业的一个专精只有一种标准的评分标准，默认这个最终计算数值是隐藏的，插件会提示你这件装备的评分对你来说是提升了还是下降了，你也可以在比较窗口看到装备是如何评分比较的。

 •  你可以在相关标签，对每一项评分标准进行显示和隐藏操作。

Pawn插件默认已经参考AskMrRobot给所有职业的专精建立了标准评分规则。你也可以根据自己的需求来建立或更改自己的评分标准，无论是从网站、工会等其他途径获得的评分标准。

|cff8ec3e6试试这些功能：|r
 •  通过Pawn的比较标签来比较两件装备是如何进行计算评分和比较收益的。
 •  鼠标右键点击聊天窗口的装备链接，可以查看到该装备如何与你当前装备进行比较。
 •  复制一个标准属性权重项目，根据自己的需要去修改装备的收益评分已达到自己的特殊要求。
 •  试着查找互联网上其他人推荐的属性权重评分标准。
 •  查看自述文件，以了解更多关于Pawn的高级功能。]=],
		["InterfaceOptionsBody"] = "点击 Pawn 按钮到达此处。  你也可从插件页面打开 Pawn ，或者为它绑定一个按键。",
		["InterfaceOptionsWelcome"] = "Pawn 设置位于 Pawn 介面处.",
		["InventoryButtonTooltip"] = "点击显示Pawn介面.",
		["InventoryButtonTotalsHeader"] = "所有已装备物品之总计:",
		["KeyBindingCompareItemLeft"] = "比较物品 (左)",
		["KeyBindingCompareItemRight"] = "比较物品 (右)",
		["KeyBindingShowUI"] = "显示 Pawn 介面",
		["OptionsAdvisorHeader"] = "建议选项",
		["OptionsAlignRight"] = "排列数值到提示栏右边.",
		["OptionsAlignRightTooltip"] = "让数值靠最右边显示，而不是放在属性权重项目名称的后面。",
		["OptionsBagUpgradeAdvisor"] = "显示背包提升建议",
		["OptionsBagUpgradeAdvisorTooltip"] = [=[启用此选项后，Pawn会标记显示背包里有属性提升的装备。

如果启用，对应你当前选择的专精属性权重下，Pawn将扫描你背包里对你有属性提升的装备并作出绿色箭头的标记。

如果未启用，游戏将会显示内置的装等提升，Pawn仍然会扫描装备的属性提升但不提示也不会影响游戏内置功能的正常工作。

译者注：7.1新功能，默认背包支持，但部分背包插件可能不兼容，并不会有提示。]=],
		["OptionsBlankLine"] = "数值前加一个空白行",
		["OptionsBlankLineTooltip"] = "在Pawn的数据信息之前加一个空格，让显示更清爽。",
		["OptionsButtonHidden"] = "隐藏",
		["OptionsButtonHiddenTooltip"] = "不在角色属性面板显示.",
		["OptionsButtonPosition"] = "显示Pawn按键:",
		["OptionsButtonPositionLeft"] = "于左侧",
		["OptionsButtonPositionLeftTooltip"] = "在角色属性面板左下侧显示 Pawn 按键.",
		["OptionsButtonPositionRight"] = "于右侧",
		["OptionsButtonPositionRightTooltip"] = "在角色属性面板右下侧显示 Pawn 按键.",
		["OptionsColorBorder"] = "可升级的著色提示外框",
		["OptionsColorBorderTooltip"] = "让属性更好的装备的信息外框变成绿色，以更直观的提醒你哪件更好。取消将不做任何改动。",
		["OptionsCurrentValue"] = "同时显示目前与基础的数值",
		["OptionsCurrentValueTooltip"] = [=[启用后数值将显示为“目前数值（基础数值）”。目前数值是指装备当前经过附魔等操作后所达到的当前属性评分数值（不包含类似“厚皮之印”这种无法量化的数值评分）。基础数值的是指该装备不包含附魔等操作原本的属性评分（如果有孔的话，默认会算进去镶嵌最适合属性的宝石）。

该功能的作用是，当你获得一件新装备的时候，能直观的看到这件装备所能达到的最佳评分，你不用镶嵌宝石+附魔等操作后，才能比较这件装备跟你现在所使用的哪件比较好。

取消选择后，将只显示目前数值。]=],
		["OptionsDebug"] = "显示侦错讯息",
		["OptionsDebugTooltip"] = [=[如果你不知道Pawn如何去计算一件装备的评分，可以启用以详细查看。

该命令会在你的聊天记录窗口刷屏，所以不用的时候请关闭。]=],
		["OptionsHeader"] = "调整 Pawn 选项",
		["OptionsIgnoreGemsWhileLevelingCheck"] = "忽略低级别装备的宝石插孔。",
		["OptionsIgnoreGemsWhileLevelingCheckTooltip"] = [=[启用此选项的时候，插件计算宝石插孔的时候会忽略低级别装备的插孔，因为大多数人练级时期都不会去镶嵌宝石。有些低级装备会有一种属性权重统计评分虚高的假象（插件会默认认为这个孔可以插一个满级宝石，造成属性对于这个等级爆炸的效果）。

如果启用，插件还是推荐在装备上插上适当过渡的宝石，但是插件不会再计算它的属性评分。

如果不启用，插件会计算这个插孔能插最有价值宝石的属性评分并推荐给你。]=],
		["OptionsIgnoreItemUpgradesCheck"] = "忽略装备潜在提升装等后的属性评估",
		["OptionsIgnoreItemUpgradesCheckTooltip"] = [=[启用此选项，插件会忽略装备潜在的属性可能去评估，即利用勇气点数等提升装等的潜在属性。

选中后，插件只会计算装备当前状态的属性评估。

未选中的情况下，插件会计算本件装备最大提升后潜在的属性评估，即用勇气点数等升级满装备装等后的属性。此属性将显示包含在装备当前属性后的括号内。]=],
		["OptionsInventoryIcon"] = "显示物品图标",
		["OptionsInventoryIconTooltip"] = "在你点击聊天窗口的物品显示其信息的时候，在信息旁边显示该物品的图标。",
		["OptionsItemIDs"] = "显示物品ID",
		["OptionsItemIDsTooltip"] = "显示物品的ID",
		["OptionsLootAdvisor"] = "显示装备掉落属性权重提升建议",
		["OptionsLootAdvisorTooltip"] = "当你在打副本、显示有一个Roll点拾取窗口的时候，如果这件装备对你来说有属性权重提升，在其旁边会显示提示。（译者注：根据自用经验，目测只支持魔兽世界自带Roll点拾取窗口，如果有插件替代该窗口，本功能可能不正常）",
		["OptionsOtherHeader"] = "其它选项",
		["OptionsQuestUpgradeAdvisor"] = "显示任务奖励属性权重提升建议",
		["OptionsQuestUpgradeAdvisorTooltip"] = "在你交任务有奖励选择的时候，在最有用装备上显示对你属性权重提升的标志，如果没有能提升的装备，那么会在卖商店最值钱的装备上显示一个金币图案。",
		["OptionsResetUpgrades"] = "重新扫描装备",
		["OptionsResetUpgradesTooltip"] = [=[Pawn会清除本身记录的曾经见装备过的最好的装备（哪怕在背包里、银行里甚至摧毁贩卖了），所有评分从你角色现在已装备的为标准来比较。

当你因某种原因某件装备丢失或者不再使用的时候，插件默认还是以那件装备计算，引起的不便。或者装备数据紊乱的时候，可以使用此功能。]=],
		["OptionsShowItemLevelUpgrades"] = "显示装等的提升",
		["OptionsShowItemLevelUpgradesTooltip"] = "根据插件记录，如果同部位[未穿戴过]的装备装等高于[已装备过]的（非正在装备），Pawn将提示关于这单个部位装等的提升。",
		["OptionsShowRelicUpgrades"] = "显示神器圣物的提升",
		["OptionsShowRelicUpgradesTooltip"] = "Pawn将在背包里，对神器有装等提升的圣物上，标记一个提升标记。",
		["OptionsSocketingAdvisor"] = "显示插槽建议",
		["OptionsSocketingAdvisorTooltip"] = "当你打开宝石镶嵌窗口的时候，根据你设置里选择的方式，在窗口下方提示你，插什么宝石是最适合你的属性权重。",
		["OptionsTab"] = "设置",
		["OptionsTooltipHeader"] = "提示栏设置",
		["OptionsTooltipSpecIcon"] = "显示专精图标",
		["OptionsTooltipSpecIconTooltip"] = "在默认的属性权重名称之前显示对应专精的图标。",
		["OptionsTooltipUpgradesOnly"] = "只显示提升",
		["OptionsTooltipUpgradesOnlyTooltip"] = [=[只显示哪件装备对你来说是提升的或者是最好的，不显示具体的数值。例如：

|cff8ec3e6火法:|r  |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% 提升|r

...or...

|cff8ec3e6Fire:  最佳装备]=],
		["OptionsTooltipValuesAndUpgrades"] = "显示属性权重评分数值和提升%",
		["OptionsTooltipValuesAndUpgradesTooltip"] = [=[同时显示装备属性提升的标志和评分的显示。例如：

|cff8ec3e6奥法:  123.4
火法:  156.7 |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% 提升|r]=],
		["OptionsTooltipValuesOnly"] = "只显示属性权重评分数值，不显示提升%",
		["OptionsTooltipValuesOnlyTooltip"] = [=[只显示装备在你选择的属性权重下的分值，不显示属性的提升。例如：

|cff8ec3e6奥法:  123.4
火法:  156.7|r]=],
		["OptionsUpgradeHeader"] = "在提示栏显示 |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t 提升:",
		["OptionsUpgradeSettingsHeader"] = "提升选项",
		["OptionsUpgradesForBothWeaponTypes"] = "同时显示双手武器和双持武器的提升建议",
		["OptionsUpgradesForBothWeaponTypesTooltip"] = [=[Pawn会同时跟踪记录和显示双手武器/双持武器（魔杖副手、主副手武器等）的提升。

如果选中，你依旧可以看到分开的提升数值提示，最好的双手武器，最好的双持武器。

如果不选中，你只能看到针对于你已经装备的武器的提升。]=],
		["OptionsUpgradeTrackingHeader"] = "对比模式：",
		["OptionsUpgradeTrackingOff"] = "简单模式",
		["OptionsUpgradeTrackingOffTooltip"] = "Pawn仅仅只比较当前物品与角色身上同部位正在装备的物品的属性权重。",
		["OptionsUpgradeTrackingOn"] = "高级模式",
		["OptionsUpgradeTrackingOnTooltip"] = "Pawn会针对每个装备的部位，记录过你所穿过的评分最高的装备，每次对比均会与这件记录的装备对比，这件装备可以在背包里仓库里，而并非一定是你现在角色装备的那件。",
		["OptionsWelcome"] = "按照你的偏好配置 Pawn.  更改会马上生效.",
		["ScaleAutoOff"] = "自定义",
		["ScaleAutoOff2"] = "自由设定属性权重。",
		["ScaleAutoOffTooltip"] = "你可以自由设定属性权重的评分标准，或者一种专精几种评分标准，甚至直接关闭某项专精的评分。",
		["ScaleAutoOn"] = "自动适配",
		["ScaleAutoOn2"] = "自动选择当前专精对应的属性权重。",
		["ScaleAutoOnTooltip"] = "Pawn会根据你的职业，自动选择默认的专精属性权重。",
		["ScaleAutoWelcome"] = [=[Pawn 会自动切换显示你现在正在使用的专精对应的属性权重。

如果你需要独立设定，请点击右下角的自定义设定。]=],
		["ScaleChangeColor"] = "调整顏色",
		["ScaleChangeColorTooltip"] = "调整物品提示栏中属性权重名称和数值的顏色.",
		["ScaleCopy"] = "复制",
		["ScaleCopyTooltip"] = "复制这一项属性权重，创建一个新的",
		["ScaleDefaults"] = "预设",
		["ScaleDefaultsTooltip"] = "复制一项预设的属性权重，创建一个新的",
		["ScaleDeleteTooltip"] = [=[将这个属性权重删除.

这个命令不能被撤销!]=],
		["ScaleEmpty"] = "创建",
		["ScaleEmptyTooltip"] = "创建一个新属性权重从零开始.",
		["ScaleExport"] = "导出",
		["ScaleExportTooltip"] = "在网路上同别人分享你的属性权重.",
		["ScaleHeader"] = "管理你的Pawn属性权重",
		["ScaleImport"] = "导入",
		["ScaleImportTooltip"] = "通过网路粘贴一个属性权重数据，来添加一个新属性权重.",
		["ScaleNewHeader"] = "创建一个新属性权重",
		["ScaleRename"] = "重命名",
		["ScaleRenameTooltip"] = "为这个属性权重重命名.",
		["ScaleSelectorHeader"] = "选择一个属性权重:",
		["ScaleSelectorShowingSuggestionsFor"] = "当前属性权重的专精",
		["ScaleSelectorShowScale"] = "在提示栏中显示属性权重",
		["ScaleSelectorShowScaleTooltip"] = "当这个选项被选中时，此属性权重将显示在此角色的物品工具提示上。每个属性权重可以显示在一个角色，多个角色，或干脆不显示。",
		["ScaleShareHeader"] = "共享你的属性权重",
		["ScaleTab"] = "属性权重",
		["ScaleTypeNormal"] = "你可以在编辑页面中调整这个属性权重.",
		["ScaleTypeReadOnly"] = "若要自定义这个属性权重，你应该先为它做个备份.",
		["ScaleWelcome"] = "属性权重是装备属性的价值的参考，Pawn可以依此来评价一件装备是否对职业有提升效用。你可以定制你自己的或别人已经创造的属性权重。",
		["SocketingAdvisorButtonTooltip"] = "点击显示Pawn珠宝界面, 你可看到 Pawn 为每种属性权重推荐的宝石.",
		["SocketingAdvisorHeader"] = "Pawn 插槽建议:",
		["SocketingAdvisorIgnoreThisItem"] = "不需要特地为这个低等装备去镶嵌宝石，但如果你真的要这么做的话，可参考以下建议：",
		["StarterProvider"] = "各职业标准属性权重：",
		["ValuesDoNotShowUpgradesFor1H"] = "请不要显示单手装备的提升",
		["ValuesDoNotShowUpgradesFor2H"] = "请不要显示双手装备的提升",
		["ValuesDoNotShowUpgradesTooltip"] = "启用该选项来隐藏此类型装备的提升。比如，虽然坦骑可以用双手武器，但是对坦骑设定来说一件双手武器从来都不是一个\"提升\"，因此Pawn将不会为它们显示提升信息。同样，惩戒骑可以使用单手武器，但它们从不是一个提升。",
		["ValuesFollowSpecialization"] = "只有显示50等以后我最佳护甲类型的提升",
		["ValuesFollowSpecializationTooltip"] = "启用该选项来隐藏50等以后非职业专精的护甲类型。比如，神圣圣骑士在50等学到了鎧甲专精, 当只装备鎧甲时增加智力5%。当此选项选择时Pawn将不会考虑布、皮及锁甲对50+神圣圣骑士的提升",
		["ValuesHeader"] = "调整 %s 分值",
		["ValuesIgnoreStat"] = "带此属性的物品没有用处。",
		["ValuesIgnoreStatTooltip"] = "启用这个选项，将不能使用的物品设为无效。例如萨满不能装备板甲，板甲无论属性再好，对萨满来说，属性权重为0。",
		["ValuesNormalize"] = "校正数值 (比如 Wowhead)",
		["ValuesNormalizeTooltip"] = "启用此选项以特定计算后校正优化属性权重评分的数值，使其不至于过大。",
		["ValuesRemove"] = "移除",
		["ValuesRemoveTooltip"] = "从属性权重计算中移除此属性。",
		["ValuesTab"] = "数值",
		["ValuesWelcome"] = "你可以为该属性权重自定义每项属性的数值.  若要管理你的自定义项目和增加新的项目,请用属性权重页面.",
		["ValuesWelcomeNoScales"] = "你还未选择属性权重. 若要启用,请去属性权重页面并启动一个新属性权重或者从网上粘贴一个.",
		["ValuesWelcomeReadOnly"] = "已被选择的该属性权重不能被更改.若你想改变这些数值,请去属性权重页面生成一份备份或者启用一个新的属性权重.",
	}
}
end

if GetLocale() == "zhCN" then
	PawnUseThisLocalization()
end

-- After using this localization or deciding that we don't need it, remove it from memory.
PawnUseThisLocalization = nil
