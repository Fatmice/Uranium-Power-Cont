data:extend(
{	
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
	}
})