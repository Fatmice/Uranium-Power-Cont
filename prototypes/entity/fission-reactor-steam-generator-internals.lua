data:extend(
{
	{
		type = "storage-tank",
		name = "steam-generator-01-cold-input",
		icon = "__UraniumPower__/graphics/entity/test-pipe/test-pipe-c.png",
		flags = {"placeable-neutral", "placeable-player", "not-blueprintable", "not-deconstructable"},
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
		collision_box = {{-1, -1}, {1, 1}},
		selection_box = {{-1, -1}, {1, 1}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			pipe_connections =
			{
				{ position = {-0.5, -1.5} },
				{ position = {-1.5, -0.5} },
			},
		},
    window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
    pictures =
    {
		picture =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold03.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 160/613,
				shift = {0.05, 0.4},
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold04.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 160/613,
				shift = {2.4, 0.1},
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold01.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 160/613,
				shift = {1.62, -.2},
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold02.png",
				priority = "extra-high",
				frames = 1,
				width = 1000,
				height = 1000,
				scale = 160/613,
				shift = {2.5, -0.11},
			},
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
		  get_circuit_connector_sprites({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 0.01,
	},
--for steam gen direction 2	
	{
		type = "storage-tank",
		name = "reactor-pipe-bus-vert", --nee vertical pipe bus 01
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"placeable-neutral", "placeable-player", "not-blueprintable", "not-deconstructable"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.5, -3.0}, {0.5, 3.0}},
		selection_box = {{-0.5, -3.0}, {0.5, 3.0}},
		drawing_box = {{-0.5, -3.0}, {0.5, -2.5}},
		fluid_box =
		{
			base_area = 150,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ type="input", position = {-1, 1.5} },
				{ type="output", position = { -1, -0.5} },
			},			
		},
		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
			picture =
			{
				north =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL02.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {.8, -2.5},		
				},
				east =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {-1.6, 0},
				},
				south =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL02.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {.8, 2.3},
				},
				west =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
					priority = "extra-high",
					frames= 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {-1.6, 0},
				},
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
	},
	{
		type = "storage-tank",
		name = "reactor-pipe-bus-horiz",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"placeable-neutral", "placeable-player", "not-blueprintable", "not-deconstructable"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-3.0, -0.5}, {3.0, 0.5}},
		selection_box = {{-3.0, -0.5}, {3.0, 0.5}},
		fluid_box =
		{
			base_area = 150,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =	
			{
				{ type="input", position = {1.5, 1} },
				{ type="output", position = {-0.5, 1} },
			},			
		},

		window_bounding_box = {{-0.001, -0.001}, {0.001, 0.001}},
		pictures =
		{
			picture =
			{
				north =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {-1.6, 0},
				},
				east =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {-1.6, 0},
				},
				south =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {2.8, 0},
				},
				west =
				{
					filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
					priority = "extra-high",
					frames = 1,
					width = 540,
					height = 540,
					scale = 40/250,
					shift = {-1.6, 0},
				},
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
	},

})