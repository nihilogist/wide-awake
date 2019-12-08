-- First up the template for the player ship

template = ShipTemplate():setName("Lunar"):setClass("Corvette", "Destroyer"):setModel("battleship_destroyer_1_upgraded")
template:setDescription([[The Luna class cruiser.]])
template:setRadarTrace("radar_dread.png")
template:setHull(100)
template:setShields(200, 200, 200, 200)
--                max, turn, accel
template:setSpeed(20, 1, 1)
--                  Arc, Dir, Range, CycleTime, Dmg
template:setBeam(0,90, 0, 2500.0, 12.0, 20)
template:setTubes(8, 10.0)
template:setWeaponStorage("HVLI", 50)
template:setWeaponStorage("Homing", 20)
template:setTubeDirection(0, -90)
template:setTubeDirection(1,  90)
template:setTubeDirection(2, -91)
template:setTubeDirection(3, -90)
template:setTubeDirection(4, -89)
template:setTubeDirection(5,  91)
template:setTubeDirection(6,  90)
template:setTubeDirection(7,  89)
template:weaponTubeDisallowMissle(0,"HVLI")
template:weaponTubeDisallowMissle(1,"HVLI")
template:weaponTubeDisallowMissle(2,"Homing")
template:weaponTubeDisallowMissle(3,"Homing")
template:weaponTubeDisallowMissle(4,"Homing")
template:weaponTubeDisallowMissle(5,"Homing")
template:weaponTubeDisallowMissle(6,"Homing")
template:weaponTubeDisallowMissle(7,"Homing")



variation = template:copy("Lunar"):setType("playership")
variation:setDescription([[The Luna class cruiser]])
variation:setHull(500)
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);
variation:setDockClasses("Starfighter");

variation:addRoomSystem(0, 3, 1, 2, "RearShield");
variation:addRoomSystem(1, 3, 2, 2, "Reactor");
variation:addRoomSystem(3, 3, 2, 2, "Warp");
variation:addRoomSystem(5, 3, 1, 2, "JumpDrive");
variation:addRoom(6, 3, 2, 1);
variation:addRoom(6, 4, 2, 1);
variation:addRoomSystem(8, 3, 1, 2, "FrontShield");

variation:addRoom(2, 5, 2, 1);
variation:addRoomSystem(1, 6, 2, 1, "MissileSystem");
variation:addRoomSystem(1, 7, 2, 1, "Impulse");

variation:addDoor(1, 1, true);
variation:addDoor(2, 2, true);
variation:addDoor(3, 3, true);
variation:addDoor(1, 3, false);
variation:addDoor(3, 4, false);
variation:addDoor(3, 5, true);
variation:addDoor(2, 6, true);
variation:addDoor(1, 7, true);
variation:addDoor(5, 3, false);
variation:addDoor(6, 3, false);
variation:addDoor(6, 4, false);
variation:addDoor(8, 3, false);
variation:addDoor(8, 4, false);


-- Next up the template for the player Starfighters
template = ShipTemplate():setName("Scapula"):setClass("Starfighter", "Interceptor"):setModel("LindwurmFighterYellow")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[Scapula-class deep space superiority fighter.]])
template:setHull(50)
template:setShields(20)
template:setSpeed(50, 30, 25)
template:setTubes(1, 15.0)
template:setWeaponStorage("Homing", 2)
template:setTubeSize(0, "small")
template:setTubeDirection(1, 0):setWeaponTubeExclusiveFor(1, "Homing")

variation = template:copy("Scapula"):setModel("LindwurmFighterBlue"):setType("playership")
--               Num, Arc, Dir, Range, CycleTime, Dmg
variation:setBeam(0, 10, 0, 700, 6.0, 2)
template:setSpeed(60, 30, 25)
variation:setCombatManeuver(250, 150)
variation:setEnergyStorage(400)

variation:setRepairCrewCount(1)
variation:addRoomSystem(0,0,1,3,"RearShield")
variation:addRoomSystem(1,1,3,1,"MissileSystem")
variation:addRoomSystem(4,1,2,1,"Beamweapons")
variation:addRoomSystem(3,2,2,1,"Reactor")
variation:addRoomSystem(2,3,2,1,"Warp")
variation:addRoomSystem(4,3,5,1,"JumpDrive")
variation:addRoomSystem(0,4,1,3,"Impulse")
variation:addRoomSystem(3,4,2,1,"Maneuver")
variation:addRoomSystem(1,5,3,1,"FrontShield")
variation:addRoom(4,5,2,1)

variation:addDoor(1,1,false)
variation:addDoor(1,5,false)
variation:addDoor(3,2,true)
variation:addDoor(4,2,true)
variation:addDoor(3,3,true)
variation:addDoor(4,3,true)
variation:addDoor(3,4,true)
variation:addDoor(4,4,true)
variation:addDoor(3,5,true)
variation:addDoor(4,5,true)

-- Template for the pirate Ravagers
template = ShipTemplate():setName("Ravager"):setClass("Corvette", "Destroyer"):setModel("battleship_destroyer_1_upgraded")
template:setRadarTrace("radar_dread.png")
template:setDescription([[This monstrosity was an Imperial Light Cruiser, before the pirates got their hands on it.]])
template:setHull(100)
template:setShields(50, 20)
template:setSpeed(15, 2, 3)
template:setTubes(2, 15.0)
template:setWeaponStorage("HVLI", 8)
template:setTubeDirection(0, -90):setWeaponTubeExclusiveFor(0, "HVLI")
template:setTubeDirection(1, 90):setWeaponTubeExclusiveFor(0, "HVLI")
template:setBeam(0, 10, 0, 700, 6.0, 10)


-- Template for pirate raider Starfighters
template = ShipTemplate():setName("Hackblade"):setClass("Starfighter", "Interceptor"):setModel("LindwurmFighterYellow")
template:setRadarTrace("radar_fighter.png")
template:setDescription([[A bastardised Scapula, illegally modified over many years.]])
template:setHull(20)
template:setShields(5, 5)
template:setSpeed(30, 10, 10)
template:setTubes(1, 15.0)
template:setWeaponStorage("HVLI", 3)
template:setTubeSize(0, "small")
template:setTubeDirection(0, 0):setWeaponTubeExclusiveFor(0, "HVLI")
template:setBeam(0, 10, 0, 700, 6.0, 2)


-- Template for derelict ships
template = ShipTemplate():setName("Derelict Gloriana"):setClass("Dreadnaught", "Odin"):setModel("LindwurmFighterYellow")
template:setRadarTrace("radartrace_derelict.png")
template:setDescription([[The machine spirits of this Gloriana-class battlecruiser are quiet, and have been for millenia.]])
template:setHull(200)
template:setSpeed(0, 0, 0)
