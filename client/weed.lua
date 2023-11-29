local Plants = {}  -- Shared table to store information about each plant

local plantModels = {
    "bkr_prop_weed_01_small_01c",
    "bkr_prop_weed_01_small_01b",
    "bkr_prop_weed_med_01a",
    "bkr_prop_weed_med_01b",
    "bkr_prop_weed_lrg_01b",
}
local continueGrowing = true

function GrowPlant(plant)
    Citizen.CreateThread(function()
        while continueGrowing and not plant.burning do
            local waterDecrease = 2
            local fertilizerDecrease = 2
          

            if plant.waterLevel >= waterDecrease and plant.fertilizerLevel >= fertilizerDecrease then
                plant.growthPercentage = plant.growthPercentage + 1
                plant.waterLevel = plant.waterLevel - waterDecrease
                plant.fertilizerLevel = plant.fertilizerLevel - fertilizerDecrease

                -- Save plant data to the database after each growth
                TriggerServerEvent('SavePlantToDatabase', plant)

                -- Change model when growth percentage reaches 20, 40, 60, 80, 100
                local newModelIndex = math.ceil(plant.growthPercentage / 20)
                local newModel = GetHashKey(plantModels[newModelIndex])

                RequestModel(newModel)
                while not HasModelLoaded(newModel) do
                    Wait(500)
                end

                DeleteEntity(plant.object)
                plant.object = CreateObject(newModel, plant.x, plant.y, plant.z, true, true, false)
                SetEntityAsMissionEntity(plant.object, true, true)

                PlaceObjectOnGroundProperly(plant.object)
                FreezeEntityPosition(plant.object, true)

                -- Trigger the showtarget event after each growth stage
                TriggerServerEvent('showtarget:toall', plant.object, plant)

                Wait(plant.growthInterval)
            else
                -- If water or fertilizer reaches zero, or the plant is burning, the plant decays
                DeleteEntity(plant.object)
                TriggerServerEvent('RemovePlantFromDatabase', plant.id)
                table.remove(Plants, plant.id)  -- Remove the plant from the table
                continueGrowing = false  -- Exit the loop
            end
        end
    end)
end

function BurnPlant(plant)
    exports.ox_target:removeEntity(NetworkGetNetworkIdFromEntity(plant.object), 'weedgrow')
    local particleDictionary = 'core'
    plant.burning = true
    local particleName = "fire_petroltank_heli"

    local loopAmount = 1
    RequestNamedPtfxAsset(particleDictionary)

    while not HasNamedPtfxAssetLoaded(particleDictionary) do
        Citizen.Wait(0)
    end

    local particleEffects = {}

    for x = 0, loopAmount do
        UseParticleFxAssetNextCall(particleDictionary)
        local particle = StartParticleFxLoopedOnEntity(particleName, plant.object, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.5, false, false, false)
        table.insert(particleEffects, 1, particle)
        Citizen.Wait(0)
    end

    Citizen.Wait(10000)

    for _, particle in pairs(particleEffects) do
        StopParticleFxLooped(particle, true)
    end

    continueGrowing = false  -- Stop the plant from growing

    -- Delete the plant model
    DeleteEntity(plant.object)

    -- Save the updated plant data to the database
    TriggerServerEvent('RemovePlantFromDatabase', plant.id)


    return plant.burning
end

function WaterPlant(plant)
    if exports.ox_inventory:Search('count','water') >=1 then
        if lib.progressBar({
            duration = 5000,
            label = 'Zalíváš..',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
          
        }) then  
    plant.waterLevel = math.min(plant.waterLevel + 10, 100)
    TriggerServerEvent('SavePlantToDatabase', plant)
    else
        lib.notify({
            
            title = 'Nemáš vodu',
            description = 'Potřebuješ alespoň jednu láhev vody',
            position = 'top',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
                ['.description'] = {
                  color = '#909296'
                }
            },
            icon = 'ban',
            iconColor = '#C53030'
        })
    end
end
end

function FertilizePlant(plant)
    if exports.ox_inventory:Search('count','fertilizer') >=1 then
        if lib.progressBar({
            duration = 5000,
            label = 'Hnojíš..',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
          
        }) then  
    plant.fertilizerLevel = math.min(plant.fertilizerLevel + 10, 100)
    TriggerServerEvent('SavePlantToDatabase',plant)
    TriggerServerEvent('plant:fertilized')
else
    lib.notify({
        
        title = 'Nemáš hnojivo',
        description = 'Potřebuješ alespoň jednu nádobu hnojiva',
        position = 'top',
        style = {
            backgroundColor = '#141517',
            color = '#C1C2C5',
            ['.description'] = {
              color = '#909296'
            }
        },
        icon = 'ban',
        iconColor = '#C53030'
    })
end
end
end


