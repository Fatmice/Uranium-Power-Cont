-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["uranium-processing"].researched then
		force.recipes["heat-exchange-water-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-water-01"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-01"].enabled = true
		force.recipes["heat-exchange-water-water-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-water-02"].enabled = true
		force.recipes["heat-exchange-pressurised-water-pressurised-water-02"].enabled = true
		force.recipes["uranium-small-nuke-shell"].enabled = true
	end
end