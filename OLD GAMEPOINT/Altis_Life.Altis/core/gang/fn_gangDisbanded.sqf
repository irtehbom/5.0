private[];

_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;

if(!isNull (findDisplay 2620)) then { closedialog 2620; };
hint localize "Your gang has been disbanded.";
[player] joinSilent (createGroup civilian);
player setVariable["gangRank", -1, true];
deleteGroup _group;