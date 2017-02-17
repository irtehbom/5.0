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
            { "hgun_Rook40_F", "", 6500, 3250, "" },
            { "hgun_Pistol_01_F", "", 7000, 3500, "" }, //Apex DLC
            { "hgun_Pistol_heavy_02_F", "", 9850, 4925, "" },
            { "hgun_ACPC2_F", "", 11500, 5750, "" },
            { "SMG_05_F", "", 18000, 9000, "" }, //Apex DLC
            { "hgun_PDW2000_F", "", 20000, 10000, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" },
            { "30Rnd_9x21_Mag_SMG_02", "", 250, 125, "" }, //Apex DLC
            { "10Rnd_9x21_Mag", "", 250, 125, "" } //Apex DLC
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 2500, 1250, "" }
        };
    };

    class rebel {
        name = "Mohammed's Jihadi Shop";
        side = "civ";
        conditions = "license_civ_rebel";
        items[] = {
            { "hgun_ACPC2_F", "", 2500, 1250, "" }, //ACPC2
            { "hgun_Pistol_heavy_01_F", "", 3500, 1750, "" }, //4Five
            { "hgun_Pistol_heavy_02_F", "", 5000, 2500, "" }, //Zubr
            { "SMG_01_F", "", 10000, 5000, "" }, //Vermin
            { "SMG_02_F", "", 15000, 7500, "" }, //Sting
            { "arifle_AKS_F", "", 30000, 15000, "" }, //AKS74U
            { "arifle_TRG21_F", "", 40000, 20000, "" }, //TRG21
            { "arifle_CTAR_blk_F", "", 45000, 22500, "" }, //CAR95
            { "arifle_ARX_blk_F", "", 65000, 32500, "" }, //Type115
            { "arifle_Katiba_F", "", 65000, 32500, "" }, //Katiba
			{ "srifle_DMR_07_blk_F", "", 70000, 35000, "" }, //CMR76
			{ "arifle_CTARS_blk_F", "", 80000, 40000, "" }, //CAR951
			{ "LMG_03_F", "", 115000, 57500, "" }, //LIM
			{ "LMG_Zafir_F", "", 200000, 100000, "" }, //Zafir
			{ "arifle_AKM_F", "", 75000, 37500, "" }, //AKM
			{ "srifle_DMR_01_F", "", 100000, 50000, "" }, //Rahim
			{ "arifle_AK12_F", "", 105000, 52500, "" }, //AK12
			{ "srifle_DMR_06_camo_khs_F", "", 110000, 55000, "" }, //MK14
			{ "srifle_EBR_F", "", 125000, 62500, "" }, //MK18A
			{ "srifle_DMR_03_woodland_F", "", 150000, 75000, "" } //MKIEMR
        };
        mags[] = {
            { "30Rnd_556x45_Stanag", "", 300, 150, "" },
            { "30Rnd_762x39_Mag_F", "", 300, 150, "" }, //Apex DLC
            { "30Rnd_545x39_Mag_F", "", 300, 150, "" }, //Apex DLC
            { "30Rnd_65x39_caseless_green", "", 275, 140, "" },
            { "10Rnd_762x54_Mag", "", 500, 250, "" },
            { "20Rnd_556x45_UW_mag", "", 125, 60, "" },
            { "30Rnd_580x42_Mag_F", "", 125, 60, "" } //Apex DLC
        };
        accs[] = {
            { "optic_ACO_grn", "", 3500, 1750, "" },
            { "optic_Holosight", "", 3600, 1800, "" },
            { "optic_Hamr", "", 7500, 3750, "" },
            { "acc_flashlight", "", 1000, 500, "" }
        };
    };

    class gang {
        name = "Hideout Armament";
        side = "civ";
        conditions = "";
        items[] = {
            { "hgun_Rook40_F", "", 1500, 750, "" },
            { "hgun_Pistol_heavy_02_F", "", 2500, 1250, "" },
            { "hgun_ACPC2_F", "", 4500, 2250, "" },
            { "hgun_PDW2000_F", "", 9500, 4750, "" }
        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "6Rnd_45ACP_Cylinder", "", 150, 75, "" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "" },
            { "30Rnd_9x21_Mag", "", 250, 125, "" }
        };
        accs[] = {
            { "optic_ACO_grn_smg", "", 950, 475, "" }
        };
    };

    //Basic Shops
    class genstore {
        name = "Altis General Store";
        side = "civ";
        conditions = "";
        items[] = {
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "ItemMap", "", 50, 25, "" },
            { "ItemCompass", "", 50, 25, "" },
            { "ItemWatch", "", 50, 25, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000, 1000, "" },
            { "Chemlight_red", "", 300, 150, "" },
            { "Chemlight_yellow", "", 300, 150, "" },
            { "Chemlight_green", "", 300, 150, "" },
            { "Chemlight_blue", "", 300, 150, "" }
        };
        mags[] = {};
        accs[] = {};
    };

    class f_station_store {
        name = "Altis Fuel Station Store";
        side = "";
        conditions = "";
        items[] = {
            { "Binocular", "", 750, 75, "" },
            { "ItemGPS", "", 500, 50, "" },
            { "ItemMap", "", 250, 25, "" },
            { "ItemCompass", "", 250, 25, "" },
            { "ItemWatch", "", 250, 25, "" },
            { "FirstAidKit", "", 750, 75, "" },
            { "NVGoggles", "", 10000, 1000, "" },
            { "Chemlight_red", "", 1500, 150, "" },
            { "Chemlight_yellow", "", 1500, 150, "" },
            { "Chemlight_green", "", 1500, 150, "" },
            { "Chemlight_blue", "", 1500, 150, "" }
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
            { "Binocular", "", 150, 75, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 2000, 1000, "" },
            { "HandGrenade_Stone", $STR_W_items_Flashbang, 1700, 850, "" },
            { "hgun_P07_snds_F", $STR_W_items_StunPistol, 2000, 1000, "" },
            { "arifle_SDAR_F", $STR_W_items_TaserRifle, 20000, 10000, "" },
            { "hgun_P07_F", "", 7500, 3750, "" },
            { "hgun_P07_khk_F", "", 7500, 3750, "" }, //Apex DLC			
            { "SMG_01_F", "", 10000, 3750, "" }, //Vermin
            { "hgun_P07_khk_F", "", 7500, 3750, "" }, //Apex DLC
            { "hgun_P07_khk_F", "", 7500, 3750, "" }, //Apex DLC
            { "hgun_Pistol_heavy_01_F", "", 9500, 4750, "call life_coplevel >= 1" },
            { "SMG_02_ACO_F", "", 30000, 15000, "call life_coplevel >= 2" },
            { "arifle_MX_F", "", 35000, 17500, "call life_coplevel >= 2" },
            { "hgun_ACPC2_F", "", 17500, 8750, "call life_coplevel >= 3" },
            { "arifle_MXC_F", "", 30000, 15000, "call life_coplevel >= 3" }, //NX Carbide
            { "srifle_DMR_07_blk_F", "", 32000, 16000, "call life_coplevel >= 3" }, //Apex DLC Sniper
            { "hgun_Pistol_heavy_02_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Revolver
            { "arifle_MX_SW_Black_F", "", 10000, 6000, "call life_coplevel >= 4" }, //MXSW
            { "arifle_MXM_Black_F", "", 10000, 6000, "call life_coplevel >= 4" }, //MXM
            { "LMG_Mk200_F", "", 10000, 6000, "call life_coplevel >= 4" }, //MK200
            { "LMG_Zafir_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Zafir
			{ "srifle_DMR_01_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Rahim
			{ "srifle_EBR_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Mk 18
			{ "srifle_DMR_02_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Mark 10
			{ "srifle_DMR_05_blk_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Cyrus
			{ "srifle_GM6_camo_F", "", 10000, 6000, "call life_coplevel >= 4" }, //Lynx
			{ "srifle_LRR_camo_F", "", 10000, 6000, "call life_coplevel >= 4" }, //M320
			{ "srifle_DMR_06_olive_F", "", 10000, 6000, "call life_coplevel >= 4" } //MK14


        };
        mags[] = {
            { "16Rnd_9x21_Mag", "", 125, 60, "" },
            { "20Rnd_556x45_UW_mag", $STR_W_mags_TaserRifle, 125, 60, "" },
            { "11Rnd_45ACP_Mag", "", 130, 65, "call life_coplevel >= 1" },
            { "30Rnd_65x39_caseless_mag", "", 130, 65, "call life_coplevel >= 2" },
            { "30Rnd_9x21_Mag", "", 250, 125, "call life_coplevel >= 2" },
            { "9Rnd_45ACP_Mag", "", 200, 100, "call life_coplevel >= 3" },
            { "20Rnd_650x39_Cased_Mag_F", "", 200, 100, "call life_coplevel >= 3" }, //Apex DLC
            { "6Rnd_45ACP_Cylinder", "", 200, 100, "call life_coplevel >= 4" }, //MXSW
            { "100Rnd_65x39_caseless_mag", "", 200, 100, "call life_coplevel >= 4" }, //MXSW
            { "200Rnd_65x39_cased_Box", "", 200, 100, "call life_coplevel >= 4" }, //MK200
            { "200Rnd_65x39_cased_Box_Tracer", "", 200, 100, "call life_coplevel >= 4" }, //MK200
            { "150Rnd_762x54_Box", "", 200, 100, "call life_coplevel >= 4" }, //Zafir
            { "150Rnd_762x54_Box_Tracer", "", 200, 100, "call life_coplevel >= 4" }, //Zafir
            { "10Rnd_762x54_Mag", "", 200, 100, "call life_coplevel >= 4" }, //Rahim
            { "20Rnd_762x51_Mag", "", 200, 100, "call life_coplevel >= 4" }, //Mk18
            { "10Rnd_338_Mag", "", 200, 100, "call life_coplevel >= 4" }, //Mark 10
            { "10Rnd_93x64_DMR_05_Mag", "", 200, 100, "call life_coplevel >= 4" }, //Cyrus
            { "5Rnd_127x108_Mag", "", 200, 100, "call life_coplevel >= 4" }, //5Rnd_127x108_Mag //Lynx
            { "5Rnd_127x108_APDS_Mag", "", 200, 100, "call life_coplevel >= 4" }, //5Rnd_127x108_APDS_Mag //Lynx
            { "7Rnd_408_Mag", "", 200, 100, "call life_coplevel >= 4" } //7Rnd_408_Mag //M320
        };
        accs[] = {
            { "muzzle_snds_L", "", 650, 325, "" }, //9MM Suppressor
            { "optic_MRD", "", 2750, 1375, "call life_coplevel >= 1" },
            { "acc_flashlight", "", 750, 375, "call life_coplevel >= 2" },
            { "optic_Holosight", "", 1200, 600, "call life_coplevel >= 2" },
            { "optic_Arco", "", 2500, 1250, "call life_coplevel >= 2" },
            { "muzzle_snds_B", "", 2750, 1375, "call life_coplevel >= 2" }, //7.62 Suppressor
            { "muzzle_snds_H_MG", "", 2750, 1375, "call life_coplevel >= 2" }, //Suppressor 6.5mm HMG
            { "muzzle_snds_H", "", 2750, 1375, "call life_coplevel >= 2" }, //Suppressor 6.5mm
            { "muzzle_snds_M", "", 2750, 1375, "call life_coplevel >= 2" }, //Suppressor 5.56mm
            { "optic_SOS", "", 2750, 1375, "call life_coplevel >= 2" }, //SOS Scope
            { "optic_DMS", "", 2750, 1375, "call life_coplevel >= 2" }, //DMS Scope
            { "optic_LRPS", "", 2750, 1375, "call life_coplevel >= 2" }, //LRPS Scope
            { "muzzle_snds_338_green", "", 2750, 1375, "call life_coplevel >= 2" }, //Suppressor .338
            { "muzzle_snds_93mmg", "", 2750, 1375, "call life_coplevel >= 2" }, //Suppressor 9.3mm
            { "optic_AMS", "", 2750, 1375, "call life_coplevel >= 2" }, //AMS Scope
            { "bipod_01_F_blk", "", 2750, 1375, "call life_coplevel >= 2" }, //Bipod Black
            { "bipod_02_F_hex", "", 2750, 1375, "call life_coplevel >= 2" }, //Bipod Hex
            { "bipod_01_F_mtp", "", 2750, 1375, "call life_coplevel >= 2" } //Bipod MTP
        };
    };

    //Medic Shops
    class med_basic {
        name = "store";
        side = "med";
        conditions = "";
        items[] = {
            { "Medikit", "", 100, 50, "" },			
            { "Toolkit", "", 250, 50, "" },
            { "ItemGPS", "", 100, 50, "" },
            { "Binocular", "", 150, 75, "" },
            { "FirstAidKit", "", 150, 75, "" },
            { "NVGoggles", "", 1200, 600, "" }
        };
        mags[] = {};
        accs[] = {};
    };
};
