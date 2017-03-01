#include <macro.h>
/*
	Master Life Configuration File
	This file is to setup variables for the client, there are still other configuration files in the system

*****************************
****** Backend Variables *****
*****************************
*/
life_query_time = time;
housing_rent = 50000;
life_action_delay = time;
life_trunk_vehicle = Objnull;
life_session_completed = false;
life_garage_store = false;
life_session_tries = 0;
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_clothing_filter = 0;
life_clothing_uniform = -1;
life_redgull_effect = time;
life_is_processing = false;
life_bail_paid = false;
life_impound_inuse = false;
life_action_inUse = false;
life_spikestrip = ObjNull;
life_respawn_timer = 0.2; //Scaled in minutes
life_knockout = false;
life_interrupted = false;
life_respawned = false;
life_removeWanted = false;
life_action_gathering = false;
life_build_active = false;
life_build_progress = false;
life_build_active_object = ObjNull;
life_markers = false;
life_selling_time = 0;
life_selling_clicks = 0;
life_hato_requests = [];
life_hato_tow_markers =
[
	"HATO_Tow_1",
	"HATO_Tow_2",
	"HATO_Tow_3",
	"HATO_Tow_4",
	"HATO_Tow_5",
	"HATO_Tow_6",
	"HATO_Tow_7",
	"HATO_Tow_8",
	"HATO_Tow_9",
	"HATO_Tow_10"
];

{
	if (playerSide != east) then {
		_x setMarkerAlphaLocal 0;
	};
} foreach life_hato_tow_markers;


life_hide_mission_markers =
[
	"mrkSpawnHeliCrash"
];

{
	_x setMarkerAlphaLocal 0;
} forEach life_hide_mission_markers;

//Persistent Saving
__CONST__(life_save_civ,true); //Save weapons for civs?
__CONST__(life_save_yinv,true); //Save Y-Inventory for players?

//Revive constant variables.
__CONST__(life_revive_cops,false); //Set to false if you don't want cops to be able to revive downed players.
__CONST__(life_revive_fee,10000); //Fee for players to pay when revived.

//House Limit
__CONST__(life_houseLimit,2); //Maximum amount of houses a player can buy (TODO: Make Tiered licenses).

//Gang related stuff?
__CONST__(life_gangPrice,0); //Price for creating a gang (They're all persistent so keep it high to avoid 345345345 gangs).
__CONST__(life_gangUpgradeBase,10000); //MASDASDASD
__CONST__(life_gangUpgradeMultipler,2.5); //BLAH

__CONST__(life_enableFatigue,false); //Enable / Disable the ARMA 3 Fatigue System
[] call compile PreprocessFileLineNumbers "core\gang\fn_gangConfig.sqf";
//Uniform price (0),Hat Price (1),Glasses Price (2),Vest Price (3),Backpack Price (4)
life_clothing_purchase = [-1,-1,-1,-1,-1];

lastRobbed = 0;

/*
*****************************
****** Weight Variables *****
*****************************
*/
life_maxWeight = 50; //Identifies the max carrying weight (gets adjusted throughout game when wearing different types of clothing).
life_maxWeightT = 50; //Static variable representing the players max carrying weight on start.
life_carryWeight = 0; //Represents the players current inventory weight (MUST START AT 0).


[] call compile PreprocessFileLineNumbers "core\build\fn_buildConfig.sqf";
[] call compile PreprocessFileLineNumbers "xp\fn_xpConfig.sqf";
/*
*****************************
****** Life Variables *******
*****************************
*/
life_net_dropped = false;
life_hit_explosive = false;
life_siren_active = false;
life_bank_fail = false;
life_use_atm = true;
life_is_arrested = false;
life_in_court = false;
life_delivery_in_progress = false;
life_action_in_use = false;
life_medic_requested = 0;
life_thirst = 100;
life_hunger = 100;
__CONST__(life_paycheck_period,5); //Five minutes
ftp_cash = 0;
__CONST__(life_impound_car,8000);
__CONST__(life_impound_boat,9000);
__CONST__(life_impound_air,10000);
life_istazed = false;
life_my_gang = ObjNull;

