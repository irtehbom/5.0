private[];

_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;
//if (group player == _group) // Dont need this check becuase we know this person is in this group. We're not tonic

[player] joinSilent (createGroup civilian);
