data:extend(
{
	{
		type = "technology",
		name = "uranium-coal-processing",
		icon = "__UraniumPower__/graphics/technologies/coal-processing-tech.png",
		icon_size = 128,
		prerequisites = {"steel-processing"},
		unit =
		{
			count = 20,
			ingredients = {
				{"science-pack-1", 1}
			},
			time = 15
		},
		order = "d-c-a-a",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "coal-burning"
			},
			{
				type = "unlock-recipe",
				recipe = "coal-burner"
			}

		}
	},
	{
		type = "technology",
		name = "uranium-processing",
		icon = "__UraniumPower__/graphics/technologies/uranium-processing-tech.png",
		icon_size = 128,
		prerequisites = {"sulfur-processing"},
		unit =
		{
			count = 75,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "d-c-a-b",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "coal-ash-extraction"
			},
			{
				type = "unlock-recipe",
				recipe = "uraninite-slurry"
			},
			{
				type = "unlock-recipe",
				recipe = "yellowcake"
			},
			{
				type = "unlock-recipe",
				recipe = "fluorine-gas"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-02"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-03"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-04"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-05"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-06"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-07"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-08"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-09"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-standard-fuel-fabrication",
		icon = "__UraniumPower__/graphics/technologies/standard-fuel-processing-tech-icon.png",
		icon_size = 128,
		prerequisites = {"uranium-processing"},
		unit =
		{
			count = 75,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "d-c-b-a",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-01"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-04"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-04"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-05"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-05"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-06"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-06"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-07"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-07"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-08"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-08"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-09"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-09"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-10"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-10"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-advanced-fuel-fabrication-tier1",
		icon = "__UraniumPower__/graphics/technologies/fuel-fabrication-1.png",
		icon_size = 128,
		prerequisites = {"uranium-standard-fuel-reprocessing"},
		unit =
		{
			count = 150,
			ingredients = {
				{"science-pack-1", 3},
				{"science-pack-2", 2},
				{"science-pack-3", 1}
			},
			time = 90
		},
		order = "d-c-b-b",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-11"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-11"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-military-tier1",
		icon = "__UraniumPower__/graphics/technologies/uranium-bullet-tech-1.png",
		icon_size = 128,
		prerequisites = {"military-2", "uranium-processing"},
		unit =
		{
			count = 30,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "d-c-c-a",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "uranium-bullet-magazine"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-military-tier2",
		icon = "__UraniumPower__/graphics/technologies/uranium-bullet-tech-2.png",
		icon_size = 128,
		prerequisites = {"tanks", "uranium-military-tier1"},
		unit =
		{
			count = 60,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		order = "d-c-c-b",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "uranium-cannon-shell"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-military-tier3",
		icon = "__UraniumPower__/graphics/technologies/uranium-bullet-tech-3.png",
		icon_size = 128,
		prerequisites = {"explosive-rocketry", "uranium-military-tier2", "uranium-standard-fuel-reprocessing"},
		unit =
		{
			count = 150,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1},
				{"science-pack-3", 1}
			},
			time = 30
		},
		order = "d-c-c-c",
		effects = {
			{
				type = "unlock-recipe",
				recipe = "uranium-small-nuke-shell"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-advanced-fluid-management",
		icon = "__UraniumPower__/graphics/technologies/advanced-fluid-management-tech-icon.png",
		icon_size = 128,
		prerequisites = {"electric-engine", "uranium-processing"},
		unit =
		{
			count = 50,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 30
		},
		order = "d-c-d",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "fast-pump"
			},
			{
				type = "unlock-recipe",
				recipe = "pressure-pump"
			},
			{
				type = "unlock-recipe",
				recipe = "pressurised-water"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-reactor-tier1",
		icon = "__UraniumPower__/graphics/technologies/reactor-tech-icon.png",
		icon_size = 128,
		prerequisites = {"uranium-advanced-fluid-management", "uranium-standard-fuel-fabrication"},
		unit =
		{
			count = 100,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 60
		},
		order = "d-c-e-a",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "nuclear-fission-reactor-3-by-3"
			},
			{
				type = "unlock-recipe",
				recipe = "nuclear-fission-reactor-5-by-5"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-exchanger"
			},
			-- New Small Heat Exchanger
			{
				type = "unlock-recipe",
				recipe = "S-new-heat-exchanger-01"
			},
			{
				type = "unlock-recipe",
				recipe = "R-new-heat-exchanger-01"
			},
			-- New Big Heat Exchanger
			{
				type = "unlock-recipe",
				recipe = "S-new-heat-exchanger-02"
			},
			{
				type = "unlock-recipe",
				recipe = "R-new-heat-exchanger-02"
			},
			-- New Small Heat Exchanger Fluid Recipes
			{
				type = "unlock-recipe",
				recipe = "heat-exchange-water-water-01"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-exchange-pressurised-water-water-01"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-exchange-pressurised-water-pressurised-water-01"
			},
			-- New Big Heat Exchanger Fluid Recipes
			{
				type = "unlock-recipe",
				recipe = "heat-exchange-water-water-02"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-exchange-pressurised-water-water-02"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-exchange-pressurised-water-pressurised-water-02"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-advanced-chemistry",
		icon = "__UraniumPower__/graphics/technologies/reprocessing-prereq-tech-icon.png",
		icon_size = 128,
		prerequisites = {"uranium-reactor-tier1"},
		unit =
		{
			count = 150,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 1}
			},
			time = 60
		},
		order = "d-c-e-b",
		effects =
		{
			-- Fuel Recycling Prerequisites
			{
				type = "unlock-recipe",
				recipe = "atmospheric-distillation-n2-o2"
			},
			{
				type = "unlock-recipe",
				recipe = "hydrogen-synthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "ammonia-synthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "concentrate-nitric-acid-synthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "concentrate-phosphoric-acid-synthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "tbp-synthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "hydroxylamine-synthesis"
			},
			{
				type = "unlock-recipe",
				recipe = "diluting-nitric-acid"
			},
			{
				type = "unlock-recipe",
				recipe = "uranyl-nitrate-dissolution"
			},
			{
				type = "unlock-recipe",
				recipe = "pu-reductant-generation"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-standard-fuel-reprocessing",
		icon = "__UraniumPower__/graphics/technologies/fuel-reprocessing-tech-icon.png",
		icon_size = 128,

		prerequisites = {"uranium-advanced-chemistry"},
		unit =
		{
			count = 100,
			ingredients = {
				{"science-pack-1", 1},
				{"science-pack-2", 2}
			},
			time = 75
		},
		order = "d-c-e-c",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-04"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-05"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-06"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-07"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-08"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-09"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-10"
			},
			{
				type = "unlock-recipe",
				recipe = "spent-fuel-dissolution-11"
			},
			{
				type = "unlock-recipe",
				recipe = "recycle-fuel-cladding"
			},
			{
				type = "unlock-recipe",
				recipe = "fps-extraction"
			},
			{
				type = "unlock-recipe",
				recipe = "u-pu-patritioning"
			},
			{
				type = "unlock-recipe",
				recipe = "u-scrubbing"
			},
			{
				type = "unlock-recipe",
				recipe = "u-extraction"
			},
			{
				type = "unlock-recipe",
				recipe = "u-recovery"
			},
			{
				type = "unlock-recipe",
				recipe = "pu-oxidation"
			},
			{
				type = "unlock-recipe",
				recipe = "pu-scrubbing"
			},
			{
				type = "unlock-recipe",
				recipe = "pu-recovery"
			},
			{
				type = "unlock-recipe",
				recipe = "tbp-recovery"
			},
			{
				type = "unlock-recipe",
				recipe = "nitric-acid-recovery"
			},
			{
				type = "unlock-recipe",
				recipe = "nitric-acid-concentration"
			},
			{
				type = "unlock-recipe",
				recipe = "uranyl-nitrate-recovery"
			},
			{
				type = "unlock-recipe",
				recipe = "waste-vitrification"
			}
		}
	},
	{
		type = "technology",
		name = "uranium-reactor-tier1-advanced-heat-management",
		icon = "__UraniumPower__/graphics/technologies/heat-management-tech-icon.png",
		icon_size = 128,
		prerequisites = {"advanced-electronics-2", "uranium-reactor-tier1"},
		unit =
		{
			count = 75,
			ingredients = {
				{"science-pack-1", 2},
				{"science-pack-2", 4},
				{"science-pack-3", 1}
			},
			time = 60
		},
		order = "d-c-f",
		effects =
		{
			-- Reactor recirculation pump
			{
				type = "unlock-recipe",
				recipe = "R-reactor-circ-pump-01"
			},
			-- Steam Generator Mk I
			{
				type = "unlock-recipe",
				recipe = "reactor-steam-generator-01"
			},
			-- 30 MW turbine generator/cooling tower complex
			{
				type = "unlock-recipe",
				recipe = "reactor-turbine-generator-01a"
			},
			{
				type = "unlock-recipe",
				recipe = "reactor-turbine-generator-01b"
			}
		}
	}
})
