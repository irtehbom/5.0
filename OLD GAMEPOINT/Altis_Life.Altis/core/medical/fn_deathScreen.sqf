/*
	File: fn_deathScreen.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles stuff being displayed on the death screen while
	it is currently active.
*/
private["_medicsOnline","_medicsNear"];
disableSerialization;

_medicsOnline = ((findDisplay 7300) displayCtrl 7304);
_medicsNear = ((findDisplay 7300) displayCtrl 7305);

_initialPos = getPosATL player;

waitUntil {
	_medicsOnlineCount = [independent] call life_fnc_playerCount;
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",_medicsOnlineCount];
	/*_nearby = if(([independent,getPosATL player,120] call life_fnc_nearUnits)) then {"Yes"} else {"No"};
	_medicsOnline ctrlSetText format[localize "STR_Medic_Online",[independent] call life_fnc_playerCount];
	_medicsNear ctrlSetText format[localize "STR_Medic_Near",_nearby];*/
	
	
	if (_medicsOnlineCount > 0) then {
		_closest = ObjNull;
		{
			if (side _x == independent && _x != player) then {
				if (_closest == ObjNull || _initialPos distance _x < _initialPos distance _closest) then {
					_closest = _x;
				};
			};
		} forEach (playableUnits);
		
		_medicsNear ctrlSetText format["Closest medic is %1 meters away!", round(_initialPos distance _closest)];
	} else {
		_medicsNear ctrlSetText "No medics available.";
	};
	
	
	sleep 1;
	(isNull (findDisplay 7300))
};