-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.resetrecipes()
	player.force.resettechnologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["sulfur-processing"].researched then
		force.recipes["R-new-heat-exchanger-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-02"].enabled = true
	end
end

if glob.LReactorAndChest ~= nil then
	for k,LReactorandChest in pairs(glob.LReactorAndChest) do
		if LReactorandChest[6] == nil then
			LReactorandChest[6] = true
		end
	end
end