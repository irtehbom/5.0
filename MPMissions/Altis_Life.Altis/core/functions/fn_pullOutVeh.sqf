/*
    File: fn_pullOutVeh.sqf
    Author: Bryan "Tonic" Boardwine

    Description:

*/
if (playerSide isEqualTo west || (isNull objectParent player)) exitWith {};

// pull out dead players
if (!alive player) then {
	_deadPos = player worldToModel _vehPos; 
	_deadExitPos = player modelToWorld [3, 0, 0]; 
	player setPos _deadExitPos;
};

if (player getVariable "restrained") then {
    detach player;
    player setVariable ["Escorting",false,true];
    player setVariable ["transporting",false,true];
    life_disable_getOut = false;
    player action ["Eject", vehicle player];
    titleText[localize "STR_NOTF_PulledOut","PLAIN"];
    titleFadeOut 4;
    life_disable_getIn = true;
} else {
    player action ["Eject", vehicle player];
    titleText[localize "STR_NOTF_PulledOut","PLAIN"];
    titleFadeOut 4;
};
