# VgerCore

VgerCore contains functionality that is shared by mods written by Vger of Azjol-Nerub (US). VgerCore comes with all of the mods that need it, and you don't need to do anything to install, configure, or use VgerCore.

### Mods that need VgerCore

* Divisor
* Gyro
* Hear Kitty
* Pawn

## Contacting the author

* [See all of my addons](https://www.vgermods.com)
* You can reach me on [Facebook](https://www.facebook.com/vgermods)
* Leave a message on [CurseForge](https://www.curseforge.com/wow/addons/pawn)

## Updates

### Version 1.0.21

* Added IsMidnight.

### Version 1.0.20

* Added IsMists.

### Version 1.0.19

* Added IsWarWithin.

### Version 1.0.18

* Added IsCataclysm and ReforgingExists.

### Version 1.0.17

* Adjusted IsWrath to work with today's new version of the Wrath Classic pre-patch.

### Version 1.0.16

* Adjusted IsWrath to work properly on Burning Crusade Classic.

### Version 1.0.15

* Added IsWrath, IsDragonflight, and IsMainline.

### Version 1.0.14

* Added IndexOf.

### Version 1.0.13

* Added IsBurningCrusade.

### Version 1.0.12

* Added IsShadowlands.

### Version 1.0.11

* Added IsClassic.

### Version 1.0.10

* Added Throttle and Delay.

### Version 1.0.9

* Added FormatCompactDecimal.

### Version 1.0.8

* Added FormatShortDecimal and FormatInteger.

### Version 1.0.7

* Updated IsInBattleground to work on patch 4.3.

### Version 1.0.6

* Added the ability to pre-hook insecure functions and scripts. The default is still to post-hook them, like hooksecurefunc.
* Added support in StringFindReverse for find-strings of two characters.

### Version 1.0.5

* Minor performance enhancements.

### Version 1.0.4

* Updated ExecuteChatCommand for patch 3.3.5.

### Version 1.0.3

* Added StringFindReverse.

### Version 1.0.2

* Added RGBToHex and HexToRGB.

### Version 1.0.1

* Added the CaseInsensitiveComparer function for use with table.sort.
* Added more colors.

### Version 1.0

* VgerCore is now at version 1.0! Instead of being a standalone mod, it's now embedded by default. If you have a VgerCore folder in your Interface\AddOns folder, you can now delete it.

### Version 0.4.1

* Added static function support to HookInsecureFunction.
* HookInsecureFunction now supports hooking functions with more than 10 parameters.
* Added HookInsecureScript, which works like the original (Object, FunctionName, Hook) overload of HookInsecureFunction, except instead of a function name, it takes a script handler name.

### Version 0.4

* Added color DarkBlue for Pawn.
* Message, BigMessage, Assert, and Fail will now accept non-string messages (such as booleans and nil).
* Added MultilineMessage to print a large message to the console as a series of individual messages so as to not break scrolling behavior. This is useful for mod usage information, for example.

### Version 0.3.1

* ExecuteChatCommand (used when running macros) will now no longer try to execute protected commands such as /cast. This will prevent WoW from asking to disable VgerCore simply due to user error.

### Version 0.3

* Added new function VgerCore.HookInsecureFunction (analogous to hooksecurefunc in the WoW APIs) for Pawn.

### Version 0.2.1

* Minor update; fully compatible with version 0.2.
* Simplified code to take advantage of new functionality in GetMacroInfo.
* Used by Pawn.

### Version 0.2

* Updated for patch 2.0.
* Fixed a typo that might have manifested itself as an error about "PawnMessage."
* Removed the optional dependency on CT_RaidAssist.
* Used by Hear Kitty.

### Version 0.1

* First version publicly released.
* Used by Gyro.

## The fine print

© 2006-2026 Travis Spomer. This mod is released under the Creative Commons [Attribution-NonCommercial-NoDerivs 3.0](http://creativecommons.org/licenses/by-nc-nd/3.0) license. In short, this means that you can use it, copy it, and share it, but you can't sell it or distribute your own altered versions without permission. By using the mod you agree to the terms of the license. For more information, click the link.
