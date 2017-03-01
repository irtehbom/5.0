/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Blasting charge is used for the federal reserve vault and nothing  more.. Yet.
*/
private["_vault","_handle"];
// If lastRobbed is Null set it to 0;
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_lastRobbed = missionNamespace getVariable ("lastRobbed");
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["chargeplaced",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["safe_open",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"blastingcharge",1] call life_fnc_handleInv)) exitWith {}; //Error?
if({side _x == west} count playableUnits < 6) exitWith {hint "There needs to be 6 or more cops online to continue."};
if( ( _lastRobbed  != 0 ) && time <= (time - _lastRobbed + 3600) ) exitWith {hint "This location has already been robbed recently"};
_vault setVariable["chargeplaced",true,true];
lastRobbed = time;
[[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
hint localize "STR_ISTR_Blast_KeepOff";
_handle = [] spawn life_fnc_demoChargeTimer;
[[],"life_fnc_demoChargeTimer",west,false] spawn life_fnc_MP;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(fed_bank getVariable["chargeplaced",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPosATL fed_bank select 0, getPosATL fed_bank select 1, (getPosATL fed_bank select 2)+0.5];
fed_bank setVariable["chargeplaced",false,true];
fed_bank setVariable["safe_open",true,true];

hint localize "STR_ISTR_Blast_Opened";