private["_args", "_init", "_timer", "_spawn", "_entry", "_unit"];

_unit = [_this, 0, ObjNull, [ObjNull, grpNull, []]] call BIS_fnc_param;
_script = [_this, 1, "", [""]] call BIS_fnc_param;
_timer = [_this, 2, 60 * 5, [0]] call BIS_fnc_param; // Respawn timer default 5 minutes, optional.


_entry = [_unit, _script, _timer, -1];


life_ai_respawn_list set[count life_ai_respawn_list, _entry];