life_vehicles = [];
real_estate = [];
bank_robber = [];
switch (playerSide) do
{
	case west: 
	{
	ftp_atmcash = 100000; //Starting Bank Money
	life_paycheck = 4000;
		
	};
	case civilian: 
	{
		ftp_atmcash = 50000; //Starting Bank Money
		life_paycheck = 4000; //Paycheck Amount
	};
	
	case independent: {
		ftp_atmcash = 50000;
		life_paycheck = 10000;
	};
	
	case east:
	{
		life_atmcash = 100000; //Starting Bank Money
		life_paycheck = 10000; //Paycheck Amount
	};
};

/*
	Master Array of items?
*/
life_vShop_rentalOnly = ["B_MRAP_01_hmg_F","B_MRAP_01_gmg_F","B_G_Offroad_01_armed_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F"];
__CONST__(life_vShop_rentalOnly,life_vShop_rentalOnly); //These vehicles can never be bought and only 'rented'. Used as a balancer & money sink. If you want your server to be chaotic then fine.. Remove it..

life_inv_items = 
[
	"life_inv_oilu",
	"life_inv_oilp",
	"life_inv_heroinu",
	"life_inv_heroinp",
	"life_inv_cannabis",
	"life_inv_marijuana",
	"life_inv_apple",
	"life_inv_rabbit",
	"life_inv_salema",
	"life_inv_ornate",
	"life_inv_mackerel",
	"life_inv_tuna",
	"life_inv_mullet",
	"life_inv_catshark",
	"life_inv_turtle",
	"life_inv_fishingpoles",
	"life_inv_water",
	"life_inv_donuts",
	"life_inv_turtlesoup",
	"life_inv_coffee",
	"life_inv_fuelF",
	"life_inv_gpzipties",
	"life_inv_fuelE",
	"life_inv_pickaxe",
	"life_inv_copperore",
	"life_inv_ironore",
	"life_inv_ironr",
	"life_inv_copperr",
	"life_inv_sand",
	"life_inv_salt",
	"life_inv_saltr",
	"life_inv_glass",
	"life_inv_tbacon",
	"life_inv_lockpick",
	"life_inv_redgull",
	"life_inv_peach",
	"life_inv_diamond",
	"life_inv_coke",
	"life_inv_cokep",
	"life_inv_diamondr",
	"life_inv_spikeStrip",
	"life_inv_rock",
	"life_inv_cement",
	"life_inv_goldbar",
	"life_inv_treasure",
	"life_inv_bonds",
	"life_inv_blastingcharge",
	"life_inv_c4",
	"life_inv_boltcutter",
	"life_inv_defusekit",
	"life_inv_storagesmall",
	"life_inv_storagebig",
	"life_inv_crowbar",
	"life_inv_uwsl",
	"life_inv_usilver",
	"life_inv_uclay",
	"life_inv_ucobalt",
	"life_inv_ulead",
	"life_inv_utitanium",
	"life_inv_silver",
	"life_inv_clay",
	"life_inv_cobalt",
	"life_inv_lead",
	"life_inv_titanium",
	"life_inv_ufirearms",
	"life_inv_firearms"	,
	"life_inv_uopium",
	"life_inv_opium",
	"life_inv_sroll"	
];

{
	life_inv_items set[count life_inv_items, "life_inv_build_" + (_x select 1)];
} forEach (call life_build_objects);

//Setup variable inv vars.
{missionNamespace setVariable[_x,0];} foreach life_inv_items;
//Licenses [license var, civ/cop]
life_licenses =
[
	["license_cop_air","cop"],
	["license_cop_swat","cop"],
	["license_cop_cg","cop"],
	["license_civ_driver","civ"],
	["license_civ_air","civ"],
	["license_civ_heroin","civ"],
	["license_civ_marijuana","civ"],
	["license_civ_gang","civ"],
	["license_civ_boat","civ"],
	["license_civ_oil","civ"],
	["license_civ_dive","civ"],
	["license_civ_truck","civ"],
	["license_civ_gun","civ"],
	["license_civ_rebel","civ"],
	["license_civ_coke","civ"],
	["license_civ_diamond","civ"],
	["license_civ_copper","civ"],
	["license_civ_iron","civ"],
	["license_civ_sand","civ"],
	["license_civ_salt","civ"],
	["license_civ_cement","civ"],
	["license_med_air","med"],
	["license_civ_home","civ"],
	["license_civ_hitman","civ"],
	["license_civ_bountyhunter", "civ"],
	["license_civ_silver","civ"],
	["license_civ_clay","civ"],
	["license_civ_cobalt","civ"],
	["license_civ_lead","civ"],
	["license_civ_titanium","civ"],
	["license_civ_firearms","civ"],
	["license_civ_opium","civ"],
	["license_east_air","east"]
];

