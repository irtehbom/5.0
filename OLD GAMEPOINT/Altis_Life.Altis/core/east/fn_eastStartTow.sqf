private[];

_vehicle = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

if (vehicle player == player) exitWith {};
if (count crew _vehicle > 0) exitWith { hint "The vehicle isn't empty."; };
removeAllActions _vehicle;

_vehicle lock 2;


_vehicleClass = typeOf _vehicle;

switch (true) do {
	case (_vehicleClass in ["B_G_Offroad_01_repair_F", "B_G_Offroad_01_F", "C_Offroad_01_F", "B_G_Offroad_01_armed_F", "C_Offroad_01_repair_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-4,0.2]];
		_vehicle setVectorUp[0,-1,4];
	};
	
	case (_vehicleClass in ["C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-4,0.4]];
		_vehicle setVectorUp[0,-1,5];
	};
	
	case (_vehicleClass in ["O_Truck_03_device_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-4,1]];
		_vehicle setVectorUp[0,-1,6];
	};
	
	case (_vehicleClass in ["C_Hatchback_01_F", "C_Hatchback_01_sport_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-4,0.05]];
		_vehicle setVectorUp[0,-1,3];
	};
	
	case (_vehicleClass in ["C_SUV_01_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-4,0.1]];
		_vehicle setVectorUp[0,-1,4];
	};
	
	case (_vehicleClass in ["C_Kart_01_Blu_F", "C_Kart_01_Fuel_F", "C_Kart_01_Red_F", "C_Kart_01_Vrana_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-3,0.7]];
		_vehicle setVectorUp[0,-1,6];
	};
	
	case (_vehicleClass in ["B_MRAP_01_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-3.5,1]];
		_vehicle setVectorUp[0,-1,4];
	};
	
	case (_vehicleClass in ["B_Quadbike_01_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-3,1]];
		_vehicle setVectorUp[0,-1,6];
	};
	
	case (_vehicleClass in ["I_MRAP_03_F"]):
	{
		_vehicle attachTo[vehicle player, [0,-4.5,0.4]];
		_vehicle setVectorUp[0,-1,3]; 
	};
};

if (isNull (attachedTo _vehicle)) exitWith { hint "This vehicle can not be towed."; };

vehicle player addAction["<t color='#ADFF2F'>Store vehicle!</t>", life_fnc_eastEndTow, nil, 1338, false, false, "", '_near = false; { if (vehicle player distance (getMarkerPos _x) <= 20) exitWith {_near = true;}; } foreach life_hato_tow_markers; _near'];


