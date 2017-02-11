#include <macro.h>
/*
	File: fn_weaponShopCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for the weapon shops.
	
	Return:
	String: Close the menu
	Array: 
	[Shop Name,
	[ //Array of items to add to the store
		[classname,Custom Name (set nil for default),price]
	]]
*/
private["_shop"];
_shop = [_this,0,"",[""]] call BIS_fnc_param;
if(_shop == "") exitWith {closeDialog 0}; //Bad shop type passed.

_baseWeapons =
[
    ["hgun_ACPC2_F",nil,10000], //ACP-C2
	["hgun_Pistol_heavy_01_F",nil,10000], //4-Five
	["hgun_Pistol_heavy_02_F",nil,10000], //Zubr
	["SMG_02_F",nil,40000], //Sting
	["SMG_01_F",nil,40000], //Vermin
	["arifle_SDAR_F",nil,20000], //SDAR
	["arifle_TRG20_F",nil,50000], //TRG-20
	["arifle_TRG21_F",nil,50000], //TRG-21
	["arifle_Mk20_F",nil,50000], //MK20
	["arifle_Mk20C_F",nil,50000], //MK20 Carbine
	["arifle_Katiba_F",nil,60000], //Katiba
	["arifle_Katiba_C_F",nil,55000], //Katiba Carbine
	["arifle_MX_F",nil,60000], //MX
	["arifle_MXC_F",nil,55000], //MXC
	["arifle_MXM_F",nil,80000], //MXM
	["arifle_MX_SW_F",nil,80000], //MX SW
	["arifle_MX_Black_F",nil,60000], //MX Black
	["arifle_MXC_Black_F",nil,55000], //MXC Black
	["arifle_MXM_Black_F",nil,80000], //MXM Black
	["arifle_MX_SW_Black_F",nil,80000], //MX SW Black
	["LMG_Mk200_F",nil,200000], //MK200
	["srifle_DMR_01_F",nil,150000], //Rahim
	["srifle_EBR_F",nil,175000], //MK18
	["srifle_DMR_03_F",nil,200000], //MK-1 Black
	["srifle_DMR_03_multicam_F",nil,200000], //MK-1 Camo
	["srifle_DMR_03_khaki_F",nil,200000], //MK-1 Khaki
	["srifle_DMR_03_tan_F",nil,200000], //MK-1 Sand
	["srifle_DMR_03_woodland_F",nil,200000], //MK-1 Woodland
	["srifle_DMR_06_olive_F",nil,150000], //MK14 Olive
	["srifle_DMR_06_camo_F",nil,150000], //MK14 Camo
	["LMG_Zafir_F",nil,300000], //Zafir
	["150Rnd_762x54_Box", nil,5000], //Zafir Ammo
	["srifle_DMR_02_F",nil,800000], //MAR-10 Black
	["srifle_DMR_02_camo_F",nil,800000], //MAR-10 Camo
	["srifle_DMR_02_sniper_F",nil,800000], //MAR-10 Sand
	["MMG_02_black_F",nil,1500000], //SPMG Black
	["MMG_02_camo_F",nil,1500000], //SPMG Camo
	["MMG_02_sand_F",nil,1500000], //SPMG Sand
	["srifle_DMR_05_blk_F",nil,1000000], //Cyrus Black
	["srifle_DMR_05_hex_F",nil,1000000], //Cyrus Hex
	["srifle_DMR_05_tan_F",nil,1000000], //Cyrus Tan
	["MMG_01_hex_F",nil,1500000], //Navid Hex
	["MMG_01_tan_F",nil,1500000], //Navid Tan
	["srifle_DMR_04_F",nil,500000], //ASP-1 Kir Black
	["srifle_DMR_04_tan_F",nil,500000], //ASP-1 Kir Tan
	["srifle_LRR_F",nil,1250000], //M320 LRR
	["srifle_GM6_F",nil,1500000], //GM6 Lynx
	["srifle_LRR_camo_F",nil,1350000], //M320 LRR Camo
	["srifle_GM6_camo_F",nil,1600000], //GM6 Lynx Camo
	["launch_RPG32_F",nil,800000], //RPG-42 Alamut
	["acc_flashlight",nil,1000], //Flashlight
	["acc_pointer_IR",nil,1000], //Laser Pointer
	["optic_Yorris",nil,1500], //Yorris
	["optic_Yorris",nil,1500], //MRD
	["optic_Aco_smg",nil,5000], //ACO Red SMG
	["optic_ACO_grn_smg",nil,5000], //ACO Green SMG
	["optic_Aco",nil,6000], //ACO Red
	["optic_ACO_grn",nil,6000], //ACO Green
	["optic_Holosight",nil,6000], //MK17 Holosight
	["optic_Holosight_smg",nil,6000], //MK17 Holosight SMG
	["optic_Hamr",nil,8000], //RCO
	["optic_Arco",nil,8000], //ARCO
	["optic_MRCO",nil,8000], //MRCO
	["optic_NVS",nil,10000], //NVS
	["optic_DMS",nil,15000], //DMS
	["optic_LRPS",nil,20000], //LRPS
	["optic_SOS",nil,25000], //MOS
	["optic_AMS",nil,30000], //AMS Black
	["optic_AMS_khk",nil,30000], //AMS Khaki
	["optic_AMS_snd",nil,30000], //AMS Sand
	["optic_KHS_blk",nil,30000], //Kahlia Black
	["optic_KHS_hex",nil,30000], //Kahlia Hex
	["optic_KHS_tan",nil,30000], //Kahlia Tan
	["optic_KHS_old",nil,30000], //Kahlia Old
	["bipod_01_F_blk",nil,10000], //Bipod Black NATO
	["bipod_01_F_mtp",nil,10000], //Bipod Camo NATO
	["bipod_01_F_snd",nil,10000], //Bipod Sand NATO
	["bipod_02_F_blk",nil,10000], //Bipod Black CSAT
	["bipod_02_F_hex",nil,10000], //Bipod Hex CSAT
	["bipod_02_F_tan",nil,10000], //Bipod Tan CSAT
	["bipod_03_F_blk",nil,10000], //Bipod Black AAF
	["bipod_03_F_oli",nil,10000], //Bipod Olive AAF
	["muzzle_snds_acp",nil,50000],//.45 Suppressor
	["muzzle_snds_L",nil,50000], //9mm Suppressor
	["muzzle_snds_M",nil,50000], //5.56 Suppressor
	["muzzle_snds_H",nil,50000], //6.5 Suppressor
	["muzzle_snds_H_MG",nil,50000], //6.5 Suppressor LMG
	["muzzle_snds_B",nil,75000], //7.62 Suppressor
	["muzzle_snds_338_black",nil,125000], //.338 Suppressor Black	
	["muzzle_snds_338_green",nil,125000], //.338 Suppressor Green
	["muzzle_snds_338_sand",nil,125000], //.338 Suppressor Sand
	["muzzle_snds_93mmg",nil,125000], //9.3 Suppressor Black
	["muzzle_snds_93mmg_tan",nil,125000], //9.3 Suppressor Tan
	["9Rnd_45ACP_Mag",nil,500],	//9rnd .45 (ACP-C2)
	["11Rnd_45ACP_Mag",nil,500], //11rnd .45 (4-Five)
	["6Rnd_45ACP_Cylinder",nil,500], //6rnd .45 Cylinder (Zubr)
	["30Rnd_45ACP_Mag_SMG_01",nil,750], //30rnd .45 (Vermin)
	["30Rnd_9x21_Mag",nil,750], //30rnd 9mm (Sting)
	["20Rnd_556x45_UW_mag",nil,500], //20rnd 5.56 (SDAR)
	["30Rnd_556x45_Stanag",nil,1000], //30rnd 5.56 (MK20, TRG-20, TRG-21)
	["30Rnd_556x45_Stanag_Tracer_Green",nil,1000], //30rnd 5.56 Tracer Green(MK20, TRG-20, TRG-21)
	["30Rnd_65x39_caseless_green",nil,1000], //30rnd 6.5 Caseless (Katiba)
	["30Rnd_65x39_caseless_green_mag_Tracer",nil,500], //30rnd 6.5 Caseless Tracer Green (Katiba)
	["30Rnd_65x39_caseless_mag",nil,1000], //30rnd 6.5 STANAG (MX)
	["30Rnd_65x39_caseless_mag_Tracer",nil,1000], //30rnd 6.5 Tracer Red (MX)
	["100Rnd_65x39_caseless_mag",nil,2000],	//100rnd 6.5 (MX SW)
	["100Rnd_65x39_caseless_mag_Tracer",nil,1500], //100rnd 6.5 Tracer Red (MX SW)
	["200Rnd_65x39_cased_Box", nil, 5000], //200rnd 6.5 Belt (MK200)
	["200Rnd_65x39_cased_Box_Tracer", nil, 5000], //200rnd 6.5 Belt Tracer Yellow (MK200)
	["10Rnd_762x54_Mag",nil,5000], //10rnd 7.62 (Rahim)
	["20Rnd_762x51_Mag",nil,10000], //20rnd 7.62 (MK18, MK-1, MK14)
	["150Rnd_762x54_Box", nil, 20000], //150rnd 7.26 (Zafir)
	["150Rnd_762x54_Box_Tracer", nil, 20000], //150rnd 7.26 Tracer Green (Zafir)
	["10Rnd_338_Mag",nil,20000], //10rnd .338 (MAR-10)
	["130Rnd_338_Mag",nil,200000], //130rnd .338 (SPMG)
	["10Rnd_93x64_DMR_05_Mag",nil,20000], //10rnd 9.3 (Cyrus)
	["150Rnd_93x64_Mag",nil,200000], //150rnd 9.3 (Navid)	
	["10Rnd_127x54_Mag",nil,50000], //10rnd 12.7 (ASP-1 Kir)
	["7Rnd_408_Mag",nil,80000], //7rnd .408 (M320 LRR)
	["5Rnd_127x108_Mag",nil,100000], //5rnd 12.7 (GM6 Lynx)
	["5Rnd_127x108_APDS_Mag",nil,200000], //5rn 12.7 APDS (GM6 Lynx)
	["RPG32_F",nil,70000], //RPG Rocket
	["Rangefinder",nil,5000] //Rangefinder
];

