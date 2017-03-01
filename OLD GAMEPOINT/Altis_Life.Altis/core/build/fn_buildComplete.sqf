private[];
disableSerialization;

if (!life_build_active) exitWith {};
if (life_build_active_object == ObjNull) exitWith {};


_currentPos = getPosATL life_build_active_object;
detach life_build_active_object;


_snapToGround = life_build_active_object getVariable["snapToGround", false];

if (_snapToGround) then {
	life_build_active_object setPos[(getPos life_build_active_object select 0), (getPos life_build_active_object select 1), 0];
} else {
	life_build_active_object setPosATL _currentPos;
	life_build_active_object setVectorUp [0, 0, 1];
};


if (isOnRoad [_currentPos select 0, _currentPos select 1, 0]) exitWith {
	hint "You cannot build on roads.";
	deleteVehicle life_build_active_object;
	[] call life_fnc_buildCleanup;
};

_config = [life_build_active_object getVariable["config", ""]] call build_getObject;

5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",format["Building %1", _config select 0]];
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
	
	_cpRate = 0.01;
	_skillRank = [player, 109] call life_fnc_xpSkillRank; // Overseer
	if (_skillRank > 0) then {
		_cpRate = _cpRate * (1 + _skillRank / 10);
	};
	
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",format["Building %1", _config select 0]];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith { life_build_active = false; }; //Tazed
	if(life_interrupted) exitWith { life_build_active = false; life_interrupted = false; };
	if((player getVariable["restrained",false])) exitWith { life_build_active = false; };
	if (!life_build_active) exitWith {};
};

player removeEventHandler["AnimDone", 0];
5 cutText ["","PLAIN"];
player playActionNow "stop";
life_build_progress = false;

if (!life_build_active) exitWith{ [] call life_fnc_hudUpdate; };

// Re-enable collision
_collisionObjects = life_build_active_object getVariable["collision", []];
{
	life_build_active_object enableCollisionWith _x;
} forEach _collisionObjects;

// Remove item from virt inv
[false, "build_" + (_config select 1), 1] call life_fnc_handleInv;

// Save our objects position and direction in the following format [dir, [x, y, z]]
_posArray = [getDir life_build_active_object, getPosATL life_build_active_object];
[[player, _config select 1, str(_posArray), life_build_active_object],"life_fnc_buildObject",false,false] spawn life_fnc_MP;

if (_config select 1 == life_build_plot_pole) then {

	// Just placed a plotpole. Let's create a boundary.
	[life_build_active_object] call life_fnc_buildToggleBoundary;
} else {
	if ((_config select 1) in life_build_storage_crates) then {
		// Clear out placed storage crates
		clearWeaponCargoGlobal life_build_active_object;
		clearMagazineCargoGlobal life_build_active_object;
		clearItemCargoGlobal life_build_active_object;
		clearBackpackCargoGlobal life_build_active_object;
	};
};

//[[], life_build_active_object] call life_fnc_buildActions;

[] call life_fnc_buildCleanup;