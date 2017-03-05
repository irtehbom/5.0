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


DrugsHouse = "Land_i_Stone_HouseSmall_V3_F" createVehicle _spawnPos;


_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>Drugs House Discovered</t><br/><br/>
	<t align='center' color='#FFFFFF'>A Cartel Gang is defending their drugs house.</t><br/><br/>
	<t align='center' color='#FFFFFF'>You have %1 minutes to take the drugs before they dispose of their contraband!</t><br/><br/>",
	_timer];

_hint remoteExec ["hint",0];

_crate = [DrugsHouse] call HC_fnc_spawn_yinv_crate;
_groupToDestroy = [_spawnPos,6,2,2,2] call HC_fnc_spawn_soldiers;
_markerToDestroy = [DrugsHouse,"drugsHouseMarker","ColorRed","Drugs House","mil_warning"] call HC_fnc_spawn_mission_marker;

_destroyArray pushback DrugsHouse;
_destroyArray pushback _crate;

_endMission = [_missionTimeout,_destroyArray,_groupToDestroy,_markerToDestroy,2,_timer] spawn HC_fnc_end_mission;
waitUntil{sleep 1; scriptDone _endMission};
