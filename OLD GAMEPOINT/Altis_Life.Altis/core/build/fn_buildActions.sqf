private[];

// Combined script with multiple options
_pos = [_this, 0, [], [[]]] call BIS_fnc_param;
_object = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;

if (count _pos == 0 && isNull _object) exitWith { life_session_completed = true; };

_objects = [];
if (count _pos > 0) then {
	_objects = nearestObjects[_pos, life_build_actionable_objects, life_build_plot_radius];
	
	life_build_spawnpoints = nearestObjects[_pos, [life_build_spawnpoint], life_build_plot_radius];
	life_session_completed = true;
	
	_marker = createMarkerLocal ["gangBase", _pos];
	_marker setMarkerColorLocal "ColorBlue";
	_marker setMarkerTextLocal "Gang base";
	_marker setMarkerTypeLocal "mil_flag";
} else {
	if (!isNull _object) then {
		_objects = [_object];
	};
};


{
	if (typeOf _x in (call life_build_garages)) then {
		_x addAction["Vehicle Garage", {
			_nearestSpawns = nearestObjects[_this select 0, [life_build_garage_spawn], life_build_plot_radius];
			if (count _nearestSpawns == 0) then {
				hint "This garage has no spawn nearby. Place a 'Garage spawn' within your plot.";
			} else {
				_pos = getPos (_nearestSpawns select 0);
				_dir = getDir (_nearestSpawns select 0);
				[[getPlayerUID player,playerSide,"Car",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
				life_garage_type = "Car";
				createDialog "Life_impound_menu";
				disableSerialization;
				ctrlSetText[2802,"Fetching Vehicles...."];
				life_garage_sp = [_pos, _dir];
			};
		}];
		_x addAction["Air Vehicle Garage", {
			_nearestSpawns = nearestObjects[_this select 0, [life_build_garage_chopper_spawn], life_build_plot_radius];
			if (count _nearestSpawns == 0) then {
				hint "This garage has no spawn nearby. Place a 'Garage spawn' within your plot.";
			} else {
				_pos = getPos (_nearestSpawns select 0);
				_pos set[2, (_pos select 2) + 3];
				_dir = getDir (_nearestSpawns select 0);
				[[getPlayerUID player,playerSide,"Air",player],"TON_fnc_getVehicles",false,false] spawn life_fnc_MP;
				life_garage_type = "Air";
				createDialog "Life_impound_menu";
				disableSerialization;
				ctrlSetText[2802,"Fetching Vehicles...."];
				life_garage_sp = [_pos, _dir];
			};
		}];
		_x addAction["Store vehicle in Garage", life_fnc_storeVehicle, "", 0, false, false, "", ' !life_garage_store '];
	} else {
		if (typeOf _x in (call life_build_lockable_objects)) then {
			_x addAction["Lock", { [_this select 0] call life_fnc_buildLock; }, nil, 0, false, false, "", " (_target getVariable[""bis_disabled_Door_1"", 0]) == 0 "];
			_x addAction["Unlock", { [_this select 0] call life_fnc_buildLock; }, nil, 0, false, false, "", " (_target getVariable[""bis_disabled_Door_1"", 0]) == 1 "];
		} else {
			if (typeOf _x in (call life_build_atm_objects)) then {
				_x addAction["<t color='#ADFF2F'>ATM</t>", life_fnc_atmMenu, "", 0, FALSE, FALSE, "", ' vehicle player == player && player distance _target < 5 '];
			} else {
				switch (typeOf _x) do
				{
					case life_build_plot_pole:
					{
						_x addAction["Toggle visibility of spawn objects", {
							_nearestSpawns = nearestObjects[_this select 0, [life_build_garage_spawn, life_build_spawnpoint, life_build_garage_chopper_spawn], life_build_plot_radius];
							
							{
								_hidden = _x getVariable["hidden", true];
								_x hideObjectGlobal !(_hidden);
								_x setVariable["hidden", !(_hidden)];
							} forEach _nearestSpawns;
						}];
						_x addAction["Maintain area", { [_this select 0] call life_fnc_buildMaintainArea; }];
						_x addAction["Toggle boundary", { [_this select 0] call life_fnc_buildToggleBoundary; }];
						_x addAction["Toggle build area markers", { [_this select 0] call life_fnc_buildShowMarkers; }];
						_x addAction["Building Supplies", life_fnc_virt_menu, "Build"];
					};
					
					case "Land_Water_source_F":
					{
						_x addAction["Drink water", { life_thirst = 100; hint "You've had and some water and you feel refreshed."; [] call life_fnc_hudUpdate; }];
					};
				};
			};
		};
	};
} forEach _objects;