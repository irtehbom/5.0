/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_upp","_ui","_progress","_pgText","_cP","_displayName"];
_veh = cursorTarget;
life_interrupted = false;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
	if("ToolKit" in (items player)) then
	{
		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format[localize "STR_NOTF_Repairing",_displayName];
		//Setup our progress bar.
		/*disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		_cPRate = 0.01;
		if (playerSide == east) then {
			_cPRate = 0.02;
		};
		
		while{true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
				[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};*
			
			sleep 0.27;
			_cP = _cP + _cPRate;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};*/
		
		_rate = 0.01;
		
		if (playerSide == east) then {
			_rate = 0.02;
		};
		
		_skillRank = [player, 501] call life_fnc_xpSkillRank; // Greasemonkey
		if (_skillRank > 0) then {
			_rate = _rate * (1 + _skillRank / 10);
		};
		
		//[_rate, _upp, true, "Acts_carFixingWheel"] call life_fnc_actionProgress;
		_var = [_rate, _upp] call life_fnc_actionProgress;
		if (!_var) then {
			if(player != vehicle player) exitWith {titleText[localize "STR_NOTF_RepairingInVehicle","PLAIN"];};
			_veh setDamage 0;
			
			if (playerSide == east) then {
				if (_veh getVariable["HATORequested", false]) then {
					hint "You've successfully repaired a vehicle for which a HATO mechanic was called. You've received a 20,000 dollar commission.";
					ftp_atmcash = ftp_atmcash + 20000;
					_veh setVariable["HATORequested", false, true];
					[[_veh], "life_fnc_eastCompleted", false, false] spawn life_fnc_MP;
					//[[11, player], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
				};
			} else {
				player removeItem "Toolkit";
				titleText[localize "STR_NOTF_RepairedVehicle","PLAIN"];
			//	[[12, player], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
			};
		};
	};
	
};