//Start the intro

life_firstSpawn = false;

[[player],"life_fnc_getPlotPole",false,false] call life_fnc_MP;

_uid = getPlayerUID player;
[[_uid],"life_fnc_introRanServer",false,false] spawn life_fnc_MP;