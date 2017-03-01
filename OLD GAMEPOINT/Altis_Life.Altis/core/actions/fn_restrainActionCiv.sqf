/*
	File: fn_restrainAction.sqf
	Author: Bryan "Tonic" Boardwine

	*Edit by Hoe.GMG.Crew

	Description:
	Retrains the target.
*/
private["_unit"];
_unit = cursorTarget;
if(isNull _unit) exitWith {}; //Not valid
if((_unit getVariable "hostage")) exitWith {};
//if(side _unit == west) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
//Broadcast!
player say3D "cuff"; 

_unit setVariable["hostage",TRUE,TRUE];
[[player], "life_fnc_restrainCiv", _unit, false] spawn life_fnc_MP;
[[0,format["!!!%1 has been taken hostage", _unit getVariable["realname", name _unit], player getVariable["realname",name player]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;


