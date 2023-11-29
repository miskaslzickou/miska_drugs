

PlayerPed =PlayerPedId()

function WeedQuant ()
	Weed = exports.ox_inventory:Search('count', 'weed')
	if Weed == 1  then
		WeedQuantity =1
	elseif Weed == 2  then
		WeedQuantity = 2
	elseif Weed >2 and Weed <5 then
		WeedQuantity = 3
	elseif Weed >=6  and Weed < 10 then
		WeedQuantity = 5
	elseif Weed >=10  and Weed <=20 then
		WeedQuantity = 8
	elseif Weed > 20 then
		WeedQuantity = 12
	
	else
		WeedQuantity = 0
	end
	return WeedQuantity
end
function WeedPric ()
	Weed = exports.ox_inventory:Search('count', 'weed')
	if Weed == 1  then
		if math.random() <= 0.25 then
		WeedPrice = 10
		else 
			WeedPrice = 7
		end
		return WeedPrice
	elseif Weed == 2  then
		if math.random() <= 0.25 then
			WeedPrice = 11
			else
				WeedPrice = 12
			end
			return WeedPrice
	elseif Weed >2 and Weed <5 then
		if math.random() <= 0.25 then
			WeedPrice = 13
			else
				WeedPrice = 10
			end
			return WeedPrice
	elseif Weed >=6  and Weed <= 10 then
		if math.random() <= 0.25 then
			WeedPrice = 11
			else
				WeedPrice = 14
			end
			return WeedPrice
	elseif Weed >=10  and Weed <=20 then
		if math.random() <= 0.25 then
			WeedPrice = 13
			else
				WeedPrice = 15
			end
			return WeedPrice
	elseif Weed > 20 then
		Weedprice = 17
			
	else
	WeedPrice = 10
	end
	return WeedPrice
end
function CocainQuant ()
	Cocaine = exports.ox_inventory:Search('count', 'cocaine')
	if Cocaine == 1  then
		CocaineQuantity = 1
	elseif Cocaine == 2  then
		CocaineQuantity = 2
	elseif Cocaine >2 and Cocaine <=5 then
		CocaineQuantity = 3
	elseif Cocaine >=6  and Cocaine <= 10 then
		CocaineQuantity = 3
	elseif Cocaine >=10  and Cocaine <=20 then

		CocaineQuantity = 8
	elseif Cocaine > 20 then
	CocaineQuantity = 12

	else 
		CocaineQuantity = 0
	end
	return CocaineQuantity
end
function CocainPric ()
	Cocaine = exports.ox_inventory:Search('count','cocaine')
	
	if Cocaine == 1  then
		if math.random() <= 0.25 then
		CocainePrice = 10
		else 
			CocainePrice = 7
		end
		return CocainePrice
	elseif Cocaine == 2  then
		if math.random() <= 0.25 then
			CocainePrice = 11
			else
				CocainePrice = 12
			end
			return CocainePrice
	elseif Cocaine >2 and Cocaine <5 then
		if math.random() <= 0.25 then
			CocainePrice = 13
			else
				CocainePrice = 10
			end
			return CocainePrice
	elseif Cocaine >=6  and Cocaine <= 10 then
		if math.random() <= 0.25 then
			CocainePrice = 11
			else
				CocainePrice = 14
			end
			return Cocaine
	elseif Cocaine >=10  and Cocaine <=20 then
		if math.random() <= 0.25 then
			CocainePrice = 13
			else
				CocainePrice = 15
			end
			return CocainePrice
	elseif Cocaine > 20 then
		CocainePrice = 17
		
		return CocainePrice
	elseif Cocaine == nil or Cocaine == 0 then
		CocainePrice = 0
		return CocainePrice
	end

	return CocainePrice
end
function MethQuant ()
	Meth = exports.ox_inventory:Search('count', 'meth')
	if Meth == 1  then
		MethQuantity =1
	elseif Meth == 2  then
		MethQuantity = 2
	elseif Meth >2 and Meth <=5 then
		MethQuantity = 3
	elseif Meth >=6  and Meth <= 10 then
		MethQuantity = 5
	elseif Meth >10  and Meth <=20 then

		MethQuantity = 8
	elseif Meth > 20 then
		return MethQuantity
	elseif Meth == nil or Meth == 0 then
		MethQuantity = 0
		return MethQuantity
		
	end
	return MethQuantity
