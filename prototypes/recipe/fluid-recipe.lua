data:extend(
{
	{
		type = "recipe",
		name = "pressurised-water",
		category = "pressure-pump",
		energy_required = 2,
		enabled = "false",
		ingredients =
		{     
			{type="fluid", name="water", amount=10} 
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=10},
		}
	},
	{
		type = "recipe",
		name = "heat-exchange-water-water-01",
		category = "heat-exchanger",
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
		order = "a-a"
	},
	{
		type = "recipe",
		name = "heat-exchange-pressurised-water-water-01",
		category = "heat-exchanger",
		enabled = "true",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=75},
			{type="fluid", name="water", amount=75}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=75},
			{type="fluid", name="water", amount=75},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-prefluids",
		order = "a-b"
	}
})