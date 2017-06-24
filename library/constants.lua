--Fuel Assembly {type = {Potential Energy Factor, Decay Factor, Decayed}}
--Potential energy calculated from P(t)=P0e^(rt), where r = ln(2)/6 and P0 =  (1/210)(4/(e^[4r])).  This interestingly reduces to P(t) = 2^((t+2)/6)/105) where t = {t E Z | [4,inf)}
fuelAssembly = {
	["fuel-assembly-01"] = {0.0000, 0.010, nil},
	["fuel-assembly-02"] = {0.0000, 0.009, nil},
	["fuel-assembly-03"] = {0.0000, 0.008, nil },
	["fuel-assembly-04"] = {(2^(6/6))/105, 0.007, "spent-fuel-assembly-04"},
	["fuel-assembly-05"] = {(2^(7/6))/105, 0.006, "spent-fuel-assembly-05"},
	["fuel-assembly-06"] = {(2^(8/6))/105, 0.005, "spent-fuel-assembly-06"},
	["fuel-assembly-07"] = {(2^(9/6))/105, 0.004, "spent-fuel-assembly-07"},
	["fuel-assembly-08"] = {(2^(10/6))/105, 0.003, "spent-fuel-assembly-08"},
	["fuel-assembly-09"] = {(2^(11/6))/105, 0.002, "spent-fuel-assembly-09"},
	["fuel-assembly-10"] = {(2^(12/6))/105, 0.001, "spent-fuel-assembly-10"},
	["fuel-assembly-11"] = {(2^(13/6))/105, 0.001, "spent-fuel-assembly-11"}
}

--Reactor performance {type= = {Performance Factor, Energy Consumption/tick, Energy Buffer Size, Neutron Economy}}
--Performance Factor is heat output compensation due to fuel decay
--Energy Consumption/tick is in KJ and computed from prototype.energy_consumption/60
--Energy Buffer Size is in KJ and computed from prototype.energy_consumption/60 * 16/15
--Downstream Consumption
--Neutron economy is breeding capacity of the reactor
reactorType = {
	["nuclear-fission-reactor-3-by-3"] = {23/3, 4000, 12800/3, 97920000, 1.14},
	["nuclear-fission-reactor-5-by-5"] = {175/18, 5500, 17600/3, 195840000, 1.14}
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
		["self"] = {30000},
		["reactor-pipe-bus-vert"] = {15000},
		["reactor-pipe-bus-horiz"] = {15000},
		["steam-generator-01-cold-input"] = {1000},
	}
}

--Turbine Generator Internals {name = {[direction] = {Low Pressure Fluid Box Offset(direction,x,y)},{Cold Leg Fluid Box Offset(direction,x,y)},{Feed-water Fluid Box Offset(direction,x,y)}}}
--Energy Buffer Capacity is fluid_usage_per_tick * effectivity * 85000J * 16/15
turbineGeneratorInternals = {
	["reactor-turbine-generator-01a"] = {
		[0] = {{"turbine-generator-low-p-steam-box-01",0,1,3},{"turbine-generator-cold-leg-box",0,-3,-3},{"turbine-generator-feed-water-box",0,6,2}},
		[2] = {{"turbine-generator-low-p-steam-box-02",0,-3,0},{"turbine-generator-cold-leg-box",2,3,-3},{"turbine-generator-feed-water-box",2,-2,4}},
		["fluid_usage_per_tick"] = {9.000},
		["effectivity"] = {0.95},
		["energy_buffer_capacity"] = {775200},
		["self"] = {1000},
		["turbine-generator-low-p-steam-box-01"] = {5000},
		["turbine-generator-low-p-steam-box-02"] = {5000},
		["turbine-generator-low-p-steam-box-03"] = {5000},
		["turbine-generator-low-p-steam-box-04"] = {5000},
		["turbine-generator-cold-leg-box"] = {500},
		["turbine-generator-feed-water-box"] = {2000}
	},
	["reactor-turbine-generator-01b"] = {
		[0] = {{"turbine-generator-low-p-steam-box-03",0,0,-3},{"turbine-generator-cold-leg-box",0,3,3},{"turbine-generator-feed-water-box",0,-6,-2}},
		[2] = {{"turbine-generator-low-p-steam-box-04",0,3,0},{"turbine-generator-cold-leg-box",2,-3,3},{"turbine-generator-feed-water-box",2,2,-4}},
		["fluid_usage_per_tick"] = {9.000},
		["effectivity"] = {0.95},
		["energy_buffer_capacity"] = {775200},
		["self"] = {1000},
		["turbine-generator-low-p-steam-box-01"] = {5000},
		["turbine-generator-low-p-steam-box-02"] = {5000},
		["turbine-generator-low-p-steam-box-03"] = {5000},
		["turbine-generator-low-p-steam-box-04"] = {5000},
		["turbine-generator-cold-leg-box"] = {500},
		["turbine-generator-feed-water-box"] = {2000}
	}
}