end
function MethPric ()
	Meth = exports.ox_inventory:Search('count','meth')
	if Meth == 1  then
		if math.random() <= 0.25 then
		MethPrice = 10
		elseif math.random() <= 0.50 then
			MethPrice = 7
		end
		return MethPrice
	elseif Meth == 2  then
		if math.random() <= 0.25 then
			MethPrice = 11
			elseif math.random() <= 0.50 then
				MethPrice = 12
			end
			return MethPrice
	elseif Meth >2 and Meth <5 then
		if math.random() <= 0.25 then
			MethPrice = 13
			elseif math.random <= 0.50 then
				MethPrice = 10
			end
			return MethPrice
	elseif Meth >6  and Meth < 10 then
		if math.random() <= 0.25 then
			MethPrice = 11
			elseif math.random ()<= 0.50 then
				MethPrice = 14
			end
			return MethPrice
	elseif Meth >10  and Meth <=20 then
		if math.random() <= 0.25 then
			MethPrice = 13
			elseif math.random() <= 0.50 then
				MethPrice = 15
			end
			return MethPrice
	else
			MethPrice = 0
		return MethPrice
	end


end
function WeedAgreedPric()
	if math.random()>0.50  then
	 WeedAgreedPrice = 4
	else
		WeedAgreedPrice = 3
	end
return WeedAgreedPrice
end
function CocaineAgreedPric()
	if math.random()>0.50  then
	 CocaineAgreedPrice = 4
	else
		CocaineAgreedPrice = 3
	end
return CocaineAgreedPrice
end
function MethAgreedPric()
	if math.random()>0.50  then
	 MethAgreedPrice = 4
	else
		MethAgreedPrice = 3
	end
