data:extend({
  {
    type = "projectile",
    name = "uranium-cannon-projectile",
    flags = {"not-on-map"},
    collision_box = {{-0.05, -1.1}, {0.05, 1.1}},
    acceleration = 0,
    direction_only = true,
    piercing_damage = 450,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "uranium-explosion"
          },
          {
            type = "damage",
            damage = { amount = 350 , type = "physical"}
          },
		  {
            type = "damage",
            damage = { amount = 250 , type = "impact"}
          },
          {
            type = "damage",
            damage = { amount = 100 , type = "explosion"}
          }
        }
      }
    },
    animation =
    {
      filename = "__base__/graphics/entity/bullet/bullet.png",
      frame_count = 1,
      width = 3,
      height = 50,
      priority = "high"
    },
  },
  {
    type = "projectile",
    name = "small-nuke-projectile",
    flags = {"not-on-map"},
    acceleration = 0.005,
    action =
    {
      type = "direct",
      action_delivery =
      {
        type = "instant",
        target_effects =
        {
          {
            type = "create-entity",
            entity_name = "explosion"
          },
          {
            type = "nested-result",
            action =
            {
              type = "area",
              perimeter = 25,
              action_delivery =
              {
                type = "instant",
                target_effects =
                {
				  {
                    type = "damage",
                    damage = {amount = 1000, type = "physical"}
                  },
				  {
                    type = "damage",
                    damage = {amount = 600, type = "fire"}
                  },
				  {
                    type = "damage",
                    damage = {amount = 300, type = "acid"}
                  },
				  {
                    type = "damage",
                    damage = {amount = 600, type = "impact"}
                  },
                  {
                    type = "damage",
                    damage = {amount = 2000, type = "explosion"}
                  },
                  {
                    type = "create-entity",
                    entity_name = "explosion"
                  }
                }
              }
            },
          }
        }
      }
    },
    light = {intensity = 0.5, size = 4},
    animation =
    {
      filename = "__base__/graphics/entity/rocket/rocket.png",
      frame_count = 1,
      width = 10,
      height = 30,
      priority = "high"
    },
    shadow =
    {
      filename = "__base__/graphics/entity/rocket/rocket-shadow.png",
      frame_count = 1,
      width = 10,
      height = 30,
      priority = "high"
    },
    smoke =
    {
      {
        name = "smoke-fast",
        deviation = {0.15, 0.15},
        frequency = 1,
        position = {0, 0},
        slow_down_factor = 1,
        starting_frame = 3,
        starting_frame_deviation = 5,
        starting_frame_speed = 0,
        starting_frame_speed_deviation = 5
      }
    }
  },
  {
    type = "explosion",
    name = "uranium-explosion",
    flags = {"not-on-map"},
    animations =
    {
      {
        filename = "__UraniumPower__/graphics/entity/explosions/uranium-explosion-1.png",
        priority = "extra-high",
        width = 256,
        height = 256,
        frame_count = 64,
		line_length = 8,
		scale = 3,
        animation_speed = 0.5
      },
    },
    light = {intensity = 1, size = 40},
    smoke = "smoke-fast",
    smoke_count = 2,
    smoke_slow_down_factor = 1,
    sound =
    {
      {
        filename = "__base__/sound/fight/small-explosion-1.ogg",
        volume = 0.75
      },
      {
        filename = "__base__/sound/fight/small-explosion-2.ogg",
        volume = 0.75
      }
    }
  },
})