-- Compat for Bob's.  This replaces all of UP's oxygen, nitrogen, and hydrogen requiring or proving recipes to use Bob's equivalent gasses.
-- Technological locks are still in place so for people playing with Bob's they must still pass over his hurdles, if required, to get at the gasses as well as UP's.
-- Compat for Angel's is implicit since his mod provides a doodad that can covert Bob's gasses into Angel's.
if bobmods.plates then

	data.raw.recipe["atmospheric-distillation-n2-o2"].results = {
		{type="fluid", name="nitrogen", amount=20},
		{type="fluid", name="oxygen", amount=4}
	}
	data.raw.recipe["hydrogen-synthesis"].results = {
		{type="fluid", name="hydrogen", amount=40}
	}
	data.raw.recipe["ammonia-synthesis"].ingredients = {
		{type="fluid", name="nitrogen", amount=10},		
		{type="fluid", name="hydrogen", amount=30},
	}
	data.raw.recipe["concentrate-nitric-acid-synthesis"].ingredients = {
		{type="fluid", name="ammonia-gas", amount=40},
		{type="fluid", name="oxygen", amount=80}			
	}
	data.raw.recipe["hydroxylamine-synthesis"].ingredients = {
		{type="fluid", name="hydrogen", amount=30},		
		{type="fluid", name="concentrate-nitric-acid", amount=10}		
	}
end