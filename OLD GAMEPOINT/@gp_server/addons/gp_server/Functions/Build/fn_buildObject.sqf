private["_player","_target","_amount","_index","_data","_name","_gangName"];
_owner = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_objectType = [_this,1,"",[""]] call BIS_fnc_param;
_position = [_this,2,"",[""]] call BIS_fnc_param;
_object = [_this,3,ObjNull,[ObjNull]] call BIS_fnc_param;

_group = group _owner;
_owner = owner _owner;
_gangID = _group getVariable["gangId", -1];

_query = format["INSERT INTO build (gangID, objectType, position, damage, inventory) VALUES(%1, '%2', '%3', '%4', '""[]""')", _gangID, _objectType, _position, "0"];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;


_query = format["SELECT objectID FROM build WHERE gangID = %1 AND objectType = '%2' AND position = '%3' AND damage = 0", _gangID, _objectType, _position];
waitUntil {!DB_Async_Active};
_queryResult = [_query,2] call DB_fnc_asyncCall;


_object setVariable["objectID", _queryResult select 0, true];

[[[], _object], "life_fnc_buildActions", units _group, false] spawn life_fnc_MP;