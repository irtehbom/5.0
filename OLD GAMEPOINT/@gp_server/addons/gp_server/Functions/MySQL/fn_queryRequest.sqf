/*
	File: fn_queryRequest.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles the incoming request and sends an asynchronous query 
	request to the database.
	
	Return:
	ARRAY - If array has 0 elements it should be handled as an error in client-side files.
	STRING - The request had invalid handles or an unknown error and is logged to the RPT.
*/
private["_uid","_side","_query","_return","_queryResult","_qResult","_handler","_thread","_tickTime","_loops","_returnCount"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[civilian]] call BIS_fnc_param;
_ownerID = [_this,2,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

/*
	_returnCount is the count of entries we are expecting back from the async call.
	The other part is well the SQL statement.
*/
_query = switch(_side) do {
	case west: {_returnCount = 15; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, cop_licenses, coplevel, cop_gear, blacklist, level, experience, skillpoints, skills FROM players WHERE playerid='%1'",_uid];};
	case civilian: {_returnCount = 15; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, civ_licenses, arrested, civ_gear, aff_whitelist, court_whitelist, level, experience, skillpoints, skills, introran FROM players WHERE playerid='%1'",_uid];};
	case independent: {_returnCount = 13; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, med_licenses, mediclevel, med_gear, level, experience, skillpoints, skills FROM players WHERE playerid='%1'",_uid];};
	case east: {_returnCount = 13; format["SELECT playerid, name, cash, bankacc, adminlevel, donatorlvl, east_licenses, arrested, east_gear, pmc_whitelist, level, experience, skillpoints, skills FROM players WHERE playerid='%1'",_uid];};
};

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Client Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

if(typeName _queryResult == "STRING") exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

if(count _queryResult == 0) exitWith {
	[[],"SOCK_fnc_insertPlayerInfo",_ownerID,false,true] spawn life_fnc_MP;
};

//Blah conversion thing from a2net->extdb
private["_tmp"];
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do
{
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if(typeName _new == "STRING") then {_new = call compile format["%1", _new];};
_queryResult set[8,_new];
//Parse data for specific side.
switch (_side) do {
	case west: {
		_queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];
		realEstateData = _uid spawn TON_fnc_fetchRealEstate;
		waitUntil {scriptDone realEstateData};
		_queryResult pushBack (missionNamespace getVariable[format["realEstate_%1",_uid],[]]);
	};
	
	case civilian: {
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		houseData = _uid spawn TON_fnc_fetchPlayerHouses;
		waitUntil {scriptDone houseData};
		_queryResult pushBack (missionNamespace getVariable[format["houses_%1",_uid],[]]);
		realEstateData = _uid spawn TON_fnc_fetchRealEstate;
		waitUntil {scriptDone realEstateData};
		_queryResult pushBack (missionNamespace getVariable[format["realEstate_%1",_uid],[]]);
	};
	case east: {
		_queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];
		};
};

_keyArr = missionNamespace getVariable [format["%1_KEYS_%2",_uid,_side],[]];
_queryResult set[18,_keyArr];
/*
diag_log format["Serv: Shit: %1", _queryResult];
diag_log format["Serv: 0: %1", _queryResult select 0];
diag_log format["Serv: 1: %1", _queryResult select 1];
diag_log format["Serv: 2: %1", _queryResult select 2];
diag_log format["Serv: 3: %1", _queryResult select 3];
diag_log format["Serv: 4: %1", _queryResult select 4];
diag_log format["Serv: 5: %1", _queryResult select 5];
diag_log format["Serv: 6: %1", _queryResult select 6];
diag_log format["Serv: 7: %1", _queryResult select 7];
diag_log format["Serv: 8: %1", _queryResult select 8];
diag_log format["Serv: 9: %1", _queryResult select 9];
diag_log format["Serv: 10: %1", _queryResult select 10];
diag_log format["Serv: 11: %1", _queryResult select 11];
diag_log format["Serv: 12: %1", _queryResult select 12];
diag_log format["Serv: 13: %1", _queryResult select 13];
diag_log format["Serv: 14: %1", _queryResult select 14];
diag_log format["Serv: 15: %1", _queryResult select 15];
diag_log format["Serv: 16: %1", _queryResult select 16];
diag_log format["Serv: 17: %1", _queryResult select 17];
diag_log format["Serv: 18: %1", _queryResult select 18];
diag_log "===================================================";
*/

[_queryResult,"SOCK_fnc_requestReceived",_ownerID,false] spawn life_fnc_MP;