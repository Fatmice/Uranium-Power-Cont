-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["uranium-processing"].researched then
		force.recipes["uranium-small-nuke-shell"].enabled = true
	end
end