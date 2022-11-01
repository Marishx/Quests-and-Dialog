# Added by Marish - was edited to work with VORP

# redemrp_dialog
 a Fallout 4 like dialog/quest system originally made for RedEM:RP, converted to VORP

## 1. Installation
- make sure you have the required vorp framework files.
- add ```ensure dialog``` after ```ensure roleplay``` to either your server.cfg or resources.cfg

## 2. Usage
- Use 'Config.Debug' to enable following commands and prints.
- /getdialog ID - Prints information about dialog in server console.
- /getdialogs - Prints All dialogs in console.
- /opendialog ID - Opens following dialog menu.

## 3. How to create dialog? (server-side)
- Use following example in server-side to create a dialog menu

```
TriggerEvent("dialog:createDialog", ID, "TITLE", "SUBTITLE/CONTEXT",
    {
        {name = "OPTION 1", func = function(source) TriggerEvent('dialog:openDialog', ID , source) end}, -- OPENS NEXT DIALOG
        {name = "OPTION 2", func = function() print("SELECTED 2") end}, -- PRINTING 2 IN CONSOLE
        {name = "OPTION 3", func = function() end, focusOFF = true} -- CLOSES AND UNFOCUSING MENU
    }
)
```

## 4. How to open dialog? (client-side)
- Use following example in client-side to open a dialog menu

```
TriggerServerEvent("dialog:openDialog", ID)
```

- There is also example provided in sv_quest.lua and cl_quest.lua, use **Config.ExampleQuest = true** to enable the example quest(It's enabled by default).

## 5. Credits
https://github.com/amakuu/ <br/>
https://github.com/Ktos93/
