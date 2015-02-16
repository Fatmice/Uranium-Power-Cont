data:extend(
{
	{
		type = "recipe",
		name = "pressurised-water",
		category = "heat-exchanger-01",
		energy_required = 2,
		enabled = "false",
		ingredients =
		{     
			{type="fluid", name="water", amount=10} 
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=10},
		},
		order = "b"
	},
	{
		type = "recipe",
		name = "heat-exchange-water-water-01",
		category = "heat-exchanger-01",
		enabled = "false",
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
		subgroup = "uranium-heatexchangerecipes",
		order = "11a-a"
	},
	{
		type = "recipe",
		name = "heat-exchange-pressurised-water-water-01",
		category = "heat-exchanger-01",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=90},
			{type="fluid", name="water", amount=90}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=90},
			{type="fluid", name="water", amount=90},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "11a-b"
	},
	{
		type = "recipe",
		name = "heat-exchange-water-water-02",
		category = "heat-exchanger-02",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="water", amount=300},
			{type="fluid", name="water", amount=150}
		},
		results=
		{
			{type="fluid", name="water", amount=300},
			{type="fluid", name="water", amount=150},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "11a-c"
	},
	{
		type = "recipe",
		name = "heat-exchange-pressurised-water-water-02",
		category = "heat-exchanger-02",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=150},
			{type="fluid", name="water", amount=150}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=150},
			{type="fluid", name="water", amount=150},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "11a-d"
	}
})