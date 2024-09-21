ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('dispatch:police')
AddEventHandler('dispatch:police', function(message)
    TriggerClientEvent('esx:showNotification', -1, message)
end)

RegisterServerEvent('heist:chopTruck')
AddEventHandler('heist:chopTruck', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    local rewardMoney = math.random(Config.Rewards.Money.Min, Config.Rewards.Money.Max)

    xPlayer.addMoney(rewardMoney)

    for _, item in ipairs(Config.Rewards.Items) do
        if math.random(0, 1) == 1 then
            xPlayer.addInventoryItem(item, 1)
        end
    end

    TriggerClientEvent('esx:showNotification', xPlayer.source, "You've received $" .. rewardMoney .. " and some items!")
end)
