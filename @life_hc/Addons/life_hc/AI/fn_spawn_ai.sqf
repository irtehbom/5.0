// =========================================================================================================
//  Author: Rob
// =========================================================================================================

spawn_ai = {

	diag_log "================  AI Spawn Start =======================";

    params ["_markerName", "_maxUnits"];
	
	_markerPos = getMarkerPos _markerName;
	_markerSize =  getMarkerSize _markerName;


	independent setFriend [west , 1]; 
	_units = [];
	_grp = createGroup independent;
	_grp allowFleeing 0;
	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	for [{_i=0},{_i!=_maxUnits},{_i=_i+1}] do {
			_unit = _grp createUnit ["O_sniper_F",_markerPos,[],15,"NONE"];
			[_unit] join _grp;
			removeAllWeapons _unit;
			_unit setSkill ["aimingAccuracy",1];
			_unit setSkill ["aimingShake",1];
			_unit setSkill ["aimingSpeed",1];
			_unit setSkill ["endurance",1];
			_unit setSkill ["spotDistance",1];
			_unit setSkill ["spotTime",1];
			_unit setSkill ["courage",1];
			_unit setSkill ["reloadSpeed",1];
			_unit setSkill ["commanding",1];
			_unit setSkill ["general",1];
			_unit addWeapon "srifle_EBR_SOS_F";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
			_unit addMagazine "20Rnd_762x51_Mag";
	};

	//Kill civilians trigger

	triggerDelay = true;

	_trg = createTrigger ["EmptyDetector", _markerPos, true];
	_trg setTriggerArea [_markerSize select 0, 1200, 0, false];
	_trg setTriggerActivation ["ANY", "PRESENT", true];
	_condition = "this && triggerDelay";
	_activate = "{ 
	if (side _x == civilian && rating _x >= 0)then { _x addRating -999999999999999999999999; };} forEach (thisList); [] spawn { sleep 2; triggerDelay = false; };";
	_deactivate = "[] spawn { sleep 2; triggerDelay = true; };";
	_trg setTriggerStatements [_condition, _activate, _deactivate];
	
	_timeStamp = diag_tickTime;

	diag_log format ["================  AI Spawn Finish %1 =======================",(diag_tickTime) - _timeStamp];
	
};

["ai_danger",10] call spawn_ai;