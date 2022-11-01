# Added by Marish - was edited to work with VORP

# redemrp_dialog
 a Fallout 4 like dialog/quest system for RedEM:RP

## 1. Installation
- Be sure you have RedEM and RedEM:RP Installed
if not --> [RedEM](https://github.com/kanersps/redem) --> [RedEM:RP](https://github.com/RedEM-RP/redem_roleplay)
- Clone redem_dialog into [redemrp] folder
- add ```ensure redemrp_dialog``` after ```ensure redem_roleplay```

## 2. Usage
- Use 'Config.Debug' to enable following commands and prints.
- /getdialog ID - Prints information about dialog in server console.
- /getdialogs - Prints All dialogs in console.
- /opendialog ID - Opens following dialog menu.

## 3. How to create dialog? (server-side)
- Use following example in server-side to create a dialog menu

```
TriggerEvent("redemrp_dialog:createDialog", ID, "TITLE", "SUBTITLE/CONTEXT",
    {
        {name = "OPTION 1", func = function(source) TriggerEvent('redemrp_dialog:openDialog', ID , source) end}, -- OPENS NEXT DIALOG
        {name = "OPTION 2", func = function() print("SELECTED 2") end}, -- PRINTING 2 IN CONSOLE
        {name = "OPTION 3", func = function() end, focusOFF = true} -- CLOSES AND UNFOCUSING MENU
    }
)
```

## 4. How to open dialog? (client-side)
- Use following example in client-side to open a dialog menu

```
TriggerServerEvent("redemrp_dialog:openDialog", ID)
```

- There is also example provided in sv_quest.lua and cl_quest.lua, use **Config.ExampleQuest = true** to enable the example quest(It's enabled by default).
- For any support join our discord - https://discord.gg/FKH4uwb

## 5. Credits
https://github.com/amakuu/ <br/>
https://github.com/Ktos93/
