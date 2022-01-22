local QBCore = exports['qb-core']:GetCoreObject()

local chicken = vehicleBaseRepairCost

RegisterNetEvent('qb-customs:updateRepairCost', function(cost)
    chicken = cost
end)

RegisterNetEvent("updateVehicle", function(myCar)
    local src = source
    if IsVehicleOwned(myCar.plate) then
        exports.oxmysql:execute('UPDATE player_vehicles SET mods = ? WHERE plate = ?', {json.encode(myCar), myCar.plate})
    end
end)

function IsVehicleOwned(plate)
    local retval = false
    local result = exports.oxmysql:scalarSync('SELECT plate FROM player_vehicles WHERE plate = ?', {plate})
    if result then
        retval = true
    end
    return retval
end

-- RegisterNetEvent('qb-customs:attemptPurchase', function(type, upgradeLevel, name, plate, vehicleName, colorCategory, colorType, entity)
--     local src = source
--     TriggerEvent('qb-vehicleparts:server:createOrder', src, type, upgradeLevel, name, plate, vehicleName, colorCategory, colorType, entity)
-- end)

QBCore.Functions.CreateCallback('qb-customs:server:getCurrentMechanic', function(source, cb)
    local amount = 0
    local players = QBCore.Functions.GetQBPlayers()
    for k, v in pairs(players) do
        if v.PlayerData.job.name == "mechanic" and v.PlayerData.job.onduty then
            amount = amount + 1
        end
    end
    cb(amount)
end)
