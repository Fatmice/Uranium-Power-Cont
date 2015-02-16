require "defines"
require "util"


--Fuel Assembly {type = {Potential Energy Factor, Decay Factor}}
--Potential energy calculated from P(t)=P0e^(rt), where r = ln(2)/6 and P0 =  (1/210)(4/(e^[4r])).  This interestingly reduces to P(t) = 2^((t+2)/6)/105) where t = {t E Z | [4,inf)}
fuelAssembly = {
	["fuel-assembly-01"] = {0.0000, 0.010},
	["fuel-assembly-02"] = {0.0000, 0.009},
	["fuel-assembly-03"] = {0.0000, 0.008},
	["fuel-assembly-04"] = {(2^(6/6))/105, 0.007},
	["fuel-assembly-05"] = {(2^(7/6))/105, 0.006},
	["fuel-assembly-06"] = {(2^(8/6))/105, 0.005},
	["fuel-assembly-07"] = {(2^(9/6))/105, 0.004},
	["fuel-assembly-08"] = {(2^(10/6))/105, 0.003},
	["fuel-assembly-09"] = {(2^(11/6))/105, 0.002},
	["fuel-assembly-10"] = {(2^(12/6))/105, 0.001}
}

--Reactor performance {type= = {Performance Factor, Energy Consumption/tick, Energy Buffer Size, Neutron Economy}}
--Performance Factor is heat output compensation due to fuel decay
--Energy Consumption/tick is in KJ and computed from prototype.energy_consumption/60
--Energy Buffer Size is in KJ and computed from prototype.energy_consumption/60 * 16/15
--Neutron economy is breeding capacity of the reactor
reactorType = {
	["nuclear-fission-reactor-3-by-3"] = {14/3, 1200, 1280, 0.8},
	["nuclear-fission-reactor-5-by-5"] = {175/18, 2400, 2560, 0.8}
}
--Fluid physical properties {type = {Default Temperature, Max Temperature, Heat Capacity}}
--Default Temperature in C as defined in prototype.fluid
--Max Temperature in C as defined in prototype.fluid
--Heat Capacity in KJ/C as defined in prototype.fluid
fluidProperties = {
	["pressurised-water"] = {15, 300, 1.5},
	["water"] = {15, 100, 1}
}

--per second
local tickingA = 59
--per 0.083 second
local tickingB = 5

game.onload(function()

end)


game.onevent(defines.events.ontick, function(event)
	if tickingA == 0 then
		tickingA = 59
		fuel_decay()
		calculate_fuel_amount()
		calculate_reactor_energy()
	else
		tickingA = tickingA - 1
	end
	if tickingB == 0 then
		tickingB = 5
		do_heat_exchange()
		old_heat_exchange()
	else
		tickingB = tickingB - 1
	end
	--Must be done on each tick, per 0.15 second was insufficient since .energy is upper bounded
	add_reactor_energy()
	add_heat_exchange_energy()
	
end)


