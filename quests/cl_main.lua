local TalkGroup = GetRandomIntInRange(0, 0xffffff)
local hasquestitem = false
local active = false
local started = false
local gathered = false
local delivered = false
local BackBlipShowing = false
local TalkPrompt
local blip
local animal
local Killblip
local NPCMissions = {}

function TalkPrompt()
    Citizen.CreateThread(function()
        local str = Config.Presstext
        local wait = 0
        TalkPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(TalkPrompt, 0xC7B5340A)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(TalkPrompt, str)
        PromptSetEnabled(TalkPrompt, true)
        PromptSetVisible(TalkPrompt, true)
        PromptSetHoldMode(TalkPrompt, true)
        PromptSetGroup(TalkPrompt, TalkGroup)
        PromptRegisterEnd(TalkPrompt)
    end)
end

Citizen.CreateThread(function()
    TalkPrompt()
    TriggerServerEvent("quests:InitiateQuests")
    Debug("Initating Quests...")
        while true do
            Wait(0)
            local pedCoords = GetEntityCoords(PlayerPedId())
            for k, v in pairs(Config.Npc) do
                local dist = Vdist(pedCoords , Config.Npc[k]["Pos"].x, Config.Npc[k]["Pos"].y, Config.Npc[k]["Pos"].z)
                if dist <= 3.0 then
                    if not active and not started then
                        local Nazwa  = CreateVarString(10, 'LITERAL_STRING', Config.Talktext .. " ~t6~" .. Config.Npc[k]["Name"] .. "~q~")
                        PromptSetActiveGroupThisFrame(TalkGroup, Nazwa) 
                            if PromptHasHoldModeCompleted(TalkPrompt) then
                                active = true
                                Debug("Talking with " .. Config.Npc[k]["Name"])
                                Debug("Dialog ID: " .. Config.Npc[k]["Missions"][math.random(1, #Config.Npc[k]["Missions"])])
                                TriggerServerEvent("dialog:openDialog", tonumber(Config.StartCount + Config.Npc[k]["Missions"][math.random(1, #Config.Npc[k]["Missions"])]))
                                Wait(1000)
                                active = false
                            end
                    end
                end
            end
        end
end)

-- CREATE NPCS
Citizen.CreateThread(function()
    for z, x in pairs(Config.Npc) do
    while not HasModelLoaded( GetHashKey(Config.Npc[z]["Model"]) ) do
        Wait(500)
        modelrequest( GetHashKey(Config.Npc[z]["Model"]) )
    end
    local npc = CreatePed(GetHashKey(Config.Npc[z]["Model"]), Config.Npc[z]["Pos"].x, Config.Npc[z]["Pos"].y, Config.Npc[z]["Pos"].z, Config.Npc[z]["Heading"], false, false, 0, 0)
    while not DoesEntityExist(npc) do
        Wait(300)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npc, true)
    Citizen.InvokeNative(0x9F7794730795E019,npc,17,true)
    Citizen.InvokeNative(0x9F7794730795E019,npc,77,true)
    FreezeEntityPosition(npc, true)
    SetEntityInvincible(npc, true)
    TaskStandStill(npc, -1)
    Wait(100)
    SET_PED_RELATIONSHIP_GROUP_HASH(npc, GetHashKey(Config.Npc[z]["Model"]))
    Citizen.InvokeNative(0xBF25EB89375A37AD,GetHashKey(Config.Npc[z]["Model"]), 0, GetPedRelationshipGroupHash(PlayerPedId()))
    SetEntityCanBeDamagedByRelationshipGroup(npc, false, `PLAYER`)
    SetEntityAsMissionEntity(npc, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(Config.Npc[z]["Model"]))
    end
end)

-- CREATE NPC BLIPS
Citizen.CreateThread(function()
    Wait(100)
    if Config.ShowBlips then
        for b, n in pairs(Config.Npc) do
            local blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, Config.Npc[b]["Pos"].x, Config.Npc[b]["Pos"].y, Config.Npc[b]["Pos"].z)
            SetBlipSprite(blip, Config.Npc[b]["Blip"])
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.Npc[b]["Name"])
        end
    end
end)


RegisterNetEvent('quests:StartQuest')
AddEventHandler('quests:StartQuest', function(var1, var2, var3, var4, var5)
    Debug("Starting Quest... type: ".. var1 .. " reward: " .. var2 .. " xp: " .. var3 .. " goal: " .. var4 .. " pos: " .. var5)
	local savedCoords = GetEntityCoords(PlayerPedId())
    if var1 == 1 then
        Debug("ITEM QUEST")
		StartMissionType1(savedCoords, var2, var3, var4, var5)
    elseif var1 == 2 then
        Debug("KILL QUEST")
		StartMissionType2(savedCoords, var2, var3, var4, var5)
    elseif var1 == 3 then
        Debug("SKIN QUEST")
		StartMissionType3(savedCoords, var2, var3, var4, var5)
    else
        Debug("INCORRECT TYPE OF QUEST")
    end
end)

-- FUNCTIONS PT 2 --

function ShowItemBlip(var)
    local _var = var
    Citizen.CreateThread(function()
        if Config.ItemShow == 1 and not gathered then
            AllowSonarBlips(true)
            while not gathered do
                Wait(1000)
                ForceSonarBlipsThisFrame()
                TriggerSonarBlip(348490638, _var.x, _var.y, _var.z)
            end
        elseif Config.ItemShow == 2 and not gathered then
            blip = Citizen.InvokeNative(0x554d9d53f696d002, 1664425300, _var.x, _var.y, _var.z)
            SetBlipSprite(blip, Config.ItemBlipSprite)
            Citizen.InvokeNative(0x9CB1A1623062F402, blip, Config.ItemBlipNameOnMap)
        end
    end)
end

function ShowBackBlip(var)
    if not BackBlipShowing then
    local _var = var
    BackBlipShowing = true
    Citizen.CreateThread(function()
        if Config.ShowBackBlip == 1 and not delivered then
            AllowSonarBlips(true)
            while not delivered do
                Wait(1000)
                ForceSonarBlipsThisFrame()
                TriggerSonarBlip(348490638, _var.x, _var.y, _var.z)
            end
        end
    end)
    end
end

function ShowItemCircle(var)
    local _var = var
    Citizen.CreateThread(function()
        while not gathered do
            Wait(0)
            if Config.ShowCircle and not gathered then
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, _var.x, _var.y, _var.z, 1.0, 1.0, 1.0, 0.0, 0.0, 0.0, 2.0, 2.0, 1.5, Config.CircleColor[1], Config.CircleColor[2], Config.CircleColor[3], Config.CircleColor[4], true, false, 1, true)
            end
        end
    end)
end


RegisterNetEvent('quests:FinishMissionType1')
AddEventHandler('quests:FinishMissionType1', function()
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.DeliveryInfo, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent('quests:MissionType1Failure')
AddEventHandler('quests:MissionType1Failure', function()
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.FailureInfo, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent('quests:FinishMissionType2')
AddEventHandler('quests:FinishMissionType2', function()
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.DeliveryInfo, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

RegisterNetEvent('quests:FinishMissionType3')
AddEventHandler('quests:FinishMissionType3', function()
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.DeliveryInfo, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
end)

-- MISSIONS --

function StartMissionType1(var1, var2, var3, var4, var5)
    Debug("Mission Type 1 started properly..")
    started = true
    gathered = false
    
    local _var1 = var1
    local _var2 = var2
    local _var3 = var3
    local _var4 = var4
    local _var5 = var5
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Info, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
    Citizen.CreateThread(function()
            Wait(0)
            ShowItemBlip(_var5)
            ShowItemCircle(_var5)
        while started do
            Wait(0)
            local coords2 = GetEntityCoords(PlayerPedId())
            local distance = Vdist(coords2.x, coords2.y, coords2.z, _var5.x, _var5.y, _var5.z)
            if distance < 2.5 and not gathered then
                gathered = true
                TriggerServerEvent("quests:GatherItem", _var4)
                Debug("Gathered ITEM: " .. _var4)
            elseif gathered and not delivered then
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Info2, Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)
                RemoveBlip(blip)
                ShowBackBlip(_var1)
                local distance2 = Vdist(coords2.x, coords2.y, coords2.z, _var1.x, _var1.y, _var1.z)
                if distance2 < 2.5 and gathered and not delivered then
                    Debug("Delivered ITEM: " .. _var4 .. " At POS: " .. _var1)
                    TriggerServerEvent("quests:CheckItem", _var4, _var2, _var3)
                    delivered = true
                    BackBlipShowing = false
                    Wait(Config.Cooldown)
                    started = false
                    gathered = false
                    delivered = false
                end
            end
        end
    end)
end

function StartMissionType2(var1, var2, var3, var4, var5)
    Debug("Mission Type 2 started properly..")
    started = true
    gathered = false
    local _var1 = var1
    local _var2 = var2
    local _var3 = var3
    local _var4 = var4
    local _var5 = var5
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Info, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
    Citizen.CreateThread(function()
        if started and not gathered then
            while not HasModelLoaded( GetHashKey(_var4) ) do
                Wait(500)
                modelrequest( GetHashKey(_var4) )
            end
            animal = CreatePed(GetHashKey(_var4), _var5.x, _var5.y, _var5.z, true, true)
                while not DoesEntityExist(animal) do
                        Wait(300)
                  end
            Citizen.InvokeNative(0x283978A15512B2FE, animal, true)
            Killblip = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, animal)
            Citizen.InvokeNative(0x9CB1A1623062F402, Killblip, 'Cel')
            SetModelAsNoLongerNeeded(GetHashKey(_var4))
        end
        while started do
            Wait(0)
            local coords3 = GetEntityCoords(PlayerPedId())
            if IsEntityDead(animal) and not delivered then
                gathered = true
                RemoveBlip(Killblip)
                ShowBackBlip(_var1)
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Info3, Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)

                local distance3 = Vdist(coords3.x, coords3.y, coords3.z, _var1.x, _var1.y, _var1.z)
                if distance3 < 2.5 and gathered and not delivered then
                    delivered = true
                    BackBlipShowing = false
                    Debug("Mission Type 2 Completed: " .. _var4 .. " At POS: " .. _var1)
                    TriggerServerEvent("quests:Payout", _var2, _var3)
                    Wait(Config.Cooldown)
                    started = false
                    gathered = false
                    delivered = false
                end
            end
        end
    end)
end

function StartMissionType3(var1, var2, var3, var4, var5)
    Debug("Mission Type 3 started properly..")
    started = true
    gathered = false
    local _var1 = var1
    local _var2 = var2
    local _var3 = var3
    local _var4 = var4
    local _var5 = var5
    local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Info, Citizen.ResultAsLong())
    Citizen.InvokeNative(0xFA233F8FE190514C, str)
    Citizen.InvokeNative(0xE9990552DEC71600)
    Citizen.CreateThread(function()
        if started and not gathered then
            while not HasModelLoaded( GetHashKey(_var4) ) do
                Wait(500)
                modelrequest( GetHashKey(_var4) )
            end
            animal = CreatePed(GetHashKey(_var4), _var5.x, _var5.y, _var5.z, true, true)
                while not DoesEntityExist(animal) do
                        Wait(300)
                  end
            Citizen.InvokeNative(0x283978A15512B2FE, animal, true)
            Killblip = Citizen.InvokeNative(0x23f74c2fda6e7c61, 953018525, animal)
            Citizen.InvokeNative(0x9CB1A1623062F402, Killblip, 'Cel')
            SetModelAsNoLongerNeeded(GetHashKey(_var4))
        end
        while started do
            Wait(0)
            local coords3 = GetEntityCoords(PlayerPedId())
            local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
            local model = GetEntityModel(holding)
            if IsEntityDead(animal) and not delivered then
                gathered = true
                RemoveBlip(Killblip)
                ShowBackBlip(_var1)
                local str = Citizen.InvokeNative(0xFA925AC00EB830B9, 10, "LITERAL_STRING", Config.Info4, Citizen.ResultAsLong())
                Citizen.InvokeNative(0xFA233F8FE190514C, str)
                Citizen.InvokeNative(0xE9990552DEC71600)

                local distance3 = Vdist(coords3.x, coords3.y, coords3.z, _var1.x, _var1.y, _var1.z)
                if distance3 < 2.5 and gathered and not delivered then
                    holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
                    model = GetEntityModel(holding)
                    if holding ~= false then
                    entity = holding
                    Citizen.InvokeNative(0xC7F0B43DCDC57E3D, PlayerPedId(), entity, GetEntityCoords(PlayerPedId()), 10.0, true)
                    Wait(500)
                    SetEntityAsMissionEntity(entity, true, true)
                    Wait(500)
                    DetachEntity(entity, 1, 1)
                    Wait(500)
                    SetEntityCoords(entity, 0.0,0.0,0.0)
                    Wait(500)
                    DeleteEntity(entity)
                    Wait(300)
                    delivered = true
                    BackBlipShowing = false
                    Debug("Mission Type 3 Completed: " .. _var4 .. " At POS: " .. _var1)
                    TriggerServerEvent("quests:Payout2", _var2, _var3)
                    Wait(Config.Cooldown)
                    started = false
                    gathered = false
                    delivered = false
                    end
                end
            end
        end
    end)
end



-- FUNCTIONS --

function Debug(var)
    if Config.Debug then
    print(var)
    end
end

function SET_PED_RELATIONSHIP_GROUP_HASH ( iVar0, iParam0 )
    return Citizen.InvokeNative( 0xC80A74AC829DDD92, iVar0, _GET_DEFAULT_RELATIONSHIP_GROUP_HASH( iParam0 ) )
end

function _GET_DEFAULT_RELATIONSHIP_GROUP_HASH ( iParam0 )
    return Citizen.InvokeNative( 0x3CC4A718C258BDD0 , iParam0 );
end

function modelrequest( model )
    Citizen.CreateThread(function()
        RequestModel( model )
    end)
end

local function DisplayHelp( _message, x, y, w, h, enableShadow, col1, col2, col3, a, centre )

    local str = CreateVarString(10, "LITERAL_STRING", _message, Citizen.ResultAsLong())

    SetTextScale(w, h)
    SetTextColor(col1, col2, col3, a)

    SetTextCentre(centre)

    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end

    Citizen.InvokeNative(0xADA9255D, 10);

    DisplayText(str, x, y)

end
