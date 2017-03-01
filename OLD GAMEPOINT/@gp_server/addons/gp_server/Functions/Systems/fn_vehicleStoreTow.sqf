private["_vehicle","_impound","_vInfo","_vInfo","_plate","_uid","_query","_sql","_unit"];
_vehicle = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_impound = [_this,1,false,[true]] call BIS_fnc_param;

if(isNull _vehicle) exitWith {life_impound_inuse = false; life_garage_store = false;}; //Bad data passed.

_vInfo = _vehicle getVariable["dbInfo",[]];
if(count _vInfo > 0) then
{
	_plate = _vInfo select 1;
	_uid = _vInfo select 0;
};

if(_impound) then
{
	if(count _vInfo == 0) then 
	{
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	} 
		else
	{
		_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
		waitUntil {!DB_Async_Active};
		_thread = [_query,1] call DB_fnc_asyncCall;
		//waitUntil {scriptDone _thread};
		if(!isNil "_vehicle" && {!isNull _vehicle}) then {
			deleteVehicle _vehicle;
		};
	};
}
	else
{
	if(count _vInfo == 0) exitWith
	{
		life_garage_store = false;
	};
	
	_query = format["UPDATE vehicles SET active='0' WHERE pid='%1' AND plate='%2'",_uid,_plate];
	waitUntil {!DB_Async_Active};
	_thread = [_query,1] call DB_fnc_asyncCall;
	//waitUntil {scriptDone _thread};
	if(!isNil "_vehicle" && {!isNull _vehicle}) then {
		deleteVehicle _vehicle;
	};
	life_garage_store = false;
};