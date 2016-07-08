data:extend(
{
  {
    type = "ammo",
    name = "uranium-bullet-magazine",
    icon = "__UraniumPower__/graphics/icons/uranium-bullet-magazine.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "bullet",
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "instant",
          source_effects =
          {
              type = "create-entity",
              entity_name = "explosion-gunshot"
          },
          target_effects =
          {
            {
              type = "create-entity",
              entity_name = "explosion-gunshot"
            },
            {
              type = "damage",
              damage = { amount = 24 , type = "physical"}
            },
			{
              type = "damage",
              damage = { amount = 12 , type = "impact"}
            }
          }
        }
      }
    },
    magazine_size = 10,
	subgroup = "uranium-ammo",
    order = "a",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "uranium-cannon-shell",
    icon = "__UraniumPower__/graphics/icons/uranium-cannon-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "uranium-cannon-projectile",
          starting_speed = 1,
          direction_deviation = 0,
          range_deviation = 0,
          max_range = 50
        }
      },
    },
    subgroup = "uranium-ammo",
    order = "b",
    stack_size = 100
  },
  {
    type = "ammo",
    name = "uranium-small-nuke-shell",
    icon = "__UraniumPower__/graphics/icons/uranium-small-nuke-shell.png",
    flags = {"goes-to-main-inventory"},
    ammo_type =
    {
      category = "cannon-shell",
      target_type = "direction",
      source_effects =
      {
        type = "create-entity",
        entity_name = "explosion-gunshot"
      },
      action =
      {
        type = "direct",
        action_delivery =
        {
          type = "projectile",
          projectile = "small-nuke-projectile",
          starting_speed = 0.25,
          direction_deviation = 0.1,
          range_deviation = 0.1,
          max_range = 100
        }
      },
    },
    subgroup = "uranium-ammo",
    order = "c",
    stack_size = 100
  }
})