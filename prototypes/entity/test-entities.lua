data:extend({
  {
    type = "pump",
    name = "S-test-small-pump",
    icon = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "S-test-small-pump"},
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
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-0.5, 1.5}, type="input" },
        { position = {1.5, -0.5}, type="output" },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "500kW",
    pumping_speed = 20.0,
    animations =
    {
      north =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      },
      east =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      },
      south =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      },
      west =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      }
    }
	},
	{
		type = "item",
		name = "S-test-small-pump",
		icon = "__UraniumPower__/graphics/entity/2x2pump/S2x2pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "S-test-small-pump",
	},
 	{
		type = "recipe",
		name = "S-test-small-pump",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "S-test-small-pump"
	},
  {
    type = "pump",
    name = "R-test-small-pump",
    icon = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "R-test-small-pump"},
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
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-0.5, 1.5}, type="output" },
        { position = {1.5, -0.5}, type="input" },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "500kW",
    pumping_speed = 20.0,
    animations =
    {
      north =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      },
      east =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      },
      south =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      },
      west =
      {
        filename = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
        width = 64,
        height = 64,
        frame_count = 1
      }
    }
	},
	{
		type = "item",
		name = "R-test-small-pump",
		icon = "__UraniumPower__/graphics/entity/2x2pump/R2x2pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "R-test-small-pump",
	},
 	{
		type = "recipe",
		name = "R-test-small-pump",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "R-test-small-pump"
	},
})