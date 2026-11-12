-- PR: Fix Forever "Restores +N mana per 5 sec." not being read
-- Tooltip lines are copied from Wowhead's WoW Forever item tooltips (item IDs noted).
dofile(".tests/harness.lua")

ExpectStats("16473 Field Marshal's Lamellar Chestplate", {
	"835 Armor", "+21 Strength", "+21 Stamina", "+20 Intellect", "+14 Critical Strike",
	"Restores +5 mana per 5 sec.", "+25 Spell Power",
}, { Armor = 835, Strength = 21, Stamina = 21, Intellect = 20, CritRating = 14, Mp5 = 5, SpellPower = 25 })

ExpectStats("21410 Gavel of Infinite Wisdom", {
	"+10 Stamina", "+11 Intellect", "Restores +4 mana per 5 sec.",
}, { Stamina = 10, Intellect = 11, Mp5 = 4 })

ExpectStats("227148 Lieutenant Commander's Lamellar Pauldrons", {
	"552 Armor", "+21 Stamina", "+14 Intellect", "Restores +3 mana per 5 sec.",
	"Equip: Increases healing done by magical spells and effects by up to 36.",
}, { Armor = 552, Stamina = 21, Intellect = 14, Mp5 = 3, Healing = 36 })

ExpectStats("284268 Furbolg Shaman's Girdle", {
	"88 Armor", "+14 Strength", "Restores +5 mana per 5 sec.",
}, { Armor = 88, Strength = 14, Mp5 = 5 })

-- Unchanged: the classic "Equip:" wording still reads as before.
ExpectStats("Classic wording: Equip: Restores 4 mana per 5 sec.", { "Equip: Restores 4 mana per 5 sec." }, { Mp5 = 4 })

Finish()
