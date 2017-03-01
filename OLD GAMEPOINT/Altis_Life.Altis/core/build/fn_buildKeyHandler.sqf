private[];
disableSerialization;
_code = [_this,0,0,[0]] call BIS_fnc_param;
_shift = [_this,1,false,[false]] call BIS_fnc_param;
_ctrl = [_this,2,false,[false]] call BIS_fnc_param;
_alt = [_this,3,false,[false]] call BIS_fnc_param;

if (life_build_progress && _code != 1) exitWith {};

switch (_code) do
{
	case 16: // Q
	{
		if (_ctrl) then {
			[-1] call life_fnc_buildTransform;
		} else {
			if (_alt) then {
				[-20] call life_fnc_buildTransform;
			} else {
				[-10] call life_fnc_buildTransform;
			};
		};
	};
	
	case 34: // G
	{
		[1] call life_fnc_buildSettings;
	};
	
	case 18: // E
	{
		if (_ctrl) then {
			[1] call life_fnc_buildTransform;
		} else {
			if (_alt) then {
				[20] call life_fnc_buildTransform;
			} else {
				[10] call life_fnc_buildTransform;
			};
		};
	};
	
	case 201: // Page Up
	{
		if (_ctrl) then 
		{
			// Ctrl held down: precision
			[0, 0, 0, 0.01] spawn life_fnc_buildTransform;
		} else {
			if (_alt) then
			{
				// Alt held down: skip far
				[0, 0, 0, 0.3] spawn life_fnc_buildTransform;
			} else { // Default
				[0, 0, 0, 0.1] spawn life_fnc_buildTransform;
			};
		};
	};
	
	case 209: // Page Down
	{
		if (_ctrl) then 
		{
			// Ctrl held down: precision
			[0, 0, 0, -0.01] spawn life_fnc_buildTransform;
		} else {
			if (_alt) then
			{
				// Alt held down: skip far
				[0, 0, 0, -0.3] spawn life_fnc_buildTransform;
			} else { // Default
				[0, 0, 0, -0.1] spawn life_fnc_buildTransform;
			};
		};
	};
	
	case 57: // Space
	{
		[] spawn life_fnc_buildComplete;
	};
	
	case 33: // F
	{
		if (isNull attachedTo life_build_active_object) then {
			// Not attached to anything. Reattach
			_offset = life_build_active_object getVariable["attachOffset", [0,3,0]];
			life_build_active_object attachTo[player, _offset];
		} else {
			detach life_build_active_object;
		};
	};
	
	case 1: // Esc
	{
		[] spawn life_fnc_buildCancel;
	};
	
	case 211: // Delete
	{
		[] spawn life_fnc_buildCancel;
	};
	
	// Other camera modelToWorld
	case 17: // W
	{
		_camera = life_build_active_object getVariable["camera", ObjNull];
		if (!isNull _camera) then {
			if (_ctrl) then 
			{
				// Ctrl held down: precision
				[0, 0.5, 0, 0] spawn life_fnc_buildTransform;
			} else {
				if (_alt) then
				{
					// Alt held down: skip far
					[0, 5, 0, 0] spawn life_fnc_buildTransform;
				} else { // Default
					[0, 1, 0, 0] spawn life_fnc_buildTransform;
				};
			};
		};
	};
	
	case 31: // S
	{
		_camera = life_build_active_object getVariable["camera", ObjNull];
		if (!isNull _camera) then {
			if (_ctrl) then 
			{
				// Ctrl held down: precision
				[0, -0.5, 0, 0] spawn life_fnc_buildTransform;
			} else {
				if (_alt) then
				{
					// Alt held down: skip far
					[0, -5, 0, 0] spawn life_fnc_buildTransform;
				} else { // Default
					[0, -1, 0, 0] spawn life_fnc_buildTransform;
				};
			};
		};
	};
	
	case 32: // D
	{
		_camera = life_build_active_object getVariable["camera", ObjNull];
		if (!isNull _camera) then {
			if (_ctrl) then 
			{
				// Ctrl held down: precision
				[0, 0, 0.5, 0] spawn life_fnc_buildTransform;
			} else {
				if (_alt) then
				{
					// Alt held down: skip far
					[0, 0, 5, 0] spawn life_fnc_buildTransform;
				} else { // Default
					[0, 0, 1, 0] spawn life_fnc_buildTransform;
				};
			};
		};
	};
	
	case 30: // A
	{
		_camera = life_build_active_object getVariable["camera", ObjNull];
		if (!isNull _camera) then {
			if (_ctrl) then 
			{
				// Ctrl held down: precision
				[0, 0, -0.5, 0] spawn life_fnc_buildTransform;
			} else {
				if (_alt) then
				{
					// Alt held down: skip far
					[0, 0, -5, 0] spawn life_fnc_buildTransform;
				} else { // Default
					[0, 0, -1, 0] spawn life_fnc_buildTransform;
				};
			};
		};
	};
};