//Setup License Variables
{missionNamespace setVariable[(_x select 0),false];} foreach life_licenses;

life_dp_points = ["dp_1","dp_2","dp_3","dp_4","dp_5","dp_6","dp_7","dp_8","dp_9","dp_10","dp_11","dp_12","dp_13","dp_14","dp_15","dp_15","dp_16","dp_17","dp_18","dp_19","dp_20","dp_21","dp_22","dp_23","dp_24","dp_25"];
//[shortVar,reward]
life_illegal_items = [["heroinu",1200],["heroinp",2500],["cocaine",1500],["cocainep",3500],["goldbar",70000],["marijuana",2000],["turtle",3000],["blastingcharge",10000],["c4",10000],["boltcutter",500],["firearms",3000],["opium",3000],["ufirearms",3000],["uopium",3000],["cannabis",3000],["spikeStrip",100]];

life_illegal_weapons = [

["launch_NLAW_F",90000],
["launch_RPG32_F",60000],
["launch_B_Titan_F",75000],
["launch_I_Titan_F",75000],
["launch_O_Titan_F",75000],
["launch_Titan_F",75000],
["launch_B_Titan_short_F",75000],
["launch_I_Titan_short_F",75000],
["launch_O_Titan_short_F",75000],
["launch_Titan_short_F",75000],
["hgun_ACPC2_F",500],
["hgun_Pistol_heavy_01_F",500],
["hgun_Pistol_heavy_02_F",500],
["SMG_02_F",1500],
["SMG_01_F",1500],
["arifle_SDAR_F",5000],
["arifle_TRG20_F",5000],
["arifle_TRG21_F",5000],
["arifle_Mk20_F",5000],
["arifle_Mk20C_F",5000],
["arifle_Katiba_F",7500],
["arifle_Katiba_C_F",7500],
["arifle_MX_F",7500],
["arifle_MXC_F",5000],
["arifle_MXM_F",7500],
["arifle_MX_SW_F",8500],
["arifle_MX_Black_F",7500],
["arifle_MXC_Black_F",5000],
["arifle_MXM_Black_F",7500],
["arifle_MX_SW_Black_F",8500],
["LMG_Mk200_F",10000],
["srifle_DMR_01_F",10000],
["srifle_DMR_01_ACO_F",15000],
["srifle_EBR_F",10000],
["srifle_DMR_03_F",10000],
["srifle_DMR_03_F",10000],
["srifle_DMR_03_multicam_F",10000],
["srifle_DMR_03_khaki_F",10000],
["srifle_DMR_03_tan_F",10000],
["srifle_DMR_03_woodland_F",10000],
["srifle_DMR_06_olive_F",10000],
["srifle_DMR_06_camo_F",10000],
["LMG_Zafir_F",15000],
["srifle_DMR_02_F",17500],
["srifle_DMR_02_camo_F",17500],
["srifle_DMR_02_sniper_F",17500],
["MMG_02_black_F",17500],
["MMG_02_camo_F",17500],
["MMG_02_sand_F",17500],
["srifle_DMR_05_blk_F",20000],
["srifle_DMR_05_hex_F",20000],
["srifle_DMR_05_tan_F",20000],
["MMG_01_hex_F",22500],
["MMG_01_tan_F",22500],
["srifle_DMR_04_F",10000],
["srifle_DMR_04_tan_F",10000],
["srifle_LRR_F",25000],
["srifle_GM6_F",25000],
["srifle_LRR_camo_F",25000],
["srifle_GM6_camo_F",25000],
["Laserdesignator",500],
["Laserdesignator_02",500],
["Laserdesignator_03",500],
["hgun_P07_snds_F",2500],
["arifle_MX_GL_F",5000],
["HandGrenade_Stone",50],
["7Rnd_408_Mag",750],
["10Rnd_93x64_DMR_05_Mag",500],
["5Rnd_127x108_Mag",750],
["130Rnd_338_Mag",750],
["150Rnd_93x64_Mag",750],
["Titan_AA",5000],
["Titan_AT",5000],
["Titan_AP",1500],
["RPG32_HE_F",2500],
["NLAW_F",5000],
["150Rnd_762x54_Box",500],
["10Rnd_338_Mag",500],
["20Rnd_762x51_Mag",100],
["200Rnd_65x39_cased_Box",100],
["100Rnd_65x39_caseless_mag",100],
["100Rnd_65x39_caseless_mag_Tracer",100],
["HandGrenade",250],
["MiniGrenade",250],
["ATMine_Range_Mag",2500],
["APERSMine_Range_Mag",2500],
["APERSBoundingMine_Range_Mag",2500],
["SLAMDirectionalMine_Wire_Mag",2500],
["APERSTripMine_Wire_Mag",2500],
["ClaymoreDirectionalMine_Remote_Mag",2500],
["SatchelCharge_Remote_Mag",4000],
["DemoCharge_Remote_Mag",4000],
["IEDUrbanBig_Remote_Mag",2500],
["IEDLandBig_Remote_Mag",2500],
["IEDUrbanSmall_Remote_Mag",2500],
["IEDLandSmall_Remote_Mag",2500],
["B_IR_Grenade",250],
["O_IR_Grenade",250],
["I_IR_Grenade",250]
];

