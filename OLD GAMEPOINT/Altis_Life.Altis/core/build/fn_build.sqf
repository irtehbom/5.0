private[];
_item = [_this,0,"",[""]] call BIS_fnc_param;

// Check for gang.
if ((group player) getVariable["gangId", -1] == -1) exitWith { hint "You are not in a gang."; };

_rank = player getVariable["gangRank", -1];
_rankConfig = [_rank] call life_fnc_gangGetRank;

if (!(_rankConfig select 6)) exitWith { hint "You are not high enough rank in the gang to be able to build on your gang plot."; };

_config = [_item] call build_getObject;

_placingPlotpole = false;
_outBail = false;
if (_config select 1 == life_build_plot_pole) then {
	_placingPlotpole = true;
	// Do some additional checks if we're placing a plotpole.
	_arr = nearestObjects[player, [_config select 1], life_build_plot_radius + life_build_plot_space_between];
	
	if (count _arr > 0) exitWith { hint format["There's already another plot pole in a %1m radius.", life_build_plot_radius + life_build_plot_space_between]; _outBail = true; };
	
	// Check if inside marker.
	_posPlayer = position player;
	_inBuildZone = false;
	{
		_inBuildZone = [_posPlayer, _x] call SHK_pos_fnc_isBlacklisted;
		if (_inBuildZone) exitWith{};
		
	} forEach life_build_areas;
	
	if (!_inBuildZone) then {
		hint "You are not in a build zone!";
		_outBail = true;
	};
};

if (_outBail) exitWith {};

_outBail = false;
if (!_placingPlotpole) then {
	// Check if there's a plotpole in the radius.
	_plotObject = [life_build_plot_pole] call build_getObject;
	_plotPolesNear = nearestObjects[player, [_plotObject select 1], life_build_plot_radius];
	if (count _plotPolesNear <= 0) exitWith { hint format["There are no plotpoles in a %1m radius.", life_build_plot_radius]; _outBail = true; };

	// Do some additional check to see if it's their gang a plotpole belongs to.
	_bail = true; // exitWith exits forLoops separately, so need a bool to see later if we need to bail.
	_gangPlotPole = ObjNull;
	{
		if (_x getVariable["gang", -1] == (group player) getVariable["gangId", -2]) exitWith { _bail = false; _gangPlotPole = _x; };
	} forEach _plotPolesNear;
	if (_bail) exitWith { hint format["There aren't any plotpoles in a %1m radius that belong to your gang.", life_build_plot_radius]; _outBail = true; };

	// Check limits!
	_count = count (nearestObjects[_gangPlotPole, ["Static", "Thing"], life_build_plot_radius + 20]) + 1;
	
	_c = life_build_plot_object_limit;
	_skillRank = [player, 110] call life_fnc_xpSkillRank; // Experience gain
	if (_skillRank > 0) then {
		_c = _c + (_skillRank * 2);
	};
	
	if (_count > _c) exitWith { hint format["This plot is at the object limit of % objects.", _c]; _outBail = true; };
};


if (_outBail) exitWith {};

2 cutRsc ["buildingHUD","PLAIN"];
// We're finally able to build
life_build_active = true;
_allowMoveDistance = 15;

_object = (_config select 1) createVehicle (position player);

if ((_config select 1) in life_build_storage_crates) then {
	clearItemCargoGlobal _object;
	clearWeaponCargoGlobal _object;
	clearMagazineCargoGlobal _object;
	clearBackpackCargoGlobal _object;
};

_attachPos = [0, 3, 0];

if (count _config >= 7) then {
	_attachPos = _config select 7;
};

_attachPos = [_attachPos select 0, _attachPos select 1, (_attachPos select 2) + 1];

_object attachTo[player, _attachPos];
life_build_active_object = _object;
_object setVariable["attachOffset", _attachPos];

_object setVariable["config", _config select 1];
_object setVariable["gang", (group player) getVariable["gangId", -1], true];

if (count _config >= 6) then {
	_object setDir (_config select 6);
};

_object enableSimulationGlobal false;

// Disable collision with all nearby stuff -.-
_nearestCollionObjects = nearestObjects[player, ["Man", "Car", "Air", "Ship"], life_build_plot_radius];
{
	_object disableCollisionWith _x;
} forEach _nearestCollionObjects;
_object setVariable["collision", _nearestCollionObjects];

if (count _config > 8) then {
	if (_config select 8) then {
		_allowMoveDistance = 30;
		
		if (daytime >= 21 || daytime <= 4.5) then {
			camUseNVG true;
		} else {
			camUseNVG false;
		};
		
		_z = 10;
		if (count _config > 9) then {
			_z = _z + (_config select 9);
		};
		
		_camera = "camera" camCreate [(position _object select 0) + 15, (position _object select 1) + 15, (position _object select 2) + _z];
		_camera cameraEffect ["external","back"];
		_camera camSetTarget _object;
		_camera camCommit 0;
		_object setVariable["camera", _camera];
	};
};

_originalPos = position _object;
_playerOriginalPos = position player;
waitUntil
{
	if (life_build_active_object distance _originalPos > _allowMoveDistance || player distance _playerOriginalPos > _allowMoveDistance) then {
		[true] call life_fnc_buildCancel;
	};
	sleep 1;
	
	!life_build_active;
};