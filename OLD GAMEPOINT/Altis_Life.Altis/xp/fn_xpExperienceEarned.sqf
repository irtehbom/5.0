private[];
disableSerialization;
//_arr = [_this, 0, [], [[]]] call BIS_fnc_param;
_mode = [_this, 0, 0, [0]] call BIS_fnc_param;
_xpGained = [_this, 1, 0, [0]] call BIS_fnc_param;

_str = "";
switch (_mode) do {
	case 1: // AI kill
	{
		//[format["Enemy AI killed +%1 XP", _xpGained]] spawn life_fnc_xpTickerAdd;
		_str = "Enemy AI killed";
	};
	
	case 2: // Vehicle destroy
	{
		_str = "Enemy vehicle destroyed";
	};
	
	case 4: { // Turtle
		_str = "Caught some turtles";
	};
	
	case 5: { // Fishing
		_str = "Caught some fish";
	};
	
	case 6: { // Arrest
		_str = "Arrested suspect";
	};
	
	case 7: { // Capture hideout
		_str = "Captured hideout";
	};
	
	case 8: { // Gathering
		_str = "Gathered some stuff";
	};
	
	case 9: { // Impounding
		_str = "Impounded vehicle";
	};
	
	case 10: { // Processing any type of material
		_str = "Processed material";
	};
	
	case 11: { // HATO Repair
		_str = "Repaired vehicle";
	};
	
	case 12: { // Any other repair
		_str = "Repaired vehicle";
	};
	
	case 13: { // Robbing
		_str = "Robbed player";
	};
	
	case 14: { // Robbing a shop
		_str = "Robbed shop";
	};
	
	case 15: { // Cop neutralizing hideout
		_str = "Neutralized hideout";
	};
	
	case 16: { // Cop repair door (bank)
		_str = "Repaired door";
	};
	
	case 17: { // Cop inv search successful, shit gained.
		_str = "Confiscated goods";
	};
	
	case 18: { // HATO tow successful
		_str = "Successful tow";
	};
	
	case 19: { // Medic revive player
		_str = "Revived player";
	};
	
	case 20: {
		_str = "Being online";
	};
	
	case 21: { // Paintball win
		_str = "Won paintball";
	};
	
	case 22: { // Paintball lose
		_str = "Killed in paintball";
	};
	
	case 100: { // OMG K THE GOAT
		_str = "Found and killed Karol the Goat";
	};
};


[_str + format[" +%1 XP", _xpGained]] spawn life_fnc_xpTickerAdd;

[] call life_fnc_xpUpdateBar;