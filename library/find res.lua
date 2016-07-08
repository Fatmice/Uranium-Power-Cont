0.13.x
/c local chunks = game.surfaces[1].get_chunks();
local res={["fluorite"]={count=0,piles=0},["uraninite"]={count=0,piles=0}};
local chunkcount = 0
for chunk in chunks do 
	local resource=game.surfaces[1].find_entities_filtered{area={{chunk.x*32, chunk.y*32}, {(chunk.x+1)*32, (chunk.y+1)*32}},type="resource"};
	for i,v in pairs(resource) do 
		if res[v.name] then
			res[v.name].count=res[v.name].count+v.amount;
			res[v.name].piles=res[v.name].piles+1;
		end;
	end;
	chunkcount = chunkcount + 1
end;
for r,_ in pairs(res) do
	game.players[1].print(r..", Count = "..res[r].count.." in "..res[r].piles.." piles found in "..chunkcount.." chunks.  Density: per chunk "..(res[r].count/chunkcount)..", per tile "..(res[r].count/(chunkcount*32*32)))
end;

0.12.x
/c local chunks = game.surfaces["nauvis"].get_chunks();
local res={["fluorite"]={count=0,piles=0},["uraninite"]={count=0,piles=0}};
local chunkcount = 0
for chunk in chunks do 
	local resource=game.surfaces["nauvis"].find_entities_filtered{area={{chunk.x*32, chunk.y*32}, {(chunk.x+1)*32, (chunk.y+1)*32}},type="resource"};
	for i,v in pairs(resource) do 
		if res[v.name] then
			res[v.name].count=res[v.name].count+v.amount;
			res[v.name].piles=res[v.name].piles+1;
		end;
	end;
	chunkcount = chunkcount + 1
end;
for r,_ in pairs(res) do
	game.players[1].print(r..", Count = "..res[r].count.." in "..res[r].piles.." piles found in "..chunkcount.." chunks.  Density: per chunk "..(res[r].count/chunkcount)..", per tile "..(res[r].count/(chunkcount*32*32)))
end;