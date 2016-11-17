data:extend({
  {
    type = "container",
	name = "nuclear-fission-reactor-chest-15",
    icon = "__UraniumPower__/graphics/icons/reactor-port-icon.png",
    flags = {"placeable-neutral", "placeable-player", "not-blueprintable", "not-deconstructable"},
    max_health = 200,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    minable = {hardness = 0.2, mining_time = 1},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      filename = "__UraniumPower__/graphics/entity/reactor-port/prototype-reactor-port.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
    },
    inventory_size = 15
  },
  {
    type = "container",
	name = "nuclear-fission-reactor-chest-25",
    icon = "__UraniumPower__/graphics/icons/reactor-port-icon.png",
    flags = {"placeable-neutral", "placeable-player", "not-blueprintable", "not-deconstructable"},
    max_health = 200,
    corpse = "small-remnants",
    open_sound = { filename = "__base__/sound/metallic-chest-open.ogg", volume=0.65 },
    close_sound = { filename = "__base__/sound/metallic-chest-close.ogg", volume = 0.7 },
    minable = {hardness = 0.2, mining_time = 1},
    resistances =
    {
      {
        type = "fire",
        percent = 90
      }
    },
    collision_box = {{-0.35, -0.35}, {0.35, 0.35}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    picture =
    {
      filename = "__UraniumPower__/graphics/entity/reactor-port/prototype-reactor-port.png",
      priority = "extra-high",
      width = 48,
      height = 34,
      shift = {0.2, 0}
    },
    inventory_size = 25
  }
})