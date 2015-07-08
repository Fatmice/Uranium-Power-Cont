data:extend(
{
	{
		type = "pump",
		name = "S-reactor-circ-pump-01",
		icon = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 0.1, result = "S-reactor-circ-pump-01"},
		max_health = 80,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
		fluid_box =
		{
			base_area = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-0.5, 1.5}, type="input" },
				{ position = {1.5, -0.5}, type="output" },
				{ position = {0.5, 1.5}, type="output" },
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.01 / 2.5
		},
		energy_usage = "500kW",
		pumping_speed = 20.0,
		animations =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			}
		}
	},
	{
		type = "item",
		name = "S-reactor-circ-pump-01",
		icon = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "S-reactor-circ-pump-01",
	},
 	{
		type = "recipe",
		name = "S-reactor-circ-pump-01",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "S-reactor-circ-pump-01"
	},
	{
		type = "pump",
		name = "R-reactor-circ-pump-01",
		icon = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 0.1, result = "R-reactor-circ-pump-01"},
		max_health = 80,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-0.8, -0.8}, {0.8, 0.8}},
		selection_box = {{-1.0, -1.0}, {1.0, 1.0}},
		fluid_box =
		{
			base_area = 10,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-0.5, 1.5}, type="output" },
				{ position = {1.5, -0.5}, type="input" },
				--{ position = {1.5, 0.5}, type="input" },
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.0001 / 2.5
		},
		energy_usage = "500kW",
		pumping_speed = 20.0,
		animations =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/2x2recirc.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.8},
				line_length = 3
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/2x2recirc90.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.8},
				line_length = 3
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/2x2recirc180.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.7},
				line_length = 3
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/2x2recirc270.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.65},
				line_length = 3
			}
		}
	},
	{
		type = "item",
		name = "R-reactor-circ-pump-01",
		icon = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "R-reactor-circ-pump-01",
	},
 	{
		type = "recipe",
		name = "R-reactor-circ-pump-01",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "R-reactor-circ-pump-01"
	},
	{
		type = "storage-tank", --storage-tank
		name = "reactor-steam-generator-01",
		icon = "__UraniumPower__/graphics/entity/steam generator/steamgenprotoicon.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "reactor-steam-generator-01"},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "huge-explosion",
		--[[fluid_box =
		{
			base_area = 300,
			base_level = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, -3} },
			},
		},]]
		fluid_box =
		{
		  base_area = 300,
		  base_level = 1,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
			{ position = {0, -3}, type="output" },
			{ position = {-1, 3}, type="input" },
		  },
		},
		collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		--[[energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input",
		  emissions = 0.01 / 2.5
		},
		energy_usage = "15kW",
		pumping_speed = 0.000001,
		picture =
		{
		sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam generator/sheet.png",
			priority = "extra-high",
			frame_count = 24,
			width = 239,
			height = 184,
			shift = {0.65, -0.35},
			line_length = 5,
			}
		},
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/sheet.png",
				width = 239,
				height = 184,
				frame_count = 24,
				shift = {0.97, -0.35},
				line_length = 5,
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/sheet.png",
				width = 239,
				height = 184,
				frame_count = 24,
				shift = {0.97, -0.35},
				line_length = 5,
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/sheet.png",
				width = 239,
				height = 184,
				frame_count = 24,
				shift = {0.97, -0.35},
				line_length = 5,
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/sheet.png",
				width = 239,
				height = 184,
				frame_count = 24,
				shift = {0.97, -0.35},
				line_length = 5,
			}
		},]]
		picture =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/4steamgen.png",
				width = 315,
				height = 243,
				frame_count = 1,
				shift = {2.4, -1.05},
				line_length = 5,
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/1steamgen.png",
				width = 315,
				height = 243,
				frame_count = 1,
				shift = {2.2, -0.5},
				line_length = 5,
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/2steamgen.png",
				width = 315,
				height = 243,
				frame_count = 1,
				shift = {2.4, -0.5},
				line_length = 5,
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/steam generator/3steamgen.png",
				width = 315,
				height = 243,
				frame_count = 1,
				shift = {2.4, -0.5},
				line_length = 5,
			}
		},
		working_sound =
		{
		sound =
		{
			{
				filename = "__base__/sound/storage-tank.ogg",
				volume = 0.8
			},
			{
				filename = "__base__/sound/oil-refinery.ogg",
				volume = 0.8
			},
		},
		idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
		apparent_volume = 1.5,
		},
	},
	{
		type = "item",
		name = "reactor-steam-generator-01",
		icon = "__UraniumPower__/graphics/entity/steam generator/steamgenprotoicon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 10,
		place_result = "reactor-steam-generator-01",
	},
 	{
		type = "recipe",
		name = "reactor-steam-generator-01",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "reactor-steam-generator-01"
	},
	{
		type = "generator",
		name = "reactor-turbine-generator-01a",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconLU.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "reactor-turbine-generator-01a"},
		max_health = 300,
		corpse = "big-remnants",
		dying_explosion = "huge-explosion",
		effectivity = 0.95,
		fluid_usage_per_tick = 6.200,
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-5.4, -2.5}, {5.4, 2.5}},
		selection_box = {{-5.5, -2.5}, {5.5, 2.5}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-6, 0} },
				--{ position = {6, 0} }
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/spritesheeth.png",
			width = 467,
			height = 267,
			frame_count = 9,
			line_length = 3,
			--h2  shift
			--shift = {2.0, -1.30},
			--original H:
			shift = {1.3, -1.15},
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/spritesheetv2.png",
			width = 296,
			height = 467,
			--for v1
			--width = 261,
			--height = 461,
			frame_count = 9,
			line_length = 4,
			--for v2
			shift = {1.1, -1.35},
			--for v original: shift = {1.1, -0.35},
		},
		smoke =
		{
			{
			name = "smoke",
			north_position = {1, -5}, --for original h
			--north_position = {-3.1, -5.5}, --for h2
			--east_position = {-1, -5.5}, --for original v
			east_position = {-0.9, -4.25}, --for v2
			deviation = {2, 2},
			frequency = 10 / 31,
			starting_vertical_speed = 0.05
			}
		},
		working_sound =
		{
			sound =
			{
			filename = "__base__/sound/steam-engine-90bpm.ogg",
			volume = 0.6
			},
			match_speed_to_activity = true,
		},
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5
	},
	{
		type = "item",
		name = "reactor-turbine-generator-01a",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconLU.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "reactor-turbine-generator-01a",
	},
 	{
		type = "recipe",
		name = "reactor-turbine-generator-01a",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "reactor-turbine-generator-01a"
	},
		{
		type = "generator",
		name = "reactor-turbine-generator-01b",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconRD.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "reactor-turbine-generator-01b"},
		max_health = 300,
		corpse = "big-remnants",
		dying_explosion = "huge-explosion",
		effectivity = 0.95,
		fluid_usage_per_tick = 6.200,
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-5.4, -2.5}, {5.4, 2.5}},
		selection_box = {{-5.5, -2.5}, {5.5, 2.5}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {6, 0} },
				--{ position = {6, 0} }
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/spritesheeth2.png",
			width = 467,
			height = 267,
			frame_count = 9,
			line_length = 3,
			--h2  shift
			shift = {2.0, -1.30},
			--original H:
			--shift = {1.3, -1.15},
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/spritesheetv.png",
			--width = 296,
			--height = 467,
			--for v1
			width = 261,
			height = 461,
			frame_count = 9,
			line_length = 4,
			--for v2
			--shift = {1.1, -1.35},
			--for v original: 
			shift = {1.1, -0.25},
		},
		smoke =
		{
			{
			name = "smoke",
			--north_position = {1, -5}, --for original h
			north_position = {-3.1, -5.5}, --for h2
			east_position = {-1, -5.5}, --for original v
			--east_position = {-0.9, -4.25}, --for v2
			deviation = {2, 2},
			frequency = 10 / 31,
			starting_vertical_speed = 0.05
			}
		},
		working_sound =
		{
			sound =
			{
			filename = "__base__/sound/steam-engine-90bpm.ogg",
			volume = 0.6
			},
			match_speed_to_activity = true,
		},
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5
	},
	{
		type = "item",
		name = "reactor-turbine-generator-01b",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconRD.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "reactor-turbine-generator-01b",
	},
 	{
		type = "recipe",
		name = "reactor-turbine-generator-01b",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "reactor-turbine-generator-01b"
	},
	{
		type = "pipe",
		name = "steam-generator-01-cold-input",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-c.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			pipe_connections =
			{
				{ position = {0, -1} },
				{ position = {1, 0} },
				{ position = {0, 1} },
				{ position = {-1, 0} }
			},
		},
		pictures = pipepictures(),
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/pipe.ogg",
					volume = 0.65
				},
			},
			match_volume_to_activity = true,
			max_sounds_per_type = 3
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
		vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
	},
	{
		type = "item",
		name = "steam-generator-01-cold-input",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-c.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "steam-generator-01-cold-input",
	},
 	{
		type = "recipe",
		name = "steam-generator-01-cold-input",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "steam-generator-01-cold-input"
	},
	{
		type = "storage-tank",
		name = "verticalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.3, -2.0}, {0.3, 2.0}},
		selection_box = {{-0.5, -2.0}, {0.5, 2.0}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ type="input", position = {-1, 1.5} },
				{ type="output", position = { -1, -1.5} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipe.png",
			priority = "extra-high",
			frames = 1,
			width = 32,
			height = 128,
			}
		},
	},
	{
		type = "item",
		name = "verticalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "verticalreactorpipebus-01",
	},
 	{
		type = "recipe",
		name = "verticalreactorpipebus-01",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "verticalreactorpipebus-01"
	},
	{
		type = "storage-tank",
		name = "horizontalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconH.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-2.0, -0.3}, {2.0, 0.3}},
		selection_box = {{-2.0, -0.5}, {2.0, 0.5}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			--[[{
				{ type="input", position = {-1, 1.5} },
				{ type="output", position = { -1, -1.5} },
			},]]	
			{
				{ type="input", position = {1.5, 1} },
				{ type="output", position = {-1.5, 1} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeside.png",
			priority = "extra-high",
			frames = 1,
			width = 128,
			height = 32,
			}
		},
	},
	{
		type = "item",
		name = "horizontalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconH.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "horizontalreactorpipebus-01",
	},
 	{
		type = "recipe",
		name = "horizontalreactorpipebus-01",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "horizontalreactorpipebus-01"
	},

	{
		type = "storage-tank",
		name = "turbinegenstoragetank",
		icon = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenstoragetank.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1, result = "turbinegenstoragetank"},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.4, -0.4}, {0.4, 0.4}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 100,
			base_level = -1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ type="input", position = {0, 1} },
				{ type="output", position = {0, -1} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenstoragetank.png",
			priority = "extra-high",
			frames = 1,
			width = 32,
			height = 32,
			}
		},
	},
	{
		type = "item",
		name = "turbinegenstoragetank",
		icon = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenstoragetank.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "turbinegenstoragetank",
	},
 	{
		type = "recipe",
		name = "turbinegenstoragetank",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "turbinegenstoragetank"
	},
	{
		type = "pipe",
		name = "turbinegenpipe1",
		icon = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenpipe1.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "turbinegenpipe1"},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 100,
			base_level = -1,
			pipe_connections =
			{
				{ position = {0, -1} },
				{ position = {1, 0} },
				{ position = {0, 1} },
				{ position = {-1, 0} }
			},
		},
		pictures = pipepictures(),
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/pipe.ogg",
					volume = 0.65
				},
			},
			match_volume_to_activity = true,
			max_sounds_per_type = 3
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
		vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
	},
	{
		type = "item",
		name = "turbinegenpipe1",
		icon = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenpipe1.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "turbinegenpipe1",
	},
 	{
		type = "recipe",
		name = "turbinegenpipe1",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "turbinegenpipe1"
	},
	{
		type = "pipe",
		name = "turbinegenpipe2",
		icon = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenpipe2.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "turbinegenpipe2"},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 100,
			base_level = -1,
			pipe_connections =
			{
				{ position = {0, -1} },
				{ position = {1, 0} },
				{ position = {0, 1} },
				{ position = {-1, 0} }
			},
		},
		pictures = pipepictures(),
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/pipe.ogg",
					volume = 0.65
				},
			},
			match_volume_to_activity = true,
			max_sounds_per_type = 3
		},
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
		vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
	},
	{
		type = "item",
		name = "turbinegenpipe2",
		icon = "__UraniumPower__/graphics/entity/turbinegenentities/turbinegenpipe2.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "turbinegenpipe2",
	},
 	{
		type = "recipe",
		name = "turbinegenpipe2",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "turbinegenpipe2"
	},
	
	--turbine gen additional fluid boxes
	--feed water box
	
	{
		type = "storage-tank",
		name = "turbine-generator-feed-water-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/feedwaterboxicon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.05},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-1.29, -1.29}, {1.29, 1.29}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		fluid_box =
		{
			base_area = 20,
			base_level = -1,
			pipe_connections =
			{
				{ position = {0, -2} },
				{ position = {2, 0} },
				{ position = {0, 2} },
				{ position = {-2, 0} }
			},
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/feedwaterbox.png",
			priority = "extra-high",
			frames = 1,
			width = 96,
			height = 96,
			}
		},
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/pipe.ogg",
					volume = 0.65
				},
			},
			match_volume_to_activity = true,
			max_sounds_per_type = 3
		},
	},
	{
		type = "item",
		name = "turbine-generator-feed-water-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/feedwaterboxicon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "turbine-generator-feed-water-box",
	},
 	{
		type = "recipe",
		name = "turbine-generator-feed-water-box",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "turbine-generator-feed-water-box"
	},

	--cold leg box
	
	{
		type = "storage-tank",
		name = "turbine-generator-cold-leg-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/coldlegicon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.05},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 5,
			base_level = 1,
			pipe_connections =
			{
				{ position = {0, -1} },
				{ position = {1, 0} },
				{ position = {0, 1} },
				{ position = {-1, 0} }
			},
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/coldlegicon.png",
			priority = "extra-high",
			frames = 1,
			width = 32,
			height = 32,
			}
		},
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/pipe.ogg",
					volume = 0.65
				},
			},
			match_volume_to_activity = true,
			max_sounds_per_type = 3
		},
	},
	{
		type = "item",
		name = "turbine-generator-cold-leg-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/coldlegicon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "turbine-generator-cold-leg-box",
	},
 	{
		type = "recipe",
		name = "turbine-generator-cold-leg-box",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "turbine-generator-cold-leg-box"
	},
	
	
	--low pressure steam reservoir box
	
	{
		type = "storage-tank",
		name = "turbine-generator-low-p-steam-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/steamreservoiricon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.05},
		max_health = 50,
		corpse = "small-remnants",
		resistances =
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 50,
			base_level = 0,
			pipe_connections =
			{
				--{ position = {0, -1} },
				--{ position = {1, 0} },
				--{ position = {0, 1} },
				--{ position = {-1, 0} }
			},
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/steamreservoiricon.png",
			priority = "extra-high",
			frames = 1,
			width = 32,
			height = 32,
			}
		},
		working_sound =
		{
			sound =
			{
				{
					filename = "__base__/sound/pipe.ogg",
					volume = 0.65
				},
			},
			match_volume_to_activity = true,
			max_sounds_per_type = 3
		},
	},
	{
		type = "item",
		name = "turbine-generator-low-p-steam-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/steamreservoiricon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "turbine-generator-low-p-steam-box",
	},
 	{
		type = "recipe",
		name = "turbine-generator-low-p-steam-box",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "turbine-generator-low-p-steam-box"
	},
	
})