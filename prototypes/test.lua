data:extend(
{
	--Define the entity fluidbox-theory
	{
		type = "assembling-machine",
		name = "fluidbox-theory",
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
		flags = {"placeable-neutral", "player-creation"},
		minable = {hardness = 0.2, mining_time = 0.1, result = "fluidbox-theory"},
		max_health = 200,
		corpse = "medium-remnants",
		crafting_speed = 1.00,
		energy_source =
		{
			type = "burner",
			effectivity = 1,
			fuel_inventory_size = 1,
			emissions = 0,
		},
		energy_usage = "5kW",
		ingredient_count = 4,
		crafting_categories = {"fluidbox-theory"},
		resistances = 
		{
			{
			type = "fire",
			percent = 90
			}
		},
		collision_box = {{-1.2, -1.2}, {1.2, 1.2}},
		selection_box = {{-1.5, -1.5}, {1.5, 1.5}},
		pictures =
		{
			filename = "__UraniumPower__/graphics/entity/3x3heatexchanger/3x3heatexchanger.png",
			priority = "high",
			width = 116,
			height = 99,
			shift = { 0.34, -0.05}
		},
		animation =
		{
			north =
			{
				filename = "__UraniumPower__/graphics/entity/3x3heatexchanger/3x3heatexchanger.png",
				width = 116,
				height = 99,
				frame_count = 1,
				shift = { 0.34, -0.05}
			},
			west =
			{
				filename = "__UraniumPower__/graphics/entity/3x3heatexchanger/3x3heatexchangerrot.png",
				width = 118,
				height = 99,
				frame_count = 1,
				shift = { 0.31, -0.05}
			},
			south =
			{
				filename = "__UraniumPower__/graphics/entity/3x3heatexchanger/3x3heatexchanger.png",
				width = 116,
				height = 99,
				frame_count = 1,
				shift = { 0.34, -0.05}
			},
			east =
			{
				filename = "__UraniumPower__/graphics/entity/3x3heatexchanger/3x3heatexchangerrot.png",
				width = 118,
				height = 99,
				frame_count = 1,
				shift = { 0.31, -0.05}
			}
		},
		working_sound =
		{
			sound = { filename = "__base__/sound/substation.ogg" },
			apparent_volume = 1.5,
		},
		fluid_boxes =
		{
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 7.5,
				base_level = -1,
				pipe_connections = {{ type="input", position = {-1, 2} }}
			},
			{
				production_type = "input",
				pipe_covers = pipecoverspictures(),
				base_area = 15,
				base_level = -1,
				pipe_connections = {{ type="input", position = {1, -2} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 15,
				base_level = 1,
				pipe_connections = {{ type="output", position = {-1, -2} }}
			},
			{
				production_type = "output",
				pipe_covers = pipecoverspictures(),
				base_area = 30,
				base_level = 1,
				pipe_connections = {{ type="output", position = {1, 2} }}
			}
		}
	},
	{
		type = "item",
		name = "fluidbox-theory",
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchanger1.png",
		flags = {"goes-to-quickbar"},
		group = "uranium",
		subgroup = "uranium-energy-pipe-distribution",
		order = "a[items]-b[iron-chest]a",
		place_result = "fluidbox-theory",
		stack_size = 50
	},
	{
		type = "recipe",
		name = "fluidbox-theory",
		enabled = "true",
		energy_required = 0.1,
		ingredients =
		{
			{"iron-plate", 1}
		},
		result = "fluidbox-theory"
	},
	--Define the item subgroup for fluidbox-theory
	{
		type = "item-subgroup",
		name = "fluidbox-theory",
		group = "uranium",
		order = "z",
	},
	--Define the crafting recipe subgroup for fluidbox-theory
	{
		type = "recipe-category",
		name = "fluidbox-theory",
		group = "uranium",
		order = "z",
	},
	--Define the fluids properties for fluidbox testing
	{	--This is pressurized water stand-in (starts with f)
		type = "fluid",
		name = "fluidbox-fluid01",
		subgroup = "fluidbox-theory",
		default_temperature = 15,
		max_temperature = 300,
		heat_capacity = "1.5KJ",
		base_color = {r=0, g=0.34, b=0.6},
		flow_color = {r=0.7, g=0.7, b=0.7},
		icon = "__base__/graphics/icons/fluid/crude-oil.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a"
	},
	{	--This is pressurized water stand-in (starts with p)
		type = "fluid",
		name = "pressure",
		subgroup = "fluidbox-theory",
		default_temperature = 15,
		max_temperature = 300,
		heat_capacity = "1.5KJ",
		base_color = {r=0, g=0.34, b=0.6},
		flow_color = {r=0.7, g=0.7, b=0.7},
		icon = "__base__/graphics/icons/fluid/crude-oil.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a"
	},
	{	--This is water stand-in
		type = "fluid",
		name = "fluidbox-fluid02",
		subgroup = "fluidbox-theory",
		default_temperature = 15,
		max_temperature = 100,
		heat_capacity = "1.0KJ",
		base_color = {r=0, g=0.34, b=0.6},
		flow_color = {r=0.7, g=0.7, b=0.7},
		icon = "__base__/graphics/icons/fluid/heavy-oil.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "b"
	},
	--Define the fluid recipes for fluidbox testing
	{
		type = "recipe",
		name = "fluidbox-recipe-01",
		category = "fluidbox-theory",
		enabled = "true",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="fluidbox-fluid02", amount=75},
			{type="fluid", name="fluidbox-fluid01", amount=75}
		},
		results=
		{
			{type="fluid", name="fluidbox-fluid02", amount=75},
			{type="fluid", name="fluidbox-fluid01", amount=75},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "fluidbox-theory",
		order = "a"
	},
	{
		type = "recipe",
		name = "fluidbox-recipe-02",
		category = "fluidbox-theory",
		enabled = "true",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="fluidbox-fluid01", amount=75},
			{type="fluid", name="fluidbox-fluid02", amount=150}
		},
		results=
		{
			{type="fluid", name="fluidbox-fluid01", amount=75},
			{type="fluid", name="fluidbox-fluid02", amount=150},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "fluidbox-theory",
		order = "b"
	},
	{
		type = "recipe",
		name = "fluidbox-recipe-03",
		category = "fluidbox-theory",
		enabled = "true",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressure", amount=75},
			{type="fluid", name="water", amount=75}
		},
		results=
		{
			{type="fluid", name="pressure", amount=75},
			{type="fluid", name="water", amount=75},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "fluidbox-theory",
		order = "c"
	},
		{
		type = "recipe",
		name = "fluidbox-recipe-04",
		category = "fluidbox-theory",
		enabled = "true",
		energy_required = 1,
		ingredients =
		{
			{type="fluid", name="pressurised-water", amount=75},
			{type="fluid", name="water", amount=75}
		},
		results=
		{
			{type="fluid", name="pressurised-water", amount=75},
			{type="fluid", name="water", amount=75},
		},
		icon = "__UraniumPower__/graphics/entity/new-heat-exchanger/heatexchangerecipeicon.png",
		subgroup = "fluidbox-theory",
		order = "d"
	},
})