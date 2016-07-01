--Fuel Assembly {type = {Potential Energy Factor, Decay Factor}}
--Potential energy calculated from P(t)=P0e^(rt), where r = ln(2)/6 and P0 =  (1/210)(4/(e^[4r])).  This interestingly reduces to P(t) = 2^((t+2)/6)/105) where t = {t E Z | [4,inf)}
fuelAssembly = {
	["fuel-assembly-01"] = {0.0000, 0.010},
	["fuel-assembly-02"] = {0.0000, 0.009},
	["fuel-assembly-03"] = {0.0000, 0.008},
	["fuel-assembly-04"] = {(2^(6/6))/105, 0.007},
	["fuel-assembly-05"] = {(2^(7/6))/105, 0.006},
	["fuel-assembly-06"] = {(2^(8/6))/105, 0.005},
	["fuel-assembly-07"] = {(2^(9/6))/105, 0.004},
	["fuel-assembly-08"] = {(2^(10/6))/105, 0.003},
	["fuel-assembly-09"] = {(2^(11/6))/105, 0.002},
	["fuel-assembly-10"] = {(2^(12/6))/105, 0.001}
}

--Reactor performance {type= = {Performance Factor, Energy Consumption/tick, Energy Buffer Size, Neutron Economy}}
--Performance Factor is heat output compensation due to fuel decay
--Energy Consumption/tick is in KJ and computed from prototype.energy_consumption/60
--Energy Buffer Size is in KJ and computed from prototype.energy_consumption/60 * 16/15
--Neutron economy is breeding capacity of the reactor
reactorType = {
	["nuclear-fission-reactor-3-by-3"] = {14/3, 1200, 1280, 0.8},
	["nuclear-fission-reactor-5-by-5"] = {175/18, 2400, 2560, 0.8}
}

--Steam generator internals {name = {[direction] = {Expected Reactor offset {x,y}, Hot Leg name and offset {name,direction,x,y}, Cold Leg name and offset {x,y}}, ["name"] = {base_area}}}
--Expected reactor offset will yield the desirable coordinate for reactor output to match with steam generator input
--Hot leg offset will yield desirable coordinate pipe bus connected to reactor output and recirculation pump
--Cold Leg offset will yield desirable coordinate for pipe connected to the secondary liquid input to be turned into steam
steamGeneratorInternals = {
	["reactor-steam-generator-01"] = {
		[0] = {{1,4},{"reactor-pipe-bus-horiz",0,-1,2},{"steam-generator-01-cold-input",0,-3,-2}}, --was cold input 03, horizontal pipe bus 1 dir0
		[2] = {{-4,1},{"reactor-pipe-bus-vert",0,-2,-1},{"steam-generator-01-cold-input",2,1,-3}}, --was cold input 02, vertical pipe bus 1 dir 0
		[4] = {{-1,-4},{"reactor-pipe-bus-horiz",4,0,-2},{"steam-generator-01-cold-input",4,2,1}},  --was cold input 01, horizontal pipe bus 2 dir 4
		[6] = {{4,-1},{"reactor-pipe-bus-vert",4,2,0},{"steam-generator-01-cold-input",6,-2,2}},  --was cold input 04, vertical pipe bus 2 dir 4
		["self"] = {300},
		["reactor-pipe-bus-vert"] = {50},
		["reactor-pipe-bus-horiz"] = {50},
		["steam-generator-01-cold-input"] = {10},
	},
	["reactor-steam-generator-02"] = {
		[0] = {{},{1,2},{-2,2},{-2,-1}},
		[2] = {{},{-2,1},{-2,-2},{1,-2}},
		[4] = {{},{-1,-2},{2,-2},{2,1}},
		[6] = {{},{2,-1},{2,2},{-1,2}},
		["self"] = {},
		["steam-generator-02-hot-input"] = {},
		["steam-generator-02-hot-return"] = {},
		["steam-generator-02-cold-input"] = {}
	}
}

--Turbine Generator Internals {name = {[direction] = {Low Pressure Fluid Box Offset(direction,x,y)},{Cold Leg Fluid Box Offset(direction,x,y)},{Feed-water Fluid Box Offset(direction,x,y)}}}
--Energy Buffer Capacity is fluid_usage_per_tick * effectivity * 85000J * 16/15
turbineGeneratorInternals = {
	["reactor-turbine-generator-01a"] = {
		[0] = {{"turbine-generator-low-p-steam-box-01",0,1,3},{"turbine-generator-cold-leg-box",0,-3,-3},{"turbine-generator-feed-water-box",0,6,2}},
		[2] = {{"turbine-generator-low-p-steam-box-02",0,-3,0},{"turbine-generator-cold-leg-box",2,3,-3},{"turbine-generator-feed-water-box",2,-2,4}},
		["fluid_usage_per_tick"] = {6.200},
		["effectivity"] = {0.95},
		["energy_buffer_capacity"] = {1602080/3},
		["self"] = {10},
		["turbine-generator-low-p-steam-box-01"] = {50},
		["turbine-generator-low-p-steam-box-02"] = {50},
		["turbine-generator-low-p-steam-box-03"] = {50},
		["turbine-generator-low-p-steam-box-04"] = {50},
		["turbine-generator-cold-leg-box"] = {5},
		["turbine-generator-feed-water-box"] = {20}
	},
	["reactor-turbine-generator-01b"] = {
		[0] = {{"turbine-generator-low-p-steam-box-03",0,0,-3},{"turbine-generator-cold-leg-box",0,3,3},{"turbine-generator-feed-water-box",0,-6,-2}},
		[2] = {{"turbine-generator-low-p-steam-box-04",0,3,0},{"turbine-generator-cold-leg-box",2,-3,3},{"turbine-generator-feed-water-box",2,2,-4}},
		["fluid_usage_per_tick"] = {6.200},
		["effectivity"] = {0.95},
		["energy_buffer_capacity"] = {1602080/3},
		["self"] = {10},
		["turbine-generator-low-p-steam-box-01"] = {50},
		["turbine-generator-low-p-steam-box-02"] = {50},
		["turbine-generator-low-p-steam-box-03"] = {50},
		["turbine-generator-low-p-steam-box-04"] = {50},
		["turbine-generator-cold-leg-box"] = {5},
		["turbine-generator-feed-water-box"] = {20}
	}
}