_armBaseWeapons = 
[
	["Rangefinder",nil,2500], //Rangefinder
	["acc_flashlight",nil,500], //Flashlight
	["acc_pointer_IR",nil,500], //Laser Pointer
	["optic_Aco_smg",nil,1000], //ACO Red SMG
	["optic_ACO_grn_smg",nil,1000], //ACO Green SMG
	["optic_Aco",nil,2000], //ACO Red
	["optic_ACO_grn",nil,2000], //ACO Green
	["optic_Holosight",nil,1000], //MK17 Holosight
	["optic_Holosight_smg",nil,1000], //MK17 Holosight SMG
	["optic_Hamr",nil,2000], //RCO
	["optic_Arco",nil,2000], //ARCO
	["optic_MRCO",nil,2000], //MRCO
	["optic_NVS",nil,5000], //NVS
	["optic_SOS",nil,2250], //MOS
	["optic_LRPS",nil,35000], //LRPS
	["optic_DMS",nil,10000], //DMS
	["optic_AMS",nil,30000], //AMS Black
	["optic_AMS_snd",nil,30000], //AMS Sand
	["optic_KHS_blk",nil,30000], //Kahlia Black
	["optic_KHS_hex",nil,30000], //Kahlia Hex
	["optic_KHS_tan",nil,30000], //Kahlia Tan
	["bipod_01_F_blk",nil,5000], //Bipod Black NATO
	["bipod_01_F_snd",nil,5000], //Bipod Sand NATO
	["bipod_02_F_tan",nil,5000], //Bipod Tan CSAT
	["bipod_03_F_oli",nil,5000] //Bipod Olive AAF


];

