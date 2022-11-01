VorpInv = exports.vorp_inventory:vorp_inventoryApi()

VORP = exports.vorp_core:vorpAPI()
data = {}
TriggerEvent("vorp_inventory:getData",function(call)
    data = call
end)

-- Quest events below

RegisterNetEvent("quests:InitiateQuests")
AddEventHandler("quests:InitiateQuests", function()
    CreateDialogs()
end)


function CreateDialogs()
    Citizen.CreateThread(function()
        for k, v in pairs(Config.Quests) do

        TriggerEvent("dialog:createDialog", tonumber(Config.StartCount + k), Config.NPCTitle, Config.Quests[k]["Talk"]["Desc"],
        {
        {name = Config.Quests[k]["Talk"]["1"], func = function(source) TriggerClientEvent('quests:StartQuest', source, Config.Quests[k]["Type"], Config.Quests[k]["Reward"], Config.Quests[k]["Xp"], Config.Quests[k]["Goal"]["Name"], Config.Quests[k]["Goal"]["Pos"]) end, focusOFF = true},
        {name = Config.Quests[k]["Talk"]["2"], func = function() end, focusOFF = true},
        {name = Config.Quests[k]["Talk"]["3"], func = function() end, focusOFF = true},
        }
        )


        end
    end)
end

RegisterNetEvent("quests:GatherItem")
AddEventHandler("quests:GatherItem", function(itemName)
    local _source = source
    VorpInv.addItem(source, itemName, 1)
end)

RegisterNetEvent("quests:CheckItem")
AddEventHandler("quests:CheckItem", function(itemName, money, xp, flag)
    local _source = source
	local count = VorpInv.getItemCount(source, itemName)
    if count >=1 then
        VorpInv.subItem(source, itemName, 1) 
        TriggerClientEvent("quests:FinishMissionType1", _source)
        TriggerEvent("vorp:addMoney", _source, 0, money)
        print(money, "here")
    else
        TriggerClientEvent("quests:MissionType1Failure", _source)
    end
end)

RegisterNetEvent("quests:Payout")
AddEventHandler("quests:Payout", function(money, xp)
    local _source = source
    TriggerEvent("vorp:addMoney", _source, 0, money)
    TriggerClientEvent("quests:FinishMissionType2", _source)
end)

RegisterNetEvent("quests:Payout2")
AddEventHandler("quests:Payout2", function(money, xp)
    local _source = source
    TriggerEvent("vorp:addMoney", _source, 0, money)
    TriggerClientEvent("quests:FinishMissionType3", _source)
end)