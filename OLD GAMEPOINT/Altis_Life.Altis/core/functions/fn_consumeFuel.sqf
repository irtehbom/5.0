private[];

while {true} do {
	waitUntil { vehicle player != player };
	// Player got in vehicle.
	_vehicle = vehicle player;
	
	while { vehicle player != player } do
	{
		if (!(alive _vehicle)) exitWith {};
		if (fuel _vehicle <= 0) exitWith {};
		if (isEngineOn _vehicle) then {
			_rate = 0.00025;
			if (speed _vehicle > 100) then {
				_rate = 0.0005;
			};
			_vehicle setFuel (fuel _vehicle - _rate);
		};
		sleep 2;
	};
	
	
	sleep 10;
};