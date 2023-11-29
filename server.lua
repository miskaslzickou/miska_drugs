local Plants = {}  -- Shared table to store information about each plant

-- ... (your existing code) ...

-- Save plant data to the database
function LoadPlantsFromDatabase()
    local query = "SELECT * FROM plants"
    exports.oxmysql:rawExecute(query, {}, function(results)
        for _, row in ipairs(results) do
            local plant = {
                id = row.id,
                waterLevel = row.waterLevel,
                fertilizerLevel = row.fertilizerLevel,
                burning = row.burning == 1,
                x = row.x,
                y = row.y,
                z = row.z,
                growthPercentage = row.growthPercentage or 1,
            }

            TriggerClientEvent('loadplant', -1, plant)
        end
    end)
end

function SavePlantToDatabase(plant)
    local query = "INSERT INTO plants (id, waterLevel, fertilizerLevel, burning, x, y, z, growthPercentage) VALUES (?, ?, ?, ?, ?, ?, ?, ?) ON DUPLICATE KEY UPDATE waterLevel = VALUES(waterLevel), fertilizerLevel = VALUES(fertilizerLevel), burning = VALUES(burning), x = VALUES(x), y = VALUES(y), z = VALUES(z), growthPercentage = VALUES(growthPercentage);"
    exports.oxmysql:rawExecute(query, {plant.id,plant.waterLevel, plant.fertilizerLevel, plant.burning, plant.x, plant.y, plant.z, plant.growthPercentage}, function(affectedRows)
        print("Saved plant data to the database")
    end)
end

RegisterNetEvent('RemovePlantFromDatabase')
AddEventHandler('RemovePlantFromDatabase', function(plantId)
    local query = "DELETE FROM plants WHERE id = ?"
    exports.oxmysql:execute(query, {plantId}, function(affectedRows)
      
    end)
end)

RegisterNetEvent('LoadPlantsFromDatabase')
AddEventHandler('LoadPlantsFromDatabase', function()
    LoadPlantsFromDatabase()
end)
RegisterNetEvent('SavePlantToDatabase')
AddEventHandler('SavePlantToDatabase',function (plant)
    SavePlantToDatabase(plant)
end)
RegisterNetEvent('showtarget:toall')
AddEventHandler('showtarget:toall',function (plantObject,plant)
    TriggerClientEvent('showtarget',-1,plantObject, plant)
end)
RegisterNetEvent('harvest:target')
AddEventHandler('harvest:target',function (plantObject,plant)
    TriggerClientEvent('harvestTarget',-1,plantObject,plant)
end)
RegisterNetEvent('harvest:reward')
AddEventHandler('harvest:reward',function (plant,amount)
    TriggerServerEvent('RemovePlantFromDatabase',plant.id)
    exports.ox_inventory:AddItem(source,'weed',amount)
end)
RegisterNetEvent('plant:gotplanted')
AddEventHandler('plant:gotplanted',function ()
    exports.ox_inventory:RemoveItem(source,'flowerpot',1)
    exports.ox_inventory:RemoveItem(source,'weed_seed',1)
end)
RegisterNetEvent('plant:watered')
AddEventHandler('plant:watered',function ()
    exports.ox_inventory:RemoveItem(source,'water',1)
    
end)

RegisterNetEvent('plant:fertilized')
AddEventHandler('plant:fertilized',function ()
    exports.ox_inventory:RemoveItem(source,'fertilizer',1)
    
end)
RegisterNetEvent('fuelbarrel')
AddEventHandler('fuelbarrel',function ()
    exports.ox_inventory:RemoveItem(source,'metal_barrel',1)
    local meta = {description='Plný leteckého paliva',weight=10000}
     exports.ox_inventory:AddItem(source,'metal_barrel',1,meta)
local player = GetPlayerName(source)    
print(player .. 'získal sud s leteckým palivem')

end)
RegisterNetEvent('c50dd67466812dd7f8e163b4cf9481')
AddEventHandler('c50dd67466812dd7f8e163b4cf9481',function (Count,Item,Price,meta)
        

  
    exports.ox_inventory:RemoveItem(source,Item, Count,meta)
    exports.ox_inventory:AddItem(source,'money', Count*Price)
   

end)
RegisterNetEvent('c50dd67466812dd7f8e163b4cf948')
AddEventHandler('c50dd67466812dd7f8e163b4cf948',function (Count,Weapon,Price)
        
if exports.ox_inventory:CanCarryItem(source, Weapon, Count) then


    exports.ox_inventory:RemoveItem(source,'money', Count*Price)
    exports.ox_inventory:AddItem(source,Weapon, Count,{ registered = false })
    local finalprice = Count*Price
    local playername = GetPlayerName(
		source --[[ string ]]
	)
    print(playername .. ' koupil ' .. Weapon .. ' ' .. Count .. ' kusů za: ' .. finalprice)

end
end)
RegisterNetEvent("table:rem")
AddEventHandler("table:rem",function ()
    exports.ox_inventory:RemoveItem(source,'work_table', 1)
end)
RegisterNetEvent("table:giv")
AddEventHandler("table:giv",function ()
    exports.ox_inventory:AddItem(source,'work_table', 1)
end)
RegisterNetEvent("microwave:giv")
AddEventHandler("microwave:giv",function ()
    exports.ox_inventory:AddItem(source,'microwave', 1)
end)
RegisterNetEvent("microwave:rem")
AddEventHandler("microwave:rem",function ()
    exports.ox_inventory:RemoveItem(source,'microwave', 1)
end)
RegisterNetEvent("bucket:giv")
AddEventHandler("bucket:giv",function ()
    exports.ox_inventory:AddItem(source,'plastic_bucket', 1)
end)
RegisterNetEvent("bucket:rem")
AddEventHandler("bucket:rem",function ()
    exports.ox_inventory:RemoveItem(source,'plastic_bucket', 1)
end)

