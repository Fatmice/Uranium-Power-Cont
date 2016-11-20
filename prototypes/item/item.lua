data:extend(
{
	{
		type = "item",
		name = "uraninite",
		icon = "__UraniumPower__/graphics/icons/uraninite.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "uranium-raw-resource",
		order = "g[uranium]",
		stack_size = 50
	},
	{
		type = "item",
		name = "fluorite",
		icon = "__UraniumPower__/graphics/icons/fluorite.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "uranium-raw-resource",
		order = "g[uranium]",
		stack_size = 50
	},
	{
		type = "item",
		name = "yellowcake",
		icon = "__UraniumPower__/graphics/icons/yellowcake.png",
		flags = {"goes-to-main-inventory"},
		subgroup = "uranium-raw-resource",
		order = "g[uranium]",
		stack_size = 50
	},
	{
		type = "item",
		name = "pressure-pump",
		icon = "__UraniumPower__/graphics/icons/pressure-pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "pressure-pump",
		stack_size = 50
	},
	{
		type = "item",
		name = "fast-pump",
		icon = "__UraniumPower__/graphics/icons/fast-pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "fast-pump",
		stack_size = 50
	},
	{
		type = "item",
		name = "fission-reactor-fuel",
		icon = "__UraniumPower__/graphics/icons/fission-reactor-fuel.png",
		dark_background_icon = "__base__/graphics/icons/coal-dark-background.png",
		flags = {"goes-to-main-inventory"},
		fuel_value = "1.5MJ",
		subgroup = "uranium-raw-resource",
		order = "g[uranium]",
		stack_size = 100
	},
	{
		type = "item",
		name = "heat-exchanger",
		icon = "__UraniumPower__/graphics/entity/small-heat-exchanger/icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "heat-exchanger",
		stack_size = 50
	},
	{
		type = "item",
		name = "S-new-heat-exchanger-01",
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchanger1icon.png",
		flags = {"goes-to-quickbar"},
		group = "uranium",
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "S-new-heat-exchanger-01",
		stack_size = 10
	},
	{
		type = "item",
		name = "R-new-heat-exchanger-01",
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/Rheatexchanger1icon.png",
		flags = {"goes-to-quickbar"},
		group = "uranium",
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "R-new-heat-exchanger-01",
		stack_size = 10
	},
	{
		type = "item",
		name = "S-new-heat-exchanger-02",
		icon = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/S-3x3heatexchanger-icon.png",
		flags = {"goes-to-quickbar"},
		group = "uranium",
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "S-new-heat-exchanger-02",
		stack_size = 5
	},
	{
		type = "item",
		name = "R-new-heat-exchanger-02",
		icon = "__UraniumPower__/graphics/entity/3x3-heat-exchanger/R-3x3heatexchanger-icon.png",
		flags = {"goes-to-quickbar"},
		group = "uranium",
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		place_result = "R-new-heat-exchanger-02",
		stack_size = 5
	},
	{
		type = "item",
		name = "R-reactor-circ-pump-01",
		icon = "__UraniumPower__/graphics/entity/reactor-recirc-pump/R2x2pump.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-energy-pipe-distribution",
		order = "b[uranium]",
		stack_size = 5,
		place_result = "R-reactor-circ-pump-01",
	},
	{
		type = "item",
		flags = {"goes-to-main-inventory"},
		subgroup = "uranium-products",
		order = "ec[uranium]",
		stack_size = 1000,
		name = "coal-ash",
		icon = "__UraniumPower__/graphics/icons/coal-ash.png",
	},
 	{
		type = "item",
		icon = "__UraniumPower__/graphics/entity/coal-burner/coal-burner-icon.png",
		flags = {"goes-to-quickbar"},
		subgroup = "uranium-production-machine",
		order = "d[uranium]",
		stack_size = 10,
		name = "coal-burner",
		place_result = "coal-burner",
	},
})