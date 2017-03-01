private[];
disableSerialization;

_medicHud = uiNamespace getVariable ["Medic", displayNull];
_list = _medicHud displayCtrl 1;
_dist = _medicHud displayCtrl 2;

_units = [];
while {true} do {

	_newUnits = [];
	{
		_y = _x;
		_name = _y getVariable "name";
		_down = _y getVariable ["Revive",false];
		if(!isNil "_name" && !_down) then {
			// Ok this player is d-e-d. Dead.
			
			// Add only IF they're not already in the list.
			_inList = false;
			{
				if (_x select 0 == _name) then {
					_inList = true;
				};
				_newUnits pushBack _x;
			} forEach _units;
			
			if (!_inList) then {
				_newUnits pushBack [_name, getPosATL _y, _y];
			};
		};
	} foreach allDeadMen;
	
	_units = _newUnits;
	
	
	lbClear _list;
	lbClear _dist;
	{
		//_list lbAdd (name _x);
		_name = _x select 0;
		_loc = _x select 1;
		_azimut = getDir player;
		_dir = [player, _loc] call BIS_fnc_relativeDirTo;
		
		_list lbAdd _name;
		_dist lbAdd format["%1m", round(player distance _loc)];
		
		
		
		if (_dir < 25 || _dir > 345) then {
			_dist lbSetPicture [(lbSize _dist) - 1, "textures\arrow-up.paa"]
		} else {
			if (_dir > 25 && _dir < 150) then {
				_dist lbSetPicture [(lbSize _dist) - 1, "textures\arrow-right.paa"]
			} else {
				if (_dir > 170 && _dir < 345) then {
					_dist lbSetPicture [(lbSize _dist) - 1, "textures\arrow-left.paa"]
				} else {
					if (_dir >= 150 && _dir <= 170) then {
						_dist lbSetPicture [(lbSize _dist) - 1, "textures\arrow-down.paa"]
					};
				};
			};
		};
		
		
	} forEach (_units);
	sleep 1.5;
};