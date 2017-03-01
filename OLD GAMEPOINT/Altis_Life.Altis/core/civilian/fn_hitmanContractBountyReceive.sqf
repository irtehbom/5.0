
private["_amount"];
_amount = [_this,0,0,[0]] call BIS_fnc_param;

ftp_atmcash = ftp_atmcash + _amount;
player setVariable["contractAccepted", -1, true];

deleteMarkerLocal "mrkHitmanTarget";