_copBaseWeapons = 
[
    ["hgun_P07_snds_F","Stun Pistol",2500],
	["16Rnd_9x21_Mag",nil,100],
	["hgun_ACPC2_F",nil,5000],
	["9Rnd_45ACP_Mag",nil,100],
	["srifle_DMR_01_ACO_F",nil,10000],
	["10Rnd_762x54_Mag",nil,1000],
	["SMG_02_F",nil,12500],
	["30Rnd_9x21_Mag",nil,400],
	["arifle_SDAR_F",nil,18500],
	["20Rnd_556x45_UW_mag",nil,75],
	["SMG_02_F",nil,12500], //Sting
	["30Rnd_9x21_Mag",nil,400], //Sting Ammo
	["arifle_Katiba_F",nil,12500], //Katiba
	["30Rnd_65x39_caseless_green",nil,150], //30rnd 6.5 Caseless (Katiba)		
	["arifle_MX_F",nil,12500], //MX
	["arifle_MX_Black_F",nil,12500], //MX Black			
	["30Rnd_65x39_caseless_mag",nil,150], //30rnd 6.5 STANAG (MX)
	["30Rnd_65x39_caseless_mag_Tracer",nil,150], //30rnd 6.5 STANAG Tracer Red (MX)
	["muzzle_snds_H",nil,2500], //6.5 Suppressor
	["ToolKit",nil,1000],
	["Medikit",nil,500],
	["FirstAidKit",nil,750],
	["ItemGPS",nil,50],
	["Binocular",nil,75],
	["NVGoggles_OPFOR",nil,1000],
	["HandGrenade_Stone","Flashbang",2500],
	["optic_ACO_grn",nil,2000],
	["optic_Holosight",nil,1000],
	["optic_SOS",nil,2250],
	["optic_MRCO",nil,2000],
	["optic_Arco",nil,2000],
	["optic_Hamr",nil,2500],
	["optic_DMS",nil,10000],
	["optic_LRPS",nil,35000],
	["optic_AMS",nil,10000],
	["optic_AMS_snd",nil,10000],
	["optic_KHS_blk",nil,10000],
	["optic_KHS_hex",nil,10000],
	["optic_NVS",nil,4500],
	["acc_flashlight",nil,500],
	["acc_pointer_IR",nil,500],
	["muzzle_snds_M",nil,400],
	["Rangefinder",nil,2500],
	["bipod_01_F_blk",nil,5000], //Bipod Black
	["bipod_01_F_snd",nil,5000], //Bipod Sand
	["bipod_02_F_tan",nil,5000] //Bipod Tan
];

