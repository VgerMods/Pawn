-- PR: Fix Forever "+N Bonus Armor" not being read
-- Tooltip lines are copied from Wowhead's WoW Forever item tooltips (item IDs noted).
dofile(".tests/harness.lua")

ExpectStats("1717 Double Link Tunic", { "218 Armor", "+9 Defense", "+60 Bonus Armor" },
	{ Armor = 278, DefenseRating = 9 })
ExpectStats("16455 Field Marshal's Leather Mask", { "179 Armor", "+27 Agility", "+31 Stamina", "+50 Bonus Armor" },
	{ Armor = 229, Agility = 27, Stamina = 31 })
ExpectStats("269501 Elven Chain Wristguards", { "34 Armor", "+10 Stamina", "+150 Bonus Armor" },
	{ Armor = 184, Stamina = 10 })
-- Unchanged: a plain armor line.
ExpectStats("Plain armor line", { "835 Armor" }, { Armor = 835 })

Finish()
