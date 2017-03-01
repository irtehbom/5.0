private[];

_mode = [_this, 0, 0, [0]] call BIS_fnc_param;
_player = [_this, 1, ObjNull, [ObjNull]] call BIS_fnc_param;
_donator = [_this, 2, 0, [0]] call BIS_fnc_param;

_xp = 0;
switch (_mode) do {
	case 4: { // Turtle
		_xp = 20;
	};
	
	case 5: { // Fishing
		_xp = 20;
	};
	
	case 6: { // Arrest
		_xp = 150;
	};
	
	case 7: { // Capture hideout
		_xp = 100;
	};
	
	case 8: { // Gathering
		_xp = 10;
	};
	
	case 9: { // Impounding
		_xp = 150;
	};
	
	case 10: { // Processing any type of material
		_xp = 30;
	};
	
	case 11: { // HATO Repair
		_xp = 200;
	};
	
	case 12: { // Any other repair
		_xp = 35;
	};
	
	case 13: { // Robbing
		_xp = 25;
	};
	
	case 14: { // Robbing a shop
		_xp = 75;
	};
	
	case 15: { // Cop neutralizing hideout
		_xp = 150;
	};
	
	case 16: { // Cop repair door (bank)
		_xp = 350;
	};
	
	case 17: { // Cop inv search successful, shit gained.
		_xp = 250;
	};
	
	case 18: { // HATO tow successful
		_xp = 300;
	};
	
	case 19: { // Medic revive player
		_xp = 100;
	};
	
	case 20: { // Being online
		_xp = 10;
	};
	
	case 21: { // Paintball win
		_xp = 300;
	};
	
	case 22: { // Paintball lose
		_xp = 100;
	};
	
	case 100: { // Karol the Goat
		_xp = 1000;
	};
};

switch (_donator) do {
	case 1: {
		_xp = _xp * 1.2;
	};
	
	case 2: {
		_xp = _xp * 1.3;
	};
	
	case 3: {
		_xp = _xp * 1.4;
	};
	
	case 4: {
		_xp = _xp * 1.6;
	};
};

_xp = round (_xp);

[[_mode, _xp], _player] call life_fnc_xpHandleXPGain;