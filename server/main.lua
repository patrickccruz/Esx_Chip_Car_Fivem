ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local tunedVehicles = {}

RegisterCommand("tunerlaptop", function(source)
    TriggerClientEvent('qb-tunerchip:client:openChip', source)
end)

-- QBCore.Functions.CreateUseableItem("tunerlaptop", function(source)
--     TriggerClientEvent('qb-tunerchip:client:openChip', source)
-- end)

RegisterNetEvent('qb-tunerchip:server:TuneStatus', function(plate, bool)
    if bool then
        tunedVehicles[plate] = bool
    else
        tunedVehicles[plate] = nil
    end
end)

ESX.RegisterServerCallback('qb-tunerchip:server:HasChip', function(source, cb)
    -- local src = source
    -- local xPlayer = ESX.GetPlayerFromId(src)
    -- local Chip = xPlayer.getInventoryItem('tunerlaptop')

    -- if Chip ~= nil then
    --     cb(true)
    -- else
    --     DropPlayer(src, 'This is not the idea, is it?')
        cb(true)
   -- end
end)

RegisterCommand("nitrous", function(source)
    TriggerClientEvent('smallresource:client:LoadNitrous', source)
end)

ESX.RegisterServerCallback('qb-tunerchip:server:GetStatus', function(_, cb, plate)
    cb(tunedVehicles[plate])
end)

-- QBCore.Functions.CreateUseableItem("nitrous", function(source)
--     TriggerClientEvent('smallresource:client:LoadNitrous', source)
-- end)

RegisterNetEvent('nitrous:server:LoadNitrous', function(Plate)
    TriggerClientEvent('nitrous:client:LoadNitrous', -1, Plate)
end)

RegisterNetEvent('nitrous:server:SyncFlames', function(netId)
    TriggerClientEvent('nitrous:client:SyncFlames', -1, netId, source)
end)

RegisterNetEvent('nitrous:server:UnloadNitrous', function(Plate)
    TriggerClientEvent('nitrous:client:UnloadNitrous', -1, Plate)
end)

RegisterNetEvent('nitrous:server:UpdateNitroLevel', function(Plate, level)
    TriggerClientEvent('nitrous:client:UpdateNitroLevel', -1, Plate, level)
end)

RegisterNetEvent('nitrous:server:StopSync', function(plate)
    TriggerClientEvent('nitrous:client:StopSync', -1, plate)
end)
