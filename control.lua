require "util"
require "library.constants"
require "library.mathlibs"

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

local task_names = {}
local task_to_index = {}
local task_default_states = {}
local logging = false

script.on_init(function()
	
	global.TickerA = 59
	global.ROSTER = global.ROSTER or {}
	global.ACTIVE = global.ACTIVE or {}
	global.dirty= {}
	global.dirty[game.tick+54000] = true
	global.fluidProperties = {}
	
	--Instantiate fluidProperties
	--Fluid physical properties {type = {Default Temperature, Max Temperature, Heat Capacity}}
	--Default Temperature in C as defined in prototype.fluid
	--Max Temperature in C as defined in prototype.fluid
	--Heat Capacity in KJ/C as defined in prototype.fluid
	--Pressurised Water at 16.6 MPa, 350C has specific isobar heat capacity of 10.0349 kJ/(kg K)
	--Water at 101325 Pa, 15C has specific isobar heat capacity of 4.1891 kJ / kg K
	--Superheated steam at 6.5 MPa, 350C has specific isobar heat capacity of 2.9561 kJ/(kg K)
	--Saturated steam at 0.1 MPa, 100C has specific isobar heat capacity steam of 2.0759 kJ/(kg K) , specific isobar heat capacity water of 4.2161 kJ/(kg K)
	for fluid_name,fluid_properties in pairs(game.fluid_prototypes) do
		--game.print(fluid..","..game.fluid_prototypes[fluid].default_temperature..","..game.fluid_prototypes[fluid].max_temperature..","..game.fluid_prototypes[fluid].heat_capacity/1000)
		global.fluidProperties[fluid_name] = {
			[1] = fluid_properties.default_temperature,
			[2] = fluid_properties.max_temperature,
			[3] = (fluid_properties.heat_capacity / 1000)
		}
	end
	-- game.write_file("/UraniumPower/fluid.txt", serpent.block(global.fluidProperties))
	initialize_tasks_table()
end)

function version_is_older_than(v1,v2)
	if v1 and v2 then
	
		local n1 = string.gsub(v1,"%.","")
		local n2 = string.gsub(v2,"%.","")
		n1 = tonumber(n1)
		n2 = tonumber(n2)
		
		if (n1 < n2) then return true else return false end
	end
	return false
end

script.on_configuration_changed(function(event)
	
	global.TickerA = global.TickerA or 59
	global.ROSTER = global.ROSTER or {}
	global.ACTIVE = global.ACTIVE or {}
	global.fluidProperties = {}
	
	for fluid_name,fluid_properties in pairs(game.fluid_prototypes) do
		--game.print(fluid..","..game.fluid_prototypes[fluid].default_temperature..","..game.fluid_prototypes[fluid].max_temperature..","..game.fluid_prototypes[fluid].heat_capacity/1000)
		
		global.fluidProperties[fluid_name] = {
			[1] = fluid_properties.default_temperature,
			[2] = fluid_properties.max_temperature,
			[3] = (fluid_properties.heat_capacity / 1000)
		}
	end
	-- game.write_file("/UraniumPower/fluid.txt", serpent.block(global.fluidProperties))
	if event.mod_changes["UraniumPower"] ~= nil then
		local v1 = event.mod_changes["UraniumPower"].old_version
		if version_is_older_than(v1,"0.5.1") then
			-- Initialize a new row in old reactors
			if global.LReactorAndChest ~= nil then
				for k,LReactorandChest in pairs(global.LReactorAndChest) do
					LReactorandChest[5] = LReactorandChest[5] or 0
				end
			end
			game.print("Applied UraniumPower 0.5.1 changes")
		end
		if version_is_older_than(v1,"0.5.2") then
			-- Initialize a new row in old reactors
			if global.LReactorAndChest ~= nil then
				for k,LReactorandChest in pairs(global.LReactorAndChest) do
					LReactorandChest[5] = LReactorandChest[5] or 0
				end
			end
			-- Heat Exchanger global table migration
			global.oldheatExchanger = global.oldheatExchanger or {}
			if global.LHeatExchanger ~= nil then
				for k,LHeatExchanger in ipairs(global.LHeatExchanger) do
					table.insert(global.oldheatExchanger, LHeatExchanger)
					table.remove(global.LHeatExchanger, k)
				end
			end
			game.print("Applied UraniumPower 0.5.2 changes")
		end
		if version_is_older_than(v1,"0.6.0") then
			if global.LReactorAndChest ~= nil then
				for k,LReactorandChest in pairs(global.LReactorAndChest) do
					LReactorandChest[6] = LReactorandChest[6] or false
				end
			end
			game.print("Applied UraniumPower 0.6.0 changes")
		end
		if version_is_older_than(v1,"0.6.6") then
			if global.LReactorAndChest ~= nil then
				for _,entityrecord in pairs(global.LReactorAndChest) do
					
					local reactor = entityrecord[1]
					entityrecord["record"] = {
						[1] = {
							["id"] = reactor.unit_number,
							["position"] = {
								["x"] = reactor.position.x,
								["y"] = reactor.position.y
							},
							["name"] = reactor.name,
							["direction"] = reactor.direction,
							["type"] = game.entity_prototypes[reactor.name].type
						}, 
						[2] = {
							["id"] = entityrecord[2].unit_number,
							["position"] = {
								["x"] = entityrecord[2].position.x,
								["y"] = entityrecord[2].position.y
							},
							["name"] = entityrecord[2].name,
							["direction"] = entityrecord[2].direction,
							["type"] = game.entity_prototypes[entityrecord[2].name].type
						},
						["surfacename"] = reactor.surface.name,
						["force"] = reactor.force
					}
					entityrecord[1] = {
						[1] = reactor,
						[2] = reactor.fluidbox
					}
					entityrecord["update"] = {
						[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["return_state"] = nil, ["frequency"] = 60, ["task"] = "inspect_reactor"},
						[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["return_state"] = nil, ["frequency"] = 1, ["task"] = "add_reactor_energy"}
					}
					table.insert(global.ROSTER, entityrecord)
				end
				global.LReactorAndChest = nil
			end
			if global.steamGenerators ~= nil then
				for _,entityrecord in pairs(global.steamGenerators) do
					
					local steamGenerator = entityrecord[1]
					local hotLegBox = entityrecord[3]
					local coldLegBox = entityrecord[4]
					entityrecord["record"] = {
						[1] = {
							["id"] = steamGenerator.unit_number,
							["position"] = {
								["x"] = steamGenerator.position.x,
								["y"] = steamGenerator.position.y
							},
							["name"] = steamGenerator.name,
							["direction"] = steamGenerator.direction,
							["type"] = game.entity_prototypes[steamGenerator.name].type
						},
						[2] = {
							["id"] = entityrecord[2].unit_number,
							["position"] = {
								["x"] = entityrecord[2].position.x,
								["y"] = entityrecord[2].position.y
							},
							["name"] = entityrecord[2].name,
							["direction"] = entityrecord[2].direction,
							["type"] = game.entity_prototypes[entityrecord[2].name].type
						},
						[3] = {
							["id"] = hotLegBox.unit_number,
							["position"] = {
								["x"] = hotLegBox.position.x,
								["y"] = hotLegBox.position.y
							},
							["name"] = hotLegBox.name,
							["direction"] = hotLegBox.direction,
							["type"] = game.entity_prototypes[hotLegBox.name].type
						},
						[4] = {
							["id"] = coldLegBox.unit_number,
							["position"] = {
								["x"] = coldLegBox.position.x,
								["y"] = coldLegBox.position.y
							},
							["name"] = coldLegBox.name,
							["direction"] = coldLegBox.direction,
							["type"] = game.entity_prototypes[coldLegBox.name].type
						},
						["surfacename"] = steamGenerator.surface.name,
						["force"] = steamGenerator.force
					}
					entityrecord[1] = {
						[1] = steamGenerator,
						[2] = steamGenerator.fluidbox
					}
					entityrecord[3] = {
						[1] = hotLegBox,
						[2] = hotLegBox.fluidbox
					}
					entityrecord[4] = {
						[1] = coldLegBox,
						[2] = coldLegBox.fluidbox
					}
					entityrecord["update"] = {
						[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 60, ["return_state"] = nil, ["task"] = "high_pressure_steam_generation"}
					}
					table.insert(global.ROSTER, entityrecord)
				end
				global.steamGenerators = nil
			end
			if global.turbineGenerators ~= nil then
				for _,entityrecord in pairs(global.turbineGenerators) do
				
					local turbineGenerator = entityrecord[1]
					local lowPressureSteamBox = entityrecord[2]
					local coldLegBox = entityrecord[3]
					local coolingWaterBox = entityrecord[4]
					entityrecord["record"] = {
						[1] = {
							["id"] = turbineGenerator.unit_number,
							["position"] = {
								["x"] = turbineGenerator.position.x,
								["y"] = turbineGenerator.position.y
							},
							["name"] = turbineGenerator.name,
							["direction"] = turbineGenerator.direction,
							["type"] = game.entity_prototypes[turbineGenerator.name].type
						},
						[2] = {
							["id"] = lowPressureSteamBox[1].unit_number,
							["position"] = {
								["x"] = lowPressureSteamBox[1].position.x,
								["y"] = lowPressureSteamBox[1].position.y
							},
							["name"] = lowPressureSteamBox[1].name,
							["direction"] = lowPressureSteamBox[1].direction,
							["type"] = game.entity_prototypes[lowPressureSteamBox[1].name].type
						},
						[3] = {
							["id"] = coldLegBox.unit_number,
							["position"] = {
								["x"] = coldLegBox.position.x,
								["y"] = coldLegBox.position.y
							},
							["name"] = coldLegBox.name,
							["direction"] = coldLegBox.direction
						},
						[4] = {
							["id"] = coolingWaterBox.unit_number,
							["position"] = {
								["x"] = coolingWaterBox.position.x,
								["y"] = coolingWaterBox.position.y
							},
							["name"] = coolingWaterBox.name,
							["direction"] = coolingWaterBox.direction,
							["type"] = game.entity_prototypes[coolingWaterBox.name].type
						},
						["surfacename"] = turbineGenerator.surface.name,
						["force"] = turbineGenerator.force
					}
					entityrecord[1] = {
						[1] = turbineGenerator,
						[2] = turbineGenerator.fluidbox
					}
					entityrecord[2] = {
						[1] = {
							[1] = lowPressureSteamBox[1],
							[2] = lowPressureSteamBox[1].fluidbox
						},
						[2] = lowPressureSteamBox[2],
						[3] = lowPressureSteamBox[3]
					}
					entityrecord[3] = {
						[1] = coldLegBox,
						[2] = coldLegBox.fluidbox
					}
					entityrecord[4] = {
						[1] = coolingWaterBox,
						[2] = coolingWaterBox.fluidbox
					}
					entityrecord["update"] = {
						[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 60, ["return_state"] = nil, ["task"] = "low_pressure_steam_condensation"},
						[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 1, ["return_state"] = nil, ["task"] = "calculate_generator_power_output"}
					}
					table.insert(global.ROSTER, entityrecord)
				end
				global.turbineGenerators = nil
			end
			if global.oldheatExchanger ~= nil then
				for _,entityrecord in pairs(global.oldheatExchanger) do
					
					local entity = entityrecord[1]
					local box1 = entityrecord[2]
					local box2 = entityrecord[3]
					entityrecord["record"] = {
						[1] = {
							["id"] = entity.unit_number,
							["position"] = {
								["x"] = entity.position.x,
								["y"] = entity.position.y
							},
							["type"] = game.entity_prototypes[entity.name].type
						},
						["surfacename"] = entity.surface.name,
						["force"] = entity.force
					}
					entityrecord[1] = {
						[1] = entity
					}
					entityrecord[2] = {
						[1] = box1,
						[2] = box1.fluidbox
					}
					entityrecord[3] = {
						[1] = box2,
						[2] = box2.fluidbox
					}
					entityrecord["update"] = {
						[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 5, ["return_state"] = nil, ["task"] = "wall_heat_exchange"}
					}
					table.insert(global.ROSTER, entityrecord)
				end
				global.oldheatExchanger = nil
			end
			if global.NHeatExchanger ~= nil then
				for _,entityrecord in pairs(global.NHeatExchanger) do
				
					local recipeHeatExchanger = {
						["record"] = {
							[1] = {
								["id"] = entityrecord[1].unit_number,
								["position"] = {
									["x"] = entityrecord[1].position.x,
									["y"] = entityrecord[1].position.y
								},
								["type"] = game.entity_prototypes[entityrecord[1].name].type
							},
							["surfacename"] = entityrecord[1].surface.name,
							["force"] = entityrecord[1].force
						},
						[1] = {
							[1] = entityrecord[1],
							[2] = entityrecord[1].fluidbox
						},
						["update"] = {
							[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 5, ["return_state"] = nil, ["task"] = "recipe_heat_exchange_crafting_progress"},
							[2] = {["use_roster"] = false, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 1, ["return_state"] = nil, ["task"] = "recipe_heat_exchange"}
						}
					}
					if entityrecord[1].get_inventory(defines.inventory.fuel).is_empty() then
						entityrecord[1].get_fuel_inventory().insert({name="solid-fuel",count=1})
					end
					table.insert(global.ROSTER, recipeHeatExchanger)
				end
				global.NHeatExchanger = nil
			end
			global.TickerB = nil
			global.dirty = {}
			global.dirty[game.tick+54000] = true
			--game.write_file("/test/ROSTER.txt", serpent.block(global.ROSTER))
			game.print("Applied UraniumPower 0.6.6 changes")
		end
	end
end)