if (playerSide == civilian) then {
	if(parseNumber(life_aff_whitelist) > 0) then { 
	_baseWeapons = [];
	};
	if(parseNumber(life_aff_whitelist) == 0) then { 
	_armBaseWeapons = [];
	};
};

//ARM level switch
if (playerSide == civilian) then {

if(parseNumber(life_aff_whitelist) > 0) then {

			_armBaseWeapons pushback ["hgun_ACPC2_F",nil,5000]; //ACP-C2
			_armBaseWeapons pushback ["9Rnd_45ACP_Mag",nil,1000]; //9rnd .45 (ACP-C2)
			_armBaseWeapons pushback ["muzzle_snds_acp",nil,150]; //.45 Suppressor		
			_armBaseWeapons pushback ["hgun_Pistol_heavy_01_F",nil,5000]; //4-Five
			_armBaseWeapons pushback ["11Rnd_45ACP_Mag",nil,1000]; //11rnd .45 (4-Five)
			_armBaseWeapons pushback ["muzzle_snds_acp",nil,150]; //.45 Suppressor
			_armBaseWeapons pushback ["arifle_SDAR_F",nil,16000]; //SDAR
			_armBaseWeapons pushback ["20Rnd_556x45_UW_mag",nil,250];
			_armBaseWeapons pushback ["SMG_01_F",nil,15000]; //Vermin
			_armBaseWeapons pushback ["30Rnd_45ACP_Mag_SMG_01",nil,1000]; //30rnd .45 (Vermin)
			_armBaseWeapons pushback ["30Rnd_45ACP_Mag_SMG_01_Tracer_Green",nil,1000]; //30rnd .45 Tracer Green (Vermin)
			_armBaseWeapons pushback ["muzzle_snds_acp",nil,150]; //.45 Suppressor
			_armBaseWeapons pushback ["arifle_Katiba_F",nil,15000]; //Katiba
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_green",nil,150]; //30rnd 6.5 Caseless (Katiba)		
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_green_mag_Tracer",nil,150]; //30rnd 6.5 Caseless Tracer Green (Katiba)
			_armBaseWeapons pushback ["muzzle_snds_H",nil,2500]; //6.5 Suppressor
			_armBaseWeapons pushback ["arifle_MX_F",nil,15000]; //MX
			_armBaseWeapons pushback ["arifle_MX_Black_F",nil,15000]; //MX Black			
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_mag",nil,150]; //30rnd 6.5 STANAG (MX)
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_mag_Tracer",nil,150]; //30rnd 6.5 STANAG Tracer Red (MX)
			_armBaseWeapons pushback ["muzzle_snds_H",nil,2500]; //6.5 Suppressor			_armBaseWeapons pushback ["srifle_GM6_camo_F",nil,800000]; //GM6 Lynx
			_armBaseWeapons pushback ["5Rnd_127x108_Mag",nil,60000]; //5rnd 12.7 (GM6 Lynx)
			_armBaseWeapons pushback ["5Rnd_127x108_APDS_Mag",nil,90000]; //5rnd 12.7 APDS (GM6 Lynx)
			_armBaseWeapons pushback ["srifle_LRR_camo_F",nil,800000]; //M320 LRR
			_armBaseWeapons pushback ["7Rnd_408_Mag",nil,60000]; //7rnd .408 (M320 LRR)

};

if(parseNumber(life_aff_whitelist) > 1) then {

			_armBaseWeapons pushback ["arifle_MXM_F",nil,64000]; //MXM
			_armBaseWeapons pushback ["arifle_MXM_Black_F",nil,64000]; //MXM Black
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_mag",nil,150]; //30rnd 6.5 STANAG (MX)
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_mag_Tracer",nil,150]; //30rnd 6.5 STANAG Tracer Red (MX)
			_armBaseWeapons pushback ["muzzle_snds_H",nil,2500]; //6.5 Suppressor
			_armBaseWeapons pushback ["arifle_MX_SW_F",nil,64000]; //MX SW
			_armBaseWeapons pushback ["arifle_MX_SW_Black_F",nil,64000]; //MXM Black
			_armBaseWeapons pushback ["100Rnd_65x39_caseless_mag",nil,600]; //100rnd 6.5 STANAG (MX SW)
			_armBaseWeapons pushback ["100Rnd_65x39_caseless_mag_Tracer",nil,600]; //100rnd 6.5 STANAG Trcaer Red (MX SW)
			_armBaseWeapons pushback ["muzzle_snds_H",nil,2500]; //6.5 Suppressor
			_armBaseWeapons pushback ["LMG_Mk200_F",nil,160000]; //MK200
			_armBaseWeapons pushback ["200Rnd_65x39_cased_Box", nil,3500]; //200rnd 6.5 belt (MK200)
			_armBaseWeapons pushback ["200Rnd_65x39_cased_Box_Tracer", nil,3500]; //200rnd 6.5 Belt Tracer Yellow (MK200)
			_armBaseWeapons pushback ["muzzle_snds_H_MG",nil,15000]; //6.5 Suppressor LMG
			_armBaseWeapons pushback ["srifle_EBR_F", nil,160000]; //MK18
			_armBaseWeapons pushback ["20Rnd_762x51_Mag", nil,6000]; //20rnd 7.62 (MK18, MK-1, MK14)	
			_armBaseWeapons pushback ["muzzle_snds_B",nil,15000]; //7.62 Suppressor

};

if(parseNumber(life_aff_whitelist) > 2) then {

			_armBaseWeapons pushback ["srifle_DMR_03_tan_F",nil,160000]; //MK-1 Sand
			_armBaseWeapons pushback ["srifle_DMR_06_olive_F",nil,130000]; //MK14 Olive
			_armBaseWeapons pushback ["20Rnd_762x51_Mag", nil,6000]; //20rnd 7.62 (MK18, MK-1, MK14)
			_armBaseWeapons pushback ["muzzle_snds_B",nil,15000]; //7.62 Suppressor
			_armBaseWeapons pushback ["srifle_DMR_02_camo_F",nil,600000]; //MAR-10 Camo
			_armBaseWeapons pushback ["srifle_DMR_02_sniper_F",nil,600000]; //MAR-10 Sand
			_armBaseWeapons pushback ["10Rnd_338_Mag",nil,35000]; //10rnd .338 (MAR-10)
			_armBaseWeapons pushback ["muzzle_snds_338_green",nil,25000]; //.338 Suppressor	Green	
			_armBaseWeapons pushback ["muzzle_snds_338_sand",nil,25000]; //.338 Suppressor Sand
			
};

if(parseNumber(life_aff_whitelist) > 3) then {

			_armBaseWeapons pushback ["MMG_02_sand_F",nil,1300000]; //SPMG Sand
			_armBaseWeapons pushback ["130Rnd_338_Mag",nil,160000]; //130rnd .338 (SPMG)
			_armBaseWeapons pushback ["muzzle_snds_338_sand",nil,25000]; //.338 Suppressor Sand		
			_armBaseWeapons pushback ["MMG_01_hex_F",nil,1300000]; //Navid Hex
			_armBaseWeapons pushback ["150Rnd_93x64_Mag",nil,160000]; //150rnd 9.3 (Navid)
			_armBaseWeapons pushback ["muzzle_snds_93mmg_tan",nil,25000]; //9.3 Suppressor	Tan		
			_armBaseWeapons pushback ["arifle_MX_GL_F",nil,22500]; //MX GL
			_armBaseWeapons pushback ["arifle_MX_GL_Black_F",nil,22500]; //MX GL
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_mag",nil,150]; //30rnd 6.5 STANAG (MX)
			_armBaseWeapons pushback ["30Rnd_65x39_caseless_mag_Tracer",nil,150]; //30rnd 6.5 STANAG Tracer Red (MX)			
			_armBaseWeapons pushback ["3Rnd_Smoke_Grenade_shell",nil,8000]; //Smoke (White)
			_armBaseWeapons pushback ["3Rnd_SmokeRed_Grenade_shell",nil,8000]; //Smoke (Red)
			_armBaseWeapons pushback ["muzzle_snds_H",nil,2500]; //6.5 Suppressor
			_armBaseWeapons pushback ["launch_RPG32_F",nil,600000]; //RPG-42 Alamut
			_armBaseWeapons pushback ["RPG32_F",nil,50000]; //RPG Rocket
			_armBaseWeapons pushback ["launch_B_Titan_F",nil,1100000]; //Titan MPRL Launcher
			_armBaseWeapons pushback ["Titan_AA",nil,150000]; //Titan AA Rocket
			_armBaseWeapons pushback ["LMG_Zafir_F",nil,300000]; //Zafir
			_armBaseWeapons pushback ["150Rnd_762x54_Box", nil,5000]; //Zafir ammo

};

if(parseNumber(life_aff_whitelist) > 4) then {

			_armBaseWeapons pushback ["srifle_GM6_camo_F",nil,800000]; //GM6 Lynx
			_armBaseWeapons pushback ["5Rnd_127x108_Mag",nil,60000]; //5rnd 12.7 (GM6 Lynx)
			_armBaseWeapons pushback ["5Rnd_127x108_APDS_Mag",nil,90000]; //5rnd 12.7 APDS (GM6 Lynx)
			_armBaseWeapons pushback ["srifle_LRR_camo_F",nil,800000]; //M320 LRR
			_armBaseWeapons pushback ["7Rnd_408_Mag",nil,60000]; //7rnd .408 (M320 LRR)

};

if(parseNumber(life_aff_whitelist) > 5) then {

			_armBaseWeapons pushback ["srifle_DMR_05_tan_F",nil,800000]; //Cyrus Tan
			_armBaseWeapons pushback ["10Rnd_93x64_DMR_05_Mag",nil,40000]; //10rnd 9.3 (Cyrus)
			_armBaseWeapons pushback ["muzzle_snds_93mmg_tan",nil,160000]; //9.3 Suppressor
			
};
};

