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


informerHouse = "Land_i_House_Big_01_V1_F" createVehicle _spawnPos;
informerHouse enableSimulation false;

_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>Assassinate The Informer</t><br/><br/>
	<t align='center' color='#FFFFFF'>An informer has been located although is guarded by the police, check your map for details</t><br/><br/>
	<t align='center' color='#FFFFFF'>You have %1 minutes before the informer is relocated.</t><br/><br/>",
	_timer];

_hint remoteExec ["hint",0];

_groupToDestroy = [_spawnPos,6,2,2,2] call HC_fnc_spawn_soldiers;
_unitToDestroy = [_spawnPos,informerHouse] call HC_fnc_spawn_unit;

_markerToDestroy = [informerHouse,"heliCrashMarker","ColorRed","Informant Location","mil_warning"] call HC_fnc_spawn_mission_marker;

_destroyArray pushback informerHouse;

_endMission = [_missionTimeout,_destroyArray,_groupToDestroy,_markerToDestroy,4,_timer] spawn HC_fnc_end_mission;
waitUntil{sleep 1; scriptDone _endMission};

removeallweapons _unitToDestroy;
removebackpack _unitToDestroy;
deleteVehicle _unitToDestroy;
