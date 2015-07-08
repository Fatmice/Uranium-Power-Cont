data:extend(
{
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
		type = "storage-tank",
		name = "verticalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconV.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-0.3, -3.0}, {0.3, 3.0}},
		selection_box = {{-0.5, -3.0}, {0.5, 3.0}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ type="input", position = {-1, 0.5} },
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
		type = "storage-tank",
		name = "horizontalreactorpipebus-01",
		icon = "__UraniumPower__/graphics/entity/4x1pipe/4x1pipeiconH.png",
		flags = {"placeable-player", "player-creation"},
		minable = {hardness = 0.1, mining_time = 0.1},
		max_health = 100,
		corpse = "small-remnants",
		collision_box = {{-3.0, -0.3}, {3.0, 0.3}},
		selection_box = {{-3.0, -0.5}, {3.0, 0.5}},
		fluid_box =
		{
			base_area = 50,
			base_level = -1,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =	
			{
				{ type="input", position = {0.5, 1} },
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
	}
})