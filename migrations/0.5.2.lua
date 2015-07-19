-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
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
if global.LReactorAndChest ~= nil then
	for k,LReactorandChest in pairs(global.LReactorAndChest) do
		if LReactorandChest[5] == nil then
			LReactorandChest[5] = 0
		end
	end
end

-- Heat Exchanger global table migration
if global.oldheatExchanger == nil then
	global.oldheatExchanger = {}
end
if global.LHeatExchanger ~= nil then
	for k,LHeatExchanger in ipairs(global.LHeatExchanger) do
		table.insert(global.oldheatExchanger, LHeatExchanger)
		table.remove(global.LHeatExchanger, k)
	end
end