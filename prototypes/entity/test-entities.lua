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
			base_area = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-0.5, 1.5}, type="output" },
				{ position = {1.5, -0.5}, type="input" },
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
				filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
				width = 64,
				height = 64,
				frame_count = 1
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
		type = "storage-tank",
		name = "reactor-steam-generator-01",
		icon = "__UraniumPower__/graphics/entity/steam generator/steamgenprotoicon.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "reactor-steam-generator-01"},
		max_health = 250,
		corpse = "big-remnants",
		dying_explosion = "huge-explosion",
		fluid_box =
		{
			base_area = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, -3} },
			},
		},
		collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		picture =
		{
		sheet =
		{
			filename = "__UraniumPower__/graphics/entity/steam generator/steamgenproto.png",
			priority = "extra-high",
			frames = 1,
			width = 160,
			height = 160,
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
		stack_size = 50,
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
		name = "reactor-turbine-generator-01",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbine-gen-icon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "reactor-turbine-generator-01"},
		max_health = 300,
		corpse = "big-remnants",
		dying_explosion = "huge-explosion",
		effectivity = 1,
		fluid_usage_per_tick = 0.1,
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-4.3, -2.3}, {4.3, 2.3}},
		selection_box = {{-4.5, -2.5}, {4.5, 2.5}},
		fluid_box =
		{
			base_area = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {0, 3} },
				{ position = {0, -3} },
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/turbine-gen-vert.png",
			width = 160,
			height = 288,
			frame_count = 1,
			line_length = 1,
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/turbine-gen.png",
			width = 288,
			height = 160,
			frame_count = 1,
			line_length = 1,
		},
		smoke =
		{
			{
			name = "smoke",
			north_position = {0, -2.2},
			east_position = {-1.9, -1.6},
			deviation = {0.2, 0.2},
			frequency = 2 / 31,
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
		name = "reactor-turbine-generator-01",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbine-gen-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "reactor-turbine-generator-01",
	},
 	{
		type = "recipe",
		name = "reactor-turbine-generator-01",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "reactor-turbine-generator-01"
	},
	{
		type = "pipe",
		name = "steam-generator-01-hot-input",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-a.png",
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
		fast_replaceable_group = "pipe",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 100,
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
		name = "steam-generator-01-hot-input",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-a.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "steam-generator-01-hot-input",
	},
 	{
		type = "recipe",
		name = "steam-generator-01-hot-input",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "steam-generator-01-hot-input"
	},
	{
		type = "pipe",
		name = "steam-generator-01-hot-return",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-b.png",
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
		fast_replaceable_group = "pipe",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 100,
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
		name = "steam-generator-01-hot-return",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-b.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "steam-generator-01-hot-return",
	},
 	{
		type = "recipe",
		name = "steam-generator-01-hot-return",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "steam-generator-01-hot-return"
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
		fast_replaceable_group = "pipe",
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
			base_area = 100,
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
})