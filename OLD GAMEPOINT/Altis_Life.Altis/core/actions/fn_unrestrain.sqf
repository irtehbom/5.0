/*
	File: fn_unrestrain.sqf
*/
private["_unit"];
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _unit) exitWith {}; //Error check?
if(_unit getVariable["hostage",TRUE]) then {
	_unit setVariable["hostage",FALSE,TRUE];
	_unit setVariable["Escorting",FALSE,TRUE];
	_unit setVariable["transporting",FALSE,TRUE];
	detach _unit;
	player say3D "cuff"; 
	[[0,format["%1 was released by %2",name _unit, name player]],"life_fnc_broadcast",true,FALSE] call life_fnc_MP;
};
		
if(isNull _unit OR !(_unit getVariable["restrained",FALSE])) exitWith {}; //Error check?

_unit setVariable["restrained",FALSE,TRUE];
_unit setVariable["hostage",FALSE,TRUE];
_unit setVariable["Escorting",FALSE,TRUE];
_unit setVariable["transporting",FALSE,TRUE];
detach _unit;
player say3D "cuff"; 

[[0,format[localize "STR_NOTF_Unrestrain",_unit getVariable["realname",name _unit], profileName]],"life_fnc_broadcast",west,FALSE] call life_fnc_MP;