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

* Class Codex
	* ...but you can work around this by going into Class Codex's options, scrolling to Tooltips, unchecking Stat Priority Ranks, and reloading.
* Combat Numbers Separator + Titan Panel Artifact Power
* FreeUI
* TipTac
* TradeSkillMaster
* Undermine Journal

## Updates

### Version 2.14.4

* Forever: Pawn will now properly recommend one-handed axes to rogues by default instead of marking them as unusable.

### Version 2.14.3

* Forever: Added support for new items with haste in all languages.
* Forever: Added support for new items with bonus armor in French, Portuguese, Russian, European Spanish, Simplified Chinese, and Traditional Chinese.
* Includes fixes for seven obscure bugs that, hopefully, no one ever actually hit. (Thanks Krytical!)
* Items that can only be used by certain classes will no longer appear on the Compare tab as having "special effects" in French.
* Added `/pawn compare both item:12345` as a shortcut for putting the same item into both slots on the Compare tab.

### Version 2.14.2

* Forever: Disabled some hacks that were needed for Classic versions of WoW that don't appear to be necessary for Forever, which should make Pawn work notably faster on Forever.
* Forever: Includes updated default stat weights for most classes and specs, including increases to the weights of weapon DPS and enhancement shaman stats to account for hotfixes.
* Forever: Fixed a typo that was causing fire spell damage to get valued 100× the intended amount for fire mages. (For fire mages, even typos crit.)
* Forever: Added support for many new types of items with various types of spell damage, healing, spell penetration, block value, and all resistances, in all languages.
* Midnight and Forever: Fixed a minor error that occurred when turning the "Show icons next to tooltips" option on or off. (Thanks Angelo!)
* Midnight and Forever: Whenever the game occasionally doesn't let Pawn set up its default key bindings when first creating a new character, Pawn will now try again on your second login.
* Midnight and Forever: Fixed a harmless error that could occur when creating a new character.
* Burning Crusade: Fixed a typo that was causing Jagged Seaspray Emerald to not be recommended in cases where it would have been useful. (Thanks Krytical!)
* Items with set bonuses will no longer appear on the Compare tab as having "special effects" in Traditional Chinese.
* Adjusted the names of several stats on the Values and Compare tabs to match how they appear in game, so players who don't play in English should see more words in their native languages instead of English.

### Version 2.14.1

* Forever: Includes new default stat weights for all classes and specs, curated by HawsJon.

### Version 2.14.0

* Forever: Pawn now fully supports World of Warcraft Forever.
* Forever: Added support for a wide variety of new and changed items in all languages.
	* MP5 and HP5 are not working in French due to a translation bug in the game.
	* If you notice Pawn missing any stats on items on Forever besides those, and they work in other versions of the game, please let me know! I'll need to know the language you're playing in and which item it is: item ID is most helpful, but I can look a name up on Wowhead.
* Forever: Spell hit, spell crit, and spell haste are no longer included on the Weights tab as those stats were removed from items in Forever.

### Older versions

The [version history](Version%20history.md) documents older Pawn updates.

---
by Vger-Azjol-Nerub—[vgermods.com](https://www.vgermods.com)

© 2006-2026 Travis Spomer. This mod is released under the Creative Commons [Attribution-NonCommercial-NoDerivs 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0) license. By using the mod you agree to the terms of the license.
