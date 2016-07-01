data:extend(
{
	{
		type = "technology",
		name = "uranium-processing",
		icon = "__UraniumPower__/graphics/technology/uranium-processing.png",
		prerequisites = {"sulfur-processing"},
		unit =
		{
			count = 75,
			ingredients = {
			{"science-pack-1", 1},
			{"science-pack-2", 1},
			},
			time = 30
		},
		order = "d-c",
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride"
			},
			{
				type = "unlock-recipe",
				recipe = "pressure-pump"
			},
			{
				type = "unlock-recipe",
				recipe = "fast-pump"
			},
			{
				type = "unlock-recipe",
				recipe = "heat-exchanger"
			},
			{
				type = "unlock-recipe",
				recipe = "pressurised-water"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-bullet-magazine"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-cannon-shell"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-small-nuke-shell"
			},
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
--			{
--				type = "unlock-recipe",
--				recipe = "fuel-assembly-01"
--			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-01"
			},
--			{
--				type = "unlock-recipe",
--				recipe = "uranium-hexafluoride-01"
--			},
--			{
--				type = "unlock-recipe",
--				recipe = "fuel-assembly-02"
--			},
--			{
--				type = "unlock-recipe",
--				recipe = "uranium-pellet-02"
--			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-02"
			},
--			{
--				type = "unlock-recipe",
--				recipe = "fuel-assembly-03"
--			},
--			{
--				type = "unlock-recipe",
--				recipe = "uranium-pellet-03"
--			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-03"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-04"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-04"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-04"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-05"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-05"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-05"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-06"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-06"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-06"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-07"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-07"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-07"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-08"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-08"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-08"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-09"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-09"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-hexafluoride-09"
			},
			{
				type = "unlock-recipe",
				recipe = "fuel-assembly-10"
			},
			{
				type = "unlock-recipe",
				recipe = "uranium-pellet-10"
			},
--			{
--				type = "unlock-recipe",
--				recipe = "uranium-hexafluoride-10"
--			}
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
			},
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
			-- 30 MW turbine generator/cooling tower complexe
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
