// =========================================================================================================
//  Author: Rob
// =========================================================================================================

diag_log "================  AI Spawn Start =======================";
	
private["_markerPos"];

_markerName = _this select 0;
_snipers = _this select 1;
_at = _this select 2;
_aa = _this select 3;
_spotters = _this select 4;
_reward = false;


if (typename _markerName == 'STRING') then {
	_markerPos = getMarkerPos _markerName;
} else {
	_markerPos = _markerName;
};


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

{
	_x addEventHandler["Killed", { [_this select 0, _this select 1] call HC_fnc_clean_up_ai }];
} forEach (units _grp); 


diag_log format ["================  AI Spawn Finish %1 ======================="];

_grp;
