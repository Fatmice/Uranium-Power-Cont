-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.resetrecipes()
	player.force.resettechnologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["sulfur-processing"].researched then
		force.recipes["S-new-heat-exchanger-01"].enabled = true
		force.recipes["R-new-heat-exchanger-01"].enabled = true
		force.recipes["S-new-heat-exchanger-02"].enabled = true
		force.recipes["heat-exchange-water-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-water-01"].enabled = true
		force.recipes["heat-exchange-water-water-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-water-02"].enabled = true
	end
end

-- Initialize a new row in old reactors
if glob.LReactorAndChest ~= nil then
	for k,LReactorandChest in pairs(glob.LReactorAndChest) do
		if LReactorandChest[5] == nil then
			LReactorandChest[5] = 0
		end
	end
end

-- Heat Exchanger glob table migration
if glob.oldheatExchanger == nil then
	glob.oldheatExchanger = {}
end
if glob.LHeatExchanger ~= nil then
	for k,LHeatExchanger in ipairs(glob.LHeatExchanger) do
		table.insert(glob.oldheatExchanger, LHeatExchanger)
		table.remove(glob.LHeatExchanger, k)
	end
end