if (playerSide == west) then {
if(__GETC__(life_coplevel) > 1) then {

		
			_copBaseWeapons pushback ["arifle_MXM_Black_F",nil,20000]; // MXM
			_copBaseWeapons pushback ["srifle_DMR_04_F",nil,100000]; 	//ASP-1 (Black)
			_copBaseWeapons pushback ["srifle_DMR_04_Tan_F",nil,100000]; //ASP-1 (Camo)
			_copBaseWeapons pushback ["10Rnd_127x54_Mag",nil,2500]; //ASP-1 Ammo
			_copBaseWeapons pushback ["B_Static_Designator_01_weapon_F",nil,100000];
		
	
};

if(__GETC__(life_coplevel) > 2) then {

			
			_copBaseWeapons pushback ["arifle_MX_SW_Black_F",nil,30000]; // MX SW
			_copBaseWeapons pushback ["100Rnd_65x39_caseless_mag_Tracer",nil,350]; //SW Ammo
			_copBaseWeapons pushback ["100Rnd_65x39_caseless_mag",nil,250]; //SW Ammo
			_copBaseWeapons pushback ["LMG_Mk200_F",nil,35000]; //Mk2000
			_copBaseWeapons pushback ["200Rnd_65x39_cased_Box", nil,2500]; //Mk2000 Ammo
			_copBaseWeapons pushback ["muzzle_snds_H_MG",nil,500]; //Sound Suppressor LMG (6.5 mm)
			_copBaseWeapons pushback ["srifle_EBR_F", nil,100000]; //MK18
			_copBaseWeapons pushback ["20Rnd_762x51_Mag", nil,2000]; //7.62x20
			_copBaseWeapons pushback ["muzzle_snds_B",nil,500]; //Sound Suppressor (7.62 mm)
			_copBaseWeapons pushback ["srifle_DMR_03_F",nil,100000]; 	//Mk-I EMR 7.62mm Black
			_copBaseWeapons pushback ["srifle_DMR_03_multicam_F",nil,100000]; //Mk-I EMR 7.62mm Camo
};

if(__GETC__(life_coplevel) > 3) then {

			_copBaseWeapons pushback ["srifle_DMR_06_camo_F",nil,100000]; //Mk14 7.62mm (Camo)
			_copBaseWeapons pushback ["srifle_DMR_06_olive_F",nil,100000]; //Mk14 7.62mm (Olive)
			_copBaseWeapons pushback ["srifle_DMR_02_F",nil,250000]; //Mar-10 (Black)
			_copBaseWeapons pushback ["srifle_DMR_02_camo_F",nil,250000]; //Mar-10 (Camo)
			_copBaseWeapons pushback ["10Rnd_338_Mag",nil,75000]; //Mar-10 Ammo
			_copBaseWeapons pushback ["muzzle_snds_338_black",nil,15000]; //9.3 Suppressor	Tan	
			_copBaseWeapons pushback ["muzzle_snds_338_green",nil,15000]; //9.3 Suppressor	Tan	
			_copBaseWeapons pushback ["LMG_Zafir_F",nil,100000]; //Zafir
			_copBaseWeapons pushback ["150Rnd_762x54_Box", nil,10000]; //Zafir Ammo
			_copBaseWeapons pushback ["muzzle_snds_93mmg_tan",nil,15000]; //9.3 Suppressor	Tan		
			_copBaseWeapons pushback ["arifle_MX_GL_Black_F",nil,22500]; //MX GL
			_copBaseWeapons pushback ["3Rnd_Smoke_Grenade_shell",nil,8000]; //Smoke (White)
			_copBaseWeapons pushback ["3Rnd_SmokeBlue_Grenade_shell",nil,8000]; //Smoke (Blue)
			_copBaseWeapons pushback ["Rangefinder",nil,2500];
			_copBaseWeapons pushback ["launch_RPG32_F",nil,250000]; //Alamut
			_copBaseWeapons pushback ["RPG32_F",nil,25000]; 
			_copBaseWeapons pushback ["launch_B_Titan_F",nil,700000]; //Titan
			_copBaseWeapons pushback ["Titan_AA",nil,75000];
			_copBaseWeapons pushback ["B_UavTerminal",nil,50000];
			
};

if(__GETC__(life_coplevel) > 4) then {

			_copBaseWeapons pushback ["MMG_02_sand_F",nil,900000]; //SPMG Tan
			_copBaseWeapons pushback ["MMG_01_hex_F",nil,900000]; //Navid
			_copBaseWeapons pushback ["130Rnd_338_Mag",nil,50000];
			_copBaseWeapons pushback ["150Rnd_93x64_Mag",nil,75000];
			_copBaseWeapons pushback ["muzzle_snds_93mmg",nil,50000]; //9.3mm Suppressor
			
			
};

if(__GETC__(life_coplevel) > 5) then {


			_copBaseWeapons pushback ["srifle_GM6_camo_F",nil,300000]; //Lynx
			_copBaseWeapons pushback ["5Rnd_127x108_Mag",nil,60000]; //Lynx Ammo
			_copBaseWeapons pushback ["5Rnd_127x108_APDS_Mag",nil,90000]; //Lynx APDS
			_copBaseWeapons pushback ["srifle_DMR_05_blk_F",nil,800000]; //Cyrus Black
			_copBaseWeapons pushback ["srifle_DMR_05_hex_F",nil,800000]; //Cyrus Hex
			_copBaseWeapons pushback ["10Rnd_93x64_DMR_05_Mag",nil,20000]; //Cyrus Ammo
			_copBaseWeapons pushback ["srifle_LRR_F",nil,400000]; //M320
			_copBaseWeapons pushback ["7Rnd_408_Mag",nil,60000]; //M320 Ammo
};

if(__GETC__(life_coplevel) > 6) then {

};

};


