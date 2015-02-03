data:extend(
{
  {
    type = "recipe",
    name = "uranium-bullet-magazine",
    enabled = "false",
    energy_required = 3,
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
    ingredients =
    {
      {"steel-plate", 4},
      {"uranium-pellet-01", 5},
      {"explosives", 1},
    },
    result = "uranium-cannon-shell"
  }
})