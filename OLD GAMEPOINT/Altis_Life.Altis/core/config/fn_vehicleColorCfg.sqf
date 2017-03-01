#include <macro.h>
/*
	File: fn_vehicleColorCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for vehicle colors.
*/
private["_vehicle","_ret","_path"];

_whitelisted = "";
if (isNil 'life_aff_whitelist') then {
	life_aff_whitelist = "0";
};

if(parseNumber(life_aff_whitelist) > 0) then {
_affwhitelist = parseNumber(life_aff_whitelist);
if (_affwhitelist >= 1) then {_whitelisted = "civ"} else { _whitelisted = "notwhitelisted" };
}; 

_vehicle = [_this,0,"",[""]] call BIS_fnc_param;
if(_vehicle == "") exitWith {[]};
_ret = [];
switch (_vehicle) do
{
	case "I_Heli_Transport_02_F":
	{		
		_path = "\a3\air_f_beta\Heli_Transport_02\Data\Skins\";
		
		_ret =
		[
			[_path + "heli_transport_02_1_ion_co.paa","civ",_path + "heli_transport_02_2_ion_co.paa",_path + "heli_transport_02_3_ion_co.paa"],
			[_path + "heli_transport_02_1_dahoman_co.paa",_whitelisted,_path + "heli_transport_02_2_dahoman_co.paa",_path + "heli_transport_02_3_dahoman_co.paa"],
			["textures\aff\aff_mohawk_1.jpg",_whitelisted, "textures\aff\aff_mohawk_2.jpg", "textures\aff\aff_mohawk_3.jpg"]
		];	
	};
	
	case "C_Hatchback_01_sport_F":
	{
		_path = "\a3\soft_f_gamma\Hatchback_01\data\";
		_ret =
		[
			[_path + "hatchback_01_ext_sport01_co.paa","civ"],
			[_path + "hatchback_01_ext_sport02_co.paa","civ"],
			[_path + "hatchback_01_ext_sport03_co.paa","civ"],
			[_path + "hatchback_01_ext_sport04_co.paa","civ"],
			[_path + "hatchback_01_ext_sport05_co.paa","civ"],
			[_path + "hatchback_01_ext_sport06_co.paa","civ"],
			["textures\police\GP_HatchbackS.jpg","cop"],
			["textures\civ\civ_monsterwrcv2_hbsport.jpg","civ"],
			["textures\civ\vwwrc.jpg","civ"],
			["textures\civ\mcreafordwrc.jpg","civ"]
		];
	};
	
	case "C_Offroad_01_F":
	{
	
	
    _ret = 
		[
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa", "civ"], 
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa", "civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa","civ"],
			["\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa","civ"],
			["textures\Offroad_Flames.jpg","civ"],
			["textures\APD_Offroad.jpg","cop"],
			["#(argb,8,8,3)color(0.6,0.3,0.01,1)","civ"],
			["textures\medic\pickup_medic.jpg", "med"],
			["textures\aff\aff_offroad.jpg",_whitelisted]
		];
		
	};
	
	case "C_Offroad_01_repair_F":
	{
		_ret =
		[
			["textures\hato\vehicles\HATO_RepairOffroader.jpg","east"]
		];
	};
	
	case "C_Hatchback_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa","civ"],
			["\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa","civ"],
			["textures\medic\Medic_Hatchback.jpg","med"],
			["textures\police\GP_Hatchback.jpg","cop"],
			["textures\hato\vehicles\HATO_Hatchback.jpg","east"],
			["textures\civ\civ_dominospizza_hb.jpg","civ"],
			["textures\civ\civ_monsterwrc_hb.jpg","civ"],
			["textures\civ\abudhabiwrc.jpg","civ"]
		];
	};
	
	case "C_SUV_01_F":
	{
		_ret =
		[
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa","civ"],
			["\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa","civ"],
			["textures\SUV_Flames.jpg","civ"],
			["textures\SUV_Girl.jpg","civ"],
			["textures\police\APD_Interceptor_SUV.jpg","cop"],
			["textures\medic\Medic_SUV.jpg","med"],
			["textures\hato\vehicles\HATO_SUV.jpg","east"],
			["textures\police\APD_Interceptor_SUV_white.jpg","cop"],
			["textures\police\APD_Interceptor_SUV_grey.jpg","cop"],
			["textures\civ\suv_bluecamo.jpg","civ"],
			["textures\civ\suvcamogreen.jpg","civ"],
			["textures\civ\dontdodrugs_suv.jpg","civ"],
			["textures\civ\stickers.jpg","civ"]
		];
	};
	
	case "C_Van_01_box_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\medic\Medic_Ambulance_Front.jpg","med","textures\medic\Medic_Ambulance_Back.jpg"],
			["textures\police\GP_Box_Front.jpg", "cop", "textures\police\GP_Box_Back.jpg"]
		];
	};
	
	case "C_Van_01_transport_F":
	{
		_ret = 
		[
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa","civ"],
			["\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa","civ"],
			["textures\hato\vehicles\HATO_ISU_Truck_Flat_Cab.jpg", "east", "textures\hato\vehicles\HATO_ISU_Truck_Flat_Back.jpg"]
		];
	};
	
	case "C_Van_01_fuel_F":
	{
		_ret = 
		[
			[ "textures\hato\vehicles\HATO_ISU_Truck_Flat_Cab.jpg", "hato", "textures\hato\vehicles\HATO_ISU_Truck_Fuel_Back.jpg" ]
		];
	};
	
	case "B_Quadbike_01_F":
	{
		_ret = 
		[
			["\A3\Soft_F\Quadbike_01\Data\Quadbike_01_co.paa","cop"],
			["\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa","reb"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa","civ"],
			["\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","civ"],
			["textures\QuadBike_Cube.jpg","civ"],
			["\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa","reb"]
		];
	};
	
	case "B_Heli_Light_01_F":
	{	
		_ret = 
		[
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa","cop"],
			["textures\police\GP_Hummingbird.jpg","cop"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_ion_co.paa","fed"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa","civ"],
			["\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa","reb"],
			["#(argb,8,8,3)color(1,1,1,0.8)","med"],
			["textures\aff\aff_hummingbird.jpg",_whitelisted]
		];

	};
	
	case "O_Heli_Light_02_unarmed_F":
	{
		_ret = 
		[
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa","fed"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa","civ"],
			["textures\Orca_Civ_01.jpg","civ"],
            ["textures\Orca_Civ_02.jpg","civ"],
			["textures\Orca_Civ_03.jpg","civ"],
			["textures\Orca_Civ_04.jpg","civ"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa","donate"],
			["\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa","reb"],
			["textures\Medic_Orca.jpg","med"],
			["textures\aff\aff_orca.jpg",_whitelisted]
		];
	};
	
	case "B_MRAP_01_F":
	{
		_ret = 
		[
		["textures\police\GP_Hunter_Front_New.jpg","cop"],
		["textures\aff\aff_hunter.jpg",_whitelisted]
		];
	};
	
	case "I_Truck_02_box_F":
	{
		_ret = 
		[
			["textures\hato\vehicles\HATO_ISU_Zamak_Cab.paa", "east", "textures\hato\vehicles\HATO_ISU_Zamak_Back.jpg"]
		];
	};
	
	case "I_Truck_02_covered_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_Truck_02_transport_F":
	{
		_ret = 
		[
			["\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa","civ","\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"],
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "I_G_Van_01_fuel_F":
	{
		_ret = 
		[
			["", "east", "textures\hato\vehicles\HATO_ISU_Truck_Fuel_Back.jpg"]
		];
	};
	
	case "B_APC_Wheeled_01_cannon_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "O_Heli_Attack_02_black_F":
	{
		_ret = 
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","fed"]
		];
	};
	
	case "B_MRAP_01_hmg_F":
	{
		_ret = 
		[
			["textures\police\GP_Hunter_Front_New.jpg","cop"],
			["textures\aff\aff_hunter.jpg",_whitelisted]
		];
	};
	
	case "B_MRAP_01_gmg_F":
	{
	_ret = 
		[
			["textures\police\GP_Hunter_Front_New.jpg","cop"],
			["textures\aff\aff_hunter.jpg",_whitelisted]
		];
	};
	
	case "I_Heli_light_03_unarmed_F":
	{
		_ret =
		[
		    ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["textures\aff\aff_hellcat.jpg",_whitelisted],
			["textures\police\apdhellcat.jpg","cop"]
		];
	};	
	
	case "I_MRAP_03_F":
	{
		_ret =
		[
		    ["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ"],
			["textures\aff\aff_strider.jpg",_whitelisted],
			["textures\police\police_strider.jpg","cop"]
		];
	};
	
	case "B_Heli_Transport_03_unarmed_green_F":
	{
		_ret =
		[
			["#(argb,8,8,3)color(0.05,0.05,0.05,1)","civ", "#(argb,8,8,3)color(0.05,0.05,0.05,1)"],
			["textures\aff\aff_huron_1.jpg",_whitelisted, "textures\aff\aff_huron_2.jpg"]
		];
	};	
	
	case "C_Hatchback_01_sport_white_F":
	{
		_ret =
		[
				["textures\police\GP_HatchbackS.jpg","cop"]
		];
	};	

	case "O_Truck_02_covered_F":
	{
		_ret =
		[
			["textures\police\gp_zamak1.jpg","cop", "textures\police\gp_zamak2.jpg"]
		];
	};	

	case "O_MRAP_02_F":
	{
		_ret =
		[
			["textures\civ\ifritorange1.jpg","civ", "textures\civ\ifritorange2.jpg"],
			["textures\civ\ifritblue1.jpg","civ", "textures\civ\ifritblue2.jpg"],
			["\A3\Soft_F\MRAP_02\data\mrap_02_ext_01_co.paa","civ", "\A3\Soft_F\MRAP_02\data\mrap_02_ext_02_co.paa"]
		];
	};
	
	
	
	

   };
_ret;