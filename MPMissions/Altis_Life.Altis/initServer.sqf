/*
    File: initServer.sqf
    Author:

    Description:
    Starts the initialization of the server.
*/
if (!(_this select 0)) exitWith {}; //Not server
[] call compile preprocessFileLineNumbers "\life_server\init.sqf";

diag_log "--------------- TON_fnc_updateMarketPrices ------------------";

[] remoteExecCall ["TON_fnc_updateMarketPrices",0];
