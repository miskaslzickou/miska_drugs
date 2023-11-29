
local pedCoords = vec3(355.7140, -796.1744, 28.2956)
lib.requestModel('s_m_m_movprem_01')
local fuelPed =CreatePed(
		1 --[[ integer ]], 
		GetHashKey('s_m_m_movprem_01') --[[ Hash ]], 
		pedCoords.x,pedCoords.y,pedCoords.z, 352.4653, 
		true --[[ boolean ]], 
		true --[[ boolean ]]
	)
    SetEntityInvincible(
	fuelPed --[[ Entity ]], 
	true --[[ boolean ]]
)
--FreezeEntityPosition(fuelPed --[[ Entity ]], true --[[ boolean ]])
SetBlockingOfNonTemporaryEvents(
	fuelPed --[[ Ped ]], 
	true --[[ boolean ]]
)
local resourceName = 	GetCurrentResourceName()
AddEventHandler('onResourceStop', function(resourceName)
    DeletePed(fuelPed)
end)

function bmitemx4(Price,Weapon)
	local count =	lib.inputDialog('Množství', {
			
		{type = 'number',
		
		icon = 'hashtag',min=1,default=1,required= true},
		
	  })
	  Count = table.unpack(count)
	
	local price = Price
	local money = exports.ox_inventory:Search('count','money')
	
		if money >= price *Count then
			
			TriggerServerEvent('c50dd67466812dd7f8e163b4cf948',Count,Weapon,Price)
		else
		local missing_money =price*Count - money
			lib.notify({title = 'Nedostatek peňez',description='Chybí ti ' .. missing_money..'$',type = 'error'})
		end
	
end

 function bmsellx (Price,Item,meta)
	local count =	lib.inputDialog('Množství', {
			
		{type = 'number',
		
		icon = 'hashtag',min=1,default=1,required= true},
		
	  })
	  Count = table.unpack(count)
	local count = Count
	
	local item = exports.ox_inventory:Search('count',Item,meta)
	
	if item >= count then
        

    
			
			TriggerServerEvent('c50dd67466812dd7f8e163b4cf9481',Count,Item,Price,meta)
    else
		
			
    end
 end



        lib.registerContext({
            id="bmsell",
            title = "Black Market",
            menu ="targetbm",
            canClose = true,
            options = {
                {
                    title = "Letecké palivo",
                    icon = "fa-solid fa-gas-pump",
                    image = 'https://encrypted-tbn3.gstatic.com/shopping?q=tbn:ANd9GcQj7XzBwptnsuZ06H4fb5E94jzoX4ZNEz9NkzITbau3Tg-0oYua3VOlfs0IMl44pTEjyfc85aTqXQ6yg_d1uei4mBjFW1qlS3An_RN0UcNOOFL5tnepKemeT07yNwUXLsrP9occGg8&usqp=CAc',
                    description = 'Cena: '..Config.Fuel_Price..'$',
                    onSelect = function()
                        bmsellx(Config.Fuel_Price,'metal_barrel',{description='Plný leteckého paliva',weight=10000})
                    end,
                    
                },
                {
                    title = "Červený fosfor",
                    icon = "fa-solid fa-flask",
                    image = 'https://m.media-amazon.com/images/I/61B2TT8l6BL.jpg',
                    description = 'Cena: '..Config.Phosphorus_Price..'$',
                    onSelect = function()
                        bmitemx4(Config.Phosphorus_Price,'red_phosphorus')
                    end,
                    
                },
                
                
            
            
                    
                    }
                            })
                            
exports.ox_target:addLocalEntity(fuelPed,{
label = "Promluvit s pánem",
name = "blackmsell",
distance = 2,
icon ="fa-solid fa-money-bill",
onSelect = function ()
lib.showContext("bmsell")
end
                            })


exports.ox_target:addBoxZone({
    coords = vec3(-946.8437, -2933.7854, 14.3783),
    size= vec3(1,1,1),
    rotation = 329.3660,
    options = {{
        label ='Načerpat palivo do sudu',
        icon ='fa-solid fa-gas-pump',
        items= 'metal_barrel',
        distance = 3,
        debug = false,
        drawSprite = true,
        onSelect = function ()
            local data = exports['cd_dispatch']:GetPlayerInfo()
            if math.random() <= 0.5 then
                
                
            TriggerServerEvent('cd_dispatch:AddNotification', {
                    job_table = {'police','sheriff'}, 
                    coords = data.coords,
                    title = 'Code 1000 - Krádež Leteckého paliva',
                    message = 'Osoba: '..data.sex..' nelegálně odčerpává palivo  '..data.street, 
                    flash = 0,
                    unique_id = data.unique_id,
                    sound = 1,
                    blip = {
                        sprite = 415, 
                        scale = 1.2, 
                        colour = 3,
                        flashes = false, 
                        text = '911 - Krádež paliva',
                        time = 5,
                        radius = 0,
                    }
                })
            
            end
            if lib.progressCircle({duration = 30000,label = 'Čerpáš palivo',
            position = 'bottom',
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
                combat = true
            },
            anim = {
                dict = 'timetable@gardener@filling_can',
                clip = 'gar_ig_5_filling_can'
            },
            prop = {{
                model = `prop_barrel_01a`,
                pos = vec3(0.22, -0.360, 0.30),
                rot = vec3(210.0,  20.0, 0.0),},
            { model ='prop_cs_fuel_nozle',
              pos = vec3(0.11, 0.02, 0.02),
              rot = vec3( -80.0, -90.0, -65.0)},
             },})then
                TriggerServerEvent('fuelbarrel')
             end    
        end}}})


 