switch(_shop) do
{

	case "cop_basic":
	{
		switch(true) do
		{
			case (playerSide != west): {"You are not a cop!"};
			case (__GETC__(life_coplevel) == 0): {"You are not authorized to use this!"};
			case (__GETC__(life_coplevel) == 1):
			default
			{
				["PCSO & PC",
					_copBaseWeapons
				];
			};

			case (__GETC__(life_coplevel) == 2):
			default
			{
				["DC & SDC",
					_copBaseWeapons
				];
			};

			case (__GETC__(life_coplevel) == 3):
			default
			{
				["Sergeant & Master Sergeant",
					_copBaseWeapons
				];
			};

			case (__GETC__(life_coplevel) >= 4):
			default
			{
				["Inspector and Above",
					_copBaseWeapons
				];
			};
		};
	};

	case "med_basic":
	{
		switch (true) do 
		{
			case (playerSide != independent): {"You are not an NHS Medic!"};
			default {
				["Hospital NHS Shop",
					[
						["ItemGPS",nil,100],
						["Binocular",nil,150],
						["ToolKit",nil,250],
						["FirstAidKit",nil,150],
						["Medikit",nil,500],
						["NVGoggles",nil,1200],
						["B_Kitbag_cbr",nil,3000],
						["B_Carryall_cbr",nil,3000]
					]
				];
			};
		};
	};
	
	case "aff_whitelist_shop":
	{
		switch(true) do
		{			
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["AFF Firearms",
					_armBaseWeapons
				];
			};
		};
	};
	
	case "rebel":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_rebel): {"You don't have a Rebel training license!"};
			default
			{
				["Mohammed's Jihadi Shop",
					_baseWeapons
				];
			};
		};
	};
	
	case "gun":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			case (!license_civ_gun): {"You don't have a Firearms license!"};
			default
			{
				["Billy Joe's Firearms",
					[
						["hgun_Rook40_F",nil,7500], //Rook
						["hgun_Pistol_heavy_02_F",nil,10000], //Zubr
						["hgun_ACPC2_F",nil,12000], //ACP-C2
						["hgun_Pistol_heavy_01_F",nil,12000], //4-Five
						["hgun_PDW2000_F",nil,20000], //PDW2000
						["SMG_01_F",nil,40000], //Sting
						["SMG_02_F",nil,40000], //Vermin
						["optic_Yorris",nil,1500], //Yorris
						["optic_Yorris",nil,1500], //MRD
						["optic_Aco_smg",nil,2500], //ACO Green SMG
						["optic_ACO_grn_smg",nil,2500], //ACO Green SMG
						["V_Rangemaster_belt",nil,5000], //Rangemaster
						["16Rnd_9x21_Mag",nil,300], //16rnd 9mm (Rook)
						["9Rnd_45ACP_Mag",nil,500], //9rnd .45 (ACP-C2)
						["11Rnd_45ACP_Mag",nil,500], //11rnd .45 (4-Five)
						["6Rnd_45ACP_Cylinder",nil,500], //6rnd .45 Cylinder (Zubr)
						["30Rnd_9x21_Mag",nil,750], //30rnd 9mm (PDW2000, Sting)
						["30Rnd_45ACP_Mag_SMG_01",nil,750] //30rnd .45 (Vermin)
					]
				];
			};
		};
	};
	
	case "gang":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Hideout Armament",
					_baseWeapons
				];
			};
		};
	};
	
	case "gang_shops":
	{
		switch(true) do
		{
			case (playerSide != civilian): {"You are not a civilian!"};
			default
			{
				["Gang Armament",
					_baseWeapons
				];
			};
		};
	};
	
	case "genstore":
	{
		["Altis General Store",
			[
				["Binocular",nil,150], //Binoculars
				["ItemGPS",nil,100], //GPS
				["ToolKit",nil,250], //Tool Kit
				["FirstAidKit",nil,150], //First Aid Kit
				["NVGoggles",nil,2000], //Night Vision Goggles (Brown)
				["Chemlight_red",nil,300], //Chemlight Red
				["Chemlight_yellow",nil,300], //Chemlight Yellow
				["Chemlight_green",nil,300], //Chemlight Green
				["Chemlight_blue",nil,300] //Chemlight Blue
			]
		];
	};
};
