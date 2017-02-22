/*
    File Name: fn_handlec4.sqf
*/
private ["_bomb","_time"];
_time = time + (7 * 60);
waitUntil{(round(_time - time) < 1)};
sleep 0.9;
if (!(oil_rig getVariable["chargeplaced",false])) exitWith {};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL oil_rig select 0, getPosATL oil_rig select 1, (getPosATL oil_rig select 2)+0.5];
oil_rig setVariable ["chargeplaced",false,true];
oil_rig setVariable ["safe_open",true,true];
