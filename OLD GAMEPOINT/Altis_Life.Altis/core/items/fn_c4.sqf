private["_vault","_handle"];
_vault = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _vault) exitWith {}; //Bad object
if(typeOf _vault != "Land_CargoBox_V1_F") exitWith {hint localize "STR_ISTR_Blast_VaultOnly"};
if(_vault getVariable["c4placed",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyPlaced"};
if(_vault getVariable["oil_opened",false]) exitWith {hint localize "STR_ISTR_Blast_AlreadyOpen"};
if(!([false,"c4",1] call life_fnc_handleInv)) exitWith {}; //Error?
if( ( lastRobbed  != 0 ) && time >= (time - lastRobbed + 3600) ) exitWith {hint "This location has already been robbed recently"};

_vault setVariable["c4placed",true,true];
lastRobbed = time;
hint localize "STR_ISTR_Blast_KeepOff";
[[[1,2],"Someone has placed a bomb on the Oilrig vault",true,[]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
_handle = [] spawn life_fnc_c4Timer;

waitUntil {scriptDone _handle};
sleep 0.9;
if(!(oil_rig getVariable["c4placed",false])) exitWith {hint localize "STR_ISTR_Blast_Disarmed"};

_bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPos oil_rig select 0, getPos oil_rig select 1, (getPos oil_rig select 2)+15.5];
oil_rig setVariable["c4placed",false,true];
oil_rig setVariable["oil_opened",true,true];

hint localize "STR_ISTR_Blast_Opened";