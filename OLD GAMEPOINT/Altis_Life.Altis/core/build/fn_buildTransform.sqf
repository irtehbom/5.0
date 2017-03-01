private[];

_dir = [_this,0,0,[0]] call BIS_fnc_param;
_x = [_this,1,0,[0]] call BIS_fnc_param;
_y = [_this,2,0,[0]] call BIS_fnc_param;
_z = [_this,3,0,[0]] call BIS_fnc_param;

_pos = [0,3,0];

if (_dir != 0) then {
	detach life_build_active_object;
	_objectDir = getDir life_build_active_object;
	life_build_active_object setDir _objectdir + _dir;
	life_build_active_object setPos (getPos life_build_active_object);
	_objectDir = getDir life_build_active_object;
	
	_offset = life_build_active_object getVariable["attachOffset", [0,3,0]];
	life_build_active_object attachTo[player, _offset];
	life_build_active_object setDir _objectDir - (getDir player);
};

if (_x != 0) then {
	_offset = life_build_active_object getVariable["attachOffset", [0,3,0]];
	_offset set[0, (_offset select 0) + _x];
	life_build_active_object setVariable["attachOffset", _offset];
	life_build_active_object attachTo[player, _offset];
};

if (_y != 0) then {
	_offset = life_build_active_object getVariable["attachOffset", [0,3,0]];
	_offset set[1, (_offset select 1) + _y];
	life_build_active_object setVariable["attachOffset", _offset];
	life_build_active_object attachTo[player, _offset];
};

if (_z != 0) then {
	_offset = life_build_active_object getVariable["attachOffset", [0,3,0]];
	_offset set[2, (_offset select 2) + _z];
	life_build_active_object setVariable["attachOffset", _offset];
	life_build_active_object attachTo[player, _offset];
};
