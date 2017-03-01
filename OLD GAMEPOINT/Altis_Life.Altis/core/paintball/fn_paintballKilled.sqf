private[];

_matchEnd = [_this, 0, false, [false]] call BIS_fnc_param;


if (_matchEnd) then {
	hint "Match ended. All enemy players have been defeated, congratulations!";
	[[21, player, (call life_donator)], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
} else {
	[[22, player, (call life_donator)], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
};

player setPos life_paintball_pos_before;
life_gear = life_paintball_gear_before;
[] spawn life_fnc_loadGear;

player removeAllEventHandlers "Fired";
player removeAllEventHandlers "Hit";

life_paintball_gear_before = [];
life_paintball_pos_before = [];

player allowDamage true;