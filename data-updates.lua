if bobmods and bobmods.plates then
-- replace all UP-oxygen,nitrogen, and hydrogen with bob's
bobmods.lib.recipe.replace_ingredient_in_all("oxygen-gas", "oxygen")
bobmods.lib.recipe.replace_ingredient_in_all("nitrogen-gas", "nitrogen")
bobmods.lib.recipe.replace_ingredient_in_all("hydrogen-gas", "nitrogen")


	if data.raw.recipe["oxygen"] then --make sure oxygen exists before changing tech
	--remove up-oxygen unlocks
		bobmods.lib.tech.remove_recipe_unlock("uranium-advanced-chemistry", "oxygen-gas")

	--optionally add in bobs oxygen, not needed since bobs fluids are unlocked early enough
		bobmods.lib.tech.add_recipe_unlock("uranium-advanced-chemistry", "oxygen-gas")
	end
	if data.raw.recipe["oxygen"] then --make sure oxygen exists before changing tech
	--remove up-oxygen unlocks
		bobmods.lib.tech.remove_recipe_unlock("uranium-advanced-chemistry", "nitrogen-gas")

	--optionally add in bobs oxygen, not needed since bobs fluids are unlocked early enough
		bobmods.lib.tech.add_recipe_unlock("uranium-advanced-chemistry", "nitrogen-gas")
	end
	if data.raw.recipe["oxygen"] then --make sure oxygen exists before changing tech
	--remove up-oxygen unlocks
		bobmods.lib.tech.remove_recipe_unlock("uranium-advanced-chemistry", "hydrogen-gas")

	--optionally add in bobs oxygen, not needed since bobs fluids are unlocked early enough
		bobmods.lib.tech.add_recipe_unlock("uranium-advanced-chemistry", "hydrogen-gas")
	end
end