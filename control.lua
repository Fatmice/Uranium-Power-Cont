require "defines"
require "util"

local fuelAssemblyReactivity = {}
for i=1,9 do
   -- These should perhaps be non-linear.
   fuelAssemblyReactivity['fuel-assembly-0' .. i] = 0.0238*6*i
end
fuelAssemblyReactivity['fuel-assembly-10'] = 0.0238*6*10
-- Rate at which fuel gets used up.
-- This one is calculated so that a fuel-assembly-10 will produce 10MW
-- for 1000 seconds. Roughly.
local fuelUseRate = 0.0003


-- Remember to fix multplayer



local tickingA = 59


game.onevent(defines.events.ontick, function(event)
  if tickingA == 0 then
    tickingA = 59
    tick_fuel()
  else
    tickingA = tickingA - 1
  end

  if glob.LHeatExchanger ~= nil then
    do_heat_exchange()
  end
end)


game.onevent(defines.events.onbuiltentity, function(event)
  local x1 = event.createdentity.position.x-1
  local y1 = event.createdentity.position.y-1
  local x2 = x1+2
  local y2 = y1+2

-- Fission reactor stuff

  if event.createdentity.name == "nuclear-fission-reactor-3-by-3" then
    event.createdentity.operable = false
    for i,player in ipairs(game.players) do
      game.players[i].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
      game.players[i].print("Place the reactor access port next to the fission reactor.")
    end
  elseif event.createdentity.name == "nuclear-fission-reactor-5-by-5" then
    event.createdentity.operable = false
    for i,player in ipairs(game.players) do
      game.players[i].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
      game.players[i].print("Place the reactor access port next to the fission reactor.")
    end
  elseif event.createdentity.name == "nuclear-fission-reactor-chest-9" then
    results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-3-by-3"}
    if #results == 1 then
      if glob.LReactorAndChest == nil then
        glob.LReactorAndChest = {}
      end
      reactorAndChest = {true, true, true, true}
      reactorAndChest[1] = results[1]
      reactorAndChest[2] = event.createdentity
      reactorAndChest[3] = 0
      reactorAndChest[4] = 0
      table.insert(glob.LReactorAndChest, reactorAndChest)
      for i,player in ipairs(game.players) do
        game.players[i].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
      end
    else
      for i,player in ipairs(game.players) do
        game.players[i].insert({name = "nuclear-fission-reactor-chest-9", count = 1})
        game.players[i].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
      end
      event.createdentity.destroy()
    end
  elseif event.createdentity.name == "nuclear-fission-reactor-chest-25" then
    results = game.findentitiesfiltered{area = {{x1, y1}, {x2, y2}}, name = "nuclear-fission-reactor-5-by-5"}
    if #results == 1 then
      if glob.LReactorAndChest == nil then
        glob.LReactorAndChest = {}
      end
      reactorAndChest = {true, true, true, true}
      reactorAndChest[1] = results[1]
      reactorAndChest[2] = event.createdentity
      reactorAndChest[3] = 0
      reactorAndChest[4] = 0
      table.insert(glob.LReactorAndChest, reactorAndChest)
      for i,player in ipairs(game.players) do
        game.players[i].print("Reactor access port successfully linked! Ready to accept fuel assemblies!")
      end
    else
      for i,player in ipairs(game.players) do
        game.players[i].insert({name = "nuclear-fission-reactor-chest-25", count = 1})
        game.players[i].print("Reactor access port cannot find a fission reactor! Returning to your inventory.")
      end
      event.createdentity.destroy()
    end

-- Heat exchanger stuff

  elseif event.createdentity.name == "heat-exchanger" then
    if glob.LHeatExchanger == nil then
      glob.LHeatExchanger = {}
    end

    local x = event.createdentity.position.x
    local y = event.createdentity.position.y

    local up = game.findentitiesfiltered{area = {{x, y+1}, {x, y+1}}, name = "pipe"}
    local down = game.findentitiesfiltered{area = {{x, y-1}, {x, y-1}}, name = "pipe"}
    local left = game.findentitiesfiltered{area = {{x-1, y}, {x-1, y}}, name = "pipe"}
    local right = game.findentitiesfiltered{area = {{x+1, y}, {x+1, y}}, name = "pipe"}
 
    heatExchanger = {} 
    heatExchanger[1] = event.createdentity

    if up[1] ~= nil and down[1] ~= nil then
      --game.player.print("up and down working")

      heatExchanger[2] = up[1]
      heatExchanger[3] = down[1]
      table.insert(glob.LHeatExchanger, heatExchanger)
    elseif left[1] ~= nil and right[1] ~= nil then
      --game.player.print("left and right working")

      heatExchanger[2] = left[1]
      heatExchanger[3] = right[1]
      table.insert(glob.LHeatExchanger, heatExchanger)
    end
  end
end)


