data:extend(
{	
	{
		type = "storage-tank",
		name = "turbine-generator-feed-water-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator-internals/feedwaterboxicon.png",
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
				{ position = {2, 0} },
				{ position = {-2, 0} }
			},
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
				filename = "__UraniumPower__/graphics/entity/turbine-generator-internals/turbineinternalfeedwaterHV.png",
				priority = "extra-high",
				frames = 2,
				width = 540,
				height = 540,
				scale = 105/250,
				shift = {1.55, 0.3},
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

		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
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
		type = "storage-tank",
		name = "turbine-generator-cold-leg-box",
		icon = "__UraniumPower__/graphics/entity/turbine-generator-internals/coldlegicon.png",
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
				{ position = {0, 1} },
			},
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
				filename = "__UraniumPower__/graphics/entity/turbine-generator-internals/coldlegtank.png",
				priority = "extra-high",
				frames = 2,
				width = 540,
				height = 540,
				scale = 50/250,
				shift = {0.65, 0.2},
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

		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
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
		type = "storage-tank",
		name = "turbine-generator-low-p-steam-box-01",
		icon = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreservoiricon.png",
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

			},
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
				filename = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreservea0.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 18/450,
				shift = {0.2, -0.18},
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

		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
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
		type = "storage-tank",
		name = "turbine-generator-low-p-steam-box-02",
		icon = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreservoiricon.png",
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
			},
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
				filename = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreservea2.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 19/450,
				shift = {-0.04, -0.1},
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

		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
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
		type = "storage-tank",
		name = "turbine-generator-low-p-steam-box-03",
		icon = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreservoiricon.png",
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
			},
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
				filename = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreserveb0.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 19/450,
				shift = {0, 0.3},
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

		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
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
		type = "storage-tank",
		name = "turbine-generator-low-p-steam-box-04",
		icon = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreservoiricon.png",
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
			},
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
		  picture =
		  {
			sheet =
			{
				filename = "__UraniumPower__/graphics/entity/turbine-generator-internals/steamreserveb2.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 16/450,
				shift = {0.79, -0.08},
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

		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
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
	}
})