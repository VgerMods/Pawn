-- PR: Fix Forever zone-bonus stat lines not being read
-- The zone sentence is dropped and the line is read at its base value, the same as the line without it.
-- Lines from WoW Forever items 270225, 270275 and 19120 (foreverchanges.pro, datamined via wago.tools).
dofile(".tests/harness.lua")

ExpectSameStats("270225 Jewel of the Guard Captain",
	"Equip: Increases damage and healing done by magical spells and effects by up to 8. This effect is tripled in Forest and Grassland areas.",
	"Equip: Increases damage and healing done by magical spells and effects by up to 8.")
ExpectStats("270225 reads as SpellDamage 8 + Healing 8",
	{ "Equip: Increases damage and healing done by magical spells and effects by up to 8. This effect is tripled in Forest and Grassland areas." },
	{ SpellDamage = 8, Healing = 8 })

ExpectSameStats("270275 Cleansed Vilebranch Medallion / 19120 Rune of the Guard Captain",
	"Equip: +14 Attack Power. This effect is tripled in Forest and Grassland areas.",
	"Equip: +14 Attack Power.")
ExpectStats("270275 reads as Ap 14",
	{ "Equip: +14 Attack Power. This effect is tripled in Forest and Grassland areas." }, { Ap = 14 })

-- Other stat lines with the same kind of zone sentence.
ExpectSameStats("Mana per 5 with a zone sentence",
	"Equip: Restores 3 mana per 5 sec. This effect is tripled in Forest and Grassland areas.",
	"Equip: Restores 3 mana per 5 sec.")
ExpectSameStats("Fire damage with a zone sentence",
	"Equip: Increases damage done by Fire spells and effects by up to 7. This effect is doubled in Volcanic areas.",
	"Equip: Increases damage done by Fire spells and effects by up to 7.")

-- Unchanged: zone sentences on lines Pawn doesn't score still add nothing (249470, 277950).
ExpectNoStats("249470 Molten Heart of the Mountain (Use:)",
	"Use: Increase Attack Power by 55 for 15 sec. This effect is doubled in Volcanic areas. (5 Min Cooldown)")
ExpectNoStats("277950 Wastewanderer Rations",
	"Equip: Your Well Fed buffs metabolize 50% slower. This effect is increased by an additional 50% in Wasteland areas.")
-- Unchanged: the line without the sentence, and the "Stamina +5" normalization.
ExpectStats("Plain spell power line", { "Equip: Increases damage and healing done by magical spells and effects by up to 8." }, { SpellDamage = 8, Healing = 8 })
ExpectStats("Stamina +5 normalization", { "Stamina +5" }, { Stamina = 5 })

Finish()
