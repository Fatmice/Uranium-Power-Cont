data:extend(
{
  {
    type = "recipe",
    name = "uranium-bullet-magazine",
    enabled = "false",
    energy_required = 3,
	category = "advanced-crafting",
    ingredients =
    {
      {"uranium-pellet-01", 5},
      {"steel-plate", 1}
    },
    result = "uranium-bullet-magazine"
  },
  {
    type = "recipe",
    name = "uranium-cannon-shell",
    enabled = "false",
    energy_required = 8,
	category = "advanced-crafting",
    ingredients =
    {
      {"steel-plate", 4},
      {"uranium-pellet-01", 5},
      {"explosives", 1},
    },
    result = "uranium-cannon-shell"
  },
  {
    type = "recipe",
    name = "uranium-small-nuke-shell",
    enabled = "false",
    energy_required = 24,
	category = "advanced-crafting",
    ingredients =
    {
      {"steel-plate", 6},
      {"uranium-pellet-01", 20},
      {"explosives", 20},
	  {"alien-artifact", 20},
	  {"processing-unit",5}
    },
    result = "uranium-small-nuke-shell"
  }
})