game.onevent(defines.events.onbuiltentity, function(event)
	local x1 = event.createdentity.position.x-1
	local y1 = event.createdentity.position.y-1
	local x2 = x1+2
	local y2 = y1+2

	-- Fission reactor stuff

	if event.createdentity.name == "nuclear-fission-reactor-3-by-3" then
		event.createdentity.operable = false
		for i,player in ipairs(game.players) do
			game.players[i].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
			game.players[i].print("Place the reactor access port next to the fission reactor.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-5-by-5" then
		event.createdentity.operable = false
		for i,player in ipairs(game.players) do
			game.players[i].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
			game.players[i].print("Place the reactor access port next to the fission reactor.")
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-9" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
		if #results == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true, true, true}
			--Reference to reactor building
			reactorAndChest[1] = results[1]
			--Reference to reactor chest
			reactorAndChest[2] = event.createdentity
			--Energy potential in chest
			reactorAndChest[3] = 0
			--Energy buffer in J
			reactorAndChest[4] = 0
			--Energy Output in J
			reactorAndChest[5] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			for i,player in ipairs(game.players) do
				game.players[i].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
			end
		else
			for i,player in ipairs(game.players) do
				game.players[i].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
				game.players[i].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
			end
			event.createdentity.destroy()
		end
	elseif event.createdentity.name == "nuclear-fission-reactor-chest-25" then
		results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
		if #results == 1 then
			if glob.LReactorAndChest == nil then
				glob.LReactorAndChest = {}
			end
			reactorAndChest = {true, true, true, true, true}
			--Reference to reactor building
			reactorAndChest[1] = results[1]
			--Reference to reactor chest
			reactorAndChest[2] = event.createdentity
			--Energy potential in chest
			reactorAndChest[3] = 0
			--Energy buffer in J
			reactorAndChest[4] = 0
			--Energy Output in J
			reactorAndChest[5] = 0
			table.insert(glob.LReactorAndChest, reactorAndChest)
			for i,player in ipairs(game.players) do
				game.players[i].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
			end
		else
			for i,player in ipairs(game.players) do
				game.players[i].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
				game.players[i].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
			end
			event.createdentity.destroy()
		end

	-- Heat exchanger stuff

	elseif event.createdentity.name == "heat-exchanger" then
		if glob.oldheatExchanger == nil then
			glob.oldheatExchanger = {}
		end

		local x = event.createdentity.position.x
		local y = event.createdentity.position.y

		local up = game.findentitiesfiltered{area = {{x, y+1}, {x, y+1}}, name = "pipe"}
		local down = game.findentitiesfiltered{area = {{x, y-1}, {x, y-1}}, name = "pipe"}
		local left = game.findentitiesfiltered{area = {{x-1, y}, {x-1, y}}, name = "pipe"}
		local right = game.findentitiesfiltered{area = {{x+1, y}, {x+1, y}}, name = "pipe"}
 
		oldheatExchanger = {}	
		oldheatExchanger[1] = event.createdentity

		if up[1] ~= nil and down[1] ~= nil then
			--game.player.print("up and down working")

			oldheatExchanger[2] = up[1]
			oldheatExchanger[3] = down[1]
			table.insert(glob.oldheatExchanger, oldheatExchanger)
		elseif left[1] ~= nil and right[1] ~= nil then
			--game.player.print("left and right working")

			oldheatExchanger[2] = left[1]
			oldheatExchanger[3] = right[1]
			table.insert(glob.oldheatExchanger, oldheatExchanger)
		end
	elseif event.createdentity.name == "S-new-heat-exchanger-01" 
		or event.createdentity.name == "R-new-heat-exchanger-01"
		or event.createdentity.name == "S-new-heat-exchanger-02"
		or event.createdentity.name == "R-new-heat-exchanger-02" then
		if glob.NHeatExchanger == nil then
			glob.NHeatExchanger = {}
		end
		heatExchanger = {}
		heatExchanger[1] = event.createdentity
		heatExchanger[2] = event.createdentity.name
		table.insert(glob.NHeatExchanger, heatExchanger)
	end
end)


function calculate_fuel_amount()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if LReactorAndChest[2].getinventory(1).isempty() == false then
					local chest = LReactorAndChest[2].getinventory(1)
					LReactorAndChest[3] = 0
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-01"][1] * (chest.getitemcount("fuel-assembly-01"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-02"][1] * (chest.getitemcount("fuel-assembly-02"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-03"][1] * (chest.getitemcount("fuel-assembly-03"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-04"][1] * (chest.getitemcount("fuel-assembly-04"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-05"][1] * (chest.getitemcount("fuel-assembly-05"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-06"][1] * (chest.getitemcount("fuel-assembly-06"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-07"][1] * (chest.getitemcount("fuel-assembly-07"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-08"][1] * (chest.getitemcount("fuel-assembly-08"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-09"][1] * (chest.getitemcount("fuel-assembly-09"))
					LReactorAndChest[3] = LReactorAndChest[3] + fuelAssembly["fuel-assembly-10"][1] * (chest.getitemcount("fuel-assembly-10"))
				else 
					LReactorAndChest[3] = 0
				end
			else
				table.remove(glob.LReactorAndChest, k)
			end
		end
	end
end


function calculate_reactor_energy()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if LReactorAndChest[2].getinventory(1).isempty() == false then
					--Extrapolate energy consumed for the next 60 ticks and apply the minimum to reactor energy buffer
					--As the fuels decay, the reactor performance factor will become dominant in stabilizing the heat output.
					local reactorEnergyPotential = reactorType[LReactorAndChest[1].name][1] * LReactorAndChest[3] * 1000000 * 60
					local expectedEnergyConsumed = (reactorType[LReactorAndChest[1].name][3] * 1000) * 60
					--Taking account of heat transfer efficiency in Rankine or Brayton cycle as one can not cheat thermodynamics
					local conversionFactor = 0
					if LReactorAndChest[1].fluidbox[1] ~= nil then
						if LReactorAndChest[1].fluidbox[1].type == "pressurised-water" then
							--This gives ~25.4 MW(electric) by 72 MW reactor using new heat-exchanger
							--This gives ~50.8 MW(electric) by 144 MW reactor using new heat-exchanger
							conversionFactor = 0.545
						elseif LReactorAndChest[1].fluidbox[1].type == "water" then
							--This gives ~14.4 MW(electric) by 72 MW reactor using new heat-exchanger
							--This gives ~23.0 MW(electric) by 144 MW reactor using new heat-exchanger
							conversionFactor = 0.235
						else
							conversionFactor = 0.10
						end
					end				
					--game.player.print("Current energy buffer in (MJ) " .. LReactorAndChest[4]/1000000 .. "| Reactor Energy Potential (MJ) ".. reactorEnergyPotential/1000000 .."| Expected Energy Consumed (MJ) " .. expectedEnergyConsumed/1000000 .. " Using Factor " .. conversionFactor)
					if (LReactorAndChest[4] / expectedEnergyConsumed) < 1 then
						LReactorAndChest[4] = (math.min(expectedEnergyConsumed, reactorEnergyPotential) * conversionFactor) + LReactorAndChest[4]
					end
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
				table.remove(glob.LReactorAndChest, k)
			end
		end
	end
end


function add_reactor_energy()
	if glob.LReactorAndChest ~= nil then
		for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
			if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
				if LReactorAndChest[2].getinventory(1).isempty() == false then
					--Add energy directly to boiler from reactor energy buffer
					local reactorEnergyBuffer = LReactorAndChest[4]
					local energyAdd = 0
					--1% extra is added to the boiler during ramp-up phase so it does not complain that it's empty of fuel
					if LReactorAndChest[1].energy <= 0 then
						energyAdd = (reactorType[LReactorAndChest[1].name][2] * 1000 * 1.01) - LReactorAndChest[1].energy
					else
						energyAdd = (reactorType[LReactorAndChest[1].name][2] * 1000) - LReactorAndChest[1].energy
					end
					local energyRemain = reactorEnergyBuffer - energyAdd
					if energyRemain > 0 then
						LReactorAndChest[4] = energyRemain
						LReactorAndChest[1].energy = LReactorAndChest[1].energy + energyAdd			
					end
					LReactorAndChest[5] = LReactorAndChest[5] + energyAdd
				end
			else
				table.remove(glob.LReactorAndChest, k)
			end
		end
	end
end


function add_heat_exchange_energy()
	if glob.NHeatExchanger ~= nil then
		for k,NHeatExchanger in pairs(glob.NHeatExchanger) do
			if NHeatExchanger[1].valid then
				if NHeatExchanger[1].fluidbox[1] and NHeatExchanger[1].fluidbox[2] ~= nil then
					--Energy for heat exchanger building
					NHeatExchanger[1].energy = ((5000 * 16/15) - NHeatExchanger[1].energy) + NHeatExchanger[1].energy
				end
			else
				table.remove(glob.NHeatExchanger, k)
			end
		end
	end
end

function fuel_decay()

end

function do_heat_exchange()
	if glob.NHeatExchanger ~= nil then
		for k,NHeatExchanger in pairs(glob.NHeatExchanger) do
			if NHeatExchanger[1].valid then
				if NHeatExchanger[1].fluidbox[1] and NHeatExchanger[1].fluidbox[2] ~= nil then
					if NHeatExchanger[1].fluidbox[3] and NHeatExchanger[1].fluidbox[4] ~= nil then
						--Chirality for the heat exchangers are defined in the prototype.  Since the rotation is always clockwise,
						--the chiral pairs are as follows: S-0,R-0 | S-2,R-6 | S-4,R-4 | S-6,R-2
						local hotfluid = NHeatExchanger[1].fluidbox[1].amount
						local hotfluid_t = NHeatExchanger[1].fluidbox[1].temperature
						local hotfluid_minT = fluidProperties[NHeatExchanger[1].fluidbox[1].type][1]
						local hotfluid_maxT = fluidProperties[NHeatExchanger[1].fluidbox[1].type][2]
						local hotfluid_heatCapacity = fluidProperties[NHeatExchanger[1].fluidbox[1].type][3]
						local coldfluid = NHeatExchanger[1].fluidbox[2].amount
						local coldfluid_t = NHeatExchanger[1].fluidbox[2].temperature
						local coldfluid_minT = fluidProperties[NHeatExchanger[1].fluidbox[2].type][1]
						local coldfluid_maxT = fluidProperties[NHeatExchanger[1].fluidbox[2].type][2]
						local coldfluid_heatCapacity = fluidProperties[NHeatExchanger[1].fluidbox[2].type][3]

						--Energetics
						local hotfluid_energy = hotfluid * (hotfluid_t - hotfluid_minT) * hotfluid_heatCapacity
						local coldfluid_energy = coldfluid * (coldfluid_t - coldfluid_minT) * coldfluid_heatCapacity
						local totalEnergy = hotfluid_energy + coldfluid_energy
						
						--Exchange heat
						local newHotFluidTemperature = 0
						local newColdFluidTemperature = 0
						local deltaTemperature = math.min(hotfluid_t - coldfluid_t, coldfluid_maxT - coldfluid_t)
						local exchangedEnergy = coldfluid * (deltaTemperature) * coldfluid_heatCapacity
						--This prevents negative temperature
						if totalEnergy >= exchangedEnergy then
							newHotFluidTemperature = ((totalEnergy - exchangedEnergy) / (hotfluid * hotfluid_heatCapacity)) + hotfluid_minT
							newColdFluidTemperature = ((coldfluid_energy + exchangedEnergy) / (coldfluid * coldfluid_heatCapacity)) + coldfluid_minT
						else
							newHotFluidTemperature = hotfluid_t
							newColdFluidTemperature = coldfluid_t
						end
						
						--Copy fluidboxes
						local changedFluidBox1 = NHeatExchanger[1].fluidbox[3]
						local changedFluidBox2 = NHeatExchanger[1].fluidbox[4]
						
						if hotfluid_t > coldfluid_t then
							
							changedFluidBox1["temperature"] = newHotFluidTemperature
							changedFluidBox2["temperature"] = newColdFluidTemperature
							
							NHeatExchanger[1].fluidbox[3] = changedFluidBox1
							NHeatExchanger[1].fluidbox[4] = changedFluidBox2
						end
					end
				end
			else
				table.remove(glob.NHeatExchanger, k)
			end
		end
	end
end

function old_heat_exchange()
	if glob.oldheatExchanger ~= nil then
		for k,oldheatExchanger in pairs(glob.oldheatExchanger) do
			if oldheatExchanger[1].valid and oldheatExchanger[2].valid and oldheatExchanger[3].valid then
				if oldheatExchanger[2].fluidbox[1] and oldheatExchanger[3].fluidbox[1] ~= nil then

					local v1 = oldheatExchanger[2].fluidbox[1].amount
					local t1 = oldheatExchanger[2].fluidbox[1].temperature
					local v2 = oldheatExchanger[3].fluidbox[1].amount
					local t2 = oldheatExchanger[3].fluidbox[1].temperature
					local newFluidBox1 = oldheatExchanger[2].fluidbox[1]
					local newFluidBox2 = oldheatExchanger[3].fluidbox[1]
					local minT1 = fluidProperties[oldheatExchanger[2].fluidbox[1].type][1]
					local maxT1 = fluidProperties[oldheatExchanger[2].fluidbox[1].type][2]
					local heatCapacity1 = fluidProperties[oldheatExchanger[2].fluidbox[1].type][3]
					local minT2 = fluidProperties[oldheatExchanger[3].fluidbox[1].type][1]
					local maxT2 = fluidProperties[oldheatExchanger[3].fluidbox[1].type][2]
					local heatCapacity2 = fluidProperties[oldheatExchanger[3].fluidbox[1].type][3]

					energy1 = v1*t1*heatCapacity1
					energy2 = v2*t2*heatCapacity2
					totalEnergy = energy1+energy2

					newTemp = totalEnergy/(v1*heatCapacity1+v2*heatCapacity2)
					--game.player.print(newTemp)

					if newTemp > minT1 and newTemp < maxT1 and newTemp > minT2 and newTemp < maxT1 then
						newTemp1 = newTemp
						newTemp2 = newTemp
					end
						
					if newTemp > maxT1 then
						newTemp1 = maxT1
						newTemp2 = ((totalEnergy)-(v1*maxT1*heatCapacity1))/(v2*heatCapacity2)
					end

					if newTemp > maxT2 then
						newTemp2 = maxT2
						newTemp1 = ((totalEnergy)-(v2*maxT2*heatCapacity2))/(v1*heatCapacity1)
					end

					--game.player.print("newTemp1 == "..newTemp1.."newTemp2 == "..newTemp2)

					newFluidBox1["temperature"] = newTemp1
					newFluidBox2["temperature"] = newTemp2

					oldheatExchanger[2].fluidbox[1] = newFluidBox1
					oldheatExchanger[3].fluidbox[1] = newFluidBox2	
				end
			else
				table.remove(glob.oldheatExchanger, k)
			end
		end
	end
end
