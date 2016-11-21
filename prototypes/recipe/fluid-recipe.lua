data:extend(
{
	{
		type = "recipe",
		name = "coal-burning",
		category = "coal-burning",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="water", amount=180},
			{"coal", 3}
		},
		results=
		{
			{type="fluid", name="water", amount=180, temperature = 100},
			{"coal-ash", 4},
		},
		icon = "__UraniumPower__/graphics/icons/coal-ash-recipe.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "aa"
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
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "ab"
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
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "ac"
	},
		{
		type = "recipe",
		name = "heat-exchange-pressurised-water-pressurised-water-01",
		category = "heat-exchanger-01",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=100},
			{type="fluid", name="pressurised-water", amount=90}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=100},
			{type="fluid", name="pressurised-water", amount=90},
		},
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "ad"
	},
	{
		type = "recipe",
		name = "heat-exchange-water-water-02",
		category = "heat-exchanger-02",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="water", amount=150},
			{type="fluid", name="water", amount=90}
		},
		results=
		{
			{type="fluid", name="water", amount=150},
			{type="fluid", name="water", amount=90},
		},
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "ae"
	},
	{
		type = "recipe",
		name = "heat-exchange-pressurised-water-water-02",
		category = "heat-exchanger-02",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=75},
			{type="fluid", name="water", amount=180}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=75},
			{type="fluid", name="water", amount=180},
		},
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "af"
	},
	{
		type = "recipe",
		name = "heat-exchange-pressurised-water-pressurised-water-02",
		category = "heat-exchanger-02",
		enabled = "false",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=200},
			{type="fluid", name="pressurised-water", amount=180}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=200},
			{type="fluid", name="pressurised-water", amount=180},
		},
		icon = "__UraniumPower__/graphics/entity/2x2-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "uranium-heatexchangerecipes",
		order = "ag"
	},
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
		},
		order = "b"
	}
})
