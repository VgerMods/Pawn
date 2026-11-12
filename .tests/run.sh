#!/bin/sh
# Runs Pawn's real tooltip parser (PawnGetStatsFromTooltip) over Forever tooltip lines, outside the game.
# Needs lua5.1 or luajit.  Usage, from the Pawn folder:  sh .tests/run.sh
cd "$(dirname "$0")/.." || exit 1
LUA=$(command -v luajit || command -v lua5.1 || command -v lua) || { echo "Install luajit or lua5.1"; exit 1; }
Status=0
for Test in .tests/test_*.lua; do
	echo "== $Test"
	"$LUA" "$Test" || Status=1
done
exit $Status
