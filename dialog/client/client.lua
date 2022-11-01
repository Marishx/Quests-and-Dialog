RegisterCommand("getdialog", function(source, args, rawCommand)
    if Config.Debug then
    print("Dialog get incoming...")
    TriggerServerEvent('dialog:listDialog', tonumber(args[1]))
    end
end)

RegisterCommand("getdialogs", function(source, args, rawCommand)
    if Config.Debug then
    print("Dialog get all incoming...")
    TriggerServerEvent('dialog:listDialogs')
    end
end)

RegisterCommand("opendialog", function(source, args, rawCommand)
    if Config.Debug then
    print("Dialog open incoming...")
    TriggerServerEvent('dialog:openDialog', tonumber(args[1]))
    end
end)

RegisterNetEvent("dialog:openDialogClient")
AddEventHandler("dialog:openDialogClient", function(id, title, subtitle, options)
    -- DEBUG PRINTS --
    if Config.Debug then
    print("Opening Dialog...")
    print("ID: " .. id)
    print("Title: " .. title)
    print("Subtitle: " .. subtitle)
    print("Options: ")
    for k,v in pairs(options) do 
        print(" - " .. v.name)
    end
end
    -- END OF PRINTS --

        SendNUIMessage({
            type = 'showdialog',
            id = id,
            title = title,
            subtitle = subtitle,
            options = options
        })
        SetNuiFocus(true, true)
end)

RegisterNUICallback('close', function(data, cb)
    SetNuiFocus(false)
end)
RegisterNetEvent("dialog:SetNuiFocus")
AddEventHandler("dialog:SetNuiFocus", function()
    SetNuiFocus(false)
end)
RegisterNUICallback('choice', function(data, cb)
    if Config.Debug then
print(data.dialogid)
    end
 TriggerServerEvent('dialog:UseOption', tonumber(data.dialogid), tonumber(data.optionid))
end)
