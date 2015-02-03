data:extend({
  {
    type = "pump",
    name = "fast-pump",
    icon = "__base__/graphics/icons/small-pump.png",
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 1, result = "fast-pump"},
    max_health = 80,
    fast_replaceable_group = "pipe",
    corpse = "small-remnants",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fluid_box =
    {
      base_area = 1,
      pipe_covers = pipecoverspictures(),
      pipe_connections =
      {
        { position = {0, -1}, type="output" },
        { position = {0, 1}, type="input" },
      },
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0.01 / 2.5
    },
    energy_usage = "150kW",
    pumping_speed = 3,
    animations =
    {
      north =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-up.png",
        width = 46,
        height = 56,
        frame_count = 8,
        shift = {0.09375, 0.03125},
        animation_speed = 1
      },
      east =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-right.png",
        width = 51,
        height = 56,
        frame_count = 8,
        shift = {0.265625, -0.21875},
        animation_speed = 1
      },
      south =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-down.png",
        width = 61,
        height = 58,
        frame_count = 8,
        shift = {0.421875, -0.125},
        animation_speed = 1
      },
      west =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-left.png",
        width = 56,
        height = 44,
        frame_count = 8,
        shift = {0.3125, 0.0625},
        animation_speed = 1
      }
    }
  },
  {
    type = "assembling-machine",
    name = "pressure-pump",
    icon = "__base__/graphics/icons/small-pump.png",
    flags = {"placeable-neutral", "placeable-player", "player-creation"},
    minable = {hardness = 0.2, mining_time = 0.5, result = "pressure-pump"},
    max_health = 250,
    corpse = "small-remnants",
    dying_explosion = "huge-explosion",
    resistances =
    {
      {
        type = "fire",
        percent = 70
      }
    },
    fluid_boxes =
    {
      {
        production_type = "input",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -1} }}
      },
      {
        production_type = "output",
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = 1,
        pipe_connections = {{ type="output", position = {0, 1} }}
      }
    },
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    fast_replaceable_group = "pipe",
    animation =
    {
      north =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-up.png",
        width = 46,
        height = 56,
        frame_count = 8,
        shift = {0.09375, 0.03125},
        animation_speed = 0.2
      },
      east =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-right.png",
        width = 51,
        height = 56,
        frame_count = 8,
        shift = {0.265625, -0.21875},
        animation_speed = 0.2
      },
      south =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-down.png",
        width = 61,
        height = 58,
        frame_count = 8,
        shift = {0.421875, -0.125},
        animation_speed = 0.2
      },
      west =
      {
        filename = "__base__/graphics/entity/small-pump/small-pump-left.png",
        width = 56,
        height = 44,
        frame_count = 8,
        shift = {0.3125, 0.0625},
        animation_speed = 0.2
      }
    },
    open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
    close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
    working_sound =
    {
      sound = {
        {
          filename = "__base__/sound/assembling-machine-t2-1.ogg",
          volume = 0.8
        },
        {
          filename = "__base__/sound/assembling-machine-t2-2.ogg",
          volume = 0.8
        },
      },
      idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
      apparent_volume = 1.5,
    },
    crafting_categories = {"pressure-pump"},
    crafting_speed = 1,
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      emissions = 0
    },
    energy_usage = "150kW",
    ingredient_count = 1,
--    module_slots = 2,
--    allowed_effects = {"consumption", "speed", "productivity", "pollution"}
  },
    {
    type = "wall",
    name = "heat-exchanger",
    icon = "__base__/graphics/icons/stone-wall.png",
    flags = {"placeable-neutral", "player-creation"},
    collision_box = {{-0.29, -0.29}, {0.29, 0.29}},
    selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
    minable = {mining_time = 1, result = "heat-exchanger"},
    max_health = 350,
    repair_speed_modifier = 2,
    corpse = "wall-remnants",
    repair_sound = { filename = "__base__/sound/manual-repair-simple.ogg" },
    mined_sound = { filename = "__base__/sound/deconstruct-bricks.ogg" },
    -- this kind of code can be used for having walls mirror the effect
    -- there can be multiple reaction items
    --attack_reaction =
    --{
      --{
        ---- how far the mirroring works
        --range = 2,
        ---- what kind of damage triggers the mirroring
        ---- if not present then anything triggers the mirroring
        --damage_type = "physical",
        ---- caused damage will be multiplied by this and added to the subsequent damages
        --reaction_modifier = 0.1,
        --action =
        --{
          --type = "direct",
          --action_delivery =
          --{
            --type = "instant",
            --target_effects =
            --{
              --type = "damage",
              ---- always use at least 0.1 damage
              --damage = {amount = 0.1, type = "physical"}
            --}
          --}
        --},
      --}
    --},
    resistances =
    {
      {
        type = "physical",
        decrease = 3,
        percent = 20
      },
      {
        type = "impact",
        decrease = 45,
        percent = 60
      },
      {
        type = "explosion",
        decrease = 10,
        percent = 30
      },
      {
        type = "fire",
        percent = 100
      },
      {
        type = "laser",
        percent = 70
      }
    },

    --__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png
    pictures =
    {
      single =
      {
        layers = 
        {
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0, -0.15625}
          },
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.359375, 0.5},
            draw_as_shadow = true
          }
        }
      },
      straight_vertical =
      {
        {
          layers =
          {
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0, -0.15625}
            },
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0, -0.15625}
            },
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0, -0.15625}
            },
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0.390625, 0.625},
              draw_as_shadow = true
            }
          }
        }
      },
      straight_horizontal =
      {
        {
          layers =
          {
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0, -0.15625}
            },
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0, -0.15625}
            },
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        },
        {
          layers =
          {
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0, -0.15625}
            },
            {
              filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
              priority = "extra-high",
              width = 64,
              height = 64,
              --shift = {0.421875, 0.5},
              draw_as_shadow = true
            }
          }
        }
      },
      corner_right_down =
      {
        layers =
        {
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.078125, -0.15625}
          },
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.484375, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      corner_left_down =
      {
        layers =
        {
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {-0.078125, -0.15625}
          },
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.328125, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      t_up =
      {
        layers =
        {
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0, -0.15625}
          },
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.546875, 0.640625},
            draw_as_shadow = true
          }
        }
      },
      ending_right =
      {
        layers =
        {
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.078125, -0.15625}
          },
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.484375, 0.5},
            draw_as_shadow = true
          }
        }
      },
      ending_left =
      {
        layers =
        {
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {-0.078125, -0.15625}
          },
          {
            filename = "__UraniumPower__/graphics/entity/heat-exchanger/heat-exchanger.png",
            priority = "extra-high",
            width = 64,
            height = 64,
            --shift = {0.328125, 0.5},
            draw_as_shadow = true
          }
        }
      }
    }
  }
})