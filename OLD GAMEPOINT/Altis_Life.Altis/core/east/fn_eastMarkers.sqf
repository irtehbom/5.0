private["_markers","_units"];


_array = [_this, 0, [], [[]]] call BIS_fnc_param;
_markers = [];
life_hato_requests = _array;
if(visibleMap) then {
	{
		_pos = _x select 0;
		_type = _x select 1;
		_player = _x select 2;
		
		
		_marker = createMarkerLocal [format["HATO_Marker_%1",_x], position _pos];
		
		
		_text = _type;
		if (_type == "Damage") then {
			_marker setMarkerTypeLocal "hd_objective";
			_text = "Broken vehicle by %1 (%2)";
		} else {
			if (_type == "Fuel") then {
				_marker setMarkerTypeLocal "loc_Fuelstation";
				_text = "Out of fuel vehicle by %1 (%2)";
			} else {
				if (_type == "Tow") then {
					_marker setMarkerTypeLocal "hd_pickup";
					_text = "Tow requested by %1 (%2)";
				} else {
					_marker setMarkerTypeLocal "hd_warning";
					_text = "Help requested by %1 (%2)";
				};
			};
		};
		
		_color = "ColorRed";
		switch (side _player) do {
			case east: {
				_text = format[_text, name _player, "HATO"];
				_color = "ColorOrange";
			};
			case civilian: {
				_text = format[_text, name _player, "Civ"];
				_color = "ColorRed";
			};
			case independent: {
				_text = format[_text, name _player, "Medic"];
				_color = "ColorGreen";
			};
			case west: {
				_text = format[_text, name _player, "APD"];
				_color = "ColorBlue";
			};
		};
		
		_marker setMarkerColorLocal _color;
		_marker setMarkerSizeLocal [2, 2];
		
		
		_marker setMarkerTextLocal _text;
		_markers pushBack _marker;
	} foreach _array;
};

waitUntil { !visibleMap };
{
	deleteMarkerLocal _x;
} foreach _markers;
