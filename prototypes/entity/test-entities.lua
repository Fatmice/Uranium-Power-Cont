data:extend({
  {
    type = "pump",
    name = "test-small-pump",
    icon = "__UraniumPower__/graphics/entity/3x2pump/test.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "test-small-pump"},
    max_health = 80,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-1.4, -0.8}, {1.4, 0.8}},
    selection_box = {{-1.5, -1.0}, {1.5, 1.0}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {-1.0, 1.5}, type="input" },
        { position = {1.0, 1.5}, type="output" },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "30kW",
    pumping_speed = 0.5,
    animations =
    {
      north =
      {
        filename = "__UraniumPower__/graphics/entity/3x2pump/test.png",
        width = 96,
        height = 64,
        frame_count = 1
      },
      east =
      {
        filename = "__UraniumPower__/graphics/entity/3x2pump/testrot.png",
        width = 64,
        height = 96,
        frame_count = 1
      },
      south =
      {
        filename = "__UraniumPower__/graphics/entity/3x2pump/test.png",
        width = 96,
        height = 64,
        frame_count = 1
      },
      west =
      {
        filename = "__UraniumPower__/graphics/entity/3x2pump/testrot.png",
        width = 64,
        height = 96,
        frame_count = 1
      }
    }
	},
	{
		type = "item",
		name = "test-small-pump",
		icon = "__UraniumPower__/graphics/entity/3x2pump/test.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-raw-resource",
		order = "d[uraninite]",
		stack_size = 50,
		place_result = "test-small-pump",
	},
 	{
		type = "recipe",
		name = "test-small-pump",
		energy_required = 0.1,
		enabled = "true",
		ingredients =
		{
			{"iron-plate", 1}
		},
		result= "test-small-pump"
	},
})