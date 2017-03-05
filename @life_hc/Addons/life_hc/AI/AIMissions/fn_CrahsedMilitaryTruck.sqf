// =========================================================================================================
//  Author: Rob
// =========================================================================================================


private["_missionTimeout"];

_destroyArray = [];

_timer = 20;
_missionTimeout = (60 * 20);

_spawnMarker = spawnMarkers call BIS_fnc_selectRandom;
 _area = markerSize _spawnMarker;
_nul = _area pushBack markerDir _spawnMarker;
_nul = _area pushBack ( markerShape _spawnMarker isEqualTo "Rectangle" );
_spawnPos = [ _spawnMarker, _area ] call BIS_fnc_randomPosTrigger;


militaryTruck = "Land_Wreck_BRDM2_F" createVehicle _spawnPos;
militaryTruck enableSimulation false;

_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>Military Vehicle Crash</t><br/><br/>
	<t align='center' color='#FFFFFF'>A military vehicle escorting weapons has crashed in Altis</t><br/><br/>
	<t align='center' color='#FFFFFF'>You have %1 minutes before the vehicle blows up</t><br/><br/>",
	_timer];

_hint remoteExec ["hint",0];

_crate = [militaryTruck] call HC_fnc_spawn_weapons_crate;
_groupToDestroy = [_spawnPos,6,2,2,2] call HC_fnc_spawn_soldiers;
_markerToDestroy = [militaryTruck,"CrashedMilitaryTruckMarker","ColorRed","Military Truck Crash Site","mil_warning"] call HC_fnc_spawn_mission_marker;

_destroyArray pushback militaryTruck;
_destroyArray pushback _crate;

_endMission = [_missionTimeout,_destroyArray,_groupToDestroy,_markerToDestroy,3,_timer] spawn HC_fnc_end_mission;
waitUntil{sleep 1; scriptDone _endMission};