function initialize_tasks_table()
	-----------------------------------------------------------------------------
	-- Defining table of update functions for each entity names
	task_names = {
		["inspect_reactor"] = inspect_reactor,
		["add_reactor_energy"] = add_reactor_energy,
		["high_pressure_steam_generation"] = high_pressure_steam_generation,
		["low_pressure_steam_condensation"] = low_pressure_steam_condensation,
		["calculate_generator_power_output"] = calculate_generator_power_output,
		["recipe_heat_exchange_crafting_progress"] = recipe_heat_exchange_crafting_progress,
		["recipe_heat_exchange"] = recipe_heat_exchange,
		["wall_heat_exchange"] = wall_heat_exchange
	}
	task_to_index = {
		["nuclear-fission-reactor-3-by-3"] = {
			["inspect_reactor"] = 1,
			["add_reactor_energy"] = 2
		},
		["nuclear-fission-reactor-5-by-5"] = {
			["inspect_reactor"] = 1,
			["add_reactor_energy"] = 2
		},
		["reactor-steam-generator-01"] = {
			["high_pressure_steam_generation"] = 1
		},
		["reactor-turbine-generator-01a"] = {
			["low_pressure_steam_condensation"] = 1,
			["calculate_generator_power_output"] = 2
		},
		["reactor-turbine-generator-01b"] = {
			["low_pressure_steam_condensation"] = 1,
			["calculate_generator_power_output"] = 2
		},
		["heat-exchanger"] = {
			["wall_heat_exchange"] = 1,
		},
		["S-new-heat-exchanger-01"] = {
			["recipe_heat_exchange_crafting_progress"] = 1,
			["recipe_heat_exchange"] = 2
		},
		["R-new-heat-exchanger-01"] = {
			["recipe_heat_exchange_crafting_progress"] = 1,
			["recipe_heat_exchange"] = 2
		},
		["S-new-heat-exchanger-02"] = {
			["recipe_heat_exchange_crafting_progress"] = 1,
			["recipe_heat_exchange"] = 2
		},
		["R-new-heat-exchanger-02"] = {
			["recipe_heat_exchange_crafting_progress"] = 1,
			["recipe_heat_exchange"] = 2
		}
	}
	task_default_states = {
		["nuclear-fission-reactor-3-by-3"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["nuclear-fission-reactor-5-by-5"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["reactor-steam-generator-01"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["reactor-turbine-generator-01a"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["reactor-turbine-generator-01b"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["heat-exchanger"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["S-new-heat-exchanger-01"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = false, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["R-new-heat-exchanger-01"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = false, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["S-new-heat-exchanger-02"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = false, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		},
		["R-new-heat-exchanger-02"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["return_state"] = nil},
			[2] = {["use_roster"] = false, ["active"] = false, ["ticked"] = false, ["return_state"] = nil}
		}
	}
end

script.on_load(function()
	initialize_tasks_table()
end)

function clean_global()
	-- game.print("Table cleaning due on "..game.tick)
	-----------------------------------------------------------------------------
	-- Cleaning ROSTER
	-- Disables for now as this messes up ROSTER indexing and I am currently using for ticking logic
	if global.ROSTER then
		-- game.print("Cleaning ROSTER")
		local new_ROSTER = {}
		for index,value in pairs(global.ROSTER) do
			if value ~=nil   then
				new_ROSTER[index] = value
			end
		end
		global.ROSTER = new_ROSTER
	end
	-----------------------------------------------------------------------------
	-- Cleaning ACTIVE
	if global.ACTIVE then
		-- game.print("Cleaning ACTIVE")
		local new_ACTIVE = {}
		for tick,tasks_table in pairs(global.ACTIVE) do
			if tasks_table ~= nil then
				new_ACTIVE[tick] = new_ACTIVE[tick] or {}
				local new_tasks_table = {}
				for _, task_entry in pairs(tasks_table) do
					if task_entry ~= nil then
						table.insert(new_tasks_table,task_entry)
					end
				end
				new_ACTIVE[tick] = new_tasks_table
			end
		end
		global.ACTIVE = new_ACTIVE
	end
	-- game.print("Next table cleaning due on "..game.tick+54000)
	global.dirty[game.tick] = nil
	global.dirty[game.tick+54000] = true
end

function setActiveTick(entity_index, entity_name, task, tick)
	
	local do_task_on = {entity_index, entity_name, task}
	local task_index = task_to_index[entity_name][task]
	
	global.ACTIVE[tick] = global.ACTIVE[tick] or {}	
	table.insert(global.ACTIVE[tick],do_task_on)
	logger("afterticking", game.tick, tick, entity_index, entity_name, task, global.ROSTER[entity_index]["update"][task_index]["task"])
end

function inspect_table(entity_index)
	if entity_index == nil then
		return
	elseif global.ROSTER[entity_index] ~= nil then
		local entity_table = global.ROSTER[entity_index]
		if entity_table[1][1].valid then
			local entity_name = entity_table[1][1].name
			if entity_name == "nuclear-fission-reactor-3-by-3" or entity_name == "nuclear-fission-reactor-5-by-5" then
				if not entity_table[2].valid then
					-- Reactor chest reference
					local x = entity_table["record"][2]["position"]["x"]
					local y = entity_table["record"][2]["position"]["y"]
					local subentity_name = entity_table["record"][2]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][2]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local ghost = game.surfaces[surface_name].find_entity("entity-ghost",{x,y})
					local entity 
					if ghost ~= nil then
						entity = select(2,ghost.revive())
					end
					
					if entity ~= nil then
						entity_table[2] = entity
						entity_table["record"][2]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					else
						local entity = game.surfaces[surface_name].create_entity{name = subentity_name, position = {x,y}, direction = direction, force = subentity_force}
						entity_table[2] = entity
						entity_table["record"][2]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
			elseif entity_name == "reactor-steam-generator-01" then
				if not entity_table[2].valid then
					-- Reactor reference
					-- Sorry no reviving reactor but can keep checking for a new one in the same place
					local x = entity_table["record"][2]["position"]["x"]
					local y = entity_table["record"][2]["position"]["y"]
					local subentity_name = entity_table["record"][2]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][2]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local reactor = game.surfaces[surface_name].find_entity("nuclear-fission-reactor-3-by-3",{x,y})
					if reactor ~= nil then
						entity_table[2] = reactor
						entity_table["record"][2]["id"] = reactor.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
				if not entity_table[3][1].valid then
					-- Hot Leg reference
					local x = entity_table["record"][3]["position"]["x"]
					local y = entity_table["record"][3]["position"]["y"]
					local subentity_name = entity_table["record"][3]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][3]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local ghost = game.surfaces[surface_name].find_entity("entity-ghost",{x,y})
					local entity 
					if ghost ~= nil then
						entity = select(2,ghost.revive())
					end

					if entity ~= nil then
						entity_table[3][1] = entity
						entity_table[3][2] = entity.fluidbox
						entity_table["record"][3]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					else
						local entity = game.surfaces[surface_name].create_entity{name = subentity_name, position = {x,y}, direction = direction, force = subentity_force}
						entity_table[3][1] = entity
						entity_table[3][2] = entity.fluidbox
						entity_table["record"][3]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
				if not entity_table[4][1].valid then
					-- Cold Leg reference
					local x = entity_table["record"][4]["position"]["x"]
					local y = entity_table["record"][4]["position"]["y"]
					local subentity_name = entity_table["record"][4]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][4]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local ghost = game.surfaces[surface_name].find_entity("entity-ghost",{x,y})
					local entity 
					if ghost ~= nil then
						entity = select(2,ghost.revive())
					end

					if entity ~= nil then
						entity_table[4][1] = entity
						entity_table[4][2] = entity.fluidbox
						entity_table["record"][4]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					else
						local entity = game.surfaces[surface_name].create_entity{name = subentity_name, position = {x,y}, direction = direction, force = subentity_force}
						entity_table[4][1] = entity
						entity_table[4][2] = entity.fluidbox
						entity_table["record"][4]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
			elseif entity_name == "reactor-turbine-generator-01a" or entity_name == "reactor-turbine-generator-01b" then
				if not entity_table[2][1][1].valid then
					-- Low pressure steam box reference
					local x = entity_table["record"][2]["position"]["x"]
					local y = entity_table["record"][2]["position"]["y"]
					local subentity_name = entity_table["record"][2]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][2]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local ghost = game.surfaces[surface_name].find_entity("entity-ghost",{x,y})
					local entity 
					if ghost ~= nil then
						entity = select(2,ghost.revive())
					end

					if entity ~= nil then
						entity_table[2][1][1] = entity
						entity_table[2][1][2] = entity.fluidbox
						entity_table["record"][2]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					else
						local entity = game.surfaces[surface_name].create_entity{name = subentity_name, position = {x,y}, direction = direction, force = subentity_force}
						entity_table[2][1][1] = entity
						entity_table[2][1][2] = entity.fluidbox
						entity_table["record"][2]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
				if not entity_table[3][1].valid then
					-- Cold Leg reference
					local x = entity_table["record"][3]["position"]["x"]
					local y = entity_table["record"][3]["position"]["y"]
					local subentity_name = entity_table["record"][3]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][3]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local ghost = game.surfaces[surface_name].find_entity("entity-ghost",{x,y})
					local entity 
					if ghost ~= nil then
						entity = select(2,ghost.revive())
					end

					if entity ~= nil then
						entity_table[3][1] = entity
						entity_table[3][2] = entity.fluidbox
						entity_table["record"][3]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					else
						local entity = game.surfaces[surface_name].create_entity{name = subentity_name, position = {x,y}, direction = direction, force = subentity_force}
						entity_table[3][1] = entity
						entity_table[3][2] = entity.fluidbox
						entity_table["record"][3]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
				if not entity_table[4][1].valid then
					-- Cooling Water reference
					local x = entity_table["record"][4]["position"]["x"]
					local y = entity_table["record"][4]["position"]["y"]
					local subentity_name = entity_table["record"][4]["name"]
					local surface_name = entity_table["record"]["surfacename"]
					local direction = entity_table["record"][4]["direction"]
					local subentity_force = entity_table["record"]["force"]
					local ghost = game.surfaces[surface_name].find_entity("entity-ghost",{x,y})
					local entity 
					if ghost ~= nil then
						entity = select(2,ghost.revive())
					end

					if entity ~= nil then
						entity_table[4][1] = entity
						entity_table[4][2] = entity.fluidbox
						entity_table["record"][4]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					else
						local entity = game.surfaces[surface_name].create_entity{name = subentity_name, position = {x,y}, direction = direction, force = subentity_force}
						entity_table[4][1] = entity
						entity_table[4][2] = entity.fluidbox
						entity_table["record"][4]["id"] = entity.unit_number
						global.ROSTER[entity_index] = entity_table
					end
				end
			end
		end
	end
end

function logger(logtype, ...)
	if logging then
		local data = {...}
		if logtype == "beginticking" then
			local tick, roster_index, entity_name, assigned_task = data[1], data[2], data[3], data[4]
			local str = string.format("%-10s%3s%33s%40s\n", tick, roster_index, entity_name, assigned_task)
			game.write_file("/UraniumPower/BEGINTICKING.txt", str, true)
		elseif logtype == "afterticking" then
			local tick, next_tick, roster_index, entity_name, assigned_task = data[1], data[2], data[3], data[4], data[5]
			local str = string.format("%-10s %-10s%3s%33s%40s\n", tick, next_tick, roster_index, entity_name, assigned_task)
			game.write_file("/UraniumPower/AFTERTICKING.txt", str, true)
		elseif logtype == "stopticking" then
			local tick, roster_index, entity_name, assigned_task = data[1], data[2], data[3], data[4]
			local str = string.format("%-10s%3s%33s%40s\n", tick, roster_index, entity_name, assigned_task)
			game.write_file("/UraniumPower/STOPTICKING.txt", str, true)
		end
	end
end

script.on_event(defines.events.on_tick, function(event)
	if global.dirty[game.tick] then
		clean_global()
	end
		
	if global.TickerA == 0 then
		global.TickerA = 59
		-- Once per second check ROSTER for things that could be set to ACTIVE
		for entity_index,entity_table in pairs(global.ROSTER) do
			if entity_table ~= nil then
				if entity_table[1][1].valid then
					
					local entity_tasks = entity_table["update"]
				
					if entity_tasks ~= nil then
						for task_index = 1,#entity_tasks do
							if entity_tasks[task_index]["use_roster"] then
								if not entity_tasks[task_index]["active"] then
									if not entity_tasks[task_index]["ticked"] then

										local next_tick = game.tick
										local task = entity_tasks[task_index]["task"]
										
										setActiveTick(entity_index, entity_table[1][1].name, task, next_tick)
										-- game.print("On game tick"..game.tick.." activated task:"..task.." for "..entity_table[1][1].name.." at "..entity_table[1][1].position.x..", "..entity_table[1][1].position.y.." to tick on "..next_tick)
									end
									entity_table["update"][task_index]["active"] = true
								end
							end
						end
					end
				else
					-- game.print("Something died while in ROSTER.")
					inspect_table(entity_index, entity_table)
					global.ROSTER[entity_index] = nil
				end
			end
		end
	else
		global.TickerA = global.TickerA - 1
	end
	-- ACTIVE entities.  Tick according to rules.  Subscription based ticking.
	if global.ACTIVE[game.tick] then
		-- game.print("There are tasks to do on game tick: "..game.tick)
		for k,task_entry in pairs(global.ACTIVE[game.tick]) do
			
			local entity_index, task , entity_table = nil, nil, nil
			
			if task_entry ~= nil then
				entity_index = task_entry[1]
				task = task_entry[3]
				entity_table = global.ROSTER[entity_index]
			
				if entity_table ~= nil then
					if entity_table[1][1].valid then
						logger("beginticking", game.tick, entity_index, entity_table[1][1].name, task)
						local task_completed = false
						local return_code = nil
						local extra_return_parameter = nil
						local task_index = nil
						
						-- game.print("Performing task on "..entity_table[1][1].name)
						-- Check task compatibility on entity..For some reason a task can be wrongly assigned to an entity..WTF!?
						if task_to_index[entity_table[1][1].name][task] ~= nil then
							-- Task compatible.  Run task!
							task_index = task_to_index[entity_table[1][1].name][task]
							task_completed, return_code, extra_return_parameter = task_names[task](entity_index)
						else
							-- Task incompatible.  WTF!?  How did this happen?!
							local roster = {}
							local active = {}
							
							roster = table.deepcopy(global.ROSTER)
							active = table.deepcopy(global.ACTIVE)
							game.print("Task: "..task.." was wrongly assigned for "..entity_table[1][1].name.." on tick: "..game.tick.."! It can be found at(x,y): "..entity_table[1][1].position.x..","..entity_table[1][1].position.y)
							game.print("Entity might not recovered from this error and might need to be rebuilt!")
							game.print("global.ACTIVE and global.ROSTER have been dumped to script-output/UraniumPower.  Please include them and a screen-shot of this message when reporting this error!")
							game.write_file("/UraniumPower/global.ROSTER_tick_"..game.tick.."_entity-index_"..entity_index..".txt", serpent.block(roster))
							game.write_file("/UraniumPower/global.ACTIVE_tick_"..game.tick..".txt", serpent.block(active))
							
							-- Try to salvage global.ACTIVE by striking out any entries containing the same entity_index
							for tick,tasks_table in pairs(global.ACTIVE) do
								if tasks_table ~= nil then
									for _, task_entry in pairs(tasks_table) do
										if task_entry ~= nil then
											if task_entry[1] == entity_index then
												task_entry = nil
											end
										end
									end
								end
							end
							-- Reset all tasks to default states for entity
							for taskIndex,_ in pairs(entity_table["update"]) do
								entity_table["update"][taskIndex]["use_roster"] = task_default_states[entity_table[1][1].name][taskIndex]["use_roster"]
								entity_table["update"][taskIndex]["active"] = task_default_states[entity_table[1][1].name][taskIndex]["active"]
								entity_table["update"][taskIndex]["ticked"] = task_default_states[entity_table[1][1].name][taskIndex]["ticked"]
								entity_table["update"][taskIndex]["return_state"] = task_default_states[entity_table[1][1].name][taskIndex]["return_state"]
							end
							global.ACTIVE[game.tick][k] = nil
						end

						if task_completed then
							-- game.print("Task: "..task.." completed on "..entity_table[1][1].name.." at(x,y) "..entity_table[1][1].position.x..","..entity_table[1][1].position.y.." on tick: "..game.tick)
							
							local next_tick = nil
							
							entity_table["update"][task_index]["ticked"] = true
							entity_table["update"][task_index]["ticked_on"] = game.tick
							entity_table["update"][task_index]["return_state"] = return_code
							
							if extra_return_parameter == nil then	
								if entity_table["update"][task_index]["active"] then
									-- game.print("Retick: "..entity_table[1][1].name.." at "..entity_table[1][1].position.x..", "..entity_table[1][1].position.y.." Index: "..entity_index.." Task index: "..task_index.." on tick: "..next_tick)
									
									local entity_name = entity_table[1][1].name
									
									if task_to_index[entity_name][task] ~= nil then
										task_index = task_to_index[entity_name][task]
										next_tick = game.tick + entity_table["update"][task_index]["frequency"]
										setActiveTick(entity_index, entity_name, task, next_tick)
									else
										entity_table["update"][task_index]["active"] = false
									end
								end
							elseif type(extra_return_parameter) == "number" then
								-- task next_tick changed to another number, but continues on the same task
								
								local entity_name =  entity_table[1][1].name
								
								next_tick = extra_return_parameter
								if task_to_index[entity_name][task] ~= nil then
									setActiveTick(entity_index, entity_name, task, next_tick)
								else
									entity_table["update"][task_index]["active"] = false
								end
							elseif extra_return_parameter == "recipe_heat_exchange" then
								-- task recipe_heat_exchange_crafting_progress caught crafting progress at 100%, disabling task recipe_heat_exchange_crafting_progress
								entity_table["update"][task_index]["use_roster"] = false
								entity_table["update"][task_index]["active"] = false
								-- activating task recipe_heat_exchange, which checks on each tick until it can be performed
								
								local entity_name = entity_table[1][1].name
								
								task = extra_return_parameter
								if task_to_index[entity_name][task] ~= nil then
									task_index = task_to_index[entity_name][task]
									next_tick = game.tick + entity_table["update"][task_index]["frequency"]
									entity_table["update"][task_index]["active"] = true
									setActiveTick(entity_index, entity_name, task, next_tick)
								else
									entity_table["update"][task_index]["active"] = false
								end
							elseif extra_return_parameter == "recipe_heat_exchange_crafting_progress" then
								-- task recipe_heat_exchange succeeded, disabling until called again by recipe_heat_exchange_crafting_progress
								entity_table["update"][task_index]["active"] = false
								-- activating recipe_heat_exchange_crafting_progress
								
								local entity_name = entity_table[1][1].name
								
								task = extra_return_parameter
								if task_to_index[entity_name][task] ~= nil then
									task_index = task_to_index[entity_name][task]
									next_tick = game.tick + entity_table["update"][task_index]["frequency"]
									entity_table["update"][task_index]["use_roster"] = true
									entity_table["update"][task_index]["active"] = true
									setActiveTick(entity_index, entity_name, task, next_tick)
								else
									entity_table["update"][task_index]["active"] = false
								end
							end
							global.ACTIVE[game.tick][k] = nil
						else
							if return_code == 1 then
								-- game.print("Failed to tick "..entity_table[1][1].name.." at "..entity_table[1][1].position.x..", "..entity_table[1][1].position.y.." due to insufficient condition on task: "..task.." on game tick: "..game.tick)
								entity_table["update"][task_index]["active"] = false
								entity_table["update"][task_index]["ticked"] = false
								entity_table["update"][task_index]["return_state"] = return_code
							end
							if return_code == 2 then
								-- game.print("Failed to tick "..entity_table[1][1].name.." at "..entity_table[1][1].position.x..", "..entity_table[1][1].position.y.." due to invalid references")
								entity_table["update"][task_index]["ticked"] = false
								entity_table["update"][task_index]["active"] = false
								entity_table["update"][task_index]["return_state"] = return_code
								inspect_table(entity_index)
							end
							global.ACTIVE[game.tick][k] = nil
						end
					else
						-- game.print("Something died while in ACTIVE.")
						global.ACTIVE[game.tick][k] = nil
					end
				end
			end
		end
		global.ACTIVE[game.tick] = nil
	end
end)

script.on_event(defines.events.on_built_entity, function(event)
	local x1 = event.created_entity.position.x
	local y1 = event.created_entity.position.y
	local x2 = x1
	local y2 = y1
	
	-- Fission reactor stuff
	if event.created_entity.name == "nuclear-fission-reactor-3-by-3" then
		event.created_entity.operable = false
		if (game.players[event.player_index].get_inventory(defines.inventory.player_quickbar).get_item_count("nuclear-fission-reactor-chest-15") + game.players[event.player_index].get_inventory(defines.inventory.player_main).get_item_count("nuclear-fission-reactor-chest-15")) < 1 then
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-15", count = 1})
		end
		game.players[event.player_index].print("Place the reactor access port next to the fission reactor.")
	elseif event.created_entity.name == "nuclear-fission-reactor-5-by-5" then
		event.created_entity.operable = false
		if (game.players[event.player_index].get_inventory(defines.inventory.player_quickbar).get_item_count("nuclear-fission-reactor-chest-25") + game.players[event.player_index].get_inventory(defines.inventory.player_main).get_item_count("nuclear-fission-reactor-chest-25")) < 1 then
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
		end
		game.players[event.player_index].print("Place the reactor access port next to the fission reactor.")
	elseif event.created_entity.name == "nuclear-fission-reactor-chest-15" then
		x1 = x1 - 1
		y1 = y1 - 1
		x2 = x2 + 1
		y2 = y2 + 1
		results = event.created_entity.surface.find_entities_filtered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
		if #results == 1 then
			local reactorAndChest = {}
			-- Reference to reactor building
			reactorAndChest["record"] = {
				[1] = {
					["id"] = results[1].unit_number,
					["position"] = {
						["x"] = results[1].position.x,
						["y"] = results[1].position.y
					},
					["name"] = results[1].name,
					["direction"] = results[1].direction,
					["type"] = game.entity_prototypes[results[1].name].type
				}, 
				[2] = {
					["id"] = event.created_entity.unit_number,
					["position"] = {
						["x"] = event.created_entity.position.x,
						["y"] = event.created_entity.position.y
					},
					["name"] = event.created_entity.name,
					["direction"] = event.created_entity.direction,
					["type"] = game.entity_prototypes[event.created_entity.name].type
				},
				["surfacename"] = results[1].surface.name,
				["force"] = game.players[event.player_index].force
			}
			reactorAndChest[1] = {
				[1] = results[1],
				[2] = results[1].fluidbox
			}
			-- Reference to reactor chest
			reactorAndChest[2] = event.created_entity
			-- Energy potential in chest
			reactorAndChest[3] = 0
			-- Energy buffer in J
			reactorAndChest[4] = 0
			-- Energy output in J
			reactorAndChest[5] = 0
			-- Reactor state
			reactorAndChest[6] = false
			reactorAndChest["update"] = {
				[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 60, ["return_state"] = nil, ["task"] = "inspect_reactor"},
				[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 1, ["return_state"] = nil, ["task"] = "add_reactor_energy"}
			}
			table.insert(global.ROSTER, reactorAndChest)
			
			game.players[event.player_index].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-15", count = 1})
			game.players[event.player_index].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
			event.created_entity.destroy()
		end
	elseif event.created_entity.name == "nuclear-fission-reactor-chest-25" then
		x1 = x1 - 4
		y1 = y1 - 4
		x2 = x2 + 4
		y2 = y2 + 4
		results = event.created_entity.surface.find_entities_filtered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
		if #results == 1 then
			local reactorAndChest = {}
			-- Reference to reactor building
			reactorAndChest["record"] = {
				[1] = {
					["id"] = results[1].unit_number,
					["position"] = {
						["x"] = results[1].position.x,
						["y"] = results[1].position.y
					},
					["name"] = results[1].name,
					["direction"] = results[1].direction,
					["type"] = game.entity_prototypes[results[1].name].type
				}, 
				[2] = {
					["id"] = event.created_entity.unit_number,
					["position"] = {
						["x"] = event.created_entity.position.x,
						["y"] = event.created_entity.position.y
					},
					["name"] = event.created_entity.name,
					["direction"] = event.created_entity.direction,
					["type"] = game.entity_prototypes[event.created_entity.name].type
				},
				["surfacename"] = results[1].surface.name,
				["force"] = game.players[event.player_index].force
			}
			reactorAndChest[1] = {
				[1] = results[1],
				[2] = results[1].fluidbox
			}
			-- Reference to reactor chest
			reactorAndChest[2] = event.created_entity
			-- Energy potential in chest
			reactorAndChest[3] = 0
			-- Energy buffer in J
			reactorAndChest[4] = 0
			-- Energy output in J
			reactorAndChest[5] = 0
			-- Reactor state
			reactorAndChest[6] = false
			reactorAndChest["update"] = {
				[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 60, ["return_state"] = nil, ["task"] = "inspect_reactor"},
				[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 1, ["return_state"] = nil, ["task"] = "add_reactor_energy"}
			}
			table.insert(global.ROSTER, reactorAndChest)
			
			game.players[event.player_index].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
		else			
			game.players[event.player_index].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
			game.players[event.player_index].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")			
			event.created_entity.destroy()
		end
		
	-- Heat exchanger stuff
	elseif event.created_entity.name == "heat-exchanger" then
		
		local x = event.created_entity.position.x
		local y = event.created_entity.position.y
		
		local up = event.created_entity.surface.find_entities_filtered{position = {x, y-1}, type = "pipe"}
		local down = event.created_entity.surface.find_entities_filtered{position = {x, y+1}, type = "pipe"}
		local left = event.created_entity.surface.find_entities_filtered{position = {x-1, y}, type = "pipe"}
		local right = event.created_entity.surface.find_entities_filtered{position = {x+1, y}, type = "pipe"}
		-- game.print("Up: "..#up.." Down: "..#down.." Left: "..#left.." Right: "..#right)
		if (#up+#down) == 2 or (#left+#right) == 2 then
			local wallheatExchanger = {}
			wallheatExchanger["record"] = {
				[1] = {
					["id"] = event.created_entity.unit_number,
					["position"] = {
						["x"] = event.created_entity.position.x,
						["y"] = event.created_entity.position.y
					},
					["name"] = event.created_entity.name,
					["type"] = game.entity_prototypes[event.created_entity.name].type
				},
				["surfacename"] = event.created_entity.surface.name,
				["force"] = game.players[event.player_index].force
			}	
			wallheatExchanger[1] = {
				[1] = event.created_entity
			}
			if up[1] ~= nil and down[1] ~= nil then
				-- game.print("up and down working")
				wallheatExchanger[2] = {
					[1] = up[1],
					[2] = up[1].fluidbox
				}
				wallheatExchanger[3] = {
					[1] = down[1],
					[2] = down[1].fluidbox
				}
			elseif left[1] ~= nil and right[1] ~= nil then
				-- game.print("left and right working")
				wallheatExchanger[2] = {
					[1] = left[1],
					[2] = left[1].fluidbox
				}
				wallheatExchanger[3] = {
					[1] = right[1],
					[2] = right[1].fluidbox
				}
			end
			wallheatExchanger["update"] = {
				[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 5, ["return_state"] = nil, ["task"] = "wall_heat_exchange"}
			}
			table.insert(global.ROSTER, wallheatExchanger)
		else
			game.players[event.player_index].print("There must be two pipes flanking the heat exchanger")
			game.players[event.player_index].print("Building returning to your inventory. Please replace the heat exchanger.")
			game.players[event.player_index].insert({name = "heat-exchanger", count = 1})
			event.created_entity.destroy()
		end
	elseif event.created_entity.name == "S-new-heat-exchanger-01" 
		or event.created_entity.name == "R-new-heat-exchanger-01"
		or event.created_entity.name == "S-new-heat-exchanger-02"
		or event.created_entity.name == "R-new-heat-exchanger-02" then

		local recipeHeatExchanger = {}
		recipeHeatExchanger["record"] = {
			[1] = {
				["id"] = event.created_entity.unit_number,
				["position"] = {
					["x"] = event.created_entity.position.x,
					["y"] = event.created_entity.position.y
				},
				["name"] = event.created_entity.name,
				["type"] = game.entity_prototypes[event.created_entity.name].type
			},
			["surfacename"] = event.created_entity.surface.name,
			["force"] = game.players[event.player_index].force
		}
		recipeHeatExchanger[1] = {
			[1] = event.created_entity,
			[2] = event.created_entity.fluidbox
		}
		recipeHeatExchanger["update"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 5, ["return_state"] = nil, ["task"] = "recipe_heat_exchange_crafting_progress"},
			[2] = {["use_roster"] = false, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 1, ["return_state"] = nil, ["task"] = "recipe_heat_exchange"}
		}
		event.created_entity.get_fuel_inventory().insert({name="solid-fuel",count=1})
		table.insert(global.ROSTER, recipeHeatExchanger)
		
	-- Steam Generator stuff	
	elseif event.created_entity.name == "reactor-steam-generator-01" then
		local entityX = event.created_entity.position.x
		local entityY = event.created_entity.position.y
		local entityDirection = event.created_entity.direction
		local internals = steamGeneratorInternals[event.created_entity.name]
		local findReactor = event.created_entity.surface.find_entities_filtered{area = {{entityX-5, entityY-5}, {entityX+5, entityY+5}}, name = "nuclear-fission-reactor-3-by-3"}
		
		--Warn player if no reactor is found.
		if #findReactor == 0 then
			game.players[event.player_index].print("250 MW Nuclear Reactor not dectected! This building is not designed to function without a reactor.")
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
			local steam_generator = {}
			--Reference to steam generator building
			steam_generator[1] = {
				[1] = event.created_entity,
				[2] = event.created_entity.fluidbox
			}
			--Reference to connected reactor
			steam_generator[2] = findReactor[1]
			--Entity Hot Leg box
			local hotLegBox = event.created_entity.surface.create_entity{name = internals[entityDirection][2][1], direction = internals[entityDirection][2][2], position = {x = entityX+internals[entityDirection][2][3],y = entityY+internals[entityDirection][2][4]}, force = game.players[event.player_index].force}
			steam_generator[3] = {
				[1] = hotLegBox,
				[2] = hotLegBox.fluidbox
			}
			--Entity Cold Leg box
			local coldLegBox = event.created_entity.surface.create_entity{name = internals[entityDirection][3][1], direction = internals[entityDirection][3][2], position = {x = entityX+internals[entityDirection][3][3],y = entityY+internals[entityDirection][3][4]}, force = game.players[event.player_index].force}
			steam_generator[4] = {
				[1] = coldLegBox,
				[2] = coldLegBox.fluidbox
			}
			--Heat Output
			steam_generator[5] = 0
			--Performance of downstream condenser
			steam_generator[6] = 1
			--Steam counter
			steam_generator[7] = 0
			steam_generator["record"] = {
				[1] = {
					["id"] = event.created_entity.unit_number,
					["position"] = {
						["x"] = event.created_entity.position.x,
						["y"] = event.created_entity.position.y
					},
					["name"] = event.created_entity.name,
					["direction"] = event.created_entity.direction,
					["type"] = game.entity_prototypes[event.created_entity.name].type
				},
				[2] = {
					["id"] = findReactor[1].unit_number,
					["position"] = {
						["x"] = findReactor[1].position.x,
						["y"] = findReactor[1].position.y
					},
					["name"] = findReactor[1].name,
					["direction"] = findReactor[1].direction,
					["type"] = game.entity_prototypes[findReactor[1].name].type
				},
				[3] = {
					["id"] = hotLegBox.unit_number,
					["position"] = {
						["x"] = hotLegBox.position.x,
						["y"] = hotLegBox.position.y
					},
					["name"] = hotLegBox.name,
					["direction"] = hotLegBox.direction,
					["type"] = game.entity_prototypes[hotLegBox.name].type
				},
				[4] = {
					["id"] = coldLegBox.unit_number,
					["position"] = {
						["x"] = coldLegBox.position.x,
						["y"] = coldLegBox.position.y
					},
					["name"] = coldLegBox.name,
					["direction"] = coldLegBox.direction,
					["type"] = game.entity_prototypes[coldLegBox.name].type
				},
				["surfacename"] = event.created_entity.surface.name,
				["force"] = game.players[event.player_index].force
			}
			steam_generator["update"] = {
				[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 60, ["return_state"] = nil, ["task"] = "high_pressure_steam_generation"}
			}
			table.insert(global.ROSTER, steam_generator)
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
		--Reference to turbine generator building
		turbine_generator[1] = {
			[1] = event.created_entity,
			[2] = event.created_entity.fluidbox
		}
		--Low Pressure Steam Box
		--[1] = Reference to low pressure steam box
		--[2] = Low Pressure Steam Avg Temperature
		--[3] = Low Pressure Steam Overflow
		local lowPressureSteamBox = event.created_entity.surface.create_entity{name = internals[entityDirection][1][1], direction = internals[entityDirection][1][2], position = {x = entityX+internals[entityDirection][1][3],y = entityY+internals[entityDirection][1][4]}, force = game.players[event.player_index].force}
		turbine_generator[2] = {
			[1] = {
				[1] = lowPressureSteamBox,
				[2] = lowPressureSteamBox.fluidbox
			},
			[2] = {0},
			[3] = {0}
		}
		--Reference to Cold Leg box
		local coldLegBox = event.created_entity.surface.create_entity{name = internals[entityDirection][2][1], direction = internals[entityDirection][2][2], position = {x = entityX+internals[entityDirection][2][3],y = entityY+internals[entityDirection][2][4]}, force = game.players[event.player_index].force}
		turbine_generator[3] = {
			[1] = coldLegBox,
			[2] = coldLegBox.fluidbox
		}
		--Reference to Cooling Water box
		local coolingWaterBox = event.created_entity.surface.create_entity{name = internals[entityDirection][3][1], direction = internals[entityDirection][3][2], position = {x = entityX+internals[entityDirection][3][3],y = entityY+internals[entityDirection][3][4]}, force = game.players[event.player_index].force}
		turbine_generator[4] = {
			[1] = coolingWaterBox,
			[2] = coolingWaterBox.fluidbox
		}
		--Turbine Ticking
		turbine_generator[5] = 0
		--Energy Accounting
		turbine_generator[6] = 0
		--Super Heated Steam Accounting
		turbine_generator[7] = 0
		turbine_generator["record"] = {
			[1] = {
				["id"] = event.created_entity.unit_number,
				["position"] = {
					["x"] = event.created_entity.position.x,
					["y"] = event.created_entity.position.y
				},
				["name"] = event.created_entity.name,
				["direction"] = event.created_entity.direction,
				["type"] = game.entity_prototypes[event.created_entity.name].type
			},
			[2] = {
				["id"] = lowPressureSteamBox.unit_number,
				["position"] = {
					["x"] = lowPressureSteamBox.position.x,
					["y"] = lowPressureSteamBox.position.y
				},
				["name"] = lowPressureSteamBox.name,
				["direction"] = lowPressureSteamBox.direction,
				["type"] = game.entity_prototypes[lowPressureSteamBox.name].type
			},
			[3] = {
				["id"] = coldLegBox.unit_number,
				["position"] = {
					["x"] = coldLegBox.position.x,
					["y"] = coldLegBox.position.y
				},
				["name"] = coldLegBox.name,
				["direction"] = coldLegBox.direction,
				["type"] = game.entity_prototypes[coldLegBox.name].type
			},
			[4] = {
				["id"] = coolingWaterBox.unit_number,
				["position"] = {
					["x"] = coolingWaterBox.position.x,
					["y"] = coolingWaterBox.position.y
				},
				["name"] = coolingWaterBox.name,
				["direction"] = coolingWaterBox.direction,
				["type"] = game.entity_prototypes[coolingWaterBox.name].type
			},
			["surfacename"] = event.created_entity.surface.name,
			["force"] = game.players[event.player_index].force
		}
		turbine_generator["update"] = {
			[1] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 60, ["return_state"] = nil, ["task"] = "low_pressure_steam_condensation"},
			[2] = {["use_roster"] = true, ["active"] = false, ["ticked"] = false, ["ticked_on"] = 0, ["frequency"] = 1, ["return_state"] = nil, ["task"] = "calculate_generator_power_output"}
		}
		table.insert(global.ROSTER, turbine_generator)
	end
end)

function cleanup_subordinates(event)
	
	local entity_name = event.entity.name
	local entity_id = event.entity.unit_number
	
	for k,entity_table in pairs(global.ROSTER) do
		if entity_name == "nuclear-fission-reactor-3-by-3" or entity_name == "nuclear-fission-reactor-5-by-5" then
			if entity_id == entity_table["record"][1]["id"] then
				if entity_table[2].valid then
					local chestInventory = entity_table[2].get_inventory(defines.inventory.chest)
					if not chestInventory.is_empty() then
						local countBefore, countAfter, countRemain = 0, 0, 0
						if event.player_index ~= nil then
							player = game.players[event.player_index]
							for item, counts in pairs(chestInventory.get_contents()) do
								countBefore = player.get_item_count(item)
								player.insert({name = item, count = counts})
								countAfter = player.get_item_count(item)
								countRemain = (countBefore + counts) - countAfter
								if countRemain > 0 then
									local dropPlace
									for n=1, countRemain do
										dropPlace = player.surface.find_non_colliding_position("item-on-ground", player.position, 50, 0.5)
										if dropPlace then
											player.surface.create_entity({name = "item-on-ground", position = dropPlace, stack = {name = item, count = 1}})
										end
									end
								else
									chestInventory.remove({name = item, count=counts})
								end
							end
						end
						entity_table[2].destroy()
					else
						entity_table[2].destroy()
					end
				end				
				break
			end
		end
		if entity_name == "reactor-steam-generator-01" then
			if entity_id == entity_table["record"][1]["id"] then
				if entity_table[3][1].valid then
					entity_table[3][1].destroy()
				end
				if entity_table[4][1].valid then
					entity_table[4][1].destroy()
				end
				break
			end
		end
		if entity_name == "reactor-turbine-generator-01a" or entity_name == "reactor-turbine-generator-01b" then	
			if entity_id == entity_table["record"][1]["id"] then
				if entity_table[2][1][1].valid then
					entity_table[2][1][1].destroy()
				end
				if entity_table[3][1].valid then
					entity_table[3][1].destroy()
				end
				if entity_table[4][1].valid then
					entity_table[4][1].destroy()
				end
				break
			end
		end	
	end	
end

script.on_event(defines.events.on_entity_died, function(event)
	cleanup_subordinates(event)
end)

script.on_event(defines.events.on_preplayer_mined_item, function(event)
	local entity_name = event.entity.name
	local entity_id = event.entity.unit_number
	
	cleanup_subordinates(event)
	
	if entity_name == "S-new-heat-exchanger-01" or
	entity_name == "R-new-heat-exchanger-01" or
	entity_name == "S-new-heat-exchanger-02" or
	entity_name == "R-new-heat-exchanger-02" then
		if not event.entity.get_fuel_inventory().is_empty() then
			event.entity.get_fuel_inventory().clear()
		end
	end
end)

function inspect_reactor(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local reactor = entity_table[1][1]
	local reactorFluidBox = entity_table[1][2]
	local reactorChest = entity_table[2]
	
	-- calculate fuel energy
	if reactor.valid and reactorChest.valid then
		if entity_table["record"][1]["type"] == "boiler" then
			local fuelAssemblyPotential = fuelAssembly
			local reactor_type = reactorType
			local chestInventory = reactorChest.get_inventory(defines.inventory.chest)
			local reactorChestPotential = 0
			local reactorEnergyBuffer = entity_table[4] or 0
			local reactorEnergyOutput = entity_table[5] or 0
			
			if not chestInventory.is_empty() then
			
				local slot = math.random(1,#chestInventory)
				
				if chestInventory[slot].valid_for_read then 
					if fuelAssemblyPotential[chestInventory[slot].name] ~= nil then
						if reactorEnergyOutput > 1000 and entity_table[3] > 0 then
							local decayFactor = (reactorEnergyOutput / reactor_type[reactor.name][4]) * (reactorEnergyOutput / (entity_table[3] * reactor_type[reactor.name][1] * 1000000 * 60))
							chestInventory[slot].health = math.max(0, chestInventory[slot].health - (fuelAssemblyPotential[chestInventory[slot].name][2] * decayFactor))
							-- game.print("EOut : "..reactorEnergyOutput.." EBuff : "..reactorEnergyBuffer.." Decay Factor: "..decayFactor)
							if chestInventory[slot].health == 0 then
								chestInventory[slot].set_stack({name=fuelAssemblyPotential[chestInventory[slot].name][3],count=1})
							end
						end
					end
				end
				for assemblyType,count in pairs(chestInventory.get_contents()) do
					if fuelAssemblyPotential[assemblyType] ~= nil then
						reactorChestPotential = reactorChestPotential + (fuelAssemblyPotential[assemblyType][1] * count)
					end
				end
				entity_table[3] = reactorChestPotential
				
				-- Extrapolate energy consumed for the next 60 ticks and apply the minimum to reactor energy buffer
				-- As the fuels decay, the reactor performance factor will become dominant in stabilizing the energy output.
				if reactor.energy < (reactor_type[reactor.name][2] * 1000) and reactorFluidBox[1] ~= nil then
				
					local reactorEnergyPotential = reactor_type[reactor.name][1] * reactorChestPotential * 1000000 * 60
					local expectedEnergyConsumed = (reactor_type[reactor.name][3] * 1000) * 60
					
				-- game.print("Current energy buffer in (MJ) " .. reactorEnergyBuffer/1000000 .. "| Reactor Energy Potential (MJ) ".. reactorEnergyPotential/1000000 .. "| Expected Energy Consumed (MJ) " .. expectedEnergyConsumed/1000000 .." Tick: "..game.tick)
					if (reactorEnergyBuffer / expectedEnergyConsumed) < 1 then
						entity_table[4] = math.min(expectedEnergyConsumed, reactorEnergyPotential) + reactorEnergyBuffer
					end
					
					-- Debug stuff
					-- local temp = 0
					--[[if reactor.fluidbox[1] ~= nil then
						temp = reactor.fluidbox[1].temperature
					else
						temp = 15
					end]]
					-- game.print("Current energy output in (KW) " .. entity_table[5]/1000 .. "| Current energy reserves in (J) " .. reactor.energy .. "| Reactor Temperature (C) " .. temp)
					-- game.print("Injected energy buffer in (MJ) " .. entity_table[4]/1000000)
					
					-- Reset energy counter
					entity_table[5] = 0
					return true, 0
				end
				return false, 1
			else 
				entity_table[3] = 0
				return false, 1
			end
			return false, 1
		end
		return false, 1
	else
		return false, 2
	end
end

function add_reactor_energy(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local reactor = entity_table[1][1]
	local reactorFluidBox = entity_table[1][2]
	local reactorChest = entity_table[2]
	
	if reactor.valid and reactorChest.valid then
		if entity_table["record"][1]["type"] == "boiler" then
			local reactor_type = reactorType
			local chestInventory = reactorChest.get_inventory(defines.inventory.chest)
			local reactorEnergyBuffer = entity_table[4] or 0
			local reactorHeatOutput = entity_table[5] or 0
			local reactorOn = entity_table[6]
			local energyAdd = 0
			
			if not chestInventory.is_empty() and reactor.energy < (reactor_type[reactor.name][2] * 1000) and reactorFluidBox[1] ~= nil then
				reactorOn = true
			else
				reactorOn = false
				return false, 1
			end
			
			if reactorOn then
				-- game.print(tostring(reactorOn))
				-- Add energy directly to boiler from reactor energy buffer
				-- 1% extra is added to the boiler during ramp-up phase so it does not complain that it's empty of fuel
				if reactor.energy <= 0 then
					energyAdd = (reactor_type[reactor.name][2] * 1000 * 1.01) - reactor.energy
				else
					energyAdd = (reactor_type[reactor.name][2] * 1000) - reactor.energy
				end
				local energyRemain = reactorEnergyBuffer - energyAdd
				if energyRemain > 0 then
					entity_table[4] = energyRemain
					reactor.energy = reactor.energy + energyAdd			
				end
				
				entity_table[5] = reactorHeatOutput + energyAdd
				return true, 0
			end
		end
		return false, 1
	else
		return false, 2
	end
end

function high_pressure_steam_generation(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local steam_generator_internals = steamGeneratorInternals
	local fluid_properties = global.fluidProperties

	if entity_table[1][1].valid and entity_table[2].valid and entity_table[3][1].valid and entity_table[4][1].valid then
		if entity_table["record"][1]["type"] == "storage-tank" then
			if entity_table[3][2][1] ~= nil and entity_table[4][2][1] ~= nil then
				if round(entity_table[3][2][1].temperature,1) > 280 and entity_table[4][2][1].amount > 5 then
					local steamGenerator_fluidbox = 0
					local pipebus_fluidbox = entity_table[3][2][1]
					local coldLeg_fluidbox = entity_table[4][2][1]
					local pipebus_max_volume = steamGeneratorInternals[entity_table[1][1].name][entity_table[3][1].name][1] * 10
					local condenser_efficiency = entity_table[6]
					local previousSteamVolume = entity_table[7]
					local generatedSteam = 0
					local steamGenerator_available_volume = 0
					if entity_table[1][2][1] == nil then
						entity_table[7] = 0.001
						entity_table[1][2][1] = {
									["type"] = "superheated-steam",
									["amount"] = entity_table[7],
									["temperature"] = fluid_properties["superheated-steam"][2]
						}
						steamGenerator_fluidbox = entity_table[1][2][1]
						steamGenerator_available_volume = (steamGeneratorInternals[entity_table[1][1].name]["self"][1] * 10) - steamGenerator_fluidbox.amount
					else
						steamGenerator_fluidbox = entity_table[1][2][1]
						steamGenerator_available_volume = (steamGeneratorInternals[entity_table[1][1].name]["self"][1] * 10) - steamGenerator_fluidbox.amount
					end
					if steamGenerator_available_volume > 0 then
						--Hot Leg Water Energy
						--Limit temperature drop to be not less than 280 C
						local pipebus_fluidboxEnergy = pipebus_fluidbox.amount * (pipebus_fluidbox.temperature - fluid_properties[pipebus_fluidbox.type][1]) * fluid_properties[pipebus_fluidbox.type][3]
						local pipebus_fluidboxSuperHeatEnergy = pipebus_fluidbox.amount * (pipebus_fluidbox.temperature - 280) * fluid_properties[pipebus_fluidbox.type][3]
						--Cold Leg Water Energy Density
						local coldLegMaximum_Energy = (fluid_properties[coldLeg_fluidbox.type][2] - fluid_properties[coldLeg_fluidbox.type][1]) * fluid_properties[coldLeg_fluidbox.type][3]
						local coldLegDeficit_Energy = math.min(coldLegMaximum_Energy, coldLegMaximum_Energy - (coldLeg_fluidbox.temperature - fluid_properties[coldLeg_fluidbox.type][1]) * fluid_properties[coldLeg_fluidbox.type][3])
						--Super Heated Steam can not be higher in temperature than Hot Leg current temperature
						local superHeatedSteam_Energy = 30 * (pipebus_fluidbox.temperature - fluid_properties["superheated-steam"][1]) * fluid_properties["superheated-steam"][3]
						--Energetics of new steam (currently ignoring Enthalpy of Vaporization...will be added later)
						local vaporizableColdLeg_v = math.min(pipebus_fluidboxSuperHeatEnergy / (coldLegDeficit_Energy + superHeatedSteam_Energy), coldLeg_fluidbox.amount)
						local generatedSteam = math.min(steamGenerator_available_volume, vaporizableColdLeg_v * 30) * condenser_efficiency
						local vaporizedColdLegVaporizationEnergy = (generatedSteam / 30) * coldLegDeficit_Energy
						local generatedSteamSuperheatedSteamEnergy = (generatedSteam / 30) * superHeatedSteam_Energy						
							
						-- game.players[1].print("Hot Leg Energy: "..pipebus_fluidboxSuperHeatEnergy.." Vaporizable Cold Leg: "..vaporizableColdLeg_v.." Vaporization Energy: "..vaporizedColdLegVaporizationEnergy.."  Super Heated Steam Energy: "..generatedSteamSuperheatedSteamEnergy.." Steam Usage Rate:"..(previousSteamVolume - steamGenerator_fluidbox.amount).." Generated Steam: "..generatedSteam)
							
						--Generate steam and adjust fluid boxes
						if (pipebus_fluidboxEnergy - vaporizedColdLegVaporizationEnergy - generatedSteamSuperheatedSteamEnergy) > 0 and (coldLeg_fluidbox.amount - (generatedSteam / 30)) > 0 then
							-- game.players[1].print("Generated Steam amount: "..generatedSteam..", Unused steam: "..steamGenerator_fluidbox.amount.." Liquid and temp in Pipe Bus : "..pipebus_fluidbox.amount..", "..pipebus_fluidbox.temperature.." Cold Leg Vol: "..(coldLeg_fluidbox.amount - vaporizableColdLeg_v))
							
							local currentSteamHeat = steamGenerator_fluidbox.amount * (steamGenerator_fluidbox.temperature - fluid_properties["superheated-steam"][1]) * fluid_properties["superheated-steam"][3]
							local steamNewTemp = (currentSteamHeat + vaporizedColdLegVaporizationEnergy + generatedSteamSuperheatedSteamEnergy) / ((steamGenerator_fluidbox.amount + generatedSteam) * fluid_properties["superheated-steam"][3]) + fluid_properties["superheated-steam"][1]							
							steamGenerator_fluidbox.temperature = steamNewTemp
							steamGenerator_fluidbox.amount = steamGenerator_fluidbox.amount + generatedSteam
							if entity_table[1][2][1] == nil then
								entity_table[7] = entity_table[7] + steamGenerator_fluidbox.amount
							else
								entity_table[7] = steamGenerator_fluidbox.amount
							end
							
							pipebus_fluidbox.temperature = (pipebus_fluidboxEnergy - vaporizedColdLegVaporizationEnergy - generatedSteamSuperheatedSteamEnergy) / (pipebus_fluidbox.amount * fluid_properties[pipebus_fluidbox.type][3]) + fluid_properties[pipebus_fluidbox.type][1]
							
							coldLeg_fluidbox.amount = coldLeg_fluidbox.amount - (generatedSteam / 30)
							
							if (previousSteamVolume - steamGenerator_fluidbox.amount) <= generatedSteam then	
								entity_table[1][2][1] = steamGenerator_fluidbox
								entity_table[3][2][1] = pipebus_fluidbox
								entity_table[4][2][1] = coldLeg_fluidbox
								return true, 0
							end
						end
						return false, 1
					end
					return false, 1
				end
				return false, 1
			end
			return false, 1
		end
		return false, 1
	else
		return false, 2
	end
end

function calculate_generator_power_output(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local turbine_generator_internals = turbineGeneratorInternals
	local fluid_properties = global.fluidProperties
	
	if entity_table[1][1].valid and entity_table[2][1][1].valid and entity_table[3][1].valid and entity_table[4][1].valid then
		if entity_table["record"][1]["type"] == "generator" then
			if entity_table[1][2][1] ~= nil and entity_table[1][2][1].type == "superheated-steam" then
				local energy = entity_table[1][1].energy
				local generatorFluidBox = entity_table[1][2][1]
				local energyBufferCapacity = turbine_generator_internals[entity_table[1][1].name]["energy_buffer_capacity"][1]
				local generatorEfficiency = turbine_generator_internals[entity_table[1][1].name]["effectivity"][1]
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
				entity_table[6] = entity_table[6] + energyToGrid
				--Sum Super Heated Steam Consumed
				entity_table[7] = entity_table[7] + superHeatedSteamConsumed
				--Average Low Pressure Steam Temp
				if entity_table[2][2][1] == 0 then
					entity_table[2][2][1] = lowPressureSteamTemperature
				else
					entity_table[2][2][1] = (entity_table[2][2][1] + lowPressureSteamTemperature) / 2
				end
				--Fill Low Pressure Steam Fluid Box
				if entity_table[2][1][2][1] == nil then
					entity_table[2][1][2][1] = {
							["type"] = "low-pressure-steam",
							["amount"] = superHeatedSteamConsumed,
							["temperature"] = entity_table[2][2][1]
						}
				else
					local lowPressureSteamFluidBox = entity_table[2][1][2][1]
					local remainingFluidSpace = (turbine_generator_internals[entity_table[1][1].name][entity_table[2][1][1].name][1]*10) - lowPressureSteamFluidBox.amount
					if remainingFluidSpace < superHeatedSteamConsumed then
						lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount + remainingFluidSpace
						--Save to OverFlow
						entity_table[2][3][1] = entity_table[2][3][1] + (superHeatedSteamConsumed - remainingFluidSpace)
					else
						lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount + superHeatedSteamConsumed
					end
					entity_table[2][1][2][1] = lowPressureSteamFluidBox
				end
				
				if entity_table[5] == 0 then
					entity_table[5] = game.tick + 60
					--game.players[1].print("Current Game Tick: "..game.tick)
				elseif entity_table[5] == game.tick then
					entity_table[5] = game.tick + 60
					if entity_table[6] > 0 then
						--game.players[1].print("Energy Used: "..entity_table[6].." Power Output (KW): "..(entity_table[6] / 1000).." Super Heated Steam Expanded :"..entity_table[7].." Low-Pressure Steam Temperature :"..entity_table[2][2][1].." Low-Pressure-Steam OverFlow: "..entity_table[2][3][1])
					end
					entity_table[2][2][1] = 0
					entity_table[6] = 0
					entity_table[7] = 0
				end
				return true, 0
			end
			return false, 1
		end
		return false, 1
	else
		return false, 2
	end
end

function low_pressure_steam_condensation(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local turbine_generator_internals = turbineGeneratorInternals
	local fluid_properties = global.fluidProperties
	
	if entity_table[1][1].valid and entity_table[2][1][1].valid and entity_table[3][1].valid and entity_table[4][1].valid then
		if entity_table["record"][1]["type"] == "generator" then
			if entity_table[2][1][2][1] ~= nil and entity_table[2][1][2][1].type == "low-pressure-steam" then
				local lowPressureSteamFluidBox = entity_table[2][1][2][1]
				local lowPressureSteamOverFlow = entity_table[2][3][1]
				local coldLegFluidBox = entity_table[3][2][1]
				local feedWaterFluidBox = entity_table[4][2][1]
				
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
					entity_table[3][2][1] = coldLegFluidBox
					
					--Update Low Pressure Steam Fluid Box
					if lowPressureSteamOverFlow > 0 then
						lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount - condensedSteamAmount + math.min(lowPressureSteamOverFlow, condensedSteamAmount)
						lowPressureSteamOverFlow = lowPressureSteamOverFlow - math.min(lowPressureSteamOverFlow, condensedSteamAmount)
					else
						lowPressureSteamFluidBox.amount = lowPressureSteamFluidBox.amount - condensedSteamAmount
					end
					entity_table[2][1][2][1] = lowPressureSteamFluidBox
					entity_table[2][3][1] = lowPressureSteamOverFlow
					
					--Update Feed Water Fluid Box
					feedWaterFluidBox.amount = feedWaterFluidBox.amount - (actualFeedWaterEvaporated*0.5)
					entity_table[4][2][1] = feedWaterFluidBox
					
					--game.players[1].print("Recovered Water: "..coldLegFluidBox.amount.." Condensed Steam: "..condensedSteamAmount.." Evaporated Feed-water: "..actualFeedWaterEvaporated)
					return true, 0
				end
				return false, 1
			end
			return false, 1
		end
		return false, 1
	else
		return false, 2
	end
end

function recipe_heat_exchange_crafting_progress(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local recipeHeatExchanger = entity_table[1][1]
	local recipeHeatExchangerFluidBox = entity_table[1][2]
	
	if recipeHeatExchanger.valid then
		if	entity_table["record"][1]["type"] == "assembling-machine" then
			if recipeHeatExchanger.is_crafting() then
				local currentProgress = round(recipeHeatExchanger.crafting_progress*100,1)
				-- game.print ("Checking crafting progress on current game tick: "..game.tick.." Crafting Progress: "..currentProgress)
				if recipeHeatExchanger.energy <= 0 and recipeHeatExchange.get_fuel_inventory().is_empty() then
					recipeHeatExchanger.get_fuel_inventory().insert({name="solid-fuel", count=1	})
				end
				if currentProgress < 100 then
					local remainingProgress = 1-recipeHeatExchanger.crafting_progress
					local recipeTime = recipeHeatExchanger.recipe.energy*60
					local predictionTime = game.tick + round(remainingProgress*recipeTime,1)
					-- game.print("Predicted completing on tick: "..predictionTime)
					return true, 0, predictionTime
				
				else
					-- Crafting progress is 100%
					-- Activate task recipe_heat_exchange
					return true, 0, "recipe_heat_exchange"
				end
				return false, 1
			end
			return false, 1
		end
		return false, 1
	else
		return false, 2
	end
end

function recipe_heat_exchange(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local fluid_properties = global.fluidProperties
	local recipeHeatExchanger = entity_table[1][1]
	local recipeHeatExchangerFluidBox = entity_table[1][2]
	if recipeHeatExchanger.valid then
		if	entity_table["record"][1]["type"] == "assembling-machine" then
			-- game.print("Executing heat exchange on game tick: "..game.tick.." Crafting progress: "..round(recipeHeatExchanger.crafting_progress*100,1))
			if recipeHeatExchangerFluidBox[1] ~= nil and recipeHeatExchangerFluidBox[2] ~= nil and recipeHeatExchangerFluidBox[3] ~= nil and recipeHeatExchangerFluidBox[4] ~= nil then
				-- Chirality for the heat exchangers are defined in the prototype.  Since the rotation is always clockwise,
				-- the chiral pairs are as follows: S-0,R-0 | S-2,R-6 | S-4,R-4 | S-6,R-2
				local fluidBox1 = recipeHeatExchangerFluidBox[1]
				local fluidBox2 = recipeHeatExchangerFluidBox[2]
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
				
				-- The heatExchangerCoeff is a scaling factor tuned to allow a certain amount of MWe from MWq
				local heatExchangerCoeff = 0
				if fluidBox1.type == "water" then
					-- 4x Small Heat Exchanger => 16.32 MWe from 72 MWq
					-- 4x Big Heat Exchanger => 24.96 MWe from 144 MWq
					heatExchangerCoeff = 0.89
				elseif fluidBox1.type == "pressurised-water" and (recipeHeatExchanger.name == "S-new-heat-exchanger-01" or recipeHeatExchanger.name == "R-new-heat-exchanger-01") then
					-- 4x Small Heat Exchanger => 20.64 from 72 MWq
					heatExchangerCoeff = 0.91
				elseif fluidBox1.type == "pressurised-water" and (recipeHeatExchanger.name == "S-new-heat-exchanger-02" or recipeHeatExchanger.name == "R-new-heat-exchanger-02") then
					-- 4x Big Heat Exchanger  => 54.72 MWe from 144 MWq
					heatExchangerCoeff = 0.70
				else
					-- Heat exchange between pressurized-water and itself 
					-- Users can try and find out for themselves.
					heatExchangerCoeff = 0.75
				end
				local hotFluid_energy = hotFluid_v * (hotFluid_t - hotFluid_minT) * hotFluid_heatCapacity
				local coldFluid_energy = coldFluid_v * (coldFluid_t - coldFluid_minT) * coldFluid_heatCapacity
				local totalEnergy = (hotFluid_energy + coldFluid_energy) * heatExchangerCoeff
				
				-- Exchange heat
				local newHotFluidTemperature = 0
				local newColdFluidTemperature = 0
				local deltaTemperature = math.min(hotFluid_t - coldFluid_t, coldFluid_maxT - coldFluid_t)
				local exchangedEnergy = coldFluid_v * (deltaTemperature) * coldFluid_heatCapacity
				
				-- This prevents negative temperature
				if hotFluid_energy >= exchangedEnergy then
					newHotFluidTemperature = math.min(((hotFluid_energy - exchangedEnergy) / (hotFluid_v * hotFluid_heatCapacity)) + hotFluid_minT, hotFluid_maxT)
					newColdFluidTemperature = math.min(((coldFluid_energy + exchangedEnergy) / (coldFluid_v * coldFluid_heatCapacity)) + coldFluid_minT, coldFluid_maxT)
				else
					newHotFluidTemperature = hotFluid_t
					newColdFluidTemperature = coldFluid_t
				end
				
				-- game.print(game.tick..","..hotFluid_energy..","..exchangedEnergy..","..((hotFluid_energy - exchangedEnergy) / (hotFluid_v * hotFluid_heatCapacity))..","..hotFluid_v..","..coldFluid_v)
				
				-- Copy fluidboxes
				local changedFluidBox1 = recipeHeatExchangerFluidBox[3]
				local changedFluidBox2 = recipeHeatExchangerFluidBox[4]
				
				if hotFluid_t > coldFluid_t then
					
					changedFluidBox1["temperature"] = newHotFluidTemperature
					changedFluidBox2["temperature"] = newColdFluidTemperature
					
					entity_table[1][2][3] = changedFluidBox1
					entity_table[1][2][4] = changedFluidBox2
					return true, 0, "recipe_heat_exchange_crafting_progress"
				end
			end
			return true, 0
		end
		return false, 1
	else
		return false, 2
	end
end

function wall_heat_exchange(entity_index)
	
	local entity_table = global.ROSTER[entity_index]
	local fluid_properties = global.fluidProperties

	if entity_table[1][1].valid and entity_table[2][1].valid and entity_table[3][1].valid then
		if entity_table["record"][1]["type"] == "wall" then
			if entity_table[2][2][1] ~= nil and entity_table[3][2][1] ~= nil then
				local fluidBox1 = entity_table[2][2][1]
				local fluidBox2 = entity_table[3][2][1]
				
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
				--game.print(newTemp)
				
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
				
				--game.print("newTemp1 == "..newTemp1.."newTemp2 == "..newTemp2)
				
				newFluidBox1["temperature"] = newTemp1
				newFluidBox2["temperature"] = newTemp2
				
				entity_table[2][2][1] = newFluidBox1
				entity_table[3][2][1] = newFluidBox2
				return true, 0
			end
			return false, 1
		end
		return false, 1
	else
		return false, 2
	end
end

remote.add_interface("UraniumPower", {
	dump_ACTIVE = function (x)
		local active_entries = table.deepcopy(global.ACTIVE)
		game.write_file("/UraniumPower/ACTIVE.txt", serpent.block(active_entries))
	end,
	dump_ROSTER = function (x)
		local active_entries = {}
		if x then
			active_entries = table.deepcopy(global.ROSTER[x])
			game.write_file("/UraniumPower/ROSTER.txt", serpent.block(active_entries))
		else
			active_entries = table.deepcopy(global.ROSTER)
			game.write_file("/UraniumPower/ROSTER.txt", serpent.block(active_entries))
		end
	end,
	cheat = function()
		for _,player in pairs(game.players) do
			addItems(player, {name = "solid-fuel", count = 5})
		end
	end,
	togglelog = function()
		logging = not logging
		if logging then
			game.print("Logging on")
		else
			game.print("Logging off")
		end
	end,
	killactive = function()
	end,
	count_resources = function(playerid, surfaceid, ...)
		local function playervalid()
			for k, _ in pairs(game.players) do 
				if k == playerid then 
					return true
				end
			end
			return false
		end
		local function surfacevalid()
			for k, _ in pairs(game.surfaces) do 
				if k == surfaceid then
					return true
				end
			end
			return false
		end
		if playervalid() and surfacevalid() then
			local chunks = game.surfaces[surfaceid].get_chunks()
			-- Make new table of resources to be counted
			local res = {}
			for _, value in pairs({...}) do
				res[value] = {
					count=0,
					piles=0
				}
			end
			local chunkcount = 0
			for chunk in chunks do 
				local resources=game.surfaces[surfaceid].find_entities_filtered{area={{chunk.x*32, chunk.y*32}, {(chunk.x+1)*32, (chunk.y+1)*32}}, type="resource"}
				for i,v in pairs(resources) do 
					if res[v.name] then
						res[v.name].count=res[v.name].count+v.amount
						res[v.name].piles=res[v.name].piles+1
					end
				end
				chunkcount = chunkcount + 1
			end
			for r, _ in pairs(res) do
				game.players[playerid].print(r..", Count = "..res[r].count.." in "..res[r].piles.." piles found in "..chunkcount.." chunks.  Density: per chunk "..(res[r].count/chunkcount)..", per tile "..(res[r].count/(chunkcount*32*32)))
			end
		else
			game.print("Either playerid or surfaceid is invalid")
		end
	end
})
