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
		enabled = "false",
		energy_required = 5,
		ingredients =
		{
			{"copper-plate", 20},
			{"steel-plate", 5}
		},
		result = "S-new-heat-exchanger-01"
	},
	{
		type = "recipe",
		name = "R-new-heat-exchanger-01",
		enabled = "false",
		energy_required = 5,
		ingredients =
		{
			{"copper-plate", 20},
			{"steel-plate", 5}
		},
		result = "R-new-heat-exchanger-01"
	},
	{
		type = "recipe",
		name = "S-new-heat-exchanger-02",
		enabled = "false",
		energy_required = 10,
		ingredients =
		{
			{"copper-plate", 50},
			{"steel-plate", 10}
		},
		result = "S-new-heat-exchanger-02"
	},
	{
		type = "recipe",
		name = "R-new-heat-exchanger-02",
		enabled = "false",
		energy_required = 10,
		ingredients =
		{
			{"copper-plate", 50},
			{"steel-plate", 10}
		},
		result = "R-new-heat-exchanger-02"
	},
	{
		type = "recipe",
		name = "R-reactor-circ-pump-01",
		energy_required = 30,
		enabled = "false",
		ingredients =
		{
			{"copper-plate", 50},
			{"steel-plate", 20},
			{"electronic-circuit",20},
			{"advanced-circuit",10},
			{"processing-unit",5}
		},
		result= "R-reactor-circ-pump-01"
	}
})