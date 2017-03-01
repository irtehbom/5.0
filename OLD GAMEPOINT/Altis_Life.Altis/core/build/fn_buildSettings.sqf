private[];

_option = [_this,0,-1,[0]] call BIS_fnc_param;

switch (_option) do
{
	case 1:
	{
		_current = life_build_active_object getVariable["snapToGround", false];
		life_build_active_object setVariable["snapToGround", !_current];
		[] spawn life_fnc_buildHudUpdate;
	};
};
