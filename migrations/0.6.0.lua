-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
end

-- Enabled new building and recipes
for index, force in pairs(game.forces) do
	if force.technologies["uranium-processing"].researched then
		force.recipes["R-reactor-circ-pump-01"].enabled = true
		force.recipes["reactor-steam-generator-01"].enabled = true
		force.recipes["reactor-turbine-generator-01a"].enabled = true
		force.recipes["reactor-turbine-generator-01b"].enabled = true
	end
end

if global.LReactorAndChest ~= nil then
	for k,LReactorandChest in pairs(global.LReactorAndChest) do
		if LReactorandChest[6] == nil then
			LReactorandChest[6] = true
		end
	end
end