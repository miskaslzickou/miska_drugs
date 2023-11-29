 --RegisterCommand('testik',function (source, args) TriggerServerEvent("coke_brickbase:giv")end,false)
AddEventHandler("table",function ()
    if lib.progressBar({
        duration = 5000,
        label ='Pokládáš stůl',
        useWhileDead =  false,
        allowRagdoll = false,
        allowCuffed = false,
        allowFalling = false,
        canCancel = true
    
     })then
    local model = 'prop_table_04'
    lib.requestModel(model)
	TriggerServerEvent("table:rem")
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local camRot = GetGameplayCamRot(2)
	
	local camDirection = {
		x = math.cos(math.rad(camRot.z + 90.0)),
		y = math.sin(math.rad(camRot.z + 90.0))
	}
	
	local spawnOffset = 2.0 -- Distance in front of the player
	local spawnCoords = {
		x = coords.x + (camDirection.x * spawnOffset),
		y = coords.y + (camDirection.y * spawnOffset),
		z = coords.z -- You might also add a vertical offset if needed
	}
	
   local heading =  GetEntityHeading(PlayerPedId())
   Table = CreateObject(
		GetHashKey(model),

		spawnCoords.x --[[ number ]], 
		spawnCoords.y --[[ number ]], 
		spawnCoords.z --[[ number ]], 
		true --[[ boolean ]], 
		true --[[ boolean ]], 
		false --[[ boolean ]]
	)
	PlaceObjectOnGroundProperly_2(Table)
	SetEntityHeading(Table,heading
)
	


	Tableoptions = {{
		label = "Vzít stůl",
		icon ="fa-solid fa-flask-vial",
        name ='pickuptable',
		distance = 3,
		onSelect = function(data)
			DeleteObject(data.entity)
			TriggerServerEvent("table:giv")
			
		end
	},{
		label = "Položit mikrovlnku",
		icon ="fa-solid fa-utensils",
        name = 'microwaveplace',
        items ='microwave',
		distance = 3,
		onSelect = function(data)
            TriggerEvent('microwave')
            exports.ox_target:removeLocalEntity(Table,{'pickuptable','chemset','microwaveplace'})

			
			
		end
	},
    {
        label = "Nainstalovat chemický set na stůl",
		icon ="fa-solid fa-flask-vial",
        name ="chemset",
		distance = 3,
        items = 'chemical_set',
		onSelect = function(data)
            local model = "prop_meth_setup_01"
            lib.requestModel(model)
           local coords = GetEntityCoords(Table)
           local heading = GetEntityHeading(Table)
            Chem = CreateObject(GetHashKey(model),

            coords.x --[[ number ]], 
            coords.y --[[ number ]], 
            coords.z+2 --[[ number ]], 
            true --[[ boolean ]], 
            true --[[ boolean ]], 
            false --[[ boolean ]]
        )
        PlaceObjectOnGroundProperly_2(Chem)
        SetEntityHeading(Chem,heading)
        exports.ox_target:removeLocalEntity(Table,'chemset')
		end
    },
  
      
}
	exports.ox_target:addLocalEntity(Table, Tableoptions)

end
end)