return MethAgreedPrice
end
function GoTodealer(data)
	Citizen.CreateThread(function ()
		local playerheading =GetEntityHeading(PlayerPedId())
		SetEntityHeading(data.entity,playerheading+180)
						SetBlockingOfNonTemporaryEvents(
		data.entity --[[ Ped ]], 
		true --[[ boolean ]]
	)
						TaskStandStill(
		data.entity --[[ Ped ]], 
		-1 --[[ integer ]]
	)		
		Weed = exports.ox_inventory:Search('count', 'weed')
		Cocaine = exports.ox_inventory:Search('count','cocaine')
		Meth = exports.ox_inventory:Search('count','meth')
	
	WeedQuantity= WeedQuant()
	WeedPrice = WeedPric()
	CocaineQuantity = CocainQuant()
	CocainePrice = CocainPric()
	MethQuantity = MethQuant()
	MethPrice = MethPric()
	WeedAgreedPrice = WeedAgreedPric()
	CocaineAgreedPrice = CocaineAgreedPric()
	MethAgreedPrice = MethAgreedPric()
		lib.registerContext({
			id = 'dealing',
			title = 'Místní obyvatel',
			onExit = function ()
				TaskWanderStandard(
	data.entity --[[ Ped ]], 
	10.0 --[[ number ]], 
	10 --[[ integer ]])
exports.ox_target:removeLocalEntity(data.entity,'deal')
			end,
			options = {
		
			  {
				title = 'Tráva',
				icon = 'cannabis',
				menu = 'weedmenu',
				
				
		
				
			
				
			  },
			  {
				title = 'Kokain',
				icon = 'capsules',
				menu ='cocainmenu',
				
			  },
			  {
				title = 'Pervitin',
				icon = 'capsules',
				menu ='methmenu',
				
			  },
			
			
			
			}
		  })

	  lib.registerContext({
		id ='weedmenu',
		title ='Tráva',
		onExit = function ()
			TaskWanderStandard(
data.entity --[[ Ped ]], 
10.0 --[[ number ]], 
10 --[[ integer ]])
SetBlockingOfNonTemporaryEvents(
	data.entity --[[ Ped ]], 
	false --[[ boolean ]]
)
exports.ox_target:removeLocalEntity(data.entity,'deal')
		end,
		options = {
			{
				title ='Prodat trávu',
				icon = 'money-bill',
				description ='Prodat trávu ' .. WeedQuantity .. ' gramů za ' .. (WeedQuantity * WeedPrice),
				
				onSelect = function ()
					
					

					Weed = exports.ox_inventory:Search('count', 'weed')
				if Weed >= 1 then
			
					if	lib.progressCircle( {
						label = "Prodáváš",
						duration = 5000,
						canCancel = false,
						disable = {
							car = true,
							move = true,
							combat = true,
						},
						anim = {
							dict = 'pickup_object',
							clip = 'putdown_low'
						},

					}) then
						TaskPlayAnim(data.entity,'pickup_object','putdown_low',8.0,8.0,-1,0,1,true,true,true)
							if math.random() <= 0.55 then
							
							TriggerServerEvent('dealer','weed',WeedQuantity,WeedQuantity*WeedPrice)	
							exports.ox_target:removeLocalEntity(data.entity,'deal')	
						
							TaskWanderStandard(data.entity --[[ Ped ]], 10.0 --[[ number ]], 10 --[[ integer ]])	
							SetBlockingOfNonTemporaryEvents(
								data.entity --[[ Ped ]], 
								false --[[ boolean ]]
							)
							else
							
								TriggerServerEvent('dealer2','weed',WeedQuantity) 
								exports.ox_target:removeLocalEntity(data.entity,'deal')
							
								TaskReactAndFleePed(data.entity,PlayerPed)  --[[ Ped ]] ---[[ Ped ]]
								SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
									exports.ox_target:addLocalEntity(data.entity,{label = "Vzít si zpět drogy",
									icon = "fa-solid fa-money-bill",
									name='stealdrug',
									distance = 3,
									
									onSelect = function (data)
										if IsPedDeadOrDying(data.entity,true)then
											if	lib.progressCircle( {
												label = "Prohledáváš",
												duration = 5000,
												canCancel = false,
												disable = {
													car = true,
													move = true,
													combat = true,
												},
												anim = {
													dict = 'anim@gangops@facility@servers@bodysearch@',
													clip = 'player_search'
												},
						
											}) then
											TriggerServerEvent('stealdrug','weed',WeedQuantity)
											exports.ox_target:removeLocalEntity(data.entity,'stealdrug')
											end
										end
									end
									})

							end
						end
					else 
						lib.notify({id = 'nodrug',
   title = 'Nemáš trávu',
   
   position = 'top',
   style = {
	   backgroundColor = '#141517',
	   color = '#C1C2C5',
	   ['.description'] = {
		 color = '#909296'
	   }
   },
   icon = 'ban',
   iconColor = '#C53030'})


					end
				end
				
			},
			{
				title = 'Vyjednat cenu',
				icon ='comments-dollar',
				onSelect = function ()
					if math.random() >= 0.30 then
						lib.showContext('weedmenuprice')
					else
						SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
								lib.notify({id = 'nodrug',
   title = 'Nehce vyjednávat',
   
   position = 'top',
   style = {
	   backgroundColor = '#141517',
	   color = '#C1C2C5',
	   ['.description'] = {
		 color = '#909296'
	   }
   },
   icon = 'ban',
   iconColor = '#C53030'})
							exports.ox_target:removeLocalEntity(data.entity,'deal')	
							TaskWanderStandard(
								data.entity --[[ Ped ]], 
								10.0 --[[ number ]], 
								10 --[[ integer ]])	 
					end
				end
				
					
				
			}
		}
	  })
	  lib.registerContext({
		id ='weedmenuprice',
		title ='Tráva',
		onExit = function ()
			TaskWanderStandard(
data.entity --[[ Ped ]], 
10.0 --[[ number ]], 
10 --[[ integer ]])
exports.ox_target:removeLocalEntity(data.entity,'deal')
		end,
		options = {
			{
				title ='Prodat trávu',
				icon = 'money-bill',
				description ='Prodat trávu ' .. WeedQuantity .. ' gramů za ' .. (WeedQuantity * WeedPrice+WeedAgreedPrice),
				onSelect = function ()
					
					Weed = exports.ox_inventory:Search('count','weed')
				if Weed >= 1 then
			
					if	lib.progressCircle( {
						label = "Prodáváš",
						duration = 5000,
						canCancel = false,
						disable = {
							car = true,
							move = true,
							combat = true,
						},
						anim = {
							dict = 'pickup_object',
							clip = 'putdown_low'
						},

					}) then
						TaskPlayAnim(data.entity,'pickup_object','putdown_low',8.0,8.0,-1,0,1,true,true,true)
							if math.random() <= 0.85 then
								SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
							TriggerServerEvent('dealer','weed',WeedQuantity,WeedQuantity*WeedPrice+WeedAgreedPrice)	
							exports.ox_target:removeLocalEntity(data.entity,'deal')
						
							TaskWanderStandard(data.entity --[[ Ped ]], 10.0 --[[ number ]],10 --[[ integer ]])	
							else
							
								TriggerServerEvent('dealer2','weed',WeedQuantity) 
								exports.ox_target:removeLocalEntity(data.entity,'deal')
						
								TaskReactAndFleePed(data.entity,PlayerPed)  --[[ Ped ]] ---[[ Ped ]]
								SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
									exports.ox_target:addLocalEntity(data.entity,{label = "Vzít si zpět drogy",
									icon = "fa-solid fa-money-bill",
									name='deal',
									distance = 3,
									
									onSelect = function (data)
										if IsPedDeadOrDying(data.entity,true)then
											if	lib.progressCircle( {
												label = "Prohledáváš",
												duration = 5000,
												canCancel = false,
												disable = {
													car = true,
													move = true,
													combat = true,
												},
												anim = {
													dict = 'anim@gangops@facility@servers@bodysearch@',
													clip = 'player_search'
												},
						
											}) then
											TriggerServerEvent('stealdrug','weed',WeedQuantity)
											end
										end
									end
									})

							end
						end
					else 
						SetBlockingOfNonTemporaryEvents(
										data.entity --[[ Ped ]], 
										false --[[ boolean ]]
									)
								
									exports.ox_target:removeLocalEntity(data.entity,'deal')
									TaskWanderStandard(
										data.entity --[[ Ped ]], 
										40.0 --[[ number ]], 
										10 --[[ integer ]])
						lib.notify({id = 'nodrug',
   title = 'Nemáš trávu',
   
   position = 'top',
   style = {
	   backgroundColor = '#141517',
	   color = '#C1C2C5',
	   ['.description'] = {
		 color = '#909296'
	   }
   },
   icon = 'ban',
   iconColor = '#C53030'})


					end
				end
				
			},
			{
				title = 'Vyjednat cenu',
				icon ='comments-dollar',
				disabled = true,
				
			}
		}
	})
	  lib.registerContext({
		id ='cocainmenu',
		title ='Kokain',
		onExit = function ()
			TaskWanderStandard(
data.entity --[[ Ped ]], 
10.0 --[[ number ]], 
10 --[[ integer ]])
SetBlockingOfNonTemporaryEvents(
	data.entity --[[ Ped ]], 
	false --[[ boolean ]]
)
exports.ox_target:removeLocalEntity(data.entity,'deal')
		end,
		options = {
			{
				title ='Prodat kokain',
				icon = 'money-bill',
				description ='Prodat kokain ' .. CocaineQuantity .. ' gramů za ' .. (CocaineQuantity * CocainePrice),
			
				onSelect = function ()
				
					Cocaine = exports.ox_inventory:Search('count', 'cocaine')
					if Cocaine >= 1 then
				
						if	lib.progressCircle( {
							label = "Prodáváš",
							duration = 5000,
							canCancel = false,
							disable = {
								car = true,
								move = true,
								combat = true,
							},
							anim = {
								dict = 'pickup_object',
								clip = 'putdown_low'
							},
	
						}) then
							TaskPlayAnim(data.entity,'pickup_object','putdown_low',8.0,8.0,-1,0,1,true,true,true)
								if math.random() <= 0.85 then
									SetBlockingOfNonTemporaryEvents(
										data.entity --[[ Ped ]], 
										false --[[ boolean ]]
									)
								TriggerServerEvent('dealer','cocaine',CocaineQuantity,CocaineQuantity*CocainePrice)	
								exports.ox_target:removeLocalEntity(data.entity,'deal')	
								TaskWanderStandard(
									data.entity --[[ Ped ]], 
									10.0 --[[ number ]], 
									10 --[[ integer ]])	
								else
								
									TriggerServerEvent('dealer2','cocaine',CocaineQuantity) 
									exports.ox_target:removeLocalEntity(data.entity,'deal')
									TaskReactAndFleePed(data.entity,PlayerPed)  --[[ Ped ]] ---[[ Ped ]]
								SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
										exports.ox_target:addLocalEntity(data.entity,{label = "Vzít si zpět drogy",
										icon = "fa-solid fa-money-bill",
										name='deal',
										distance = 3,
										
										onSelect = function (data)
											if IsPedDeadOrDying(data.entity,true)then
												if	lib.progressCircle( {
													label = "Prohledáváš",
													duration = 5000,
													canCancel = false,
													disable = {
														car = true,
														move = true,
														combat = true,
													},
													anim = {
														dict = 'anim@gangops@facility@servers@bodysearch@',
														clip = 'player_search'
													},
							
												}) then
												TriggerServerEvent('stealdrug','cocaine',CocaineQuantity)
												end
											end
										end
										})
	
								end
							end
						else 
							SetBlockingOfNonTemporaryEvents(
								data.entity --[[ Ped ]], 
								false --[[ boolean ]]
							)
						
							exports.ox_target:removeLocalEntity(data.entity,'deal')
							TaskWanderStandard(
								data.entity --[[ Ped ]], 
								40.0 --[[ number ]], 
								10 --[[ integer ]])
							lib.notify({id = 'nodrug',
	   title = 'Nemáš  kokain',
	   
	   position = 'top',
	   style = {
		   backgroundColor = '#141517',
		   color = '#C1C2C5',
		   ['.description'] = {
			 color = '#909296'
		   }
	   },
	   icon = 'ban',
	   iconColor = '#C53030'})
	
	
						end
					
				
				end
				
			},
			{
				title = 'Vyjednat cenu',
				icon ='comments-dollar',
				onSelect = function ()
					if math.random() >= 0.30 then
					
						lib.showContext('cocainmenuprice')
					else
						SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
								lib.notify({id = 'nodrug',
   title = 'Nehce vyjednávat',
   
   position = 'top',
   style = {
	   backgroundColor = '#141517',
	   color = '#C1C2C5',
	   ['.description'] = {
		 color = '#909296'
	   }
   },
   icon = 'ban',
   iconColor = '#C53030'})
							exports.ox_target:removeLocalEntity(data.entity,'deal')	
							TaskWanderStandard(
								data.entity --[[ Ped ]], 
								10.0 --[[ number ]], 
								10 --[[ integer ]])	 
					end
						
					
					
					
					
				
				end
				
					
				
			}
		}
	  })
	  lib.registerContext({
		id ='cocainmenuprice',
		title ='Kokain',
		onExit = function ()
			TaskWanderStandard(
data.entity --[[ Ped ]], 
10.0 --[[ number ]], 
10 --[[ integer ]])
SetBlockingOfNonTemporaryEvents(
	data.entity --[[ Ped ]], 
	false --[[ boolean ]]
)
exports.ox_target:removeLocalEntity(data.entity,'deal')
		end,
		options = {
			{
				title ='Prodat kokain',
				icon = 'money-bill',
				description = 'Prodat kokain' .. CocaineQuantity .. ' gramů za ' .. (CocaineQuantity * CocainePrice),
				onSelect = function ()
				
					Cocaine = exports.ox_inventory:Search('count', 'cocaine')
					if Cocaine >= 1 then
				
						if	lib.progressCircle( {
							label = "Prodáváš",
							duration = 5000,
							canCancel = false,
							disable = {
								car = true,
								move = true,
								combat = true,
							},
							anim = {
								dict = 'pickup_object',
								clip = 'putdown_low'
							},
	
						}) then
							TaskPlayAnim(data.entity,'pickup_object','putdown_low',8.0,8.0,-1,0,1,true,true,true)
								if math.random() <= 0.85 then
									SetBlockingOfNonTemporaryEvents(
										data.entity --[[ Ped ]], 
										false --[[ boolean ]]
									)
								TriggerServerEvent('dealer','cocaine',CocaineQuantity,CocaineQuantity*CocainePrice+CocaineAgreedPrice)	
								exports.ox_target:removeLocalEntity(data.entity,'deal')	
								TaskWanderStandard(
									data.entity --[[ Ped ]], 
									10.0 --[[ number ]], 
									10 --[[ integer ]])	
								else
								
									TriggerServerEvent('dealer2','cocaine',CocaineQuantity) 
									exports.ox_target:removeLocalEntity(data.entity,'deal')
									TaskReactAndFleePed(data.entity,PlayerPed)  --[[ Ped ]] ---[[ Ped ]]
									SetBlockingOfNonTemporaryEvents(
										data.entity --[[ Ped ]], 
										false --[[ boolean ]]
									)
										exports.ox_target:addLocalEntity(data.entity,{label = "Vzít si zpět drogy",
										icon = "fa-solid fa-money-bill",
										name='deal',
										distance = 3,
										
										onSelect = function (data)
											if IsPedDeadOrDying(data.entity,true)then
												if	lib.progressCircle( {
													label = "Prohledáváš",
													duration = 5000,
													canCancel = false,
													disable = {
														car = true,
														move = true,
														combat = true,
													},
													anim = {
														dict = 'anim@gangops@facility@servers@bodysearch@',
														clip = 'player_search'
													},
							
												}) then
												TriggerServerEvent('stealdrug','cocaine',CocaineQuantity)
												end
											end
										end
										})
	
								end
							end
						else 
							lib.notify({id = 'nodrug',
	   title = 'Nemáš kokain',
	   
	   position = 'top',
	   style = {
		   backgroundColor = '#141517',
		   color = '#C1C2C5',
		   ['.description'] = {
			 color = '#909296'
		   }
	   },
	   icon = 'ban',
	   iconColor = '#C53030'})
	
	
						end
					
				end
				
			},
			{
				title = 'Vyjednat cenu',
				icon ='comments-dollar',
				disabled = true,
				
			}
		}
	  })
	
	  end)
	  lib.registerContext({
		id ='methmenu',
		title ='Kokain',
		onExit = function ()
			TaskWanderStandard(
data.entity --[[ Ped ]], 
10.0 --[[ number ]], 
10 --[[ integer ]])
SetBlockingOfNonTemporaryEvents(
	data.entity --[[ Ped ]], 
	false --[[ boolean ]]
)
exports.ox_target:removeLocalEntity(data.entity,'deal')
		end,
		options = {
			{
				title ='Prodat pervitin',
				icon = 'money-bill',
				description ='Prodat pervitin ' .. MethQuantity .. ' gramů za ' .. (MethQuantity * MethPrice),
			
				onSelect = function ()
				
					Meth = exports.ox_inventory:Search('count', 'meth')
					if Meth >= 1 then
				
						if	lib.progressCircle( {
							label = "Prodáváš",
							duration = 5000,
							canCancel = false,
							disable = {
								car = true,
								move = true,
								combat = true,
							},
							anim = {
								dict = 'pickup_object',
								clip = 'putdown_low'
							},
	
						}) then
							TaskPlayAnim(data.entity,'pickup_object','putdown_low',8.0,8.0,-1,0,1,true,true,true)
								if math.random() <= 0.85 then
									SetBlockingOfNonTemporaryEvents(
										data.entity --[[ Ped ]], 
										false --[[ boolean ]]
									)
								TriggerServerEvent('dealer','meth',MethQuantity,MethQuantity*MethPrice)	
								exports.ox_target:removeLocalEntity(data.entity,'deal')	
								TaskWanderStandard(
									data.entity --[[ Ped ]], 
									10.0 --[[ number ]], 
									10 --[[ integer ]])	
								else
								
									TriggerServerEvent('dealer2','meth',MethQuantity) 
									exports.ox_target:removeLocalEntity(data.entity,'deal')
									TaskReactAndFleePed(data.entity,PlayerPed)  --[[ Ped ]] ---[[ Ped ]]
								SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
										exports.ox_target:addLocalEntity(data.entity,{label = "Vzít si zpět drogy",
										icon = "fa-solid fa-money-bill",
										name='deal',
										distance = 3,
										
										onSelect = function (data)
											if IsPedDeadOrDying(data.entity,true)then
												if	lib.progressCircle( {
													label = "Prohledáváš",
													duration = 5000,
													canCancel = false,
													disable = {
														car = true,
														move = true,
														combat = true,
													},
													anim = {
														dict = 'anim@gangops@facility@servers@bodysearch@',
														clip = 'player_search'
													},
							
												}) then
												TriggerServerEvent('stealdrug','meth',MethQuantity)
												end
											end
										end
										})
	
								end
							end
						else 
							SetBlockingOfNonTemporaryEvents(
								data.entity --[[ Ped ]], 
								false --[[ boolean ]]
							)
						
							exports.ox_target:removeLocalEntity(data.entity,'deal')
							TaskWanderStandard(
								data.entity --[[ Ped ]], 
								40.0 --[[ number ]], 
								10 --[[ integer ]])
							lib.notify({id = 'nodrug',
	   title = 'Nemáš  pervitin',
	   
	   position = 'top',
	   style = {
		   backgroundColor = '#141517',
		   color = '#C1C2C5',
		   ['.description'] = {
			 color = '#909296'
		   }
	   },
	   icon = 'ban',
	   iconColor = '#C53030'})
	
	
						end
					
				
				end
				
			},
			{
				title = 'Vyjednat cenu',
				icon ='comments-dollar',
				onSelect = function ()
					if math.random() >= 0.30 then
						lib.showContext('methmenuprice')
					else
						SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
								lib.notify({id = 'nodrug',
   title = 'Nehce vyjednávat',
   
   position = 'top',
   style = {
	   backgroundColor = '#141517',
	   color = '#C1C2C5',
	   ['.description'] = {
		 color = '#909296'
	   }
   },
   icon = 'ban',
   iconColor = '#C53030'})
							exports.ox_target:removeLocalEntity(data.entity,'deal')	
							TaskWanderStandard(
								data.entity --[[ Ped ]], 
								10.0 --[[ number ]], 
								10 --[[ integer ]])	 
					end
						
					
					
					
				
				end
				
					
				
			}
		}
	  })
	  lib.registerContext({
		id ='methmenuprice',
		title ='Pervitin',
		onExit = function ()
			TaskWanderStandard(
data.entity --[[ Ped ]], 
10.0 --[[ number ]], 
10 --[[ integer ]])
SetBlockingOfNonTemporaryEvents(
	data.entity --[[ Ped ]], 
	false --[[ boolean ]]
)
exports.ox_target:removeLocalEntity(data.entity,'deal')
		end,
		options = {
			{
				title ='Prodat pervitin',
				icon = 'money-bill',
				description ='Prodat pervitin ' .. MethQuantity .. ' gramů za ' .. (MethQuantity * MethPrice+MethAgreedPrice),
			
				onSelect = function ()
				
					Meth= exports.ox_inventory:Search('count','meth')
					if Meth >= 1 then
				
						if	lib.progressCircle( {
							label = "Prodáváš",
							duration = 5000,
							canCancel = false,
							disable = {
								car = true,
								move = true,
								combat = true,
							},
							anim = {
								dict = 'pickup_object',
								clip = 'putdown_low'
							},
	
						}) then
							TaskPlayAnim(data.entity,'pickup_object','putdown_low',8.0,8.0,-1,0,1,true,true,true)
								if math.random() <= 0.85 then
									SetBlockingOfNonTemporaryEvents(
										data.entity --[[ Ped ]], 
										false --[[ boolean ]]
									)
								TriggerServerEvent('dealer','meth',MethQuantity,MethQuantity*MethPrice+MethAgreedPrice)	
								exports.ox_target:removeLocalEntity(data.entity,'deal')	
								TaskWanderStandard(
									data.entity --[[ Ped ]], 
									10.0 --[[ number ]], 
									10 --[[ integer ]])	
								else
								
									TriggerServerEvent('dealer2','meth',MethQuantity) 
									exports.ox_target:removeLocalEntity(data.entity,'deal')
									TaskReactAndFleePed(data.entity,PlayerPed)  --[[ Ped ]] ---[[ Ped ]]
								SetBlockingOfNonTemporaryEvents(
									data.entity --[[ Ped ]], 
									false --[[ boolean ]]
								)
										exports.ox_target:addLocalEntity(data.entity,{label = "Vzít si zpět drogy",
										icon = "fa-solid fa-money-bill",
										name='deal',
										distance = 3,
										
										onSelect = function (data)
											if IsPedDeadOrDying(data.entity,true)then
												if	lib.progressCircle( {
													label = "Prohledáváš",
													duration = 5000,
													canCancel = false,
													disable = {
														car = true,
														move = true,
														combat = true,
													},
													anim = {
														dict = 'anim@gangops@facility@servers@bodysearch@',
														clip = 'player_search'
													},
							
												}) then
												TriggerServerEvent('stealdrug','meth',MethQuantity)
												end
											end
										end
										})
	
								end
							end
						else 
							SetBlockingOfNonTemporaryEvents(
								data.entity --[[ Ped ]], 
								false --[[ boolean ]]
							)
						
							exports.ox_target:removeLocalEntity(data.entity,'deal')
							TaskWanderStandard(
								data.entity --[[ Ped ]], 
								40.0 --[[ number ]], 
								10 --[[ integer ]])
							lib.notify({id = 'nodrug',
	   title = 'Nemáš  pervitin',
	   
	   position = 'top',
	   style = {
		   backgroundColor = '#141517',
		   color = '#C1C2C5',
		   ['.description'] = {
			 color = '#909296'
		   }
	   },
	   icon = 'ban',
	   iconColor = '#C53030'})
	
	
						end
					
				
				end
				
			},
			{
				title = 'Vyjednat cenu',
				icon ='comments-dollar',
				disabled = true,
				onSelect = function ()
				

					
					
					
				
				end
				
					
				
			}
		}
	  })
	  lib.showContext('dealing')
