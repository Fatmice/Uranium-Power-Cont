data:extend({
	{
		type = "projectile",
		name = "uranium-cannon-projectile",
		flags = {"not-on-map"},
		--collision_box = {{-0.05, -1.1}, {0.05, 1.1}},
		acceleration = 0.005,
		--direction_only = true,
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
						type = "nested-result",
						action =
						{
							type = "area",
							perimeter = 10,
							action_delivery =
							{
								type = "instant",
								target_effects =
								{
									{
										type = "damage",
										damage = {amount = 350, type = "physical"}
									},
									{
										type = "damage",
										damage = {amount = 250, type = "impact"}
									},
									{
										type = "damage",
										damage = {amount = 100, type = "explosion"}
									},
									{
										type = "create-entity",
										entity_name = "explosion"
									}
								}
							}
						},
					},
					{
						type = "create-entity",
						entity_name = "bigger-explosion"
					},
					{
						type = "play-sound",
						sound =
						{
							{
								filename = "__base__/sound/creatures/projectile-acid-burn-1.ogg",
								volume = 0.8
							},
						}
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
		light = {intensity = 0.5, size = 4},
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
							perimeter = 30,
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
										damage = {amount = 1000, type = "fire"}
									},
									{
										type = "damage",
										damage = {amount = 300, type = "acid"}
									},
									{
										type = "damage",
										damage = {amount = 1000, type = "impact"}
									},
									{
										type = "damage",
										damage = {amount = 2000, type = "explosion"}
									},
									{
										type = "create-entity",
										entity_name = "explosion"
									},
								}
							}
						},
					},
					{
						type = "create-entity",
						entity_name = "uranium-explosion-LUQ"
					},
					{
						type = "create-entity",
						entity_name = "uranium-explosion-RUQ"
					},
					{
						type = "create-entity",
						entity_name = "uranium-explosion-LLQ"
					},
					{
						type = "create-entity",
						entity_name = "uranium-explosion-RLQ"
					},
					{
						type = "create-entity",
						entity_name = "null-nuke-entity-flame-explosion"
					}
				},
			},
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
		type = "smoke-with-trigger",
		name = "null-nuke-entity-flame-explosion",
		flags = {"not-on-map"},
		show_when_smoke_off = true,
		animation =
		{
			filename = "__UraniumPower__/graphics/entity/null/null.png",
			flags = { "compressed" },
			priority = "low",
			width = 224,
			height = 108,
			frame_count = 1,
			animation_speed = 0.5,
			line_length = 1,
			scale = 1,
		},
		slow_down_factor = 0,
		affected_by_wind = false,
		cyclic = true,
		duration = 1,
		fade_away_duration = 1,
		spread_duration = 10,
		color = { r = 0.2, g = 0.9, b = 0.2 },
		action =
		{
			{
				type = "cluster",
				cluster_count = 700,
				distance = 0,
				distance_deviation = 70,
				action_delivery =
				{
					type = "projectile",
					projectile = "fire-nuke-projectile",
					direction_deviation = 1,
					starting_speed = 0.65,
					starting_speed_deviation = 0.7
				}
			}
		},
		action_frequency = 30
	},
	{
		type = "projectile",
		name = "fire-nuke-projectile",
		flags = {"not-on-map"},
		acceleration = 0.005,
		action =
		{
			{
				type = "direct",
				action_delivery =
				{
					type = "instant",
					target_effects =
					{
						{
							type = "create-fire",
							entity_name = "fire-flame"
						}
					}
				}
			},
		},
		animation =
		{
			filename = "__UraniumPower__/graphics/entity/null/null.png",
			frame_count = 1,
			width = 224,
			height = 108,
			priority = "high"
		},
		shadow =
		{
			filename = "__UraniumPower__/graphics/entity/null/null.png",
			frame_count = 1,
			width = 224,
			height = 108,
			priority = "high"
		}
	},
	--[[{
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
				frame_count = 60,
				line_length = 8,
				scale = 10,
				animation_speed = 0.35
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
				{
					filename = "__base__/sound/fight/large-explosion-2.ogg",
					volume = 1.0
				}
			}
		},
		sound =
			{
			{
			filename = "__UraniumPower__/sound/uranium-explosion-01.ogg",
			volume = 1
			},
		}
	},]]
	{
		type = "explosion",
		name = "bigger-explosion",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__base__/graphics/entity/big-explosion/big-explosion.png",
				priority = "extra-high",
				flags = { "compressed" },
				width = 197,
				height = 245,
				frame_count = 47,
				line_length = 6,
				scale = 3,
				axially_symmetrical = false,
				direction_count = 1,
				shift = {1.1875, -2.5},
				animation_speed = 0.35
			}
		},
		light = {intensity = 1, size = 50},
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = true
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
				{
					filename = "__base__/sound/fight/large-explosion-2.ogg",
					volume = 1.0
				}
			}
		},
		created_effect =
		{
			type = "direct",
			action_delivery =
			{
				type = "instant",
				target_effects =
				{
					{
						type = "create-particle",
						repeat_count = 20,
						entity_name = "explosion-remnants-particle",
						initial_height = 0.5,
						speed_from_center = 0.08,
						speed_from_center_deviation = 0.15,
						initial_vertical_speed = 0.08,
						initial_vertical_speed_deviation = 0.15,
						offset_deviation = {{-0.2, -0.2}, {0.2, 0.2}}
					}
				}
			}
		}
	},
	
	{
		type = "explosion",
		name = "uranium-explosion-LUQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__UraniumPower__/graphics/entity/explosions/LUQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {-16, -16},
				animation_speed = 0.35
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
			}
		},
	},
	{
		type = "explosion",
		name = "uranium-explosion-RUQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__UraniumPower__/graphics/entity/explosions/RUQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {16, -16},
				animation_speed = 0.35
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
			}
		},
	},
	{
		type = "explosion",
		name = "uranium-explosion-LLQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__UraniumPower__/graphics/entity/explosions/LLQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {-16, 16},
				animation_speed = 0.35
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
			}
		},
	},
	{
		type = "explosion",
		name = "uranium-explosion-RLQ",
		flags = {"not-on-map"},
		animations =
		{
			{
				filename = "__UraniumPower__/graphics/entity/explosions/RLQ.png",
				priority = "extra-high",
				width = 256,
				height = 256,
				frame_count = 64,
				line_length = 8,
				scale = 4,
				shift = {16, 16},
				animation_speed = 0.35
			},
		},
		light = {intensity = 10, size = 120},
		smoke = "smoke-fast",
		smoke_count = 2,
		smoke_slow_down_factor = 1,
		sound =
		{
			aggregation =
			{
				max_count = 1,
				remove = false
			},
			variations =
			{
				{
					filename = "__base__/sound/fight/large-explosion-1.ogg",
					volume = 1.0
				},
			}
		},
	},
})