/*
	Sell / buy arrays
*/
sell_array = 
[
	["apple",0],
	["heroinu",1850],
	["heroinp",2650],
	["salema",0],
	["ornate",0],
	["mackerel",0],
	["tuna",0],
	["mullet",0],
	["catshark",0],
	["rabbit",0],
	["oilp",3200],
	["turtle",3000],
	["water",0],
	["coffee",0],
	["turtlesoup",0],
	["donuts",0],
	["marijuana",2350],
	["tbacon",0],
	["lockpick",0],
	["pickaxe",0],
	["redgull",0],
	["peach",0],
	["cocaine",3000],
	["cocainep",5000],
	["diamond",750],
	["diamondc",2000],
	["iron_r",3200],
	["copper_r",1500],
	["salt_r",1650],
	["glass",1450],
	["fuelF",0],
	["spikeStrip",0],
	["cement",1950],
	["crowbar",0],
	["goldbar",95000],
	["bonds",150000],
	["uwsl",5000],
	["usilver",2000],
	["uclay",2000],
	["ucobalt",2000],
	["ulead",2000],
	["utitanium",2000],
	["silver",2000],
	["clay",2000],
	["cobalt",2000],
	["lead",2000],
	["titanium",2000],	
	["ufirearms",5000],
	["cannabis",5000],
	["firearms",5000],	
	["uopium",5000],
	["opium",5000],
	["sroll",0]
];
{
	if (_x select 2 != 0 && _x select 3 != 0) then {
		sell_array set[count sell_array, ["build_" + (_x select 1), _x select 3]];
	};
} forEach (call life_build_objects);
__CONST__(sell_array,sell_array);

buy_array = 
[
	["apple",65],
	["rabbit",75],
	["salema",55],
	["ornate",50],
	["mackerel",200],
	["tuna",900],
	["mullet",300],
	["catshark",350],
	["water",10],
	["turtle",4000],
	["turtlesoup",2500],
	["donuts",120],
	["coffee",10],
	["tbacon",75],
	["lockpick",150],
	["pickaxe",1200],
	["redgull",1500],
	["fuelF",850],
	["gpzipties",850],
	["peach",68],
	["spikeStrip",2500],
	["blastingcharge",35000],
	["c4",35000],
	["boltcutter",7500],
	["defusekit",2500],
	["storagesmall",75000],
	["storagebig",150000],
	["crowbar",200],
	["uwsl",10000],
	["usilver",0],
	["uclay",0],
	["ucobalt",0],
	["ulead",0],
	["utitanium",0],
	["silver",0],
	["clay",0],
	["cobalt",0],
	["lead",0],
	["titanium",0],
	["sroll",175]		
];
{
	if (_x select 2 != 0 && _x select 3 != 0) then {
		buy_array set[count buy_array, ["build_" + (_x select 1), _x select 2]];
	};
} forEach (call life_build_objects);
__CONST__(buy_array,buy_array);