RegisterNetEvent("barrel:giv")
AddEventHandler("barrel:giv",function (meta)
    exports.ox_inventory:AddItem(source,'metal_barrel', 1,meta)
end)
RegisterNetEvent("barrel:rem")
AddEventHandler("barrel:rem",function ()
    local meta = {description='Plný leteckého paliva',weight=10000}
    exports.ox_inventory:RemoveItem(source,'metal_barrel',1,meta)
end)
RegisterNetEvent("coke_base:giv")
AddEventHandler("coke_base:giv",function ()
    local meta = {description = 'Získáno vylouhováním v benzínu a ředěné kyselině a jde z něj vyrobit kokain',label = 'Cocaine Base',}
    exports.ox_inventory:AddItem(source,'cocaine',1000,meta)
end)
RegisterNetEvent("coke_base:rem")
AddEventHandler("coke_base:rem",function ()
    local meta = {description = 'Získáno vylouhováním v benzínu a ředěné kyselině a jde z něj vyrobit kokain',label = 'Cocaine Base',}
    exports.ox_inventory:RemoveItem(source,'cocaine',1000,meta)
end)


RegisterNetEvent("coke_leaf:rem")
AddEventHandler("coke_leaf:rem",function ()

    exports.ox_inventory:RemoveItem(source,'coke_leaf',20)
end)
RegisterNetEvent("hydrochloric:rem")
AddEventHandler("hydrochloric:rem",function ()

    exports.ox_inventory:RemoveItem(source,'hydrochloricacid',2,{description ="Ředěná kyselina leptá o něco méně"})
end)

RegisterNetEvent("acetone:rem")
AddEventHandler("acetone:rem",function ()

    exports.ox_inventory:RemoveItem(source,'acetone',2)
end)
RegisterNetEvent("coke_brickbase:giv")
AddEventHandler("coke_brickbase:giv",function ()

    exports.ox_inventory:AddItem(source,'coke_brickbase',1)
end)
RegisterNetEvent("coke_brickbase:rem")
AddEventHandler("coke_brickbase:rem",function ()

    exports.ox_inventory:RemoveItem(source,'coke_brickbase',1)
end)
RegisterNetEvent("coke_brick:giv")
AddEventHandler("coke_brick:giv",function ()

    exports.ox_inventory:AddItem(source,'coke_brick',1)
end)
RegisterNetEvent("coke_bush:giv")
AddEventHandler("coke_bush:giv",function ()
    
    exports.ox_inventory:AddItem(source,'coke_leaf',1)
end)

RegisterNetEvent("coke:giv")
AddEventHandler("coke:giv",function ()
    exports.ox_inventory:RemoveItem(source,'coke_brick',1,nil)
    exports.ox_inventory:AddItem(source,'cocaine',1000)
end)
RegisterNetEvent("dealer")
AddEventHandler("dealer",function (drug,quantity,price)
    exports.ox_inventory:RemoveItem(source,drug,quantity)
    exports.ox_inventory:AddItem(source,'money',price)
end)
RegisterNetEvent("dealer2")
AddEventHandler("dealer2",function (drug,quantity)
    exports.ox_inventory:RemoveItem(source,drug,quantity)
    
end)

RegisterNetEvent("stealdrug")
AddEventHandler("stealdrug",function (drug,quantity)
    exports.ox_inventory:AddItem(source,drug,quantity)
    
end)
RegisterNetEvent("removedrug")
AddEventHandler("removedrug",function (drug)
    exports.ox_inventory:RemoveItem(source,drug,1)
    
end)

local label = [[



__  __ _____  _____ _  __             _____  _____  _    _  _____  _____ 
|  \/  |_   _|/ ____| |/ /    /\      |  __ \|  __ \| |  | |/ ____|/ ____|
| \  / | | | | (___ | ' /    /  \     | |  | | |__) | |  | | |  __| (___  
| |\/| | | |  \___ \|  <    / /\ \    | |  | |  _  /| |  | | | |_ |\___ \ 
| |  | |_| |_ ____) | . \  / ____ \   | |__| | | \ \| |__| | |__| |____) |
|_|  |_|_____|_____/|_|\_\/_/    \_\  |_____/|_|  \_\\____/ \_____|_____/ 
                                                                          
    by:Methdealer ]]
Citizen.Wait(6000)
print( label )
