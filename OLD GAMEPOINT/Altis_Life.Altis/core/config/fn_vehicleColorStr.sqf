/*
	File: fn_vehicleColorStr.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for color strings depending on their index location.
*/
private["_vehicle","_color","_index"];
_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
_index = [_this,1,-1,[0]] call BIS_fnc_param;
_color = "";

_affwhitelist = parseNumber(life_aff_whitelist);

switch (_vehicle) do
{
	case "C_Offroad_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Red";};
			case 1: {_color = "Yellow";};
			case 2: {_color = "White";};
			case 3: {_color = "Blue";};
			case 4: {_color = "Dark Red";};
			case 5: {_color = "Blue / White"};
			case 6: {_color = "Black"};
			case 7: {_color = "Black"};
			case 8: {_color = "Taxi"};
			case 9: {_color = "Medic"};
			case 10: {_color = "AFF Offroad"};
		};
		
		
		
	};
	
	case "C_Hatchback_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Beige";};
			case 1: {_color = "Green";};
			case 2: {_color = "Blue";};
			case 3: {_color = "Dark Blue";};
			case 4: {_color = "Yellow";};
			case 5: {_color = "White"};
			case 6: {_color = "Grey"};
			case 7: {_color = "Black"};
			case 8: {_color = "APD"};
			case 11: {_color = "Dominos"};
			case 12: {_color = "Monster"};
			case 13: {_color = "Abu Dhabi"};
		};
	};
	
	case "C_Hatchback_01_sport_F":
	{
		switch(_index) do
		{
			case 0: {_color = "Red"};
			case 1: {_color = "Dark Blue"};
			case 2: {_color = "Orange"};
			case 3: {_color = "Black / White"};
			case 4: {_color = "Tan"};
			case 5: {_color = "Green"};
			case 6: {_color = "APD"};
			case 7: {_color = "Monster Rally"};
			case 8: {_color = "Redbull Rally"};
			case 9: {_color = "Ford Rally"};
		};
	};
	
	case "C_SUV_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Dark Red";};
			case 1: {_color = "Black";};
			case 2: {_color = "Orange";};
			case 3: {_color = "Lava Lamp";};
			case 4: {_color = "Sexy Lady";};
			case 5: {_color = "Patrol Blue";};
			case 8: {_color = "Patrol White"};
			case 9: {_color = "Patrol Grey"};
			case 10: {_color = "Blue Camo"};
			case 11: {_color = "Green Camo"};
			case 12: {_color = "Swirls"};
			case 13: {_color = "Sticker"};
		};
	};
	
	case "C_Van_01_box_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "C_Van_01_fuel_F":
	{
		switch (_index) do
		{
			case 0: {_color = "White"};
			case 1: {_color = "Red"};
		};
	};
	
	case "B_Quadbike_01_F" :
	{
		switch (_index) do
		{
			case 0: {_color = "Brown"};
			case 1: {_color = "Digi Desert"};
			case 2: {_color = "Black"};
			case 3: {_color = "Blue"};
			case 4: {_color = "Red"};
			case 5: {_color = "White"};
			case 6: {_color = "Digi Green"};
			case 7: {_color = "Hunter Camo"};
			case 8: {_color = "Rebel Camo"};
		};
	};
	
	case "B_Heli_Light_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Civ Blue"};
			case 1: {_color = "Black"};
			case 2: {_color = "Civ Blue"};
			case 3: {_color = "Civ Red"};
			case 4: {_color = "Digi Green"};
			case 5: {_color = "Blueline"};
			case 6: {_color = "Elliptical"};
			case 7: {_color = "Furious"};
			case 8: {_color = "Jeans Blue"};
			case 9: {_color = "Speedy Redline"};
			case 10: {_color = "Sunset"};
			case 11: {_color = "Vrana"};
			case 12: {_color = "Waves Blue"};
			case 13: {_color = "Rebel Digital"};
			case 14: {_color = "EMS White"};
			case 16: {_color = "AFF Hummingbird"};
		};
	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
			case 1: {_color = "White / Blue"};
			case 2: {_color = "Digi Green"};
			case 3: {_color = "Number 9"};
			case 4: {_color = "EMS White"};
			case 5: {_color = "Red Devil"};
			case 8: {_color = "Default red"};
		};
	};
	
	case "B_MRAP_01_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Police Hunter"};
			case 1: {_color = "AFF Hunter"};
		};
	};
	
	case "I_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "I_Truck_02_transport_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange"};
			case 1: {_color = "Black"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_Transport_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Ion"};
			case 1: {_color = "Dahoman"};
			case 2: {_color = "AFF Mowhawk"};
		};
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Black"};
		};
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		switch (_index) do
		{
		    case 0: {_color = "Black"};
			case 1: {_color = "AFF Hellcat"};
			case 2: {_color = "APD Hellcat"};
		};
	};
	
	case "B_MRAP_01_gmg_F":
	{
		switch (_index) do
		{
		    case 0: {_color = "Police Hunter"};
			case 1: {_color = "AFF Hunter"};
		};
	};
	
	case "B_MRAP_01_hmg_F":
	{
		switch (_index) do
		{
		    case 0: {_color = "Police Hunter"};
			case 1: {_color = "AFF Hunter"};
		};
	};
	
	case "I_MRAP_03_F":
	{
		switch (_index) do
		{
		    case 0: {_color = "Black"};
			case 1: {_color = "AFF Strider"};
		};
	};
	
	case "B_Heli_Transport_03_unarmed_F":
	{
		switch (_index) do
		{
		    case 0: {_color = "Black"};
			case 1: {_color = "AFF Huron"};
		};
	};	
	
	case "C_Hatchback_01_sport_white_F":
	{
		switch (_index) do
		{
			case 0: {_color = "APD Sports Hatchback"};
		};
	};
	
	case "O_Truck_02_covered_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Prisoner Transport"};
		};
	};
	
	case "O_MRAP_02_F":
	{
		switch (_index) do
		{
			case 0: {_color = "Orange Camo"};
			case 1: {_color = "Blue Camo"};
			case 2: {_color = "Camo"};
		};
	};

	
	
	
};

_color;