AddEventHandler("microwave",function ()
 if lib.progressBar({
    duration = 3000,
    label ='Pokládáš mikrovlnku',
    useWhileDead =  false,
    allowRagdoll = false,
    allowCuffed = false,
    allowFalling = false,
    canCancel = true,
    disable = {
        car = true,
        move = true,
        combat = true
    },

 })then
    

    local model = 'prop_microwave_1'
    lib.requestModel(model)
	TriggerServerEvent("microwave:rem")

	local coords = GetEntityCoords(Table)

	 -- Distance in front of the player
	local spawnCoords = {
		x = coords.x , 
		y = coords.y , 
		z = coords.z +2-- You might also add a vertical offset if needed
	}
	
   local heading =  GetEntityHeading(Table)
   Microwave = CreateObject(
		GetHashKey(model),

		spawnCoords.x --[[ number ]], 
		spawnCoords.y --[[ number ]], 
		spawnCoords.z --[[ number ]], 
		true --[[ boolean ]], 
		true --[[ boolean ]], 
		false --[[ boolean ]]
	)
	PlaceObjectOnGroundProperly_2(Microwave)
	SetEntityHeading(Microwave,heading
)

lib.registerContext({
    id="microwave",
    title = "Mikrovlnka",
    
    canClose = true,
    options = {
        {
            title = "Dát cocain do mikrovlnky",
            icon = "fa-solid fa-capsules",
            description = "Zbaví kokain chemikálií",
        
            onSelect = function()
                if exports.ox_inventory:GetItemCount("coke_brickbase") >= 1   then
                 
                exports.ox_target:removeLocalEntity(Microwave,{'microwavepickup','microwaveuse'})
                  TriggerServerEvent("coke_brickbase:rem")
                  lib.notify({
                                
                    title = 'Počkej 3 minuty než se cocaine zbaví chemikálií',
                   
                    position = 'top-left',
                    style = {
                        backgroundColor = '#141517',
                        color = '#C1C2C5',
                       
                    },
                    icon = 'stopwatch',
                    iconColor = '#00e83e'
                })
             Progress5 = 0
                Citizen.CreateThread(function ()
                    while Progress5 <100 do
                        Citizen.Wait(1000*1.8)
                        Progress5 = Progress5 +1
                        lib.registerContext({
                            id="checkprogress5",
                            title = "Mikrovlnka",
                            
                            canClose = true,
                            options = {
                                {
                                    title = "Zbavení cocainu chemiklálií",
                                    icon = "fa-solid fa-capsules",
                                    progress = Progress5,
                                    colorScheme = 'orange'

}                                  }  })
                        
if Progress5 == 100 then

    exports.ox_target:removeLocalEntity(Microwave,'progress5')
    exports.ox_target:addLocalEntity(Microwave,Cokemicro)
end
                    end
                  
                end)
                Showprogre5 = {
                    label = "Zkontrolovat zbavení chemikálií",
                    icon = "fa-solid fa-hand",
                    name ='progress5',
                    distance = 3,
                    onSelect = function (data)
                    lib.showContext('checkprogress5')
                    end
                }
                exports.ox_target:addLocalEntity(Microwave,Showprogre5)
                
                    Cokemicro ={
                    label = "Vzít si cocain cihlu",
                    icon = "fa-solid fa-hand",
                    name='cokemicro',
                    distance = 3,
                    onSelect = function (data)
                    TriggerServerEvent('coke_brick:giv')
                    exports.ox_target:removeLocalEntity(Microwave,'cokemicro')
                    exports.ox_target:addLocalEntity(Microwave,{MicrowavePickup,Usemicrowave})
                    end
                  } 
                 
              
              
                end  end,
            
        },
       
        
        
    
    
            
            }
        })


	MicrowavePickup = {
		label = "Vzít mikrovlnku",
		icon ="fa-solid fa-utensils",
        name = 'microwavepickup',
		distance = 3,
		onSelect = function(data)
			DeleteObject(data.entity)
			TriggerServerEvent("microwave:giv")
            exports.ox_target:addLocalEntity(Table, Tableoptions)
			
		end
	}
    Usemicrowave ={
		label = "Použít mikrovlnku",
		icon ="fa-solid fa-hand",
        name ='microwaveuse',
		distance = 3,
		onSelect = function(data)
            lib.showContext("microwave")
			
		end
	}
  
	
  
      

	exports.ox_target:addLocalEntity(Microwave, {MicrowavePickup,Usemicrowave})

end
end)
AddEventHandler("bucket",function ()
    if lib.progressBar({
       duration = 3000,
       label ='Pokládáš nádobu',
       useWhileDead =  false,
       allowRagdoll = false,
       allowCuffed = false,
       allowFalling = false,
       disable = {
        car = true,
        move = true,
        combat = true
    },
       canCancel = true
   
    })then
       
   
       local model = 'bkr_prop_weed_bucket_01a'
       lib.requestModel(model)
       TriggerServerEvent("bucket:rem")
       local playerPed = PlayerPedId()
       local coords = GetEntityCoords(playerPed)
       local camRot = GetGameplayCamRot(2)
       
       local camDirection = {
           x = math.cos(math.rad(camRot.z + 90.0)),
           y = math.sin(math.rad(camRot.z + 90.0))
       }
       
       local spawnOffset = 2.0 -- Distance in front of the player
       local spawnCoords = {
           x = coords.x + (camDirection.x * spawnOffset),
           y = coords.y + (camDirection.y * spawnOffset),
           z = coords.z -- You might also add a vertical offset if needed
       }
       
      local heading =  GetEntityHeading(PlayerPedId())
      Bucket = CreateObject(
           GetHashKey(model),
   
           spawnCoords.x --[[ number ]], 
           spawnCoords.y --[[ number ]], 
           spawnCoords.z --[[ number ]], 
           true --[[ boolean ]], 
           true --[[ boolean ]], 
           false --[[ boolean ]]
       )
       PlaceObjectOnGroundProperly_2(Bucket)
       SetEntityHeading(Bucket,heading
   )
 
   
   
       local options = {
           label = "Vzít nádobu",
           icon ="fa-solid fa-bucket",
           distance = 3,
           name='vzitkyblik',
           onSelect = function(data)
               DeleteObject(data.entity)
               TriggerServerEvent("bucket:giv")
               
           end
       }
        CokeBasepour = {
        label = "Nalít cocain base nádoby",
        name = 'pourbase',
        icon ="fa-solid fa-bucket",
        items = 'cocaine',
        distance = 3,
        onSelect = function(data)
            if  exports.ox_inventory:GetItemCount("cocaine", {description = 'Získáno vylouhováním v benzínu a ředěné kyselině a jde z něj vyrobit kokain',label = 'Cocaine Base'}) >= 1000 then
                
          
            if lib.progressCircle( {
            label = "Dáváš cocaine base do kbelíku",
            duration = 5000,
            disable = {
                car = true,
                move = true,
                combat = true
            },}) then
                TriggerServerEvent("coke_base:rem")
                exports.ox_target:removeLocalEntity(Bucket,{'pourbase','vzitkyblik'})
            
            
            end
                Acetone = {
                    label = "Nalít acetone",
                    icon ="fa-solid fa-bottle-droplet",
                    name = 'acetone',
                    distance = 3,
                    items ='acetone',
                    onSelect = function(data)
                       
                        if exports.ox_inventory:GetItemCount("acetone") >= 2 then
                            if lib.progressCircle( {
                                label = "Nalíváš  acetone do kbelíku",
                                duration = 5000,
                                disable = {
                                    car = true,
                                    move = true,
                                    combat = true
                                },
                                anim = {
                                    dict = 'timetable@gardener@filling_can',
                                    clip = 'gar_ig_5_filling_can'
                                },
                               
                            
                            }) then
                            TriggerServerEvent("acetone:rem")
                            exports.ox_target:removeLocalEntity(Bucket,'acetone')
                            lib.notify({
                                
                                title = 'Počkej 3 minuty než se cocaine base vylouhuje',
                               
                                position = 'top-left',
                                style = {
                                    backgroundColor = '#141517',
                                    color = '#C1C2C5',
                                   
                                },
                                icon = 'stopwatch',
                                iconColor = '#00e83e'
                            })
                            Progress3 = 0
                            Citizen.CreateThread(function ()
                                while Progress3 <100 do
                                    Citizen.Wait(1000*1.8)
                                    Progress3 = Progress3 +1
                                    lib.registerContext({
                                        id="checkprogress3",
                                        title = "Kbelík",
                                        
                                        canClose = true,
                                        options = {
                                            {
                                                title = "Louhování  cocaine base",
                                                icon = "fa-solid fa-capsules",
                                                progress = Progress3,
                                                colorScheme = 'orange'
            
            }                                  }  })
                                    
            if Progress3 == 100 then
                exports.ox_target:removeLocalEntity(Bucket,'progress3')
                Citizen.Wait(1000)
                exports.ox_target:addLocalEntity(Bucket,Hydrochloric)
               
           
            end
                                end
                              
                            end)
                            Showprogre3 = {
                                label = "Zkontrolovat louhování",
                                icon = "fa-solid fa-hand",
                                name ='progress3',
                                distance = 3,
                                onSelect = function (data)
                                lib.showContext('checkprogress3')
                                end
                            }
                            exports.ox_target:addLocalEntity(Bucket,Showprogre3)
                            

                         
                         

                            Hydrochloric = {
                                label = "Nalít kyselinu",
                                name ='hydrochloric',
                                icon ="fa-solid fa-bottle-droplet",
                                distance = 3,
                                items ='hydrochloricacid',
                                onSelect = function(data)
                                   
                                    if exports.ox_inventory:GetItemCount("hydrochloricacid") >= 2 then
                                        if lib.progressCircle( {
                                            label = "Nalíváš  kyselinu chlorovodíkovou do kbelíku",
                                            duration = 5000,
                                            disable = {
                                                car = true,
                                                move = true,
                                                combat = true
                                            },
                                            anim = {
                                                dict = 'timetable@gardener@filling_can',
                                                clip = 'gar_ig_5_filling_can'
                                            },
                                           
                                            
                                        
                                        }) then
                                        TriggerServerEvent("hydrochloricconcetrated:rem")
                                        exports.ox_target:removeLocalEntity(Bucket,'hydrochloric')
                                        lib.notify({
                                
                                            title = 'Počkej 5 minut než se cocaine base vylouhuje',
                                           
                                            position = 'top-left',
                                            style = {
                                                backgroundColor = '#141517',
                                                color = '#C1C2C5',
                                               
                                            },
                                            icon = 'stopwatch',
                                            iconColor = '#00e83e'
                                        })
                                        Progress4 = 0
                                        Citizen.CreateThread(function ()
                                            while Progress4 <100 do
                                                Citizen.Wait(1000*3)
                                                Progress4 = Progress4 +1
                                                lib.registerContext({
                                                    id="checkprogress4",
                                                    title = "Kbelík",
                                                    
                                                    canClose = true,
                                                    options = {
                                                        {
                                                            title = "Louhování cocaine base",
                                                            icon = "fa-solid fa-capsules",
                                                            progress = Progress4,
                                                            colorScheme = 'orange'
                        
                        }                                  }  })
                                                
                        if Progress4 == 100 then
                           
                            exports.ox_target:removeLocalEntity(Bucket,'progress4')
                            Citizen.Wait(1000)
                            exports.ox_target:addLocalEntity(Bucket,Finalproduct)
                            
                        end
                                            end
                                          
                                        end)
                                        Showprogre4 = {
                                            label = "Zkontrolovat louhování",
                                            icon = "fa-solid fa-hand",
                                            name ='progress4',
                                            distance = 3,
                                            onSelect = function (data)
                                            lib.showContext('checkprogress4')
                                            end
                                        }
                                        exports.ox_target:addLocalEntity(Bucket,Showprogre4)
                                     
                                        Finalproduct = {
                                                label = "Vzít navlhčenou cihlu",
                                                name ='cocainefinal',
                                                icon ="fa-solid fa-hand",
                                                distance = 3,
                                                onSelect = function(data)
                                                    TriggerServerEvent("coke_brickbase:giv")
                                                    exports.ox_target:removeLocalEntity(Bucket,'cocainefinal')
                                                    exports.ox_target:addLocalEntity(Bucket,options)
                                                end
                                        }
                                       
                                       
                                           
                                            
                                    
                                        end
                                    else
                                        lib.notify({
                                            
                                            title = 'Nemáš dostatek kyseliny ',
                                            description = 'Potřebuješ aspoň 2 láhve',
                                            position = 'top-left',
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
                          
                            
                            }  
                        
                        else
                            lib.notify({
                                            
                                title = 'Nemáš dostatek acetonu ',
                                description = 'Potřebuješ aspoň 2 láhve',
                                position = 'top-left',
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
                }exports.ox_target:addLocalEntity(Bucket,Acetone)
                
            end
           
            
        end
       
    }
   
     
       
     
       exports.ox_target:addLocalEntity(Bucket,CokeBasepour)
   
       exports.ox_target:addLocalEntity(Bucket,options)
   
   end
end)
   AddEventHandler("barrel",function ()
 
    if exports.ox_inventory:GetItemCount("metal_barrel",{description='Plný leteckého paliva',weight=10000}) >= 1 then   
     if lib.progressBar({
       duration = 3000,
       label ='Pokládáš železný sud',
       useWhileDead =  false,
       allowRagdoll = false,
       allowCuffed = false,
       allowFalling = false,
       disable = {
        car = true,
        move = true,
        combat = true
    },
       canCancel = true
   
    })then
       
   
       local model = 'prop_barrel_01a'
       lib.requestModel(model)
       TriggerServerEvent("barrel:rem")
       local playerPed = PlayerPedId()
       local coords = GetEntityCoords(playerPed)
       local camRot = GetGameplayCamRot(2)
       
       local camDirection = {
           x = math.cos(math.rad(camRot.z + 90.0)),
           y = math.sin(math.rad(camRot.z + 90.0))
       }
       
       local spawnOffset = 2.0 -- Distance in front of the player
       local spawnCoords = {
           x = coords.x + (camDirection.x * spawnOffset),
           y = coords.y + (camDirection.y * spawnOffset),
           z = coords.z -- You might also add a vertical offset if needed
       }
       
      local heading =  GetEntityHeading(PlayerPedId())
      Barrel = CreateObject(
           GetHashKey(model),
   
           spawnCoords.x --[[ number ]], 
           spawnCoords.y --[[ number ]], 
           spawnCoords.z --[[ number ]], 
           true --[[ boolean ]], 
           true --[[ boolean ]], 
           false --[[ boolean ]]
       )
       PlaceObjectOnGroundProperly_2(Barrel)
       SetEntityHeading(Barrel,heading
   )
   
  
 
        IsFull = true

    
   
       PickupBarrel = {
           label = "Vzít železný sud",
           icon ="fa-solid fa-bucket",
           distance = 3,
           onSelect = function(data)
               DeleteObject(data.entity)
              
              
                TriggerServerEvent("barrel:giv")
               
               
           end
       }
       CokeOptions={
        label = "Dát koka listy do železného sudu",
        icon ="fa-solid fa-hand",
        name ='cokeleaf',
        distance = 3,
        items = 'coke_leaf',
        onSelect = function(data)
            
            if exports.ox_inventory:GetItemCount("coke_leaf") >= 20 then 
              
                exports.ox_target:removeLocalEntity(Barrel,'cokeleaf')
                TriggerServerEvent('coke_leaf:rem')
               IsFull = false
                lib.notify({
                                
                    title = 'Počkej 5 minut než se listy vylouhují',
                   
                    position = 'top-left',
                    style = {
                        backgroundColor = '#141517',
                        color = '#C1C2C5',
                       
                    },
                    icon = 'stopwatch',
                    iconColor = '#00e83e'
                })
                
                exports.ox_target:removeLocalEntity(Barrel,'cokeleaf')
                Progress = 0
                Citizen.CreateThread(function ()
                 
                    while Progress <100 do
                     
                        Progress = Progress +1
                        lib.registerContext({
                            id="checkprogress",
                            title = "Sud",
                            
                            canClose = true,
                            options = {
                                {
                                    title = "Louhování koka listů",
                                    icon = "fa-solid fa-leaf",
                                    progress = Progress,
                                    colorScheme = 'orange'
                           

}                                  }  })Citizen.Wait(1000*3)  

if Progress == 100 then
    TriggerEvent('cokefinalphase2')
    exports.ox_target:removeLocalEntity(Barrel,'progress')
end
                    end
                  
                end)
                Showprogre = {
                    label = "Zkontrolovat louhování",
                    icon = "fa-solid fa-hand",
                    name ='progress',
                    distance = 3,
                    onSelect = function (data)
                    lib.showContext('checkprogress')
                    end
                }
                exports.ox_target:addLocalEntity(Barrel,Showprogre)
             
           

          
            else
                lib.notify({
                    id = 'coke_error',
                    title = 'Nemáš dostatek listů ',
                    description = 'Potřebuješ aspoň 1 kilo',
                    position = 'top-left',
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
            
            }   
    
        end
    end
    exports.ox_target:addLocalEntity(Barrel,CokeOptions,PickupBarrel
)
end)

AddEventHandler('cokefinalphase',function ()
    
    PickupBase ={     
        label = "Vzít rozpuštěnou směs",
        icon = "fa-solid fa-hand",
        name ='finalphase',
        distance = 3,
        onSelect = function (data)
        TriggerServerEvent("coke_base:giv")
      
        exports.ox_target:addLocalEntity(Barrel,PickupBarrel)
        exports.ox_target:removeLocalEntity(Barrel,'finalphase')
        end}
   
        exports.ox_target:addLocalEntity(Barrel,PickupBase)
end)
AddEventHandler('cokefinalphase2',function ()
Options4 ={
    label = "Nalít ředěnou kyselinu",
    icon = "fa-solid fa-bottle-droplet",
    name='acipour',
    distance = 3,
    items = 'hydrochloricacid',
    onSelect = function (data)
        if exports.ox_inventory:GetItemCount("hydrochloricacid",{description ="Ředěná kyselina leptá o něco méně"}) >= 2 then 
            if lib.progressBar({
                duration = 5000,
                label = 'Naléváš ředěnou kyselinu',
                useWhileDead = false,
                canCancel = true,
                disable = {
                    car = true,
                    move = true,
                },
             
                anim = {
                    dict = 'timetable@gardener@filling_can',
                    clip = 'gar_ig_5_filling_can'
                },
               
             
            }) then
                exports.ox_target:removeLocalEntity(Barrel,'acipour')
                
                TriggerServerEvent("hydrochloric:rem") 
                lib.notify({
                                
                    title = 'Počkej 3 minuty než se listy vylouhují',
                   
                    position = 'top-left',
                    style = {
                        backgroundColor = '#141517',
                        color = '#C1C2C5',
                       
                    },
                    icon = 'stopwatch',
                    iconColor = '#00e83e'
                })
                
              Progress2 = 0
                Citizen.CreateThread(function ()
                    while Progress2 <100 do
                        Citizen.Wait(1000*1.8)
                        Progress2 = Progress2 +1
                        lib.registerContext({
                            id="checkprogress2",
                            title = "Sud",
                            
                            canClose = true,
                            options = {
                                {
                                    title = "Louhování koka listů",
                                    icon = "fa-solid fa-leaf",
                                    progress = Progress2,
                                    colorScheme = 'orange'
                                 


}                                  }  })
                        
if Progress2 == 100 then
    TriggerEvent('cokefinalphase')
    exports.ox_target:removeLocalEntity(Barrel,'progress2')
end
                    end
                  
                end)
                Showprogre2 = {
                    label = "Zkontrolovat louhování",
                    icon = "fa-solid fa-hand",
                    name ='progress2',
                    distance = 3,
                    onSelect = function (data)
                    lib.showContext('checkprogress2')
                    end
                }
                exports.ox_target:addLocalEntity(Barrel,Showprogre2)
             
               
               
                
               end
        else 
           lib.notify({
                
                title = 'Nemáš dostatek kyseliny ',
                description = 'Nemáš ředěnou kyselinu chlorovodíkovou',
                position = 'top-left',
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
}
exports.ox_target:addLocalEntity(Barrel,Options4)
end)
AddEventHandler('cutcoke',function ()
    if  exports.ox_inventory:GetItemCount("coke_brick") >= 1   then
        local knife =exports.ox_inventory:getCurrentWeapon({melee = true,})
        if knife then
        skillCk()
        else
        lib.notify({
                
            title = 'Nemáš žádný nůž v ruce ',
          
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
function skillCk()

    

    Wait(1000)
    local success

  
        success = lib.skillCheck({ 'easy', 'easy', { areaSize = 50, speedMultiplier = 1 }, 'easy' }, { 'w', 'a', 'd' })
        Wait(success and 100 or 800)
    if success then
    TriggerServerEvent('coke:giv')

    end
end
AddEventHandler('cocaine:use',function ()
    TriggerServerEvent('removedrug','cocaine')
    AnimpostfxPlay(
        'CrossLine' --[[ string ]], 
        2*60*1000--[[ integer ]], 
        false --[[ boolean ]]
    )
    



end)