end
RegisterCommand('prodatdrogy',function ()
	Weed = exports.ox_inventory:Search('count', 'weed')
	Cocaine = exports.ox_inventory:Search('count','cocaine')
	Meth = exports.ox_inventory:Search('count','meth')

		

	if  Meth  >= 1 or Weed >= 1 or Cocaine >=1 then
		
		lib.notify({
                                
			title = 'Začal si prodávat drogy',
		   
			position = 'top',
			style = {
				backgroundColor = '#141517',
				color = '#C1C2C5',
			   
			},
			icon = 'check',
			iconColor = '#00e83e'
		})
    	local coords = GetEntityCoords(
		PlayerPed
		)
    

	

   		 Peds =lib.getNearbyPeds(coords,2000)
			local tableLenght = #Peds
   		for i =1,tableLenght do

		local ped = Peds[i].ped
	
		exports.ox_target:addLocalEntity({ped},{
		label = "Nabídnout drogy",
		icon = "fa-solid fa-money-bill",
		name='deal',
		distance = 3,
		
		onSelect = function (data)
		
			if IsPedDeadOrDying(
				data.entity --[[ Ped ]], 
				true --[[ boolean ]]
			) == false then 
				if math.random() <= 0.85 then
			GoTodealer(data)
				
				else
					exports.ox_target:removeLocalEntity(data.entity,'deal')
					local data = exports['cd_dispatch']:GetPlayerInfo()
					TriggerServerEvent('cd_dispatch:AddNotification', {
						job_table = {'police', }, 
						coords = data.coords ,
						title = '10-14 Prodej drog',
						message =data.sex..' prodává drogy na '..data.street, 
						flash = 0,
						unique_id = data.unique_id,
						sound = 1,
						blip = {
							sprite = 207, 
							scale = 1.2, 
							colour = 3,
							flashes = false, 
							text = '911 - Prodej drog',
							time = 5,
							radius = 0,
						}
					})
					
				lib.notify({id = 'police',
					title = 'Nechce drogy',
				
					position = 'top',
					style = {
						backgroundColor = '#141517',
						color = '#C1C2C5',
						['.description'] = {
						  color = '#909296'
						}
					},
					icon = 'ban',
					iconColor = '#C53030'})
				end
				
			
			end
		end})
	end

	

elseif Weed == 0 and Meth == 0 and Cocaine == 0 then
	lib.notify({id = 'nodrug',
   title = 'Nemáš žádnou drogu',
   
   position = 'top',
   style = {
	   backgroundColor = '#141517',
	   color = '#C1C2C5',
	   ['.description'] = {
		 color = '#909296'
	   }
   },
   icon = 'ban',
   iconColor = '#C53030'})
end

end,false)
