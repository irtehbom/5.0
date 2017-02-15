#include <macro.h>
/*
	File:
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration list / array for buyable vehicles & prices and their shop.
*/
private["_shop","_return"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {[]};
_return = [];
_gangLevel = (group player) getVariable["gangLevel", -1];
switch (_shop) do
{

	/*
	case "jetseller":
	{
		_return set[count _return,["B_Heli_Light_01_armed_F",15000000]];
		_return set[count _return,["I_Plane_Fighter_03_CAS_F",15000000]];
		_return set[count _return,["I_Plane_Fighter_03_AA_F",15000000]];
		_return set[count _return,["O_Heli_Attack_02_F",28000000]];
	};
	*/

	case "kart_shop":
	{
			_return set[count _return,["C_Kart_01_Blu_F",15000]];
			_return set[count _return,["C_Kart_01_Fuel_F",15000]];
			_return set[count _return,["C_Kart_01_Red_F",15000]];
			_return set[count _return,["C_Kart_01_Vrana_F",15000]];
	};
	
	case "med_shop":
	{
			_return set[count _return,["C_Hatchback_01_F", 5000]];
			_return set[count _return,["C_Offroad_01_F",10000]];
			_return set[count _return,["C_SUV_01_F", 16000]];
			_return set[count _return,["C_Van_01_box_F", 20000]];
	};
	
	case "med_air_hs": 
	{
			_return set[count _return,["B_Heli_Light_01_F",5000]];
			_return set[count _return,["O_Heli_Light_02_unarmed_F",8000]];
			_return set[count _return,["O_Heli_Transport_04_medevac_F",10000]];
	};
	
	case "bounty_car":
	{
			_return set[count _return,["C_Hatchback_01_F",0]];
			_return set[count _return,["C_Offroad_01_repair_F",0]];
			_return set[count _return,["C_SUV_01_F",0]];
			_return set[count _return,["I_Truck_02_box_F",0]];
			_return set[count _return,["C_Van_01_fuel_F",0]];
			_return set[count _return,["B_Truck_01_mover_F",0]];
	};
	
	case "civ_car":
	{
			_return set[count _return,["C_Hatchback_01_F",10000]]; //Hatchback
			_return set[count _return,["C_Hatchback_01_sport_F",100000]]; //Hatchback (Sport)
			_return set[count _return,["C_Offroad_01_F",16000]]; //Offroad
			_return set[count _return,["C_SUV_01_F",24000]]; //SUV
	};

	case "civ_truck":
	{
			_return set[count _return,["C_Van_01_fuel_F",40000]]; //Fuel Truck
			_return set[count _return,["C_Van_01_transport_F",40000]]; //Truck 
			_return set[count _return,["C_Van_01_box_F",80000]]; //Truck Boxer
			_return set[count _return,["I_Truck_02_fuel_F",120000]]; //Zamak Fuel
			_return set[count _return,["I_Truck_02_transport_F",120000]]; //Zamak Transport
			_return set[count _return,["I_Truck_02_covered_F",160000]]; //Zamak Transport (Covered)
			_return set[count _return,["I_Truck_02_ammo_F",200000]]; //Zamak Ammo
			_return set[count _return,["I_Truck_02_box_F",200000]]; //Zamak Repair
			_return set[count _return,["B_Truck_01_fuel_F",200000]]; //HEMTT Fuel
			_return set[count _return,["B_Truck_01_mover_F",200000]]; //HEMTT
			_return set[count _return,["B_Truck_01_transport_F",240000]]; //HEMTT Transport
			_return set[count _return,["B_Truck_01_covered_F",280000]]; //HEMTT Transport (Covered)
			_return set[count _return,["B_Truck_01_ammo_F",320000]]; //HEMTT Ammo
			_return set[count _return,["B_Truck_01_Repair_F",360000]]; //HEMTT Repair
			_return set[count _return,["B_Truck_01_box_F",400000]]; //HEMMT Box
			_return set[count _return,["O_Truck_03_fuel_F",440000]]; //Tempest Fuel
			_return set[count _return,["O_Truck_03_transport_F",440000]]; //Tempest Transport
			_return set[count _return,["O_Truck_03_covered_F",480000]]; //Tempest Transport (Covered)
			_return set[count _return,["O_Truck_03_ammo_F",600000]]; //Tempest Ammo
			_return set[count _return,["O_Truck_03_repair_F",1000000]]; //Tempest Repair
			_return set[count _return,["O_Truck_03_device_F",4000000]]; //Tempest Device
	};
	
	case "civ_air":
	{
			_return set[count _return,["C_Heli_Light_01_civil_F",200000]]; //M-900
			_return set[count _return,["B_Heli_Light_01_F",240000]]; //Hummingbird
			_return set[count _return,["O_Heli_Light_02_unarmed_F",800000]]; //Orca
			_return set[count _return,["O_Heli_Transport_04_F",1000000]]; //Taru (Lift)
			_return set[count _return,["O_Heli_Transport_04_bench_F",600000]]; //Taru Bench
			_return set[count _return,["O_Heli_Transport_04_covered_F",600000]]; //Taru Bench (Covered)
			_return set[count _return,["O_Heli_Transport_04_fuel_F",600000]]; //Taru Fuel
			_return set[count _return,["O_Heli_Transport_04_ammo_F",1000000]]; //Taru Ammo	
			_return set[count _return,["O_Heli_Transport_04_repair_F",1000000]]; //Taru Repair
			_return set[count _return,["O_Heli_Transport_04_box_F",2000000]]; //Taru Cargo
			_return set[count _return,["I_Heli_Transport_02_F",2000000]]; //Mohawk
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",2400000]]; //Huron		
	};
	
	case "civ_ship":
	{
			_return set[count _return,["C_Rubberboat",5000]];
			_return set[count _return,["C_Boat_Civil_01_F",22000]];
			_return set[count _return,["B_SDV_01_F",30000]];
	};
	
	case "reb_car":
	{
			_return set[count _return,["B_Quadbike_01_F",3000]]; //Quadbike
			_return set[count _return,["B_G_Offroad_01_F",16000]]; //Offroad
			_return set[count _return,["C_SUV_01_F",24000]]; //SUV
			
		if(license_civ_rebel) then	
		{
			_return set[count _return,["B_G_Offroad_01_armed_F",400000]]; //Armed Offroad
		};
			_return set[count _return,["O_Truck_03_fuel_F",440000]]; //Tempest Fuel
			_return set[count _return,["O_Truck_03_transport_F",440000]]; //Tempest Transport
			_return set[count _return,["O_Truck_03_covered_F",480000]]; //Tempest Transport (Covered)
			_return set[count _return,["O_Truck_03_ammo_F",600000]]; //Tempest Ammo
			_return set[count _return,["O_Truck_03_repair_F",1000000]]; //Tempest Repair
			_return set[count _return,["O_Truck_03_device_F",4000000]]; //Tempest Device
			_return set[count _return,["C_Heli_Light_01_civil_F",200000]]; //M-900
			_return set[count _return,["B_Heli_Light_01_F",240000]]; //Hummingbird
			_return set[count _return,["O_Heli_Light_02_unarmed_F",800000]]; //Orca
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]]; //Hellcat		
			_return set[count _return,["O_Heli_Transport_04_F",1000000]]; //Taru (Lift)
			_return set[count _return,["O_Heli_Transport_04_box_F",2000000]]; //Taru Cargo
			_return set[count _return,["I_Heli_Transport_02_F",2000000]]; //Mohawk
			_return set[count _return,["B_Heli_Transport_03_unarmed_green_F",2400000]]; //Huron	
	};
	
	
	case "donator_spawn_air":
	{  
	
	if (__GETC__(life_donator) >= 1) then {
	
			_return set[count _return,["C_Heli_Light_01_civil_F",200000]]; //M-900
			_return set[count _return,["B_Heli_Light_01_F",240000]]; //Hummingbird
			_return set[count _return,["O_Heli_Light_02_unarmed_F",800000]]; //Orca
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]]; //Hellcat
			_return set[count _return,["O_Heli_Transport_04_F",1000000]]; //Taru (Lift)
			_return set[count _return,["O_Heli_Transport_04_bench_F",600000]]; //Taru Bench
			_return set[count _return,["O_Heli_Transport_04_covered_F",600000]]; //Taru Bench (Covered)
			_return set[count _return,["O_Heli_Transport_04_fuel_F",600000]]; //Taru Fuel
			_return set[count _return,["O_Heli_Transport_04_ammo_F",1000000]]; //Taru Ammo	
			_return set[count _return,["O_Heli_Transport_04_repair_F",1000000]]; //Taru Repair
			_return set[count _return,["O_Heli_Transport_04_box_F",2000000]]; //Taru Cargo
			_return set[count _return,["I_Heli_Transport_02_F",2000000]]; //Mohawk
			_return set[count _return,["B_Heli_Transport_03_unarmed_F",2400000]]; //Huron	
	};
	
	};
	
	case "donator_spawn_shop":
	{  
	
	if (__GETC__(life_donator) >= 1) then {
	
			_return set[count _return,["C_Hatchback_01_F",10000]]; //Hatchback
			_return set[count _return,["C_Hatchback_01_sport_F",100000]]; //Hatchback (Sport)
			_return set[count _return,["C_Offroad_01_F",16000]]; //Offroad
			_return set[count _return,["C_SUV_01_F",24000]]; //SUV
			_return set[count _return,["C_Van_01_fuel_F",40000]]; //Fuel Truck
			_return set[count _return,["C_Van_01_transport_F",40000]]; //Truck 
			_return set[count _return,["C_Van_01_box_F",80000]]; //Truck Boxer
			_return set[count _return,["I_Truck_02_fuel_F",120000]]; //Zamak Fuel
			_return set[count _return,["I_Truck_02_transport_F",120000]]; //Zamak Transport
			_return set[count _return,["I_Truck_02_covered_F",160000]]; //Zamak Transport (Covered)
			_return set[count _return,["I_Truck_02_ammo_F",200000]]; //Zamak Ammo
			_return set[count _return,["I_Truck_02_box_F",200000]]; //Zamak Repair
			_return set[count _return,["B_Truck_01_fuel_F",200000]]; //HEMTT Fuel
			_return set[count _return,["B_Truck_01_mover_F",200000]]; //HEMTT
			_return set[count _return,["B_Truck_01_transport_F",240000]]; //HEMTT Transport
			_return set[count _return,["B_Truck_01_covered_F",280000]]; //HEMTT Transport (Covered)
			_return set[count _return,["B_Truck_01_ammo_F",320000]]; //HEMTT Ammo
			_return set[count _return,["B_Truck_01_Repair_F",360000]]; //HEMTT Repair
			_return set[count _return,["B_Truck_01_box_F",400000]]; //HEMMT Box
			_return set[count _return,["O_Truck_03_fuel_F",440000]]; //Tempest Fuel
			_return set[count _return,["O_Truck_03_transport_F",440000]]; //Tempest Transport
			_return set[count _return,["O_Truck_03_covered_F",480000]]; //Tempest Transport (Covered)
			_return set[count _return,["O_Truck_03_ammo_F",600000]]; //Tempest Ammo
			_return set[count _return,["O_Truck_03_repair_F",1000000]]; //Tempest Repair
			_return set[count _return,["O_Truck_03_device_F",4000000]]; //Tempest Device
	
	};
	
	
	};
	
	
	case "gang_vehicles":
	{  
        if(_gangLevel < 10) exitWith {hint "Your gang is not level 10!"; []},
	    if(_gangLevel >= 10) then 
		{
		    	_return set[count _return,["B_Quadbike_01_F",3000]]; //Quadbike
			_return set[count _return,["O_G_Offroad_01_F",5000]]; //Offroad
			_return set[count _return,["C_SUV_01_F",10000]]; //SUV
			_return set[count _return,["B_G_Offroad_01_armed_F",400000]]; //Armed Offroad
			_return set[count _return,["O_MRAP_02_F",600000]]; //Ifrit
			_return set[count _return,["I_MRAP_03_F",1000000]]; //Strider
			_return set[count _return,["C_Heli_Light_01_civil_F", 100000]];	//M-900
			_return set[count _return,["B_Heli_Light_01_F",200000]]; //Hummingbird
		    	_return set[count _return,["O_Heli_Light_02_unarmed_F",300000]]; //Orca
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]]; //Hellcat		
			_return set[count _return,["I_Heli_Transport_02_F",1600000]]; //Mohawk
			_return set[count _return,["B_Heli_Transport_03_unarmed_green_F",2200000]]; //Huron
		};
	};

	case "cop_car":
	{
		_return set[count _return,["C_Hatchback_01_F", 2000]];
		_return set[count _return,["C_Offroad_01_F", 2250]];
		_return set[count _return,["C_SUV_01_F",3500]];
		_return set[count _return,["C_Van_01_box_F", 4000]];
		_return set[count _return,["O_Truck_02_covered_F", 6000]];
		
		if(__GETC__(life_coplevel) > 1) then
		{
			_return set[count _return,["C_Hatchback_01_sport_white_F", 20000]];
		};
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return,["B_MRAP_01_F",100000]];
		};
		if(__GETC__(life_coplevel) > 3) then
		{
			_return set[count _return,["B_Truck_01_ammo_F",90000]];
		};
		if(__GETC__(life_coplevel) > 4) then
		{
			_return set[count _return,["I_MRAP_03_F",450000]];
		};
	};
	
	
	
	case "aff_air_shop":
	{
	    _affwhitelist = parseNumber(life_aff_whitelist);
		_return set[count _return,["C_Heli_Light_01_civil_F",100000]]; //M-900
		
		if(_affwhitelist >= 1) then
		{
			_return set[count _return,["B_Heli_Light_01_F",200000]]; //Hummingbird
			_return set[count _return,["O_Heli_Light_02_unarmed_F",300000]]; //Orca
			_return set[count _return,["O_Heli_Transport_04_F",800000]]; //Taru (Lift)
		};
		if(_affwhitelist >= 2) then
		{
			_return set[count _return,["O_Heli_Transport_04_bench_F",600000]]; //Taru Bench
			_return set[count _return,["O_Heli_Transport_04_covered_F",600000]]; //Taru Bench (Covered)
			_return set[count _return,["O_Heli_Transport_04_fuel_F",600000]]; //Taru Fuel	
		};
		if(_affwhitelist >= 3) then
		{
			_return set[count _return,["O_Heli_Transport_04_ammo_F",1000000]]; //Taru Ammo
			_return set[count _return,["O_Heli_Transport_04_repair_F",1000000]]; //Taru Repair
			_return set[count _return,["O_Heli_Transport_04_box_F",2000000]]; //Taru Cargo
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]]; //Hellcat
			_return set[count _return,["I_Heli_Transport_02_F",1600000]]; //Mohawk
			_return set[count _return,["B_Heli_Transport_03_unarmed_green_F",2200000]]; //Huron		
		};
		if(_affwhitelist >= 6) then
		{
		};
	};
	
	case "aff_car_shop":
	{
	    _affwhitelist = parseNumber(life_aff_whitelist);
		_return set[count _return,["B_Quadbike_01_F",3000]]; //Quadbike
		_return set[count _return,["C_Offroad_01_F",5000]]; //Offroad
		_return set[count _return,["C_SUV_01_F",10000]]; //SUV
		
		if(_affwhitelist >= 1) then
		{
			_return set[count _return,["O_Truck_03_fuel_F",440000]]; //Tempest Fuel
			_return set[count _return,["O_Truck_03_transport_F",440000]]; //Tempest Transport
			_return set[count _return,["O_Truck_03_covered_F",480000]]; //Tempest Transport (Covered)
			_return set[count _return,["O_Truck_03_ammo_F",600000]]; //Tempest Ammo
			_return set[count _return,["O_Truck_03_repair_F",1000000]]; //Tempest Repair
			_return set[count _return,["O_Truck_03_device_F",4000000]]; //Tempest Device
			_return set[count _return,["B_G_Offroad_01_armed_F",400000]]; //Armed Offroad		
		};
		if(_affwhitelist >= 3) then
		{
			_return set[count _return,["B_MRAP_01_F",200000]]; //Hunter
		};
		if(_affwhitelist >= 4) then
		{
			_return set[count _return,["I_MRAP_03_F",600000]]; //Strider		
		};
	};
	
	
	
	case "cop_air":
	{
		_return set[count _return,["B_Heli_Light_01_F",75000]];
		
		if(__GETC__(life_coplevel) > 2) then
		{
			_return set[count _return, ["O_Heli_Light_02_unarmed_F",250000]];
		};
		if (__GETC__(life_coplevel) > 3) then 
		{
			_return set[count _return, ["O_Heli_Transport_04_bench_F",300000]];
			_return set[count _return, ["I_Heli_light_03_unarmed_F",400000]];
			_return set[count _return, ["B_Heli_Transport_03_unarmed_F",400000]];
		};
		if (__GETC__(life_coplevel) > 4) then 
		{
			_return set[count _return, ["B_Heli_Transport_01_F",3000000]];
		};
	};

	case "cop_ship":
	{
		_return set[count _return,["B_Boat_Transport_01_F",3000]];
		_return set[count _return,["C_Boat_Civil_01_police_F",10000]];
		_return set[count _return,["B_SDV_01_F",3000]];

		if (__GETC__(life_coplevel) > 3) then 
		{
			_return set[count _return,["B_Boat_Armed_01_minigun_F",50000]];
		};
	};
	
	case "pmc_car":
	{
	_PMCwhitelist = parseNumber(life_pmc_whitelist);
	
			_return set[count _return,["C_Hatchback_01_F",10000]]; //Hatchback
			_return set[count _return,["C_Hatchback_01_sport_F",100000]]; //Hatchback (Sport)
			_return set[count _return,["C_Offroad_01_F",16000]]; //Offroad
			_return set[count _return,["C_SUV_01_F",24000]]; //SUV
			_return set[count _return,["B_Truck_01_ammo_F",320000]]; //HEMTT Ammo
		if (_PMCwhitelist > 1) then
		{
			_return set[count _return,["B_G_Offroad_01_armed_F",400000]]; //Armed Offroad
		};
		
		if (_PMCwhitelist  > 2) then
		{
			_return set[count _return,["O_MRAP_02_F",600000]]; //Ifrit
		};
		
		if (_PMCwhitelist  > 3) then
		{
			_return set[count _return,["I_MRAP_03_F",1000000]]; //Strider
		};


	};	
	
	case "pmc_air":
	{
	
	_PMCwhitelist = parseNumber(life_pmc_whitelist);
	
			_return set[count _return,["B_Heli_Light_01_F",200000]]; //Hummingbird
			
			if (_PMCwhitelist > 1) then
		{
			_return set[count _return,["O_Heli_Light_02_unarmed_F",300000]]; //Orca
		};
				if (_PMCwhitelist > 2) then
		{
			_return set[count _return,["I_Heli_light_03_unarmed_F",500000]]; //Hellcat
		};

	};
};

_return;
