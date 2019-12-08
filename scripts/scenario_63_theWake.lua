-- Name: The Wake
-- Description: Experimental WH40K scenario
-- Type: Experimental
-- Variation[Empty]: Places no enemies. Recommended for GM-controlled scenarios and rookie crew orientation. The scenario continues until the GM declares victory or all Human Navy craft are destroyed.
-- Variation[Easy]: Places fewer enemies. Recommended for inexperienced crews.

require("utils.lua")

function init()
	-- Spawn a player Lunar Cruiser.
	ghostOne = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Lunar"):setCallSign("GhostOne")
	-- Set the engines to minimal efficiency to start within
	ghostOne:setImpulseMaxSpeed(5)

	enemyList = {}
	friendlyList = {}
	stationList = {}
	scapulaOne = nil
	scapulaTwo = nil
	scapulaThree = nil

	-- Randomly distribute 3 allied stations throughout the region.
	n = 0
	station_1 = SpaceStation():setTemplate('Small Station'):setRotation(random(0, 360)):setFaction("Human Navy")
	table.insert(stationList, station_1)
	table.insert(friendlyList, setCirclePos(station_1, 0, 0, n * 360 / 3 + random(-30, 30), random(10000, 22000)))
	n = 1
	table.insert(stationList, station_2)
	station_2 = SpaceStation():setTemplate('Medium Station'):setRotation(random(0, 360)):setFaction("Human Navy")
	table.insert(friendlyList, setCirclePos(station_2, 0, 0, n * 360 / 3 + random(-30, 30), random(10000, 22000)))
	n = 2
	table.insert(stationList, station_3)
	station_3 = SpaceStation():setTemplate('Large Station'):setRotation(random(0, 360)):setFaction("Human Navy")
	table.insert(friendlyList, setCirclePos(station_3, 0, 0, n * 360 / 3 + random(-30, 30), random(10000, 22000)))

	-- Randomly scatter nebulae near the players' spawn point.
	local x, y = friendlyList[1]:getPosition()
	setCirclePos(Nebula(), x, y, random(0, 360), 6000)

	for n=1, 5 do
		setCirclePos(Nebula(), 0, 0, random(0, 360), random(20000, 45000))
	end

	-- Start setting up the nebula maze
	Nebula():setPosition(0, 8000)
	Nebula():setPosition(0, -8000)
	Nebula():setPosition(4000, 8000)
	Nebula():setPosition(4000, -8000)
	Nebula():setPosition(-4000, 8000)
	Nebula():setPosition(-4000, -8000)

  -- GM function to launch a Fighter
  function launchFighter(callsign)
		launchedFighter = PlayerSpaceship():setFaction("Human Navy"):setTemplate("Scapula"):setCallSign(callsign)
		local x, y = ghostOne:getPosition()
		local direction = ghostOne:getHeading()
		setCirclePos(launchedFighter, x, y, direction - 270, 400)
		launchedFighter:setHeading(direction - 180)
		launchedFighter:commandTargetRotation(direction - 270)
		launchedFighter:commandImpulse(0.5)
		return launchedFighter
	end

	addGMFunction("Launch SC1", function()
		if scapulaOne == nil then
  		scapulaOne = launchFighter("Scapula One")
	  end
	end)

	addGMFunction("Recover SC1", function()
		if scapulaOne ~= nil then
  		scapulaOne:destroy()
			scapulaOne = nil
	  end
	end)

	addGMFunction("Launch SC2", function()
		if scapulaTwo == nil then
  		scapulaTwo = launchFighter("Scapula Two")
	  end
	end)

	addGMFunction("Recover SC2", function()
		if scapulaTwo ~= nil then
  		scapulaTwo:destroy()
			scapulaTwo = nil
	  end
	end)

	addGMFunction("Launch SC3", function()
		if scapulaThree == nil then
  		scapulaThree = launchFighter("Scapula Three")
	  end
	end)

	addGMFunction("Recover SC3", function()
		if scapulaThree ~= nil then
  		scapulaThree:destroy()
			scapulaThree = nil
	  end
	end)

	addGMFunction("Repair Main Drives", function()
		ghostOne:setImpulseMaxSpeed(30)
  end)

	-- Let the GM declare the Humans (players) victorious.
	addGMFunction("Win", function()
		victory("Human Navy");
	end)

	-- Set the number of enemy waves based on the scenario variation.
	if getScenarioVariation() == "Easy" then
		enemy_group_count = 3
	elseif getScenarioVariation() == "Empty" then
		enemy_group_count = 0
	else
		enemy_group_count = 5
	end

	-- If not in the Empty variation, spawn the corresponding number of random
	-- enemy waves at distributed random headings and semi-random distances
	-- relative to the players' spawn point.
	if enemy_group_count > 0 then
		for cnt=1,enemy_group_count do
			a = setWaveAngle(cnt, enemy_group_count)
			d = setWaveDistance(enemy_group_count)
			type = random(0, 10)
			addWave(enemyList, type, a, d)
		end
	end

	-- Spawn 2-5 random asteroid belts.
	for cnt=1,random(2, 5) do
		a = random(0, 360)
		a2 = random(0, 360)
		adiff = math.abs(a2 - a)
		d = random(3000, 40000)
		x, y = vectorFromAngle(a, d)

		for acnt=1,50 do
			dx1, dy1 = vectorFromAngle(a2, random(-1000, 1000))
			dx2, dy2 = vectorFromAngle(a2 + 90, random(-20000, 20000))
			posx = x + dx1 + dx2
			posy = x + dy1 + dy2
			-- Avoid spawning asteroids within 1U of the player start position or
			-- 2U of any station.
			if math.abs(posx) > 1000 and math.abs(posy) > 1000 then
				for i,station in ipairs(stationList) do
					if distance(station, posx, posy) > 2000 then
						Asteroid():setPosition(posx, posy):setSize(random(100, 500))
					end
				end
			end
		end

		for acnt=1,100 do
			dx1, dy1 = vectorFromAngle(a2, random(-1500, 1500))
			dx2, dy2 = vectorFromAngle(a2 + 90, random(-20000, 20000))
			VisualAsteroid():setPosition(x + dx1 + dx2, y + dy1 + dy2)
		end
	end


end

function update(delta)
	enemy_count = 0
	friendly_count = 0

	-- Count all surviving enemies and allies.
	for _, enemy in ipairs(enemyList) do
		if enemy:isValid() then
			enemy_count = enemy_count + 1
		end
	end

	for _, friendly in ipairs(friendlyList) do
		if friendly:isValid() then
			friendly_count = friendly_count + 1
		end
	end

	-- If not playing the Empty variation, declare victory for the
	-- Humans (players) once all enemies are destroyed. Note that players can win
	-- even if they destroy the enemies by blowing themselves up.
	--
	-- In the Empty variation, the GM must use the Win button to declare
	-- a Human victory.
	if (enemy_count == 0 and getScenarioVariation() ~= "Empty") then
		victory("Human Navy");
	end

end
