private[];

_red = [_this, 0, true, [true]] call BIS_fnc_param;

hint "Starting paintball, have fun.";

// Save gear
[true] call life_fnc_saveGear;
life_paintball_gear_before = life_gear;
life_paintball_pos_before = getPos player;

removeAllWeapons player;
{
	player removeMagazine _x;
} foreach (magazines player);

removeUniform player;
removeVest player;
removeBackpack player;
removeGoggles player;
removeHeadgear player;

if (_red) then {
	player forceAddUniform "U_B_Protagonist_VR";
} else {
	player forceAddUniform "U_O_Protagonist_VR";
};

/*{
	player unassignItem _x;
	player removeItem _x;
} foreach (assignedItems player);*/
player allowDamage false;

player addMagazine "30Rnd_45ACP_Mag_SMG_01";
player addWeaponGlobal "SMG_01_Holo_pointer_snds_F";
player setAmmo[primaryWeapon player, 1];
player addEventHandler["Fired", {[] spawn { sleep 0.5; player setAmmo[primaryWeapon player, 1];}}];
player addEventHandler ["Hit",
{
	_slainSon = "slain";
	switch (floor(random(5))) do {
		case 0:
		{
			_slainSon = "slain";
		};
		case 1:
		{
			_slainSon = "wrecked";
		};
		case 2:
		{
			_slainSon = "#rekt2014";
		};
		case 3:
		{
			_slainSon = "rekt";
		};
		case 4:
		{
			_slainSon = "rinsed";
		};
	};
	hint format["You got %1 by %2", _slainSon, name (_this select 1)];
	
	[[2,format["Hit %1", name player]], "life_fnc_broadcast", owner (_this select 1), false] spawn life_fnc_MP;
	// Let server know we got destroyed
	[[player, _this select 1], "life_fnc_paintballKill", false, false] spawn life_fnc_MP; 
	[] call life_fnc_paintballKilled;
}];

disableUserInput true;

if (_red) then {
	player setPos getMarkerPos "Paintball_Red_Spawn";
} else {
	player setPos getMarkerPos "Paintball_Blue_Spawn";
};
titleText["20 seconds before start!", "PLAIN"];

sleep 10;
titleText["10 seconds before start!", "PLAIN"];
sleep 10;
disableUserInput false;
titleText["GO! GO! GO!", "PLAIN"];

