// =========================================================================================================
//  Author: Rob
// =========================================================================================================

_markerPos = _this select 0;
_object = _this select 1;

_reward = true;

_grp = createGroup independent;
_grp allowFleeing 0;
_grp setBehaviour "SAFE";
_grp setCombatMode "BLUE";


_unit = _grp createUnit ["C_scientist_F",_markerPos,[],15,"NONE"];
_unit setPos (getPos _object) buildingPos 3;

[_unit] join _grp;
removeAllWeapons _unit;

_unit setVariable ["scientist",true,true];

_unit disableAI "MOVE";
_unit disableAI "COVER";

_unit addEventHandler["Killed", { [_this select 0, _this select 1] call HC_fnc_clean_up_ai }];

_unit;