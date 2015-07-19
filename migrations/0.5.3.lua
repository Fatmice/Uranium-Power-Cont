-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["sulfur-processing"].researched then
		force.recipes["R-new-heat-exchanger-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-02"].enabled = true
	end
end