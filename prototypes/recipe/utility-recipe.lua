data:extend(
{
	{
		type = "recipe",
		name = "pressure-pump",
		energy_required = 2,
		enabled = "false",
		ingredients =
		{
			{"electric-engine-unit", 1},
			{"steel-plate", 1},
			{"pipe", 1}
		},
		result= "pressure-pump"
	},
	{
		type = "recipe",
		name = "fast-pump",
		energy_required = 2,
		enabled = "false",
		ingredients =
		{
			{"electric-engine-unit", 3},
			{"steel-plate", 3},
			{"pipe", 1}
		},
		result= "fast-pump"
	},
	{
		type = "recipe",
		name = "heat-exchanger",
		energy_required = 2,
		enabled = "false",
		ingredients =
		{
			{"copper-plate", 10},
			{"steel-plate", 2}
		},
		result= "heat-exchanger"
	},
	{
		type = "recipe",
		name = "S-new-heat-exchanger-01",
		enabled = "true",
		energy_required = 0.1,
		ingredients =
		{
			{"iron-plate", 1}
		},
		result = "S-new-heat-exchanger-01"
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
		name = "S-new-heat-exchanger-02",
		enabled = "true",
		energy_required = 0.1,
		ingredients =
		{
			{"iron-plate", 1}
		},
		result = "S-new-heat-exchanger-02"
	}
})