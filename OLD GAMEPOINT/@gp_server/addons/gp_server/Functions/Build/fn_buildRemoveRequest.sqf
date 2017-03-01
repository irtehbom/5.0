private["_player","_target","_amount","_index","_data","_name","_gangName"];
_objectId = [_this,0,-1,[0]] call BIS_fnc_param;


_query = format["DELETE FROM build where objectID = %1", _objectId];
waitUntil {!DB_Async_Active};
[_query,1] call DB_fnc_asyncCall;