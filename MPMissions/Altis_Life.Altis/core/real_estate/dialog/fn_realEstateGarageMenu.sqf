#include <macro.h>
/*
Creates the real estate garage menu
*/
private["_display"];

#define Btn1 14001
#define Btn2 14002

disableSerialization;
createDialog "real_estate_garage_menu";

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; 


_display = findDisplay 14000;

_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;

_Btn1 ctrlShow false;
_Btn2 ctrlShow false;

life_pInact_curTarget = _curTarget;

if(((_curTarget getVariable "garage_owned") select 0) == (getPlayerUID player)) then {

_Btn1 ctrlSetText "Car Garage";
_Btn1 buttonSetAction "[life_pInact_curTarget,""Car""] spawn life_fnc_vehicleGarage; closeDialog 0;";
_Btn1 ctrlShow true;


_Btn2 ctrlSetText "Store Vehicle";
_Btn2 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
_Btn2 ctrlShow true;

};
/*
calize"STR_Garage_Title",  {   if (life_HC_isActive) then { 
[getPlayerUID player,playerSide,"Air",player] remoteExecCall ["HC_fnc_getVehicles",HC_Life];
 } else { [getPlayerUID player,playerSide,"Air",player] remoteExecCall ["TON_fnc_getVehicles",2];
 }; life_garage_type = "Air"; createDialog "Life_impound_menu";
 disableSerialization;  ctrlSetText[2802,"Fetching Vehicles...."];
 life_garage_sp = "air_g_1"; }];
 this addAction[localize"STR_MAR_Store_vehicle_in_Garage",life_fnc_storeVehicle,"",0,false,false,"",'!life_garage_store'];
 
 
 */

if(((_curTarget getVariable "heli_owned") select 0) == (getPlayerUID player)) then {

_Btn1 ctrlSetText "Air Garage";
_Btn1 buttonSetAction "[life_pInact_curTarget,""Air""] spawn life_fnc_vehicleGarage; closeDialog 0;"; 
_Btn1 ctrlShow true;


_Btn2 ctrlSetText "Store Vehicle";
_Btn2 buttonSetAction "[life_pInact_curTarget,player] spawn life_fnc_storeVehicle; closeDialog 0;";
_Btn2 ctrlShow true;

};

