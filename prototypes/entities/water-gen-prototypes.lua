data:extend(
{
	{
		type = "storage-tank",
		name = "passive-water-gen",
		icon = "__UraniumPower__/graphics/icons/water-gen-passive-standin-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "not-blueprintable", "not-deconstructable"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "passive-water-gen"},
		max_health = 500,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		fluid_box =
		{
			base_area = 300,
			base_level = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-0.5, 2.5}, type="input" },
				{ position = {0.5, -2.5}, type="output" }
			},
		},
		collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
		selection_box = {{-2, -2}, {2, 2}},
		drawing_box = {{-2, -2}, {2, 2}},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
			picture =
			{
				north =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-passive-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
				},
				east =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-passive-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
				},
				south =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-passive-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
				},
				west =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-passive-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
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
			  filename = "__UraniumPower__/sound/steamgen.ogg",
			  volume = 0.5
		  },
		  apparent_volume = 1.5,
		  max_sounds_per_type = 3
		},
		circuit_wire_connection_points =
		{
		  {
			shadow =
			{
			  red = {-0.8, 1}, --{2.6875, 1.3125},
			  green = {-1.0, 1}, --{2.6875, 1.3125},
			},
			wire =
			{
			  red = {-0.8, 1},--{1.1875, -0.28125},
			  green = {-1.0, 1}, --{1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {-1.5, -1.3}, --{0.21875, 1.1875},
			  green = {-1.5, -1.3}, --{0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1.5, -1.3}, --{-1, -0.25},
			  green = {-1.5, -1.3}, --{-1, -0.25},
			}
		  },
		  {
			shadow =
			{
			  red = {1.5, -1.8}, --{2.6875, 1.3125},
			  green = {1.5, -1.8}, --{2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.5, -1.8}, --{1.1875, -0.28125},
			  green = {1.5, -1.8}, --{1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {1.5,0}, --{0.21875, 1.1875},
			  green = {1.5,0}, --{0.21875, 1.1875},
			},
			wire =
			{
			  red = {1.5,0}, --{-1, -0.25},
			  green = {1.5,0}, --{-1, -0.25},
			}
		  }
		},
		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites({-0.8, 1}, nil, 0), --n
		  get_circuit_connector_sprites({-1.5, -1.3}, nil, 6), --e
		  get_circuit_connector_sprites({1.5, -1.8}, nil, 4), --s
		  get_circuit_connector_sprites({1.5,0}, nil, 2),
		}, --w
		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "passive-water-gen",
		icon = "__UraniumPower__/graphics/icons/water-gen-passive-standin-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-energy-conversion",
		order = "c[uranium]",
		stack_size = 5,
		place_result = "passive-water-gen",
	},
	{
		type = "recipe",
		name = "passive-water-gen",
		enabled = "true",
		energy_required = 0.1,
		ingredients =
		{
			{"steel-plate", 1},
		},
		result = "passive-water-gen"
	},
	{
		type = "storage-tank",
		name = "active-water-gen",
		icon = "__UraniumPower__/graphics/icons/water-gen-active-standin-icon.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "not-blueprintable", "not-deconstructable"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "active-water-gen"},
		max_health = 500,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
		resistances =
		{
			{
				type = "fire",
				percent = 70
			}
		},
		fluid_box =
		{
			base_area = 300,
			base_level = 1,
			pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-0.5, 2.5}, type="input" },
				{ position = {0.5, -2.5}, type="output" }
			},
		},
		collision_box = {{-1.8, -1.8}, {1.8, 1.8}},
		selection_box = {{-2, -2}, {2, 2}},
		drawing_box = {{-2, -2}, {2, 2}},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
			picture =
			{
				north =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-active-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
				},
				east =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-active-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
				},
				south =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-active-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
				},
				west =
				{
					filename = "__UraniumPower__/graphics/entities/water-gen/water-gen-active-standin.png",
					width = 128,
					height = 128,
					frame_count = 1,
					--scale = 160/613,
					--shift = {1.8, -1.0},
					--line_length = 5,
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
			  filename = "__UraniumPower__/sound/steamgen.ogg",
			  volume = 0.5
		  },
		  apparent_volume = 1.5,
		  max_sounds_per_type = 3
		},
		circuit_wire_connection_points =
		{
		  {
			shadow =
			{
			  red = {-0.8, 1}, --{2.6875, 1.3125},
			  green = {-1.0, 1}, --{2.6875, 1.3125},
			},
			wire =
			{
			  red = {-0.8, 1},--{1.1875, -0.28125},
			  green = {-1.0, 1}, --{1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {-1.5, -1.3}, --{0.21875, 1.1875},
			  green = {-1.5, -1.3}, --{0.21875, 1.1875},
			},
			wire =
			{
			  red = {-1.5, -1.3}, --{-1, -0.25},
			  green = {-1.5, -1.3}, --{-1, -0.25},
			}
		  },
		  {
			shadow =
			{
			  red = {1.5, -1.8}, --{2.6875, 1.3125},
			  green = {1.5, -1.8}, --{2.6875, 1.3125},
			},
			wire =
			{
			  red = {1.5, -1.8}, --{1.1875, -0.28125},
			  green = {1.5, -1.8}, --{1.1875, -0.28125},
			}
		  },
		  {
			shadow =
			{
			  red = {1.5,0}, --{0.21875, 1.1875},
			  green = {1.5,0}, --{0.21875, 1.1875},
			},
			wire =
			{
			  red = {1.5,0}, --{-1, -0.25},
			  green = {1.5,0}, --{-1, -0.25},
			}
		  }
		},
		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites({-0.8, 1}, nil, 0), --n
		  get_circuit_connector_sprites({-1.5, -1.3}, nil, 6), --e
		  get_circuit_connector_sprites({1.5, -1.8}, nil, 4), --s
		  get_circuit_connector_sprites({1.5,0}, nil, 2),
		}, --w
		circuit_wire_max_distance = 7.5
	},
	{
		type = "item",
		name = "active-water-gen",
		icon = "__UraniumPower__/graphics/icons/water-gen-active-standin-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-energy-conversion",
		order = "c[uranium]",
		stack_size = 5,
		place_result = "active-water-gen",
	},
	{
		type = "recipe",
		name = "active-water-gen",
		enabled = "true",
		energy_required = 0.1,
		ingredients =
		{
			{"steel-plate", 1},
		},
		result = "active-water-gen"
	},
})	