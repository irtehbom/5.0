/*
Sells the estate
*/
private[];
_house = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _house) exitWith {};
_houseID = _house getVariable["house_id",-1];
_query = format["DELETE FROM realestate WHERE id='%1'",_houseID];
[_query,1] call HC_fnc_asyncCall;
_house setVariable["house_sold",nil,true];
_house setVariable["house_owned",nil,true];