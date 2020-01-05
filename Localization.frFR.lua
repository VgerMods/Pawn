-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2020 Green Eclipse.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

-- 
-- French resources
------------------------------------------------------------

local function PawnUseThisLocalization()
PawnLocal =
{
	["AverageItemLevelIgnoringRarityTooltipLine"] = "Niveau moyen de l'item",
	["BackupCommand"] = "Sauvegarde",
	["BaseValueWord"] = "base",
	["CopyScaleEnterName"] = "Entrez un nom pour votre nouvelle echelle, une copie de %s:",
	["DebugOffCommand"] = "debug off",
	["DebugOnCommand"] = "debug on",
	["DecimalSeparator"] = ",",
	["DeleteScaleConfirmation"] = "Etes vous sure que vous voulez éffacer %s? Vous ne pourrez pas revenir en arriere. tapez \"%s\" pour confirmer:",
	["DidntUnderstandMessage"] = "   (?) ne comprend pas \"%s\".",
	["EnchantedStatsHeader"] = "(valeur courante)",
	["EngineeringName"] = "Ingénierie",
	["ExportAllScalesMessage"] = "appuyez sur Ctrl+C pour copier vos Étiquettes d'échelle, créez un fichier sur votre ordianteur pour en faire une sauvegarde, puis appuyez sur Ctrl+V pour les coller",
	["ExportScaleMessage"] = "appuyez sur Ctrl+C pour copier vos Étiquettes d'échelle suivant pour |cffffffff%s|r, puis appuyez sur Ctrl+V pour les coller plus tard.",
	["FailedToGetItemLinkMessage"] = "   Echec à la reception du lien de l'item de la part de l'infobulle. Ceci peut etre du a un conflit de mod.",
	["FailedToGetUnenchantedItemMessage"] = "   Echec à la reception des valeurs de base de l'item. Ceci peut etre du a un conflit de mod.",
	["FoundStatMessage"] = "   %d %s",
	["GemList2"] = "%s ou %s",
	["GemListMany"] = "%d possibilités (clic le bouton Pawn pour avoir des détails)",
	["GenericGemLink"] = "|Hitem:%d|h[Gemme %d]|h",
	["GenericGemName"] = "(Gemme %d)",
	["HiddenScalesHeader"] = "Autre Echelles",
	["ImportScaleMessage"] = "appuyez sur Ctrl+V to pour coller une étiquette d'échelle que vous avez copié d une autre source ici:",
	["ImportScaleTagErrorMessage"] = "Pawn ne comprend pas cette étiquette d'échelle - formule. avez vous copié toute la formule ? essayez de la copier et de la coller encore une fois:",
	["ItemIDTooltipLine"] = "Item ID",
	["ItemLevelTooltipLine"] = "Niveau d'item",
	["LootUpgradeAdvisorHeader"] = "Clic pour comparer avec vos items.|n",
	["LootUpgradeAdvisorHeaderMany"] = "|TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t cet item est une amélioration de %d . clic pour comparer avec vos items",
	["MissocketWorthwhileMessage"] = "   -- Mais c'est mieux de seulement utiliser les gemmes %s :",
	["NeedNewerVgerCoreMessage"] = "Pawn a besoin d une version plus récente de VgerCore. utilisez s'il vous plaît la version de VgerCore inclue dans Pawn.",
	["NewScaleDuplicateName"] = "une formule avec ce nom existe déjà. Entrer un nom pour votre formule:",
	["NewScaleEnterName"] = "Entrer un nom pour votre formule:",
	["NewScaleNoQuotes"] = "une formule ne peut avoir \" dans son nom. Entrer un nom pour votre formule:",
	["NormalizationMessage"] = "   ---- mis aux normes en divisant par %g",
	["NoScale"] = "(aucun)",
	["NoScalesDescription"] = "Pour commencer, importez une formule ou commencez une nouvelle.",
	["NoStatDescription"] = "Choisissez une statistique à partir de la liste sur la gauche.",
	["Or"] = "ou",
	["RenameScaleEnterName"] = "Entrer un nouveau nom pour %s:",
	["SocketBonusValueCalculationMessage"] = "   -- Le bonus de sertissage vaudrait: %g",
	["StatNameText"] = "1 |cffffffff%s|r vaut:",
	["ThousandsSeparator"] = "NBSP",
	["TooltipBestAnnotation"] = "%s  |cff8ec3e6(meilleur)|r",
	["TooltipBestAnnotationSimple"] = "%s  votre meilleur",
	["TooltipBigUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00 upgrade%s|r",
	["TooltipDowngradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% amélioration%s|r",
	["TooltipRelicUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%d item levels%s|r",
	["TooltipSecondBestAnnotation"] = "%s  |cff8ec3e6(second meilleur)|r",
	["TooltipSecondBestAnnotationSimple"] = "%s  votre second meilleur",
	["TooltipUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% amélioration%s|r",
	["TooltipUpgradeFor1H"] = "pour ensemble 1 main",
	["TooltipUpgradeFor2H"] = "pour 2 mains",
	["TooltipUpgradeNeedsEnhancementsAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% amélioration%s|r",
	["TooltipVersusLine"] = "%s|n  vs. |c%s%s|r",
	["TotalValueMessage"] = "   ---- Total: %g",
	["UnenchantedStatsHeader"] = "(valeur de base)",
	["Unusable"] = "(inutilisable)",
	["UnusableStatMessage"] = "   -- %s est inutilisable, ainsi arrete.",
	["Usage"] = [=[
Pawn créer par Vger-Azjol-Nerub
www.vgermods.com
 
/pawn -- affiche ou cache UI Pawn
/pawn debug [ on | off ] -- affiche les messages de debug sur la console
/pawn backup -- sauvergarde toutes vos echelles dans vos formules
 
Pour plus d'information sur la Personnalisation de Pawn, regarder le fichier d'aide (Readme.htm) inclu dans le mod.]=],
	["ValueCalculationMessage"] = "   %g %s x %g chaque = %g",
	["VisibleScalesHeader"] = "%s d échelles",
	["Stats"] = {
		["AgilityInfo"] = "Agilité : Augmente le pouvoir de certaines compétences de classe.",
		--[[Translation missing --]]
		["ApInfo"] = "Attack Power.  Increases the damage of physical attacks.  Does not include attack power gained from strength and agility.",
		--[[Translation missing --]]
		["ArcaneResistInfo"] = "Arcane Resistance.  Reduces the damage taken from arcane-based attacks.",
		--[[Translation missing --]]
		["ArcaneSpellDamage"] = "Arcane Damage",
		--[[Translation missing --]]
		["ArcaneSpellDamageInfo"] = "Arcane damage.  Increases the damage dealt by your arcane spells.",
		["ArmorInfo"] = [=[Armure : réduit les dégâts physiques reçus.

Armure, quel que soit le type d'item. Pas de distinction entre l'armure de base et le bonus d'armure car les items avec bonus d'amure sont obsolètes.]=],
		["ArmorTypes"] = "Types d'armure",
		["AvoidanceInfo"] = "Évitement. Réduit les dégâts pris lors d'une attaque de zone.",
		--[[Translation missing --]]
		["BlockRatingInfo"] = "Block chance.  Increases the chances of a successful shield block.",
		--[[Translation missing --]]
		["BlockValueInfo"] = "Shield block value.  Increases the damage that a shield absorbs when it successfully blocks.",
		["Cloth"] = "Tissu",
		["ClothInfo"] = "Points a etre assigné si l'item est en tissu",
		["CorruptionInfo"] = "Corruption of N'Zoth.  A negative value for Corruption will remove points from an item's score based on the level of corruption.",
		["Crit"] = "Crit",
		["CritInfo"] = "Coup critique. affecte les attaques de mélée, les attaques a distance et les sorts",
		--[[Translation missing --]]
		["DefenseInfo"] = "Defense skill.  Decreases the chance that you'll be hit by boss attacks.",
		--[[Translation missing --]]
		["DodgeInfo"] = "Dodge.  Increases the chance that you'll dodge attacks entirely.",
		["DpsInfo"] = "dégat par secondes d'arme. (si vous voulez différentes estimation pour différents types d'arme, voir la section \"statistiques spéciale arme\".)",
		--[[Translation missing --]]
		["FeralApInfo"] = "Feral Attack Power.  Increases the damage of druid attacks when in feral forms.  Does not include attack power gained from strength and agility.",
		--[[Translation missing --]]
		["FireResistInfo"] = "Fire Resistance.  Reduces the damage taken from fire-based attacks.",
		--[[Translation missing --]]
		["FireSpellDamage"] = "Fire Damage",
		--[[Translation missing --]]
		["FireSpellDamageInfo"] = "Fire damage.  Increases the damage dealt by your fire spells.",
		--[[Translation missing --]]
		["FrostResistInfo"] = "Frost Resistance.  Reduces the damage taken from frost-based attacks.",
		--[[Translation missing --]]
		["FrostSpellDamage"] = "Frost Damage",
		--[[Translation missing --]]
		["FrostSpellDamageInfo"] = "Frost damage.  Increases the damage dealt by your frost spells.",
		["HasteInfo"] = "Hâte. affecte les attaques de mélée, les attaques a distance et les sorts",
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
		["IndestructibleInfo"] = "Indestructible. évite que votre équipement prenne des dégâts.",
		["IndestructibleIs"] = "Etre |cffffffffindestructible|r vaut mieux:",
		["IntellectInfo"] = "La statistique principale, Intelligence",
		["Leather"] = "Cuir",
		["LeatherInfo"] = "points à etre assignés si l item est en cuir",
		["LeechInfo"] = "Sangsue. Fait que vos attaques et soins restaurent votre vie",
		["Mail"] = "maille",
		["MailInfo"] = "points à etre assigné si l item est en maille",
		["MasteryInfo"] = "Maîtrise. améliore le bonus unique de la spécialistation de votre classe",
		["MinorStats"] = "Stats mineur",
		["MovementSpeedInfo"] = "Vitesse de déplacement. Fait que le personnage court plus vite",
		--[[Translation missing --]]
		["Mp5"] = "Mana per 5",
		--[[Translation missing --]]
		["Mp5Info"] = "Mana regeneration per 5 seconds.  Affects your mana regeneration even when in combat.",
		--[[Translation missing --]]
		["NatureResistInfo"] = "Nature Resistance.  Reduces the damage taken from nature-based attacks.",
		--[[Translation missing --]]
		["NatureSpellDamage"] = "Nature Damage",
		--[[Translation missing --]]
		["NatureSpellDamageInfo"] = "Nature damage.  Increases the damage dealt by your nature spells.",
		--[[Translation missing --]]
		["ParryInfo"] = "Parry.  Increases the chance that you'll parry enemy attacks.",
		["Plate"] = "plaque",
		["PlateInfo"] = "points a etre ajouté si l'item est en plaque",
		--[[Translation missing --]]
		["RapInfo"] = "Ranged Attack Power.  Increases the damage of ranged physical attacks.  Does not include attack power gained from agility.",
		--[[Translation missing --]]
		["ShadowResistInfo"] = "Shadow Resistance.  Reduces the damage taken from shadow-based attacks.",
		--[[Translation missing --]]
		["ShadowSpellDamage"] = "Shadow Damage",
		--[[Translation missing --]]
		["ShadowSpellDamageInfo"] = "Shadow damage.  Increases the damage dealt by your shadow spells.",
		["Shield"] = "Bouclier",
		["ShieldInfo"] = "points a ajouter si l item est un bouclier",
		["Sockets"] = "châsse",
		["SpecialWeaponStats"] = "stats spécifique aux armes",
		["SpeedBaseline"] = "vitesse de référence",
		["SpeedBaselineInfo"] = "N est pas une statisque actuelle. Ce nombre est déduit de la statistique de vitesse avant d'etre multiplié par votre valeur d'echelle",
		["SpeedBaselineIs"] = "|cffffffffVitesse de référence|r est:",
		["SpeedInfo"] = "Vitesse d'arme, en secondes par mouvement. (si vous préférez des armes rapide, ce nombre devrait etre negatif. Voir aussi: \"vitesse de référence\" dans la section \"stats spécifiques aux armes\"",
		["SpeedIs"] = "1 seconde |cffffffffde vitesse de mouvement|r vaut:",
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
		["StaminaInfo"] = "La statistique principale, Endurance",
		["StrengthInfo"] = "La statistique principale, Force",
		["VersatilityInfo"] = "Polyvalence. Augmente les dégâts occasionnés pour les personnages dégâts, augmente les soins pour les personnages soigneur, et réduit les dégâts subis pour les personnages tank.",
		["WeaponMainHandDps"] = "MH: DPS",
		["WeaponMainHandDpsInfo"] = "dégâts d'arme par seconde, seulement pour les armes en main droite",
		["WeaponMainHandMaxDamage"] = "MH: dégâts max",
		["WeaponMainHandMaxDamageInfo"] = "dégâts d'arme maximal, seulement pour les armes en main droite",
		["WeaponMainHandMinDamage"] = "MH: dégâts min",
		["WeaponMainHandMinDamageInfo"] = "dégâts d'arme minimum, seulement pour les armes en main droite",
		["WeaponMainHandSpeed"] = "MH: vitesse",
		["WeaponMainHandSpeedInfo"] = "Vitesse d'arme, seulement pour les armes en main droite",
		["WeaponMaxDamage"] = "Dégâts maximum",
		["WeaponMaxDamageInfo"] = "Dégâts maximum de l arme",
		["WeaponMeleeDps"] = "Melee: DPS",
		["WeaponMeleeDpsInfo"] = "Dégâts d'arme par seconde, seulement pour les armes de mélée.",
		["WeaponMeleeMaxDamage"] = "Mélée: dégâts maximum",
		["WeaponMeleeMaxDamageInfo"] = "Dégâts maximum d'arme, seulement pour les armes de mélée.",
		["WeaponMeleeMinDamage"] = "Mélée: dégâts minimum",
		["WeaponMeleeMinDamageInfo"] = "Dégâts minimum d'arme, seulement pour les armes de mélée.",
		["WeaponMeleeSpeed"] = "Mélée: vitesse",
		["WeaponMeleeSpeedInfo"] = "Vitesse d'arme, seulement pour les armes de mélée.",
		["WeaponMinDamage"] = "Dégâts minimum",
		["WeaponMinDamageInfo"] = "Dégâts minimum d'arme",
		["WeaponOffHandDps"] = "OH: DPS",
		["WeaponOffHandDpsInfo"] = "Dégâts d'arme par seconde, seulement pour une arme en main gauche",
		["WeaponOffHandMaxDamage"] = "OH: dégâts max",
		["WeaponOffHandMaxDamageInfo"] = "Dégâts d'arme maximum, seulement pour une arme en main gauche",
		["WeaponOffHandMinDamage"] = "OH: dégâts min",
		["WeaponOffHandMinDamageInfo"] = "Dégâts d'arme minimum, seulement pour une arme en main gauche",
		["WeaponOffHandSpeed"] = "OH: vitesse",
		["WeaponOffHandSpeedInfo"] = "Vitesse d'arme, seulement pour une arme en main gauche",
		["WeaponOneHandDps"] = "1H: DPS",
		["WeaponOneHandDpsInfo"] = "Dégâts d'arme par seconde, seulement pour arme marquées une main, n'incluant pas les armes de main droite ou gauche",
		["WeaponOneHandMaxDamage"] = "1H: dégâts max",
		["WeaponOneHandMaxDamageInfo"] = "Dégâts d'arme maximum, seulement pour les armes marquées une main, n'incluant pas les armes de main droite ou gauche.",
		["WeaponOneHandMinDamage"] = "1H: dégâts min",
		["WeaponOneHandMinDamageInfo"] = "Dégâts d'arme minimum, seulement pour les armes marquées une main, n'incluant pas les armes de main droite ou gauche.",
		["WeaponOneHandSpeed"] = "1H: vitesse",
		["WeaponOneHandSpeedInfo"] = "Vitesse d'arme, seulement pour les armes marquées une main, n'incluant pas les armes de main droite ou gauche.",
		["WeaponRangedDps"] = "Distant: DPS",
		["WeaponRangedDpsInfo"] = "Dégâts d'arme par seconde, seulement pour les armes à distance",
		["WeaponRangedMaxDamage"] = "Distant: dégâts max",
		["WeaponRangedMaxDamageInfo"] = "Dégâts d'arme maximum, seulement pour les armes à distance",
		["WeaponRangedMinDamage"] = "Distant: dégâts min",
		["WeaponRangedMinDamageInfo"] = "Dégâts d'arme minimum, seulement pour les armes à distance",
		["WeaponRangedSpeed"] = "Distant: vitesse",
		["WeaponRangedSpeedInfo"] = "Vitesse d'arme, seulement pour les armes à distance",
		["WeaponStats"] = "Stats d'arme",
		["WeaponTwoHandDps"] = "2H: DPS",
		["WeaponTwoHandDpsInfo"] = "Dégât d'arme par seconde, seulement pour les armes a deux mains",
		["WeaponTwoHandMaxDamage"] = "2H: dégât max",
		["WeaponTwoHandMaxDamageInfo"] = "Dégât d'arme maximum, seulement pour les armes a deux mains",
		["WeaponTwoHandMinDamage"] = "2H: dégât min",
		["WeaponTwoHandMinDamageInfo"] = "Dégât d'arme minimum, seulement pour les armes a deux mains",
		["WeaponTwoHandSpeed"] = "2H: vitesse",
		["WeaponTwoHandSpeedInfo"] = "Vitesse d'arme, seulement pour les armes a deux mains",
		["WeaponType1HAxe"] = "Hache: 1H",
		["WeaponType1HAxeInfo"] = "Points à etre assigné si l'item est une hache à une main",
		["WeaponType1HMace"] = "masse: 1H",
		["WeaponType1HMaceInfo"] = "Points à etre assigné si l'item est une masse à une main",
		["WeaponType1HSword"] = "Epée: 1H",
		["WeaponType1HSwordInfo"] = "Points à etre assigné si l'item est une épée à une main",
		["WeaponType2HAxe"] = "Hache: 2H",
		["WeaponType2HAxeInfo"] = "Points à etre assigné si l'item est une hache à deux mains",
		["WeaponType2HMace"] = "masse: 2H",
		["WeaponType2HMaceInfo"] = "Points à etre assigné si l'item est une masse à deux mains",
		["WeaponType2HSword"] = "Epée: 2H",
		["WeaponType2HSwordInfo"] = "Points à etre assigné si l'item est une épée à deux mains",
		["WeaponTypeBow"] = "Arc",
		["WeaponTypeBowInfo"] = "Points à etre assigné si l'item est un arc",
		["WeaponTypeCrossbow"] = "Arbalète",
		["WeaponTypeCrossbowInfo"] = "Points à etre assigné si l'item est une Arbalète",
		["WeaponTypeDagger"] = "Dague",
		["WeaponTypeDaggerInfo"] = "Points à etre assigné si l'item est une dague",
		["WeaponTypeFistWeapon"] = "Arme de pugilat",
		["WeaponTypeFistWeaponInfo"] = "Points à etre assigné si l'item est une arme de pugilat",
		["WeaponTypeFrill"] = "Tenu(e) en main gauche",
		["WeaponTypeFrillInfo"] = "Points à etre assigné si l'item est un \"Tenu(e) en main gauche\"  seconde main pour jeteur de sort. Ne s'applique pas aux boucliers ou aux armes",
		["WeaponTypeGun"] = "Fusil",
		["WeaponTypeGunInfo"] = "Points à etre assigné si l'item est un fusil",
		["WeaponTypeOffHand"] = "Arme main gauche",
		["WeaponTypeOffHandInfo"] = "Points à etre assigné si l'item est n'importe quelle arme qui peut seulement etre équipée en main gauche. Ne s'applique pas aux items 'Tenu(e) en main gauche\" des jeteurs de sort.",
		["WeaponTypePolearm"] = "Armes d'hast",
		["WeaponTypePolearmInfo"] = "Points à etre assigné si l'item est une arme d'hast",
		["WeaponTypes"] = "Types d arme",
		["WeaponTypeStaff"] = "Bâton",
		["WeaponTypeStaffInfo"] = "Points à etre assignés si l'item est un bâton",
		["WeaponTypeWand"] = "Baguette",
		["WeaponTypeWandInfo"] = "Points à etre assignés si l'item est une baguette",
		["WeaponTypeWarglaive"] = "Glaive de guerre",
		["WeaponTypeWarglaiveInfo"] = "points devant etre assigné si la pièce est un Glaive de guerre",
	},
	["TooltipParsing"] = {
		["Agility"] = "^%+?# Agilité$",
		["AllStats"] = "^%+?# à toutes les caractéristiques$",
		["Ap"] = "^%+?# à la puissance d'attaque$",
		["Ap2"] = "^Equipé : %+# à la puissance d'attaque%.$",
		["ArcaneResist"] = "^%+?# à la résistance Arcanes$",
		["ArcaneSpellDamage"] = "^%+# aux dégâts des sorts des Arcanes$",
		["ArcaneSpellDamage2"] = "^Equipé : Augmente les dégâts infligés par les sorts et effets des Arcanes de # au maximum%.$",
		["Armor"] = "^Armure..?: #$",
		["Armor2"] = "^UNUSED$",
		["Avoidance"] = "^%+# Évitement$",
		["Axe"] = "^Hache$",
		["BagSlots"] = "^Sac %d+ .+$",
		["Block"] = "^Bloquer : #$",
		["BlockPercent"] = "^Equipé : Augmente vos chances de bloquer les attaques avec un bouclier de #%%%.$",
		["BlockValue"] = "^Equipé : Augmente le score de blocage de votre bouclier de #%.$",
		["Bow"] = "^Arc$",
		["ChanceOnHit"] = "Chances de toucher :",
		["Charges"] = "^.+ Charges?$",
		["Cloth"] = "^Tissu$",
		["CooldownRemaining"] = "^Temps de recharge restant:",
		["Corruption"] = "^%+?# Corruption$",
		["Crit"] = "^%+?# Score de crit%.?$",
		["Crit2"] = "^%+?# au score de critique$",
		["CritPercent"] = "^Equipé : Augmente vos chances d'infliger un coup critique de #%%%.$",
		["Crossbow"] = "^Arbalète$",
		["Dagger"] = "^Dague$",
		["DefenseSkill"] = "^Equipé : Défense augmentée de #%.$",
		["DefenseSkillSimple"] = "^%+?# Défense$",
		["DisenchantingRequires"] = "^L'enchantement requiert",
		["Dodge"] = "^%+?#%%? Esquive$",
		["Dodge2"] = "^%+?# à l'esquive$",
		["DodgePercent"] = "^Equipé : Augmente vos chances d'esquiver une attaque de #%%%.$",
		["Dps"] = "^%(# dégâts par seconde%)$",
		["DpsAdd"] = "^Ajoute # dégâts par seconde$",
		["Duration"] = "^Durée :",
		["Elite"] = "^Elite$",
		["EnchantmentArmorKit"] = "^Renforcé %(%+(%d+) Armure%)$",
		["EnchantmentCounterweight"] = "^Contrepoids %(%+# à la hâte%)",
		["EnchantmentFieryWeapon"] = "^Arme flamboyante$",
		["EnchantmentHealth"] = "^%+# aux points de vie$",
		["EnchantmentHealth2"] = "^UNUSED$",
		["EnchantmentLivingSteelWeaponChain"] = "^Dragonne en acier vivant$",
		["EnchantmentPyriumWeaponChain"] = "^Dragonne en pyrium$",
		["EnchantmentTitaniumWeaponChain"] = "^Dragonne en titane$",
		["Equip"] = "Équipé :",
		["FeralAp"] = "^Equipé : %+# à la puissance d'attaque pour les formes de félin, d'ours et d'ours redoutable uniquement%.$",
		["FireResist"] = "^%+?# à la résistance Feu$",
		["FireSpellDamage"] = "^%+# aux dégâts des sorts de Feu$",
		["FireSpellDamage2"] = "^Equipé : Augmente les dégâts infligés par les sorts et effets de Feu de # au maximum%.$",
		["FistWeapon"] = "^Arme de pugilat$",
		["Flexible"] = "^Flexible$",
		["FrostResist"] = "^%+?# à la résistance Givre$",
		["FrostSpellDamage"] = "^%+# aux dégâts des sorts de Givre$",
		["FrostSpellDamage2"] = "^Equipé : Augmente les dégâts infligés par les sorts et effets de Givre de # au maximum%.$",
		["Gun"] = "^Arme à feu$",
		["Haste"] = "^%+?# Hâte$",
		["Haste2"] = "^%+?# à la Hâte",
		["HaventCollectedAppearance"] = "^Vous n'avez pas récupéré cette apparence$",
		["Healing"] = "^%+# aux sorts de soins$",
		["Healing2"] = "^Equipé : Augmente les soins prodigués par les sorts et effets de # au maximum%.$",
		["HeirloomLevelRange"] = "^Requier un niveau de %d+ à (%d+)",
		["HeirloomXpBoost"] = "^Equipé : L?'?[Ee]xpérience gagnée",
		["HeirloomXpBoost2"] = "^UNUSED$",
		["Heroic"] = "^Héroïque$",
		["HeroicElite"] = "^Héroïque élite$",
		["HeroicThunderforged"] = "^Foudroyant héroïque$",
		["HeroicWarforged"] = "^De guerre héroïque$",
		["Hit"] = "^Equipé : Augmente vos chances de toucher de #%%%.$",
		["Hit2"] = "^UNUSED$",
		["HolySpellDamage"] = "^%+# aux dégâts des sorts du Sacré$",
		["HolySpellDamage2"] = "^Equipé : Augmente les dégâts infligés par les sorts et effets du Sacré de # au maximum%.$",
		["Hp5"] = " ^%+?# Points de [vV]ie [tT]outes les 5 [sS]%.?$",
		["Hp52"] = "^Equipé : Reconstitue# de vie par 5 sec%.$",
		["Hp53"] = " ^%+?# Points de [vV]ie [tT]outes les 5 [sS]%.?$",
		["Hp54"] = " ^%+?# [vV]ie [pP]ar 5 [sS]ec%.?$",
		["Intellect"] = "^%+?# Intelligence$",
		["Leather"] = "^Cuir$",
		["Leech"] = "^%+# Ponction$",
		["Mace"] = "^Masse$",
		["Mail"] = "^Mailles$",
		["Mastery"] = "^%+?# Maîtrise$",
		["Mastery2"] = "^%+?# à la maîtrise$",
		["MetaGemRequirements"] = "|cff%x%x%x%x%x%xNécessite",
		["MovementSpeed"] = "^%+# Vitesse$",
		["Mp5"] = "^Equipé : Rend # points de mana toutes les 5 secondes%.$",
		["Mp52"] = "^%+?# points de mana toutes les 5 sec%.$",
		["MultiStatHeading"] = "^Stats Multiple$",
		["MultiStatSeparator1"] = "et",
		["Multistrike"] = "^%+# Frappe multiple$",
		["NatureResist"] = "^%+?# à la résistance Nature$",
		["NatureSpellDamage"] = "^%+# aux dégâts des sorts de Nature$",
		["NatureSpellDamage2"] = "^Equipé : Augmente les dégâts infligés par les sorts et effets de Nature de # au maximum%.$",
		["NormalizationEnchant"] = "^Enchanté : (.*)$",
		["Parry"] = "^%+?# Parade$",
		["Parry2"] = "^%+?# à la parade$",
		["Plate"] = "^Plaques$",
		["Polearm"] = "^Arme d'hast$",
		["PvPPower"] = "^%+?# [Pp]uissance %(JcJ%)$",
		["RaidFinder"] = "^Outil Raids$",
		["Rap"] = "^Equipé : %+# à la puissance des attaques à distance%.$",
		["Requires2"] = "^Niveau [%d%.,]+ requis$",
		["Resilience"] = "^%+?# Résilience %(JcJ%)$",
		["Resilience2"] = "^%+?# à la résilience %(JcJ%)$",
		["Scope"] = "^Lunette %(%+# points de dégâts%)$",
		["ScopeCrit"] = "^Lunette %(%+# au score de critique%)$",
		["ScopeRangedCrit"] = "^%+?# au score de critique à distance$",
		["ShadowResist"] = "^%+?# à la résistance Ombre$",
		["ShadowSpellDamage"] = "^%+# aux dégâts des sorts d'Ombre$",
		["ShadowSpellDamage2"] = "^Equipé : Augmente les dégâts infligés par les sorts et effets d'Ombre de # au maximum%.$",
		["Shield"] = "^Bouclier$",
		["SocketBonusPrefix"] = "Bonus de sertissage :",
		["Speed"] = "^Vitesse #$",
		["Speed2"] = "^UNUSED$",
		["SpellCrit"] = "^Equipé : Augmente vos chances d'infliger un coup critique avec vos sorts de #%%%.$",
		["SpellDamage"] = "^%+# aux dégâts des sorts$",
		["SpellDamage2"] = "^Equipé : Augmente les dégâts et les soins produits par les sorts et effets magiques de # au maximum%.$",
		["SpellHit"] = "^Equipé : Augmente vos chances de toucher avec des sorts de #%%%.$",
		["SpellPower"] = "^%+?# Puissance des sorts$",
		["Spirit"] = "^%+?# Esprit$",
		["Staff"] = "^Bâton$",
		["Stamina"] = "^%+?# Endurance$",
		["Strength"] = "^%+?# Force$",
		["Sword"] = "^Epée$",
		["TemporaryBuffMinutes"] = "^.+%(%d+ min%)$",
		["TemporaryBuffSeconds"] = "^.+%(%d+ sec%)$",
		["Thrown"] = "^Thrown$",
		["Thunderforged"] = "^Foudroyant$",
		["Timeless"] = "^du Temps figé$",
		["Titanforged"] = "^forgées par les titans$",
		["UpgradeLevel"] = "^Niveau d’amélioration :",
		["Use"] = "Utiliser :",
		["Versatility"] = "^%+# Polyvalence$",
		["Wand"] = "^Baguette$",
		["Warforged"] = "^De guerre$",
		["Warglaives"] = "^Glaives de guerre$",
		["WeaponDamage"] = "^Dégâts.?.?: # %- #$",
		["WeaponDamageArcane"] = "^%+?# %- # points de dégâts %(Arcanes%)$",
		["WeaponDamageArcaneExact"] = "^%+?# points de dégâts %(Arcanes%)$",
		["WeaponDamageEnchantment"] = "^%+?# aux dégâts de l'arme$",
		["WeaponDamageEquip"] = "^Equipé : %+?# aux dégâts de l'arme%.$",
		["WeaponDamageExact"] = "^# Dégâts$",
		["WeaponDamageFire"] = "^%+?# %- # points de dégâts %(Feu%)$",
		["WeaponDamageFireExact"] = "^%+?# points de dégâts %(Feu%)$",
		["WeaponDamageFrost"] = "^%+?# %- # points de dégâts %(Givre%)$",
		["WeaponDamageFrostExact"] = "^%+?# points de dégâts %(Givre%)$",
		["WeaponDamageHoly"] = "^%+?# %- # points de dégâts %(Sacré%)$",
		["WeaponDamageHolyExact"] = "^%+?# points de dégâts %(Sacré%)$",
		["WeaponDamageNature"] = "^%+?# %- # points de dégâts %(Nature%)$",
		["WeaponDamageNatureExact"] = "^%+?# points de dégâts %(Nature%)$",
		["WeaponDamageShadow"] = "^%+?# %- # points de dégâts %(Ombre%)$",
		["WeaponDamageShadowExact"] = "^%+?# points de dégâts %(Ombre%)$",
	},
	["UI"] = {
		["AboutHeader"] = "À propos de Pawn",
		["AboutMrRobot"] = "Les valeurs des stats par défaut sont généreusement fournies par Mr. Robot. Elles sont un excellent point de départ pour des personnages avec des talents et traits d'artéfact de base et pour des combats normaux. Si vous voulez des stats plus précises et personnalisées, vous pouvez utiliser le simulateur d'Ask Mr. Robot sur le site : askmrrobot.com .",
		["AboutReadme"] = "Nouveau avec pawn ? Regardez la section Débuter (getting started) pour une introduction basique",
		["AboutTab"] = "À propos de",
		["AboutTranslation"] = "Version francaise par Othor-eitrigg et Vernel-Garona",
		["AboutVersion"] = "Version %s",
		["AboutWebsite"] = "Pour d'autres mods par Vger, visitez vgermods.com.",
		--[[Translation missing --]]
		["AskMrRobotProvider"] = "Ask Mr. Robot scales",
		["CompareClearItems"] = "Effacer",
		["CompareClearItemsTooltip"] = "Retirer la comparaison des deux items",
		["CompareColoredSockets"] = "Châsse colorée",
		["CompareEquipped"] = "Equipé",
		["CompareGemTotalValue"] = "Valeur de la gemme",
		["CompareHeader"] = "Compare les items en utilisant %s",
		["CompareOtherHeader"] = "Autre",
		["CompareSlotEmpty"] = "(pas d'item)",
		["CompareSocketBonus"] = "Bonus de sertissage",
		["CompareSocketsHeader"] = "Châsse",
		["CompareSpecialEffects"] = "Effets spéciaux",
		["CompareSwap"] = "‹ Interverti ›",
		["CompareSwapTooltip"] = "Interverti l'item de gauche avec celui de droite",
		["CompareTab"] = "Comparer",
		["CompareVersus"] = "—contre.—",
		["CompareWelcomeRight"] = [=[puis glissez un item dans cette boite.

vous pouvez le comparer par rapport a vos items existant en utilsant l'icone du coin en bas à gauche.]=],
		["CompareYourBest"] = "votre meilleur",
		["GemsColorHeader"] = "gemme %s",
		["GemsHeader"] = "gemme pour %s",
		["GemsNoneFound"] = "aucune gemme adéquate n'a été trouvée",
		["GemsQualityLevel"] = "Niveau de qualité de la gemme",
		["GemsQualityLevelTooltip"] = [=[Le niveau d'items pour lequel suggerer des gemmes.

Par exemple, si "463", alors Pawn affichera des gemmes appropriées pour l'utilisation dans un item de niveau 463: butin de donjon héroique de Mists of Pandaria.]=],
		["GemsShowBest"] = "Affiche la meilleur gemme disponible",
		["GemsShowBestTooltip"] = "Affiche la meilleur gemme absolue pour l'echelle utilisée en ce moment. Certaines de ces gemmes seront trop puissantes pour être inseré dans des chasses d'items trop vieux et de moins bonnes qualité.",
		["GemsShowForItemLevel"] = "Affiche la gemme recommandée pour un niveau:",
		["GemsShowForItemLevelTooltip"] = "Affiche les gemmes que Pawn recommande pour l'echelle (formule) actuellement sélectionnée et d'un item d'un niveau spécifique.",
		["GemsTab"] = "Gemmes",
		["GemsWelcome"] = "Sélectionnez une échelle (formule) sur la gauche pour voir les gemmes que Pawn recommande",
		["HelpHeader"] = "Bienvenu sur Pawn!",
		["HelpTab"] = "Debuter",
		["HelpText"] = [=[Pawn calcul les scores de vos items basé sur ces statistiques. Il utilise ces scores pour déterminer quels sont les meilleurs items, et pour identifier les items qui amélioreraient vos tenues.


Chaque item recevra un score pour chaque "Échelle" active sur votre personnage. une échelle liste les statistiques important pour vous, et combien de points chaque statistique rapporte. Vous avez généralement une échelle pour chacune des spécialisations ou roles de vos classes. ces scores sont normalement cachés, mais vous pouvez voir comment le score d'un item a été calculé sur l'onglet de Comparaison.

 • vous pouvez activer ou arreter une échelle en faisant un Shift-Clic sur la liste dans l'onglet échelle


Pawn vient avec les échelles de Wowhead pour chaque classe et spé. vous pouvez aussi créer la votre en assignant des valeurs de point à chaque stat, importer des échelles (formules) d'internet ou d'outils de simulation, ou en partager en guilde.


|cff8ec3e6Essayez ces fonctionnalités une fois que vous aurez appris les bases :|r
 • comparez les stats de deux items en utilisant l'onglet de comparaison de Pawn
 • Clic-droit sur un item lié dans une fenetre pour voir comment il se compare avec votre item actuel.
 • shift-Clic-droit un item avec emplacement de gemme pour que pawn vous suggere une gemme
 • Faites une copie d'une de vos formules dans l'onglet d'echelle, et personnalisez les valeurs de stat dans l'onglet valeur.
 • Trouvez plus de formules pour votre classe sur internet
 • lisez le fichier readme pour en apprendre plus sur les fonctionnalités avancées de Pawn]=],
		["InterfaceOptionsBody"] = "Cliquez sur le bouton Pawn pour y aller. vous  pouvez aussi ouvrir Pawn à partir de votre page d'inventaire, ou en y associant une touche.",
		["InterfaceOptionsWelcome"] = "Les options de Pawn se trouve dans le Pawn UI (interface utilisateur)",
		["InventoryButtonTooltip"] = "Clic pour ouvrir Pawn",
		["InventoryButtonTotalsHeader"] = "Totaux de tous les équipements équipés:",
		["KeyBindingCompareItemLeft"] = "Compare item (gauche)",
		["KeyBindingCompareItemRight"] = "Compare item (droit)",
		["KeyBindingShowUI"] = "Afficher Pawn",
		["OptionsAdvisorHeader"] = "Options conseillées",
		["OptionsAlignRight"] = "Aligne les valeurs sur le bord droit du tooltips",
		["OptionsAlignRightTooltip"] = "Cette option permet d'aligner les valeurs de Pawn et vos informations d'information sur le bord droit du tooltips au lieu de la gauche",
		["OptionsBagUpgradeAdvisor"] = "Montrer les améliorations de sac conseillées.",
		["OptionsBagUpgradeAdvisorTooltip"] = [=[Activer cette option permet à Pawn d'utiliser les flêches d'améliorations dans les sacs.

Si elle est cochée, Pawn va chercher, dans vos sacs, les objets meilleurs que votre équipement actuel, en fonction de vos échelles actives et les montrer avec une flêche verte.

Si elle n'est pas cochée, WoW va marquer les objets ayant un plus haut niveau d'objet que ce que vous portez actuellement et Pawn n'interfèrera pas avec cette fonctionnalité intégrée.]=],
		["OptionsBlankLine"] = "Ajoute une ligne vide avant les valeurs",
		["OptionsBlankLineTooltip"] = "Cette option permet de séparer les informations de Pawn, en ajoutant une ligne vide",
		["OptionsButtonHidden"] = "Caché",
		["OptionsButtonHiddenTooltip"] = "Ne pas afficher le bouton Pawn sur le panneau d'information du personnage",
		["OptionsButtonPosition"] = "Affiche le bouton Pawn:",
		["OptionsButtonPositionLeft"] = "Sur la gauche",
		["OptionsButtonPositionLeftTooltip"] = "Affiche le bouton Pawn dans le coin en bas à gauche sur le panneau d'information du personnage",
		["OptionsButtonPositionRight"] = "Sur la droite",
		["OptionsButtonPositionRightTooltip"] = "Affiche le bouton Pawn dans le coin en bas à droite sur le panneau d'information du personnage",
		["OptionsColorBorder"] = "Colorie le bord de l'infobulle des améliorations",
		["OptionsColorBorderTooltip"] = "Cette option permet de changer la couleur du bord des tooltips des items qui sont amélioré en vert. Empêche cette option si ça interfère avec d'autres mods qui changent le bord des infobulle.",
		["OptionsCurrentValue"] = "Affiche les valeurs de référence et courantes",
		["OptionsCurrentValueTooltip"] = [=[Cette option permet d'afficher deux valeurs par items: la valeur courante, qui reflète l'état courant de l'item avec les gemmes actuelles, enchantement, et retouche que l'item a en ce moment, avec les châsse vides qui n'ajoutent aucuns bénéfices, en addition à la valeur de référence, que Pawn normalement affiche. La valeur courante sera affiché avant la valeur de référence. cette option n a aucun effet à moins que vous permettiez l'affichage des valeurs d'item dans le tooltip.

Vous devriez toujours utiliser la valeur de référence pour déterminer entre deux items de fin de jeu, mais la valeur courante peut être utile pour le leveling et sera plus facile pour décider s'il vaut mieux équiper immédiatement un nouvel item avant qu'il soit gémmé et enchanté.]=],
		["OptionsDebug"] = "Affiche les informations de debug",
		["OptionsDebugTooltip"] = [=[Si vous n êtes pas sur de la façon dont Pawn calcule les valeurs pour un item spécifique, cette option permet d'afficher toutes sortes de données 'utile' sur la console de discussion quand vous survolez un item. Ces informations incluent quelles stats Pawn pense que l item a, quelles parties de l item Pawn ne comprend pas, et comment il prend chacun en compte pour chacune de vos echelles (formules)

Cette option remplira rapidement votre canal de discussion, aussi vous voudrez l arrêter une fois l'investigation finie.

raccourcis:
/pawn debug on
/pawn debug off]=],
		["OptionsHeader"] = "Ajuste les options de Pawn",
		["OptionsIgnoreGemsWhileLevelingCheck"] = "Ignorer les chasses sur les éléments bas niveau",
		["OptionsIgnoreGemsWhileLevelingCheckTooltip"] = [=[Activez cette option pour que Pawn ignore les chasses sur les éléments bas niveau lors du calcul des valeurs de l'élément, étant donné que la plupart des gens ne vont pas à l'effort ou les frais d'emboîtement des articles tout en nivelant encore. Un élément de « bas niveau » est plus faible que ce qui peut être obtenu dans un donjon héroïque à la limite de niveau.

Si cochée, Pawn propose toujours les gemmes appropriées pour les éléments de bas niveau, mais elles seront ignorés dans les calculs et ils n'apparaisseront donc pas aussi souvent comme des mises à jour.

Si non coché, Pawn calculera les valeurs pour les éléments comme s'ils étaient gémmés de la manière qui maximise la valeur de l'élément, quel que soit le niveau.]=],
		["OptionsIgnoreItemUpgradesCheck"] = "ignore les améliorations de Vaillance et Torve",
		["OptionsIgnoreItemUpgradesCheckTooltip"] = [=[valide cette option pour que Pawn ignore le montant des améliorations de Vaillance et Torve quand il calcule les valeurs des pièces
si validé, Pawn traitera les pièces pouvant être amélioré tels qu'ils sont et ne considérera pas que vous pouvez utiliser des Fragments Apexis de Vaillance ou Torve afin d'améliorer la pièce au moment de déterminer si une pièce est meilleur que celle en votre possession.
si non-validé, Pawn traitera ces pièces en assumant que vous les améliorerez au maximum avec des Fragments Apexis de Vaillance ou Torve. Cela pourrait faire qu'un équipement Torve de niveau 650 apparaisse comme une amélioration significative par rapport à un niveau 670 de la Fonderie de Blackrock, comme la pièce Torve pourrait être amélioré au niveau 705 grave aux Vaillances et Apexis
]=],
		["OptionsInventoryIcon"] = "Affiche une icône d'inventaire",
		["OptionsInventoryIconTooltip"] = "Cette option permet d'afficher l'icône d'inventaire à coté de la fenêtre de lien de l item",
		["OptionsItemIDs"] = "Affiche les ID des items",
		["OptionsItemIDsTooltip"] = [=[Cette option permet d'afficher l'id de l'item ainsi que les ids de tous les enchantements et gemmes.

Chaque item dans World of Warcraft a un numéro d'ID qui lui est associé. Cette information est généralement seulement utile aux auteurs de mods]=],
		["OptionsLootAdvisor"] = "Affiche les suggestions d'amélioration de butin",
		["OptionsLootAdvisorTooltip"] = "Quand un butin tombe en donjon et que c est une amélioration pour votre personnage, Pawn affichera une fenêtre attaché à la fenêtre de loot vous parlant de l'amélioration.",
		["OptionsOtherHeader"] = "Autres options",
		["OptionsQuestUpgradeAdvisor"] = "Affiche les suggestions de quête pouvant amélioré",
		["OptionsQuestUpgradeAdvisorTooltip"] = "Dans votre journal de quêtes et quand vous parlez à des NPCs, si un des choix de récompense de quêtes est une amélioration pour votre tenue actuelle, Pawn affichera en icône une flèche verte sur cet item. Si aucun des items n'est une amélioration, Pawn affichera une pile de monnaies sur l item qui vaut le plus quand vendu à un vendeur",
		["OptionsResetUpgrades"] = "Re-scan la tenue",
		["OptionsResetUpgradesTooltip"] = [=[Pawn oubliera ce qu il connait sur les meilleurs items que vous avez équipé et re-scannera votre tenue pour fournir des informations d amélioration plus à jour dans le futur.

Utilisez cette fonctionnalité si vous trouvez que Pawn effectue de mauvaises suggestions d amélioration comme résultat d items que vous avez vendu, detruit, ou que vous n utilisez plus. Ceci affecte tous vos personnages qui utilisent Pawn.]=],
		--[[Translation missing --]]
		["OptionsShowItemLevelUpgrades"] = "Show item level upgrades",
		--[[Translation missing --]]
		["OptionsShowItemLevelUpgradesTooltip"] = "Pawn will show you items that are of a higher item level than what you've previously equipped in that slot in addition to normal upgrades.",
		["OptionsShowRelicUpgrades"] = "Montrer les améliorations de reliques.",
		["OptionsShowRelicUpgradesTooltip"] = "Pawn vous montrera quand une relique peut augmenter le niveau d'objet d'une de vos armes. (Ca fonctionne différement des autres fonctions d'amélioration car c'est uniquement basé sur le niveau d'objet et pas sur des stats.)",
		["OptionsSocketingAdvisor"] = "Affiche les suggestions de châsses",
		["OptionsSocketingAdvisorTooltip"] = "Quand vous ajoutez des gemmes à un item, Pawn affichera les gemmes que vous pouvez ajouter à l'item qui maximiseront sa puissance. (Pour voir la liste complète des suggestions de gemmes de chaque couleur, voir l'onglet gemmes, ou vous pouvez aussi personnaliser la qualité des gemmes à utiliser.)",
		["OptionsTab"] = "Options",
		["OptionsTooltipHeader"] = "Options des tooltips",
		["OptionsTooltipSpecIcon"] = "Affiche l'icone des spec",
		["OptionsTooltipSpecIconTooltip"] = "Valide cette option pour afficher l'icone des specs à coté des noms d'échelle sur l'infobulle.",
		["OptionsTooltipUpgradesOnly"] = "Affiche seulement les améliorations",
		["OptionsTooltipUpgradesOnlyTooltip"] = [=[Ceci est l'option la plus simple. Affiche seulement le pourcentage d'amélioration pour les items qui sont une amélioration de votre tenue actuelle, et indique quels items sont les meilleurs items que vous possédez pour chaque échelle (formule). N'affiche rien pour les items plus faible.

|cff8ec3e6Fire:|r  |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% amélioration|r

...ou...

|cff8ec3e6Fire:  votre meilleur|r]=],
		["OptionsTooltipValuesAndUpgrades"] = "Affiche les valeurs d echelle et le % d'amélioration",
		["OptionsTooltipValuesAndUpgradesTooltip"] = [=[Affiche les valeurs de Pawn pour toutes vos echelles visibles sur tous les items, excepté ceux qui ont une valeur de zéro. De plus, indique quels items sont une amélioration de votre tenue actuelle.

|cff8ec3e6Frost:  123.4
Fire:  156.7 |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% amélioration|r]=],
		["OptionsTooltipValuesOnly"] = "Affiche seulement les valeurs d'echelles, pas les % d'amélioration",
		["OptionsTooltipValuesOnlyTooltip"] = [=[Affiche les valeurs de Pawn pour toutes les echelles visible de chaque items, excepté ceux qui ont une valeur de zéro. N'indique pas quels items sont une amélioration à votre tenue actuelle. Cette option reflète le fonctionnement par défaut de plus anciennes versions de Pawn.

|cff8ec3e6Frost:  123.4
Fire:  156.7|r]=],
		["OptionsUpgradeHeader"] = "affiche |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t améliorations dans infobulle:",
		--[[Translation missing --]]
		["OptionsUpgradeSettingsHeader"] = "Upgrade options",
		["OptionsUpgradesForBothWeaponTypes"] = "Affiche les améliorations pour 1H et 2H",
		["OptionsUpgradesForBothWeaponTypesTooltip"] = [=[Les suggesteurs d amélioration de Pawn devraient surveiller et afficher les améliorations pour les armes à deux mains et vos ambidextrie (ou pour jeteur de sorts, main droite et tenu(e) en main gauche), ensembles d armes séparément.

si validé, vous pourriez être en train d utiliser une arme à deux mains et voir clairement les armes les armes à une main inférieurs comme une amélioration si elles sont meilleur que le meilleur précédent (ou second meilleur) arme à une main que vous aviez, parce que Pawn surveille les améliorations séparément pour les ensembles à deux armes.

si non validé, équipé une arme à deux mains empechera Pawn d afficher vos améliorations pour les items tenu à une main et vice-versa.]=],
		["OptionsUpgradeTrackingHeader"] = "comparaison d'amélioration:",
		["OptionsUpgradeTrackingOff"] = "comparé à l'équipement équipé (recommandé)",
		["OptionsUpgradeTrackingOffTooltip"] = "Pawn vous affichera vos pièces qui sont des améliorations en comparaison des pièces actuellement équipés",
		["OptionsUpgradeTrackingOn"] = "Recherche pour chaque échelle (avancé)",
		["OptionsUpgradeTrackingOnTooltip"] = "(Pour les  utilisateurs avancé) Pawn essayera de recherché les meilleurs pièces dont vous etes équippé, independamment de chaque niveau que vous avez validé, et vous affichera les pièces qui vous sont des améliorations comparé à celle ci.",
		["OptionsWelcome"] = "Configurez Pawn de la façon vous aimez. Les changements prendront effets immédiatement.",
		["ScaleAutoOff"] = "Manuel",
		["ScaleAutoOff2"] = "me laisser gérer les niveaux",
		["ScaleAutoOffTooltip"] = "Pawn vous laissera choisir manuellement  quelle échelle utiliser pour ses calculs, vous permettant de valider plus d'une échelle à la fois, d'ajouter des échelles personnelles, et plus.",
		["ScaleAutoOn"] = "automatique",
		["ScaleAutoOn2"] = "affiche moi mes specs actuelles",
		["ScaleAutoOnTooltip"] = "Pawn vous affichera automatiquement votre spécialisation actuelle dans l'infobulle des pièces, et l'utilisera afin de faire des recommandation et suggestions d'améliorations.",
		["ScaleAutoWelcome"] = "Pawn affichera des suggestions pour votre spécialisation actuelle",
		["ScaleChangeColor"] = "Change la couleur",
		["ScaleChangeColorTooltip"] = "Change la couleur avec laquelle apparait le nom et la valeur dans le tooltip d'un item",
		["ScaleCopy"] = "Copier",
		["ScaleCopyTooltip"] = "Crée une nouvelle echelle en faisant une copie de celle ci.",
		["ScaleDefaults"] = "Défauts",
		["ScaleDefaultsTooltip"] = "Crée une nouvelle echelle en faisant une copie de celle par défaut",
		["ScaleDeleteTooltip"] = [=[Efface cette echelle (formule)

Cette commande ne peut etre défaite!]=],
		["ScaleEmpty"] = "Vide",
		["ScaleEmptyTooltip"] = "crée une nouvelle echelle à partir de rien.",
		["ScaleExport"] = "Exporter",
		["ScaleExportTooltip"] = "Partage vos formules avec d'autres sur internet",
		["ScaleHeader"] = "Gere vos echelles Pawn",
		["ScaleImport"] = "Importer",
		["ScaleImportTooltip"] = "Ajoute une nouvelle échelle (formule) en collant une Étiquette d'échelle depuis Internet",
		["ScaleNewHeader"] = "Créer une nouvelle échelle",
		["ScaleRename"] = "Renommer",
		["ScaleRenameTooltip"] = "Renomme cette échelle",
		["ScaleSelectorHeader"] = "Sélectionne une échelle:",
		["ScaleSelectorShowingSuggestionsFor"] = "affiche des sugestions pour",
		["ScaleSelectorShowScale"] = "Affiche l'echelle dans le tooltip",
		["ScaleSelectorShowScaleTooltip"] = "Quand cette option est validée, les valeurs pour cette échelle apparaitront dans le tooltip de ce personnage. Chaque échelles peut apparaitre sur votre personnage, plusieurs personnages, ou aucuns personnages.",
		["ScaleShareHeader"] = "Partager votre échelle (formule)",
		["ScaleTab"] = "Echelle",
		["ScaleTypeNormal"] = "Vous pouvez changer cette échelle dans l'onglet Valeur.",
		["ScaleTypeReadOnly"] = "Vous devez faire une copie de cette échelle (formule) si vous voulez la personnaliser.",
		["ScaleWelcome"] = "Les échelles sont des ensembles de stats et de valeurs qui sont utilisées pour assigner des valeurs en points aux items. Vous pouvez personnaliser la votre ou utiliser ceux qu'ont créer par d'autres personnes.",
		["SocketingAdvisorButtonTooltip"] = "Clic pour ouvrir l onglet Gemmes de Pawn, ou vous pouvez trouver plus d'informations sur les gemmes que Pawn recommande.",
		["SocketingAdvisorHeader"] = "Suggestions de Pawn pour les châsses:",
		["SocketingAdvisorIgnoreThisItem"] = "Ne vous embêtez pas a ajouter des gemmes sur cet objet de bas niveau. Mais si vous le faites, utilisez :",
		["StarterProvider"] = "Echelle de démarrage",
		["ValuesDoNotShowUpgradesFor1H"] = "Ne pas afficher d'amélioration pour les items a 1 main",
		["ValuesDoNotShowUpgradesFor2H"] = "Ne pas afficher d'amélioration pour les items a 2 mains",
		["ValuesDoNotShowUpgradesTooltip"] = "Cette option permet de cacher les améliorations pour ce type d'item. Par exemple, même si les tanks paladin peuvent utiliser des armes a deux mains, une arme à deux mains n'est jamais une \"amélioration\" pour un ensemble de paladin tank, aussi Pawn ne devrait pas afficher informations d amélioration pour eux. De même, les Paladin Vindicte peuvent utiliser des armes a une main, mais ce n'est jamais une amélioration.",
		["ValuesFollowSpecialization"] = "Affiche seulement les améliorations pour mon meilleur type d'armure après le niveau 50",
		["ValuesFollowSpecializationTooltip"] = "Cette option permet de cacher les améliorations d'armure dans laquelle votre classe n est pas spécialisé après le niveau 50. Par exemple, au niveau 50 les Paladin Sacré apprennent la spécialisation plaque, ce qui augmente leur intelligence de 5% quand ils portent seulement de la plaque. Quand cette option est choisie, Pawn ne tiendra jamais compte du tissu, cuir, ou maille comme des améliorations pour des paladins sacré au dessus du niveau 50",
		["ValuesHeader"] = "Valeur d'echelle pour %s",
		["ValuesIgnoreItemType"] = "Les items avec ceci sont inutilisables",
		["ValuesIgnoreStat"] = "Les items avec ceci sont inutilisables",
		["ValuesIgnoreStatTooltip"] = "Cette option fait que chaque items avec cette stat n'aura pas de valeurs pour cette échelle. Par exemple, les shamans ne peuvent pas porter de la plaque, donc une échelle (formule) conçue pour un shaman peut marquer la plaque comme inutilisable ainsi les armures de plaques ne recevront aucune valeur",
		["ValuesNormalize"] = "Normalise les valeurs (comme Wowhead)",
		["ValuesNormalizeTooltip"] = "Cette option permet de diviser la valeur finale calculée d'un item par la somme de tous les stats dans votre échelle, comme le font Wowhead et lootzor. Cela aide dans des situations ou des échelle (formule) ont des valeurs de stat autour de 1 et une autre autour de 5. Ca aide aussi a garder des petits nombres",
		["ValuesRemove"] = "Supprimer",
		["ValuesRemoveTooltip"] = "Supprime cette stat de l'echelle (formule)",
		["ValuesTab"] = "Valeur",
		["ValuesWelcome"] = "Vous pouvez personnaliser les valeurs qui sont assignés à chaque stats pour cette échelle. Pour gerer vos échelles et en ajouter de nouvelles, utilisez l'onglet Echelle",
		["ValuesWelcomeNoScales"] = "Vous n'avez sélectionné aucune échelle. Pour commencer, aller a l onglet Echelle et crees-en une nouvelle ou coller une depuis Internet",
		["ValuesWelcomeReadOnly"] = "L'echelle que vous avez sélectionné ne peut etre modifiée. Si vous voulez changer ces valeurs, allez dans l'onglet Echelle et faites une copie de cette échelle ou commencez une nouvelle.",
	}
}

-- Special case: wands actually use different text on live versus classic.
-- So, patch things up here.
if VgerCore.IsClassic then

	local TooltipParsing_Classic =
	{
		["WeaponDamageArcane"] = "^Dégâts %(Arcanes%) : # %- #$",
		["WeaponDamageArcaneExact"] = "^Dégâts %(Arcanes%) : #$",
		["WeaponDamageExact"] = "^Dégâts : #$",
		["WeaponDamageFire"] = "^Dégâts %(Feu%) : # %- #$",
		["WeaponDamageFireExact"] = "^Dégâts %(Feu%) : #$",
		["WeaponDamageFrost"] = "^Dégâts %(Givre%) : # %- #$",
		["WeaponDamageFrostExact"] = "^Dégâts %(Givre%) : #$",
		["WeaponDamageHoly"] = "^Dégâts %(Sacré%) : # %- #$",
		["WeaponDamageHolyExact"] = "^Dégâts %(Sacré%) : #$",
		["WeaponDamageNature"] = "^Dégâts %(Nature%) : # %- #$",
		["WeaponDamageNatureExact"] = "^Dégâts %(Nature%) : #$",
		["WeaponDamageShadow"] = "^Dégâts %(Ombre%) : # %- #$",
		["WeaponDamageShadowExact"] = "^Dégâts %(Ombre%) : #$",
	}

	local Key, NewString
	for Key, NewString in pairs(TooltipParsing_Classic) do
		PawnLocal.TooltipParsing[Key] = NewString
	end
end

-- *** In WoW 8.3, the thousands separator for French is changed AGAIN.
if select(4, GetBuildInfo()) >= 80300 then
	PawnLocal.ThousandsSeparator = ""
end

end

if GetLocale() == "frFR" then
	PawnUseThisLocalization()
end

-- After using this localization or deciding that we don't need it, remove it from memory.
PawnUseThisLocalization = nil
