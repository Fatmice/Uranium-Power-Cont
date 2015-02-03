data:extend({
  {
    type = "recipe",
    name = "pressure-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"electric-engine-unit", 1},
      {"steel-plate", 1},
      {"pipe", 1}
    },
    result= "pressure-pump"
  },
  {
    type = "recipe",
    name = "fast-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"electric-engine-unit", 3},
      {"steel-plate", 3},
      {"pipe", 1}
    },
    result= "fast-pump"
  },
  {
    type = "recipe",
    name = "heat-exchanger",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {
      {"copper-plate", 10},
      {"steel-plate", 2}
    },
    result= "heat-exchanger"
  },
  {
    type = "recipe",
    name = "pressurised-water",
    category = "pressure-pump",
    energy_required = 2,
    enabled = "false",
    ingredients =
    {     
      {type="fluid", name="water", amount=10} 
    },
    results=
    {
      {type="fluid", name="pressurised-water", amount=10},
    }
  }
})