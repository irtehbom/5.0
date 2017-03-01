#include <macro.h>
/*
	File: fn_onPlayerRespawn.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Does something but I won't know till I write it...
*/
private["_unit","_corpse"];
_unit = _this select 0;
_corpse = _this select 1;
life_corpse = _corpse;

//Comment this code out if you want them to keep the weapon on the ground.
//private["_containers"];
//_containers = nearestObjects[getPosATL _corpse,["WeaponHolderSimulated"],5]; //Fetch list of containers (Simulated = weapons)
//{deleteVehicle _x;} foreach _containers; //Delete the containers.

//Set some vars on our new body.
_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE]; //Again why the fuck am I setting this? Can anyone tell me?
_unit setVariable["steam64id",(getPlayerUID player),true]; //Reset the UID.
_unit setVariable["realname",profileName,true]; //Reset the players name.
life_medic_requested = 0;
_unit addRating 9999999999999999; //Set our rating to a high value, this is for a ARMA engine thing.
player playMoveNow "amovppnemstpsraswrfldnon";

[] call life_fnc_setupActions;
[[_unit,life_sidechat,playerSide],"TON_fnc_managesc",false,false] spawn life_fnc_MP;
player enableFatigue (__GETC__(life_enableFatigue));

_p = ["<t color='#ffff33'>Put in ear plugs</t>",{
	_s = _this select 0;
	_i = _this select 2;
	if (soundVolume != 1) then {
		1 fadeSound 1;
		_s setUserActionText [_i,"<t color='#ffff33'>Put in ear plugs</t>"];
	} else {
		1 fadeSound 0.2;
		_s setUserActionText [_i,"<t color='#ffff33'>Take off ear plugs</t>"];
	}
},[],-90,false,true,"",""];

1 fadeSound 1;
player addAction _p;