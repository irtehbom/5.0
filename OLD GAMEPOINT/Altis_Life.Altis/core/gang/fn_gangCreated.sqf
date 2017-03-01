private[];

_group = [_this, 0, grpNull, [grpNull]] call BIS_fnc_param;

ftp_cash = ftp_cash - (call life_gang_price);

life_action_gangInUse = nil;
// Our gang has been created
[player] join _group;
_group selectLeader player;
player setRank "COLONEL";

hint "Your gang has been created.";