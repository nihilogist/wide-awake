--

template = ShipTemplate():setName("Luna"):setClass("Corvette", "Destroyer"):setModel("battleship_destroyer_1_upgraded")
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



variation = template:copy("Luna"):setType("playership")
variation:setDescription([[The Luna class cruiser]])
variation:setHull(250)
variation:addRoomSystem(1, 0, 2, 1, "Maneuver");
variation:addRoomSystem(1, 1, 2, 1, "BeamWeapons");
variation:addRoom(2, 2, 2, 1);

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
