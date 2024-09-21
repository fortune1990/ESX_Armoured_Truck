ESX = exports["es_extended"]:getSharedObject()
local truckSpawned = false
local truckEntity = nil


local chopLocations = Config.ChopLocations
local truckModel = Config.TruckModel
local spawnHeading = Config.SpawnHeading
local minPoliceRequired = Config.MinPoliceRequired 

Citizen.CreateThread(function()
    while ESX == nil do
        Citizen.Wait(0)
    end
end)


function spawnTruck()
    local xPlayers = ESX.GetPlayers()
    local policeCount = 0


    for _, playerId in ipairs(xPlayers) do
        local xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.getJob().name == 'police' then
            policeCount = policeCount + 1
        end
    end


    if policeCount < minPoliceRequired then
        TriggerEvent('esx:showNotification', "Not enough police are on duty to spawn a truck.")
        return
    end

    if not truckSpawned then
        local playerPed = PlayerPedId()


        RequestModel(truckModel)
        while not HasModelLoaded(truckModel) do
            Citizen.Wait(100)
        end


        local randomIndex = math.random(1, #Config.SpawnLocations)
        local spawnLocation = Config.SpawnLocations[randomIndex]


        truckEntity = CreateVehicle(truckModel, spawnLocation.coords, spawnHeading, true, false)
        SetVehicleDoorsLocked(truckEntity, 2) 
        truckSpawned = true

        -- Dispatch message to police
        TriggerServerEvent('dispatch:police', "An armored truck has been reported in the area!")

    end
end


Citizen.CreateThread(function()
    for _, chopLocation in ipairs(Config.ChopLocations) do
        local blip = AddBlipForCoord(chopLocation)
        SetBlipSprite(blip, Config.ChopShopBlip.Sprite) 
        SetBlipColour(blip, Config.ChopShopBlip.Color)   
        SetBlipScale(blip, Config.ChopShopBlip.Scale)    
        SetBlipAsShortRange(blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(Config.ChopShopBlip.Name)  
        EndTextCommandSetBlipName(blip)
    end
end)

-- Draw marker at chop shop locations only during active heist
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if truckSpawned then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, chopLocation in ipairs(chopLocations) do
                if GetDistanceBetweenCoords(playerCoords, chopLocation, true) < 50.0 then
                    -- Draw the marker
                    DrawMarker(1, chopLocation.x, chopLocation.y, chopLocation.z - 1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 1.0, 255, 0, 0, 100, false, true, 2, false, nil, nil, false, false, false, false, false)
                end
            end
        end
    end
end)

-- Deliver the truck to any chop shop
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if truckSpawned and truckEntity ~= nil then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)

            for _, chopLocation in ipairs(chopLocations) do
                if GetDistanceBetweenCoords(playerCoords, chopLocation, true) < 10.0 then
                    ESX.ShowHelpNotification("Press ~INPUT_CONTEXT~ to chop the truck.")

                    if IsControlJustReleased(0, 38) then -- Pressing E
                        DeleteEntity(truckEntity)
                        truckSpawned = false
                        TriggerServerEvent('heist:chopTruck')
                    end
                end
            end
        end
    end
end)
