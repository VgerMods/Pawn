-- Pawn by Vger-Azjol-Nerub
-- www.vgermods.com
-- © 2006-2022 Travis Spomer.  This mod is released under the Creative Commons Attribution-NonCommercial-NoDerivs 3.0 license.
-- See Readme.htm for more information.

--
-- Spanish (European and Latin American) resources
-- See special cases at the end of the file!
------------------------------------------------------------

local function PawnUseThisLocalization()
PawnLocal =
{
	["AverageItemLevelIgnoringRarityTooltipLine"] = "Nivel medio de objeto",
	["BaseValueWord"] = "base",
	["CopyScaleEnterName"] = "Introduce un nombre para tu nueva escala, una copia de %s:",
	["DecimalSeparator"] = ".",
	["DeleteScaleConfirmation"] = "¿Está seguro de que desea eliminar %s? Esta acción no se puede deshacer. Escriba \"%s\" para confirmar:",
	["DidntUnderstandMessage"] = "   (?) No entendo \"%s\".",
	["EnchantedStatsHeader"] = "(Valor actual)",
	["EngineeringName"] = "Ingeniería",
	["ExportAllScalesMessage"] = "Pulse Ctrl+C para copiar sus etiquetas de escala, cree un fichero en su ordenador donde guardarlas como copia de seguridad, y pulse Ctrl+V para pegarlas. ",
	["ExportScaleMessage"] = "Pulse Ctrl+C para copiar la siguiente etiqueta de escala para |cffffffff%s|r, y luego pulse Ctrl+V para pegarla.",
	["FailedToGetItemLinkMessage"] = "   No se ha podido obtener el enlace al objeto desde el tooltip. Esto puede ser debido a un conflicto entre accesorios.",
	["FailedToGetUnenchantedItemMessage"] = "   No se han podido obtener los valores base del objeto. Esto puede ser debido a un conflicto entre accesorios.",
	["FoundStatMessage"] = "   %d %s",
	["GemList2"] = "%s o %s",
	["GemListMany"] = "(haz click al boton Pawn para ver mas detalles)",
	["GenericGemLink"] = "|Hitem:%d|h[Gema %d]|h",
	["GenericGemName"] = "(Gema %d)",
	["HiddenScalesHeader"] = "Otras escalas",
	["ImportScaleMessage"] = "Pulsa Ctrl+V para pegar aquí una etiqueta de escala que ha copiado de otra fuente: ",
	["ImportScaleTagErrorMessage"] = "Pawn no entiende esa etiqueta de escala. ¿Ha copiado la etiqueta entera? Intente copiarla y pegarla de nuevo:",
	["ItemIDTooltipLine"] = "ID de objeto",
	["ItemLevelTooltipLine"] = "Nivel de objeto",
	["LootUpgradeAdvisorHeader"] = "Pulse para comparar con sus objetos.|n",
	["LootUpgradeAdvisorHeaderMany"] = "|TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t Este objeto es una mejora para %d escalas. Pulse para comparar con sus objetos.",
	["MissocketWorthwhileMessage"] = "   -- Pero es mejor usar sólo gemas %s:",
	["NeedNewerVgerCoreMessage"] = "Pawn necesita una versión más reciente de VgerCore. Por favor utilice la versión de VgerCore que vino con Pawn. ",
	["NewScaleDuplicateName"] = "Ya existe una escala con ese nombre. Introduzca un nombre para su escala: ",
	["NewScaleEnterName"] = "Introduzca un nombre para su escala: ",
	["NewScaleNoQuotes"] = "Una escala no puede tener \" en su nombre. Introduzca un nombre para su escala: ",
	["NormalizationMessage"] = "   ---- Normalizado dividiendo por %g",
	["NoScale"] = "(ninguna)",
	["NoScalesDescription"] = "Para empezar, importe una escala o comience una nueva. ",
	["NoStatDescription"] = "Elija un atributo de la lista de la izquierda. ",
	["Or"] = "o ",
	["RenameScaleEnterName"] = "Escribe un nuevo nombre para %s:",
	["SocketBonusValueCalculationMessage"] = "   -- La ranura extra valdrá: %g",
	["StatNameText"] = "1 de |cffffffff%s|r vale:",
	["ThousandsSeparator"] = "",
	["TooltipBestAnnotation"] = "%s  |cff8ec3e6(El mejor)|r",
	["TooltipBestAnnotationSimple"] = "%s  El mejor",
	["TooltipBigUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00 mejora%s|r",
	["TooltipDowngradeAnnotation"] = "degradar",
	--[[Translation missing --]]
	["TooltipRelicUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%d |4level:levels;%s|r",
	["TooltipSecondBestAnnotation"] = "%s  |cff8ec3e6(El segundo mejor)|r",
	["TooltipSecondBestAnnotationSimple"] = "%s  El segundo mejor",
	["TooltipUpgradeAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% mejora%s|r",
	["TooltipUpgradeFor1H"] = " para armas 1H",
	["TooltipUpgradeFor2H"] = " para armas 2H",
	["TooltipUpgradeNeedsEnhancementsAnnotation"] = "%s  |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t|cff00ff00+%.0f%% mejora potencial%s|r",
	["TooltipVersusLine"] = "%s|n  vs. |c%s%s|r",
	["TotalValueMessage"] = "   ---- Total: %g",
	["UnenchantedStatsHeader"] = "(Valor base)",
	["Unusable"] = "(No utilizable)",
	["UnusableStatMessage"] = "   -- %s no es utilizable, parando.",
	["Usage"] = [=[
Pawn by Vger-Azjol-Nerub
www.vgermods.com
 
/pawn -- Mostrar u ocultar la interfaz de Pawn
/pawn debug [ on | off ] -- Envía mensajes de depuracion a la consola
/pawn backup -- Crea un backup de tus escalas
 
Para más información sobre como personalizar Pawn, por favor lee el archivo (Readme.htm) que viene con el Addon.
]=],
	["ValueCalculationMessage"] = "   %g %s x %g = %g",
	["VisibleScalesHeader"] = "Escalas de %s",
	["Stats"] = {
		["AgilityInfo"] = "Agilidad.  Aumenta el poder de ataque en algunas clases.",
		--[[Translation missing --]]
		["ApInfo"] = "Attack Power.  Increases the damage of physical attacks.  Does not include attack power gained from strength and agility.",
		--[[Translation missing --]]
		["ArcaneResistInfo"] = "Arcane Resistance.  Reduces the damage taken from arcane-based attacks.",
		--[[Translation missing --]]
		["ArcaneSpellDamage"] = "Arcane Damage",
		--[[Translation missing --]]
		["ArcaneSpellDamageInfo"] = "Arcane damage.  Increases the damage dealt by your arcane spells.",
		["ArmorInfo"] = "Armadura base.  No incluye la armadura extra recibida de los objetos especificos de tanque.",
		["ArmorPenetrationInfo"] = "Penetración de armadura. Hace que parte de tu daño de ataque físico ignore la armadura.",
		["ArmorTypes"] = "Tipos de armadura",
		["AvoidanceInfo"] = "Eludir.  Reduce el daño que recibes de ataques de área de efecto.",
		--[[Translation missing --]]
		["BlockRatingInfo"] = "Block chance.  Increases the chances of a successful shield block.",
		--[[Translation missing --]]
		["BlockValueInfo"] = "Shield block value.  Increases the damage that a shield absorbs when it successfully blocks.",
		["Cloth"] = "Tela",
		["ClothInfo"] = "Puntos que asignar si el objeto es de Tela.",
		--[[Translation missing --]]
		["CorruptionInfo"] = "Corruption of N'Zoth.  A negative value for Corruption will remove points from an item's score based on the level of corruption.",
		["Crit"] = "Crit",
		["CritInfo"] = "Golpe crítico.  Aumenta la probabilidad de que tus ataques y hechizos de curación sean más efectivos.",
		--[[Translation missing --]]
		["DefenseInfo"] = "Defense skill.  Decreases the chance that you'll be hit by boss attacks.",
		--[[Translation missing --]]
		["DodgeInfo"] = "Dodge.  Increases the chance that you'll dodge attacks entirely.",
		["DominationSocketInfo"] = "El valor de un conector para un Fragmento de Dominación promedio.",
		["DpsInfo"] = "Daño por segundo del arma.  (Si quieres valorar el DPS de forma diferente para los distintos tipos de armas, mira la sección \"Atributos especiales de arma\".)",
		--[[Translation missing --]]
		["ExpertiseInfo"] = "Expertise. Negates your enemy's chances to dodge and parry.",
		--[[Translation missing --]]
		["FeralApInfo"] = "Feral Attack Power.  Increases the damage of druid attacks when in feral forms.  Does not include attack power gained from strength and agility.",
		--[[Translation missing --]]
		["FireResistInfo"] = "Fire Resistance.  Reduces the damage taken from fire-based attacks.",
		["FireSpellDamage"] = "Daño de Fuego",
		--[[Translation missing --]]
		["FireSpellDamageInfo"] = "Fire damage.  Increases the damage dealt by your fire spells.",
		--[[Translation missing --]]
		["FrostResistInfo"] = "Frost Resistance.  Reduces the damage taken from frost-based attacks.",
		["FrostSpellDamage"] = "Daño de Escarcha",
		--[[Translation missing --]]
		["FrostSpellDamageInfo"] = "Frost damage.  Increases the damage dealt by your frost spells.",
		["HasteInfo"] = "Celeridad.  Aumenta la velocidad de ataque y de lanzamiento de hechizos y la regeneracion de energía o enfoque.",
		["Healing"] = "Sanación",
		--[[Translation missing --]]
		["HealingInfo"] = "Spell healing.  Increases the power of your healing spells.",
		--[[Translation missing --]]
		["HitInfo"] = "Hit.  Increases the chance that your physical attacks hit the target, especially bosses.",
		["HolySpellDamage"] = "Daños de Sagrados",
		--[[Translation missing --]]
		["HolySpellDamageInfo"] = "Holy damage.  Increases the damage dealt by your holy spells.",
		--[[Translation missing --]]
		["Hp5Info"] = "Health regeneration per 5 seconds.  Increases the rate at which you regenerate health.",
		["IndestructibleInfo"] = "Indestructible.  Hace que el objeto no reciba daño de durabilidad.",
		["IndestructibleIs"] = "Ser |cffffffffindestructible|r vale:",
		["IntellectInfo"] = "Intelecto.  Aumenta el poder de hechizo para algunas clases.",
		["Leather"] = "Cuero",
		["LeatherInfo"] = "Puntos que asignar si el objeto es de Cuero",
		["LeechInfo"] = "Robo de vida.  Te devuelve como sanación el daño que infliges o la sanación que realizas.",
		["Mail"] = "Malla",
		["MailInfo"] = "Puntos que asignar si el objeto es de malla.",
		["MasteryInfo"] = "Maestría.  Mejora un bonus único para tu especialización.",
		["MetaSocketEffectInfo"] = "Efectos especiales de la meta gema. Puntos que se asignarán a la parte no estadística de una meta gema (por ejemplo, \"Aumento menor de velocidad de carrera\" o \"1% Reflejo de hechizo\").",
		["MinorStats"] = "Estadísticas menores",
		["MovementSpeedInfo"] = "Velocidad de movimiento.  Hace que tu personaje corra más rápido.",
		["Mp5"] = "Maná por 5",
		--[[Translation missing --]]
		["Mp5Info"] = "Mana regeneration per 5 seconds.  Affects your mana regeneration even when in combat.",
		--[[Translation missing --]]
		["NatureResistInfo"] = "Nature Resistance.  Reduces the damage taken from nature-based attacks.",
		["NatureSpellDamage"] = "Daño de Naturaleza",
		--[[Translation missing --]]
		["NatureSpellDamageInfo"] = "Nature damage.  Increases the damage dealt by your nature spells.",
		--[[Translation missing --]]
		["ParryInfo"] = "Parry.  Increases the chance that you'll parry enemy attacks.",
		["Plate"] = "Placas",
		["PlateInfo"] = "Puntos que asignar si el objeto es de Placas.",
		--[[Translation missing --]]
		["RapInfo"] = "Ranged Attack Power.  Increases the damage of ranged physical attacks.  Does not include attack power gained from agility.",
		--[[Translation missing --]]
		["ResilienceInfo"] = "Resilience. Reduces the chance that you'll be critically hit, and decreases the damage of critical hits that you do take.",
		--[[Translation missing --]]
		["ShadowResistInfo"] = "Shadow Resistance.  Reduces the damage taken from shadow-based attacks.",
		["ShadowSpellDamage"] = "Daño de las Sombras",
		--[[Translation missing --]]
		["ShadowSpellDamageInfo"] = "Shadow damage.  Increases the damage dealt by your shadow spells.",
		["Shield"] = "Escudo",
		["ShieldInfo"] = "Puntos que asignar si el objeto es un Escudo",
		["Sockets"] = "Ranuras",
		["SpecialWeaponStats"] = "Atributos especiales de arma",
		["SpeedBaseline"] = "Velocidad base",
		["SpeedBaselineInfo"] = "No es un atributo que aparezca en armas, este número se resta de el atributo de Velocidad antes de multiplicarlo por el valor de la escala.",
		["SpeedBaselineIs"] = "|cffffffffVelocidad base|r es:",
		["SpeedInfo"] = "Velocidad de arma, en segundos por golpe.  (Si prefieres armas rápidas, éste número a de ser negativo.  Ver también: \"velocidad base\" en la sección \"Atributos especiales de arma\".)",
		["SpeedIs"] = "1 segundo |cffffffffswing speed|r vale:",
		--[[Translation missing --]]
		["SpellCritInfo"] = "Spell critical strike.  Increases the chance that your spells will hit with increased potency.",
		["SpellDamage"] = "Daño de hechizos",
		--[[Translation missing --]]
		["SpellDamageInfo"] = "Spell damage.  Increases the damage dealt by your offensive spells.",
		--[[Translation missing --]]
		["SpellHitInfo"] = "Spell Hit.  Increases the chance that your damaging spells hit the target, especially bosses.",
		--[[Translation missing --]]
		["SpellPenetrationInfo"] = "Spell Penetration. Negates an enemy's resistances to your spells.",
		["SpellPowerInfo"] = "",
		--[[Translation missing --]]
		["SpiritInfo"] = "Spirit.  Affects your out-of-combat mana regeneration.",
		["StaminaInfo"] = "Aguante.  Aumenta tu vida.",
		["StrengthInfo"] = "Fuerza.  Aumenta el poder de ataque de algunas clases.",
		["VersatilityInfo"] = "Versatilidad.  Aumenta el daño infligido para personajes DPS, la sanación realizada para personajes sanadores, y reduce el daño recibido para personajes tanque.",
		["WeaponMainHandDps"] = "Mano Derecha: DPS",
		["WeaponMainHandDpsInfo"] = "Daño del arma por segundo, sólo para armas de mano derecha.",
		["WeaponMainHandMaxDamage"] = "Mano Derecha: daño máximo",
		["WeaponMainHandMaxDamageInfo"] = "Daño máximo del arma, sólo para armas de mano derecha.",
		["WeaponMainHandMinDamage"] = "Mano Derecha: daño mínimo",
		["WeaponMainHandMinDamageInfo"] = "Daño mínimo del arma, sólo para armas de mano derecha.",
		["WeaponMainHandSpeed"] = "Mano Derecha: velocidad",
		["WeaponMainHandSpeedInfo"] = "Velocidad del arma, sólo para armas de mano derecha.",
		["WeaponMaxDamage"] = "Daño máximo",
		["WeaponMaxDamageInfo"] = "Daño máximo del arma.",
		["WeaponMeleeDps"] = "DPS Cuerpo a Cuerpo",
		["WeaponMeleeDpsInfo"] = "Daño del arma por segundo, sólo para armas cuerpo a cuerpo.",
		["WeaponMeleeMaxDamage"] = "Cuerpo a Cuerpo: Daño máximo",
		["WeaponMeleeMaxDamageInfo"] = "Daño máximo del arma, sólo para armas cuerpo a cuerpo.",
		["WeaponMeleeMinDamage"] = "Cuerpo a Cuerpo: daño mínimo",
		["WeaponMeleeMinDamageInfo"] = "Daño mínimo del arma, sólo para armas cuerpo a cuerpo.",
		["WeaponMeleeSpeed"] = "Cuerpo a Cuerpo: velocidad",
		["WeaponMeleeSpeedInfo"] = "Velocidad del arma, sólo para armas cuerpo a cuerpo.",
		["WeaponMinDamage"] = "Daño mínimo",
		["WeaponMinDamageInfo"] = "Daño mínimo del arma.",
		["WeaponOffHandDps"] = "Mano Izquierda: DPS",
		["WeaponOffHandDpsInfo"] = "Daño del arma por segundo, sólo para armas de mano izquierda.",
		["WeaponOffHandMaxDamage"] = "Mano Izquierda: daño máximo",
		["WeaponOffHandMaxDamageInfo"] = "Daño máximo del arma, sólo para armas de mano izquierda.",
		["WeaponOffHandMinDamage"] = "Mano Izquierda: daño mínimo",
		["WeaponOffHandMinDamageInfo"] = "Daño mínimo del arma, sólo para armas de mano izquierda.",
		["WeaponOffHandSpeed"] = "Mano Izquierda: velocidad",
		["WeaponOffHandSpeedInfo"] = "Velocidad del arma, sólo para armas de mano izquierda.",
		["WeaponOneHandDps"] = "Una Mano: DPS",
		["WeaponOneHandDpsInfo"] = "Daño del arma por segundo, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda",
		["WeaponOneHandMaxDamage"] = "Una Mano: daño máximo",
		["WeaponOneHandMaxDamageInfo"] = "Daño máximo del arma, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda.",
		["WeaponOneHandMinDamage"] = "Una Mano: daño mínimo",
		["WeaponOneHandMinDamageInfo"] = "Daño mínimo del arma, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda.",
		["WeaponOneHandSpeed"] = "Una Mano: velocidad",
		["WeaponOneHandSpeedInfo"] = "Velocidad de arma, sólo para armas de Una Mano, sin incluir armas de Mano Derecha o Mano Izquierda.",
		["WeaponRangedDps"] = "A Distancia: DPS",
		["WeaponRangedDpsInfo"] = "Daño del arma por segundo, sólo para armas a distancia.",
		["WeaponRangedMaxDamage"] = "A Distancia: daño máximo",
		["WeaponRangedMaxDamageInfo"] = "Daño máximo del arma, sólo para armas a distancia.",
		["WeaponRangedMinDamage"] = "A Distancia: daño mínimo",
		["WeaponRangedMinDamageInfo"] = "Daño mínimo del arma, sólo para armas a distancia.",
		["WeaponRangedSpeed"] = "A Distancia: velocidad",
		["WeaponRangedSpeedInfo"] = "Velocidad de arma, sólo para armas a distancia.",
		["WeaponStats"] = "Atributos de arma",
		["WeaponTwoHandDps"] = "Dos Manos: DPS",
		["WeaponTwoHandDpsInfo"] = "Daño del arma por segundo, sólo para armas a dos manos.",
		["WeaponTwoHandMaxDamage"] = "Dos Manos: daño máximo",
		["WeaponTwoHandMaxDamageInfo"] = "Daño máximo del arma, sólo para armas a dos manos.",
		["WeaponTwoHandMinDamage"] = "Dos Manos: daño mínimo",
		["WeaponTwoHandMinDamageInfo"] = "Daño mínimo del arma, sólo para armas a dos manos.",
		["WeaponTwoHandSpeed"] = "Dos Manos: velocidad",
		["WeaponTwoHandSpeedInfo"] = "Velocidad de arma, sólo para armas a dos manos.",
		["WeaponType1HAxe"] = "Hacha: Una Mano",
		["WeaponType1HAxeInfo"] = "Puntos que asignar si el objeto es un hacha de una mano.",
		["WeaponType1HMace"] = "Maza: Una Mano",
		["WeaponType1HMaceInfo"] = "Puntos que asignar si el objeto es una maza de una mano.",
		["WeaponType1HSword"] = "Espada: Una Mano",
		["WeaponType1HSwordInfo"] = "Puntos que asignar si el objeto es una espada de una mano.",
		["WeaponType2HAxe"] = "Hacha: Dos Manos",
		["WeaponType2HAxeInfo"] = "Puntos que asignar si el objeto es un hacha de dos manos.",
		["WeaponType2HMace"] = "Maza: Dos Manos",
		["WeaponType2HMaceInfo"] = "Puntos que asignar si el objeto es una maza de dos manos.",
		["WeaponType2HSword"] = "Espada: Dos Manos",
		["WeaponType2HSwordInfo"] = "Puntos que asignar si el objeto es una espada de dos manos.",
		["WeaponTypeBow"] = "Arco",
		["WeaponTypeBowInfo"] = "Puntos que asignar si el objeto es un arcos.",
		["WeaponTypeCrossbow"] = "Ballesta",
		["WeaponTypeCrossbowInfo"] = "Puntos que asignar si el objeto es una ballesta.",
		["WeaponTypeDagger"] = "Daga",
		["WeaponTypeDaggerInfo"] = "Puntos que asignar si el objeto es una daga.",
		["WeaponTypeFistWeapon"] = "Arma de puño",
		["WeaponTypeFistWeaponInfo"] = "Puntos que asignar si el objeto es un arma de puño.",
		["WeaponTypeFrill"] = "Cosillas de mano izquierda",
		["WeaponTypeFrillInfo"] = "Puntos que asignar si el objeto es un objeto de taumaturgo \"sostener en mano izquierda\".  No aplica a escudos o armas.",
		["WeaponTypeGun"] = "Arma de fuego",
		["WeaponTypeGunInfo"] = "Puntos que asignar si el objeto es un arma de fuego.",
		["WeaponTypeOffHand"] = "Arma de mano izquierda",
		["WeaponTypeOffHandInfo"] = "Puntos que asignar si el objeto es cualquier arma que sólo puede ser sostenida en la mano izquierda.  No aplica a objetos \"cosillas\" de (taumaturgo), escudos, o armas que pueden ser sostenidas en cualquier mano.",
		["WeaponTypePolearm"] = "Arma de asta",
		["WeaponTypePolearmInfo"] = "Puntos que asignar si el objeto es un arma de asta.",
		["WeaponTypes"] = "Tipos de armas",
		["WeaponTypeStaff"] = "Vara",
		["WeaponTypeStaffInfo"] = "Puntos que asignar si el objeto es una vara.",
		["WeaponTypeThrown"] = "Arrojadiza",
		["WeaponTypeThrownInfo"] = "Puntos que asignar si el objeto es una arrojadiza.",
		["WeaponTypeWand"] = "Varita",
		["WeaponTypeWandInfo"] = "Puntos que asignar si el objeto es una varita.",
		["WeaponTypeWarglaive"] = "Guja de Guerra",
		["WeaponTypeWarglaiveInfo"] = "Puntos que seran asignados si el objetos es una guja de guerra",
	},
	["TooltipParsing"] = {
		["Agility"] = "^%+?# d?e? ?[Aa]gilidad$",
		["AllStats"] = "^%+?# todas las estadísticas$",
		["Ap"] = "^%+?# [Pp]oder de ataque$",
		["Ap2"] = "^Equipar: Aumenta # p%. el poder de ataque%.$",
		["Ap3"] = "^UNUSED$",
		["ArcaneResist"] = "^%+?# resistencia a Arcano$",
		["ArcaneSpellDamage"] = "^%+# daño con hechizos Arcano$",
		["ArcaneSpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño que infligen los hechizos y efectos Arcanos%.$",
		["ArcaneSpellDamage3"] = "^%+# daño Arcano$",
		["Armor"] = "^%+?# p%. de armadura$",
		["Armor2"] = "^UNUSED$",
		["ArmorPenetration"] = "^Equipar: Tus ataques ignoran # p%. de la armadura de tu oponente%.$",
		["ArmorPenetrationRating"] = "^Equipar: Aumenta el índice de penetración de armadura # p%.$",
		["ArmorPenetrationRating2"] = "^UNUSED$",
		["ArmorPenetrationShort"] = "^%+?# índice de penetración de armadura$",
		["Avoidance"] = "^%+# eludir$",
		["Axe"] = "^Hacha$",
		["BagSlots"] = "^%d+ casillas .+$",
		["Block"] = "^%+?# de bloqueo$",
		["BlockPercent"] = "^Equipar: Aumenta un #%% tu probabilidad de bloquear ataques con un escudo%.$",
		["BlockRating"] = "^Equipar: Aumenta tu índice de bloqueo e?n? ?# p%.$",
		["BlockRating2"] = "^Equipar: Aumenta # p%. el bloqueo con escudo%.$",
		["BlockValue"] = "^Equipar: Aumenta el valor de bloqueo de tu escudo # p%.$",
		["Bow"] = "^Arco$",
		["ChanceOnHit"] = "Probabilidad al acertar:",
		["Charges"] = "^.+ cargas?$",
		["Cloth"] = "^Tela$",
		["CooldownRemaining"] = "^Tiempo de reutilización restante:",
		["Corruption"] = "^%+?# [Cc]orrupción$",
		["Crit"] = "^%+?# golpe crítico%.?$",
		["Crit2"] = "^UNUSED$",
		["CritPercent"] = "^Equipar: Mejora un #%% tu probabilidad de conseguir un golpe crítico%.$",
		["CritRating"] = "^Equipar: Aumenta tu índice de golpe crítico e?n? ?# p%.$",
		["CritRating2"] = "^Equipar: Mejora el índice de golpe crítico en # p%.$",
		["CritRating3"] = "^Equipar: Aumenta # p%. el golpe crítico%.$",
		["CritRatingShort"] = "^%+?# índice de golpe crítico$",
		["Crossbow"] = "^Ballesta$",
		["Dagger"] = "^Daga$",
		["DefenseRating"] = "^Equipar: Aumenta el índice de defensa e?n? ?# p%.$",
		["DefenseRating2"] = "^Equipar: Aumenta # p%. la defensa%.$",
		["DefenseRatingSimple"] = "^%+?# índice de defensa$",
		["DefenseSkill"] = "^Equipar: Aumenta # p%. el índice de defensa%.$",
		["DefenseSkillSimple"] = "^%+?# de [dD]efensa$",
		["DisenchantingRequires"] = "^Desencantar requiere",
		["Dodge"] = "^%+?#%%? d?e? ?[eE]squivar$",
		["Dodge2"] = "^UNUSED$",
		["Dodge3"] = "^UNUSED$",
		["DodgePercent"] = "^Equipar: Aumenta un #%% tu probabilidad de esquivar un ataque%.$",
		["DodgeRating"] = "^Equipar: Aumenta tu índice de esquivar e?n? ?# p%.$",
		["DodgeRating2"] = "^Equipar: Aumenta # p%. tu índice de esquivar%.$",
		["DodgeRatingShort"] = "^%+?#%%? índice de esquivar$",
		["Dps"] = "^%(# p%. de daño por segundo%)$",
		["DpsAdd"] = "^Añade # p%. de daño por segundo$",
		["Duration"] = "^Duración:",
		["Elite"] = "^Élite$",
		["EnchantmentArmorKit"] = "^Reforzado %(%+# armadura%)$",
		["EnchantmentCounterweight"] = "^Contrapeso %(%+# celeridad%)",
		["EnchantmentFieryWeapon"] = "^Arma ígnea$",
		["EnchantmentHealth"] = "^%+# HP$",
		["EnchantmentHealth2"] = "^%+# salud$",
		["EnchantmentLivingSteelWeaponChain"] = "^Cadena de Acero Vivo$",
		["EnchantmentPyriumWeaponChain"] = "^Cadena de Pirium$",
		["EnchantmentTitaniumWeaponChain"] = "^Cadena de Titanio$",
		["Equip"] = "Equipar:",
		["ExpertiseRating"] = "^Equipar: Aumenta tu índice de pericia [ue]n # ?p?%.$",
		["ExpertiseRatingShort"] = "^%+?# índice de pericia$",
		["FeralAp"] = "^Equipar: %+# p%. de poder de ataque solo en las formas felina, de oso y de oso temible%.$",
		["FeralApMoonkin"] = "^Equipar: Aumenta e?n? ?# p%. el poder de ataque bajo formas felinas, de oso, de oso temible y de lechúcico lunar%.$",
		["FeralApWrath"] = "^Aumenta e?n? ?# p%. el poder de ataque bajo formas felinas, de oso, de oso temible y de lechúcico lunar%.$",
		["FireResist"] = "^%+?# resistencia a Fuego$",
		["FireSpellDamage"] = "^%+# daño con hechizos de Fuego$",
		["FireSpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño que infligen los hechizos y efectos de Fuego%.$",
		["FireSpellDamage3"] = "^%+# daño de Fuego$",
		["FistWeapon"] = "^Arma de puño$",
		["Flexible"] = "^Flexible$",
		["FrostResist"] = "^%+?# resistencia a Escarcha$",
		["FrostSpellDamage"] = "^%+# daño con hechizos de Escarcha$",
		["FrostSpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño que infligen los hechizos y efectos de Escarcha%.$",
		["FrostSpellDamage3"] = "^%+# daño de Escarcha$",
		["Gun"] = "^Arma de fuego$",
		["Haste"] = "^%+?# celeridad$",
		["Haste2"] = "^UNUSED$",
		["HaventCollectedAppearance"] = "^No has conseguido esta apariencia%.$",
		["HasteRating"] = "^Equipar: Aumenta # p%. la celeridad%.$",
		["HasteRating2"] = "^Equipar: Mejora el índice de celeridad en # p%.$",
		["HasteRatingShort"] = "^%+?# celeridad$",
		["Healing"] = "^%+# de hechizos de sanación$",
		["Healing2"] = "^Equipar: Aumenta hasta # p%. la sanación de los hechizos y efectos%.$",
		["Healing3"] = "^%+# sanación$",
		["HeirloomLevelRange"] = "^Requiere un nivel entre %d+ y (%d+)",
		["HeirloomXpBoost"] = "^Equipar: La experiencia obtenida",
		["HeirloomXpBoost2"] = "^UNUSED$",
		["Heroic"] = "^Heroico$",
		["HeroicElite"] = "^Heroico de élite$",
		["HeroicThunderforged"] = "^Heroico Forjas del Trueno$",
		["HeroicWarforged"] = "^Heroico Forjas de la guerra$",
		["Hit"] = "^Equipar: Mejora tu probabilidad de golpear un #%%%.$",
		["Hit2"] = "^UNUSED$",
		["HitRating"] = "^Equipar: Aumenta # p%. el golpe%.$",
		["HitRating2"] = "^Equipar: Aumenta tu índice de golpe e?n? ?# p%.$",
		["HitRating3"] = "^Equipar: Mejora el índice de golpe e?n? ?# p%.$",
		["HitRatingShort"] = "^%+?# índice de golpe$",
		["HolySpellDamage"] = "^%+# daño con hechizos Sagrados$",
		["HolySpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño que infligen los hechizos y efectos Sagrados%.$",
		["HolySpellDamage3"] = "^UNUSED$",
		["Hp5"] = "^# [sS]alud cada 5 s%.?$",
		["Hp52"] = "^Equipar: Restaura # de vida cada 5 segundos%.$",
		["Hp53"] = "^Restaura %+?# [vV]ida [cC]ada 5 [sS]egundos%.?$",
		["Hp54"] = "^UNUSED$",
		["Hp55"] = "^UNUSED$",
		["Intellect"] = "^%+?# d?e? ?[Ii]ntelecto$",
		["Leather"] = "^Cuero$",
		["Leech"] = "^%+# robo de vida$",
		["Mace"] = "^Maza$",
		["Mail"] = "^Malla$",
		["Mastery"] = "^%+?# maestría$",
		["Mastery2"] = "^UNUSED$",
		["MetaGemRequirements"] = "|cff%x%x%x%x%x%xRequiere",
		["MovementSpeed"] = "^%+# velocidad$",
		["Mp5"] = "^Equipar: Restaura # p%. de maná cada 5 s%.$",
		["Mp52"] = "^%+?# maná cada 5 s$",
		["Mp53"] = "^UNUSED$",
		["Mp54"] = "^UNUSED$",
		["Mp55"] = "^UNUSED$",
		["MultiStatHeading"] = "^Estadisticas multiples$",
		["MultiStatSeparator1"] = "y",
		["Multistrike"] = "^%+# multigolpe$",
		["NatureResist"] = "^%+?# resistencia a Naturaleza$",
		["NatureSpellDamage"] = "^%+# daño con hechizos de Naturaleza$",
		["NatureSpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño que infligen los hechizos y efectos de Naturaleza%.$",
		["NatureSpellDamage3"] = "^%+# daño de Naturaleza$",
		["NormalizationEnchant"] = "^Encantado: (.*)$",
		["Parry"] = "^%+?# parada$",
		["Parry2"] = "^UNUSED$",
		["ParryPercent"] = "^Equipar: Aumenta un #%% tu probabilidad de parar un ataque%.$",
		["ParryRating"] = "^Equipar: Aumenta tu índice de parada e?n? ?# p%.$",
		["ParryRatingShort"] = "^%+?# índice de parada$",
		["Plate"] = "^Placas$",
		["Polearm"] = "^Arma de asta$",
		["PvPPower"] = "^%+?# poder JcJ$",
		["RaidFinder"] = "^Buscador de bandas$",
		["Rap"] = "^Equipar: %+# p%. de poder de ataque a distancia%.$",
		["Rap2"] = "^Equipar: Aumenta # p%. el poder de ataque a distancia%.$",
		["Requires2"] = "^Necesitas ser de nivel %d+$",
		["Resilience"] = "^%+?# temple JcJ$",
		["Resilience2"] = "^UNUSED$",
		["ResilienceRating"] = "^Equipar: Aumenta # p%. el temple JcJ%.$",
		["ResilienceRatingShort"] = "^%+?# índice de temple$",
		["Scope"] = "^Mira %(%+# daño%)$",
		["ScopeCrit"] = "^Scope %(%+# Critical Strike%)$",
		["ScopeRangedCrit"] = "^%+?# Golpe Crítico a distancia$",
		["ShadowResist"] = "^%+?# resistencia a Sombras$",
		["ShadowSpellDamage"] = "^%+# daño con hechizos de las Sombras$",
		["ShadowSpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño que infligen los hechizos y efectos de las Sombras%.$",
		["ShadowSpellDamage3"] = "^UNUSED$",
		["ShadowSpellDamage4"] = "^%+# Daño de las Sombras$",
		["Shield"] = "^Escudo$",
		["SocketBonusPrefix"] = "Bonus ranura: ",
		["Speed"] = "^Velocidad #$",
		["Speed2"] = "^Veloc%. #$",
		["SpellCrit"] = "^Equipar: Mejora tu probabilidad de asestar un golpe crítico con hechizos un #%%%.$",
		["SpellCritRating"] = "^Equipar: Aumenta tu índice de golpe crítico con hechizos e?n? ?# p%.$",
		["SpellCritRating2"] = "^Equipar: Mejora # p%. el golpe crítico con hechizos%.$",
		["SpellCritRatingShort"] = "^%+?# índice de golpe crítico con hechizos$",
		["SpellCritRatingShort2"] = "^UNUSED$",
		["SpellDamage"] = "^%+# de daño y Hechizos de curación$",
		["SpellDamage2"] = "^Equipar: Aumenta hasta # p%. el daño y la sanación de los hechizos y efectos mágicos%.$",
		["SpellDamage3"] = "^UNUSED$",
		["SpellDamage4"] = "^UNUSED$",
		["SpellDamage5"] = "^%+# daño y sanación con hechizos$",
		["SpellDamage6"] = "^Equipar: Aumenta el daño y la sanación de los hechizos mágicos y los efectos hasta en # p%.$",
		["SpellDamageAndHealing"] = "^Equipar: Aumenta hasta # p%. la sanación realizada y hasta # p%. todo el daño infligido con todos los hechizos y efectos mágicos%.$",
		["SpellDamageAndHealing2"] = "^UNUSED$",
		["SpellDamageAndHealingEnchant"] = "^BUG IN GAME$",
		["SpellDamageAndHealingShort"] = "^BUG IN GAME$",
		["SpellDamageAndHealingShort2"] = "^UNUSED$",
		["SpellHasteRating"] = "^Equipar: Aumenta el índice de celeridad con hechizos e?n? ?# p%.$",
		["SpellHasteRatingShort"] = "^%+?# índice de celeridad con hechizos$",
		["SpellHit"] = "^Equipar: Mejora un #%% tu probabilidad de golpear con hechizos%.$",
		["SpellHitRating"] = "^Equipar: Aumenta tu índice de golpe con hechizos e?n? ?# p%.$",
		["SpellHitRating2"] = "^Equipar: Mejora # p%. el golpe con hechizos%.$",
		["SpellHitRatingShort"] = "^%+?# índice de golpe con hechizos$",
		["SpellPenetration"] = "^Equipar: Aumenta la penetración de tus hechizos e?n? ?# p%.$",
		["SpellPenetrationClassic"] = "^Equipar: Las resistencias mágicas de los objetivos de tus hechizos se reducen # p%.$",
		["SpellPenetrationShort"] = "^%+?# penetración de hechizos$",
		["SpellPower"] = "^%+?# poder con hechizos$",
		["SpellPower2"] = "^Equipar: Aumenta el poder con hechizos # p%.$",
		["SpellPower3"] = "^Equipar: Aumenta # p%. el poder de hechizos%.$",
		["Spirit"] = "^%+?# d?e? ?[Ee]spíritu$",
		["Staff"] = "^Bastón$",
		["Stamina"] = "^%+?# d?e? ?[Aa]guante$",
		["Strength"] = "^%+?# d?e? ?[Ff]uerza$",
		["Sword"] = "^Espada$",
		["TemporaryBuffMinutes"] = "^.+%(%d+ min%)$",
		["TemporaryBuffSeconds"] = "^.+%(%d+ seg%)$",
		["Thrown"] = "^Arma arrojadiza$",
		["Thunderforged"] = "^Forjas del Trueno$",
		["Timeless"] = "^Sin tiempo$",
		["Titanforged"] = "^Forjadoporlostitanes$",
		["UpgradeLevel"] = "^Nivel de Mejora:",
		["Use"] = "Usar:",
		["Versatility"] = "^%+# versatilidad$",
		["Wand"] = "^Varita$",
		["Warforged"] = "^Forjas de la guerra$",
		["Warglaives"] = "^Gujas de Guerra$",
		["WeaponDamage"] = "^# %- # p%. de daño$",
		["WeaponDamageArcane"] = "^# %- # p%. de daño de Arcano$",
		["WeaponDamageArcaneExact"] = "^# p%. de daño de Arcano$",
		["WeaponDamageEnchantment"] = "^%+?# daño con arma$",
		["WeaponDamageEquip"] = "^Equipar: %+?# p%. de daño con arma%.$",
		["WeaponDamageExact"] = "^# p%. de daño$",
		["WeaponDamageFire"] = "^# %- # p%. de daño de Fuego$",
		["WeaponDamageFireExact"] = "^# p%. de daño de Fuego$",
		["WeaponDamageFrost"] = "^# %- # p%. de daño de Escarcha$",
		["WeaponDamageFrostExact"] = "^# p%. de daño de Escarcha$",
		["WeaponDamageHoly"] = "^# %- # p%. de daño de Sagrado$",
		["WeaponDamageHolyExact"] = "^# p%. de daño de Sagrado$",
		["WeaponDamageNature"] = "^# %- # p%. de daño de Naturaleza$",
		["WeaponDamageNatureExact"] = "^# p%. de daño de Naturaleza$",
		["WeaponDamageShadow"] = "^# %- # p%. de daño de Sombras$",
		["WeaponDamageShadowExact"] = "^# p%. de daño de Sombras$",
	},
	["UI"] = {
		["AboutHeader"] = "Acerca de Pawn",
		--[[Translation missing --]]
		["AboutMrRobot"] = "Default stat weights are provided by the generous Mr. Robot.  They’re a great starting point for characters with typical talents and artifact traits in typical fights.  You can get more accurate, customized stat weights for your character using the Ask Mr. Robot simulator at askmrrobot.com.",
		["AboutReadme"] = "Nuevo en Pawn? Mira la pestaña de primeros pasos para una introducción básica.",
		["AboutTab"] = "Acerca de",
		["AboutTranslation"] = "Traducción al Castellano por Minimoncho y Grimngor",
		["AboutVersion"] = "Versión %s",
		["AboutWebsite"] = "Para otros addons de Vger, visita vgermods.com.",
		--[[Translation missing --]]
		["AskMrRobotProvider"] = "Ask Mr. Robot scales",
		["CompareClearItems"] = "Limpiar",
		["CompareClearItemsTooltip"] = "Quitar ambos objetos de la comparación.",
		["CompareColoredSockets"] = "Ranuras",
		["CompareEquipped"] = "Equipado",
		["CompareGemTotalValue"] = "Valor de gemas",
		["CompareHeader"] = "Compara objetos usando %s",
		["CompareOtherHeader"] = "Otro",
		["CompareSlotEmpty"] = "(vacío)",
		["CompareSocketBonus"] = "Bonus de ranura",
		["CompareSocketsHeader"] = "Ranuras",
		["CompareSpecialEffects"] = "Efectos especiales",
		["CompareSwap"] = "‹ Cambiar ›",
		["CompareSwapTooltip"] = "Cambia el objeto de la izquierda por el de la derecha.",
		["CompareTab"] = "Comparar",
		["CompareVersus"] = "—vs.—",
		["CompareWelcomeRight"] = [=[Despues, coloca un objeto en ésta caja. 

Puedes compararlo contra tus objetos existentes usando los iconos en la esquina inferior izquierda.]=],
		["CompareYourBest"] = "El mejor",
		["GemsColorHeader"] = "Gemas %s",
		["GemsHeader"] = "Gemas para %s",
		["GemsNoneFound"] = "No se encontraron gemas adecuadas.",
		["GemsQualityLevel"] = "Nivel de calidad de la gema",
		["GemsQualityLevelTooltip"] = [=[Nivel de objeto para el que sugerir gemas.

Por ejemplo, si "463", entonces Pawn mostrará gemas adecuadas para objetos de nivel 463: Botín de mazmorra heroica de Mists of Pandaria.]=],
		["GemsShowBest"] = "Muestra las mejores gemas disponibles",
		["GemsShowBestTooltip"] = "Muestra las mejores gemas que hay disponibles para la escala seleccionada actualmente.  Algunas de éstas gemas serán demasiado poderosas para encrustarlas en objetos viejos y de baja calidad.",
		["GemsShowForItemLevel"] = "Muestra las gemas recomendadas para un nivel de objeto:",
		["GemsShowForItemLevelTooltip"] = "Muestra las gemas que Pawn recomienda para la escala que está seleccionada actualmente y un objeto de un nivel específico.",
		["GemsTab"] = "Gemas",
		["GemsWelcome"] = "Selecciona una escala a la izquierda para ver las gemas que Pawn recomienda.",
		["HelpHeader"] = "Bienvenido a Pawn!",
		["HelpTab"] = "Primeros pasos",
		["HelpText"] = [=[Pawn calcula el valor del objeto según los atributos del objeto.  Después utiliza estos valores para determinar cuales de tus objetos son los mejores, y identificar objetos que mejorarían tu equipamiento. 

	  
Cada objeto recibirá una puntuación por cada "escala" que esté activa para tu personaje.  Una escala enumera los atributos que son importantes para ti, y cuantos puntos vale cada atributo.  Normalmente dispones de una escala para cada uno de los roles o especializaciones de clase.  Las puntuaciones están escondidas por defecto, pero puedes ver como se calcula la puntuación de un objeto en la pestaña de Comparar. 

 • Puedes activar o desactivar una escala haciendo shift-click en ella en la lista de la pestaña de Escalas. 

 
Pawn viene con escalas pre-fabricadas para cada clase y especialización.  También puedes crear tu propia escala asignandole valores a cada atributo, importar escalas de internet o herramientas de simulación, o compartir escalas con compañeros de hermandad. 


|cff8ec3e6Prueba estás características una vez aprendas los básico:|r 
 • Compara las estadñisticas de dos objetos usando la pestaña de Comparar de  Pawn.
 • Haz click-derecho en la ventana de link al chat de un objeto para ver la comparación con tu objeto actual. 
 • Haz una copia de una de tus escalas en la pestaña de Escalas, y personaliza los valores de los atributos en la pesaña de Valores. 
 • Busca más escalas para tu clase en internet. 
 • Echa un vistazo al archivo leeme para aprender más acerca de las características avanzadas de Pawn.]=],
		["InterfaceOptionsBody"] = "Haz click en el botón de Pawn para ir allí.  También puedes abrir Pawn desde tu ventana de personaje, o estableciendo un atajo de teclado a Pawn.",
		["InterfaceOptionsWelcome"] = "Las opciones de Pawn se encuentran en la IU de Pawn.",
		["InventoryButtonTooltip"] = "Haz click para abrir Pawn.",
		["InventoryButtonTotalsHeader"] = "Totales para todos los objetos equipados:",
		["KeyBindingCompareItemLeft"] = "Comparar objeto (izquierda)",
		["KeyBindingCompareItemRight"] = "Comparar objeto (derecha)",
		["KeyBindingShowUI"] = "Enciende/Apaga la IU de Pawn",
		["OptionsAdvisorHeader"] = "Opciones del consejero",
		["OptionsAlignRight"] = "Alinea los valores al lado derecho del tooltip",
		["OptionsAlignRightTooltip"] = "Activa ésta opción para alinear tus valores de Pawn y la información de mejora al lado derecho del tooltip en vez de al izquierdo.",
		--[[Translation missing --]]
		["OptionsBagUpgradeAdvisor"] = "Show bag upgrade advisor",
		--[[Translation missing --]]
		["OptionsBagUpgradeAdvisorTooltip"] = [=[Enable this option to have Pawn take over the in-bag upgrade arrows.

If checked, Pawn will find upgrades in your bags and mark items that are an upgrade for any of your active scales with green arrows. 

If unchecked, WoW will mark items with a higher item level than what you're currently wearing, and Pawn will not interfere with the built-in feature.]=],
		["OptionsBlankLine"] = "Añade una línea en blanco antes de los valores",
		["OptionsBlankLineTooltip"] = "Mantén tus tooltips de objetos super ordenados activando ésta opción, que añade una línea en blanco antes de los valores de Pawn.",
		["OptionsButtonHidden"] = "Esconder",
		["OptionsButtonHiddenTooltip"] = "No mostrar el botón de Pawn en la ventana de Información de Personaje.",
		["OptionsButtonPosition"] = "Mostrar el botón de Pawn:",
		["OptionsButtonPositionLeft"] = "A la izquierda",
		["OptionsButtonPositionLeftTooltip"] = "Muestra el botón de Pawn en la esquina inferior izquierda de la ventana de Información de Personaje.",
		["OptionsButtonPositionRight"] = "A la derecha",
		["OptionsButtonPositionRightTooltip"] = "Muestra el botón de Pawn en la esquina inferior derecha de la ventana de Información de Personaje.",
		["OptionsColorBorder"] = "Colorear el borde del tooltip de mejoras",
		["OptionsColorBorderTooltip"] = "Activa ésta opción para cambiar el color del borde del tooltip de objetos a partir de los verdes.  Desactiva ésta opción si interfiere con otros addons que cambian los bordes de los tooltips.",
		["OptionsCurrentValue"] = "Muestra tanto los valores base como los actuales",
		["OptionsCurrentValueTooltip"] = [=[Activa ésta opción para que Pawn muestre dos valores para objetos: el valor actual, que refleja el estado actual de un objeto con las gemas y encantamientos actuales, sin que las ranuras vacias den beneficio, y el valor base, que es lo que Pawn muestra normalmente.  Ésta opción no tiene efecto salvo que actives mostrar valor de objetos en tooltip.

Deberías seguir usando el valor base para decidir entre dos objetos cuando llegues al "endgame", pero el valor actual puede ser de ayuda mientras subes de nivel y para que sea más fácil decidir si merece la pena equipar un objeto nuevo inmediatamente antes de que tenga gemas o encantamientos.]=],
		["OptionsDebug"] = "Muestra la información de debug",
		["OptionsDebugTooltip"] = [=[Si no estás seguro de como Pawn está calculando los valores de un objeto en particular, habilita ésta opción para que Pawn muestre todo yipo de datos "útiles" en la consola de chat cada vez que pongas el ratón sobre un objeto.  Ésta informacion incluye los atributos que Pawn cree que tiene el objeto, que partes del objeto Pawn no entiende, y como tiene cada uno de los atributos en cuenta para cada una de tus escalas. 

Ésta opción llenará tu registro de chat bastante rapido, te recomendamos apagarla cuando hayas terminado de hacer pruebas. 

Atajos: 
/pawn debug on 
/pawn debug off]=],
		["OptionsHeader"] = "Ajusta las opciones de Pawn",
		["OptionsIgnoreGemsWhileLevelingCheck"] = "Ignorar ranuras en objetos de bajo nivel",
		["OptionsIgnoreGemsWhileLevelingCheckTooltip"] = [=[Habilita ésta opción para que Pawn ignore las ranuras en objetos de bajo nivel al calcular los valores de objetos, dado que la mayoría de la gente no dedica tiempo a incrustar objetos cuando aún está levelando.  Un objeto de "bajo nivel" es aquel peor que el que puede obtenerse en una mazmorra heroica en el nivel máximo.

Si está seleccionado, el asistente de ranuras de Pawn sugerira gemas apropriadas para objetos de bajo nivel, pero algunas ranuras serán ignoradas en los calculos y los objetos con incrustaciones no se mostrarán como mejoras con tanta frecuancia. 

Si está deseleccionado, Pawn calculará valores para objetos como si tuvieran las incrustaciones que maximizan el valor del objeto, independientemente del nivel del objeto.]=],
		["OptionsIgnoreItemUpgradesCheck"] = "Ignorar las mejoras de valor y torvos",
		["OptionsIgnoreItemUpgradesCheckTooltip"] = [=[Activa esta opción para que Pawn ignore el potencial para las mejoras de Valor y los objetos Torvos Mejorados cuando calcule el valor de los objetos.

Si esta marcado, Pawn tratará los objetos mejorables como son actualmente y no asumirá que usarás Valor y Fragmentos Apexis Mejorados para mejorar el objeto al determinar si el objeto es mejor que el que tienes actualmente.

Si no esta marcado, Pawn tratará esos objetos asumiendo que maximizaras su potencial con Valor y Fragmentos Apexis Mejorados. Esto podría causar que un objeto torvo de nivel 650 apareciera como una mejora notable respecto a un objeto nivel 670 de Fundición Rocanegra, ya que el objeto torvo podría mejorarse potencialmente hasta el nivel 705 a través de Valor y Apexis.]=],
		["OptionsInventoryIcon"] = "Mostrar iconos de inventario",
		["OptionsInventoryIconTooltip"] = "Habilita ésta opción para mostrar el incono de los objetos enlazados en el chat.",
		["OptionsItemIDs"] = "Mostrar IDs de objetos",
		["OptionsItemIDsTooltip"] = [=[Habilita ésta opción para uqe Pawn muestre los números de ID de todos los objetos que encuentres, asi como las IDs de todos los encantamientos y gemas. 

Todo objeto en World of Warcraft tiene un número de ID asociado.  Normalmente ésta información sólo es útil para desarrolladores de addons.]=],
		["OptionsLootAdvisor"] = "Mostrar asistente de mejora en botín",
		["OptionsLootAdvisorTooltip"] = "Cuando el botín de una mazmorra suponga una mejora, Pawn mostrará un popup anclado a la ventana de botín informándote de la mejora.",
		["OptionsOtherHeader"] = "Otras opciones",
		["OptionsQuestUpgradeAdvisor"] = "Mostrar asistente de mejora en misión",
		["OptionsQuestUpgradeAdvisorTooltip"] = "En tu registro de misiones y en las conversaciones con PNJs, si una de las opciones de recompensa de la misión es una mejora para tu equipamiento actual, Pawn mostrará un icono de flecha verde en ese objeto.  SI ninguno de los objetos son una mejora, Pawn mostrará un montón de monedas en el objeto que valga más al venderlo a un comerciante.",
		["OptionsResetUpgrades"] = "Re-escanear equipo",
		["OptionsResetUpgradesTooltip"] = [=[Pawn olvidará lo que sabe sobre los mejores objetos que has equipado en el pasado y re-escaneará tu equipamiento para mostrar información de mejoras más relevante en el futuro. 

Usa ésta característica si crees que Pawn está haciendo malas sugerencias de mejora como resultado de objetos que has vendido, destruido, o que de otra forma ya no usas.  Ésto afectará a todos tus personajes que usen Pawn.]=],
		--[[Translation missing --]]
		["OptionsShowItemLevelUpgrades"] = "Show item level upgrades",
		--[[Translation missing --]]
		["OptionsShowItemLevelUpgradesTooltip"] = "Pawn will show you items that are of a higher item level than what you've previously equipped in that slot in addition to normal upgrades.",
		--[[Translation missing --]]
		["OptionsShowRelicUpgrades"] = "Show relic upgrades",
		--[[Translation missing --]]
		["OptionsShowRelicUpgradesTooltip"] = "Pawn will show you when a relic would increase the item level of one of your artifact weapons.  (This works differently from other upgrade features, since it's based on item level, not stats.)",
		["OptionsSocketingAdvisor"] = "Mostrar asistente de ranuras",
		["OptionsSocketingAdvisorTooltip"] = "Cuando se añaden gemas a un objeto, Pawn mostrará un popup sugiriendo las gemas que puedes añadir al objeto para maximizar su poder.  (Para ver la lista completa de sugerencias de gemas para cada color, ve a la pestaña de Gemas, donde además podrás personalizar la calidad de las gemas que usar.)",
		["OptionsTab"] = "Opciones",
		["OptionsTooltipHeader"] = "Opciones de Tooltips",
		["OptionsTooltipSpecIcon"] = "Mostrar iconos de especializacion",
		["OptionsTooltipSpecIconTooltip"] = "Activar esta opcion para mostrar iconos de especializacion al lado de los nombres de las escalas en la descripcion emergente",
		["OptionsTooltipUpgradesOnly"] = "Muestra sólo mejoras",
		["OptionsTooltipUpgradesOnlyTooltip"] = [=[Ésta es la opción más simple.  Sólo muestra porcentajes de mejora para objetos que son una mejora de tu equipamiento actual, y indica cuales de tus objetos son los mejores para cada escala.  No muestra nada en absoluto para los objetos inferiores. 

|cff8ec3e6Fuego:|r  |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% mejora|r 

...o... 

|cff8ec3e6Fuego:  el mejor|r]=],
		["OptionsTooltipValuesAndUpgrades"] = "Muestra los valores de las escalas y los valores %",
		["OptionsTooltipValuesAndUpgradesTooltip"] = [=[Muestra valores de Pawn para todas tus escalas visibles en todos los objetos, excepto aquellos que tienen un valor de cero.  Además, indicar que objetos son una mejora para tu equipamiento actual. 

|cff8ec3e6Escarcha:  123.4 
Fire:  156.7 |TInterface\AddOns\Pawn\Textures\UpgradeArrow:0|t |cff00ff00+10% mejora|r]=],
		["OptionsTooltipValuesOnly"] = "Muestra sólo los valores de las escalas, no mejoras %",
		["OptionsTooltipValuesOnlyTooltip"] = [=[Muestra valores de Pawn para todas tus escalas visibles en todos los objetos, excepto aquellos que tienen un valor de cero.  No indicar que objetos son una mejora para tu equipamiento actual.  Ésta opción refleja el comportamiento por defecto en versiones antiguas de Pawn. 

|cff8ec3e6Escarcha:  123.4
Fuego:  156.7|r]=],
		["OptionsUpgradeHeader"] = "Muestra |TInterface\\AddOns\\Pawn\\Textures\\UpgradeArrow:0|t mejoras en los tooltips:",
		--[[Translation missing --]]
		["OptionsUpgradeSettingsHeader"] = "Upgrade options",
		["OptionsUpgradesForBothWeaponTypes"] = "Muestra mejoras para Una Mano y Dos Manos",
		["OptionsUpgradesForBothWeaponTypesTooltip"] = [=[El asistente de mejoras de Pawn buscarán y mostrarán mejoras para tus armas de dos manos y tus armas de doble empuñadura (o para taumaturgos, cosilla de mano derecha y mano izquierda) de forma independiente. 

Si está seleccionado, podrás estar usando un arma de dos manos y aún asi ver armas de una mano claramente inferiores como mejoras si son mejores que la última arma de una mano mejor (o segunda mejor) que tuviste, porque Pawn está buscando mejoras de forma independiente para ambos sets de armas.

Si está deseleccionado, equipar un arma de dos manos evitará que Pawn te muestre mejoras para armas de una mano y vice-versa.]=],
		["OptionsUpgradeTrackingHeader"] = "Comparacion de mejoras",
		["OptionsUpgradeTrackingOff"] = "Comparado con el equipo equipado (recomendado)",
		["OptionsUpgradeTrackingOffTooltip"] = "Pawn mostrara el equipamiento que suponga una mejora respecto al que tengas equipado actualmente",
		["OptionsUpgradeTrackingOn"] = "Rastrear para cada escala (avanzado)",
		["OptionsUpgradeTrackingOnTooltip"] = "(Para usuarios avanzados.) Pawn tratara de rastrear el mejor equipamiento que te hayas equipado, independientemente de cada escala que hayas habilitado, y te mostrara el equipamiento que sea una mejora respecto a estos.",
		["OptionsWelcome"] = "Configura Pawn a tu gusto.  Los cambios se mostrarán de forma inmediata.",
		["ScaleAutoOff"] = "Manual",
		["ScaleAutoOff2"] = "Permitirme manejar las escalas",
		["ScaleAutoOffTooltip"] = "Pawn te permitira elegir manualmente que escalas usar para sus calculos, haciendo posible activar mas de una escala cada vez, añadir escalas personalizadas, y mas.",
		["ScaleAutoOn"] = "Automatico",
		["ScaleAutoOn2"] = "Solo mostrar mi especializacion actual",
		["ScaleAutoOnTooltip"] = "Pawn mostrara automaticamente tu especializacion actual en la descripcion emergente del equipamiento, y lo usara para hacer recomendaciones y sugerir mejoras.",
		["ScaleAutoWelcome"] = [=[Pawn mostrara sugerencias para tu especializacion actual

Si prefieres gestionar las cosas por tu cuenta, haz click en el boton Manual de debajo]=],
		["ScaleChangeColor"] = "Cambiar color",
		["ScaleChangeColorTooltip"] = "Cambia el color en el que aparecen el nombre y el valor de ésta escala en los tooltips de objetos.",
		["ScaleCopy"] = "Copiar",
		["ScaleCopyTooltip"] = "Crea una nueva escala haciendo una copia de ésta.",
		["ScaleDefaults"] = "Predeterminados",
		["ScaleDefaultsTooltip"] = "Crea una nueva escala haciendo una copia de los valores por defecto",
		["ScaleDeleteTooltip"] = [=[Delete this scale. 

This ¡el comando no se puede deshacer!]=],
		["ScaleEmpty"] = "Vacío",
		["ScaleEmptyTooltip"] = "Crea una nueva escala de cero.",
		["ScaleExport"] = "Exportar",
		["ScaleExportTooltip"] = "Comparte tu escala con otros en internet.",
		["ScaleHeader"] = "Gestiona tus escalas de Pawn",
		["ScaleImport"] = "Importar",
		["ScaleImportTooltip"] = "Añade una nueva escala copiando una etiqueta de escala de internet.",
		["ScaleNewHeader"] = "Crear una nueva escala",
		["ScaleRename"] = "Renombrar",
		["ScaleRenameTooltip"] = "Renombra ésta escala.",
		["ScaleSelectorHeader"] = "Selecciona una escala:",
		["ScaleSelectorNoneWarning"] = "Seleccione al menos uno.",
		["ScaleSelectorShowingSuggestionsFor"] = "Mostrando sugerencias para",
		["ScaleSelectorShowScale"] = "Muestra ésta escala en tooltips",
		["ScaleSelectorShowScaleTooltip"] = [=[Cuando esta opción está activada, los valores de ésta escala se mostrarán en los tooltips de objetos de éste personaje.  Cada escala se puede mostrar para uno de tus personajes, varios personajes, o ningún personaje. 

Atajo: Shift+click en una escala]=],
		["ScaleShareHeader"] = "Compartir tus escalas",
		["ScaleTab"] = "Escala",
		["ScaleTypeNormal"] = "Puedes modificar ésta escala en la pestaña Valores.",
		["ScaleTypeReadOnly"] = "Tienes que hacer una copia de ésta escala para poder personalizarla.",
		["ScaleWelcome"] = "Las Escalas son conjuntos de atributos y valores que se usan para asignar puntos de valor a los objetos.  Puedes personalizar tu propia escala y sus valores, o usar los que han creado otros.",
		["SocketingAdvisorButtonTooltip"] = "Haz click para abrir la pestaña de Gemas de Pawn, en la que podrás ver más información sobre las gemas que Pawn recomienda.",
		["SocketingAdvisorHeader"] = "El asesor de ranuras de Pawn sugiere:",
		["SocketingAdvisorIgnoreThisItem"] = "No merece la pena añadir gemas a éste objeto de bajo nivel.  Pero si lo haces, usa éstas:",
		["StarterProvider"] = "Escalas por defecto",
		["ValuesDoNotShowUpgradesFor1H"] = "No mostrar mejoras para objectos de Una Mano",
		["ValuesDoNotShowUpgradesFor2H"] = "No mostrar mejoras para objetos de Dos Manos",
		["ValuesDoNotShowUpgradesTooltip"] = "Habilita ésta opción para no mostrar las mejoras de este tipo de objeto.  Por ejemplo, aunque los tanques paladín pueden usar armas de dos manos, un arma de dos manos nunca en una \"mejora\" para un set de paladín tanque, de forma que Pawn no debería mostrar notificaciones de mejora para esas armas.  De forma similar, los paladines reprensión pueden usar armas de una mano, pero éstas nunca son mejoras.",
		["ValuesFollowSpecialization"] = "Sólo mostrar mejoras para mi especialización de armadura tras el nivel %d",
		["ValuesFollowSpecializationTooltip"] = "Habilita ésta opción para no mostrar mejoras para armaduras que no se corresponden con la especialización de tu clase tras el nivel %d.  Por ejemplo. al nivel %d los paladines sagrados aprenden Especialización en Placas, que incrementa su intelecto un 5%% cuando equipan sólo armaduras de placas.  Cuando se elige ésta opción Pawn nunca considerará tela, cuero o malla como mejoras para paladines sagrados de nivel %d o más.",
		["ValuesHeader"] = "Valores de escala para %s",
		["ValuesIgnoreItemType"] = "Los objetos con éste atributo son inutilizables",
		["ValuesIgnoreStat"] = "Los objetos con éste atributo son inutilizables",
		["ValuesIgnoreStatTooltip"] = "Habilita ésta opción para que cualquier objeto con éste atributo no tenga un valor para ésta escala.  Por ejemplo, los chamanes no pueden equipar placas, asi que en una escala diseñada para un chaman se podría marcar placas como inutilizable de forma que las armaduras de placas no reciban un valor para esa escala.",
		["ValuesNormalize"] = "Normalizar valores (como en Wowhead)",
		["ValuesNormalizeTooltip"] = [=[Habilita ésta opción para dividir el cálculo del valor final para un objeto entre la suma de todos los valores de atributo en tu escala, como se hace en WowHead y Lootzor.  Esto ayuda a compensar situaciones como que una escala tenga valores cercanos a 1 y otra cercanos a 5.  También ayuda a mantener los numeros más cortos y manejables. 

Para más información sobre éstas opciones, consulta el archivo leeme.]=],
		["ValuesRemove"] = "Borrar",
		["ValuesRemoveTooltip"] = "Borra éste atributo de la escala.",
		["ValuesTab"] = "Valores",
		["ValuesWelcome"] = "Puedes personalizar los valores asignados a cada atributo para ésta escala. Para administrar tus escalas o añadir nuevas escalas, usa la pestaña de Escala.",
		["ValuesWelcomeNoScales"] = "No has seleccionado ninguna escala.  Para comenzar, ve a la pestaña de Escala y crea una nueva escala o cópiala de internet.",
		["ValuesWelcomeReadOnly"] = "La escala que has seleccionado no se puede modificar.  Para cambiar estos valores, ve a la pestaña de Escala y haz una copia de ésta escala o crea una escala nueva.",
	}
}

PawnLocal.Specs =
{
	[1] = {
		{ Name="Armas", Icon=132355, Role="DAMAGER" },
		{ Name="Furia", Icon=132347, Role="DAMAGER" },
		{ Name="Protección", Icon=132341, Role="TANK" },
	},
	[2] = {
		{ Name="Sagrado", Icon=135920, Role="HEALER" },
		{ Name="Protección", Icon=236264, Role="TANK" },
		{ Name="Reprensión", Icon=135873, Role="DAMAGER" },
	},
	[3] = {
		{ Name="Bestias", Icon=461112, Role="DAMAGER" },
		{ Name="Puntería", Icon=236179, Role="DAMAGER" },
		{ Name="Supervivencia", Icon=461113, Role="DAMAGER" },
	},
	[4] = {
		{ Name="Asesinato", Icon=236270, Role="DAMAGER" },
		{ Name="Forajido", Icon=236286, Role="DAMAGER" },
		{ Name="Sutileza", Icon=132320, Role="DAMAGER" },
	},
	[5] = {
		{ Name="Disciplina", Icon=135940, Role="HEALER" },
		{ Name="Sagrado", Icon=237542, Role="HEALER" },
		{ Name="Sombra", Icon=136207, Role="DAMAGER" },
	},
	[6] = {
		{ Name="Sangre", Icon=135770, Role="TANK" },
		{ Name="Escarcha", Icon=135773, Role="DAMAGER" },
		{ Name="Profano", Icon=135775, Role="DAMAGER" },
	},
	[7] = {
		{ Name="Elemental", Icon=136048, Role="DAMAGER" },
		{ Name="Mejora", Icon=237581, Role="DAMAGER" },
		{ Name="Restauración", Icon=136052, Role="HEALER" },
	},
	[8] = {
		{ Name="Arcano", Icon=135932, Role="DAMAGER" },
		{ Name="Fuego", Icon=135810, Role="DAMAGER" },
		{ Name="Escarcha", Icon=135846, Role="DAMAGER" },
	},
	[9] = {
		{ Name="Aflicción", Icon=136145, Role="DAMAGER" },
		{ Name="Demonología", Icon=136172, Role="DAMAGER" },
		{ Name="Destrucción", Icon=136186, Role="DAMAGER" },
	},
	[10] = {
		{ Name="Maestro cervecero", Icon=608951, Role="TANK" },
		{ Name="Tejedor de niebla", Icon=608952, Role="HEALER" },
		{ Name="Viajero del viento", Icon=608953, Role="DAMAGER" },
	},
	[11] = {
		{ Name="Equilibrio", Icon=136096, Role="DAMAGER" },
		{ Name="Feral", Icon=132115, Role="DAMAGER" },
		{ Name="Guardián", Icon=132276, Role="TANK" },
		{ Name="Restauración", Icon=136041, Role="HEALER" },
	},
	[12] = {
		{ Name="Devastación", Icon=1247264, Role="DAMAGER" },
		{ Name="Venganza", Icon=1247265, Role="TANK" },
	},
}

end 

if GetLocale() == "esES" then
	PawnUseThisLocalization()
	PawnLocal.ThousandsSeparator = ""
	PawnLocal.DecimalSeparator = ","

	if VgerCore.IsWrath then
		-- Wrath Classic on esES has an incorrect LARGE_NUMBER_SEPERATOR.
		PawnLocal.ThousandsSeparator = ","
	end

	local TooltipParsing_All =
	{
		["Avoidance"] = "^%+# Evasión$",
		["BlockRating2"] = "^Equipar: Aumenta tu índice de bloqueo con escudo en # p%.$",
		["Leech"] = "^%+# Parasitar$",
		["ResilienceRating"] = "^Equipar: Mejora tu índice de temple en #%.$",
		["Mp52"] = "^%+?# maná por 5 s%.$",
		["SpellCritRating2"] = "^Equipar: Mejora el índice de golpe crítico con hechizos en # p%.$",
		["SpellDamageAndHealing"] = "^Equipar: Aumenta la sanación que haces hasta # p%. y el daño que infliges hasta # p%. con todos los hechizos mágicos y efectos%.$",
		["SpellDamageAndHealingEnchant"] = "^%+# sanación y %+# daño de hechizos$",
		["SpellDamageAndHealingShort"] = "^%+# hechizos de sanación y %+# hechizos de daño$",
		["SpellHasteRating"] = "^Equipar: Mejora el índice de celeridad con hechizos en # p%.$",
		["SpellHitRating"] = "^Equipar: Mejora el índice de golpe con hechizos en # p%.$",
		["SpellPenetrationClassic"] = "^Equipar: Reduce las resistencias mágicas de los objetivos de tus hechizos en # p%.$",
	}

	local Key, NewString
	for Key, NewString in pairs(TooltipParsing_All) do
		PawnLocal.TooltipParsing[Key] = NewString
	end

	if VgerCore.IsClassic then

		local TooltipParsing_ClassicEra =
		{
			["Ap2"] = "^Equipar: %+# p%. de poder de ataque%.$",
			["ArcaneResist"] = "^%+?# Arcano Resistencia$",
			["FireResist"] = "^%+?# Fuego Resistencia$",
			["FrostResist"] = "^%+?# Escarcha Resistencia$",
			["NatureResist"] = "^%+?# Naturaleza Resistencia$",
			["ShadowResist"] = "^%+?# Sombras Resistencia$",
			["SpellDamage2"] = "^Equipar: Aumenta el daño y la curación de los hechizos mágicos y los efectos hasta en # p%.$",
			["ArcaneSpellDamage"] = "^%+?# de daño de Hechizos Arcanos$",
			["FireSpellDamage"] = "^%+?# de daño de Hechizos de Fuego$",
			["FrostSpellDamage"] = "^%+?# de daño de Hechizos de Escarcha$",
			["NatureSpellDamage"] = "^%+?# de daño de Hechizos de Naturaleza$",
			["ShadowSpellDamage"] = "^%+?# de daño de Hechizos de Sombras$",
		}

		local Key, NewString
		for Key, NewString in pairs(TooltipParsing_ClassicEra) do
			PawnLocal.TooltipParsing[Key] = NewString
		end
	end

	if VgerCore.IsClassic or VgerCore.IsBurningCrusade or VgerCore.IsWrath then

		local TooltipParsing_Classic =
		{
			["Ap"] = "^%+?# de poder de ataque$",
			["ArcaneSpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos Arcanos y los efectos hasta en # p%.$",
			["Armor"] = "^%+?# armadura$",
			["Block"] = "^%+?# bloquear$",
			["BlockPercent"] = "^Equipar: Aumenta la probabilidad de bloquear ataques con un escudo en un #%%%.$",
			["BlockValue"] = "^Equipar: Aumenta el valor de bloqueo de tu escudo en # p%.$",
			["CritPercent"] = "^Equipar: Mejora tu probabilidad de conseguir un golpe crítico en #%%%.$",
			["DefenseSkill"] = "^Equipar: Defensa aumentada %+#%.$",
			["DodgePercent"] = "^Equipar: Aumenta la probabilidad de esquivar un ataque en un #%%%.$",
			["Dps"] = "^%(# daño por segundo%)$",
			["FeralAp"] = "^Equipar: %+# p%. de poder de ataque solo bajo formas felinas, de oso y de oso nefasto%.$",
			["Healing"] = "^%+# de Hechizos de curación$",
			["Healing2"] = "^Equipar: Aumenta la curación de los hechizos y los efectos hasta en # p%.$",
			["Hit"] = "^Equipar: Mejora tu probabilidad de alcanzar el objetivo en un #%%%.$",
			["Mp52"] = "^%+?# de maná cada 5 seg%.$",
			["SpellCrit"] = "^Equipar: Mejora tu probabilidad de conseguir un golpe crítico en #%%% con los hechizos%.$",
			["SpellHit"] = "^Equipar: Mejora tu probabilidad de alcanzar el objetivo con hechizos en un #%%%.$",
			["WeaponDamage"] = "^# %- # Daño$",
			["WeaponDamageArcane"] = "^# %- # Arcano Daño$",
			["WeaponDamageArcaneExact"] = "^# Arcano Daño$",
			["WeaponDamageExact"] = "^# Daño$",
			["WeaponDamageFire"] = "^# %- # Fuego Daño$",
			["WeaponDamageFireExact"] = "^# Fuego Daño$",
			["WeaponDamageFrost"] = "^# %- # Escarcha Daño$",
			["WeaponDamageFrostExact"] = "^# Escarcha Daño$",
			["WeaponDamageHoly"] = "^# %- # Sagrado Daño$",
			["WeaponDamageHolyExact"] = "^# Sagrado Daño$",
			["WeaponDamageNature"] = "^# %- # Naturaleza Daño$",
			["WeaponDamageNatureExact"] = "^# Naturaleza Daño$",
			["WeaponDamageShadow"] = "^# %- # Sombras Daño$",
			["WeaponDamageShadowExact"] = "^# Sombras Daño$",
			["FireSpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos de Fuego y los efectos hasta en # p%.$",
			["FrostSpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos de Escarcha y los efectos hasta en # p%.$",
			["HolySpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos Sagrados y los efectos hasta en # p%.$",
			["HolySpellDamage3"] = "^Equipar: Aumenta el daño infligido por hechizos y efectos Sagrados hasta en # p%.$",
			["NatureSpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos de Naturaleza y los efectos hasta en # p%.$",
			["ShadowSpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos de Sombras y los efectos hasta en # p%.$",
		}

		local Key, NewString
		for Key, NewString in pairs(TooltipParsing_Classic) do
			PawnLocal.TooltipParsing[Key] = NewString
		end
	end

	if VgerCore.IsBurningCrusade or VgerCore.IsWrath then

		local TooltipParsing_BurningCrusade =
		{
			["SpellDamage2"] = "^Equipar: Aumenta el daño y la sanación de los hechizos mágicos y los efectos hasta en # p%.$",
			["ArcaneSpellDamage"] = "^%+?# daño con hechizos Arcano$",
			["FireSpellDamage"] = "^%+?# daño con hechizos de Fuego$",
			["FrostSpellDamage"] = "^%+?# daño con hechizos de Escarcha$",
			["NatureSpellDamage"] = "^%+?# daño con hechizos de Naturaleza$",
			["ShadowSpellDamage"] = "^%+?# daño con hechizos de las Sombras$",
			["ShadowSpellDamage2"] = "^Equipar: Aumenta el daño causado por los hechizos de las Sombras y los efectos hasta en # p%.$",
		}

		local Key, NewString
		for Key, NewString in pairs(TooltipParsing_BurningCrusade) do
			PawnLocal.TooltipParsing[Key] = NewString
		end
	end

	if VgerCore.IsMainline or VgerCore.IsBurningCrusade or VgerCore.IsWrath then
		PawnLocal.TooltipParsing.Block = "^%+?# bloqueo$"
	end

elseif GetLocale() == "esMX" then
	PawnUseThisLocalization()
	PawnLocal.ThousandsSeparator = ","
	PawnLocal.DecimalSeparator = "."

	if VgerCore.IsBurningCrusade or VgerCore.IsWrath then
		PawnLocal.TooltipParsing.Block = "^%+?# bloqueo$"
	end
end

-- After using this localization or deciding that we don't need it, remove it from memory.
PawnUseThisLocalization = nil