life_weapon_shop_array =
[
	["arifle_sdar_F",0],
	["hgun_P07_snds_F",0],
	["hgun_P07_F",0],
	["ItemGPS",0],
	["ToolKit",0],
	["FirstAidKit",0],
	["Medikit",0],
	["NVGoggles",0],
	["16Rnd_9x21_Mag",0],
	["20Rnd_556x45_UW_mag",0],
	["ItemMap",0],
	["ItemCompass",0],
	["Chemlight_blue",0],
	["Chemlight_yellow",0],
	["Chemlight_green",0],
	["Chemlight_red",0],
	["hgun_Rook40_F",0],
	["arifle_Katiba_F",0],
	["30Rnd_556x45_Stanag",0],
	["20Rnd_762x51_Mag",0],
	["30Rnd_65x39_caseless_green",0],
	["DemoCharge_Remote_Mag",0],
	["SLAMDirectionalMine_Wire_Mag",0],
	["optic_ACO_grn",0],
	["acc_flashlight",0],
	["srifle_EBR_F",0],
	["arifle_TRG21_F",0],
	["optic_MRCO",0],
	["optic_Aco",0],
	["arifle_MX_F",0],
	["arifle_MXC_F",0],
	["arifle_MXM_F",0],
	["MineDetector",0],
	["optic_Holosight",0],
	["acc_pointer_IR",0],
	["arifle_TRG20_F",0],
	["SMG_01_F",0],
	["arifle_Mk20C_F",0],
	["30Rnd_45ACP_Mag_SMG_01",0],
	["30Rnd_9x21_Mag",0]
];
__CONST__(life_weapon_shop_array,life_weapon_shop_array);

life_garage_prices =
[
/*
Prettified by Flames
23/03/2016
Added loads of missing vehicles this should stop vehicles being pulled out for 1000
9999999 are for unavailable vehicles
*/
	["B_QuadBike_01_F",550],	//QuadBike
	["C_Hatchback_01_F",1500],	//Hatchback
	["C_Hatchback_01_sport_F",2350],	//Hatchback (Sport)
	["C_Offroad_01_F", 2500],	//Offroad
	["B_G_Offroad_01_F",3500],	//Rebel Offroad
	["O_G_Offroad_01_F",3000],	//Offroad Unknown found no documentation upon this classname, was in previous versions
	["B_G_Offroad_01_armed_F",9999999], //Armed Offroad (Not buyable)
	["C_SUV_01_F",5250],	//SUV
	["C_Van_01_transport_F",7890],	//Truck 
	["C_Van_01_box_F",9000],	//Truck Boxer
	["C_Van_01_fuel_F",4500],	//Fuel Truck
	["I_Truck_02_transport_F",12000],	//Zamak Transport
	["I_Truck_02_covered_F",14500],	//Zamak Transport (Covered)
	["I_Truck_02_fuel_F",12000],	//Zamak Fuel
	["I_Truck_02_ammo_F",20000],	//Zamak Ammo
	["O_Truck_02_Ammo_F",50000],	//Zamak Ammo (Not buyable)
	["I_Truck_02_box_F",20000],	//Zamak Repair
	["B_Truck_01_mover_F",50000],	//HEMTT
	["B_Truck_01_transport_F",50000],	//HEMTT Transport
	["B_Truck_01_covered_F",50000],	//HEMTT Transport (Covered)
	["B_Truck_01_ammo_F",50000],	//HEMTT Ammo
	["B_Truck_01_Repair_F",50000],	//HEMTT Repair
	["B_Truck_01_box_F", 50000],	//HEMMT Box
	["O_Truck_03_device_F",100000],	//Tempest Device
	["O_Truck_03_fuel_F",50000], //Tempest Fuel
	["O_Truck_03_transport_F",50000], //Tempest Transport
	["O_Truck_03_covered_F",50000], //Tempest Transport (Covered)
	["O_Truck_03_ammo_F",50000], //Tempest Ammo
	["O_Truck_03_repair_F",50000], //Tempest Repair	
	["C_Rubberboat",400],	//Rescue Boat
	["C_Boat_Civil_01_F",4500],	//Motorboat
	["B_Boat_Transport_01_F",450],	//Assault Boat
	["C_Boat_Civil_01_police_F",3500],	//Motorboat (Police)
	["B_Boat_Armed_01_minigun_F",16500],	//Minigun Boat
	["B_SDV_01_F",25000],	//SDV
	["B_MRAP_01_F",35000],	//Hunter (M-ATV)
	["B_MRAP_01_hmg_F",9999999],	//Hunter HMG (M-ATV HMG)
	["B_MRAP_01_gmg_F",9999999],	//Hunter GMG (M-ATV GMG)
	["O_MRAP_02_F",30000],	//Ifrit
	["O_MRAP_02_hmg_F",9999999],	//Ifrit HMG
	["O_MRAP_02_gmg_F",9999999],	//Ifrit GMG
	["I_MRAP_03_F",75000],	//Strider
	["I_MRAP_03_hmg_F",9999999],	//Strider HMG
	["I_MRAP_03_F",9999999],	//Strider GMG
	["B_APC_Tracked_01_rcws_F",9999999],	//Tracked APC
	["C_Heli_Light_01_civil_F",25000],	//M-900
	["B_Heli_Light_01_F",35000],	//Hummingbird
	["O_Heli_Light_02_unarmed_F",35000],	//Orca Unarmed
	["I_Heli_light_03_unarmed_F",50000],	//Hellcat Unarmed
	["O_Heli_Transport_04_ammo_F",50000],	//Taru Ammo
	["O_Heli_Transport_04_bench_F",50000],	//Taru Bench
	["O_Heli_Transport_04_box_F",50000],	//Taru Cargo
	["O_Heli_Transport_04_covered_F",50000],	//Taru Bench (Covered)
	["O_Heli_Transport_04_fuel_F",50000],	//Taru Fuel
	["O_Heli_Transport_04_repair_F",50000],	//Taru Repair
	["O_Heli_Transport_04_F",50000],	//Taru (Lift)
	["I_Heli_Transport_02_F",50000],	//Mohawk
	["B_Heli_Transport_03_unarmed_green_F",50000],	//Huron
	["B_Heli_Light_01_armed_F",9999999],	//Pawnee Armed
	["I_Plane_Fighter_03_CAS_F",9999999],	//A-143 Buzzard (CAS) Armed
	["I_Plane_Fighter_03_AA_F",9999999],	//A-143 Buzzard (AA) Armed
	["I_Heli_light_03_F",9999999],	//Hellcat Armed
	["O_Heli_Light_02_F",9999999],	//Orca Armed
	["B_Heli_Attack_01_F",9999999],	//Comanche Armed
	["O_Heli_Attack_02_F",9999999],	//Kajman Armed
	["O_Heli_Attack_02_black_F",9999999],	//Kajman Black Armed
	["B_Heli_Transport_01_F",9999999]	//Ghosthawk Armed
];
__CONST__(life_garage_prices,life_garage_prices);

