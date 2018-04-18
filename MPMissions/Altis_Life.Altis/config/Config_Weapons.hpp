/*
*    FORMAT:
*        STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*            
*
*    ARRAY FORMAT:
*        0: STRING (Classname): Item Classname
*        1: STRING (Nickname): Nickname that will appear purely in the shop dialog
*        2: SCALAR (Buy price)
*        3: SCALAR (Sell price): To disable selling, this should be -1
*        4: STRING (Conditions): Same as above conditions string
*
*    Weapon classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Weapons
*    Item classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Items
*
*/
class WeaponShops {
    //Armory Shops
    class gun {
        name = "Billy Joe's Firearms";
        side = "civ";
        conditions = "license_civ_gun";
        items[] = {
            { "hgun_Rook40_F", "", 6500, -1, "" },
            { "hgun_Pistol_01_F", "", 7000, -1, "" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "", 9850, -1, "" },
            { "hgun_ACPC2_F", "", 11500, -1, "" },
            { "hgun_PDW2000_F", "", 20000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
            { "30Rnd_9x21_Mag", "", 250, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 250, -1, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250, -1, "" } //Apex DLC
        };
        accs[] = {
            { "optic_ACO_grn", "", 500, -1, "" }, //ACOGreen
			{ "optic_Aco", "", 500, -1, "" }, //ACORed
			{ "muzzle_snds_L", "", 5000, -1, "" } //9MMSuppressor
        };
    };

