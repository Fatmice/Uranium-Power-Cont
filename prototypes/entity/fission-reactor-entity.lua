data:extend({
  {
    type = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "nuclear-fission-reactor-3-by-3"},
    max_health = 500,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    energy_consumption = "72MW",
    burner =
    {
      effectivity = 1,
      fuel_inventory_size = 0,
      emissions = 0
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/boiler.ogg",
        volume = 0.8
      },
      max_sounds_per_type = 3
    },
    structure =
    {
      left =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-left.png",
        priority = "extra-high",
        width = 180,
        height = 160,
        shift = {0.72, -0.308}
      },
      down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-down.png",
        priority = "extra-high",
        width = 180,
        height = 160, 
        shift = {0.72, -0.308}
      },
      left_down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-left-down.png",
        priority = "extra-high",
        width = 180,
        height = 160, 
        shift = {0.72, -0.308}
      },
      right_down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-right-down.png",
        priority = "extra-high",
        width = 180,
        height = 160,
        shift = {0.72, -0.308}
      },
      left_up =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-left-up.png",
        priority = "extra-high",
        width = 180,
        height = 160, 
        shift = {0.72, -0.308}
      },
      right_up =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-right-up.png",
        priority = "extra-high",
        width = 180,
        height = 160, 
        shift = {0.72, -0.308}
      },
      t_down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-t-down.png",
        priority = "extra-high",
        width = 180,
        height = 160, 
        shift = {0.72, -0.308}
      },
      t_up =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/3-by-3-left.png",
        priority = "extra-high",
        width = 180,
        height = 160, 
        shift = {0.72, -0.308}
      }
    },
    fire =
    {
    },
    burning_cooldown = 20,
    pictures = pipepictures(),
    name = "nuclear-fission-reactor-3-by-3",
    collision_box = {{-1.30,-1.30},{1.30,1.30}},
    selection_box = {{-1.50,-1.50},{1.50,1.50}},
    fluid_box =
    {
      base_area = 300,
      pipe_connections =
      {
        {position= {0, 2}},
        {position= {0, -2}},
        {position= {2, 0}},
        {position= {-2, 0}}
      }
    }
  },
  {
    type = "boiler",
    icon = "__base__/graphics/icons/boiler.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "nuclear-fission-reactor-5-by-5"},
    max_health = 500,
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 80
      }
    },
    energy_consumption = "144MW",
    burner =
    {
      effectivity = 1,
      fuel_inventory_size = 0,
      emissions = 0
    },
    working_sound =
    {
      sound =
      {
        filename = "__base__/sound/boiler.ogg",
        volume = 0.8
      },
      max_sounds_per_type = 3
    },
    structure =
    {
      left =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-left.png",
        priority = "extra-high",
        width = 400,
        height = 350,
        shift = {0.05, -1.18}
      },
      down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-down.png",
        priority = "extra-high",
        width = 400,
        height = 350, 
        shift = {0.05, -1.18}
      },
      left_down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-left-down.png",
        priority = "extra-high",
        width = 400,
        height = 350, 
        shift = {0.05, -1.18}
      },
      right_down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-right-down.png",
        priority = "extra-high",
        width = 400,
        height = 350,
        shift = {0.05, -1.18}
      },
      left_up =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-left-up.png",
        priority = "extra-high",
        width = 400,
        height = 350, 
        shift = {0.05, -1.18}
      },
      right_up =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-right-up.png",
        priority = "extra-high",
        width = 400,
        height = 350, 
        shift = {0.05, -1.18}
      },
      t_down =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-t-down.png",
        priority = "extra-high",
        width = 400,
        height = 350, 
        shift = {0.05, -1.18}
      },
      t_up =
      {
        filename = "__UraniumPower__/graphics/entity/nuclear-fission-reactor/5-by-5-left.png",
        priority = "extra-high",
        width = 400,
        height = 350, 
        shift = {0.05, -1.18}
      }
    },
    fire =
    {
    },
    burning_cooldown = 20,
    pictures = pipepictures(),
    name = "nuclear-fission-reactor-5-by-5",
    collision_box = {{-2.30,-2.30},{2.30,2.30}},
    selection_box = {{-2.50,-2.50},{2.50,2.50}},
    fluid_box =
    {
      base_area = 50,
      pipe_connections =
      {
        {position= {0, 3}},
        {position= {0, -3}},
        {position= {3, 0}},
        {position= {-3, 0}},
      }
    }
  },
})