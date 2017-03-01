/*
Just delete it you prick tonic
*/

_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _house) exitWith {};

_houseID = _house getVariable["house_id",-1];
_query = format["DELETE FROM houses WHERE id='%1'",_houseID];
waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_house setVariable["house_sold",nil,true];
_house setVariable["house_owned",nil,true];

_radius = (((boundingBoxReal _house select 0) select 2) - ((boundingBoxReal _house select 1) select 2));
_containers = nearestObjects[(getPosATL _house),["Box_IND_Grenades_F","B_supplyCrate_F"],_radius];
{deleteVehicle _x} foreach _containers; //Fuck the way you do things Tonic, go fix it

waitUntil{!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;

_house setVariable["house_sold",nil,true];
