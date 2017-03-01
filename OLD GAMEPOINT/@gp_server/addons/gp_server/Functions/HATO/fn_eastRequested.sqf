//[_pos, _type, playerSide], "life_fnc_eastRequested",
private[];

_pos = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;
_type = [_this, 1, "", [""]] call BIS_fnc_param;
_player = [_this, 2, ObjNull, [ObjNull]] call BIS_fnc_param;


life_hato_requests pushBack [_pos, _type, _player];

_typeString = _type;

switch (_type) do {	
	case "Damage":
	{
		[[1, format["%1 requested a HATO mechanic for a broken down vehicle", name _player]], "life_fnc_broadcast", east, false] spawn life_fnc_MP;
	};
	
	case "Fuel":
	{
		[[1, format["%1 requested a HATO mechanic for an out of fuel vehicle", name _player]], "life_fnc_broadcast", east, false] spawn life_fnc_MP;
	};
	
	case "Person":
	{
		_sideText = "";
		switch (side _player) do
		{
			case west:
			{
				_sideText = "APD";
			};
			case east:
			{
				_sideText = "HATO";
			};
			case civilian:
			{
				_sideText = "Civilian";
			};
			case independent:
			{
				_sideText = "Medic";
			};
		};
	
		[[1, format["%1 (%2) requested a HATO mechanic", name _player, _sideText]], "life_fnc_broadcast", east, false] spawn life_fnc_MP;
	};
	
	case "Tow":
	{
		[[1, format["%1 requested a tow for their vehicle", name _player]], "life_fnc_broadcast", east, false] spawn life_fnc_MP;
	};
};