I don't seem to be able to open issues... I'm getting the following Lua errors on load in TBC Annivesary. They all seem to be pawn related, as I don't get the errors when Pawn is disabled.

I won't open any more issues like this, but strongly suggest allowing people to submit issues in GitHub -- it's the sign of a healthy add-on to be able to have people contribute ideas for improements and report problems.

Cheers!

<img width="660" height="89" alt="image" src="https://github.com/user-attachments/assets/31b46607-b80a-42ac-8730-d564e618cb5d" />

Build: 2.5.5 (65895) - enUS
Add-on: Pawn (2.13.4)

## Reported By
Server: Dreamscythe, Alliance
Character: Gøgøwarrior, Warrior, Human, Level 67
Status: Alive, PVP Disabled, Solo
Zone & Subzone: Shattrath City (1955), Terrace of Light
-- Note this information is pulled from the current character, and may not be relevant.

1x LUA_WARNING: Pawn/PawnUI.xml:281 Frame PawnUI_InventoryPawnButton: Unknown function PawnUIShow in element OnClick

Build: 2.5.5 (65895) - enUS
Add-on: Pawn (2.13.4)

## Reported By
Server: Dreamscythe, Alliance
Character: Gøgøwarrior, Warrior, Human, Level 67
Status: Alive, PVP Disabled, Solo
Zone & Subzone: Shattrath City (1955), Terrace of Light
-- Note this information is pulled from the current character, and may not be relevant.

1x LUA_WARNING: Pawn/Pawn.lua:1 Pawn/Pawn.lua:4242: ')' expected near 'then'

Build: 2.5.5 (65895) - enUS
Add-on: Unknown

## Reported By
Server: Dreamscythe, Alliance
Character: Gøgøwarrior, Warrior, Human, Level 67
Status: Alive, PVP Disabled, Solo
Zone & Subzone: Shattrath City (1955), Terrace of Light
-- Note this information is pulled from the current character, and may not be relevant.

13x [string "*PawnUI.xml:1653_OnEvent"]:1: attempt to call global 'PawnOnEvent' (a nil value)
[*PawnUI.xml:1653_OnEvent]:1: in function <[string "*PawnUI.xml:1653_OnEvent"]:1>


Locals:
self = PawnUIFrame {
 PixelSnapDisabled = true
 Center = Texture {
 }
 RightEdge = Texture {
 }
 BottomEdge = Texture {
 }
 TopRightCorner = Texture {
 }
 BottomRightCorner = Texture {
 }
 BottomLeftCorner = Texture {
 }
 TopEdge = Texture {
 }
 TopLeftCorner = Texture {
 }
 backdropInfo = <table> {
 }
 LeftEdge = Texture {
 }
 numTabs = 7
}
event = "ADDON_LOADED"
(*temporary) = nil
(*temporary) = "ADDON_LOADED"
(*temporary) = "Pawn"
(*temporary) = true
(*temporary) = "attempt to call global 'PawnOnEvent' (a nil value)"


Build: 2.5.5 (65895) - enUS
Add-on: Pawn (2.13.4)

## Reported By
Server: Dreamscythe, Alliance
Character: Gøgøwarrior, Warrior, Human, Level 67
Status: Alive, PVP Disabled, Solo
Zone & Subzone: Shattrath City (1955), Terrace of Light
-- Note this information is pulled from the current character, and may not be relevant.

1x Pawn/ClassicHawsJon.lua:1156: attempt to call global 'PawnAddPluginScaleProvider' (a nil value)


Locals:


Build: 2.5.5 (65895) - enUS
Add-on: Pawn (2.13.4)

## Reported By
Server: Dreamscythe, Alliance
Character: Gøgøwarrior, Warrior, Human, Level 67
Status: Alive, PVP Disabled, Solo
Zone & Subzone: Shattrath City (1955), Terrace of Light
-- Note this information is pulled from the current character, and may not be relevant.

1x Pawn/Pawn.lua:4242: ')' expected near 'then'


Locals:
