// =========================================================================================================
//  Author: Rob
// =========================================================================================================

spawn_ai = {

	diag_log "================  AI Spawn Start =======================";

    params ["_markerName", "_snipers","_at","_aa","_spotters"];
	
	_markerPos = getMarkerPos _markerName;
	_markerSize =  getMarkerSize _markerName;

	_units = [];
	_grp = createGroup independent;
	_grp allowFleeing 0;
	_grp setBehaviour "COMBAT";
	_grp setCombatMode "RED";
	
	for [{_i=0},{_i!=_snipers},{_i=_i+1}] do {
	
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
			
	};
	
	for [{_i=0},{_i!=_at},{_i=_i+1}] do {
	
		_unit = _grp createUnit ["O_Soldier_AT_F",_markerPos,[],15,"NONE"];
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
		
		_unit addWeapon "arifle_Katiba_C_ACO_pointer_F";
		_unit addMagazine "30Rnd_65x39_caseless_green";
		_unit addMagazine "30Rnd_65x39_caseless_green";
		_unit addMagazine "30Rnd_65x39_caseless_green";
		
		_unit addWeapon "launch_B_Titan_short_F";
		_unit addMagazine "Titan_AT";
		_unit addMagazine "Titan_AT";
		
		
	
	};
	
	for [{_i=0},{_i!=_aa},{_i=_i+1}] do {
	
		_unit = _grp createUnit ["O_Soldier_AA_F",_markerPos,[],15,"NONE"];
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
		
		_unit addWeapon "arifle_Katiba_C_ACO_pointer_F";
		_unit addMagazine "30Rnd_65x39_caseless_green";
		_unit addMagazine "30Rnd_65x39_caseless_green";
		_unit addMagazine "30Rnd_65x39_caseless_green";
		
		_unit addWeapon "launch_B_Titan_F";
		_unit addMagazine "Titan_AA";
		_unit addMagazine "Titan_AA";
		
		
	
	};
	
	for [{_i=0},{_i!=_spotters},{_i=_i+1}] do {
	
		_unit = _grp createUnit ["O_spotter_F",_markerPos,[],15,"NONE"];
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
			
	};

	_timeStamp = diag_tickTime;

	diag_log format ["================  AI Spawn Finish %1 =======================",(diag_tickTime) - _timeStamp];
	
};

//PARAMS "_markerName", "_snipers","_at","_aa","_spotters"

["ai_military_base",10,2,2,2] call spawn_ai;
["ai_drugs_stash",10,2,2,2] call spawn_ai;