function tick_fuel()
   if glob.LReactorAndChest ~= nil then
      for k,LReactorAndChest in pairs(glob.LReactorAndChest) do
         if LReactorAndChest[1].valid and LReactorAndChest[2].valid then
            if true then
               local chest = LReactorAndChest[2].getinventory(1)
               if chest.isempty() == false then
                  local sumReactivity = 0
                  local firstThing = nil
                  for i = 1,#chest do
                     local thing = chest.getitemstack(i)
                     if thing ~= nil then
                        local reactivity = fuelAssemblyReactivity[thing.name]
                        if reactivity ~= nil then
                           if firstThing == nil then
                              firstThing = thing
                           end
                           sumReactivity = sumReactivity + reactivity
                        end
                     end
                  end
                  local totalFuel = sumReactivity + (LReactorAndChest.overflow or 0)
                  local usedFuel = add_reactor_fuel(LReactorAndChest, totalFuel)
                  local spareFuel = totalFuel - usedFuel
                  LReactorAndChest.overflow = math.min(spareFuel, sumReactivity)
				  game.player.print("Reactor Energy= "..LReactorAndChest[1].energy)
				  game.player.print("Reactor Overflow= "..LReactorAndChest.overflow)
                  if firstThing ~= nil then
                     -- Burn the fuel assemblies sequentially, for convenience.
                     --if firstThing.health == 0 then
                        firstThing.health = 10 -- It's just uninitialised, not dead.
						game.player.print("Initial Fuel health= "..firstThing.health)
                     --end
                     local newHealth = firstThing.health - usedFuel * fuelUseRate
                     if newHealth < 0 then
                        -- TODO: Turn into a different item, which can be reprocessed.
                        chest.remove(firstThing)
                     else
                        firstThing.health = newHealth
						game.player.print("Current Fuel health= "..firstThing.health)
                     end
                  end
               end
            end
         else
            table.remove(glob.LReactorAndChest, k)
         end
      end
   end
end


function add_reactor_fuel(reactor, reactivity)
   if reactivity < 1 then
      return 0
   end
   local fuel = reactor[1].getitemcount("fission-reactor-fuel")
   if fuel < 100 then
      local usable = math.floor(reactivity)
      local used = math.min(usable, 100 - fuel)
      reactor[1].insert({name = "fission-reactor-fuel", count=used})
      return used
   else
      return 0
   end
end


function do_heat_exchange()
  for k,LHeatExchanger in pairs(glob.LHeatExchanger) do
    if LHeatExchanger[1].valid and LHeatExchanger[2].valid and LHeatExchanger[3].valid then
      if LHeatExchanger[2].fluidbox[1] and LHeatExchanger[3].fluidbox[1] ~= nil then

        local v1 = LHeatExchanger[2].fluidbox[1].amount
        local t1 = LHeatExchanger[2].fluidbox[1].temperature
        local v2 = LHeatExchanger[3].fluidbox[1].amount
        local t2 = LHeatExchanger[3].fluidbox[1].temperature
        local newFluidBox1 = LHeatExchanger[2].fluidbox[1]
        local newFluidBox2 = LHeatExchanger[3].fluidbox[1]
        local maxT1 = 100
        local minT1 = 25
        local heatCapacity1 = 1
        local maxT2 = 100
        local minT2 = 25
        local heatCapacity2 = 1

        if LHeatExchanger[2].fluidbox[1].type == "pressurised-water" then
          maxT1 = 300
          minT1 = 15
          heatCapacity1 = 1.5
        elseif LHeatExchanger[2].fluidbox[1].type == "water" then
          maxT1 = 100
          minT1 = 15
          heatCapacity1 = 1
        end

        if LHeatExchanger[3].fluidbox[1].type == "pressurised-water" then
          maxT2 = 300
          minT2 = 15
          heatCapacity2 = 1.5
        elseif LHeatExchanger[3].fluidbox[1].type == "water" then
          maxT2 = 100
          minT2 = 15
          heatCapacity2 = 1
        end

        energy1 = v1*t1*heatCapacity1
        energy2 = v2*t2*heatCapacity2
        totalEnergy = energy1+energy2

        newTemp = totalEnergy/(v1*heatCapacity1+v2*heatCapacity2)
        --game.player.print(newTemp)


        if newTemp > minT1 and newTemp < maxT1 and newTemp > minT2 and newTemp < maxT1 then
          newTemp1 = newTemp
          newTemp2 = newTemp
        end
         
        if newTemp > maxT1 then
          newTemp1 = maxT1
          newTemp2 = (totalEnergy-(v1*maxT1*heatCapacity1))/(v2*heatCapacity2)
        end

        if newTemp > maxT2 then
          newTemp2 = maxT2
          newTemp1 = (totalEnergy-(v2*maxT2*heatCapacity2))/(v1*heatCapacity1)
        end

        --game.player.print("newTemp1 == "..newTemp1.."newTemp2 == "..newTemp2)

        newFluidBox1["temperature"] = newTemp1
        newFluidBox2["temperature"] = newTemp2

        LHeatExchanger[2].fluidbox[1] = newFluidBox1
        LHeatExchanger[3].fluidbox[1] = newFluidBox2 
      end
    else
      table.remove(glob.LHeatExchanger, k)
    end
  end
end