RegisterNetEvent('harvestTarget')
AddEventHandler('harvestTarget',function (plantObject,plant)
    exports.ox_target:addEntity(NetworkGetNetworkIdFromEntity(plantObject), {
        label = "zkontrolovat stav kytky",
        icon = "fa-solid fa-leaf",
        name = "weedharvest",
        distance = 3,
        onSelect = function(data)
            if lib.progressBar({
                duration = 4000,
                label = 'Sklízíš kytku',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                },
                anim = {
                    dict = 'amb@world_human_gardener_plant@male@idle_a',
                    clip = 'idle_c'
                }}) then  
            DeleteEntity(plantObject)

            TriggerServerEvent('harvest:reward',plant)
                end
        end,
    })
end)
RegisterNetEvent('loadplant')
AddEventHandler('loadplant', function(plant)
    local PlantCoords = vec3(plant.x, plant.y, plant.z)
    local plant2 = {
        id = plant.id,
        coords = PlantCoords,
        growthInterval = 60000,
        waterLevel = plant.waterLevel,
        fertilizerLevel = plant.fertilizerLevel,
        object = nil,
        burning = plant.burning,
        x = PlantCoords.x,
        y = PlantCoords.y,
        z = PlantCoords.z,
        growthPercentage = plant.growthPercentage
    }
    GrowPlant(plant2)
end)

function PlantIsPlanted(RandomNum, PlantCoords)
    local newPlant = {
        id = RandomNum,
        coords = PlantCoords,
        growthInterval = 30000,
        waterLevel = 10,
        fertilizerLevel = 10,
        object = nil,
        burning = false,
        x = PlantCoords.x,
        y = PlantCoords.y,
        z = PlantCoords.z,
        growthPercentage = 0 -- Set the initial growth percentage
    }
    table.insert(Plants, newPlant)
    GrowPlant(newPlant)
end

RegisterNetEvent("plant:planted")
AddEventHandler("plant:planted", function(RandomNum, PlantCoords)
    PlantIsPlanted(RandomNum, PlantCoords)
end)
  

function StartGrowingPlant(plant)
    lib.registerContext({
        id = "growing_" .. plant.id,
        title = "Kytka " .. plant.id,
        options = {
            {
                title = "Růst",
                icon = "leaf",
                description = plant.growthPercentage .. '%',
                progress = plant.growthPercentage,
                colorScheme = "green",
            },
            {
                title = "Zalít",
                icon = "faucet-drip",
                description = plant.waterLevel .. '%',
                progress = plant.waterLevel,
                colorScheme = "blue",
                onSelect = function()
                    WaterPlant(plant)
                end,
            },
            {
                title = "Pohnojit",
                icon = "droplet",
                description = plant.fertilizerLevel .. '%',
                progress = plant.fertilizerLevel,
                colorScheme = "teal",
                onSelect = function()
                    FertilizePlant(plant)
                end,
            },
            {
                title = "Upálit kytku",
                icon = "fire",
                onSelect = function()
                    BurnPlant(plant)
                end,
            },
        },
    })

    lib.showContext("growing_" .. plant.id)
end

RegisterNetEvent('showtarget')
AddEventHandler('showtarget', function(plantObject, plant)
    
        exports.ox_target:addEntity(NetworkGetNetworkIdFromEntity(plantObject), {
            label = "zkontrolovat stav kytky",
            icon = "fa-solid fa-leaf",
            name = "weedgrow",
            distance = 3,
            onSelect = function(data)
                StartGrowingPlant(plant)
            end,
        })
    
end)

AddEventHandler("weedplant", function()
 local potCount =   exports.ox_inventory:Search('count','flowerpot')
    if  potCount <=1   then
        
        if lib.progressBar({
            duration = 4000,
            label = 'Sadíš kytku',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
            },
            anim = {
                dict = 'amb@world_human_gardener_plant@male@idle_a',
                clip = 'idle_c'
            }}) then  
    local time = GetGameTimer()
    local xx = math.tointeger(time)
    RandomNum = math.randomseed(xx)
    local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local camRot = GetGameplayCamRot(2)
	
	local camDirection = {
		x = math.cos(math.rad(camRot.z + 90.0)),
		y = math.sin(math.rad(camRot.z + 90.0))
	}
	
	local spawnOffset = 0.50 -- Distance in front of the player
	local spawnCoords = {
		x = coords.x + (camDirection.x * spawnOffset),
		y = coords.y + (camDirection.y * spawnOffset),
		z = coords.z -- You might also add a vertical offset if needed
	}
   
    TriggerServerEvent('plant:gotplanted')
    TriggerEvent("plant:planted", RandomNum,spawnCoords
)
    else
        lib.notify({
            id = 'weed_error',
            title = 'Nemáš květináč',
            position = 'top-left',
            style = {
                backgroundColor = '#141517',
                color = '#C1C2C5',
              
            },
            icon = 'ban',
              iconColor = '#C53030'
          })
        end
end
end)

RegisterCommand('loadweedPlants', function()
    TriggerServerEvent('LoadPlantsFromDatabase')
end, false)