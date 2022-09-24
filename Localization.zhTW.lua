-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

--
-- Chinese (Traditional) resources
------------------------------------------------------------

local function PawnUseThisLocalization()
PawnLocal =
{
	["AverageItemLevelIgnoringRarityTooltipLine"] = "平均物品等級",
	["BaseValueWord"] = "基礎",
	["CopyScaleEnterName"] = "將 %s 的備份命名為:",
	["DecimalSeparator"] = ".",
	["DeleteScaleConfirmation"] = "你確定你要刪除 %s？這將不能復原。若確定請輸入 \"%s\":",
	["DidntUnderstandMessage"] = "   (?) 無法識別 \"%s\".",
	["EnchantedStatsHeader"] = "(目前值)",
	["EngineeringName"] = "工程學",
	["ExportAllScalesMessage"] = "按 Ctrl+C 複製權重字串，在你的電腦中開啟一個文字文件，按 Ctrl-V 貼上後儲存，來備份你的權重。",
	["ExportScaleMessage"] = "按 Ctrl+C 複製下方 |cffffffff%s|r 的權重字串",
	["FailedToGetItemLinkMessage"] = "   從提示欄獲取物品連接失敗.  這可能緣於一次模組衝突.",
	["FailedToGetUnenchantedItemMessage"] = "   獲取基本物品數值失敗.  這可能緣於一次模組衝突.",
	["FoundStatMessage"] = "   %d %s",
	["GemList2"] = "%s 或 %s",
	["GemListMany"] = "(點擊Pawn按鈕查看詳細)",
	["GenericGemLink"] = "|Hitem:%d|h[寶石 %d]|h",
	["GenericGemName"] = "(寶石 %d)",
	["HiddenScalesHeader"] = "其它權重",
	["ImportScaleMessage"] = "按 Ctrl+V 以貼上一個你從別處複製來的權重字串",
	["ImportScaleTagErrorMessage"] = "Pawn 不明白這個標籤.  你的複製是完整的嗎?  嘗試重新複製一遍:",
	["ItemIDTooltipLine"] = "物品ID",
	["ItemLevelTooltipLine"] = "物品等級",
	["LootUpgradeAdvisorHeader"] = "點擊來同你的物品比較。|n",
	["LootUpgradeAdvisorHeaderMany"] = "|TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t 對 %d 權重來說這件物品是個提升.點擊來與你的物品進行比較.",
	["MissocketWorthwhileMessage"] = "   -- 但是這最好只用  %s 寶石:",
	["NeedNewerVgerCoreMessage"] = "Pawn 需要一个新版本的 VgerCore. 請使用Pawn内置的VgerCore",
	["NewScaleDuplicateName"] = "這個名字已存在.  重新為你的權重命名:",
	["NewScaleEnterName"] = "為你的權重命名:",
	["NewScaleNoQuotes"] = "權重不能有 \" 在他的名字中.  重新為你的權重命名:",
	["NormalizationMessage"] = "   ---- 已標準化(除以 %g)",
	["NoScale"] = "(無)",
	["NoScalesDescription"] = "準備開始, 導入一個權重或者啟用一個新的.",
	["NoStatDescription"] = "從左側列表選擇一個屬性.",
	["Or"] = "或 ",
	["RenameScaleEnterName"] = "輸入 %s 的新名稱:",
	["SocketBonusValueCalculationMessage"] = "   -- 插槽加成價值:",
	["StatNameText"] = "1 |cffffffff%s|r 價值:",
	["ThousandsSeparator"] = ",",
	["TooltipBestAnnotation"] = "%s  |cff8ec3e6(最佳)|r",
	["TooltipBestAnnotationSimple"] = "%s  最佳",
	["TooltipBigUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00 提升%s|r",
	["TooltipDowngradeAnnotation"] = "%s  |TInterface\\\\\\\\AddOns\\\\\\\\Pawn\\\\\\\\Textures\\\\\\\\UpgradeArrow:0|t|cff00ff00-%.0f%% 將會降低%s|r",
	["TooltipRelicUpgradeAnnotation"] = "%s |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%d |4等級:等級;%s|r",
	["TooltipSecondBestAnnotation"] = "%s  |cff8ec3e6(次佳)|r",
	["TooltipSecondBestAnnotationSimple"] = "%s  次佳",
	["TooltipUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% 提升%s|r",
	["TooltipUpgradeFor1H"] = " 對於單手來說",
	["TooltipUpgradeFor2H"] = " 對於雙手來說",
	["TooltipUpgradeNeedsEnhancementsAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% 提升%s|r",
	["TooltipVersusLine"] = "%s|n  vs. |c%s%s|r",
	["TotalValueMessage"] = "   ---- 總計: %g",
	["UnenchantedStatsHeader"] = "(基本值)",
	["Unusable"] = "(不可用)",
	["UnusableStatMessage"] = "   -- %s 不可用, 所以停止.",
	["Usage"] = [=[Pawn
作者: Vger-Azjol-Nerub
網站: www.vgermods.com
 
/pawn -- 顯示或隱藏 Pawn 介面
/pawn debug [ on | off ] -- 在對話欄中顯示除錯訊息
/pawn backup -- 備份您所有的權重設定

若需要進一步說明，請參閱插件附帶的 Readme.htm]=],
	["ValueCalculationMessage"] = "   %g %s x %g each = %g",
	["VisibleScalesHeader"] = "%s的權重",
	["Stats"] = {
		["AgilityInfo"] = "主要屬性, 敏捷.",
		["ApInfo"] = "Attack Power.  Increases the damage of physical attacks.  Does not include attack power gained from strength and agility.",
		["ArcaneResistInfo"] = "Arcane Resistance.  Reduces the damage taken from arcane-based attacks.",
		["ArcaneSpellDamage"] = "祕法法術傷害",
		["ArcaneSpellDamageInfo"] = "Arcane damage.  Increases the damage dealt by your arcane spells.",
		["ArmorInfo"] = "基本護甲值，不包含坦克裝備的 \"額外護甲值\" 屬性",
		["ArmorPenetrationInfo"] = "護甲穿透。 使你的部分物理攻擊傷害無視護甲。",
		["ArmorTypes"] = "裝甲類型",
		["AvoidanceInfo"] = "迴避: 降低所受範圍傷害",
		["BlockRatingInfo"] = "Block chance.  Increases the chances of a successful shield block.",
		["BlockValueInfo"] = "Shield block value.  Increases the damage that a shield absorbs when it successfully blocks.",
		["Cloth"] = "布甲",
		["ClothInfo"] = "此物若為布甲，則增計多少分數。",
		["CorruptionInfo"] = "恩若司的腐化。腐化值為負值時，會根據腐化程度從物品評分中刪除分數。",
		["Crit"] = "致命一擊",
		["CritInfo"] = "致命一擊: 影響近戰攻擊，遠程攻擊，法術。",
		["DefenseInfo"] = "Defense skill.  Decreases the chance that you'll be hit by boss attacks.",
		["DodgeInfo"] = "Dodge.  Increases the chance that you'll dodge attacks entirely.",
		["DominationSocketInfo"] = "平均統治碎片的套接字值。",
		["DpsInfo"] = [=[每秒武器傷害。
若你想為不同武器的DPS估值, 請看 "特定武器屬性" 部份]=],
		--[[Translation missing --]]
		["ExpertiseInfo"] = "Expertise. Negates your enemy's chances to dodge and parry.",
		["FeralApInfo"] = "Feral Attack Power.  Increases the damage of druid attacks when in feral forms.  Does not include attack power gained from strength and agility.",
		["FireResistInfo"] = "Fire Resistance.  Reduces the damage taken from fire-based attacks.",
		["FireSpellDamage"] = "火焰法術傷",
		["FireSpellDamageInfo"] = "Fire damage.  Increases the damage dealt by your fire spells.",
		["FrostResistInfo"] = "Frost Resistance.  Reduces the damage taken from frost-based attacks.",
		["FrostSpellDamage"] = "冰霜法術傷害",
		["FrostSpellDamageInfo"] = "Frost damage.  Increases the damage dealt by your frost spells.",
		["HasteInfo"] = "加速: 影響近戰攻擊，遠程攻擊，法術。",
		["Healing"] = "治療法術",
		["HealingInfo"] = "Spell healing.  Increases the power of your healing spells.",
		["HitInfo"] = "Hit.  Increases the chance that your physical attacks hit the target, especially bosses.",
		["HolySpellDamage"] = "Holy Damage",
		["HolySpellDamageInfo"] = "Holy damage.  Increases the damage dealt by your holy spells.",
		["Hp5Info"] = "Health regeneration per 5 seconds.  Increases the rate at which you regenerate health.",
		["IndestructibleInfo"] = "無法摧毀: 使物品不損失耐久度",
		["IndestructibleIs"] = "此物若為無法摧毀，則增計多少分數。",
		["IntellectInfo"] = "主要屬性, 智力.",
		["Leather"] = "皮甲",
		["LeatherInfo"] = "此物若為皮甲，則增計多少分數。",
		["LeechInfo"] = "汲取: 將受到的傷害，或是造成的治療，轉化成少量的自我治療",
		["Mail"] = "鎖甲",
		["MailInfo"] = "此物若為鎖甲，則增計多少分數。",
		["MasteryInfo"] = "精通: 提高你主天賦的特有加成。",
		["MetaSocketEffectInfo"] = "元寶石特效。 為元寶石的非屬性部分分配的點數（例如，“小跑速度增加”或“1% 法術反射”）。",
		["MinorStats"] = "其他",
		["MovementSpeedInfo"] = "移動速度: 提高你角色的移動速度",
		["Mp5"] = "法力每5秒",
		["Mp5Info"] = "Mana regeneration per 5 seconds.  Affects your mana regeneration even when in combat.",
		["NatureResistInfo"] = "Nature Resistance.  Reduces the damage taken from nature-based attacks.",
		["NatureSpellDamage"] = "自然法術傷害",
		["NatureSpellDamageInfo"] = "Nature damage.  Increases the damage dealt by your nature spells.",
		["ParryInfo"] = "Parry.  Increases the chance that you'll parry enemy attacks.",
		["Plate"] = "鎧甲",
		["PlateInfo"] = "此物若為鎧甲，則增計多少分數。",
		["RapInfo"] = "Ranged Attack Power.  Increases the damage of ranged physical attacks.  Does not include attack power gained from agility.",
		--[[Translation missing --]]
		["ResilienceInfo"] = "Resilience. Reduces the chance that you'll be critically hit, and decreases the damage of critical hits that you do take.",
		["ShadowResistInfo"] = "Shadow Resistance.  Reduces the damage taken from shadow-based attacks.",
		["ShadowSpellDamage"] = "暗影法術傷害",
		["ShadowSpellDamageInfo"] = "Shadow damage.  Increases the damage dealt by your shadow spells.",
		["Shield"] = "盾牌",
		["ShieldInfo"] = "此物若為盾牌，則增計多少分數。",
		["Sockets"] = "插槽",
		["SpecialWeaponStats"] = "特定武器屬性",
		["SpeedBaseline"] = "速度基線",
		["SpeedBaselineInfo"] = "這不是一個實際的武器屬性，是在計算分數時，會以武器速度減去速度基線，再乘以 \"武器屬性\" 中的 \"速度\" 權重。",
		["SpeedBaselineIs"] = "|cffffffff速度基線|r:",
		["SpeedInfo"] = [=[武器速度: 每秒攻擊次數。
如果你偏好快速武器，此數應為負值。並請參閱 "特定武器屬性" 的 "速度基線" 部份。]=],
		["SpeedIs"] = "1 |cffffffff武器速度|r 價值:",
		["SpellCritInfo"] = "Spell critical strike.  Increases the chance that your spells will hit with increased potency.",
		["SpellDamage"] = "法術傷害",
		["SpellDamageInfo"] = "Spell damage.  Increases the damage dealt by your offensive spells.",
		["SpellHitInfo"] = "Spell Hit.  Increases the chance that your damaging spells hit the target, especially bosses.",
		--[[Translation missing --]]
		["SpellPenetrationInfo"] = "Spell Penetration. Negates an enemy's resistances to your spells.",
		["SpellPowerInfo"] = "",
		["SpiritInfo"] = "Spirit.  Affects your out-of-combat mana regeneration.",
		["StaminaInfo"] = "主要屬性, 耐力.",
		["StrengthInfo"] = "主要屬性, 力量.",
		["VersatilityInfo"] = "臨機應變: 增加角色造成的傷害及治療，減少角色受到的傷害",
		["WeaponMainHandDps"] = "主手: DPS",
		["WeaponMainHandDpsInfo"] = "武器每秒傷害，只針對於主手武器。",
		["WeaponMainHandMaxDamage"] = "主手: 最大傷害",
		["WeaponMainHandMaxDamageInfo"] = "武器最大傷害，只針對於主手武器。",
		["WeaponMainHandMinDamage"] = "主手: 最小傷害",
		["WeaponMainHandMinDamageInfo"] = "武器最小傷害，只針對於主手武器。",
		["WeaponMainHandSpeed"] = "主手: 武器速度",
		["WeaponMainHandSpeedInfo"] = "武器速度，只針對於主手武器。",
		["WeaponMaxDamage"] = "最大傷害",
		["WeaponMaxDamageInfo"] = "武器最大傷害。",
		["WeaponMeleeDps"] = "近戰: DPS",
		["WeaponMeleeDpsInfo"] = "武器每秒傷害，只針對於近戰武器。",
		["WeaponMeleeMaxDamage"] = "近戰: 最大傷害",
		["WeaponMeleeMaxDamageInfo"] = "武器最大傷害，只針對於近戰武器。",
		["WeaponMeleeMinDamage"] = "近戰: 最小傷害",
		["WeaponMeleeMinDamageInfo"] = "武器最小傷害，只針對於近戰武器。",
		["WeaponMeleeSpeed"] = "近戰: 武器速度",
		["WeaponMeleeSpeedInfo"] = "武器速度，只針對於近戰武器。",
		["WeaponMinDamage"] = "最小傷害",
		["WeaponMinDamageInfo"] = "武器最小傷害。",
		["WeaponOffHandDps"] = "副手: DPS",
		["WeaponOffHandDpsInfo"] = "武器每秒傷害，只針對於副手武器。",
		["WeaponOffHandMaxDamage"] = "副手: 最大傷害",
		["WeaponOffHandMaxDamageInfo"] = "武器最大傷害，只針對於副手武器。",
		["WeaponOffHandMinDamage"] = "副手: 最小傷害",
		["WeaponOffHandMinDamageInfo"] = "武器最小傷害，只針對於副手武器。",
		["WeaponOffHandSpeed"] = "副手: 武器速度",
		["WeaponOffHandSpeedInfo"] = "武器速度，只針對於副手武器。",
		["WeaponOneHandDps"] = "單手: DPS",
		["WeaponOneHandDpsInfo"] = "武器每秒傷害，只針對類型為 \"單手\" 的武器，不包括主手或副手武器。",
		["WeaponOneHandMaxDamage"] = "單手: 最大傷害",
		["WeaponOneHandMaxDamageInfo"] = "武器最大傷害，只針對類型為 \"單手\" 的武器，不包括主手或副手武器。",
		["WeaponOneHandMinDamage"] = "單手: 最小傷害",
		["WeaponOneHandMinDamageInfo"] = "武器最小傷害，只針對類型為 \"單手\" 的武器，不包括主手或副手武器。",
		["WeaponOneHandSpeed"] = "單手: 武器速度",
		["WeaponOneHandSpeedInfo"] = "武器速度，只針對類型為 \"單手\" 的武器，不包括主手或副手武器。",
		["WeaponRangedDps"] = "遠程: DPS",
		["WeaponRangedDpsInfo"] = "武器每秒傷害，只針對於遠程武器。",
		["WeaponRangedMaxDamage"] = "遠程: 最大傷害",
		["WeaponRangedMaxDamageInfo"] = "武器最大傷害，只針對於遠程武器。",
		["WeaponRangedMinDamage"] = "遠程: 最小傷害",
		["WeaponRangedMinDamageInfo"] = "武器最小傷害，只針對於遠程武器。",
		["WeaponRangedSpeed"] = "遠程: 武器速度",
		["WeaponRangedSpeedInfo"] = "武器速度，只針對於遠程武器。",
		["WeaponStats"] = "武器屬性",
		["WeaponTwoHandDps"] = "雙手: DPS",
		["WeaponTwoHandDpsInfo"] = "武器每秒傷害，只針對於雙手武器。",
		["WeaponTwoHandMaxDamage"] = "雙手: 最大傷害",
		["WeaponTwoHandMaxDamageInfo"] = "武器最大傷害，只針對於雙手武器。",
		["WeaponTwoHandMinDamage"] = "雙手: 最小傷害",
		["WeaponTwoHandMinDamageInfo"] = "武器最小傷害，只針對於雙手武器。",
		["WeaponTwoHandSpeed"] = "雙手: 武器速度",
		["WeaponTwoHandSpeedInfo"] = "武器速度，只針對於雙手武器。",
		["WeaponType1HAxe"] = "單手斧",
		["WeaponType1HAxeInfo"] = "此物若為單手斧，則增計多少分數。",
		["WeaponType1HMace"] = "單手錘",
		["WeaponType1HMaceInfo"] = "此物若為單手錘，則增計多少分數。",
		["WeaponType1HSword"] = "單手劍",
		["WeaponType1HSwordInfo"] = "此物若為單手劍，則增計多少分數。",
		["WeaponType2HAxe"] = "雙手斧",
		["WeaponType2HAxeInfo"] = "此物若為雙手斧，則增計多少分數。",
		["WeaponType2HMace"] = "雙手錘",
		["WeaponType2HMaceInfo"] = "此物若為雙手錘，則增計多少分數。",
		["WeaponType2HSword"] = "雙手劍",
		["WeaponType2HSwordInfo"] = "此物若為雙手劍，則增計多少分數。",
		["WeaponTypeBow"] = "弓",
		["WeaponTypeBowInfo"] = "此物若為弓，則增計多少分數。",
		["WeaponTypeCrossbow"] = "弩",
		["WeaponTypeCrossbowInfo"] = "此物若為弩，則增計多少分數。",
		["WeaponTypeDagger"] = "匕首",
		["WeaponTypeDaggerInfo"] = "此物若為匕首，則增計多少分數。",
		["WeaponTypeFistWeapon"] = "拳套",
		["WeaponTypeFistWeaponInfo"] = "此物若為拳套，則增計多少分數。",
		["WeaponTypeFrill"] = "副手飾物",
		["WeaponTypeFrillInfo"] = "此物若為\"拿在副手\"的施法副手裝備，則增計多少分數。不能為盾牌或者武器。",
		["WeaponTypeGun"] = "槍械",
		["WeaponTypeGunInfo"] = "此物若為槍械，則增計多少分數。",
		["WeaponTypeOffHand"] = "副手武器",
		["WeaponTypeOffHandInfo"] = "此物若為只能裝備在副手的武器時，則增計多少分數。不能為副手\"飾物\"(施法)物品，盾牌或者兩隻手都可拿的武器。",
		["WeaponTypePolearm"] = "長柄武器",
		["WeaponTypePolearmInfo"] = "此物若為長柄武器，則增計多少分數。",
		["WeaponTypes"] = "武器類型",
		["WeaponTypeStaff"] = "法杖",
		["WeaponTypeStaffInfo"] = "此物若為法杖，則增計多少分數。",
		["WeaponTypeThrown"] = "投擲",
		["WeaponTypeThrownInfo"] = "如果物品是投擲武器，要分配的分數。",
		["WeaponTypeWand"] = "魔杖",
		["WeaponTypeWandInfo"] = "此物若為魔杖，則增計多少分數。",
		["WeaponTypeWarglaive"] = "戰刃",
		["WeaponTypeWarglaiveInfo"] = "物品類型為戰刃。",
	},
	["TooltipParsing"] = {
		["Agility"] = "^%+?#敏捷$",
		["AllStats"] = "^%+?#所有屬性$",
		["Ap"] = "^%+?#攻擊強度$",
		["Ap2"] = "^裝備： %+#攻擊強度。$",
		["Ap3"] = "^裝備: 提高攻擊強度#點。$",
		["ArcaneResist"] = "^%+?# 祕法抗性$",
		["ArcaneSpellDamage"] = "^%+# 祕法法術傷害$",
		["ArcaneSpellDamage2"] = "^裝備： 祕法法術和效果造成的傷害提高最多#點。$",
		["ArcaneSpellDamage3"] = "^%+#秘法傷害$",
		["Armor"] = "^#點護甲$",
		["Armor2"] = "^裝備: %+#點護甲值。$",
		["ArmorPenetration"] = "^裝備: 你的攻擊無視目標#點護甲值。$",
		["ArmorPenetrationRating"] = "^裝備: 提高#點護甲穿透等級。$",
		["ArmorPenetrationRating2"] = "^UNUSED$",
		["ArmorPenetrationShort"] = "^%+?#護甲穿透等級$",
		["Avoidance"] = "^%+#迴避$",
		["Axe"] = "^斧$",
		["BagSlots"] = "^%d+格容器$",
		["Block"] = "^%+?#格擋$",
		["BlockPercent"] = "^裝備： 使你用盾牌格擋攻擊的機率提高#%%。$",
		["BlockRating"] = "^裝備: 使你的格擋等級提高#點。$",
		["BlockRating2"] = "^裝備: 提高#點盾牌格擋。$",
		["BlockValue"] = "^裝備： 使你的盾牌格擋值提高#點。$",
		["Bow"] = "^弓$",
		["ChanceOnHit"] = "擊中時可能: ",
		["Charges"] = "^.+次?$",
		["Cloth"] = "^布甲$",
		["CooldownRemaining"] = "^冷卻時間:",
		["Corruption"] = "^%+?#腐化$",
		["Crit"] = "^%+?#致命一擊$",
		["Crit2"] = "^裝備: 提高#點致命一擊。$",
		["CritPercent"] = "^裝備： 使你造成致命一擊的機率提高#%%。$",
		["CritRating"] = "^裝備: 使你的致命一擊等級提高#點。$",
		["CritRating2"] = "^UNUSED$",
		["CritRating3"] = "^UNUSED$",
		["CritRatingShort"] = "^%+?#致命一擊等級$",
		["Crossbow"] = "^弩$",
		["Dagger"] = "^匕首$",
		["DefenseRating"] = "^裝備: 防禦等級提高#點。$",
		["DefenseRating2"] = "^裝備: 提高#點防禦。$",
		["DefenseRatingSimple"] = "^%+?#防禦等級$",
		["DefenseSkill"] = "^Equip: Increased Defense %+#%.$",
		["DefenseSkillSimple"] = "^%+?耐力$",
		["DisenchantingRequires"] = "^分解需要",
		["Dodge"] = "^%+?#%%? 躲避$",
		["Dodge2"] = "^裝備: 提高#%%?點閃躲等級。$",
		["Dodge3"] = "^躲閃 %+#%%$",
		["DodgePercent"] = "^裝備： 使你躲閃攻擊的機率提高#%%。$",
		["DodgeRating"] = "^裝備: 使你的閃躲等級提高#點。$",
		["DodgeRating2"] = "^裝備: 提高#點閃躲。$",
		["DodgeRatingShort"] = "^%+?#閃躲等級$",
		["Dps"] = "^%(每秒#點傷害%)$",
		["DpsAdd"] = "^增加 #每秒傷害$",
		["Duration"] = "^持續:",
		["Elite"] = "^精英$",
		["EnchantmentArmorKit"] = "^強化%(%+#護甲%)$",
		["EnchantmentCounterweight"] = "^增重%(%+#傷害%)",
		["EnchantmentFieryWeapon"] = "^灼熱武器$",
		["EnchantmentHealth"] = "^%+#生命力?$",
		["EnchantmentHealth2"] = "^UNUSED$",
		["EnchantmentLivingSteelWeaponChain"] = "^活化鋼武器鍊$",
		["EnchantmentPyriumWeaponChain"] = "^黃鐵武器鍊$",
		["EnchantmentTitaniumWeaponChain"] = "^泰坦鋼武器鍊$",
		["Equip"] = "裝備: ",
		["ExpertiseRating"] = "^裝備: 提高#點熟練。$",
		["ExpertiseRatingShort"] = "^%+?#熟練等級$",
		["FeralAp"] = "^裝備： 在獵豹、熊或巨熊形態下的攻擊強度提高#點。$",
		["FeralApMoonkin"] = "^裝備: 在獵豹、熊、巨熊和梟獸形態下的攻擊強度提高#點。$",
		["FeralApWrath"] = "^使你在獵豹、熊、巨熊和梟獸形態下的攻擊強度提高#點。$",
		["FireResist"] = "^%+?# 火焰抗性$",
		["FireSpellDamage"] = "^%+# 火焰法術傷$",
		["FireSpellDamage2"] = "^裝備： 提高火焰法術和效果所造成的傷害，最多#點。$",
		["FireSpellDamage3"] = "^%+#火焰傷害$",
		["FistWeapon"] = "^拳套$",
		["Flexible"] = "^Flexible$",
		["FrostResist"] = "^%+?# 冰霜抗性$",
		["FrostSpellDamage"] = "^%+# 冰霜法術傷害$",
		["FrostSpellDamage2"] = "^裝備： 提高冰霜法術和效果所造成的傷害，最多#點。$",
		["FrostSpellDamage3"] = "^%+#冰霜傷害$",
		["Gun"] = "^槍械$",
		["Haste"] = "^%+?#加速$",
		["Haste2"] = "^裝備: 提高#點加速。$",
		["HasteRating"] = "^裝備: 提高#點加速。$",
		["HasteRating2"] = "^UNUSED$",
		--[[Translation missing --]]
		["HasteRatingShort"] = "^%+?# Haste Rating$",
		["HaventCollectedAppearance"] = "^你尚未收藏過此外觀$",
		["Healing"] = "^%+# 治療法術$",
		["Healing2"] = "^裝備： 提高法術和魔法效果所造成的治療效果，最多#點。$",
		["Healing3"] = "^%+#治療$",
		["HeirloomLevelRange"] = "^需要等級(%d+)至(%d+)%((%d+)%)",
		["HeirloomXpBoost"] = "^裝備: .*獲得的經驗值提高%d+%%。",
		["HeirloomXpBoost2"] = "^UNUSED$",
		["Heroic"] = "^英雄難度$",
		["HeroicElite"] = "^傳奇難度$",
		["HeroicThunderforged"] = "^英雄難度雷霆鎔鑄$",
		["HeroicWarforged"] = "^英雄難度戰鑄$",
		["Hit"] = "^裝備： 使你擊中目標的機率提高#%%。$",
		["Hit2"] = "^UNUSED$",
		["HitRating"] = "^裝備: 提高#點命中。$",
		["HitRating2"] = "^裝備: 使你的命中等級提高#點。$",
		["HitRating3"] = "^UNUSED$",
		["HitRatingShort"] = "^%+?#命中等級$",
		["HolySpellDamage"] = "^%+# Holy Spell Damage$",
		["HolySpellDamage2"] = "^裝備： 提高神聖法術和效果所造成的傷害，最多#點。$",
		["HolySpellDamage3"] = "^裝備: 使神聖法術和效果所造成的傷害提高最多#點。$",
		["Hp5"] = "^裝備: 每5秒恢復#生命力。$",
		["Hp52"] = "^每5秒恢復#點?生命力。?$",
		["Hp53"] = "^UNUSED$",
		["Hp54"] = "^UNUSED$",
		["Hp55"] = "^UNUSED$",
		["Intellect"] = "^%+?#智力$",
		["Leather"] = "^皮甲$",
		["Leech"] = "^%+#汲取$",
		["Mace"] = "^錘$",
		["Mail"] = "^鎖甲$",
		["Mastery"] = "^%+?#精通$",
		["Mastery2"] = "^裝備: 提高#點精通。$",
		["MetaGemRequirements"] = "|cff%x%x%x%x%x%x需求",
		["MovementSpeed"] = "^%+#速度$",
		["Mp5"] = "^裝備： 每5秒恢復#點法力。$",
		["Mp52"] = "^每5秒恢復#點法力。$",
		["Mp53"] = "^UNUSED$",
		["Mp54"] = "^裝備: 每5秒恢復#點法力。$",
		["Mp55"] = "^UNUSED$",
		["MultiStatHeading"] = "^多項統計$",
		["MultiStatSeparator1"] = "和",
		["Multistrike"] = "^%+#雙擊$",
		["NatureResist"] = "^%+?# 自然抗性$",
		["NatureSpellDamage"] = "^%+# 自然法術傷害$",
		["NatureSpellDamage2"] = "^裝備： 提高自然法術和效果所造成的傷害，最多#點。$",
		["NatureSpellDamage3"] = "^%+#自然傷害$",
		["NormalizationEnchant"] = "^附魔:(.*)$",
		["Parry"] = "^%+?#招架$",
		["Parry2"] = "^裝備: 提高#點招架等級。$",
		["ParryPercent"] = "^裝備： 使你招架攻擊的機率提高#%%。$",
		["ParryRating"] = "^裝備: 使你的招架等級提高#點。$",
		["ParryRatingShort"] = "^%+?#招架等級$",
		["Plate"] = "^鎧甲$",
		["Polearm"] = "^長柄武器$",
		["PvPPower"] = "^%+?#PvP強度$",
		["RaidFinder"] = "^團隊搜尋器$",
		["Rap"] = "^裝備： %+#遠程攻擊強度。$",
		["Rap2"] = "^裝備: 提高#點遠程攻擊強度。$",
		["Requires2"] = "^UNUSED$",
		["Resilience"] = "^%+?#PvP韌性$",
		["Resilience2"] = "^裝備: 提高#點韌性。$",
		["ResilienceRating"] = "^裝備： 提高#點韌性。$",
		["ResilienceRatingShort"] = "^%+?#韌性等級$",
		["Scope"] = "^瞄準鏡%(%+#傷害%)$",
		["ScopeCrit"] = "^瞄準鏡%(%+#致命一擊%)$",
		["ScopeRangedCrit"] = "^%+?#遠程致命一擊$",
		["ShadowResist"] = "^%+?# 陰影抗性$",
		["ShadowSpellDamage"] = "^%+# 暗影法術傷害$",
		["ShadowSpellDamage2"] = "^裝備： 提高暗影法術和效果所造成的傷害，最多#點。$",
		["ShadowSpellDamage3"] = "^UNUSED$",
		["ShadowSpellDamage4"] = "^%+#暗影傷害$",
		["Shield"] = "^盾牌$",
		["SocketBonusPrefix"] = "插槽加成：",
		["Speed"] = "^速度 #$",
		["Speed2"] = "^UNUSED$",
		["SpellCrit"] = "^裝備： 使你的法術造成致命一擊的機率提高#%%。$",
		["SpellCritRating"] = "^裝備: 使你的法術致命一擊等級提高#點。$",
		["SpellCritRating2"] = "^裝備: 提高#點法術致命一擊。$",
		["SpellCritRatingShort"] = "^%+?#法術致命一擊等級$",
		["SpellCritRatingShort2"] = "^UNUSED$",
		["SpellDamage"] = "^%+# 傷害及治療法術$",
		["SpellDamage2"] = "^裝備： 提高法術和魔法效果所造成的傷害和治療效果，最多#點。$",
		["SpellDamage3"] = "^裝備: 使所有法術和魔法效果所造成的傷害和治療效果提高最多#點。$",
		["SpellDamage4"] = "^UNUSED$",
		["SpellDamage5"] = "^%+#法術傷害和治療$",
		["SpellDamage6"] = "^UNUSED$",
		["SpellDamageAndHealing"] = "^果提高最多#點，法術傷害提高最多#點。$",
		["SpellDamageAndHealing2"] = "^裝備: 使法術和魔法效果所造成的治療效果提高最多#點，法術傷害提高最多#點。$",
		["SpellDamageAndHealingEnchant"] = "^%+#治療和%+#法術傷害",
		["SpellDamageAndHealingShort"] = "^%+#治療法術和%+#傷害法術",
		["SpellDamageAndHealingShort2"] = "^UNUSED$",
		["SpellHasteRating"] = "^裝備: 提高#點法術加速。$",
		["SpellHasteRatingShort"] = "^%+?#法術加速等級$",
		["SpellHit"] = "^裝備： 使你的法術擊中敵人的機率提高#%%。$",
		["SpellHitRating"] = "^裝備: 使你的法術命中等級提高#點。$",
		["SpellHitRating2"] = "^裝備: 提高#點法術命中。$",
		["SpellHitRatingShort"] = "^%+?#法術命中等級$",
		["SpellPenetration"] = "^裝備: 使你的法術穿透力提高#點。$",
		["SpellPenetrationClassic"] = "^裝備： 使你法術目標的魔法抗性降低#點。$",
		["SpellPenetrationShort"] = "^%+?#法術穿透力$",
		["SpellPower"] = "^%+?#法術能量$",
		["SpellPower2"] = "^裝備： 提高#點法術能量。$",
		["SpellPower3"] = "^UNUSED$",
		["Spirit"] = "^%+?#精神$",
		["Staff"] = "^法杖$",
		["Stamina"] = "^%+?#耐力$",
		["Strength"] = "^%+?#力量$",
		["Sword"] = "^劍$",
		["TemporaryBuffMinutes"] = "^.+%(%d+ 分%)$",
		["TemporaryBuffSeconds"] = "^.+%(%d+ 秒%)$",
		["Thrown"] = "^投擲武器$",
		["Thunderforged"] = "^雷霆鎔鑄$",
		["Timeless"] = "^永恆之島$",
		["Titanforged"] = "^泰坦鎔鑄$",
		["UpgradeLevel"] = "^Upgrade Level:",
		["Use"] = "使用: ",
		["Versatility"] = "^%+#臨機應變$",
		["Wand"] = "^魔杖$",
		["Warforged"] = "^戰鑄$",
		["Warglaives"] = "^戰刃$",
		["WeaponDamage"] = "^#%-#點傷害$",
		["WeaponDamageArcane"] = "^#%-#點秘法傷害$",
		["WeaponDamageArcaneExact"] = "^#點秘法傷害$",
		["WeaponDamageEnchantment"] = "^%+?#武器傷害$",
		["WeaponDamageEquip"] = "^裝備: %+?#點武器傷害。$",
		["WeaponDamageExact"] = "^#點傷害$",
		["WeaponDamageFire"] = "^#%-#點火焰傷害$",
		["WeaponDamageFireExact"] = "^#點火焰傷害$",
		["WeaponDamageFrost"] = "^#%-#點冰霜傷害$",
		["WeaponDamageFrostExact"] = "^#點冰霜傷害$",
		["WeaponDamageHoly"] = "^#%-#點神聖傷害$",
		["WeaponDamageHolyExact"] = "^#點神聖傷害$",
		["WeaponDamageNature"] = "^#%-#點自然傷害$",
		["WeaponDamageNatureExact"] = "^#點自然傷害$",
		["WeaponDamageShadow"] = "^#%-#點暗影傷害$",
		["WeaponDamageShadowExact"] = "^#點暗影傷害$",
	},
	["UI"] = {
		["AboutHeader"] = "關於 Pawn",
		["AboutMrRobot"] = "Mr. Robot慷慨大方提供了預設的屬性權值。 他們是角色在典型戰鬥中的典型天賦與典型神兵特長的一個很好的起點。 您可以使用askmrrobot.com上的Ask Mr. Robot模擬器獲得更準確的自定義屬性。",
		["AboutReadme"] = "剛開始用 Pawn 嗎？請參閱[入門]頁面取得基本介紹。",
		["AboutTab"] = "關於",
		["AboutTranslation"] = "正體中文: scars 2014/10/21",
		["AboutVersion"] = "版本: %s",
		["AboutWebsite"] = "請至 vgermods.com 檢視由 Vger 製作的其他插件",
		["AskMrRobotProvider"] = "Ask Mr. Robot權值",
		["CompareClearItems"] = "清除",
		["CompareClearItemsTooltip"] = "移除兩件比較中的物品.",
		["CompareColoredSockets"] = "有色插槽",
		["CompareEquipped"] = "已裝備",
		["CompareGemTotalValue"] = "寶石總值",
		["CompareHeader"] = "用 %s 進行比較",
		["CompareOtherHeader"] = "其他",
		["CompareSlotEmpty"] = "(空)",
		["CompareSocketBonus"] = "插槽加成",
		["CompareSocketsHeader"] = "插槽",
		["CompareSpecialEffects"] = "特殊效果",
		["CompareSwap"] = "對調",
		["CompareSwapTooltip"] = "將兩邊物品對調.",
		["CompareTab"] = "比較",
		["CompareVersus"] = "—vs.—",
		["CompareWelcomeRight"] = [=[然後,
將一個物品放入此欄.
Pawn會與你身上的裝備比較]=],
		["CompareYourBest"] = "欄位最佳",
		["GemsColorHeader"] = "%s寶石",
		["GemsHeader"] = "用 %s 鑲嵌寶石",
		["GemsNoneFound"] = "沒找到寶石.",
		["GemsQualityLevel"] = "寶石等級",
		["GemsQualityLevelTooltip"] = [=[基於物品等級的寶石建議

例如，若設定為"463"，則 Pawn 將顯示適合物品等級463的寶石建議(MoP英雄副本的掉落裝等)]=],
		["GemsShowBest"] = "顯示可用的最佳寶石",
		["GemsShowBestTooltip"] = "顯示所選權重下的最佳寶石。可能會不適用於較舊或等級較低的裝備。",
		["GemsShowForItemLevel"] = "顯示指定等級的最佳寶石",
		["GemsShowForItemLevelTooltip"] = "顯示所選權重下，指定物品等級的最佳寶石。",
		["GemsTab"] = "寶石",
		["GemsWelcome"] = "在左方選擇一份權重來檢視 Pawn 的寶石建議",
		["HelpHeader"] = "歡迎使用 Pawn!",
		["HelpTab"] = "入門",
		["HelpText"] = [=[Pawn 通過權重計算來幫你更簡單的選擇裝備。
這些權重分數會顯示在你物品提示欄的底部。

|cff8ec3e6當你已經熟悉基本用法後，你可以試著:|r
 • 用 Pawn 的比較頁面來比較兩件物品的屬性。
 • 在一件物品鏈接上點擊右鍵來查看它與你當前物品的比較。
 • 用Shift-右鍵點擊一件有插槽的物品，可讓 Pawn 為它提供寶石建議。
 • 在權重頁面上為你的一個權重做備份，並在編輯頁面上自訂屬性。
 • 查看說明文件了解更多 Pawn 的相關進階功能。]=],
		["InterfaceOptionsBody"] = "點擊 Pawn 按鈕到達此處。你也可從角色資訊頁面打開 Pawn ，或者為它綁定一個按鍵。",
		["InterfaceOptionsWelcome"] = "Pawn 設置位於 Pawn 介面中",
		["InventoryButtonTooltip"] = "點擊顯示 Pawn 介面.",
		["InventoryButtonTotalsHeader"] = "所有已裝備物品之總計:",
		["KeyBindingCompareItemLeft"] = "比較物品 (左)",
		["KeyBindingCompareItemRight"] = "比較物品 (右)",
		["KeyBindingShowUI"] = "顯示 Pawn 介面",
		["OptionsAdvisorHeader"] = "建議選項",
		["OptionsAlignRight"] = "將數值對齊右方",
		["OptionsAlignRightTooltip"] = "讓Pawn的數值在物品提示欄對齊右方，而非左方",
		["OptionsBagUpgradeAdvisor"] = "顯示背包升級建議",
		["OptionsBagUpgradeAdvisorTooltip"] = [=[啟用此選項讓Pawn接管背包內升級箭頭。

勾選後，Pawn會在你的背包中找到升級物品，並用綠色箭頭標記任何啟用權值的升級物品。

如果不勾選，WoW會標記比你目前穿著物品等級更高的物品，Pawn不會干擾內置功能。]=],
		["OptionsBlankLine"] = "數值前加一個空白行",
		["OptionsBlankLineTooltip"] = "在 Pawn 數值前加入空白行，讓你的提示訊息更整齊",
		["OptionsButtonHidden"] = "不顯示",
		["OptionsButtonHiddenTooltip"] = "不在角色面板顯示 Pawn 按紐",
		["OptionsButtonPosition"] = "Pawn 按紐位置:",
		["OptionsButtonPositionLeft"] = "於左側",
		["OptionsButtonPositionLeftTooltip"] = "在角色面板左下顯示 Pawn 按紐",
		["OptionsButtonPositionRight"] = "於右側",
		["OptionsButtonPositionRightTooltip"] = "在角色面板右下顯示 Pawn 按紐",
		["OptionsColorBorder"] = "對升級建議物品使用著色的提示欄外框",
		["OptionsColorBorderTooltip"] = [=[開啟此選項，則較佳的物品會有綠色的提示欄外框

若與其他提示欄插件發生衝突，請關閉此選項]=],
		["OptionsCurrentValue"] = "同時顯示當前數值與基本數值",
		["OptionsCurrentValueTooltip"] = [=[開啟此選項以顯示兩種數值:

當前數值: 依物品實際裝設的寶石與附魔來計算分數，空的插槽不計分。

基本數值: Pawn以一般方式計算的數值。

此選項必須開啟「顯示物品提示資訊」選項才能生效

你應該使用基本數值來比較 Endgame 時的物品分數，但當前數值有助於在升級練等時提供換裝參考。]=],
		["OptionsDebug"] = "顯示除錯訊息",
		["OptionsDebugTooltip"] = [=[如果你不確定 Pawn 是如何計算某樣物品的分數，開啟此選項以傾印除錯訊息，當游標指向物品時於對話視窗顯示除錯資訊。

訊息包含 Pawn 認為物品中含有哪些屬性、Pawn 無法解析物品中的哪些項目、以及各屬性是如何計算至結果分數的。

開啟此選項後你的對話視窗會很快速的被占滿，所以最好在檢視完成後隨即關閉。

快速指令:
/pawn debug on
/pawn debug off]=],
		["OptionsHeader"] = "設定 Pawn",
		["OptionsIgnoreGemsWhileLevelingCheck"] = "忽略低等裝備的寶石插槽",
		["OptionsIgnoreGemsWhileLevelingCheckTooltip"] = [=[開啟此選項，則 Pawn 在計算分數時，會忽略低等級裝備的寶石插槽。這是鑒於大多數玩家在升級練等時不會特地為過渡裝備插上寶石。

「低等級裝備」指的是同等級中，低於英雄地城掉落物品等級的裝備

若選擇忽略，Pawn 仍會顯示寶石建議，但插槽將不列入物品的分數計算，因此有插槽的物品出現時，不再比一般物品容易出現升級建議。

若不選取此項目，Pawn 會一律將插槽並列入物品計分(視為插入最佳寶石)]=],
		["OptionsIgnoreItemUpgradesCheck"] = [=[忽略裝備潛在提升裝等後的屬性評估
]=],
		["OptionsIgnoreItemUpgradesCheckTooltip"] = [=[啟用此選項，插件會忽略裝備潛在的屬性可能去評估，即利用勇氣點數等提升裝等的潛在屬性。

選中後，插件只會計算裝備當前狀態的屬性評估。

未選中的情況下，插件會計算本件裝備最大提升後潛在的屬性評估，即用勇氣點數等升級滿裝備裝等後的屬性。此屬性將顯示包含在裝備當前屬性後的括號內。]=],
		["OptionsInventoryIcon"] = "顯示物品圖標",
		["OptionsInventoryIconTooltip"] = "開啟此選項以在物品連結視窗旁顯示物品圖標",
		["OptionsItemIDs"] = "顯示物品ID",
		["OptionsItemIDsTooltip"] = [=[開啟此選項，使 Pawn 顯示物品ID、附魔ID以及寶石ID。
WoW中所有的物件都有個ID，通常只有寫插件的人才需要這些資訊。]=],
		["OptionsLootAdvisor"] = "顯示裝備掉落升級建議",
		["OptionsLootAdvisorTooltip"] = "當副本中掉落的物品較你身上的為佳時，在擲骰視窗旁顯示升級建議",
		["OptionsOtherHeader"] = "其它選項",
		["OptionsQuestUpgradeAdvisor"] = "顯示任務獎勵升級建議",
		["OptionsQuestUpgradeAdvisorTooltip"] = [=[與任務NPC交談而開啟任務視窗時，

若有任務獎勵物品較你身上的為佳，則在物品上顯示綠色箭頭圖示；

若沒有較佳物品，則在賣價最高的物品上顯示金幣圖示。]=],
		["OptionsResetUpgrades"] = "重新掃描裝備",
		["OptionsResetUpgradesTooltip"] = [=[Pawn 會遺忘並重新掃描你的最佳裝備資料，以提供更新的升級建議。

若你發現 Pawn 基於你已賣出、摧毀，或早已不用的裝備，而頻頻作出欠佳的升級建議，請使用此功能。

這會影響到你所有使用 Pawn 的角色]=],
		["OptionsShowItemLevelUpgrades"] = "顯示物品等級提升",
		["OptionsShowItemLevelUpgradesTooltip"] = "除了正常提升之外，Pawn將向您顯示高於您之前在該部位中裝備的物品等級。",
		["OptionsShowRelicUpgrades"] = "顯示聖物升級",
		["OptionsShowRelicUpgradesTooltip"] = "當一件聖物會增加你的一件神兵物品等級時，Pawn會顯示。（這與其他升級功能不同，因為它基於物品等級，而不是屬性。）",
		["OptionsSocketingAdvisor"] = "顯示插槽建議",
		["OptionsSocketingAdvisorTooltip"] = [=[為插槽附加寶石時，Pawn 會顯示最佳寶石建議。

若要檢視各色寶石建議，請使用 Pawn 的寶石頁面，也可設定要使用的寶石等級]=],
		["OptionsTab"] = "設定",
		["OptionsTooltipHeader"] = "物品提示設定",
		["OptionsTooltipSpecIcon"] = "顯示專精圖標",
		["OptionsTooltipSpecIconTooltip"] = "在預設的屬性權重名稱之前顯示對應專精的圖標。",
		["OptionsTooltipUpgradesOnly"] = "只顯示升級比例",
		["OptionsTooltipUpgradesOnlyTooltip"] = [=[
這是最簡易的選項，在物品提示中只顯示升級比例。

|cff8ec3e6火焰:|r  |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% 提升|r

...或...

|cff8ec3e6火焰:  最佳|r]=],
		["OptionsTooltipValuesAndUpgrades"] = "顯示權重數值和升級比例",
		["OptionsTooltipValuesAndUpgradesTooltip"] = [=[
在物品提示中依你選定的權重顯示 Pawn 數值，除了數值為零的物品。並指出物品是否較你當前裝備為佳。

|cff8ec3e6冰霜:  123.4
火焰:  156.7 |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% 提升|r]=],
		["OptionsTooltipValuesOnly"] = "只顯示權重數值，不顯示升級比例",
		["OptionsTooltipValuesOnlyTooltip"] = [=[
在物品提示中依你選定的權重顯示 Pawn 數值，除了數值為零的物品。

|cff8ec3e6冰霜:  123.4
火焰:  156.7|r]=],
		["OptionsUpgradeHeader"] = "在提示欄顯示 |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t 升級:",
		["OptionsUpgradeSettingsHeader"] = "升級選項",
		["OptionsUpgradesForBothWeaponTypes"] = "同時顯示單手與雙手武器的升級建議",
		["OptionsUpgradesForBothWeaponTypesTooltip"] = [=[Pawn 的升級建議將雙手武器及雙持單手武器(或主副手武器)視為不同項目

若開啟此選項，當你裝備雙手武器時，Pawn 仍會根據你上次使用的最佳單手武器，對新的單手武器作出升級建議。

若關閉此選項，當你裝備雙手武器時，Pawn 即不會對單手武器作升級建議，反之亦然。]=],
		["OptionsUpgradeTrackingHeader"] = "升級對比：",
		["OptionsUpgradeTrackingOff"] = "對比身上的裝備(建議)",
		["OptionsUpgradeTrackingOffTooltip"] = "Pawn僅僅只比較當前物品與角色身上同部位正在裝備的物品的屬性權重。",
		["OptionsUpgradeTrackingOn"] = "追蹤每個紀錄(進階)",
		["OptionsUpgradeTrackingOnTooltip"] = "(給進階使用者)Pawn會針對每個裝備的部位，記錄過你所穿過的評分最高的裝備，每次對比均會與這件記錄的裝備對比，這件裝備可以在背包裡倉庫裡，而並非一定是你現在角色裝備的那件。",
		["OptionsWelcome"] = "按照你的偏好設定 Pawn. 更動會馬上生效.",
		["ScaleAutoOff"] = "自定義",
		["ScaleAutoOff2"] = "自由設定屬性權重。",
		["ScaleAutoOffTooltip"] = "你可以自由設定屬性權重的評分標準，或者一種專精幾種評分標準，甚至直接關閉某項專精的評分。",
		["ScaleAutoOn"] = "自動適配",
		["ScaleAutoOn2"] = "自動選擇當前專精對應的屬性權重。",
		["ScaleAutoOnTooltip"] = "Pawn會根據你的職業，自動選擇預設的專精屬性權重。",
		["ScaleAutoWelcome"] = [=[Pawn 會自動切換顯示你現在正在使用的專精對應的屬性權重。

如果你需要獨立設定，請點擊右下角的自定義設定。]=],
		["ScaleChangeColor"] = "調整顏色",
		["ScaleChangeColorTooltip"] = "調整物品提示欄中權重名稱和數值的顏色.",
		["ScaleCopy"] = "複製",
		["ScaleCopyTooltip"] = "由此權重複製一份新的",
		["ScaleDefaults"] = "預設",
		["ScaleDefaultsTooltip"] = "由預設權重複製一份新的",
		["ScaleDeleteTooltip"] = [=[將這個權重刪除
刪除後將無法復原!]=],
		["ScaleEmpty"] = "創建",
		["ScaleEmptyTooltip"] = "創建一份空白的新權重",
		["ScaleExport"] = "匯出",
		["ScaleExportTooltip"] = "輸出權重字串以分享至網路上",
		["ScaleHeader"] = "管理你的 Pawn 權重",
		["ScaleImport"] = "匯入",
		["ScaleImportTooltip"] = "從網路上複製他人的權重字串",
		["ScaleNewHeader"] = "創建",
		["ScaleRename"] = "重新命名",
		["ScaleRenameTooltip"] = "重新命名這個權重.",
		["ScaleSelectorHeader"] = "選擇一個權重:",
		["ScaleSelectorNoneWarning"] = "至少選擇一項。",
		["ScaleSelectorShowingSuggestionsFor"] = "當前屬性權重的專精",
		["ScaleSelectorShowScale"] = "在提示欄中顯示權重",
		["ScaleSelectorShowScaleTooltip"] = "當選取時，此權重值將顯示在此角色的物品提示欄中。每個權重可以顯示在一個、多個，或無角色中。",
		["ScaleShareHeader"] = "分享",
		["ScaleTab"] = "權重",
		["ScaleTypeNormal"] = "你可以在編輯頁面中調整這個權重",
		["ScaleTypeReadOnly"] = "若要自訂這個權重，你應該先為其備份.",
		["ScaleWelcome"] = [=[權重是物品各屬性的分數定義，
你可以自訂你的權重，或者使用別人設定的權重。]=],
		["SocketingAdvisorButtonTooltip"] = "點擊顯示Pawn珠寶介面, 此處你可看到 Pawn 為每種權重推薦的寶石,和更換至更高或更低品質的寶石.",
		["SocketingAdvisorHeader"] = "Pawn 插槽建議:",
		["SocketingAdvisorIgnoreThisItem"] = "不需要特地為這個低等裝備嵌入寶石，但如果你真的要的話，可使用以下建議:",
		["StarterProvider"] = "預設權重",
		["ValuesDoNotShowUpgradesFor1H"] = "不要顯示單手裝備的提升",
		["ValuesDoNotShowUpgradesFor2H"] = "不要顯示雙手裝備的提升",
		["ValuesDoNotShowUpgradesTooltip"] = "啟用該選項來隱藏此類型裝備的提升。比如，雖然坦騎可以用雙手武器，但是對坦騎設定來說一件雙手武器從來都不是一個 \"提升\"，因此Pawn將不會為它們顯示提升訊息。同樣，懲戒騎可以使用單手武器，但它們從不是一個提升。",
		["ValuesFollowSpecialization"] = "%d等以後只顯示最佳護甲類型",
		["ValuesFollowSpecializationTooltip"] = "啟用該選項來隱藏%d等以後非職業專精的護甲類型。比如，神聖聖騎在%d等學到了鎧甲專精, 當只裝備鎧甲時增加智力5%%。當此選項選擇時Pawn將不會考慮布、皮及鎖甲對%d等以上神聖聖騎士的提升",
		["ValuesHeader"] = "調整 %s 權重",
		["ValuesIgnoreItemType"] = "帶此屬性的物品沒有用處。",
		["ValuesIgnoreStat"] = "帶此屬性的物品沒有用處。",
		["ValuesIgnoreStatTooltip"] = "啟用這個選項讓此物品不計分數。例如，薩滿不能裝備鎧甲，所以為薩滿設計的權重可以標記鎧甲為不可用的，鎧甲即不計分。",
		["ValuesNormalize"] = "數值標準化 (像 Wowhead)",
		["ValuesNormalizeTooltip"] = [=[啟用此選項會將每項數值的分數除以所有數值的分數總和，就像 Wowhead 跟 Lootzor 那樣。
這有助於攤平數值差異，例如一項屬性分數為 1，另一項為 5。也有助於維持分數在合理範圍。
取得此項設定的更多資訊，請看說明檔案。]=],
		["ValuesRemove"] = "移除",
		["ValuesRemoveTooltip"] = "從權重中移除此屬性。",
		["ValuesTab"] = "分數",
		["ValuesWelcome"] = [=[你可以為該權重決定分配給每項屬性的分數。
若要管理你的權重和增加新權重，請用權重頁面。]=],
		["ValuesWelcomeNoScales"] = "你還未選擇權重。若要啟動，請去權重頁面啟動一個新權重或者從網上複製一個。",
		["ValuesWelcomeReadOnly"] = [=[所選擇的權重無法更改。
若你想改變這些分數，請至權重頁面複製或創建一個新權重。]=],
	}
}

-- Special case: weapons actually use different text on live versus classic.
-- So, patch things up here.
if VgerCore.IsClassic then

	local TooltipParsing_Classic =
	{
		["Dps"] = "^%（每秒傷害#%）$",
		["WeaponDamage"] = "^# %- #傷害$",
		["WeaponDamageArcane"] = "^# %- #祕法傷害$",
		["WeaponDamageArcaneExact"] = "^#祕法傷害$",
		["WeaponDamageEquip"] = "^裝備: %+?#武器傷害。$",
		["WeaponDamageExact"] = "^#傷害$",
		["WeaponDamageFire"] = "^# %- #火焰傷害$",
		["WeaponDamageFireExact"] = "^#火焰傷害$",
		["WeaponDamageFrost"] = "^# %- #冰霜傷害$",
		["WeaponDamageFrostExact"] = "^#冰霜傷害$",
		["WeaponDamageHoly"] = "^# %- #神聖傷害$",
		["WeaponDamageHolyExact"] = "^#神聖傷害$",
		["WeaponDamageNature"] = "^# %- #自然傷害$",
		["WeaponDamageNatureExact"] = "^#自然傷害$",
		["WeaponDamageShadow"] = "^# %- #陰影傷害$",
		["WeaponDamageShadowExact"] = "^#陰影傷害$",
	}

	local Key, NewString
	for Key, NewString in pairs(TooltipParsing_Classic) do
		PawnLocal.TooltipParsing[Key] = NewString
	end
end

if VgerCore.IsBurningCrusade or VgerCore.IsWrath then

	local TooltipParsing_BurningCrusade =
	{
		["BlockValue"] = "^裝備: 使你盾牌的格擋值提高#點。$",
		["Dps"] = "^%（每秒傷害#%）$",
		["WeaponDamage"] = "^# %- #傷害$",
		["WeaponDamageArcane"] = "^# %- #秘法傷害$",
		["WeaponDamageArcaneExact"] = "^#秘法傷害$",
		["WeaponDamageEquip"] = "^裝備: %+?#武器傷害。$",
		["WeaponDamageExact"] = "^#傷害$",
		["WeaponDamageFire"] = "^# %- #火焰傷害$",
		["WeaponDamageFireExact"] = "^#火焰傷害$",
		["WeaponDamageFrost"] = "^# %- #冰霜傷害$",
		["WeaponDamageFrostExact"] = "^#冰霜傷害$",
		["WeaponDamageHoly"] = "^# %- #神聖傷害$",
		["WeaponDamageHolyExact"] = "^#神聖傷害$",
		["WeaponDamageNature"] = "^# %- #自然傷害$",
		["WeaponDamageNatureExact"] = "^#自然傷害$",
		["WeaponDamageShadow"] = "^# %- #暗影傷害$",
		["WeaponDamageShadowExact"] = "^#暗影傷害$",
	}

	local Key, NewString
	for Key, NewString in pairs(TooltipParsing_BurningCrusade) do
		PawnLocal.TooltipParsing[Key] = NewString
	end
end

if VgerCore.IsWrath then

	local TooltipParsing_Wrath =
	{
		["Ap3"] = "^裝備: 提高#點攻擊強度。$",
		["BlockRating"] = "^裝備: 提高#點格擋等級。$",
		["CritRating"] = "^裝備: 提高#點致命一擊等級。$",
		["CritRating2"] = "^裝備: 提高#點致命一擊等級。$",
		["CritRating3"] = "^裝備: 提高#點致命一擊等級。$",
		["CritRatingShort"] = "^裝備: 提高#點致命一擊等級。$",
		["DefenseRating2"] = "^裝備: 提高#點防禦等級。$",
		["ExpertiseRating"] = "^裝備: 提高#點熟練等級。$",
		["HasteRating"] = "^裝備: 提高#點加速等級。$",
		["HitRating"] = "^裝備: 提高#點命中等級。$",
		["HitRating2"] = "^裝備: 提高#點命中等級。$",
		["Hp55"] = "^每5秒恢復#生命力$",
		["ResilienceRating"] = "^裝備: 提高#點韌性等級。$",
		["SpellPower2"] = "^裝備: 提高#點法術能量。$",
	}

	local Key, NewString
	for Key, NewString in pairs(TooltipParsing_Wrath) do
		PawnLocal.TooltipParsing[Key] = NewString
	end
end

PawnLocal.Specs =
{
	[1] = {
		{ Name="武器", Icon=132355, Role="DAMAGER" },
		{ Name="狂怒", Icon=132347, Role="DAMAGER" },
		{ Name="防護", Icon=132341, Role="TANK" },
	},
	[2] = {
		{ Name="神聖", Icon=135920, Role="HEALER" },
		{ Name="防護", Icon=236264, Role="TANK" },
		{ Name="懲戒", Icon=135873, Role="DAMAGER" },
	},
	[3] = {
		{ Name="野獸控制", Icon=461112, Role="DAMAGER" },
		{ Name="射擊", Icon=236179, Role="DAMAGER" },
		{ Name="生存", Icon=461113, Role="DAMAGER" },
	},
	[4] = {
		{ Name="刺殺", Icon=236270, Role="DAMAGER" },
		{ Name="暴徒", Icon=236286, Role="DAMAGER" },
		{ Name="敏銳", Icon=132320, Role="DAMAGER" },
	},
	[5] = {
		{ Name="戒律", Icon=135940, Role="HEALER" },
		{ Name="神聖", Icon=237542, Role="HEALER" },
		{ Name="暗影", Icon=136207, Role="DAMAGER" },
	},
	[6] = {
		{ Name="血魄", Icon=135770, Role="TANK" },
		{ Name="冰霜", Icon=135773, Role="DAMAGER" },
		{ Name="穢邪", Icon=135775, Role="DAMAGER" },
	},
	[7] = {
		{ Name="元素", Icon=136048, Role="DAMAGER" },
		{ Name="增強", Icon=237581, Role="DAMAGER" },
		{ Name="恢復", Icon=136052, Role="HEALER" },
	},
	[8] = {
		{ Name="秘法", Icon=135932, Role="DAMAGER" },
		{ Name="火焰", Icon=135810, Role="DAMAGER" },
		{ Name="冰霜", Icon=135846, Role="DAMAGER" },
	},
	[9] = {
		{ Name="痛苦", Icon=136145, Role="DAMAGER" },
		{ Name="惡魔學識", Icon=136172, Role="DAMAGER" },
		{ Name="毀滅", Icon=136186, Role="DAMAGER" },
	},
	[10] = {
		{ Name="釀酒", Icon=608951, Role="TANK" },
		{ Name="織霧", Icon=608952, Role="HEALER" },
		{ Name="御風", Icon=608953, Role="DAMAGER" },
	},
	[11] = {
		{ Name="平衡", Icon=136096, Role="DAMAGER" },
		{ Name="野性戰鬥", Icon=132115, Role="DAMAGER" },
		{ Name="守護者", Icon=132276, Role="TANK" },
		{ Name="恢復", Icon=136041, Role="HEALER" },
	},
	[12] = {
		{ Name="災虐", Icon=1247264, Role="DAMAGER" },
		{ Name="復仇", Icon=1247265, Role="TANK" },
	},
}

end

if GetLocale() == "zhTW" then
	PawnUseThisLocalization()
end

-- After using this localization or deciding that we don't need it, remove it from memory.
PawnUseThisLocalization = nil
