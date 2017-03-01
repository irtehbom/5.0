/*
	File: fn_vehicleWeightCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle weight.
*/
private["_className"];
_className = [_this,0,"",[""]] call BIS_fnc_param;

switch (_className) do
{
	case "B_Quadbike_01_F": {45}; //Quadbike
	case "C_Hatchback_01_F": {60}; //Hatchback
	case "C_Hatchback_01_sport_F": {60}; //Hatchback Sport
	case "C_Offroad_01_F": {80}; //Offroad
	case "B_G_Offroad_01_F": {80}; //Rebel Offroad
	case "C_SUV_01_F": {70}; //SUV
	case "B_MRAP_01_F": {80}; //Hunter
	case "O_MRAP_02_F": {80}; //Ifrit
	case "I_MRAP_03_F": {80}; //Strider
	case "C_Van_01_transport_F": {150}; //Truck
	case "I_G_Van_01_transport_F": {150}; //Rebel Truck
	case "C_Van_01_box_F": {200}; //Truck Boxer
	case "I_Truck_02_transport_F": {250}; //Zamak Transport
	case "I_Truck_02_covered_F": {300}; //Zamak Transport (Covered)
	case "I_Truck_02_box_F": {350}; //Zamak Repair
	case "I_Truck_02_ammo_F": {350}; //Zamak Ammo
	case "B_Truck_01_mover_F": {400}; //HEMTT
	case "B_Truck_01_transport_F": {450}; //HEMMT Transport
	case "B_Truck_01_covered_F": {500}; //HEMTT Transport (Covered)
	case "B_Truck_01_ammo_F": {550}; //HEMTT Ammo
	case "B_Truck_01_Repair_F": {600}; //HEMTT Repair
	case "B_Truck_01_box_F": {700}; //HEMTT Box
	case "O_Truck_03_transport_F": {750}; //Tempest Transport
	case "O_Truck_03_covered_F": {800}; //Tempest Covered
	case "O_Truck_03_ammo_F": {1000}; //Tempest Ammo
	case "O_Truck_03_repair_F": {1200}; //Tempest Repair
	case "O_Truck_03_device_F": {1400}; //Tempest Device
	case "C_Boat_Civil_01_F": {350};
	case "C_Boat_Civil_01_police_F": {350};
	case "C_Boat_Civil_01_rescue_F": {350};
	case "C_Rubberboat": {200};
	case "B_G_Boat_Transport_01_F": {300};
	case "B_Boat_Transport_01_F": {300};	
	case "Land_CargoBox_V1_F": {5000};
	case "Box_IND_Grenades_F": {350};
    case "B_supplyCrate_F": {700};
	case "C_Heli_Light_01_civil_F": {50}; //M-900
	case "B_Heli_Light_01_F": {80}; //Hummingbird
	case "O_Heli_Transport_04_F": {80}; //Taru (Lift)
	case "O_Heli_Transport_04_bench_F": {100}; //Taru Bench
	case "O_Heli_Transport_04_covered_F": {100}; //Taru Bench (Covered)
	case "O_Heli_Transport_04_fuel_F": {100}; //Taru Fuel
	case "O_Heli_Light_02_unarmed_F": {300}; //Orca
	case "O_Heli_Transport_04_ammo_F": {300}; //Taru Ammo
	case "O_Heli_Transport_04_repair_F": {300}; //Taru Repair
	case "O_Heli_Transport_04_box_F": {400}; //Taru Cargo	
	case "B_Heli_Transport_03_unarmed_F": {600}; //Huron 
	case "B_Heli_Transport_03_unarmed_green_F": {600}; //Huron Green
	case "I_Heli_Transport_02_F": {600}; //Mohawk
	case "I_Heli_light_03_unarmed_F": {110}; //Hellcat
	case "Land_Wreck_Traw_F": {10000000};
        case "Land_Wreck_Traw2_F": {10000000};
	case "CargoNet_01_box_F": {5000};
	default {-1};
};
