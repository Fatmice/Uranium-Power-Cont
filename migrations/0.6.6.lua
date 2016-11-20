-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["steel-processing"].researched then
		force.recipes["coal-burning"].enabled = true
		force.recipes["coal-burner"].enabled = true
	end
	if force.technologies["uranium-processing"].researched then
		force.recipes["coal-ash-extraction"].enabled = true
		force.recipes["uraninite-slurry"].enabled = true
		force.recipes["yellowcake"].enabled = true
		force.recipes["fluorine-gas"].enabled = true
		force.recipes["uranium-hexafluoride"].enabled = true
		force.recipes["uranium-hexafluoride-02"].enabled = true
		force.recipes["uranium-hexafluoride-03"].enabled = true
		force.recipes["uranium-hexafluoride-04"].enabled = true
		force.recipes["uranium-hexafluoride-05"].enabled = true
		force.recipes["uranium-hexafluoride-06"].enabled = true
		force.recipes["uranium-hexafluoride-07"].enabled = true
		force.recipes["uranium-hexafluoride-08"].enabled = true
		force.recipes["uranium-hexafluoride-09"].enabled = true
	end
	if force.technologies["uranium-standard-fuel-fabrication"].researched then
		force.recipes["uranium-pellet-01"].enabled = true
		force.recipes["uranium-pellet-04"].enabled = true
		force.recipes["fuel-assembly-04"].enabled = true
		force.recipes["uranium-pellet-05"].enabled = true
		force.recipes["fuel-assembly-05"].enabled = true
		force.recipes["uranium-pellet-06"].enabled = true
		force.recipes["fuel-assembly-06"].enabled = true
		force.recipes["uranium-pellet-07"].enabled = true
		force.recipes["fuel-assembly-07"].enabled = true
		force.recipes["uranium-pellet-08"].enabled = true
		force.recipes["fuel-assembly-08"].enabled = true
		force.recipes["uranium-pellet-09"].enabled = true
		force.recipes["fuel-assembly-09"].enabled = true
		force.recipes["uranium-pellet-10"].enabled = true
		force.recipes["fuel-assembly-10"].enabled = true
	end
	if force.technologies["uranium-advanced-fluid-management"].researched then
		force.recipes["fast-pump"].enabled = true
		force.recipes["pressure-pump"].enabled = true
		force.recipes["pressurised-water"].enabled = true
	end
	if force.technologies["uranium-reactor-tier1"].researched then
		force.recipes["nuclear-fission-reactor-3-by-3"].enabled = true
		force.recipes["nuclear-fission-reactor-5-by-5"].enabled = true
		force.recipes["heat-exchanger"].enabled = true
		force.recipes["S-new-heat-exchanger-01"].enabled = true
		force.recipes["R-new-heat-exchanger-01"].enabled = true
		force.recipes["S-new-heat-exchanger-02"].enabled = true
		force.recipes["R-new-heat-exchanger-02"].enabled = true
		force.recipes["heat-exchange-water-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-01"].enabled = true
		force.recipes["heat-exchange-water-water-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-water-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-02"].enabled = true
	end
	if force.technologies["uranium-reactor-tier1-advanced-heat-management"].researched then
		force.recipes["R-reactor-circ-pump-01"].enabled = true
		force.recipes["reactor-steam-generator-01"].enabled = true
		force.recipes["reactor-turbine-generator-01a"].enabled = true
		force.recipes["reactor-turbine-generator-01b"].enabled = true
	end
end