    class jailgun {
        name = "Tyrone's Shank Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
            { "hgun_Rook40_F", "", 250000, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 50000, -1, "" }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
			{ "Binocular", "", 250, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" }, //Brown
			{ "NVGoggles_OPFOR", "", 2000, -1, "" }, //Black
			{ "NVGoggles_INDEP", "", 2000, -1, "" }, //Green
			{ "NVGoggles_tna_F", "", 2000, -1, "" }, //Tropic
			{ "Rangefinder", "", 5000, -1, "" },
			{ "SmokeShellRed", "", 850, -1, "" }, //SmokeRed
            { "hgun_ACPC2_F", "", 2500, 1250, "" }, //ACPC2
            { "hgun_Pistol_heavy_01_F", "", 3500, -1, "" }, //4Five
            { "hgun_Pistol_heavy_02_F", "", 5000, -1, "" }, //Zubr
			{ "hgun_Rook40_F", "", 6500, -1, "" },
			{ "hgun_Pistol_01_F", "", 7000, -1, "" }, //Apex DLC
            { "SMG_01_F", "", 10000, -1, "" }, //Vermin .45ACP
			{ "hgun_PDW2000_F", "", 20000, -1, "" },
            { "arifle_SDAR_F", "", 35000, -1, "" }, //SDAR	5.56
            { "arifle_AKS_F", "", 30000, -1, "" }, //AKS74U	5.45
            { "arifle_TRG21_F", "", 40000, -1, "" }, //TRG21	5.56
            { "arifle_CTAR_blk_F", "", 50000, -1, "" }, //CAR95Black 5.8
			{ "arifle_CTAR_ghex_F", "", 50000, -1, "" }, //CAR95GreenHex 5.8
			{ "arifle_CTAR_hex_F", "", 50000, -1, "" }, //CAR95Hex 5.8
			{ "arifle_CTARS_blk_F", "", 80000, -1, "" }, //CAR951Black 5.8
			{ "arifle_CTARS_ghex_F", "", 80000, -1, "" }, //CAR951GreenHex 5.8
			{ "arifle_CTARS_hex_F", "", 80000, -1, "" }, //CAR951Hex 5.8
			{ "LMG_03_F", "", 125000, -1, "" } //LIM 5.56
        };
        mags[] = {
            { "9Rnd_45ACP_Mag", "", 50, -1, "" },
            { "11Rnd_45ACP_Mag", "", 50, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 50, -1, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 50, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 50, -1, "" },
            { "30Rnd_545x39_Mag_F", "", 250, -1, "" },
            { "30Rnd_556x45_Stanag", "", 250, -1, "" },
			{ "30Rnd_580x42_Mag_F", "", 250, -1, "" },
			{ "100Rnd_580x42_Mag_Tracer_F", "", 750, -1, "" },
			{ "200Rnd_556x45_Box_Red_F", "", 1500, -1, "" },
			{ "20Rnd_556x45_UW_mag", "", 350, -1, "" },
			{ "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "30Rnd_9x21_Mag", "", 250, -1, "" },
			{ "10Rnd_9x21_Mag", "", 250, -1, "" } //Apex DLC
        };
        accs[] = {
            { "acc_pointer_IR", "", 100, -1, "" }, //LaserPointer
            { "acc_flashlight", "", 100, -1, "" }, //Flashlight
            { "optic_ACO_grn", "", 500, -1, "" }, //ACOGreen
			{ "optic_Aco", "", 500, -1, "" }, //ACORed
			{ "optic_MRCO", "", 5000, -1, "" }, //MRCO
			{ "optic_Hamr", "", 5000, -1, "" }, //RCO
			{ "optic_Hamr_khk_F", "", 5000, -1, "" }, //RCOKhaki
			{ "optic_Arco", "", 5000, -1, "" }, //ARCO
			{ "optic_Arco_blk_F", "", 5000, -1, "" }, //ARCOBlack
			{ "optic_Arco_ghex_F", "", 5000, -1, "" }, //ARCOHex
			{ "optic_ERCO_blk_F", "", 5000, -1, "" }, //ERCO
			{ "optic_ERCO_snd_F", "", 5000, -1, "" }, //ERCOSand
			{ "optic_ERCO_khk_F", "", 5000, -1, "" }, //ERCOKhaki
			{ "muzzle_snds_L", "", 5000, -1, "" }, //9MMSuppressor
			{ "muzzle_snds_acp", "", 5000, -1, ""}, //.45ACPSuppressorBlack
			{ "muzzle_snds_M", "", 8500, -1, "" }, //5.56mmSuppressorBlack
			{ "muzzle_snds_m_khk_F", "", 8500, -1, "" }, //5.56mmSuppressorKhaki
			{ "muzzle_snds_m_snd_F", "", 8500, -1, "" }, //5.56mmSuppressorSand
			{ "muzzle_snds_58_blk_F", "", 9500, -1, "" }, //5.8mmStealthSuppressorBlack
			{ "muzzle_snds_58_ghex_F", "", 9500, -1, "" }, //5.8mmStealthSuppressorGreenHex
			{ "muzzle_snds_58_hex_F", "", 9500, -1, "" }, //5.8mmStealthSuppressorHex
			{ "muzzle_snds_L", "", 5000, -1, "" }, //9MMSuppressor
			{ "bipod_02_F_blk", "", 3500, -1, "" }, //CSATBipodBlack
			{ "bipod_02_F_tan", "", 3500, -1, "" }, //CSATBipodTan
			{ "bipod_02_F_hex", "", 3500, -1, "" }, //CSATBipodHex
			{ "muzzle_snds_65_TI_blk_F", "", 10000, -1, "" }, // 6.5mmStealthSuppressorBlack
			{ "muzzle_snds_65_TI_ghex_F", "", 10000, -1, "" }, // 6.5mmStealthSuppressorGreenHex
			{ "muzzle_snds_65_TI_hex_F", "", 10000, -1, "" }, // 6.5mmStealthSuppressorHex
			{ "muzzle_snds_H", "", 12500, -1, "" }, //6.5mmSupressorBlack
			{ "muzzle_snds_H_khk_F", "", 12500, -1, "" }, //6.5mmSupressorKhaki
			{ "muzzle_snds_H_snd_F", "", 12500, -1, "" }, //6.5mmSupressorSand
			{ "muzzle_snds_B", "", 15000, -1, "" }, //7.62SupressorBlack
			{ "muzzle_snds_B_khk_F", "", 15000, -1, "" }, //7.62SupressorKhaki
			{ "muzzle_snds_B_snd_F", "", 15000, -1, "" }, //7.62SupressorSand
            { "optic_Holosight", "", 500, -1, "" }, //Mk17Holosight
			{ "optic_Holosight_blk_F", "", 500, -1, "" }, //Mk17HolosightBlack
			{ "optic_Holosight_khk_F", "", 500, -1, "" } //Mk17HolosightKhaki
        };
    };
	
