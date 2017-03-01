private[];
disableSerialization;

_playerGangId = (group player) getVariable["gangId", -1];
_rank = player getVariable["gangRank", -1];
if (_rank == -1) exitWith {};
_rankConfig = [_rank] call life_fnc_gangGetRank;
if (!(_rankConfig select 6)) exitWith { hint "You are not allowed to remove items from the gang plot."; };

_objects = nearestObjects[player, ["Static", "Thing"], life_build_plot_radius];
_object = ObjNull;
{
	if (typeOf _x != life_build_plot_pole) exitWith { _object = _x; };
} forEach _objects;

if (isNull _object) exitWith {};


life_build_active = true;
life_build_active_object = _object;
life_build_active_object setVariable["removing", true];

// Determine object type.
_config = [typeOf _object] call build_getObject;

5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",format["Removing %1", _config select 0]];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

life_build_progress = true;
while {true} do
{
	if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
		//[[player,"AinvPknlMstpSnonWnonDnon_medic_1"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
	};
	sleep 0.1;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + 0.01;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",format["Removing %1", _config select 0]];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith { life_build_active = false; }; //Tazed
	if(life_interrupted) exitWith { life_build_active = false; life_interrupted = false; };
	if((player getVariable["restrained",false])) exitWith { life_build_active = false; };
	if (!life_build_active) exitWith {};
};
5 cutText ["","PLAIN"];
player playActionNow "stop";
life_build_progress = false;

if (!life_build_active) exitWith {}; // Cancelled

_objectId = _object getVariable["objectID", -1];

if (round(random(10)) <= 2 || (_config select 2) >= 1000000) then { // 20% chance to return object after removing
	[true, "build_" + (_config select 1), 1] call life_fnc_handleInv;
	hint format["The item %1 has been successfully retrieved!", _config select 0];
};

deleteVehicle _object;
[[_objectId], "life_fnc_buildRemoveRequest", false, false] spawn life_fnc_MP;

[] call life_fnc_buildCleanup;