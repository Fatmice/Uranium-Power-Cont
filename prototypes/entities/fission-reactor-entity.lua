data:extend({
	{
		type = "boiler",
		name = "nuclear-fission-reactor-3-by-3",
		icon = "__base__/graphics/icons/boiler.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "not-blueprintable", "not-deconstructable"},
		minable = {hardness = 0.2, mining_time = 0.5, result = "nuclear-fission-reactor-3-by-3"},
		max_health = 500,
		corpse = "small-remnants",
		mode = "heat-water-inside",
		resistances =
		{
			{
				type = "fire",
				percent = 80
			}
		},
		energy_consumption = "240MW",
		energy_source =
		{
		  type = "burner",
		  fuel_category = "chemical",
		  effectivity = 0.5,
		  fuel_inventory_size = 0,
		  emissions = 0,
		  smoke =
		  {
		  }
		},
		output_fluid_box =
		{
		  base_area = 0,
		  height = 0,
		  base_level = 0,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
		  },
		},
		fluid_input =
		{
		  name = "water",
		  amount = 0.0
		},
		fluid_output =
		{
		  name = "steam",
		  amount = 0.0
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
		  north =
		  { 
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-down.png",
				priority = "extra-high",
				width = 180,
				height = 160,
				shift = {0.72, -0.308},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-down.png",
				  priority = "extra-high",
				  width = 180,
				  height = 160,
				  shift = {0.72, -0.308},
				  scale = 1
				}
			  },
			}
		  },
		  east =
		  {
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-right-down.png",
				priority = "extra-high",
				width = 180,
				height = 160,
				shift = {0.72, -0.308},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-right-down.png",
				  priority = "extra-high",
				  width = 180,
				  height = 160,
				  shift = {0.72, -0.308},
				  scale = 1
				}
			  },
			}
		  },
		  south =
		  {
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-down.png",
				priority = "extra-high",
				width = 180,
				height = 160,
				shift = {0.72, -0.308},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-down.png",
				  priority = "extra-high",
				  width = 180,
				  height = 160,
				  shift = {0.72, -0.308},
				  scale = 1
				}
			  },
			}
		  },
		  west =
		  {
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-left.png",
				priority = "extra-high",
				width = 180,
				height = 160,
				shift = {0.72, -0.308},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/3-by-3-left.png",
				  priority = "extra-high",
				  width = 180,
				  height = 160,
				  shift = {0.72, -0.308},
				  scale = 1
				}
			  },
			}
		  }
		},
		fire =
		{
		},
		fire_glow_flicker_enabled = false,
		fire_glow =
		{
		},
		burning_cooldown = 20,
		pictures = pipepictures(),
		collision_box = {{-1.30,-1.30},{1.30,1.30}},
		selection_box = {{-1.50,-1.50},{1.50,1.50}},
		target_temperature = 165,
		fluid_box =
		{
			base_area = 250,
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
		name = "nuclear-fission-reactor-5-by-5",
		icon = "__base__/graphics/icons/boiler.png",
		flags = {"placeable-neutral", "placeable-player", "player-creation", "not-blueprintable", "not-deconstructable"},
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
		energy_consumption = "500MW",
		energy_source =
		{
		  type = "burner",
		  fuel_category = "chemical",
		  effectivity = 0.5,
		  fuel_inventory_size = 0,
		  emissions = 0,
		  smoke =
		  {
		  }
		},
		output_fluid_box =
		{
		  base_area = 0,
		  height = 0,
		  base_level = 0,
		  pipe_covers = pipecoverspictures(),
		  pipe_connections =
		  {
		  },
		},
		fluid_input =
		{
		  name = "water",
		  amount = 0.0
		},
		fluid_output =
		{
		  name = "steam",
		  amount = 0.0
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
		  north =
		  { 
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-down.png",
				priority = "extra-high",
				width = 400,
				height = 350,
				shift = {0.05, -1.18},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-down.png",
				  priority = "extra-high",
				  width = 400,
				  height = 350,
				  shift = {0.05, -1.18},
				  scale = 1
				}
			  },
			}
		  },
		  east =
		  {
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-right-down.png",
				priority = "extra-high",
				width = 400,
				height = 350,
				shift = {0.05, -1.18},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-right-down.png",
				  priority = "extra-high",
				  width = 400,
				  height = 350,
				  shift = {0.05, -1.18},
				  scale = 1
				}
			  },
			}
		  },
		  south =
		  {
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-down.png",
				priority = "extra-high",
				width = 400,
				height = 350,
				shift = {0.05, -1.18},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-down.png",
				  priority = "extra-high",
				  width = 400,
				  height = 350,
				  shift = {0.05, -1.18},
				  scale = 1
				}
			  },
			}
		  },
		  west =
		  {
			layers = 
			{ 
			  {
				filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-left.png",
				priority = "extra-high",
				width = 400,
				height = 350,
				shift = {0.05, -1.18},
				hr_version = {
				  filename = "__UraniumPower__/graphics/entities/nuclear-fission-reactor/5-by-5-left.png",
				  priority = "extra-high",
				  width = 400,
				  height = 350,
				  shift = {0.05, -1.18},
				  scale = 1
				}
			  },
			}
		  }
		},
		fire =
		{
		},
		fire_glow_flicker_enabled = false,
		fire_glow =
		{
		},
		burning_cooldown = 20,
		pictures = pipepictures(),
		collision_box = {{-2.30,-2.30},{2.30,2.30}},
		selection_box = {{-2.50,-2.50},{2.50,2.50}},
		target_temperature = 165,
		fluid_box =
		{
			base_area = 500,
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