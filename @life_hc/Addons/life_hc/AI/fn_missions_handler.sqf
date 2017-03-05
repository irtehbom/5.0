// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#define MissionDelay (60 * 0) 
#define firstMissionDelay (60 * 1)


private["_availableMissions","_firstMission","_nextMission","_missionRunning"];

_availableMissions = [
	"CrashedHeli",
	"drugsHouse",
	"CrashedMilitaryTruck",
	"assassinationMission"
];

spawnMarkers = [
	"ai_missions_1",
	"ai_missions_2",
	"ai_missions_3",
	"ai_missions_4",
	"ai_missions_5",
	"ai_missions_6"
];

_firstMission = true;
while {true} do {
	if (_firstMission) then {
		sleep firstMissionDelay;
	};
	_firstMission = false;
	
	_nextMission = _availableMissions call BIS_fnc_selectRandom;
	_missionRunning = [] spawn (missionNamespace getVariable[format["HC_fnc_%1", _nextMission], {}]);
	
	waitUntil{sleep 1; scriptDone _missionRunning};
	
	sleep MissionDelay;
};