-- The prolonged ore processings and water electrolysis from Angel's mods have unintended side-effects of producing prodigious amount of slag.
-- In turn, this produces an absurd amounts of uraninite + fluorite through the so call slag -> slag_slurry -> mineral_slurry -> uraninite + fluorite ore conversion over time.
-- The new ratio is effectively 200 slag to 1 uraninite + 1 fluorite.
-- The 2+2+2 -> uraninite/fluorite exchange is also too good.  Changed to 6 -> 1
local slag_tweak = true
local ore_exchange_tweak = true
--log( serpent.block( data.raw.recipe, {comment = false, numformat = '%1.8g' } ))
if data.raw.recipe["slag-processing-up"] and slag_tweak then
	log("slag-processing-up is valid")
	data.raw.recipe["slag-processing-up"].results = {
		{type = "item", name = "uraninite", amount_min = 1, amount_max = 5, probability = 0.05},
		{type = "item", name = "fluorite", amount_min = 1, amount_max = 1, probability = 0.05}
	}
else 
	log("slag-processing-up is invalid")
end
if data.raw.recipe["angelsore-crystal-mix-up1-processing"] and data.raw.recipe["angelsore-crystal-mix-up2-processing"] and ore_exchange_tweak then
	log("angelsore-crystal-mix-up1-processing and angelsore-crystal-mix-up2-processing are valid")
	data.raw.recipe["angelsore-crystal-mix-up1-processing"].results = {
		{type = "item", name = "uraninite", amount_min = 1, amount_max = 1, probability = 0.46}
	}
	data.raw.recipe["angelsore-crystal-mix-up2-processing"].results = {
		{type = "item", name = "fluorite", amount_min = 1, amount_max = 1, probability = 0.1}
	}
else
	log("angelsore-crystal-mix-up1-processing and angelsore-crystal-mix-up2-processing are invalid")
end