# Pawn

## Find upgrades, do more damage, win.

Pawn helps you find upgrades for your gear.

You can use it if you're just starting out. Pawn comes with advice from the experts (Ask Mr. Robot and others) who know that some stats are far more useful than others. Fire mages want a lot of crit, and shamans don't want strength at all, so just because that new ring has a higher item level, it might not actually be that good for your spec. Pawn will show you green arrows to help you spot the upgrades.

You can also use it if you run your character through simulations and build your own Excel spreadsheets: all of Pawn's stat weights are customizable so you can tailor it for your exact character and preferences. It's useful for all roles, not just DPS.

## Installing

Pawn is installed like any other World of Warcraft addon. If you're not using a tool to manage your addons, extract the Pawn folder from the zip file to your addons folder, which will be in a location like one of these:

```
C:\Users\Public\Games\World of Warcraft\_retail_\Interface\AddOns
C:\Program Files\World of Warcraft\_retail_\Interface\AddOns
C:\Program Files (x86)\World of Warcraft\_retail_\Interface\AddOns
```

## Comparing items

Pawn helps you compare two items. Open the Pawn UI by clicking the button on your character sheet, and then select the Compare tab. Put an equippable item into the slot in the upper-right corner, and Pawn will automatically put the item of the same type that you already have equipped on the left.

You'll get a full breakdown of the differences between the two items, and a total score for each one. Each stat has a "weight" associated with it that represents how important 1 of that stat is compared to 1 of each other stat. If Agility has a weight of 2, and you compare two items that are identical except one has 5 more Agility, then that item will have a score that is 10 points (5 × 2) higher. An upgrade!

### Gems, socket bonuses, enchantments, and reforging

Pawn compares the base versions of items, ignoring your currently socketed gems and enchantments. But the value of a socket will still be taken into account, based on the gems that Pawn suggests that you use, including socket bonuses when relevant. Pawn will suggest which gems to use when you Shift+RightClick the item. On versions of the game where reforging exists, Pawn will also assume that you will reforge the item in the way it recommends, to maximizes its score.

### Comparing an item you don't have yet

You can also compare items you don't have yet.

1. To compare an item that someone links in chat, click the item to open its tooltip, and then right-click on the tooltip.
2. To compare an item being rolled for, right-click on the item.
3. To compare an item that you see in the Encounter Journal, inspecting another player, or elsewhere, you can bind a key to Pawn's Compare tab in the game's key bindings options. (I recommend the `]` right bracket key for "Compare right item".)

### Set bonuses and special effects

Set bonuses and other "special effects" of items that can't be directly converted into a number of stats are ignored by Pawn and won't be factored into upgrade decisions.

## Advanced players

Pawn comes with default stat weights for each spec that are a good starting point for average players who don't care what a simulator is. If you're knowledgeable enough, I strongly recommend that you run your character through sims and get custom stat weights, and then import those into Pawn and use those instead of the defaults you get in Automatic mode. Stat weights are a simplified model for evaluating gear and will never be as good as the advice you can get from a simulator, but Pawn can still be helpful for finding upgrades quickly while you're playing.

Pawn has other options for players who want more math in their Warcraft: check out the Weights tab and the Options tab.

## Contacting the author

* [See all of my addons](https://www.vgermods.com)
* You can reach me on [Facebook](https://www.facebook.com/vgermods)
* Leave a comment on [CurseForge](https://www.curseforge.com/wow/addons/pawn)
* Email vger at vgermods.com

### Reporting issues

If something doesn't seem to be working right, please send me a description of the problem, in addition to:

1. The language that you play WoW in
2. Which version of WoW it is (Midnight, Mists of Pandaria Classic, Classic Era, etc.)
3. The specific items that don't work as expected
4. Your class and spec if you're using the built-in (not custom) stat weights

If you Alt+LeftClick on an item popup (whisper the item to yourself), you'll get a little popup that lets you copy and paste text from the item. At the bottom of that text is a command like this:

```
/pawn tooltip 12345:67::::0::89...
```

If you copy and paste that for me, I can see the same item on my computer, and that's the most helpful thing you can do to help me track down the problem you're seeing. Screenshots are always great too!

### Incompatible addons

Pawn plays along with most other addons, but there are a few that break Pawn that there's no workaround for. Typically this is addons that change the way that stats appear on item tooltips, such as changing "+25 Critical Strike" to "Crit +25".

* Combat Numbers Separator + Titan Panel Artifact Power
* FreeUI
* TipTac
* TradeSkillMaster
* Undermine Journal

## Updates

### Version 2.13.2

* The War Within and Midnight: Pawn's item level upgrade features have been disabled due to some major bugs in WoW 12.0 introduced by the item level squish. I'll monitor the situation and update Pawn again once the bugs in the game are fixed.
* The War Within and Midnight: Fixed an error that could occur when the "Track for each scale (advanced)" option was enabled in Manual mode.
* The War Within and Midnight: Fixed an error that could occur when hovering over an item in your bags with comparison tooltips enabled (or when holding Shift) while in combat.
* Items that bind to your warband until equipped will no longer show up on Pawn's Compare tab as having a "special effect."

### Version 2.13.1

* The War Within and Midnight: Updated all gem recommendations and values of sockets to account for the 12.0 stat and item level squishes.
* Midnight: Added initial support for Midnight gems.
* More optimization of the bag upgrade advisor feature, mostly to prevent it from impacting performance for people who turn the feature off or use custom bag addons.
* Changing the "show item level upgrades" option will now cause items in your bags to gain or lose green arrows immediately when appropriate. (This already worked properly for other options.)
* Pawn can now notify third-party bag addons that something has changed about Pawn's settings and that they should update their green arrows immediately.

### Version 2.13.0

* The War Within and Midnight: Upgrade arrows in your bags are back! I've rebuilt the feature to work as it did back in Legion and Shadowlands.
* Mists of Pandaria Classic: Pawn's bag upgrade advisor now works on Mists Classic! You'll now see green arrows over upgrades in your bags.
* Classic Era and Burning Crusade Classic: Pawn's bag upgrade advisor now works on Classic realms, but it's off by default. You can enable it on Pawn's Options tab.
	* Since Classic Era doesn't have specs or Pawn's Automatic mode and instead has each scale for your class enabled by default, I was worried that the number of green arrows might be overwhelming when playing hybrid classes.
	* Due to a bug in how World of Warcraft Classic handles item stats, there is a chance that this feature on Classic Era might occasionally miss new items. I haven't observed this happening, but let me know if you spot an upgrade that should have a green arrow but doesn't get one until you move it to a new slot.
* Pawn's UI is now a little more Midnighty.
* Improved loading times and memory usage.
* Fixed a problem where other addons using Pawn at unusual times could cause an error.
* Improved how Pawn looks in your addons list.

### Older versions

The [version history](Version%20history.md) documents older Pawn updates.

---
by Vger-Azjol-Nerub—[vgermods.com](https://www.vgermods.com)

© 2006-2026 Travis Spomer. This mod is released under the Creative Commons [Attribution-NonCommercial-NoDerivs 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0) license. By using the mod you agree to the terms of the license.
