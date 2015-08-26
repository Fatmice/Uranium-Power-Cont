data:extend(
{
	{
		type = "generator",
		name = "test-turbine",
		icon = "__UraniumPower__/graphics/entity/standins/testturbineicon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "test-turbine"},
		max_health = 1000,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		effectivity = 1,
		fluid_usage_per_tick = 6.200,
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-3, 0} },
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/standins/turbinegfx5x5.png",
			width = 160,
			height = 160,
			frame_count = 1,
			line_length = 1,
			--h2  shift
			--shift = {2.0, -1.30},
			--original H:
			scale = 1,
			shift = {0, 0},
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/standins/turbinegfx5x5.png",
			width = 160,
			height = 160,
			frame_count = 1,
			line_length = 1,
			--h2  shift
			--shift = {2.0, -1.30},
			--original H:
			scale = 1,
			shift = {0, 0},
		},
		--[[smoke =
		{
			{
			name = "smoke",
			north_position = {1, -5}, 
			east_position = {-0.9, -4.25}, 
			deviation = {2, 2},
			frequency = 10 / 31,
			starting_vertical_speed = 0.05
			}
		},]]
		working_sound =
		{
			sound =
			{
			filename = "__UraniumPower__/sound/turbinegen.ogg",
			volume = 0.6
			},
			match_speed_to_activity = true,
		},
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5
	},
	
	{
		type = "item",
		name = "test-turbine",
		icon = "__UraniumPower__/graphics/entity/standins/testturbineicon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "test-turbine",
	},
	
	{
		type = "generator",
		name = "test-gen",
		icon = "__UraniumPower__/graphics/entity/standins/testgenicon.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "test-gen"},
		max_health = 1000,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		effectivity = 1,
		fluid_usage_per_tick = 6.200,
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-3, 0} },
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/standins/generatorgfx5x5.png",
			width = 160,
			height = 160,
			frame_count = 1,
			line_length = 1,
			--h2  shift
			--shift = {2.0, -1.30},
			--original H:
			scale = 1,
			shift = {0, 0},
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/standins/generatorgfx5x5.png",
			width = 160,
			height = 160,
			frame_count = 1,
			line_length = 1,
			--h2  shift
			--shift = {2.0, -1.30},
			--original H:
			scale = 1,
			shift = {0, 0},
		},
		--[[smoke =
		{
			{
			name = "smoke",
			north_position = {1, -5}, 
			east_position = {-0.9, -4.25}, 
			deviation = {2, 2},
			frequency = 10 / 31,
			starting_vertical_speed = 0.05
			}
		},]]
		working_sound =
		{
			sound =
			{
			filename = "__UraniumPower__/sound/turbinegen.ogg",
			volume = 0.6
			},
			match_speed_to_activity = true,
		},
		min_perceived_performance = 0.25,
		performance_to_sound_speedup = 0.5
	},

	{
		type = "item",
		name = "test-gen",
		icon = "__UraniumPower__/graphics/entity/standins/testgenicon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "test-gen",
	},

	{
		type = "storage-tank",
		name = "lube-port",
		icon = "__UraniumPower__/graphics/entity/standins/lubeportgfx1x1.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 3, result = "lube-port"},
		max_health = 500,
		corpse = "medium-remnants",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
		  base_area = 250,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
			{ position = {-0.25, -1} },
		  },
		},
		window_bounding_box = {{-0.01, -0.01}, {0.01, 0.01}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
			  filename = "__UraniumPower__/graphics/entity/standins/lubeportgfx1x1.png",
			  priority = "extra-high",
			  frames = 1,
			  width = 32,
			  height = 32,
			  shift = {0, 0}
			}
		  },
		  fluid_background =
		  {
			filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  },
		  window_background =
		  {
			filename = "__base__/graphics/entity/storage-tank/window-background.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  },
		  flow_sprite =
		  {
			filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  }
		},
		flow_length_in_ticks = 360,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
		  sound = {
			  filename = "__base__/sound/storage-tank.ogg",
			  volume = 0.8
		  },
		  apparent_volume = 1.5,
		  max_sounds_per_type = 3
		},
		circuit_wire_connection_points =
		{
		  {
			shadow =
			{
			  red = {2.6875, 1.3125},
			  green = {2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.1875, -0.28125},
			  green = {1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {0.21875, 1.1875},
			  green = {0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1, -0.25},
			  green = {-1, -0.25},
			}
		  },
		  {
			shadow =
			{
			  red = {2.6875, 1.3125},
			  green = {2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.1875, -0.28125},
			  green = {1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {0.21875, 1.1875},
			  green = {0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1, -0.25},
			  green = {-1, -0.25},
			}
		  }
		},

		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "lube-port",
		icon = "__UraniumPower__/graphics/entity/standins/lubeportgfx1x1.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "lube-port",
	},

	{
		type = "storage-tank",
		name = "fluid-box-1",
		icon = "__UraniumPower__/graphics/entity/standins/fluidbox011x1.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 3, result = "fluid-box-1"},
		max_health = 500,
		corpse = "medium-remnants",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
		  base_area = 250,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
			{ position = {-0.25, -1} },
		  },
		},
		window_bounding_box = {{-0.01, -0.01}, {0.01, 0.01}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
			  filename = "__UraniumPower__/graphics/entity/standins/fluidbox011x1.png",
			  priority = "extra-high",
			  frames = 1,
			  width = 32,
			  height = 32,
			  shift = {0, 0}
			}
		  },
		  fluid_background =
		  {
			filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  },
		  window_background =
		  {
			filename = "__base__/graphics/entity/storage-tank/window-background.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  },
		  flow_sprite =
		  {
			filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  }
		},
		flow_length_in_ticks = 360,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
		  sound = {
			  filename = "__base__/sound/storage-tank.ogg",
			  volume = 0.8
		  },
		  apparent_volume = 1.5,
		  max_sounds_per_type = 3
		},
		circuit_wire_connection_points =
		{
		  {
			shadow =
			{
			  red = {2.6875, 1.3125},
			  green = {2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.1875, -0.28125},
			  green = {1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {0.21875, 1.1875},
			  green = {0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1, -0.25},
			  green = {-1, -0.25},
			}
		  },
		  {
			shadow =
			{
			  red = {2.6875, 1.3125},
			  green = {2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.1875, -0.28125},
			  green = {1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {0.21875, 1.1875},
			  green = {0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1, -0.25},
			  green = {-1, -0.25},
			}
		  }
		},

		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "fluid-box-1",
		icon = "__UraniumPower__/graphics/entity/standins/fluidbox011x1.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "fluid-box-1",
	},	
	{
		type = "storage-tank",
		name = "fluid-box-2",
		icon = "__UraniumPower__/graphics/entity/standins/fluidbox022x2.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 3, result = "fluid-box-2"},
		max_health = 500,
		corpse = "medium-remnants",
		collision_box = {{-0.5, -0.5}, {0.5, 0.5}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
		  base_area = 250,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
			{ position = {-0.25, -1} },
		  },
		},
		window_bounding_box = {{-0.01, -0.01}, {0.01, 0.01}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
			  filename = "__UraniumPower__/graphics/entity/standins/fluidbox022x2.png",
			  priority = "extra-high",
			  frames = 1,
			  width = 32,
			  height = 32,
			  shift = {0, 0}
			}
		  },
		  fluid_background =
		  {
			filename = "__base__/graphics/entity/storage-tank/fluid-background.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  },
		  window_background =
		  {
			filename = "__base__/graphics/entity/storage-tank/window-background.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  },
		  flow_sprite =
		  {
			filename = "__base__/graphics/entity/pipe/fluid-flow-low-temperature.png",
			priority = "extra-high",
			width = 1,
			height = 1
		  }
		},
		flow_length_in_ticks = 360,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		working_sound =
		{
		  sound = {
			  filename = "__base__/sound/storage-tank.ogg",
			  volume = 0.8
		  },
		  apparent_volume = 1.5,
		  max_sounds_per_type = 3
		},
		circuit_wire_connection_points =
		{
		  {
			shadow =
			{
			  red = {2.6875, 1.3125},
			  green = {2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.1875, -0.28125},
			  green = {1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {0.21875, 1.1875},
			  green = {0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1, -0.25},
			  green = {-1, -0.25},
			}
		  },
		  {
			shadow =
			{
			  red = {2.6875, 1.3125},
			  green = {2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.1875, -0.28125},
			  green = {1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {0.21875, 1.1875},
			  green = {0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1, -0.25},
			  green = {-1, -0.25},
			}
		  }
		},

		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "fluid-box-2",
		icon = "__UraniumPower__/graphics/entity/standins/fluidbox022x2.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "fluid-box-2",
	},
	{
		type = "smart-container",
		name = "condenser",
		icon = "__UraniumPower__/graphics/entity/standins/condensericon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		minable =
		{
		  hardness = 0.2,
		  mining_time = 0.5,
		  result = "condenser"
		},
		max_health = 150,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 70
		  }
		},
		collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		fast_replaceable_group = "container",
		inventory_size = 48,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture =
		{
		  filename = "__UraniumPower__/graphics/entity/standins/condensergfx5x5.png",
		  priority = "extra-high",
		  width = 160,
		  height = 160,
		  shift = {0, 0}
		},
		circuit_wire_connection_point =
		{
		  shadow =
		  {
			red = {0.7, -0.3},
			green = {0.7, -0.3}
		  },
		  wire =
		  {
			red = {0.3, -0.8},
			green = {0.3, -0.8}
		  }
		},
		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "condenser",
		icon = "__UraniumPower__/graphics/entity/standins/condensericon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "condenser",
	},
	{
		type = "smart-container",
		name = "wetcoolingtower",
		icon = "__UraniumPower__/graphics/entity/standins/weticon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		minable =
		{
		  hardness = 0.2,
		  mining_time = 0.5,
		  result = "wetcoolingtower"
		},
		max_health = 150,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 70
		  }
		},
		collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		fast_replaceable_group = "container",
		inventory_size = 48,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture =
		{
		  filename = "__UraniumPower__/graphics/entity/standins/wetcoolingtowergfx5x5.png",
		  priority = "extra-high",
		  width = 160,
		  height = 160,
		  shift = {0, 0}
		},
		circuit_wire_connection_point =
		{
		  shadow =
		  {
			red = {0.7, -0.3},
			green = {0.7, -0.3}
		  },
		  wire =
		  {
			red = {0.3, -0.8},
			green = {0.3, -0.8}
		  }
		},
		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "wetcoolingtower",
		icon = "__UraniumPower__/graphics/entity/standins/weticon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "wetcoolingtower",
	},
	{
		type = "smart-container",
		name = "drycoolingtower",
		icon = "__UraniumPower__/graphics/entity/standins/dryicon.png",
		flags = {"placeable-neutral", "player-creation"},
		open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
		close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
		minable =
		{
		  hardness = 0.2,
		  mining_time = 0.5,
		  result = "drycoolingtower"
		},
		max_health = 150,
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 70
		  }
		},
		collision_box = {{-2.5, -2.5}, {2.5, 2.5}},
		selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
		fast_replaceable_group = "container",
		inventory_size = 48,
		vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
		picture =
		{
		  filename = "__UraniumPower__/graphics/entity/standins/drycoolingtowergfx5x5.png",
		  priority = "extra-high",
		  width = 160,
		  height = 160,
		  shift = {0, 0}
		},
		circuit_wire_connection_point =
		{
		  shadow =
		  {
			red = {0.7, -0.3},
			green = {0.7, -0.3}
		  },
		  wire =
		  {
			red = {0.3, -0.8},
			green = {0.3, -0.8}
		  }
		},
		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "drycoolingtower",
		icon = "__UraniumPower__/graphics/entity/standins/dryicon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "drycoolingtower",
	},
})