	class rebelAdvanced {
		name = "Dru's PegLeg Shop";
        side = "civ";
        conditions = "license_civ_rebelAdvanced";
		items[] = {
			{ "Binocular", "", 250, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" }, //Brown
			{ "NVGoggles_OPFOR", "", 2000, -1, "" }, //Black
			{ "NVGoggles_INDEP", "", 2000, -1, "" }, //Green
			{ "NVGoggles_tna_F", "", 2000, -1, "" }, //Tropic
			{ "Rangefinder", "", 5000, -1, "" },
			{ "SmokeShellRed", "", 850, -1, "" }, //SmokeRed
            { "hgun_ACPC2_F", "", 2500, 1250, "" }, //ACPC2
            { "hgun_Pistol_heavy_01_F", "", 3500, -1, "" }, //4Five
            { "hgun_Pistol_heavy_02_F", "", 5000, -1, "" }, //Zubr
			{ "hgun_Rook40_F", "", 6500, -1, "" },
			{ "hgun_Pistol_01_F", "", 7000, -1, "" }, //Apex DLC
            { "SMG_01_F", "", 10000, -1, "" }, //Vermin .45ACP
			{ "hgun_PDW2000_F", "", 20000, -1, "" },
            { "arifle_SDAR_F", "", 35000, -1, "" }, //SDAR	5.56
            { "arifle_AKS_F", "", 30000, -1, "" }, //AKS74U	5.45
            { "arifle_TRG21_F", "", 40000, -1, "" }, //TRG21	5.56
            { "arifle_CTAR_blk_F", "", 50000, -1, "" }, //CAR95Black 5.8
			{ "arifle_CTAR_ghex_F", "", 50000, -1, "" }, //CAR95GreenHex 5.8
			{ "arifle_CTAR_hex_F", "", 50000, -1, "" }, //CAR95Hex 5.8
			{ "arifle_CTARS_blk_F", "", 80000, -1, "" }, //CAR951Black 5.8
			{ "arifle_CTARS_ghex_F", "", 80000, -1, "" }, //CAR951GreenHex 5.8
			{ "arifle_CTARS_hex_F", "", 80000, -1, "" }, //CAR951Hex 5.8
			{ "LMG_03_F", "", 125000, -1, "" }, //LIM 5.56
			{ "arifle_Katiba_C_F", "", 60000, -1, "" }, //KatibaCarbine 6.5
			{ "arifle_Katiba_F", "", 65000, -1, "" }, //Katiba 6.5
            { "arifle_ARX_blk_F", "", 65000, -1, "" }, //Type115Black 6.5
			{ "arifle_ARX_ghex_F", "", 65000, -1, "" }, //Type115GreenHex 6.5
			{ "arifle_ARX_hex_F", "", 65000, -1, "" }, //Type115Hex 6.5
			{ "srifle_DMR_07_blk_F", "", 70000, -1, "" }, //CMR76Black 6.5
			{ "srifle_DMR_07_ghex_F", "", 70000, -1, "" }, //CMR76GreenHex 6.5
			{ "srifle_DMR_07_hex_F", "", 70000, -1, "" }, //CMR76Hex 6.5
			{ "LMG_Zafir_F", "", 200000, -1, "" }, //Zafir 7.62
			{ "arifle_AKM_F", "", 75000, -1, "" }, //AKM 7.62
			{ "srifle_DMR_01_F", "", 85000, -1, "" }, //Rahim 7.62
			{ "arifle_AK12_F", "", 125000, -1, "" }, //AK12 7.62
			{ "srifle_DMR_06_camo_khs_F", "", 120000, -1, "" }, //MK14Camo 7.62
			{ "srifle_DMR_06_olive_F", "", 120000, -1, "" }, //MK14Olive 7.62
			{ "srifle_EBR_F", "", 135000, -1, "" }, //MK18A 7.62
			{ "srifle_DMR_03_multicam_F", "", 150000, -1, "" }, //MKIEMRCamo 7.62
			{ "srifle_DMR_03_khaki_F", "", 150000, -1, "" }, //MKIEMRKhaki 7.62
			{ "srifle_DMR_03_tan_F", "", 150000, -1, "" }, //MKIEMRSand 7.62
			{ "srifle_DMR_03_woodland_F", "", 150000, -1, "" } //MKIEMRWoodland 7.62
		};
		mags[] = {
			{ "9Rnd_45ACP_Mag", "", 50, -1, "" },
            { "11Rnd_45ACP_Mag", "", 50, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 50, -1, "" },
            { "30Rnd_45ACP_Mag_SMG_01", "", 50, -1, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 50, -1, "" },
            { "30Rnd_545x39_Mag_F", "", 250, -1, "" },
            { "30Rnd_556x45_Stanag", "", 250, -1, "" },
			{ "30Rnd_580x42_Mag_F", "", 250, -1, "" },
			{ "100Rnd_580x42_Mag_Tracer_F", "", 750, -1, "" },
			{ "200Rnd_556x45_Box_Red_F", "", 1500, -1, "" },
			{ "20Rnd_556x45_UW_mag", "", 350, -1, "" },
			{ "30Rnd_65x39_caseless_green", "", 500, -1, "" },
			{ "20Rnd_650x39_Cased_Mag_F", "", 500, -1, "" },
			{ "150Rnd_762x54_Box_Tracer", "", 2500, -1, "" },
			{ "30Rnd_762x39_Mag_F", "", 800, -1, "" },
			{ "10Rnd_762x54_Mag", "", 700, -1, "" },	
			{ "20Rnd_762x51_Mag", "", 850, -1, "" },
			{ "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "30Rnd_9x21_Mag", "", 250, -1, "" },
			{ "10Rnd_9x21_Mag", "", 250, -1, "" } //Apex DLC
		};
		accs[] = {
			{ "muzzle_snds_65_TI_blk_F", "", 10000, -1, "" }, // 6.5mmStealthSuppressorBlack
			{ "muzzle_snds_65_TI_ghex_F", "", 10000, -1, "" }, // 6.5mmStealthSuppressorGreenHex
			{ "muzzle_snds_65_TI_hex_F", "", 10000, -1, "" }, // 6.5mmStealthSuppressorHex
			{ "muzzle_snds_H", "", 12500, -1, "" }, //6.5mmSupressorBlack
			{ "muzzle_snds_H_khk_F", "", 12500, -1, "" }, //6.5mmSupressorKhaki
			{ "muzzle_snds_H_snd_F", "", 12500, -1, "" }, //6.5mmSupressorSand
			{ "muzzle_snds_B", "", 15000, -1, "" }, //7.62SupressorBlack
			{ "muzzle_snds_B_khk_F", "", 15000, -1, "" }, //7.62SupressorKhaki
			{ "muzzle_snds_B_snd_F", "", 15000, -1, "" }, //7.62SupressorSand
			{ "muzzle_snds_L", "", 5000, -1, "" }, //9MMSuppressor
            { "optic_Holosight", "", 500, -1, "" }, //Mk17Holosight
			{ "optic_Holosight_blk_F", "", 500, -1, "" }, //Mk17HolosightBlack
			{ "optic_Holosight_khk_F", "", 500, -1, "" }, //Mk17HolosightKhaki
			{ "acc_pointer_IR", "", 100, -1, "" }, //LaserPointer
            { "acc_flashlight", "", 100, -1, "" }, //Flashlight
            { "optic_ACO_grn", "", 500, -1, "" }, //ACOGreen
			{ "optic_Aco", "", 500, -1, "" }, //ACORed
			{ "optic_MRCO", "", 5000, -1, "" }, //MRCO
			{ "optic_Hamr", "", 5000, -1, "" }, //RCO
			{ "optic_Hamr_khk_F", "", 5000, -1, "" }, //RCOKhaki
			{ "optic_Arco", "", 5000, -1, "" }, //ARCO
			{ "optic_Arco_blk_F", "", 5000, -1, "" }, //ARCOBlack
			{ "optic_Arco_ghex_F", "", 5000, -1, "" }, //ARCOHex
			{ "optic_ERCO_blk_F", "", 5000, -1, "" }, //ERCO
			{ "optic_ERCO_snd_F", "", 5000, -1, "" }, //ERCOSand
			{ "optic_ERCO_khk_F", "", 5000, -1, "" }, //ERCOKhaki
			{ "muzzle_snds_L", "", 5000, -1, "" }, //9MMSuppressor
			{ "muzzle_snds_acp", "", 5000, -1, ""}, //.45ACPSuppressorBlack
			{ "muzzle_snds_M", "", 8500, -1, "" }, //5.56mmSuppressorBlack
			{ "muzzle_snds_m_khk_F", "", 8500, -1, "" }, //5.56mmSuppressorKhaki
			{ "muzzle_snds_m_snd_F", "", 8500, -1, "" }, //5.56mmSuppressorSand
			{ "muzzle_snds_58_blk_F", "", 9500, -1, "" }, //5.8mmStealthSuppressorBlack
			{ "muzzle_snds_58_ghex_F", "", 9500, -1, "" }, //5.8mmStealthSuppressorGreenHex
			{ "muzzle_snds_58_hex_F", "", 9500, -1, "" }, //5.8mmStealthSuppressorHex
			{ "bipod_02_F_blk", "", 3500, -1, "" }, //CSATBipodBlack
			{ "bipod_02_F_tan", "", 3500, -1, "" }, //CSATBipodTan
			{ "bipod_02_F_hex", "", 3500, -1, "" }, //CSATBipodHex
			{ "optic_SOS", "", 12500, -1, "" }, //SOS
			{ "optic_SOS_khk_F", "", 12500, -1, "" }, //SOSKhaki
			{ "optic_DMS", "", 15000, -1, "" }, //DMS
			{ "optic_DMS_ghex_F", "", 15000, -1, "" }, //DMSHex
			{ "optic_LRPS", "", 20000, -1, "" }, //LRPS
			{ "optic_LRPS_tna_F", "", 20000, -1, "" }, //LRPSTropic
			{ "optic_LRPS_ghex_F", "", 20000, -1, "" }, //LRPSHex
			{ "optic_AMS", "", 15000, -1, "" }, //AMS
			{ "optic_AMS_khk", "", 15000, -1, "" }, //AMSKhaki
			{ "optic_AMS_snd", "", 15000, -1, "" }, //AMSSand
			{ "optic_KHS_blk", "", 12500, -1, "" }, // Kahlia
			{ "optic_KHS_hex", "", 12500, -1, "" }, // KahliaHex
			{ "optic_KHS_tan", "", 12500, -1, "" } // KahliaTan
		};
	};

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500, -1, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, -1, "" },
            { "hgun_ACPC2_F", "", 4500, -1, "" },
            { "hgun_PDW2000_F", "", 9500, -1, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, -1, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, -1, "" },
            { "9Rnd_45ACP_Mag", "", 200, -1, "" },
            { "30Rnd_9x21_Mag", "", 250, -1, "" }
        };
        accs[] = {
            { "optic_ACO_grn", "", 500, -1, "" }, //ACOGreen
			{ "optic_Aco", "", 500, -1, "" }, //ACORed
			{ "muzzle_snds_L", "", 5000, -1, "" } //9MMSuppressor
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 250, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "ItemMap", "", 50, -1, "" },
            { "ItemCompass", "", 50, -1, "" },
            { "ItemWatch", "", 50, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" }, //Brown
			{ "NVGoggles_OPFOR", "", 2000, -1, "" }, //Black
			{ "NVGoggles_INDEP", "", 2000, -1, "" }, //Green
			{ "NVGoggles_tna_F", "", 2000, -1, "" }, //Tropic
            { "Chemlight_red", "", 300, -1, "" },
            { "Chemlight_yellow", "", 300, -1, "" },
            { "Chemlight_green", "", 300, -1, "" },
            { "Chemlight_blue", "", 300, -1, "" },
			{ "ItemRadio", "", 300, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 250, -1, "" },
            { "ItemGPS", "", 100, -1, "" },
            { "ItemMap", "", 50, -1, "" },
            { "ItemCompass", "", 50, -1, "" },
            { "ItemWatch", "", 50, -1, "" },
            { "FirstAidKit", "", 150, -1, "" },
            { "NVGoggles", "", 2000, -1, "" }, //Brown
			{ "NVGoggles_OPFOR", "", 2000, -1, "" }, //Black
			{ "NVGoggles_INDEP", "", 2000, -1, "" }, //Green
			{ "NVGoggles_tna_F", "", 2000, -1, "" }, //Tropic
            { "Chemlight_red", "", 300, -1, "" },
            { "Chemlight_yellow", "", 300, -1, "" },
            { "Chemlight_green", "", 300, -1, "" },
            { "Chemlight_blue", "", 300, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    //Cop Shops
    class cop_basic {
        name = "Altis Cop Shop";
        side = "cop";
        conditions = "";
        items[] = {
            { "Binocular", "", 0, -1, "call life_coplevel >= 1" },
            { "ItemGPS", "", 0, -1, "call life_coplevel >= 1" },
            { "FirstAidKit", "", 0, -1, "call life_coplevel >= 1" },
            { "NVGoggles_OPFOR", "", 0, -1, "call life_coplevel >= 1" },
			{ "Rangefinder", "", 0, -1, "call life_coplevel >= 1" },
			{ "SmokeShellBlue", "", 0, -1, "call life_coplevel >= 3" }, //SmokeBlue
            { "hgun_P07_snds_F", $STR_W_items_StunPistol, 0, -1, "call life_coplevel >= 1" }, //TaserPistol
            { "arifle_SDAR_F", $STR_W_items_TaserRifle, 0, -1, "call life_coplevel >= 1" }, //TaserRifle
            { "SMG_05_F", "", 0, -1, "call life_coplevel >= 1" }, //Protector	
			{ "SMG_02_F", "", 0, -1, "call life_coplevel >= 1" }, //Sting
			{ "arifle_Mk20_F", "", 0, -1, "call life_coplevel >= 1" }, //Mk20
            { "arifle_SPAR_01_blk_F", "", 0, -1, "call life_coplevel >= 1" }, //SPAR16
			{ "HandGrenade_Stone", $STR_W_items_Flashbang, 0, -1, "call life_coplevel >= 3" }, //Flashbang
            { "arifle_MXC_Black_F", "", 0, -1, "call life_coplevel >= 2" }, //MXC
            { "arifle_MX_Black_F", "", 0, -1, "call life_coplevel >= 2" }, //MX
            { "arifle_MXM_Black_F", "", 0, -1, "call life_coplevel >= 2" }, //MXM
            { "arifle_SPAR_02_blk_F", "", 0, -1, "call life_coplevel >= 3" }, //SPAR16S
            { "srifle_DMR_06_olive_F", "", 0, -1, "call life_coplevel >= 3" }, //MK14
			{ "arifle_SPAR_03_blk_F", "", 0, -1, "call life_coplevel >= 3" }, //SPAR17
            { "srifle_EBR_F", "", 0, -1, "call life_coplevel >= 3" }, //MK18
            { "arifle_MX_SW_Black_F", "", 0, -1, "call life_coplevel >= 4" }, //MXSW
            { "srifle_DMR_03_F", "", 0, -1, "call life_coplevel >= 4" }, //MKIEMR
            { "LMG_Mk200_F", "", 0, -1, "call life_coplevel >= 4" }, //MK200
            { "srifle_DMR_02_F", "", 0, -1, "call life_coplevel >= 5" } //MAR10
        };
        mags[] = {
            { "20Rnd_556x45_UW_mag", $STR_W_mags_TaserRifle, 0, -1, "call life_coplevel >= 1" }, 
            { "16Rnd_9x21_Mag", "", 0, -1, "call life_coplevel >= 1" }, 
            { "30Rnd_9x21_Mag_SMG_02", "", 25, -1, "call life_coplevel >= 1" },
            { "30Rnd_556x45_Stanag", "", 0, -1, "call life_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag", "", 0, -1, "call life_coplevel >= 2" },
            { "150Rnd_556x45_Drum_Mag_F", "", 0, -1, "call life_coplevel >= 3" }, 
            { "20Rnd_762x51_Mag", "", 0, -1, "call life_coplevel >= 3" }, 
            { "100Rnd_65x39_caseless_mag", "", 0, -1, "call life_coplevel >= 4" }, 
            { "200Rnd_65x39_cased_Box", "", 0, -1, "call life_coplevel >= 4" }, 
            { "10Rnd_338_Mag", "", 0, -1, "call life_coplevel >= 5" }
        };
        accs[] = {
            { "muzzle_snds_L", "", 0, -1, "call life_coplevel >= 1" }, //9MMSuppressor
            { "acc_pointer_IR", "", 0, -1, "call life_coplevel >= 1" }, //Laser Pointer
            { "acc_flashlight", "", 0, -1, "call life_coplevel >= 1" }, //Flashlight
            { "optic_ACO_grn", "", 0, -1, "call life_coplevel >= 1" }, //ACOGreen
			{ "optic_Aco", "", 0, -1, "call life_coplevel >= 1" }, //ACORed
            { "optic_Holosight_blk_F", "", 0, -1, "call life_coplevel >= 1" }, //Mk17Holosight
            { "optic_MRCO", "", 0, -1, "call life_coplevel >= 1" }, //MRCO
            { "optic_Hamr", "", 0, -1, "call life_coplevel >= 1" }, //RCO
            { "optic_Arco_blk_F", "", 0, -1, "call life_coplevel >= 1" }, //ARCOBlack
            { "optic_ERCO_blk_F", "", 0, -1, "call life_coplevel >= 1" }, //ERCO
            { "bipod_01_F_blk", "", 0, -1, "call life_coplevel >= 2" }, //NATOBipod
            { "muzzle_snds_M", "", 0, -1, "call life_coplevel >= 2" }, //5.56mmSuppressor
            { "muzzle_snds_H", "", 0, -1, "call life_coplevel >= 2" }, //6.5mmSuppressor
            { "optic_SOS", "", 0, -1, "call life_coplevel >= 3" }, //SOS
            { "optic_DMS", "", 0, -1, "call life_coplevel >= 3" }, //DMS
            { "optic_LRPS", "", 0, -1, "call life_coplevel >= 3" }, //LRPS
            { "optic_AMS", "", 0, -1, "call life_coplevel >= 3" }, //AMS
            { "optic_KHS_blk", "", 0, -1, "call life_coplevel >= 3" }, //Kahlia
            { "muzzle_snds_B", "", 0, -1, "call life_coplevel >= 3" } //7.62mmSuppressor
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            { "Medikit", "", 0, -1, "" },			
            { "ItemGPS", "", 0, -1, "" },
            { "Binocular", "", 0, -1, "" },
            { "FirstAidKit", "", 0, -1, "" },
            { "NVGoggles_OPFOR", "", 0, -1, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};