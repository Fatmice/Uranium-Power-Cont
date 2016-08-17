require "util"
require "library.constants"
require "library.mathlibs"

--per second
--local tickingA = 59
--per 0.083 second
--local tickingB = 5

--/c game.local_player.surface.create_entity({name="medium-explosion", position=game.local_player.position, force=game.local_player.force})
--local newExplosion = util.table.deepcopy(data.raw.explosion["medium-explosion"])
--newExplosion.name = "new-medium-explosion"
--newExplosion.created_effect = nil
--data:extend({newExplosion})

--pressure_to_speed_ratio flow_to_energy_ratio, max_push_amount and ratio_to_push
--speed = columnDiff * fluidPrototype->pressureToSpeedRatio + connection.flowEnergy - oppositeConnection.flowEnergy;
--max_push_amount = 1
--ratio_to_push= 2.1
--[03:02:23] <Rseding91> Are they named?
--[03:02:32] <Rseding91> It's just table indexing.
--[03:02:37] <Rseding91> If they're named, add in the new names.
--[03:02:42] <Rseding91> If they're numbered, use insert.
--[03:36:41] <Rseding91> un-named: data.raw.player.something = {{height=2}, {height=3}, {height=4}}
--[03:36:46] <Rseding91> each table is un-named
--[03:37:03] <Rseding91> named: data.raw.player.something = {entry1={height=2}, entry2={height=3}, entry3={height=4}}
--[03:37:08] <Rseding91> each one is named

script.on_init(function()
	if global.TickerA == nil then
		global.TickerA = 59
	end
	if global.TickerB == nil then
		global.TickerB = 5
	end
	--Re-Instantiate fluidProperties
	--Fluid physical properties {type = {Default Temperature, Max Temperature, Heat Capacity}}
	--Default Temperature in C as defined in prototype.fluid
	--Max Temperature in C as defined in prototype.fluid
	--Heat Capacity in KJ/C as defined in prototype.fluid
	--Pressurised Water at 16.6 MPa, 350C has specific isobar heat capacity of 10.0349 kJ/(kg K)
	--Water at 101325 Pa, 15C has specific isobar heat capacity of 4.1891 kJ / kg K
	--Superheated steam at 6.5 MPa, 350C has specific isobar heat capacity of 2.9561 kJ/(kg K)
	--Saturated steam at 0.1 MPa, 100C has specific isobar heat capacity steam of 2.0759 kJ/(kg K) , specific isobar heat capacity water of 4.2161 kJ/(kg K)
	global.fluidProperties = {}
	for fluid,_ in pairs(game.fluid_prototypes) do
		--game.players[1].print(fluid..","..game.fluid_prototypes[fluid].default_temperature..","..game.fluid_prototypes[fluid].max_temperature..","..game.fluid_prototypes[fluid].heat_capacity/1000)
		global.fluidProperties[fluid] = {
			[1] = game.fluid_prototypes[fluid].default_temperature,
			[2] = game.fluid_prototypes[fluid].max_temperature,
			[3] = (game.fluid_prototypes[fluid].heat_capacity / 1000)
		}
	end
	--game.makefile("/test/fluid.txt", serpent.block(global.fluidProperties))
	--for fluid,values in pairs(global.fluidProperties) do
	--	game.players[1].print("Fluid name,min,max,Q: "..fluid..","..values[1]..","..values[2]..","..values[3])
	--end
end)

script.on_configuration_changed(function()
	if global.TickerA == nil then
		global.TickerA = 59
	end
	if global.TickerB == nil then
		global.TickerB = 5
	end
	--Re-Instantiate fluidProperties
	--Fluid physical properties {type = {Default Temperature, Max Temperature, Heat Capacity}}
	--Default Temperature in C as defined in prototype.fluid
	--Max Temperature in C as defined in prototype.fluid
	--Heat Capacity in KJ/C as defined in prototype.fluid
	--Pressurised Water at 16.6 MPa, 350C has specific isobar heat capacity of 10.0349 kJ/(kg K)
	--Water at 101325 Pa, 15C has specific isobar heat capacity of 4.1891 kJ / kg K
	--Superheated steam at 6.5 MPa, 350C has specific isobar heat capacity of 2.9561 kJ/(kg K)
	--Saturated steam at 0.1 MPa, 100C has specific isobar heat capacity steam of 2.0759 kJ/(kg K) , specific isobar heat capacity water of 4.2161 kJ/(kg K)
	global.fluidProperties = {}
	for fluid,_ in pairs(game.fluid_prototypes) do
		--game.players[1].print(fluid..","..game.fluid_prototypes[fluid].default_temperature..","..game.fluid_prototypes[fluid].max_temperature..","..game.fluid_prototypes[fluid].heat_capacity/1000)
		global.fluidProperties[fluid] = {
			[1] = game.fluid_prototypes[fluid].default_temperature,
			[2] = game.fluid_prototypes[fluid].max_temperature,
			[3] = (game.fluid_prototypes[fluid].heat_capacity / 1000)
		}
	end
	--game.makefile("/test/fluid.txt", serpent.block(global.fluidProperties))
	--for fluid,values in pairs(global.fluidProperties) do
	--	game.
end)

script.on_load(function()
	if global.TickerA == nil then
		global.TickerA = 59
	end
	if global.TickerB == nil then
		global.TickerB = 5
	end
end)

script.on_event(defines.events.on_tick, function(event)
	--Ticker	
	if global.TickerA == 0 then
		global.TickerA = 59
		fuel_decay()
		calculate_fuel_amount()
		calculate_reactor_energy()
		low_pressure_steam_condensation()
		high_pressure_steam_generation()
	else
		global.TickerA = global.TickerA - 1
	end
	if global.TickerB == 0 then
		global.TickerB = 5
		do_heat_exchange()
		old_heat_exchange()
	else
		global.TickerB = global.TickerB - 1
	end
	--Must be done on each tick, per 0.15 second was insufficient since .energy is upper bounded
	add_reactor_energy()
	add_heat_exchange_energy()
	calculate_generator_power_output()
	
end)


