private[];

_amount = [_this, 0, 0, [0]] call BIS_fnc_param;


_donatorLevel = (call life_donator);
_percentageDecrease = _donatorLevel * 10;
if (_percentageDecrease == 40) then {
	_percentageDecrease = 50;
};

if (_percentageDecrease > 0) then {
	_amount = _amount - (_amount / 100 * _percentageDecrease);
	
	ftp_atmcash = ftp_atmcash - _amount;
} else {
	ftp_atmcash = ftp_atmcash - _amount;
};