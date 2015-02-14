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
		pumping_speed = 3,
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
		}
	},
	{
		type = "assembling-machine",
		name = "pressure-pump",
		icon = "__base__/graphics/icons/small-pump.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "pressure-pump"},
		max_health = 250,
		corpse = "small-remnants",
		dying_explosion = "huge-explosion",
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
			pipe_connections = {{ type="input", position = {0, -1} }}
		  },
		  {
			production_type = "output",
			pipe_covers = pipecoverspictures(),
			base_area = 10,
			base_level = 1,
			pipe_connections = {{ type="output", position = {0, 1} }}
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
	},
    {
		type = "wall",
		name = "heat-exchanger",
		icon = "__base__/graphics/icons/stone-wall.png",
		flags = {"placeable-neutral", "player-creation"},
		collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
		selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
		minable = {mining_time = 1, result = "heat-exchanger"},
		max_health = 350,
		repair_speed_modifier = 2,
		corpse = "wall-remnants",
		repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
		mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
		-- this kind of code can be used for having walls mirror the effect
		-- there can be multiple reaction items
		--attack_reaction =
		--{
		  --{
			---- how far the mirroring works
			--range = 2,
			---- what kind of damage triggers the mirroring
			---- if not present then anything triggers the mirroring
			--damage_type = "physical",
			---- caused damage will be multiplied by this and added to the subsequent damages
			--reaction_modifier = 0.1,
			--action =
			--{
			  --type = "direct",
			  --action_delivery =
			  --{
				--type = "instant",
				--target_effects =
				--{
				  --type = "damage",
				  ---- always use at least 0.1 damage
				  --damage = {amount = 0.1, type = "physical"}
				--}
			  --}
			--},
		  --}
		--},
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

		--__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png
		pictures =
		{
			single =
			{
				layers = 
				{
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0, -0.15625}
					},
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.359375, 0.5},
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
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0, -0.15625}
						},
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0.390625, 0.625},
							draw_as_shadow = true
						}
					}
				},
				{
					layers =
					{
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0, -0.15625}
						},
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0.390625, 0.625},
							draw_as_shadow = true
						}
					}
				},
				{
					layers =
					{
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0, -0.15625}
						},
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0.390625, 0.625},
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
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0, -0.15625}
						},
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0.421875, 0.5},
							draw_as_shadow = true
						}
					}
				},
				{
					layers =
					{
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0, -0.15625}
						},
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0.421875, 0.5},
							draw_as_shadow = true
						}
					}
				},
				{
					layers =
					{
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0, -0.15625}
						},
						{
							filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
							priority = "extra-high",
							width = 64,
							height = 64,
							--shift = {0.421875, 0.5},
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
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.078125, -0.15625}
					},
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.484375, 0.640625},
						draw_as_shadow = true
					}
				}
			},
			corner_left_down =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {-0.078125, -0.15625}
					},
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.328125, 0.640625},
						draw_as_shadow = true
					}
				}
			},
			t_up =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0, -0.15625}
					},
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.546875, 0.640625},
						draw_as_shadow = true
					}
				}
			},
			ending_right =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.078125, -0.15625}
					},
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.484375, 0.5},
						draw_as_shadow = true
					}
				}
			},
			ending_left =
			{
				layers =
				{
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {-0.078125, -0.15625}
					},
					{
						filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
						priority = "extra-high",
						width = 64,
						height = 64,
						--shift = {0.328125, 0.5},
						draw_as_shadow = true
					}
				}
			}
		}
	},
 {
    type = "assembling-machine",
    name = "new-heat-exchanger-01",
    icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1icon.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.1, result = "new-heat-exchanger-01"},
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
    crafting_categories = {"chemistry"},
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
      filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
      priority = "high",
      width = 90,
      height = 81,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {0.46, 0}
    },
    --[[animation =
    {
      filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
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
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      },
      west =
      {
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1rot-270.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      },
      south =
      {
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1-180.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      },
      east =
      {
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1rot.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      }
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/substation.ogg" },
      apparent_volume = 1.5,
    },
    fluid_boxes =
    {
	   {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
		base_area = 7.5,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-0.5, 1.5} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 15,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-0.5, -1.5} }}
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 15,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0.5, -1.5} }}
      },
      
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
		base_area = 30,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0.5, 1.5} }}
      }
    }
  },
  {
    type = "item",
    name = "new-heat-exchanger-01",
    icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1icon.png",
    flags = {"goes-to-quickbar"},
	group = "uranium",
    subgroup = "uranium-energy-pipe-distribution",
    order = "a[items]-b[iron-chest]",
    place_result = "new-heat-exchanger-01",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "new-heat-exchanger-01",
    enabled = "true",
    energy_required = 0.1,
    ingredients =
    {
      {"iron-plate", 1}
    },
    result = "new-heat-exchanger-01"
  },
 {
    type = "assembling-machine",
    name = "R-new-heat-exchanger-01",
    icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/Rheatexchanger1icon.png",
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
    crafting_categories = {"chemistry"},
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
      filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
      priority = "high",
      width = 90,
      height = 81,
      axially_symmetrical = false,
      direction_count = 4,
      shift = {0.46, 0}
    },
    --[[animation =
    {
      filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
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
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      },
      west =
      {
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1rot-270.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      },
      south =
      {
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1-180.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      },
      east =
      {
        filename = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1rot.png",
		width = 120,
		height = 80,
        frame_count = 1,
		shift = {0.68, -0.05}
      }
    },
    working_sound =
    {
      sound = { filename = "__base__/sound/substation.ogg" },
      apparent_volume = 1.5,
    },
    fluid_boxes =
    {
	   {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
		base_area = 7.5,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0.5, 1.5} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 15,
        base_level = 1,
        pipe_connections = {{ type="output", position = {-0.5, 1.5} }} 
      },
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 15,
        base_level = -1,
        pipe_connections = {{ type="input", position = {-0.5, -1.5} }}
      },
      
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
		base_area = 30,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0.5, -1.5} }}
      }
    }
  },
  {
    type = "item",
    name = "R-new-heat-exchanger-01",
    icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/Rheatexchanger1icon.png",
    flags = {"goes-to-quickbar"},
	group = "uranium",
    subgroup = "uranium-energy-pipe-distribution",
    order = "a[items]-b[iron-chest]a",
    place_result = "R-new-heat-exchanger-01",
    stack_size = 50
  },
  {
    type = "recipe",
    name = "R-new-heat-exchanger-01",
    enabled = "true",
    energy_required = 0.1,
    ingredients =
    {
      {"iron-plate", 1}
    },
    result = "R-new-heat-exchanger-01"
  },
  {
    type = "recipe",
    name = "heat-exchange-water-water",
    category = "chemistry",
    enabled = "true",
    energy_required = 1,
    ingredients =
    {
      {type="fluid", name="water", amount=150},
      {type="fluid", name="water", amount=75}
    },
    results=
    {
      {type="fluid", name="water", amount=150},
      {type="fluid", name="water", amount=75},
    },
    icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
    subgroup = "uranium-prefluids",
    order = "a[oil-processing]-b[advanced-oil-processing]"
  }
})