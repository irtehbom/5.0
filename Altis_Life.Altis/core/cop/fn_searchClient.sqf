#include "..\..\script_macros.hpp"
/*
    File: fn_searchClient.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Searches the player and he returns information back to the player.
*/
private ["_inv","_val","_var","_robber"];
params [
    ["_cop",objNull,[objNull]]
];
if (isNull _cop) exitWith {};

_inv = [];
_robber = false;

//Illegal items
{
    _var = configName(_x);
    _val = ITEM_VALUE(_var);
    if (_val > 0) then {
        _inv pushBack [_var,_val];
		
	
		_exists = [seized_drugs, _var, 0] call Zen_ArrayGetNestedIndex;
		
		if (_exists == -1) then {
		
			seized_drugs pushBack [_var,_val];
			drugs_stash setVariable ["seized_drugs_array",seized_drugs,true];
			
		} else {
			
			_item_index = seized_drugs select _exists;
			_amount_index = _item_index select 1;
			_total_amount =  _amount_index + _val;;
			_item_index set [1,_total_amount];
			drugs_stash setVariable ["seized_drugs_array",seized_drugs,true];
		};
	
	
        [false,_var,_val] call life_fnc_handleInv;
    };
} forEach ("getNumber(_x >> 'illegal') isEqualTo 1" configClasses (missionConfigFile >> "VirtualItems"));

if (!life_use_atm) then  {
    CASH = 0;
    _robber = true;
};

[player,_inv,_robber] remoteExec ["life_fnc_copSearch",_cop];
