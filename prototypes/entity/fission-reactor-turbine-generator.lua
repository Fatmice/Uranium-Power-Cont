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
		type = "generator",
		name = "reactor-turbine-generator-01b",
		icon = "__UraniumPower__/graphics/entity/turbine-generator/turbinegeniconRD.png",
		flags = {"placeable-neutral","player-creation"},
		minable = {mining_time = 1, result = "reactor-turbine-generator-01b"},
		max_health = 1000,
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
	}
})