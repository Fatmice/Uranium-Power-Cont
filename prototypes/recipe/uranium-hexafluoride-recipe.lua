data:extend(
{
	{
		type = "recipe",
		name = "uraninite-slurry",
		category = "crafting-with-fluid",
		subgroup = "uranium-prefluids",
		energy_required = 3,
		enabled = "false",
		ingredients =
		{
			{type="item", name="uraninite", amount=5},
			{type="fluid", name="water", amount=10}
		},
		results=
		{
			{type="fluid", name="uraninite-slurry", amount=5}
		}
	},
	{
		type = "recipe",
		name = "yellowcake",
		category = "chemistry",
		subgroup = "uranium-prefluids",
		energy_required = 5,
		enabled = "false",
		ingredients =
		{
			{type="fluid", name="sulfuric-acid", amount=5},
			{type="fluid", name="uraninite-slurry", amount=10},
			{type="item", name="empty-barrel", amount=1} 
		},
		results=
		{
			{type="item", name="yellowcake", amount=1}
		}
	},
	{
		type = "recipe",
		name = "fluorine-gas",
		category = "chemistry",
		subgroup = "uranium-prefluids",
		energy_required = 1,
		enabled = "false",
		ingredients =
		{     
			{type="item", name="fluorite", amount=1} 
		},
		results=
		{
			{type="fluid", name="fluorine-gas", amount=15},
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride",
		category = "chemistry",
		enabled = "false",
		energy_required = 5,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride.png",
		ingredients =
		{
			{type="fluid", name="fluorine-gas", amount=50},
			{type="item", name="yellowcake", amount=1}
		},
		results=
		{
			{type="item", name="empty-barrel", amount=1},
			{type="fluid", name="uranium-hexafluoride-02", amount=75}
		},
	},
	{
		type = "recipe",
		category = "chemistry",
		name = "uranium-hexafluoride-02",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-02.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-02", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-01", amount=5},
			{type="fluid", name="uranium-hexafluoride-03", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-03",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-03.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-03", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-02", amount=5},
			{type="fluid", name="uranium-hexafluoride-04", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-04",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-04.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-04", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-03", amount=5},
			{type="fluid", name="uranium-hexafluoride-05", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-05",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-05.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-05", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-04", amount=5},
			{type="fluid", name="uranium-hexafluoride-06", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-06",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-06.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-06", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-05", amount=5},
			{type="fluid", name="uranium-hexafluoride-07", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-07",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-07.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-07", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-06", amount=5},
			{type="fluid", name="uranium-hexafluoride-08", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-08",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-08.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-08", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-07", amount=5},
			{type="fluid", name="uranium-hexafluoride-09", amount=5}
		}
	},
	{
		type = "recipe",
		name = "uranium-hexafluoride-09",
		category = "chemistry",
		enabled = "false",
		energy_required = 1,
		subgroup = "uranium-fluids",
		order = "a[oil-processing]-a[basic-oil-processing]",
		icon = "__UraniumPower__/graphics/icons/uranium-hexafluoride-09.png",
		ingredients =
		{
			{type="fluid", name="uranium-hexafluoride-09", amount=10}
		},
		results =
		{
			{type="fluid", name="uranium-hexafluoride-08", amount=5},
			{type="fluid", name="uranium-hexafluoride-10", amount=5}
		}
	}
})