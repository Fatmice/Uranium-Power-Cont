-- Reset technologies and recipes
for i, player in ipairs(game.players) do
	player.force.reset_recipes()
	player.force.reset_technologies()
end

-- Initialize a new row in old reactors
if global.LReactorAndChest ~= nil then
	for k,LReactorandChest in pairs(global.LReactorAndChest) do
		if LReactorandChest[5] == nil then
			LReactorandChest[5] = 0
		end
	end
end