#include "..\..\script_macros.hpp"
/*
    File: fn_safeTakeDrugStash.sqf
*/
private ["_ctrl","_num","_safeInfo"];
disableSerialization;



if ((lbCurSel 9999) isEqualTo -1) exitWith {hint localize "STR_Civ_SelectItem";};
_ctrl = CONTROL_DATA(9999);
_num = ctrlText 9992;
_safeInfo = drugs_stash getVariable ["seized_drugs_array",0];

//Error checks
if (!([_num] call TON_fnc_isnumber)) exitWith {hint localize "STR_MISC_WrongNumFormat";};
_num = parseNumber(_num);
if (count (drugs_stash getVariable ["seized_drugs_array",[]]) isEqualTo 0) exitWith {hint localize "STR_Civ_VaultEmpty";};

//Secondary checks
_num = [_ctrl,_num,life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
if (_num isEqualTo 0) exitWith {hint localize "STR_NOTF_InvFull"};


//Take it
if (!([true,_ctrl,_num] call life_fnc_handleInv)) exitWith {hint localize "STR_NOTF_CouldntAdd";};

diag_log format["drugs array %1 number %2 _ctrl %3",_safeInfo,_num,_ctrl ];

_exists = [seized_drugs, _ctrl, 0] call Zen_ArrayGetNestedIndex;

_item_index = seized_drugs select _exists;
_amount_index = _item_index select 1;

if (_num > _amount_index) exitWith {hint format [localize "STR_Civ_IsntEnoughGold",_num];};

_total_amount =  _amount_index - _num;;
_item_index set [1,_total_amount];




drugs_stash setVariable ["seized_drugs_array",seized_drugs,true];
[drugs_stash] call life_fnc_safeInventoryDrugsStash;
