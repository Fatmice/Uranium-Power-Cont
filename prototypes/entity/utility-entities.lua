data:extend(
{
	{
		type = "pump",
		name = "fast-pump",
		icon = "__base__/graphics/icons/small-pump.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {mining_time = 1, result = "fast-pump"},
		max_health = 80,
		fast_replaceable_group = "pipe",
		corpse = "small-remnants",
		resistances =
		{
		  {
			type = "fire",
			percent = 70
		  }
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fluid_box =
		{
		  base_area = 1,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
			{ position = {0, -1}, type="output" },
			{ position = {0, 1}, type="input" },
		  },
		},
		energy_source =
		{
		  type = "electric",
		  usage_priority = "secondary-input",
		  emissions = 0.01 / 2.5
		},
		energy_usage = "150kW",
		pumping_speed = 4,
		animations =
		{
			north =
			{
				filename = "__base__/graphics/entity/small-pump/small-pump-up.png",
				width = 46,
				height = 56,
				frame_count = 8,
				shift = {0.09375, 0.03125},
				animation_speed = 1
			},
			east =
			{
				filename = "__base__/graphics/entity/small-pump/small-pump-right.png",
				width = 51,
				height = 56,
				frame_count = 8,
				shift = {0.265625, -0.21875},
				animation_speed = 1
			},
			south =
			{
				filename = "__base__/graphics/entity/small-pump/small-pump-down.png",
				width = 61,
				height = 58,
				frame_count = 8,
				shift = {0.421875, -0.125},
				animation_speed = 1
			},
			west =
			{
				filename = "__base__/graphics/entity/small-pump/small-pump-left.png",
				width = 56,
				height = 44,
				frame_count = 8,
				shift = {0.3125, 0.0625},
				animation_speed = 1
			}
		},
		circuit_wire_connection_points =
		{
			{
				shadow =
				{
					red = {0.171875, 0.140625},
					green = {0.171875, 0.265625},
				},
				wire =
				{
					red = {-0.53125, -0.15625},
					green = {-0.53125, 0},
				}
			},
			{
				shadow =
				{
					red = {0.890625, 0.703125},
					green = {0.75, 0.75},
				},
				wire =
				{
					red = {0.34375, 0.28125},
					green = {0.34375, 0.4375},
				}
			},
			{
				shadow =
				{
					red = {0.15625, 0.0625},
					green = {0.09375, 0.125},
				},
				wire =
				{
					red = {-0.53125, -0.09375},
					green = {-0.53125, 0.03125},
				}
			},
			{
				shadow =
				{
					red = {0.796875, 0.703125},
					green = {0.625, 0.75},
				},
				wire =
				{
					red = {0.40625, 0.28125},
					green = {0.40625, 0.4375},
				}
			}
		},
		circuit_connector_sprites =
		{
			get_circuit_connector_sprites({-0.40625, -0.3125}, nil, 24),
			get_circuit_connector_sprites({0.125, 0.21875}, {0.34375, 0.40625}, 18),
			get_circuit_connector_sprites({-0.40625, -0.25}, nil, 24),
			get_circuit_connector_sprites({0.203125, 0.203125}, {0.25, 0.40625}, 18),
		},
		circuit_wire_max_distance = 7.5
	},
	{
		type = "assembling-machine",
		name = "pressure-pump",
		icon = "__base__/graphics/icons/small-pump.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "pressure-pump"},
		max_health = 250,
		corpse = "small-remnants",
		dying_explosion = "medium-explosion",
		resistances =
		{
		  {
			type = "fire",
			percent = 70
		  }
		},
		fluid_boxes =
		{
		  {
			production_type = "input",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = -1,
			pipe_connections = {{ type="input", position = {0, 1} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = 1,
			pipe_connections = {{ type="output", position = {0, -1} }}
		  }
		},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		fast_replaceable_group = "pipe",
		animation =
		{
		  north =
		  {
				filename = "__base__/graphics/entity/small-pump/small-pump-up.png",
				width = 46,
				height = 56,
				frame_count = 8,
				shift = {0.09375, 0.03125},
				animation_speed = 0.2
		  },
		  east =
		  {
				filename = "__base__/graphics/entity/small-pump/small-pump-right.png",
				width = 51,
				height = 56,
				frame_count = 8,
				shift = {0.265625, -0.21875},
				animation_speed = 0.2
		  },
		  south =
		  {
				filename = "__base__/graphics/entity/small-pump/small-pump-down.png",
				width = 61,
				height = 58,
				frame_count = 8,
				shift = {0.421875, -0.125},
				animation_speed = 0.2
		  },
		  west =
		  {
				filename = "__base__/graphics/entity/small-pump/small-pump-left.png",
				width = 56,
				height = 44,
				frame_count = 8,
				shift = {0.3125, 0.0625},
				animation_speed = 0.2
		  }
		},
		open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
		close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
		working_sound =
		{
		  sound = {
			{
				filename = "__base__/sound/assembling-machine-t2-1.ogg",
				volume = 0.8
			},
			{
				filename = "__base__/sound/assembling-machine-t2-2.ogg",
				volume = 0.8
			},
		  },
		  idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
		  apparent_volume = 1.5,
		},
		crafting_categories = {"pressure-pump"},
		crafting_speed = 1,
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0
		},
		energy_usage = "150kW",
		ingredient_count = 1,
		--    module_slots = 2,
		--    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
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
		type = "wall",
		name = "heat-exchanger",
		icon = "__UraniumPower__/graphics/entity/small-heat-exchanger/icon.png",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		minable = {mining_time = 1, result = "heat-exchanger"},
		max_health = 350,
		repair_speed_modifier = 2,
		corpse = "wall-remnants",
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		resistances =
		{
			{
				type = "physical",
				decrease = 3,
				percent = 20
			},
			{
				type = "impact",
				decrease = 45,
				percent = 60
			},
			{
				type = "explosion",
				decrease = 10,
				percent = 30
			},
			{
				type = "fire",
				percent = 100
			},
			{
				type = "laser",
				percent = 70
			}
		},
		pictures =
		{
			single =
			{
				layers = 
				{
					{
						filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-single.png",
						priority = "extra-high",
						width = 22,
						height = 42,
						shift = {0, -0.15625}
					},
					{
						filename = "__base__/graphics/entity/stone-wall/wall-single-shadow.png",
						priority = "extra-high",
						width = 47,
						height = 32,
						shift = {0.359375, 0.5},
						draw_as_shadow = true
					}
				}
			},
			straight_vertical =
			{
				{
					layers =
					{
						{
							filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-straight-vertical-3.png",
							priority = "extra-high",
							width = 22,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__base__/graphics/entity/stone-wall/wall-straight-vertical-shadow.png",
							priority = "extra-high",
							width = 47,
							height = 60,
							shift = {0.390625, 0.625},
							draw_as_shadow = true
						}
					}
				}
				},
			straight_horizontal =
			{
				{
					layers =
					{
						{
							filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/test-walls.png",
							priority = "extra-high",
							width = 32,
							height = 42,
							shift = {0, -0.15625}
						},
						{
							filename = "__base__/graphics/entity/stone-wall/wall-straight-horizontal-shadow.png",
							priority = "extra-high",
							width = 59,
							height = 32,
							shift = {0.421875, 0.5},
							draw_as_shadow = true
						}
					}
				}
			},
			corner_right_down =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-corner-right-down.png",
						priority = "extra-high",
						width = 27,
						height = 42,
						shift = {0.078125, -0.15625}
					},
					{
						filename = "__base__/graphics/entity/stone-wall/wall-corner-right-down-shadow.png",
						priority = "extra-high",
						width = 53,
						height = 61,
						shift = {0.484375, 0.640625},
						draw_as_shadow = true
					}
				}
			},
			corner_left_down =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-corner-left-down.png",
						priority = "extra-high",
						width = 27,
						height = 42,
						shift = {-0.078125, -0.15625}
					},
					{
						filename = "__base__/graphics/entity/stone-wall/wall-corner-left-down-shadow.png",
						priority = "extra-high",
						width = 53,
						height = 60,
						shift = {0.328125, 0.640625},
						draw_as_shadow = true
					}
				}
			},
			t_up =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-t-down.png",
						priority = "extra-high",
						width = 32,
						height = 42,
						shift = {0, -0.15625}
					},
					{
						filename = "__base__/graphics/entity/stone-wall/wall-t-down-shadow.png",
						priority = "extra-high",
						width = 71,
						height = 61,
						shift = {0.546875, 0.640625},
						draw_as_shadow = true
					}
				}
			},
			ending_right =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-ending-right.png",
						priority = "extra-high",
						width = 27,
						height = 42,
						shift = {0.078125, -0.15625}
					},
					{
						filename = "__base__/graphics/entity/stone-wall/wall-ending-right-shadow.png",
						priority = "extra-high",
						width = 53,
						height = 32,
						shift = {0.484375, 0.5},
						draw_as_shadow = true
					}
				}
			},
			ending_left =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/small-heat-exchanger/wall-ending-left.png",
						priority = "extra-high",
						width = 27,
						height = 42,
						shift = {-0.078125, -0.15625}
					},
					{
						filename = "__base__/graphics/entity/stone-wall/wall-ending-left-shadow.png",
						priority = "extra-high",
						width = 53,
						height = 32,
						shift = {0.328125, 0.5},
						draw_as_shadow = true
					}
				}
			}
		}
	},
	{
		type = "assembling-machine",
		name = "S-new-heat-exchanger-01",
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "S-new-heat-exchanger-01"},
		max_health = 200,
		corpse = "medium-remnants",
		crafting_speed = 1.00,
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions = 0,
		},
		energy_usage = "5kW",
		ingredient_count = 4,
		crafting_categories = {"heat-exchanger-01"},
		resistances = 
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
		selection_box = {{-1, -1}, {1, 1}},
		pictures =
		{
			filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1.png",
			priority = "high",
			width = 90,
			height = 81,
			axially_symmetrical = false,
			direction_count = 4,
			shift = {0.46, 0}
		},
		animation =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1rot-270.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1-180.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1rot.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			}
		},
		working_sound =
		{
			sound = { filename = "__base__/sound/chemical-plant.ogg" },
			apparent_volume = 1.5,
		},
		fluid_boxes =
		{
			{
				--S-0,1
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 7.5,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-0.5, 1.5} }}
			},
			{
				--S-0,3
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 15,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-0.5, -1.5} }}
			},
			{
				--S-0,2
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 15,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0.5, -1.5} }}
			},
			{
				--S-0,4
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0.5, 1.5} }}
			}
		},
		circuit_connector_sprites =
		{
		  get_circuit_connector_sprites_1({0.5625-1, 1.03125}, {0.5625-1, 1.03125}, 0), --N
		  get_circuit_connector_sprites_1({-0.78125, 0.28125-1}, {-0.78125, 0.28125-1}, 6), --E
		  get_circuit_connector_sprites_1({-0.28125+1, 0.28125}, {-0.28125+1, 0.28125}, 0), --S
		  get_circuit_connector_sprites_1({0.03125, 0.28125+1}, {0.03125, 0.28125+1}, 6), --W
		},
		circuit_wire_max_distance = 7.5,
	},
	{
		type = "assembling-machine",
		name = "R-new-heat-exchanger-01",
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/Rheatexchanger1icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "R-new-heat-exchanger-01"},
		max_health = 200,
		corpse = "medium-remnants",
		crafting_speed = 1.00,
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions = 0,
		},
		energy_usage = "5kW",
		ingredient_count = 4,
		crafting_categories = {"heat-exchanger-01"},
		resistances = 
		{
			{
				type = "fire",
				percent = 90
			}
		},
		collision_box = {{-0.9, -0.9}, {0.9, 0.9}},
		selection_box = {{-1, -1}, {1, 1}},
		pictures =
		{
			filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1.png",
			priority = "high",
			width = 90,
			height = 81,
			axially_symmetrical = false,
			direction_count = 4,
			shift = {0.46, 0}
		},
		--[[animation =
		{
		filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1.png",
		priority = "high",
		width = 90,
		height = 81,
		frame_count = 1,
		axially_symmetrical = false,
		direction_count = 4,
		shift = {0.46, 0}
		},]]
		animation =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/Rheatexchanger1-180.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/Rheatexchanger1rot.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/Rheatexchanger1.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/Rheatexchanger1rot-270.png",
				width = 120,
				height = 80,
				frame_count = 1,
				shift = {0.68, -0.05}
			}
		},
		working_sound =
		{
			sound = { filename = "__base__/sound/chemical-plant.ogg" },
			apparent_volume = 1.5,
		},
		fluid_boxes =
		{
			{
				--R-0,1
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 7.5,
				base_level = -1,
				pipe_connections = {{ type="input", position = {0.5, 1.5} }}
			},
			{
				--R-0,3
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 15,
				base_level = 1,
				pipe_connections = {{ type="output", position = {0.5, -1.5} }} 
			},
			{
				--R-0,2
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 15,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-0.5, -1.5} }}
				},
			{
				--R-0,4
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-0.5, 1.5} }}
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
		type = "assembling-machine",
		name = "S-new-heat-exchanger-02",
		icon = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/S-3x3heatexchanger-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "S-new-heat-exchanger-02"},
		max_health = 200,
		corpse = "medium-remnants",
		crafting_speed = 1.00,
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions = 0,
		},
		energy_usage = "5kW",
		ingredient_count = 4,
		crafting_categories = {"heat-exchanger-02"},
		resistances = 
		{
			{
			type = "fire",
			percent = 90
			}
		},
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		pictures =
		{
			filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/3x3heatexchanger.png",
			priority = "high",
			width = 116,
			height = 99,
			shift = { 0.34, -0.05}
		},
		animation =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/3x3heatexchanger.png",
				width = 116,
				height = 99,
				frame_count = 1,
				shift = { 0.34, -0.05}
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/3x3heatexchangerrot270.png",
				width = 118,
				height = 99,
				frame_count = 1,
				shift = { 0.31, -0.05}
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/3x3heatexchanger180.png",
				width = 116,
				height = 99,
				frame_count = 1,
				shift = { 0.34, -0.05}
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/3x3heatexchangerrot.png",
				width = 118,
				height = 99,
				frame_count = 1,
				shift = { 0.31, -0.05}
			}
		},
		working_sound =
		{
			sound = { filename = "__base__/sound/chemical-plant.ogg" },
			apparent_volume = 1.5,
		},
		fluid_boxes =
		{
			{
				--S-0,1
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 60,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-1, 2} }}
			},
			{
				--S-0,3
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 60,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-1, -2} }}
			},
			{
				--S-0,2
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = -1,
				pipe_connections = {{ type="input", position = {1, -2} }}
			},
			{
				--S-0,4
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = 1,
				pipe_connections = {{ type="output", position = {1, 2} }}
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
		type = "assembling-machine",
		name = "R-new-heat-exchanger-02",
		icon = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R-3x3heatexchanger-icon.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "R-new-heat-exchanger-02"},
		max_health = 200,
		corpse = "medium-remnants",
		crafting_speed = 1.00,
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions = 0,
		},
		energy_usage = "5kW",
		ingredient_count = 4,
		crafting_categories = {"heat-exchanger-02"},
		resistances = 
		{
			{
			type = "fire",
			percent = 90
			}
		},
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		pictures =
		{
			filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R3x3heatexchanger180.png",
			priority = "high",
			width = 116,
			height = 99,
			shift = { 0.34, -0.05}
		},
		animation =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R3x3heatexchanger180.png",
				width = 116,
				height = 99,
				frame_count = 1,
				shift = { 0.34, -0.05}
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R3x3heatexchangerrot.png",
				width = 118,
				height = 99,
				frame_count = 1,
				shift = { 0.31, -0.05}
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R3x3heatexchanger.png",
				width = 116,
				height = 99,
				frame_count = 1,
				shift = { 0.34, -0.05}
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R3x3heatexchangerrot-270.png",
				width = 118,
				height = 99,
				frame_count = 1,
				shift = { 0.31, -0.05}
			}
		},
		working_sound =
		{
			sound = { filename = "__base__/sound/chemical-plant.ogg" },
			apparent_volume = 1.5,
		},
		fluid_boxes =
		{
			{
				--R-0,1
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 60,
				base_level = -1,
				pipe_connections = {{ type="input", position = {1, 2} }}
			},
			{
				--R-0,3
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 60,
				base_level = 1,
				pipe_connections = {{ type="output", position = {1, -2} }}
			},
			{
				--R-0,2
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-1, -2} }}
			},
			{
				--R-0,4
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-1, 2} }}
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
		type = "pump",
		name = "R-reactor-circ-pump-01",
		icon = "__UraniumPower__/graphics/entity/reactor-recirc-pump/R2x2pump.png",
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
			base_area = 10,
			--pipe_covers = pipecoverspictures(),
			pipe_connections =
			{
				{ position = {-0.5, 1.5}, type="output" },
				{ position = {1.5, 0.5}, type="input" },
				--{ position = {1.5, 0.5}, type="input" },
			},
		},
		energy_source =
		{
			type = "electric",
			usage_priority = "secondary-input",
			emissions = 0.0001 / 2.5
		},
		energy_usage = "500kW",
		pumping_speed = 20.0,
		animations =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/reactor-recirc-pump/2x2recirc.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.8},
				line_length = 3
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/reactor-recirc-pump/2x2recirc90.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.8},
				line_length = 3
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/reactor-recirc-pump/2x2recirc180.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.7},
				line_length = 3
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/reactor-recirc-pump/2x2recirc270.png",
				width = 297,
				height = 297,
				scale = 0.5,
				frame_count = 5,
				shift = {0.6, -0.65},
				line_length = 3
			}
		},
		circuit_wire_connection_points =
		{
			{
				shadow =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				},
				wire =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				}
			},
			{
				shadow =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				},
				wire =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				}
			},
			{
				shadow =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				},
				wire =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				}
			},
			{
				shadow =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				},
				wire =
				{
				  red = {0,0.75},
				  green = {0,0.75},
				}
			}
		},
		circuit_connector_sprites = 
		{
			get_circuit_connector_sprites_1({-0.40625, -0.3125}, nil, 24),
			get_circuit_connector_sprites_1({0.125, 0.21875}, {0.34375, 0.40625}, 18),
			get_circuit_connector_sprites_1({-0.40625, -0.25}, nil, 24),
			get_circuit_connector_sprites_1({0.203125, 0.203125}, {0.25, 0.40625}, 18),
		},
		circuit_wire_max_distance = 7.5,
	}
})