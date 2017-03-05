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


heliCrash = "Land_Wreck_Heli_Attack_01_F" createVehicle _spawnPos;
heliCrash enableSimulation false;

_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>Helicopter Crash Site</t><br/><br/>
	<t align='center' color='#FFFFFF'>A <t color='#FF0000'>Helicopter</t> has crashed in Altis. Check your map for details!</t><br/><br/>
	<t align='center' color='#FFFFFF'>You have %1 minutes before the Helicopter blows up</t><br/><br/>",
	_timer];

_hint remoteExec ["hint",0];

_crate = [heliCrash] call HC_fnc_spawn_weapons_crate;
_groupToDestroy = [_spawnPos,6,2,2,2] call HC_fnc_spawn_soldiers;
_markerToDestroy = [heliCrash,"heliCrashMarker","ColorRed","Helicopter Crash Site","mil_warning"] call HC_fnc_spawn_mission_marker;

_destroyArray pushback heliCrash;
_destroyArray pushback _crate;

_endMission = [_missionTimeout,_destroyArray,_groupToDestroy,_markerToDestroy,1,_timer] spawn HC_fnc_end_mission;
waitUntil{sleep 1; scriptDone _endMission};
