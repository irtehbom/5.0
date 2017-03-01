/*
	File: fn_requestMedic.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	N/A
*/
private["_medicsOnline"];
_medicsOnline = {_x != player && {side _x == independent} && {alive _x}} count playableUnits > 0; //Check if medics (indep) are in the room.

diag_log "1";
if(_medicsOnline) then {
	//There is medics let's send them the request.
	[[life_corpse,profileName],"life_fnc_medicRequest",independent,FALSE] spawn life_fnc_MP;
} else {
	//No medics were online, send it to the police.
	[[life_corpse,profileName],"life_fnc_copMedicRequest",west,FALSE] spawn life_fnc_MP;
};
diag_log "2";
//if (_medicsOnline) then {
	player spawn
	{
		private["_maxTime","_RespawnBtn","_Timer"];
		disableSerialization;
		_RespawnBtn = ((findDisplay 7300) displayCtrl 7302);
		_Timer = ((findDisplay 7300) displayCtrl 7301);
		
		if (ctrlEnabled _RespawnBtn) then {
		
			_maxTime = time + (life_respawn_timer * 60) + 120;
			_RespawnBtn ctrlEnable false;
			waitUntil {
				_Timer ctrlSetText format[localize "STR_Medic_Respawn",[(_maxTime - time),"MM:SS.MS"] call BIS_fnc_secondsToString];
				round(_maxTime - time) <= 0 OR isNull _this
			};
			_RespawnBtn ctrlEnable true;
			_Timer ctrlSetText localize "STR_Medic_Respawn_2";
		} else {
			life_medic_requested = 120;
		};
	};
//};
//Create a thread to monitor duration since last request (prevent spammage).
[] spawn 
{
	((findDisplay 7300) displayCtrl 7303) ctrlEnable false;
	sleep (4 * 60);
	((findDisplay 7300) displayCtrl 7303) ctrlEnable true;
};