script.on_event(defines.events.on_built_entity, function(event)
	local x1 = event.created_entity.position.x-1
	local y1 = event.created_entity.position.y-1
	local x2 = x1+2
	local y2 = y1+2

	-- Fission reactor stuff
	if event.created_entity.name == "nuclear-fission-reactor-3-by-3" then
		event.created_entity.operable = false
		if (game.players[event.player_index].get_inventory(defines.inventory.player_quickbar).get_item_count("nuclear-fission-reactor-chest-9") + game.players[event.player_index].get_inventory(defines.inventory.player_main).get_item_count("nuclear-fission-reactor-chest-9")) < 1 then
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
		end
		game.players[event.player_index].print("Place the reactor access port next to the fission reactor.")
	elseif event.created_entity.name == "nuclear-fission-reactor-5-by-5" then
		event.created_entity.operable = false
		if (game.players[event.player_index].get_inventory(defines.inventory.player_quickbar).get_item_count("nuclear-fission-reactor-chest-25") + game.players[event.player_index].get_inventory(defines.inventory.player_main).get_item_count("nuclear-fission-reactor-chest-9")) < 1 then
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
		end
		game.players[event.player_index].print("Place the reactor access port next to the fission reactor.")
	elseif event.created_entity.name == "nuclear-fission-reactor-chest-9" then
		results = event.created_entity.surface.find_entities_filtered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
		if #results == 1 then
			if global.LReactorAndChest == nil then
				global.LReactorAndChest = {}
			end
			reactorAndChest = {}
			--Reference to reactor building
			reactorAndChest[1] = results[1]
			--Reference to reactor chest
			reactorAndChest[2] = event.created_entity
			--Energy potential in chest
			reactorAndChest[3] = 0
			--Energy buffer in J
			reactorAndChest[4] = 0
			--Energy Output in J
			reactorAndChest[5] = 0
			--Ticker
			reactorAndChest[6] = true
			table.insert(global.LReactorAndChest, reactorAndChest)
			
			game.players[event.player_index].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
			game.players[event.player_index].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
			event.created_entity.destroy()
		end
	elseif event.created_entity.name == "nuclear-fission-reactor-chest-25" then
		results = event.created_entity.surface.find_entities_filtered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
		if #results == 1 then
			if global.LReactorAndChest == nil then
				global.LReactorAndChest = {}
			end
			reactorAndChest = {}
			--Reference to reactor building
			reactorAndChest[1] = results[1]
			--Reference to reactor chest
			reactorAndChest[2] = event.created_entity
			--Energy potential in chest
			reactorAndChest[3] = 0
			--Energy buffer in J
			reactorAndChest[4] = 0
			--Energy Output in J
			reactorAndChest[5] = 0
			--Ticker
			reactorAndChest[6] = true
			table.insert(global.LReactorAndChest, reactorAndChest)
			
			game.players[event.player_index].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else			
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
			game.players[event.player_index].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")			
			event.created_entity.destroy()
		end

	-- Heat exchanger stuff
	elseif event.created_entity.name == "heat-exchanger" then
		if global.oldheatExchanger == nil then
			global.oldheatExchanger = {}
		end

		local x = event.created_entity.position.x
		local y = event.created_entity.position.y

		local up = event.created_entity.surface.find_entities_filtered{position = {x, y-1}, name = "pipe"}
		local down = event.created_entity.surface.find_entities_filtered{position = {x, y+1}, name = "pipe"}
		local left = event.created_entity.surface.find_entities_filtered{position = {x-1, y}, name = "pipe"}
		local right = event.created_entity.surface.find_entities_filtered{position = {x+1, y}, name = "pipe"}
 
		oldheatExchanger = {}	
		oldheatExchanger[1] = event.created_entity

		if up[1] ~= nil and down[1] ~= nil then
			--game.player.print("up and down working")

			oldheatExchanger[2] = up[1]
			oldheatExchanger[3] = down[1]
			table.insert(global.oldheatExchanger, oldheatExchanger)
		elseif left[1] ~= nil and right[1] ~= nil then
			--game.player.print("left and right working")

			oldheatExchanger[2] = left[1]
			oldheatExchanger[3] = right[1]
			table.insert(global.oldheatExchanger, oldheatExchanger)
		end
	elseif event.created_entity.name == "S-new-heat-exchanger-01" 
		or event.created_entity.name == "R-new-heat-exchanger-01"
		or event.created_entity.name == "S-new-heat-exchanger-02"
		or event.created_entity.name == "R-new-heat-exchanger-02" then
		if global.NHeatExchanger == nil then
			global.NHeatExchanger = {}
		end
		heatExchanger = {}
		heatExchanger[1] = event.created_entity
		heatExchanger[2] = event.created_entity.name
		table.insert(global.NHeatExchanger, heatExchanger)
	
	-- Steam Generator stuff	
	elseif event.created_entity.name == "reactor-steam-generator-01" then
		local entityX = event.created_entity.position.x
		local entityY = event.created_entity.position.y
		local entityDirection = event.created_entity.direction
		local internals = steamGeneratorInternals[event.created_entity.name]
		local findReactor = event.created_entity.surface.find_entities_filtered{area = {{entityX-5, entityY-5}, {entityX+5, entityY+5}}, name = "nuclear-fission-reactor-3-by-3"}
		local steam_generator = {}
		
		if global.steamGenerators == nil then
			global.steamGenerators = {}
		end
	
		--Warn player if no reactor is found.
		if #findReactor == 0 then
			game.players[event.player_index].print("72 MW Nuclear Reactor not dectected! This building is not designed to function without a reactor.")
			game.players[event.player_index].print("Building returning to your inventory. Please replace the steam generator.")
			game.players[event.player_index].insert({name = "reactor-steam-generator-01", count = 1})
			event.created_entity.destroy()
		--warn player if reactors are too closely built.
		elseif #findReactor > 1 then
			game.players[event.player_index].print("More than one reactor found! Reactors count :"..#findReactor)
			game.players[event.player_index].print("Building returning to your inventory. Please improve reactor layout or rotate the steam generator to match a reactor side with more clearance.")
			game.players[event.player_index].insert({name = "reactor-steam-generator-01", count = 1})
			event.created_entity.destroy()
		--Do directional checking of the reactor.  Only certain positions allowed!
		elseif (entityX+internals[entityDirection][1][1]) ~= findReactor[1].position.x or (entityY+internals[entityDirection][1][2]) ~= findReactor[1].position.y then
			game.players[event.player_index].print("Reactor is not at the correct offset!  Expected X, Y coordinate of reactor: "..(entityX+internals[entityDirection][1][1])..", "..(entityY+internals[entityDirection][1][2]).."....Found coordinate: "..findReactor[1].position.x..", "..findReactor[1].position.y)
			game.players[event.player_index].print("Building returning to your inventory. Please rotate the steam generator to align its input with that of reactor output.")
			game.players[event.player_index].insert({name = "reactor-steam-generator-01", count = 1})
			event.created_entity.destroy()
		--Everything seems to pass so now place pipes and add to global
		else
			--Reference to steam generator building
			steam_generator[1] = event.created_entity
			--Reference to connected reactor
			steam_generator[2] = findReactor[1]
			--Entity Hot Leg fluidbox
			steam_generator[3] = event.created_entity.surface.create_entity{name = internals[entityDirection][2][1], direction = internals[entityDirection][2][2], position = {x = entityX+internals[entityDirection][2][3],y = entityY+internals[entityDirection][2][4]}, force = game.forces.player}
			--Entity Cold Leg fluidbox
			steam_generator[4] = event.created_entity.surface.create_entity{name = internals[entityDirection][3][1], direction = internals[entityDirection][3][2], position = {x = entityX+internals[entityDirection][3][3],y = entityY+internals[entityDirection][3][4]}, force = game.forces.player}
			--Heat Output
			steam_generator[5] = 0
			--Performance of downstream condenser
			steam_generator[6] = 1
			--Steam counter
			steam_generator[7] = 0
			table.insert(global.steamGenerators, steam_generator)
		end

	-- Turbine Generator stuff
	elseif event.created_entity.name == "reactor-turbine-generator-01a"
		or event.created_entity.name == "reactor-turbine-generator-01b" then
		local entityX = event.created_entity.position.x
		local entityY = event.created_entity.position.y
		local entityDirection = event.created_entity.direction
		local internals = turbineGeneratorInternals[event.created_entity.name]
		local countSmallReactor = event.created_entity.surface.count_entities_filtered{area = {{entityX-15, entityY-15}, {entityX+15, entityY+15}}, name = "nuclear-fission-reactor-3-by-3"}
		local countLargeReactor = event.created_entity.surface.count_entities_filtered{area = {{entityX-15, entityY-15}, {entityX+15, entityY+15}}, name = "nuclear-fission-reactor-5-by-5"}
		local turbine_generator = {}
		
		if global.turbineGenerators == nil then
			global.turbineGenerators = {}
		end
		
		--Warn placement too far from reactor
		if (countSmallReactor + countLargeReactor) == 0 then
			game.players[event.player_index].print("Turbine Generator Created at X,Y: "..entityX..","..entityY.." Search Box: {("..(entityX-15)..","..(entityY-15).."),("..(entityX+15)..","..(entityY+15)..")}")
			game.players[event.player_index].print("No Reactor found!.  This building is not designed to function far from or without a reactor.")
			game.players[event.player_index].print("Building returning to your inventory. Please replace the turbine generator.")
			game.players[event.player_index].insert({name = event.created_entity.name, count = 1})
			event.created_entity.destroy()
		else
			--Reference to turbine generator building
			turbine_generator[1] = event.created_entity
			--Low Pressure Steam Box
				--[1] = Reference to low pressure steam box
				--[2] = Low Pressure Steam Avg Temperature
				--[3] = Low Pressure Steam Overflow
			turbine_generator[2] = {
				[1] = event.created_entity.surface.create_entity{name = internals[entityDirection][1][1], direction = internals[entityDirection][1][2], position = {x = entityX+internals[entityDirection][1][3],y = entityY+internals[entityDirection][1][4]}, force = game.forces.player},
				[2] = {0},
				[3] = {0}
			}
			--Reference to cold leg box
			turbine_generator[3] = event.created_entity.surface.create_entity{name = internals[entityDirection][2][1], direction = internals[entityDirection][2][2], position = {x = entityX+internals[entityDirection][2][3],y = entityY+internals[entityDirection][2][4]}, force = game.forces.player}
			--Reference to feed water box
			turbine_generator[4] = event.created_entity.surface.create_entity{name = internals[entityDirection][3][1], direction = internals[entityDirection][3][2], position = {x = entityX+internals[entityDirection][3][3],y = entityY+internals[entityDirection][3][4]}, force = game.forces.player}
			--Turbine Ticking
			turbine_generator[5] = 0
			--Energy Accounting
			turbine_generator[6] = 0
			--Super Heated Steam Accounting
			turbine_generator[7] = 0
			table.insert(global.turbineGenerators, turbine_generator)
		end
	end
end)

function ticker()
	
end

function calculate_fuel_amount()
	if global.LReactorAndChest ~= nil then
		local fuelAssemblyPotential = fuelAssembly
		for k,LReactorAndChest in ipairs(global.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				local chest = LReactorAndChest[2].get_inventory(1)
				if not chest.is_empty() then
					local reactorChestPotential = 0
					for assemblyType, count in pairs(chest.get_contents()) do
						reactorChestPotential = reactorChestPotential + (fuelAssemblyPotential[assemblyType][1] * count)
					end
					LReactorAndChest[3] = reactorChestPotential
				else 
					LReactorAndChest[3] = 0
				end
			else
				table.remove(global.LReactorAndChest, k)
			end
		end
	end
end


function fuel_decay()

end


function calculate_reactor_energy()
	if global.LReactorAndChest ~= nil then
		for k,LReactorAndChest in ipairs(global.LReactorAndChest) do
			local reactor_type = reactorType
			local reactor = LReactorAndChest[1]
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if not LReactorAndChest[2].get_inventory(1).is_empty() and reactor.energy < (reactor_type[reactor.name][2] * 1000) and reactor.fluidbox[1] ~= nil then
					--Extrapolate energy consumed for the next 60 ticks and apply the minimum to reactor energy buffer
					--As the fuels decay, the reactor performance factor will become dominant in stabilizing the heat output.
					
					local reactorChestPotential = LReactorAndChest[3]
					local reactorBuffer = LReactorAndChest[4]
					
					local reactorEnergyPotential = reactor_type[reactor.name][1] * reactorChestPotential * 1000000 * 60
					local expectedEnergyConsumed = (reactor_type[reactor.name][3] * 1000) * 60
					
					--game.player.print("Current energy buffer in (MJ) " .. LReactorAndChest[4]/1000000 .. "| Reactor Energy Potential (MJ) ".. reactorEnergyPotential/1000000 .."| Expected Energy Consumed (MJ) " .. expectedEnergyConsumed/1000000)
					
					if (reactorBuffer / expectedEnergyConsumed) < 1 then
						LReactorAndChest[4] = math.min(expectedEnergyConsumed, reactorEnergyPotential) + reactorBuffer
					end
					--Debug stuff
					local temp = 0
					if LReactorAndChest[1].fluidbox[1] ~= nil then
						temp = LReactorAndChest[1].fluidbox[1].temperature
					else
						temp = 15
					end
					--game.player.print("Current heat output in (KW) " .. LReactorAndChest[5]/1000 .. "| Current energy reserves in (J) " .. LReactorAndChest[1].energy .. "| Reactor Temperature (C) " .. temp)
					--game.player.print("Injected energy buffer in (MJ) " .. LReactorAndChest[4]/1000000)
					--Reset heat counter
					LReactorAndChest[5] = 0
				end
			else
				table.remove(global.LReactorAndChest, k)
			end
		end
	end
end


function add_reactor_energy()
	if global.LReactorAndChest ~= nil then
		local reactor_type = reactorType
		for k,LReactorAndChest in ipairs(global.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				local reactor = LReactorAndChest[1]
				local chest = LReactorAndChest[2].get_inventory(1)
				
				if not chest.is_empty() and reactor.energy < (reactor_type[reactor.name][2] * 1000) and reactor.fluidbox[1] ~= nil then
					LReactorAndChest[6] = true
				else
					LReactorAndChest[6] = false
				end
				
				if LReactorAndChest[6] then
					--game.players[1].print(tostring(LReactorAndChest[6]))
					local reactorEnergyBuffer = LReactorAndChest[4]
					--Add energy directly to boiler from reactor energy buffer
					local energyAdd = 0
					
					--1% extra is added to the boiler during ramp-up phase so it does not complain that it's empty of fuel
					if reactor.energy <= 0 then
						energyAdd = (reactor_type[reactor.name][2] * 1000 * 1.01) - reactor.energy
					else
						energyAdd = (reactor_type[reactor.name][2] * 1000) - reactor.energy
					end
					local energyRemain = reactorEnergyBuffer - energyAdd
					if energyRemain > 0 then
						LReactorAndChest[4] = energyRemain
						LReactorAndChest[1].energy = reactor.energy + energyAdd			
					end
					
					local reactorHeatOutput
					--Be defensive against uninitialized fields
					if LReactorAndChest[5] ~= nil then
						reactorHeatOutput = LReactorAndChest[5]
					else
						reactorHeatOutput = 0
					end
					LReactorAndChest[5] = reactorHeatOutput + energyAdd
				end
			else
				table.remove(global.LReactorAndChest, k)
			end
		end
	end
end


function calculate_generator_power_output()
	if global.turbineGenerators ~= nil then
		local turbine_generator_internals = turbineGeneratorInternals
		local fluid_properties = global.fluidProperties
		for k,turbineGenerators in ipairs(global.turbineGenerators) do
			if turbineGenerators[1].valid and turbineGenerators[2][1].valid and turbineGenerators[3].valid and turbineGenerators[4].valid then
				if turbineGenerators[1].fluidbox[1] ~= nil and turbineGenerators[1].fluidbox[1].type == "superheated-steam" then
					local energy = turbineGenerators[1].energy
					local generatorFluidBox = turbineGenerators[1].fluidbox[1]
					local energyBufferCapacity = turbine_generator_internals[turbineGenerators[1].name]["energy_buffer_capacity"][1]
					local generatorEfficiency = turbine_generator_internals[turbineGenerators[1].name]["effectivity"][1]
					local energyToGrid = (energyBufferCapacity - energy)				
					local superHeatedSteamConsumed = (energyBufferCapacity - energy) / ((generatorFluidBox.temperature - fluid_properties[generatorFluidBox.type][1]) * fluid_properties[generatorFluidBox.type][3] * generatorEfficiency * 1000)
					local simulatedSteamExpansion = superHeatedSteamConsumed * (generatorFluidBox.temperature - 280) * fluid_properties[generatorFluidBox.type][3] * 1000
					local lowPressureSteamTemperature = 0
					
					if superHeatedSteamConsumed > 0 then
						lowPressureSteamTemperature = simulatedSteamExpansion / (superHeatedSteamConsumed * fluid_properties["low-pressure-steam"][3] * generatorEfficiency * 1000) + fluid_properties["low-pressure-steam"][1]
					else
						lowPressureSteamTemperature = 0
					end
					--Sum Energy To Grid
					turbineGenerators[6] = turbineGenerators[6] + energyToGrid
					--Sum Super Heated Steam Consumed
					turbineGenerators[7] = turbineGenerators[7] + superHeatedSteamConsumed
					--Average Low Pressure Steam Temp
					if turbineGenerators[2][2][1] == 0 then
						turbineGenerators[2][2][1] = lowPressureSteamTemperature
					else
						turbineGenerators[2][2][1] = (turbineGenerators[2][2][1] + lowPressureSteamTemperature) / 2
					end
					--Fill Low Pressure Steam Fluid Box
					if turbineGenerators[2][1].fluidbox[1] == nil then
						turbineGenerators[2][1].fluidbox[1] = {
								["type"] = "low-pressure-steam",
								["amount"] = superHeatedSteamConsumed,
								["temperature"] = turbineGenerators[2][2][1]
							}
					else
						local lowPressureSteamFluidBox = turbineGenerators[2][1].fluidbox[1]
						local remainingFluidSpace = (turbine_generator_internals[turbineGenerators[1].name][turbineGenerators[2][1].name][1]*10) - lowPressureSteamFluidBox.amount
						if remainingFluidSpace < superHeatedSteamConsumed then
							lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount + remainingFluidSpace
							--Save to OverFlow
							turbineGenerators[2][3][1] = turbineGenerators[2][3][1] + (superHeatedSteamConsumed - remainingFluidSpace)
						else
							lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount + superHeatedSteamConsumed
						end
						turbineGenerators[2][1].fluidbox[1] = lowPressureSteamFluidBox
					end
					
					if turbineGenerators[5] == 0 then
						turbineGenerators[5] = game.tick + 60
						--game.players[1].print("Current Game Tick: "..game.tick)
					elseif turbineGenerators[5] == game.tick then
						turbineGenerators[5] = game.tick + 60
						if turbineGenerators[6] > 0 then
							--game.players[1].print("Energy Used: "..turbineGenerators[6].." Power Output (KW): "..(turbineGenerators[6] / 1000).." Super Heated Steam Expanded :"..turbineGenerators[7].." Low-Pressure Steam Temperature :"..turbineGenerators[2][2][1].." Low-Pressure-Steam OverFlow: "..turbineGenerators[2][3][1])
						end
						turbineGenerators[2][2][1] = 0
						turbineGenerators[6] = 0
						turbineGenerators[7] = 0
					end
				end
			else
				table.remove(global.turbineGenerators, k)
			end
		end
	end
end


function low_pressure_steam_condensation()
	if global.turbineGenerators ~= nil then
		local turbine_generator_internals = turbineGeneratorInternals
		local fluid_properties = global.fluidProperties
		for k,turbineGenerators in ipairs(global.turbineGenerators) do
			if turbineGenerators[1].valid and turbineGenerators[2][1].valid and turbineGenerators[3].valid and turbineGenerators[4].valid then
				if turbineGenerators[2][1].fluidbox[1] ~= nil and turbineGenerators[2][1].fluidbox[1].type == "low-pressure-steam" then
					local lowPressureSteamFluidBox = turbineGenerators[2][1].fluidbox[1]
					local lowPressureSteamOverFlow = turbineGenerators[2][3][1]
					local coldLegFluidBox = turbineGenerators[3].fluidbox[1]
					local feedWaterFluidBox = turbineGenerators[4].fluidbox[1]
					
					if lowPressureSteamFluidBox ~= nil and feedWaterFluidBox ~= nil then
						--Condense steam to Liquid
						local lowPressureSteamEnergy = lowPressureSteamFluidBox.amount * (lowPressureSteamFluidBox.temperature - fluid_properties[lowPressureSteamFluidBox.type][1]) * fluid_properties[lowPressureSteamFluidBox.type][3] * 1000
						local equivalentFeedWaterEvaporated = lowPressureSteamEnergy / ((fluid_properties[feedWaterFluidBox.type][2] - fluid_properties[feedWaterFluidBox.type][1]) * fluid_properties[feedWaterFluidBox.type][3] * 1000)
						local actualFeedWaterEvaporated = math.min(feedWaterFluidBox.amount, equivalentFeedWaterEvaporated)
						local condensedSteamAmount = (actualFeedWaterEvaporated / equivalentFeedWaterEvaporated) * lowPressureSteamFluidBox.amount
						local liquidEquivalent = condensedSteamAmount / 30
						local residualHeat = (lowPressureSteamFluidBox.amount - condensedSteamAmount) * (lowPressureSteamFluidBox.temperature - fluid_properties[lowPressureSteamFluidBox.type][1]) * fluid_properties[lowPressureSteamFluidBox.type][3] * 1000
						local condensedSteamTemperature
						if residualHeat > 0 then
							condensedSteamTemperature = (residualHeat / (liquidEquivalent * fluid_properties["water"][3] * 1000)) + fluid_properties["water"][1]
						else
							condensedSteamTemperature = fluid_properties["water"][1]
						end
						
						--Update Cold Leg Fluid Box
						if coldLegFluidBox == nil then
							coldLegFluidBox = {
								["type"] = "water",
								["amount"] = liquidEquivalent,
								["temperature"] = condensedSteamTemperature
							}
						else
							coldLegFluidBox.temperature = ((coldLegFluidBox.amount * coldLegFluidBox.temperature) + (liquidEquivalent * condensedSteamTemperature)) / (coldLegFluidBox.amount + liquidEquivalent)
							coldLegFluidBox.amount = coldLegFluidBox.amount + liquidEquivalent
						end
						turbineGenerators[3].fluidbox[1] = coldLegFluidBox
						
						--Update Low Pressure Steam Fluid Box
						if lowPressureSteamOverFlow > 0 then
							lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount - condensedSteamAmount + math.min(lowPressureSteamOverFlow, condensedSteamAmount)
							lowPressureSteamOverFlow = lowPressureSteamOverFlow - math.min(lowPressureSteamOverFlow, condensedSteamAmount)
						else
							lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount - condensedSteamAmount
						end
						turbineGenerators[2][1].fluidbox[1] = lowPressureSteamFluidBox
						turbineGenerators[2][3][1] = lowPressureSteamOverFlow
						
						--Update Feed Water Fluid Box
						feedWaterFluidBox.amount = feedWaterFluidBox.amount - actualFeedWaterEvaporated
						turbineGenerators[4].fluidbox[1] = feedWaterFluidBox
						
						--game.players[1].print("Recovered Water: "..coldLegFluidBox.amount.." Condensed Steam: "..condensedSteamAmount.." Evaporated Feed-water: "..actualFeedWaterEvaporated)
					end
				end
			else
				table.remove(global.turbineGenerators, k)
			end
		end
	end
end


function high_pressure_steam_generation()
	if global.steamGenerators ~= nil then
		local steam_generator_internals = steamGeneratorInternals
		local fluid_properties = global.fluidProperties
		for k,steamGenerators in ipairs(global.steamGenerators) do
			if steamGenerators[1].valid and steamGenerators[2].valid and steamGenerators[3].valid and steamGenerators[4].valid then			
				if steamGenerators[3].fluidbox[1] ~= nil and steamGenerators[4].fluidbox[1] ~= nil then
					if round(steamGenerators[3].fluidbox[1].temperature,1) > 280 and steamGenerators[4].fluidbox[1].amount > 5 then
					local steamGenerator_fluidbox = 0
					local pipebus_fluidbox = steamGenerators[3].fluidbox[1]
					local coldLeg_fluidbox = steamGenerators[4].fluidbox[1]
					local pipebus_max_volume = steamGeneratorInternals[steamGenerators[1].name][steamGenerators[3].name][1] * 10
					local condenser_efficiency = steamGenerators[6]
					local previousSteamVolume = steamGenerators[7]
					local generatedSteam = 0
					local steamGenerator_available_volume = 0
						if steamGenerators[1].fluidbox[1] == nil then
							steamGenerators[7] = 0.001
							steamGenerators[1].fluidbox[1] = {
										["type"] = "superheated-steam",
										["amount"] = steamGenerators[7],
										["temperature"] = fluid_properties["superheated-steam"][2]
							}
							steamGenerator_fluidbox = steamGenerators[1].fluidbox[1]
							steamGenerator_available_volume = (steamGeneratorInternals[steamGenerators[1].name]["self"][1] * 10) - steamGenerator_fluidbox.amount
						else
							steamGenerator_fluidbox = steamGenerators[1].fluidbox[1]
							steamGenerator_available_volume = (steamGeneratorInternals[steamGenerators[1].name]["self"][1] * 10) - steamGenerator_fluidbox.amount
						end
						if steamGenerator_fluidbox.amount < (steamGeneratorInternals[steamGenerators[1].name]["self"][1] * 10) then
							--Hot Leg Water Energy
							--Limit temperature drop to be not less than 280 C
							local pipebus_fluidboxEnergy = pipebus_fluidbox.amount * (pipebus_fluidbox.temperature - fluid_properties[pipebus_fluidbox.type][1]) * fluid_properties[pipebus_fluidbox.type][3]
							local pipebus_fluidboxSuperHeatEnergy = pipebus_fluidbox.amount * (pipebus_fluidbox.temperature - 280) * fluid_properties[pipebus_fluidbox.type][3]
							--Cold Leg Water Energy Density
							local coldLegWater_MaximumEnergyDensity = (fluid_properties[coldLeg_fluidbox.type][2] - fluid_properties[coldLeg_fluidbox.type][1]) * fluid_properties[coldLeg_fluidbox.type][3]
							--Super Heated Steam can not be higher in temperature than Hot Leg current temperature
							local superHeatedSteam_EnergyDensity = 30 * (pipebus_fluidbox.temperature - fluid_properties["superheated-steam"][1]) * fluid_properties["superheated-steam"][3]
							--Energetics of new steam (currently ignoring Enthalpy of Vaporization...will be added later)
							local vaporizableColdLeg_v = math.min(pipebus_fluidboxSuperHeatEnergy / (coldLegWater_MaximumEnergyDensity + superHeatedSteam_EnergyDensity), coldLeg_fluidbox.amount)
							local generatedSteam = math.min(steamGenerator_available_volume, vaporizableColdLeg_v * 30) * condenser_efficiency
							local vaporizedColdLegVaporizationEnergy = vaporizableColdLeg_v * coldLegWater_MaximumEnergyDensity
							local generatedSteamSuperheatedSteamEnergy = vaporizableColdLeg_v * superHeatedSteam_EnergyDensity						
								
							--game.players[1].print("Hot Leg Energy: "..pipebus_fluidboxEnergy.." Vaporizable Cold Leg: "..vaporizableColdLeg_v.." Vaporization Energy: "..vaporizedColdLegVaporizationEnergy.."  Super Heated Steam Energy: "..generatedSteamSuperheatedSteamEnergy.." Steam Usage Rate:"..(previousSteamVolume - steamGenerator_fluidbox.amount).." Generated Steam: "..generatedSteam)
								
							--Generate steam and adjust fluid boxes
							if (pipebus_fluidboxEnergy - vaporizedColdLegVaporizationEnergy - generatedSteamSuperheatedSteamEnergy) > 0 and (coldLeg_fluidbox.amount - vaporizableColdLeg_v) > 0 then
								--game.players[1].print("Generated Steam amount: "..generatedSteam..", Unused steam: "..steamGenerator_fluidbox.amount.." Liquid and temp in Pipe Bus : "..pipebus_fluidbox.amount..", "..pipebus_fluidbox.temperature.." Cold Leg Vol: "..(coldLeg_fluidbox.amount - vaporizableColdLeg_v))
								
								local currentSteamHeat = steamGenerator_fluidbox.amount * (steamGenerator_fluidbox.temperature - fluid_properties["superheated-steam"][1]) * fluid_properties["superheated-steam"][3]
								local steamNewTemp = (currentSteamHeat + vaporizedColdLegVaporizationEnergy + generatedSteamSuperheatedSteamEnergy) / ((steamGenerator_fluidbox.amount + generatedSteam) * fluid_properties["superheated-steam"][3]) + fluid_properties["superheated-steam"][1]							
								steamGenerator_fluidbox.temperature = steamNewTemp
								steamGenerator_fluidbox.amount = steamGenerator_fluidbox.amount + generatedSteam
								if steamGenerators[1].fluidbox[1] == nil then
									steamGenerators[7] = steamGenerators[7] + steamGenerator_fluidbox.amount
								else
									steamGenerators[7] = steamGenerator_fluidbox.amount
								end
								
								pipebus_fluidbox.temperature = (pipebus_fluidboxEnergy - vaporizedColdLegVaporizationEnergy - generatedSteamSuperheatedSteamEnergy) / (pipebus_fluidbox.amount * fluid_properties[pipebus_fluidbox.type][3]) + fluid_properties[pipebus_fluidbox.type][1]
								
								coldLeg_fluidbox.amount = coldLeg_fluidbox.amount - (generatedSteam / 30)
								
								if (previousSteamVolume - steamGenerator_fluidbox.amount) <= generatedSteam then	
									steamGenerators[1].fluidbox[1] = steamGenerator_fluidbox
									steamGenerators[3].fluidbox[1] = pipebus_fluidbox
									steamGenerators[4].fluidbox[1] = coldLeg_fluidbox
								end
							end
						end
					end
				end
			else
				--currently either die() or destroy() method causes desync
				--steamGenerators[3].die()
				--steamGenerators[4].die()
				--steamGenerators[5].die()
				table.remove(global.steamGenerators, k)
			end
		end
	end
end


function add_heat_exchange_energy()
	if global.NHeatExchanger ~= nil then
		local fluid_properties = global.fluidProperties
		for k,NHeatExchanger in ipairs(global.NHeatExchanger) do
			if NHeatExchanger[1].valid then
				if NHeatExchanger[1].fluidbox[1] ~= nil and NHeatExchanger[1].fluidbox[2] ~= nil then
					--Energy for heat exchanger building
					local fluidBox1 = NHeatExchanger[1].fluidbox[1]
					local heatExchangerName = NHeatExchanger[2]
					local hotFluid_v = fluidBox1.amount
					local hotFluid_t = fluidBox1.temperature
					local hotFluid_minT = fluid_properties[fluidBox1.type][1]
					local hotFluid_heatCapacity = fluid_properties[fluidBox1.type][3]
					local hotFluid_energy = hotFluid_v * (hotFluid_t - hotFluid_minT) * hotFluid_heatCapacity * 1000
					local thermal_loss = ((5000/60) * 16/15) - NHeatExchanger[1].energy			
					
					if hotFluid_energy > thermal_loss then
					--game.player.print("HotFluid_energy : "..hotFluid_energy.." Energy : "..NHeatExchanger[1].energy.." Thermal Loss : "..thermal_loss)
						local newFluidBox = fluidBox1
						if heatExchangerName == "S-new-heat-exchanger-01" or heatExchangerName == "R-new-heat-exchanger-01" then
							newFluidBox["temperature"] = ((hotFluid_energy - (thermal_loss * 0.5)) / (hotFluid_v * hotFluid_heatCapacity)) + hotFluid_minT
						elseif heatExchangerName == "S-new-heat-exchanger-02" or heatExchangerName == "R-new-heat-exchanger-02" then
							newFluidBox["temperature"] = ((hotFluid_energy - (thermal_loss * 1)) / (hotFluid_v * hotFluid_heatCapacity)) + hotFluid_minT
						end
						NHeatExchanger[1].fluidbox[1] = newFluidBox
						NHeatExchanger[1].energy = thermal_loss + NHeatExchanger[1].energy
					end					
					
				end
			else
				table.remove(global.NHeatExchanger, k)
			end
		end
	end
end


function do_heat_exchange()
	if global.NHeatExchanger ~= nil then
		local fluid_properties = global.fluidProperties
		for k,NHeatExchanger in ipairs(global.NHeatExchanger) do
			if NHeatExchanger[1].valid then
				if NHeatExchanger[1].fluidbox[1] ~= nil and NHeatExchanger[1].fluidbox[2] ~= nil then
					if NHeatExchanger[1].fluidbox[3] ~= nil and NHeatExchanger[1].fluidbox[4] ~= nil then
						--Chirality for the heat exchangers are defined in the prototype.  Since the rotation is always clockwise,
						--the chiral pairs are as follows: S-0,R-0 | S-2,R-6 | S-4,R-4 | S-6,R-2
						local fluidBox1 = NHeatExchanger[1].fluidbox[1]
						local fluidBox2 = NHeatExchanger[1].fluidbox[2]
						local heatExchangerName = NHeatExchanger[2]
						local hotFluid_v = fluidBox1.amount
						local hotFluid_t = fluidBox1.temperature
						local hotFluid_minT = fluid_properties[fluidBox1.type][1]
						local hotFluid_maxT = fluid_properties[fluidBox1.type][2]
						local hotFluid_heatCapacity = fluid_properties[fluidBox1.type][3]
						local coldFluid_v = fluidBox2.amount
						local coldFluid_t = fluidBox2.temperature
						local coldFluid_minT = fluid_properties[fluidBox2.type][1]
						local coldFluid_maxT = fluid_properties[fluidBox2.type][2]
						local coldFluid_heatCapacity = fluid_properties[fluidBox2.type][3]

						--The heatExchangerCoeff is a scaling factor tuned to allow a certain amount of MWe from MWq
						local heatExchangerCoeff = 0
						if fluidBox1.type == "water" then
						--4x Small Heat Exchanger => 16.32 MWe from 72 MWq
						--4x Big Heat Exchanger => 24.96 MWe from 144 MWq
							heatExchangerCoeff = 0.89
						elseif fluidBox1.type == "pressurised-water" and (heatExchangerName == "S-new-heat-exchanger-01" or heatExchangerName == "R-new-heat-exchanger-01") then
						--4x Small Heat Exchanger => 20.64 from 72 MWq
							heatExchangerCoeff = 0.91
						elseif fluidBox1.type == "pressurised-water" and (heatExchangerName == "S-new-heat-exchanger-02" or heatExchangerName == "R-new-heat-exchanger-02") then
						--4x Big Heat Exchanger  => 54.72 MWe from 144 MWq
							heatExchangerCoeff = 0.70
						else
						--Heat exchange between pressurized-water and itself 
						--Users can try and find out for themselves.
							heatExchangerCoeff = 0.75
						end
						local hotFluid_energy = hotFluid_v * (hotFluid_t - hotFluid_minT) * hotFluid_heatCapacity
						local coldFluid_energy = coldFluid_v * (coldFluid_t - coldFluid_minT) * coldFluid_heatCapacity
						local totalEnergy = (hotFluid_energy + coldFluid_energy) * heatExchangerCoeff

						--Exchange heat
						local newHotFluidTemperature = 0
						local newColdFluidTemperature = 0
						local deltaTemperature = math.min(hotFluid_t - coldFluid_t, coldFluid_maxT - coldFluid_t)
						local exchangedEnergy = coldFluid_v * (deltaTemperature) * coldFluid_heatCapacity
						--This prevents negative temperature
						if totalEnergy >= exchangedEnergy then
							newHotFluidTemperature = math.min(((totalEnergy - exchangedEnergy) / (hotFluid_v * hotFluid_heatCapacity)) + hotFluid_minT, hotFluid_maxT)
							newColdFluidTemperature = math.min(((coldFluid_energy + exchangedEnergy) / (coldFluid_v * coldFluid_heatCapacity)) + coldFluid_minT, coldFluid_maxT)
						else
							newHotFluidTemperature = hotFluid_t
							newColdFluidTemperature = coldFluid_t
						end
						
						--Copy fluidboxes
						local changedFluidBox1 = NHeatExchanger[1].fluidbox[3]
						local changedFluidBox2 = NHeatExchanger[1].fluidbox[4]
						
						if hotFluid_t > coldFluid_t then
							
							changedFluidBox1["temperature"] = newHotFluidTemperature
							changedFluidBox2["temperature"] = newColdFluidTemperature
							
							NHeatExchanger[1].fluidbox[3] = changedFluidBox1
							NHeatExchanger[1].fluidbox[4] = changedFluidBox2
						end
					end
				end
			else
				table.remove(global.NHeatExchanger, k)
			end
		end
	end
end


function old_heat_exchange()
	if global.oldheatExchanger ~= nil then
		local fluid_properties = global.fluidProperties
		for k,oldheatExchanger in ipairs(global.oldheatExchanger) do
			if oldheatExchanger[1].valid and oldheatExchanger[2].valid and oldheatExchanger[3].valid then
				if oldheatExchanger[2].fluidbox[1] ~= nil and oldheatExchanger[3].fluidbox[1] ~= nil then
					local fluidBox1 = oldheatExchanger[2].fluidbox[1]
					local fluidBox2 = oldheatExchanger[3].fluidbox[1]
					
					local v1 = fluidBox1.amount
					local t1 = fluidBox1.temperature
					local v2 = fluidBox2.amount
					local t2 = fluidBox2.temperature
					local newFluidBox1 = fluidBox1
					local newFluidBox2 = fluidBox2
					local minT1 = fluid_properties[fluidBox1.type][1]
					local maxT1 = fluid_properties[fluidBox1.type][2]
					local heatCapacity1 = fluid_properties[fluidBox1.type][3]
					local minT2 = fluid_properties[fluidBox2.type][1]
					local maxT2 = fluid_properties[fluidBox2.type][2]
					local heatCapacity2 = fluid_properties[fluidBox2.type][3]
					
					--The heatExchangerCoeff is a scaling factor tuned to allow about 50 MWe from 144 MWq
					local heatExchangerCoeff = 0.90
					energy1 = v1*(t1-minT1)*heatCapacity1
					energy2 = v2*(t2-minT2)*heatCapacity2
					totalEnergy = (energy1+energy2)*heatExchangerCoeff
					
					--minT1 and minT2 must be accounted for if modelling equilibrium temperature
					newTemp = (totalEnergy+(v1*minT1*heatCapacity1)+(v2*minT2*heatCapacity2))/(v1*heatCapacity1+v2*heatCapacity2)
					--game.player.print(newTemp)

					if newTemp > minT1 and newTemp < maxT1 and newTemp > minT2 and newTemp < maxT2 then
						newTemp1 = newTemp
						newTemp2 = newTemp
					end
						
					if newTemp > maxT1 then
						newTemp1 = maxT1
						newTemp2 = ((totalEnergy)-(v1*(maxT1-minT1)*heatCapacity1))/(v2*heatCapacity2) + minT2
					end

					if newTemp > maxT2 then
						newTemp1 = ((totalEnergy)-(v2*(maxT2-minT2)*heatCapacity2))/(v1*heatCapacity1) + minT1
						newTemp2 = maxT2
					end

					--game.player.print("newTemp1 == "..newTemp1.."newTemp2 == "..newTemp2)

					newFluidBox1["temperature"] = newTemp1
					newFluidBox2["temperature"] = newTemp2

					oldheatExchanger[2].fluidbox[1] = newFluidBox1
					oldheatExchanger[3].fluidbox[1] = newFluidBox2	
				end
			else
				table.remove(global.oldheatExchanger, k)
			end
		end
	end
end