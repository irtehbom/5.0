private[];
// A bit annoying that this script is necessary but due to Arma 3 not having event handlers for repair refuels by vehicles it's necessary
// At this point we already have the repair kit and jerry can covered, this is purely for vehicles that can refuel and for vehicles that can repair automatically
// Also for requests without knowing what's wrong with the vehicle.

while {true} do {
	{
		_vehicle = _x select 0;
		_type = _x select 1;
		_player = _x select 2;
		
		if (_type == "Tow") then {
			removeAllActions _vehicle;
			_vehicle addAction["<t color='#00ffff'>Tow</t>", { [_this select 0] call life_fnc_eastStartTow; }, nil, 1337, false, false, "", "playerSide == east && vehicle player != player && typeOf (vehicle player) == ""B_Truck_01_mover_F"" "];
		} else {
			// All require vehicle
			if (vehicle player == player) exitWith { sleep 10; }; // Sleep additional time.
			_playerVehicle = vehicle player;
			
			// Range short enough so the automatic repair/refuel kicks in?
			if (_playerVehicle distance _vehicle <= 7) then {
				// Does the vehicle still need help?
				if (_vehicle getVariable["HATORequested", false]) then {
					switch (_type) do {
						case "Damage":
						{
							// Vehicle a vehicle that can repair automatically?
							if (typeOf _playerVehicle in ["I_Truck_02_box_F", "C_Offroad_01_repair_F"]) then {
								if (damage _vehicle < 0.2) then {
									// So now we're within 10 meters and we're in a repair vehicle. We can safely assume the vehicle is being repaired by us.
									[[_vehicle], "life_fnc_eastCompleted", false, false] spawn life_fnc_MP;
									ftp_atmcash = ftp_atmcash + 20000;
									_vehicle setVariable["HATORequested", false, true];
									hint "You've completed a HATO request and received 20,000 dollars in commission.";
									
									// Remove from current array so it doesn't trigger again.
									life_hato_requests = life_hato_requests - _x;
								};
							};
						};
						
						case "Fuel":
						{
							// Vehicle a vehicle that can refuel automatically?
							if (typeOf _playerVehicle in ["C_Van_01_fuel_F"]) then {
								if (fuel _vehicle > 0.8) then {
									[[_vehicle], "life_fnc_eastCompleted", false, false] spawn life_fnc_MP;
									ftp_atmcash = ftp_atmcash + 20000;
									_vehicle setVariable["HATORequested", false, true];
									hint "You've completed a HATO request and received 20,000 dollars in commission.";
									
									life_hato_requests = life_hato_requests - _x;
								};
							};
						};
						
						case "Person":
						{
							// Hard situation but lets give em cash for showing up.
							[[_vehicle], "life_fnc_eastCompleted", false, false] spawn life_fnc_MP;
							ftp_atmcash = ftp_atmcash + 10000;
							_vehicle setVariable["HATORequested", false, true];
							hint "You've completed a HATO request and received 10,000 dollars in commission.";
							
							life_hato_requests = life_hato_requests - _x;
						};
					};
				};
			};
		};
	} foreach life_hato_requests;
	
	{
		_vehicle = _x;
		removeAllActions _vehicle;
		_vehicle addAction["<t color='#00ffff'>Tow</t>", { [_this select 0] call life_fnc_eastStartTow; }, nil, 1337, false, false, "", "playerSide == east && vehicle player != player && typeOf (vehicle player) == ""B_Truck_01_mover_F"" "];
	} forEach (nearestObjects[player, ["LandVehicle"], 100]);

	sleep 10;
};