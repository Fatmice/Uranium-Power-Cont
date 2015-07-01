data:extend(
{
	{
		type = "fluid",
		name = "pressurised-water",
		subgroup = "uranium-heatexchangerecipes",
		default_temperature = 15,
		max_temperature = 350,
		heat_capacity = "2.4KJ",
		base_color = {r=0, g=0.34, b=0.6},
		flow_color = {r=0.7, g=0.7, b=0.7},
		icon = "__UraniumPower__/graphics/icons/pressurized-water.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "1a"
	},
	{
		type = "fluid",
		name = "fluorine-gas",
		subgroup = "uranium-prefluids",
		default_temperature = 25,
		heat_capacity = "1KJ",
		base_color = {r=1, g=0.965, b=0.561},
		flow_color = {r=1, g=0.965, b=0.561},
		max_temperature = 100,
		icon = "__UraniumPower__/graphics/icons/fluorine-gas.png",
		pressure_to_speed_ratio = 0.4,
		flow_to_energy_ratio = 0.59,
		order = "a[fluid]-g[fluorine-gas]"
	},
	{
		type = "fluid",
		name = "uraninite-slurry",
		subgroup = "uranium-prefluids",
		default_temperature = 25,
		heat_capacity = "1KJ",
		base_color = {r=0.345, g=0.345, b=0.000},
		flow_color = {r=0.545, g=0.545, b=0.000},
		max_temperature = 100,
		icon = "__UraniumPower__/graphics/icons/uraninite-slurry.png",
		pressure_to_speed_ratio = 0.05,
		flow_to_energy_ratio = 0.59,
		order = "a[fluid]-f[uraninite-slurry]"
	},
	{
		type = "fluid",
		name = "superheated-steam",
		subgroup = "uranium-prefluids",
		default_temperature = 100,
		heat_capacity = "0.7KJ",
		base_color = {r=0.843, g=0.843, b=0.843},
		flow_color = {r=1, g=1, b=1},
		max_temperature = 350,
		icon = "__UraniumPower__/graphics/entity/steam/superheated-steam.png",
		pressure_to_speed_ratio = 0.9,
		flow_to_energy_ratio = 0.75,
		order = "a[fluid]-g[superheated-steam]"
	},
		{
		type = "fluid",
		name = "low-pressure-steam",
		subgroup = "uranium-prefluids",
		default_temperature = 100,
		heat_capacity = "0.5KJ",
		base_color = {r=0.843, g=0.843, b=0.843},
		flow_color = {r=1, g=1, b=1},
		max_temperature = 300,
		icon = "__UraniumPower__/graphics/entity/steam/low-pressure-steam.png",
		pressure_to_speed_ratio = 0.2,
		flow_to_energy_ratio = 0.70,
		order = "a[fluid]-g[low-pressure-steam]"
	}
})