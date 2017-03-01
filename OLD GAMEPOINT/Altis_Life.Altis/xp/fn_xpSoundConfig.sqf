private[];


_sound = [_this, 0, "", [""]] call BIS_fnc_param;



_return = [];

switch (true) do {
	case (_sound == "xpRankUp"):
	{
		_return = [3];
	};
};

_return;