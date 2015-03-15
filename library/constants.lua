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

--Steam generator internals {name = {[direction] = {Expected Reactor offset {x,y}, Hot Leg name and offset {name,direction,x,y}, Feedwater name and offset {x,y}}, ["name"] = {base_area}}}
--Expected reactor offset will yield the desirable coordinate for reactor output to match with steam generator input
--Hot leg offset will yield desirable coordinate pipe bus connected to reactor output and recirculation pump
--Feedwater offset will yield desirable coordinate for pipe connected to the secondary liquid input to be turned into steam
steamGeneratorInternals = {
	["reactor-steam-generator-01"] = {
		[0] = {{1,4},{"horizontalreactorpipebus-01",0,-1,2},{"steam-generator-01-cold-input",-2,-1}},
		[2] = {{-4,1},{"verticalreactorpipebus-01",0,-2,-1},{"steam-generator-01-cold-input",1,-2}},
		[4] = {{-1,-4},{"horizontalreactorpipebus-01",4,0,-2},{"steam-generator-01-cold-input",2,1}},
		[6] = {{4,-1},{"verticalreactorpipebus-01",4,2,0},{"steam-generator-01-cold-input",-1,2}},
		["self"] = {100},
		["verticalreactorpipebus-01"] = {100},
		["horizontalreactorpipebus-01"] = {100},
		["steam-generator-01-cold-input"] = {100}
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

--Fluid physical properties {type = {Default Temperature, Max Temperature, Heat Capacity}}
--Default Temperature in C as defined in prototype.fluid
--Max Temperature in C as defined in prototype.fluid
--Heat Capacity in KJ/C as defined in prototype.fluid
--Pressurised Water at 16.6 MPa, 350C has specific isobar heat capacity of 10.0349 kJ/(kg K)
--Water at 101325 Pa, 15C has specific isobar heat capacity of 4.1891 kJ / kg K
--Superheated steam at 6.5 MPa, 350C has specific isobar heat capacity of 2.9561 kJ/(kg K)
--Saturated steam at 8.6 MPa, 300C has specific isobar heat capacity steam of 6.2231 kJ/(kg K) , specific isobar heat capacity water of 5.7515 kJ/(kg K)
fluidProperties = {
	["pressurised-water"] = {15, 350, 2.4},
	["water"] = {15, 100, 1},
	["superheated-steam"] = {100, 350, 0.7},
	["saturated-steam"] = {100, 300, 1.43}
}