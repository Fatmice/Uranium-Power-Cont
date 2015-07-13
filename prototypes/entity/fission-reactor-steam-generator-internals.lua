data:extend(
{
	{
		type = "storage-tank",
		name = "steam-generator-01-cold-input-01",
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
		collision_box = {{-1, -1}, {1, 1}},
		selection_box = {{-1, -1}, {1, 1}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			pipe_connections =
			{
				--{ position = {0, -1.5} },
				{ position = {1.5, 0} },
				{ position = {0, 1.5} },
				--{ position = {-1.5, 0} }
			},
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold01.png",
			priority = "extra-high",
			frames = 1,
			width = 1000,
			height = 1000,
			scale = 160/613,
			shift = {1.62, -.2},
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
		horizontal_window_bounding_box = {{-0.25, -0.25}, {0.25, 0.15625}},
		vertical_window_bounding_box = {{-0.28125, -0.40625}, {0.03125, 0.125}}
	},
	{
		type = "storage-tank",
		name = "steam-generator-01-cold-input-02",
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
		collision_box = {{-1, -1}, {1, 1}},
		selection_box = {{-1, -1}, {1, 1}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			pipe_connections =
			{
				{ position = {0, -1.5} },
				{ position = {1.5, -0.5} },
				--{ position = {1.5, 0} },
				--{ position = {0, 1.5} },
				--{ position = {-1.5, 0} }
			},
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold04.png",
			priority = "extra-high",
			frames = 1,
			width = 1000,
			height = 1000,
			scale = 160/613,
			shift = {2.4, 0.1},
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
		type = "storage-tank",
		name = "steam-generator-01-cold-input-03",
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
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold03.png",
			priority = "extra-high",
			frames = 1,
			width = 1000,
			height = 1000,
			scale = 160/613,
			shift = {0.05, 0.4},
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
		type = "storage-tank",
		name = "steam-generator-01-cold-input-04",
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
		collision_box = {{-1, -1}, {1, 1}},
		selection_box = {{-1, -1}, {1, 1}},
		fluid_box =
		{
			base_area = 10,
			base_level = -1,
			pipe_connections =
			{
				{ position = {-0.5, 1.5} },
				{ position = {-1.5, 0.5} },
			},
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/steamgeninternalcold02.png",
			priority = "extra-high",
			frames = 1,
			width = 1000,
			height = 1000,
			scale = 160/613,
			shift = {2.5, -0.11},
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
--for steam gen direction 2	
	{
		type = "storage-tank",
		name = "verticalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.5, -3.0}, {0.5, 3.0}},
		selection_box = {{-0.5, -3.0}, {0.5, 3.0}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ type="input", position = {-1, 1.5} },
				{ type="output", position = { -1, -0.5} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL02.png",
			priority = "extra-high",
			frames = 1,
			width = 540,
			height = 540,
			scale = 40/250,
			shift = {.8, -2.5},
			}
		},
	},
--for steam gen direction 6		
	{
		type = "storage-tank",
		name = "verticalreactorpipebus-02",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.5, -3.0}, {0.5, 3.0}},
		selection_box = {{-0.5, -3.0}, {0.5, 3.0}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ type="input", position = {-1, 1.5} },
				{ type="output", position = { -1, -0.5} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL02.png",
			priority = "extra-high",
			frames = 1,
			width = 540,
			height = 540,
			scale = 40/250,
			shift = {.8, 2.3},
			}
		},
	},
--direction 0	
	{
		type = "storage-tank",
		name = "horizontalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconH.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-3.0, -0.5}, {3.0, 0.5}},
		selection_box = {{-3.0, -0.5}, {3.0, 0.5}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =	
			{
				{ type="input", position = {1.5, 1} },
				{ type="output", position = {-0.5, 1} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
			priority = "extra-high",
			frames = 1,
			width = 540,
			height = 540,
			scale = 40/250,
			shift = {-1.6, 0},
			}
		},
	},
--direction 4
	{
		type = "storage-tank",
		name = "horizontalreactorpipebus-02",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconH.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-3.0, -0.5}, {3.0, 0.5}},
		selection_box = {{-3.0, -0.5}, {3.0, 0.5}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =	
			{
				{ type="input", position = {1.5, 1} },
				{ type="output", position = {-0.5, 1} },
			},			
		},
		picture =
		{
			sheet =
			{
			filename = "__UraniumPower__/graphics/entity/steam-generator-internals/STEAMGENINTERNAL01.png",
			priority = "extra-high",
			frames = 1,
			width = 540,
			height = 540,
			scale = 40/250,
			shift = {2.8, 0},
			}
		},
	},
})