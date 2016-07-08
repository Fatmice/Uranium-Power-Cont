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
      {"steel-plate", 20},
      {"uranium-pellet-01", 50},
      {"explosives", 20},
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
      {"steel-plate", 30},
      {"uranium-pellet-01", 100},
      {"explosives", 40},
	  {"alien-artifact", 20},
	  {"processing-unit",10}
    },
    result = "uranium-small-nuke-shell"
  }
})