#include "\life_server\script_macros.hpp"
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
private ["_uid","_side","_query","_queryResult","_tickTime","_tmp"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_side = [_this,1,sideUnknown,[east]] call BIS_fnc_param;
_ownerID = [_this,2,objNull,[objNull]] call BIS_fnc_param;

if (isNull _ownerID) exitWith {};
_ownerID = owner _ownerID;

_query = switch (_side) do {
    // West - 11 entries returned
    case west: {format ["SELECT pid, name, cash, bankacc, adminlevel, donorlevel, cop_licenses, coplevel, cop_gear, blacklist, cop_stats, playtime FROM players WHERE pid='%1'",_uid];};
    // Civilian - 12 entries returned
    case east: {format ["SELECT pid, name, cash, bankacc, adminlevel, donorlevel, civ_licenses, arrested, civ_gear, civ_stats, civ_alive, civ_position, playtime FROM players WHERE pid='%1'",_uid];};
    // Independent - 10 entries returned
    case independent: {format ["SELECT pid, name, cash, bankacc, adminlevel, donorlevel, med_licenses, mediclevel, med_gear, med_stats, playtime FROM players WHERE pid='%1'",_uid];};
};

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

if (EXTDB_SETTING(getNumber,"DebugMode") isEqualTo 1) then {
    diag_log "------------- Client Query Request -------------";
    diag_log format ["QUERY: %1",_query];
    diag_log format ["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
    diag_log format ["Result: %1",_queryResult];
    diag_log "------------------------------------------------";
};

if (_queryResult isEqualType "") exitWith {
    [] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

if (count _queryResult isEqualTo 0) exitWith {
    [] remoteExecCall ["SOCK_fnc_insertPlayerInfo",_ownerID];
};

//Blah conversion thing from a2net->extdb
_tmp = _queryResult select 2;
_queryResult set[2,[_tmp] call DB_fnc_numberSafe];
_tmp = _queryResult select 3;
_queryResult set[3,[_tmp] call DB_fnc_numberSafe];

//Parse licenses (Always index 6)
_new = [(_queryResult select 6)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[6,_new];

//Convert tinyint to boolean
_old = _queryResult select 6;
for "_i" from 0 to (count _old)-1 do {
    _data = _old select _i;
    _old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};

_queryResult set[6,_old];

_new = [(_queryResult select 8)] call DB_fnc_mresToArray;
if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
_queryResult set[8,_new];
//Parse data for specific side.
switch (_side) do {
    case west: {
        _queryResult set[9,([_queryResult select 9,1] call DB_fnc_bool)];

        //Parse Stats
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[10,_new];

        //Playtime
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _index = TON_fnc_playtime_values_request find [_uid, _new];
        if (_index != -1) then {
            TON_fnc_playtime_values_request set[_index,-1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        };
        [_uid,_new select 0] call TON_fnc_setPlayTime;
		
		realEstateData = _uid spawn TON_fnc_fetchRealEstate;
		waitUntil {scriptDone realEstateData};
		_queryResult pushBack (missionNamespace getVariable[format["realEstate_%1",_uid],[]]);
		
    };

    case east: {
        _queryResult set[7,([_queryResult select 7,1] call DB_fnc_bool)];

        //Parse Stats
        _new = [(_queryResult select 9)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[9,_new];

        //Position
        _queryResult set[10,([_queryResult select 10,1] call DB_fnc_bool)];
        _new = [(_queryResult select 11)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[11,_new];

        //Playtime
        _new = [(_queryResult select 12)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _index = TON_fnc_playtime_values_request find [_uid, _new];
        if (_index != -1) then {
            TON_fnc_playtime_values_request set[_index,-1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        };
        [_uid,_new select 2] call TON_fnc_setPlayTime;

        /* Make sure nothing else is added under here */
        _houseData = _uid spawn TON_fnc_fetchPlayerHouses;
        waitUntil {scriptDone _houseData};
        _queryResult pushBack (missionNamespace getVariable [format ["houses_%1",_uid],[]]);
        _gangData = _uid spawn TON_fnc_queryPlayerGang;
        waitUntil{scriptDone _gangData};
        _queryResult pushBack (missionNamespace getVariable [format ["gang_%1",_uid],[]]);
		

		realEstateData = _uid spawn TON_fnc_fetchRealEstate;
		waitUntil {scriptDone realEstateData};
		_queryResult pushBack (missionNamespace getVariable[format["realEstate_%1",_uid],[]]);
		
		
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
diag_log "===================================================";

    };

    case independent: {
        //Parse Stats
        _new = [(_queryResult select 9)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _queryResult set[9,_new];

        //Playtime
        _new = [(_queryResult select 10)] call DB_fnc_mresToArray;
        if (_new isEqualType "") then {_new = call compile format ["%1", _new];};
        _index = TON_fnc_playtime_values_request find [_uid, _new];
        if !(_index isEqualTo -1) then {
            TON_fnc_playtime_values_request set[_index,-1];
            TON_fnc_playtime_values_request = TON_fnc_playtime_values_request - [-1];
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        } else {
            TON_fnc_playtime_values_request pushBack [_uid, _new];
        };
        [_uid,_new select 1] call TON_fnc_setPlayTime;
    };
};

publicVariable "TON_fnc_playtime_values_request";

_keyArr = missionNamespace getVariable [format ["%1_KEYS_%2",_uid,_side],[]];
_queryResult pushBack _keyArr;

_queryResult remoteExec ["SOCK_fnc_requestReceived",_ownerID];