life_garage_sell =
[
/*
Prettified by Flames
23/03/2016
Added loads of missing vehicles
0 are for unavailable vehicles
*/
	["B_QuadBike_01_F",550],	//QuadBike
	["C_Hatchback_01_F",1500],	//Hatchback
	["C_Hatchback_01_sport_F",2350],	//Hatchback (Sport)
	["C_Offroad_01_F", 2500],	//Offroad
	["B_G_Offroad_01_F",3500],	//Rebel Offroad
	["O_G_Offroad_01_F",3000],	//Offroad Unknown found no documentation upon this classname, was in previous versions
	["B_G_Offroad_01_armed_F",0], //Armed Offroad (Not buyable)
	["C_SUV_01_F",5250],	//SUV
	["C_Van_01_transport_F",7890],	//Truck 
	["C_Van_01_box_F",9000],	//Truck Boxer
	["C_Van_01_fuel_F",4500],	//Fuel Truck
	["I_Truck_02_transport_F",12000],	//Zamak Transport
	["I_Truck_02_covered_F",14500],	//Zamak Transport (Covered)
	["I_Truck_02_fuel_F",12000],	//Zamak Fuel
	["I_Truck_02_ammo_F",20000],	//Zamak Ammo
	["O_Truck_02_Ammo_F",50000],	//Zamak Ammo (Not buyable)
	["I_Truck_02_box_F",20000],	//Zamak Repair
	["B_Truck_01_mover_F",50000],	//HEMTT
	["B_Truck_01_transport_F",50000],	//HEMTT Transport
	["B_Truck_01_covered_F",50000],	//HEMTT Transport (Covered)
	["B_Truck_01_ammo_F",50000],	//HEMTT Ammo
	["B_Truck_01_Repair_F",50000],	//HEMTT Repair
	["B_Truck_01_box_F", 35000],	//HEMMT Box
	["O_Truck_03_device_F",100000],	//Tempest Device
	["O_Truck_03_fuel_F",50000], //Tempest Fuel
	["O_Truck_03_transport_F",50000], //Tempest Transport
	["O_Truck_03_covered_F",50000], //Tempest Transport (Covered)
	["O_Truck_03_ammo_F",50000], //Tempest Ammo
	["O_Truck_03_repair_F",50000], //Tempest Repair	
	["C_Rubberboat",400],	//Rescue Boat
	["C_Boat_Civil_01_F",4500],	//Motorboat
	["B_Boat_Transport_01_F",450],	//Assault Boat
	["C_Boat_Civil_01_police_F",3500],	//Motorboat (Police)
	["B_Boat_Armed_01_minigun_F",16500],	//Minigun Boat
	["B_SDV_01_F",25000],	//SDV
	["B_MRAP_01_F",7500],	//Hunter (M-ATV)
	["B_MRAP_01_hmg_F",0],	//Hunter HMG (M-ATV HMG)
	["B_MRAP_01_gmg_F",0],	//Hunter GMG (M-ATV GMG)
	["O_MRAP_02_F",30000],	//Ifrit
	["O_MRAP_02_hmg_F",0],	//Ifrit HMG
	["O_MRAP_02_gmg_F",0],	//Ifrit GMG
	["I_MRAP_03_F",65000],	//Strider
	["I_MRAP_03_hmg_F",0],	//Strider HMG
	["I_MRAP_03_F",0],	//Strider GMG
	["B_APC_Tracked_01_rcws_F",0],	//Tracked APC
	["C_Heli_Light_01_civil_F",25000],	//M-900
	["B_Heli_Light_01_F",35000],	//Hummingbird
	["O_Heli_Light_02_unarmed_F",35000],	//Orca Unarmed
	["I_Heli_light_03_unarmed_F",50000],	//Hellcat Unarmed
	["O_Heli_Transport_04_ammo_F",50000],	//Taru Ammo
	["O_Heli_Transport_04_bench_F",50000],	//Taru Bench
	["O_Heli_Transport_04_box_F",50000],	//Taru Cargo
	["O_Heli_Transport_04_covered_F",50000],	//Taru Bench (Covered)
	["O_Heli_Transport_04_fuel_F",50000],	//Taru Fuel
	["O_Heli_Transport_04_repair_F",50000],	//Taru Repair
	["O_Heli_Transport_04_F",50000],	//Taru (Lift)
	["I_Heli_Transport_02_F",50000],	//Mohawk
	["B_Heli_Transport_03_unarmed_F",50000],	//Huron
	["B_Heli_Light_01_armed_F",0],	//Pawnee Armed
	["I_Plane_Fighter_03_CAS_F",0],	//A-143 Buzzard (CAS) Armed
	["I_Plane_Fighter_03_AA_F",0],	//A-143 Buzzard (AA) Armed
	["I_Heli_light_03_F",0],	//Hellcat Armed
	["O_Heli_Light_02_F",0],	//Orca Armed
	["B_Heli_Attack_01_F",0],	//Comanche Armed
	["O_Heli_Attack_02_F",0],	//Kajman Armed
	["O_Heli_Attack_02_black_F",0],	//Kajman Black Armed
	["B_Heli_Transport_01_F",0]	//Ghosthawk Armed
];
__CONST__(life_garage_sell,life_garage_sell);

life_donator_exclusion =
[
	"heroinu",
	"heroinp",
	"cannabis",
	"marijuana",
	"cocaine",
	"cocainep",
	"salt",
	"salt_r",
	"bonds",
	"goldbar",
	"iron_r",
	"copper_r",
	"diamond",
	"diamondc",
	"glass",
	"cement",
	"apple",
	"peach",
	"turtle",
	"rabbit",
	"treasure",
	"usilver",
	"uclay",
	"ucobalt",
	"ulead",
	"utitanium",
	"silver",
	"clay",
	"cobalt",
	"lead",
	"titanium",
	"ufirearms",
	"firearms",
	"uopium",
	"opium",
    "oilp"	
];
__CONST__(life_donator_exclusion, life_donator_exclusion);
life_safe_points =
	[
		["safe_reb_north", 80],
		["safe_reb_south", 80],
		["safe_kavala_city", 450],
		["safe_sofia_city", 180],
		["safe_donator_west", 100],
		["safe_donator_east", 100],
		["safe_airport", 350]
	];
__CONST__(life_safe_points,life_safe_points);
