data:extend(
{
	{
		type = "generator",
		name = "reactor-turbine-generator-01a",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconLU.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "reactor-turbine-generator-01a"},
		max_health = 1000,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
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
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/turbineh.png",
			width = 1000,
			height = 1000,
			frame_count = 4,
			line_length = 2,
			--h2  shift
			--shift = {2.0, -1.30},
			--original H:
			scale = 343/811,
			shift = {0.9, -1.06},
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/turbinev2.png",
			width = 1000,
			height = 1000,
			frame_count = 4,
			line_length = 2,
			scale = 343/811,
			shift = {3.27, -1.35},
		},
		smoke =
		{
			{
			name = "smoke",
			north_position = {1, -5}, 
			east_position = {-0.9, -4.25}, 
			deviation = {2, 2},
			frequency = 10 / 31,
			starting_vertical_speed = 0.05
			}
		},
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
		type = "generator",
		name = "reactor-turbine-generator-01b",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconRD.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "reactor-turbine-generator-01b"},
		max_health = 1000,
		corpse = "big-remnants",
		dying_explosion = "medium-explosion",
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
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-output"
		},
		vertical_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/turbineh2.png",
			width = 1000,
			height = 1000,
			frame_count = 4,
			line_length = 2,
			scale = 343/811,
			shift = {1.4, -0.8},
		},
		horizontal_animation =
		{
			filename = "__UraniumPower__/graphics/entity/turbine-generator/turbinev.png",
			width = 1000,
			height = 1000,
			frame_count = 4,
			line_length = 2,
			scale = 343/811,
			shift = {3.65, -0.55},
		},
		smoke =
		{
			{
			name = "smoke",
			north_position = {-3.1, -5.5},
			east_position = {-1, -5.5}, 
			deviation = {2, 2},
			frequency = 10 / 31,
			starting_vertical_speed = 0.05
			}
		},
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
	}
})