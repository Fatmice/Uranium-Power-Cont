-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.resetrecipes()
	player.force.resettechnologies()
end

-- Initialize a new row in old reactors
if glob.LReactorAndChest ~= nil then
	for k,LReactorandChest in pairs(glob.LReactorAndChest) do
		if LReactorandChest[5] == nil then
			LReactorandChest[5] = 0
		end
	end
end