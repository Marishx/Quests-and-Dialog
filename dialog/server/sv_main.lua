Dialogs = {}

AddEventHandler("dialog:createDialog", function(id, title, subtitle, options)
    local cDialog = CreateDialog(tonumber(id),title,subtitle,options)
    Dialogs[id] = cDialog
end)

RegisterNetEvent("dialog:listDialog")
AddEventHandler("dialog:listDialog", function(id)
    TriggerEvent("dialog:getDialogFromId", id, function(dialog)
        if dialog then
            local options = dialog.getOptions()
            
            print("^2[RedEM:RP Dialog]^0")
            print("ID: " .. dialog.getId() .. " | Title: " .. dialog.getTitle() .. " | Subtitle: " .. dialog.getSubtitle() .. " | Options: ")

                for k,v in pairs(options) do 
                    print(" - " .. options[k].name)
                end

        else
            print("^8[RedEM:RP Dialog]^0 Dialog with ID: " .. id .. " doesn't exist.")
        end
    end)
end)

RegisterNetEvent("dialog:listDialogs")
AddEventHandler("dialog:listDialogs", function()
    TriggerEvent("dialog:getAllDialogs", function(dialog)
        print("^2[RedEM:RP Dialog]^0")
        for k, v in pairs(dialog) do
            if k then
                print("ID: " .. v.getId() .. " | Title: " .. v.getTitle())
            end
        end
    end)
end)
RegisterNetEvent("dialog:UseOption")
AddEventHandler("dialog:UseOption", function(id, option)
local _source = source
    TriggerEvent("dialog:getDialogFromId", id, function(dialog)
        if dialog then
			local _optionid = option + 1
            local options = dialog.getOptions()
			if options[_optionid].focusOFF then
				TriggerClientEvent("dialog:SetNuiFocus", _source)					
			end
			options[_optionid].func(_source)
        else
            print("^8[RedEM:RP Dialog]^0 Dialog with ID: " .. id .. " doesn't exist.")
        end
    end)
end)

RegisterNetEvent("dialog:openDialog")
AddEventHandler("dialog:openDialog", function(id , src)
	 local _source 
	 if src ~= nil then
	  _source = src
	 else
	     _source = source
	 end
    TriggerEvent("dialog:getDialogFromId", id, function(dialog)
        if dialog then
            TriggerClientEvent("dialog:openDialogClient", _source, dialog.getId(), dialog.getTitle(), dialog.getSubtitle(), dialog.getOptions())
        else
            print("^8[RedEM:RP Dialog]^0 Error! Incorrect dialog ID!")
        end
    end)
end)

function getDialogFromId(id)
	return Dialogs[id]
end

AddEventHandler("dialog:getDialogFromId", function(id, cb)
    if(Dialogs)then
        if(Dialogs[id])then
			cb(Dialogs[id])
        else
			cb(nil)
		end
	else
		cb(nil)
	end
end)

AddEventHandler("dialog:getAllDialogs", function(cb)
    if(Dialogs)then
			cb(Dialogs)
	else
		cb(nil)
	end
end)

TriggerEvent("dialog:createDialog", 1, "EXAMPLE TITLE", "EXAMPLE SUBTITLE",
    {
        {name = "Option1", func = function(source) TriggerEvent('dialog:openDialog', 1 , source) end},
        {name = "Option2",  func = function() print("SELECTED OPTION 2") end},
        {name = "Option3",func =  function() print("SELECTED OPTION 3") end},
        {name = "Option4",func = function() print("SELECTED OPTION 4") end},
        {name = "Option5", func = function() print("SELECTED OPTION 5")end},
        {name = "Option6",  func = function() print("SELECTED OPTION 6") end},
        {name = "Option7",func =  function() print("SELECTED OPTION 7") end},
        {name = "Option8",func = function() print("SELECTED OPTION 8") end}
    }
)

