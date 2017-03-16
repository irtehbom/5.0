/*
*    ARRAY FORMAT:
*        0: STRING (Classname)
*        1: STRING (Display Name, leave as "" for default)
*        2: SCALAR (Price)
*        3: STRING (Conditions) - Must return boolean :
*            String can contain any amount of conditions, aslong as the entire
*            string returns a boolean. This allows you to check any levels, licenses etc,
*            in any combination. For example:
*                "call life_coplevel && license_civ_someLicense"
*            This will also let you call any other function.
*
*   Clothing classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgWeapons_Equipment
*   Backpacks/remaining classnames can be found here (TIP: Search page for "pack"): https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EMPTY
*
*/
class Clothing {
    class bruce {
        title = "STR_Shops_C_Bruce";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Poloshirt_stripped", "", 125, "" },
            { "U_C_Poloshirt_redwhite", "", 150, "" },
            { "U_C_Poloshirt_salmon", "", 175, "" },
            { "U_C_Poloshirt_blue", "", 250, "" },
            { "U_C_Poloshirt_burgundy", "", 275, "" },
            { "U_C_Poloshirt_tricolour", "", 350, "" },
            { "U_C_Poor_2", "", 250, "" },
            { "U_IG_Guerilla2_2", "", 650, "" },
            { "U_IG_Guerilla3_1", "", 735, "" },
            { "U_OrestesBody", "", 1100, "" },
            { "U_IG_Guerilla2_3", "", 1200, "" },
            { "U_C_HunterBody_grn", "", 1500, "" },
            { "U_C_WorkerCoveralls", "", 2500, "" },
            { "U_NikosBody", "", 3000, "" },
            { "U_NikosAgedBody", $STR_C_Civ_Niko, 5000, "" },
            { "U_C_Man_casual_1_F", "", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_2_F", "", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_3_F", "", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_4_F", "", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_5_F", "", 5000, "" }, //Apex DLC
            { "U_C_Man_casual_6_F", "", 5000, "" }, //Apex DLC
            { "U_C_man_sport_1_F", "", 5000, "" }, //Apex DLC
            { "U_C_man_sport_2_F", "", 5000, "" }, //Apex DLC
            { "U_C_man_sport_3_F", "", 5000, "" } //Apex DLC
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Bandanna_camo", "", 120, "" },
            { "H_Bandanna_surfer", "", 130, "" },
            { "H_Bandanna_khk", "", 145, "" },
            { "H_Cap_blu", "", 150, "" },
            { "H_Cap_grn", "", 150, "" },
            { "H_Cap_grn_BI", "", 150, "" },
            { "H_Cap_oli", "", 150, "" },
            { "H_Cap_red", "", 150, "" },
            { "H_Cap_tan", "", 150, "" },
            { "H_Helmet_Skate", "", 150, "" }, //Apex DLC
            { "H_Bandanna_gry", "", 150, "" },
            { "H_Bandanna_sgg", "", 160, "" },
            { "H_Bandanna_cbr", "", 165, "" },
            { "H_StrawHat", "", 225, "" },
            { "H_Hat_tan", "", 265, "" },
            { "H_Hat_brown", "", 276, "" },
            { "H_Hat_grey", "", 280, "" },
            { "H_BandMask_blk", $STR_C_Civ_BandMask, 300, "" },
            { "H_Hat_blue", "", 310, "" },
            { "H_Hat_checker", "", 340, "" },
            { "H_Booniehat_tan", "", 425, "" },
            { "H_Booniehat_grn", "", 425, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Black", "", 20, "" },
            { "G_Shades_Blue", "", 20, "" },
            { "G_Shades_Green", "", 20, "" },
            { "G_Shades_Red", "", 20, "" },
            { "G_Sport_Blackred", "", 25, "" },
            { "G_Sport_BlackWhite", "", 25, "" },
            { "G_Sport_Blackyellow", "", 25, "" },
            { "G_Sport_Checkered", "", 25, "" },
            { "G_Sport_Greenblack", "", 25, "" },
            { "G_Sport_Red", "", 25, "" },
            { "G_Lowprofile", "", 30, "" },
            { "G_Squares", "", 50, "" },
            { "G_Aviator", "", 100, "" },
            { "G_Combat", "", 125, "" },
            { "G_Lady_Mirror", "", 150, "" },
            { "G_Lady_Dark", "", 150, "" },
            { "G_Lady_Blue", "", 150, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_BandollierB_blk", "", 500, "" }, //SlashBandolierBlack
            { "V_BandollierB_cbr", "", 500, "" }, //SlashBandolierCoyote
            { "V_BandollierB_ghex_F", "", 500, "" }, //SlashBandolierGreenHex
            { "V_BandollierB_rgr", "", 500, "" }, //SlashBandolierGreen
            { "V_BandollierB_khk", "", 500, "" }, //SlashBandolierKhaki
            { "V_BandollierB_oli", "", 500, "" } //SlashBandolierOlive
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_AssaultPack_tna_f", "", 2000, "" }, //Apex DLC
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_FieldPack_ghex_f", "", 5000, "" }, //Apex DLC
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_ViperHarness_ghex_F", "", 7000, "" }, //ViperHarnessGreenHex
            { "B_ViperHarness_hex_F", "", 7000, "" }, //ViperHarnessHex
            { "B_ViperHarness_khk_F", "", 7000, "" }, //ViperHarnessKhaki
            { "B_ViperHarness_oli_F", "", 7000, "" }, //ViperHarnessOlive
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" },
            { "B_Carryall_ghex_F", "", 7500, "" }
        };
    };
 
    class cop {
        title = "STR_Shops_C_Police";
        conditions = "";
        side = "cop";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_B_CombatUniform_mcam", $STR_C_Cop_uniforms, 0, "" }, //DefaultCop
            { "U_B_GEN_Soldier_F", "", 0, "call life_coplevel >= 1" }, //GendarmarieUniform
            { "U_B_GEN_Commander_F", "", 0, "call life_coplevel >= 2" }, //GendarmarieCommander
            { "U_O_Wetsuit", "", 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "call life_coplevel >= 1" },
            { "H_Cap_police", "", 0, "call life_coplevel >= 1" }, //PoliceCap
            { "H_Watchcap_blk", "", 0, "call life_coplevel >= 1" }, //BlackBeanie
            { "H_HelmetB_black", "", 0, "call life_coplevel >= 2" }, //CombatHelmetBlack
            { "H_MilCap_gen_F", "", 0, "call life_coplevel >= 2" }, //MilitaryCapGendarmarie
            { "H_HelmetSpecB_blk", "", 0, "call life_coplevel >= 3" }, //EnhancedCombatHelmet
            { "H_Beret_02", "", 0, "call life_coplevel >= 4" }, //BeretNATO
            { "H_PilotHelmetHeli_B", "", 0, "call life_coplevel >= 4" }, //HeliPilotHelmetNATO
            { "H_Beret_gen_F", "", 0, "call life_coplevel >= 5" } //BeretGendarmarie
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Blue", "", 0, "call life_coplevel >= 1" }, //ShadesBlue
            { "G_Aviator", "", 0, "call life_coplevel >= 1" }, //Aviators
            { "G_Spectacles_Tinted", "", 0, "call life_coplevel >= 1" }, //TintedSpectacles
            { "G_Tactical_Black", "", 0, "call life_coplevel >= 1" }, //TacticalShades
            { "G_Balaclava_TI_blk_F", "", 0, "call life_coplevel >= 4" }, //StealthBalaclavaBlack
            { "G_Diving", "", 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_TacVest_blk_POLICE", "", 0, "call life_coplevel >= 1" }, //TacticalVestPolice
            { "V_TacVest_gen_F", "", 0, "call life_coplevel >= 1" }, //GendarmarieVest
            { "V_PlateCarrier1_blk", "", 0, "call life_coplevel >= 2" }, //CarrierLite
            { "V_PlateCarrier2_blk", "", 0, "call life_coplevel >= 3" }, //CarrierRig
            { "V_RebreatherB", "", 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "call life_coplevel >= 1" },
            { "B_AssaultPack_blk", "", 0, "call life_coplevel >= 1" }, //AssaultPack
            { "B_FieldPack_blk", "", 0, "call life_coplevel >= 1" }, //FieldPack
            { "B_TacticalPack_blk", "", 0, "call life_coplevel >= 1" }, //TacticalPack
            { "B_ViperHarness_blk_F", "", 0, "call life_coplevel >= 1" }, //ViperHarness
            { "B_Bergen_blk", "", 0, "call life_coplevel >= 1" }, //Bergen
            { "B_Carryall_cbr", "", 0, "call life_coplevel >= 1" } //Carryall
        };
    };
 
    class dive {
        title = "STR_Shops_C_Diving";
        conditions = "license_civ_dive";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_O_Wetsuit", "", 2000, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Diving", "", 500, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_RebreatherIR", "", 5000, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
 
    class gun_clothing {
        title = "STR_Shops_C_Gun";
        conditions = "license_civ_gun";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 4900, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
 
    class gang_clothing {
        title = "STR_Shops_C_Gang";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_Rangemaster_belt", "", 1900, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
 
    class med_clothing {
        title = "STR_MAR_EMS_Clothing_Shop";
        conditions = "";
        side = "med";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_Rangemaster", $STR_C_EMS_uniforms, 0, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Cap_blu", "", 0, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Shades_Blue", "", 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_FieldPack_oli", $STR_C_EMS_backpacks, 0, "" }
        };
    };
 
    class reb {
        title = "STR_Shops_C_Rebel";
        conditions = "license_civ_rebel";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_I_C_Soldier_Bandit_5_F", "", 250, "" }, //BanditTankTop
            { "U_I_C_Soldier_Bandit_3_F", "", 250, "" }, //BanditTee
            { "U_I_C_Soldier_Para_4_F", "", 500, "" }, //ParamilitaryTank
            { "U_I_C_Soldier_Para_1_F", "", 500, "" }, //ParamilitaryTee
            { "U_I_C_Soldier_Para_3_F", "", 500, "" }, //ParamilitaryShirt
            { "U_I_C_Soldier_Para_2_F", "", 500, "" }, //ParamilitaryJacket
            { "U_I_C_Soldier_Camo_F", "", 500, "" }, //SkyndikatUniform
            { "U_BG_Guerrilla_6_1", "", 750, "" }, //GuerillaApparel
            { "U_BG_Guerilla1_1", "", 750, "" }, //GuerillaGarment
            { "U_BG_leader", "", 750, "" }, //GuerillaUniform
            { "U_I_CombatUniform", "", 1250, "" }, //CombatFatiguesAAF
            { "U_I_CombatUniform_shortsleeve", "", 1250, "" }, //CombatFatiguesAAFShortSleeves
            { "U_I_OfficerUniform", "", 1250, "" }, //CombatFatiguesAAFOfficer
            { "U_B_CombatUniform_mcam_tshirt", "", 1250, "" }, //CombatFatiguesTee
            { "U_B_CombatUniform_mcam_vest", "", 1250, "" }, //ReconFatiguesShortSleeves
            { "U_B_CombatUniform_mcam", "", 1250, "" }, //CombatFatigues
            { "U_B_T_Soldier_AR_F", "", 1500, "" }, //CombatFatiguesTropicTee
            { "U_B_T_Soldier_SL_F", "", 1500, "" }, //ReconFatiguesTropicShortSleeves
            { "U_B_T_Soldier_F", "", 1500, "" }, //CombatFatiguesTropic
            { "U_B_CTRG_2", "", 1750, "" }, //CTRGCombatTee
            { "U_B_CTRG_3", "", 1750, "" }, //CTRGCombatShortSleeves
            { "U_B_CTRG_1", "", 1750, "" }, //CTRGCombat
            { "U_B_CTRG_Soldier_urb_2_F", "", 1750, "" }, //CTRGUrbanTee
            { "U_B_CTRG_Soldier_urb_3_F", "", 1750, "" }, //CTRGUrbanShortSleeves
            { "U_B_CTRG_Soldier_urb_1_F", "", 1750, "" }, //CTRGUrban
            { "U_O_T_Officer_F", "", 2000, "" }, //OfficerFatiguesGreenHex
            { "U_O_OfficerUniform_ocamo", "", 2000, "" }, //OfficerFatiguesHex
            { "U_O_T_Sniper_F", "", 35000, "" }, //GhillieSuitTropicCSAT
            { "U_O_GhillieSuit", "", 35000, "" }, //GhillieSuitAAF
            { "U_O_GhillieSuit", "", 35000, "" }, //GhillieSuitCSAT
            { "U_O_FullGhillie_ard", "", 40000, "" }, //FullGhillieCSAT
            { "U_O_T_FullGhillie_tna_F", "", 40000, "" }, //FullGhillieJungleNATO
            { "U_O_FullGhillie_lsh", "", 40000, "" }, //FullGhillieLushCSAT
            { "U_O_FullGhillie_sard", "", 40000, "" } //FullGhillieSemiAridCSAT
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Bandanna_gry", "", 25, "" }, //BandanaBlack
            { "H_Bandanna_cbr", "", 25, "" }, //BandanaCoyote
            { "H_Bandanna_khk", "", 25, "" }, //BandanaKhaki
            { "H_Bandanna_mcamo", "", 25, "" }, //BandanaMTP
            { "H_Bandanna_mcamo", "", 25, "" }, //BandanaSage
            { "H_Bandanna_sand", "", 25, "" }, //BandanaSand
            { "H_Bandanna_camo", "", 25, "" }, //BandanaWoodland
            { "H_Watchcap_blk", "", 25, "" }, //BeanieBlack
            { "H_Watchcap_cbr", "", 25, "" }, //BeanieCoyote
            { "H_Watchcap_camo", "", 25, "" }, //BeanieGreen
            { "H_Watchcap_khk", "", 25, "" }, //BeanieKhaki
            { "H_Watchcap_sgg", "", 25, "" }, //BeanieSage
            { "H_Cap_blk", "", 25, "" }, //CapBlack
            { "H_Cap_grn", "", 25, "" }, //CapGreen
            { "H_Cap_oli", "", 25, "" }, //CapOlive
            { "H_Cap_surfer", "", 25, "" }, //CapSurfer
            { "H_Cap_tan", "", 25, "" }, //CapTan
            { "H_Cap_khaki_specops_UK", "", 25, "" }, //CapUK
            { "H_Cap_tan_specops_US", "", 25, "" }, //CapUS
            { "H_Cap_blk_Raven", "", 25, "" }, //CapAAF
            { "H_Cap_brn_SPECOPS", "", 25, "" }, //CapOpfor
            { "H_Booniehat_khk", "", 50, "" }, //BoonieKhaki
            { "H_Booniehat_mcamo", "", 50, "" }, //BoonieMTP
            { "H_Booniehat_oli", "", 50, "" }, //BoonieOlive
            { "H_Booniehat_tan", "", 50, "" }, //BoonieSand
            { "H_Booniehat_tna_F", "", 50, "" }, //BoonieTropic
            { "H_Booniehat_dgtl", "", 50, "" }, //BoonieAAF
            { "H_MilCap_ghex_F", "", 75, "" }, //MilitaryCapGreenHex
            { "H_MilCap_gry", "", 75, "" }, //MilitaryCapGrey
            { "H_MilCap_ocamo", "", 75, "" }, //MilitaryCapHex
            { "H_MilCap_mcamo", "", 75, "" }, //MilitaryCapMTP
            { "H_MilCap_tna_F", "", 75, "" }, //MilitaryCapTropic
            { "H_MilCap_dgtl", "", 75 "" }, //MilitaryCapAAF
            { "H_Shemag_olive", "", 100, "" }, //ShemagOlive
            { "H_ShemagOpen_tan", "", 100, "" }, //ShemagTan
            { "H_ShemagOpen_khk", "", 100, "" }, //ShemagWhite
            { "H_HelmetB_light", "", 500, "" }, //LightHelmet
            { "H_HelmetB_light_black", "", 500, "" }, //LightHelmetBlack
            { "H_HelmetB_light_desert", "", 500, "" }, //LightHelmetDesert
            { "H_HelmetB_light_grass", "", 500, "" }, //LightHelmetGrass
            { "H_HelmetB_light_sand", "", 500, "" }, //LightHelmetSand
            { "H_HelmetB_light_snakeskin", "", 500, "" }, //LightHelmetSnakeskin
            { "H_HelmetB_Light_tna_F", "", 500, "" }, //LightHelmetTropic
            { "H_HelmetIA", "", 650, "" }, //ModularHelmet
            { "H_HelmetB_TI_tna_F", "", 750, "" }, //StealthHelmet
            { "H_CrewHelmetHeli_I", "", 950, "" }, //HeliHelmetAAF
            { "H_CrewHelmetHeli_O", "", 950, "" }, //HeliHelmetCSAT
            { "H_CrewHelmetHeli_B", "", 950, "" }, //HeliHelmetNATO
            { "H_HelmetB", "", 1250, "" }, //CombatHelmet
            { "H_HelmetB_camo", "", 1250, "" }, //CombatHelmetCamo
            { "H_HelmetB_desert", "", 1250, "" }, //CombatHelmetDesert
            { "H_HelmetB_grass", "", 1250, "" }, //CombatHelmetGrass
            { "H_HelmetB_sand", "", 1250, "" }, //CombatHelmetSand
            { "H_HelmetB_snakeskin", "", 1250, "" }, //CombatHelmetSnakeskin
            { "H_HelmetB_paint", "", 1250, "" }, //CombatHelmetPaint
            { "H_HelmetB_tna_F", "", 1250, "" }, //CombatHelmetTropic
            { "H_HelmetO_ghex_F", "", 1750, "" }, //ProtectorHelmetGreenHex
            { "H_HelmetO_ocamo", "", 1750, "" }, //ProtectorHelmetHex
            { "H_HelmetO_oucamo", "", 1750, "" }, //ProtectorHelmetUrban
            { "H_Beret_blk", "", 500, "" } //BeretBlack
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
            { "G_Aviator", "", 50, "" }, //Aviators
            { "G_Tactical_Black", "", 50, "" }, //TacticalShades
            { "G_Spectacles_Tinted", "", 50, "" }, //TintedSpectacles
            { "G_Squares", "", 50, "" }, //SquareSpectacles
            { "G_Shades_Black", "", 50, "" }, //ShadesBlack
            { "G_Sport_Blackred", "", 50, "" }, //SportShadesBlack
            { "G_Lowprofile", "", 50, "" }, //LowProfileGoggles
            { "G_Combat", "", 200, "" }, //CombatGoggles
            { "G_Combat_Goggles_tna_F", "", 200, "" }, //CombatGogglesGreen
            { "G_Bandanna_blk", "", 100, "" }, //BandanaBlack
            { "G_Bandanna_khk", "", 100, "" }, //BandanaKhaki
            { "G_Bandanna_oli", "", 100, "" }, //BandanaOlive
            { "G_Bandanna_tan", "", 100, "" }, //BandanaTan
            { "G_Bandanna_beast", "", 100, "" }, //BandanaBeast
            { "G_Bandanna_sport", "", 100, "" }, //BadanaSportGlasses
            { "G_Bandanna_shades", "", 100, "" }, //BandanaShadesGlasses
            { "G_Bandanna_aviator", "", 150, "" }, //BandanaAviators
            { "G_Balaclava_blk", "", 250, "" }, //BalaclavaBlack
            { "G_Balaclava_oli", "", 250, "" } //BalaclavaOlive
            
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_TacChestrig_cbr_F", "", 500, "" }, //TacticalChestRigCoyote
            { "V_TacChestrig_grn_F", "", 500, "" }, //TacticalChestRigGreen
            { "V_TacChestrig_oli_F", "", 500, "" }, //TacticalChestRigOlive
            { "V_Chestrig_blk", "", 550, "" }, //ChestRigBlack
            { "V_Chestrig_rgr", "", 550, "" }, //ChestRigGreen
            { "V_Chestrig_khk", "", 550, "" }, //ChestRigKhaki
            { "V_Chestrig_oli", "", 550, "" }, //ChestRigOlive
            { "V_HarnessO_brn", "", 750, "" }, //LBVHarnessBrown
            { "V_HarnessO_gry", "", 750, "" }, //LBVHarnessGrey
            { "V_HarnessO_ghex_F", "", 750, "" }, //LBVHarnessHex
            { "V_TacVest_blk", "", 1500, "" }, //TacticalVestBlack
            { "V_TacVest_brn", "", 1500, "" }, //TacticalVestBrown
            { "V_TacVest_camo", "", 1500, "" }, //TacticalVestCamo
            { "V_TacVest_khk", "", 1500, "" }, //TacticalVestKhaki
            { "V_TacVest_oli", "", 1500, "" }, //TacticalVestOlive
            { "V_PlateCarrier1_rgr", "", 8500, "" }, //CarrierLiteGreen
            { "V_PlateCarrier1_tna_F", "", 8500, "" }, //CarrierLiteTropic
            { "V_PlateCarrierL_CTRG", "", 8500, "" } //CTRGPlateCarrierRigLight
            
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_AssaultPack_tna_F", "", 2000, "" },
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_FieldPack_ghex_f", "", 5000, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_ViperHarness_ghex_F", "", 7000, "" }, //ViperHarnessGreenHex
            { "B_ViperHarness_hex_F", "", 7000, "" }, //ViperHarnessHex
            { "B_ViperHarness_khk_F", "", 7000, "" }, //ViperHarnessKhaki
            { "B_ViperHarness_oli_F", "", 7000, "" }, //ViperHarnessOlive
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" }
        };
    };
	
	class rebA {
        title = "STR_Shops_C_Rebel";
        conditions = "license_civ_rebel && license_civ_rebelAdvanced";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_I_C_Soldier_Bandit_5_F", "", 250, "" }, //BanditTankTop
            { "U_I_C_Soldier_Bandit_3_F", "", 250, "" }, //BanditTee
            { "U_I_C_Soldier_Para_4_F", "", 500, "" }, //ParamilitaryTank
            { "U_I_C_Soldier_Para_1_F", "", 500, "" }, //ParamilitaryTee
            { "U_I_C_Soldier_Para_3_F", "", 500, "" }, //ParamilitaryShirt
            { "U_I_C_Soldier_Para_2_F", "", 500, "" }, //ParamilitaryJacket
            { "U_I_C_Soldier_Camo_F", "", 500, "" }, //SkyndikatUniform
            { "U_BG_Guerrilla_6_1", "", 750, "" }, //GuerillaApparel
            { "U_BG_Guerilla1_1", "", 750, "" }, //GuerillaGarment
            { "U_BG_leader", "", 750, "" }, //GuerillaUniform
            { "U_I_CombatUniform", "", 1250, "" }, //CombatFatiguesAAF
            { "U_I_CombatUniform_shortsleeve", "", 1250, "" }, //CombatFatiguesAAFShortSleeves
            { "U_I_OfficerUniform", "", 1250, "" }, //CombatFatiguesAAFOfficer
            { "U_B_CombatUniform_mcam_tshirt", "", 1250, "" }, //CombatFatiguesTee
            { "U_B_CombatUniform_mcam_vest", "", 1250, "" }, //ReconFatiguesShortSleeves
            { "U_B_CombatUniform_mcam", "", 1250, "" }, //CombatFatigues
            { "U_B_T_Soldier_AR_F", "", 1500, "" }, //CombatFatiguesTropicTee
            { "U_B_T_Soldier_SL_F", "", 1500, "" }, //ReconFatiguesTropicShortSleeves
            { "U_B_T_Soldier_F", "", 1500, "" }, //CombatFatiguesTropic
            { "U_B_CTRG_2", "", 1750, "" }, //CTRGCombatTee
            { "U_B_CTRG_3", "", 1750, "" }, //CTRGCombatShortSleeves
            { "U_B_CTRG_1", "", 1750, "" }, //CTRGCombat
            { "U_B_CTRG_Soldier_urb_2_F", "", 1750, "" }, //CTRGUrbanTee
            { "U_B_CTRG_Soldier_urb_3_F", "", 1750, "" }, //CTRGUrbanShortSleeves
            { "U_B_CTRG_Soldier_urb_1_F", "", 1750, "" }, //CTRGUrban
            { "U_O_T_Officer_F", "", 2000, "" }, //OfficerFatiguesGreenHex
            { "U_O_OfficerUniform_ocamo", "", 2000, "" }, //OfficerFatiguesHex
            { "U_O_T_Sniper_F", "", 35000, "" }, //GhillieSuitTropicCSAT
            { "U_O_GhillieSuit", "", 35000, "" }, //GhillieSuitAAF
            { "U_O_GhillieSuit", "", 35000, "" }, //GhillieSuitCSAT
            { "U_O_FullGhillie_ard", "", 40000, "" }, //FullGhillieCSAT
            { "U_O_T_FullGhillie_tna_F", "", 40000, "" }, //FullGhillieJungleNATO
            { "U_O_FullGhillie_lsh", "", 40000, "" }, //FullGhillieLushCSAT
            { "U_O_FullGhillie_sard", "", 40000, "" } //FullGhillieSemiAridCSAT
          
        };
        headgear[] = {
			{ "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_Bandanna_gry", "", 25, "" }, //BandanaBlack
            { "H_Bandanna_cbr", "", 25, "" }, //BandanaCoyote
            { "H_Bandanna_khk", "", 25, "" }, //BandanaKhaki
            { "H_Bandanna_mcamo", "", 25, "" }, //BandanaMTP
            { "H_Bandanna_mcamo", "", 25, "" }, //BandanaSage
            { "H_Bandanna_sand", "", 25, "" }, //BandanaSand
            { "H_Bandanna_camo", "", 25, "" }, //BandanaWoodland
            { "H_Watchcap_blk", "", 25, "" }, //BeanieBlack
            { "H_Watchcap_cbr", "", 25, "" }, //BeanieCoyote
            { "H_Watchcap_camo", "", 25, "" }, //BeanieGreen
            { "H_Watchcap_khk", "", 25, "" }, //BeanieKhaki
            { "H_Watchcap_sgg", "", 25, "" }, //BeanieSage
            { "H_Cap_blk", "", 25, "" }, //CapBlack
            { "H_Cap_grn", "", 25, "" }, //CapGreen
            { "H_Cap_oli", "", 25, "" }, //CapOlive
            { "H_Cap_surfer", "", 25, "" }, //CapSurfer
            { "H_Cap_tan", "", 25, "" }, //CapTan
            { "H_Cap_khaki_specops_UK", "", 25, "" }, //CapUK
            { "H_Cap_tan_specops_US", "", 25, "" }, //CapUS
            { "H_Cap_blk_Raven", "", 25, "" }, //CapAAF
            { "H_Cap_brn_SPECOPS", "", 25, "" }, //CapOpfor
            { "H_Booniehat_khk", "", 50, "" }, //BoonieKhaki
            { "H_Booniehat_mcamo", "", 50, "" }, //BoonieMTP
            { "H_Booniehat_oli", "", 50, "" }, //BoonieOlive
            { "H_Booniehat_tan", "", 50, "" }, //BoonieSand
            { "H_Booniehat_tna_F", "", 50, "" }, //BoonieTropic
            { "H_Booniehat_dgtl", "", 50, "" }, //BoonieAAF
            { "H_MilCap_ghex_F", "", 75, "" }, //MilitaryCapGreenHex
            { "H_MilCap_gry", "", 75, "" }, //MilitaryCapGrey
            { "H_MilCap_ocamo", "", 75, "" }, //MilitaryCapHex
            { "H_MilCap_mcamo", "", 75, "" }, //MilitaryCapMTP
            { "H_MilCap_tna_F", "", 75, "" }, //MilitaryCapTropic
            { "H_MilCap_dgtl", "", 75 "" }, //MilitaryCapAAF
            { "H_Shemag_olive", "", 100, "" }, //ShemagOlive
            { "H_ShemagOpen_tan", "", 100, "" }, //ShemagTan
            { "H_ShemagOpen_khk", "", 100, "" }, //ShemagWhite
            { "H_HelmetB_light", "", 500, "" }, //LightHelmet
            { "H_HelmetB_light_black", "", 500, "" }, //LightHelmetBlack
            { "H_HelmetB_light_desert", "", 500, "" }, //LightHelmetDesert
            { "H_HelmetB_light_grass", "", 500, "" }, //LightHelmetGrass
            { "H_HelmetB_light_sand", "", 500, "" }, //LightHelmetSand
            { "H_HelmetB_light_snakeskin", "", 500, "" }, //LightHelmetSnakeskin
            { "H_HelmetB_Light_tna_F", "", 500, "" }, //LightHelmetTropic
            { "H_HelmetIA", "", 650, "" }, //ModularHelmet
            { "H_HelmetB_TI_tna_F", "", 750, "" }, //StealthHelmet
            { "H_CrewHelmetHeli_I", "", 950, "" }, //HeliHelmetAAF
            { "H_CrewHelmetHeli_O", "", 950, "" }, //HeliHelmetCSAT
            { "H_CrewHelmetHeli_B", "", 950, "" }, //HeliHelmetNATO
            { "H_HelmetB", "", 1250, "" }, //CombatHelmet
            { "H_HelmetB_camo", "", 1250, "" }, //CombatHelmetCamo
            { "H_HelmetB_desert", "", 1250, "" }, //CombatHelmetDesert
            { "H_HelmetB_grass", "", 1250, "" }, //CombatHelmetGrass
            { "H_HelmetB_sand", "", 1250, "" }, //CombatHelmetSand
            { "H_HelmetB_snakeskin", "", 1250, "" }, //CombatHelmetSnakeskin
            { "H_HelmetB_paint", "", 1250, "" }, //CombatHelmetPaint
            { "H_HelmetB_tna_F", "", 1250, "" }, //CombatHelmetTropic
            { "H_HelmetO_ghex_F", "", 1750, "" }, //ProtectorHelmetGreenHex
            { "H_HelmetO_ocamo", "", 1750, "" }, //ProtectorHelmetHex
            { "H_HelmetO_oucamo", "", 1750, "" }, //ProtectorHelmetUrban
            { "H_Beret_blk", "", 500, "" }, //BeretBlack
			{ "H_HelmetSpecB", "", 2500, "" }, //EnhancedCombatHelmet
            { "H_HelmetSpecB_paint2", "", 2500, "" }, //EnhancedCombatHelmetDesert
            { "H_HelmetSpecB_paint1", "", 2500, "" }, //EnhancedCombatHelmetGrass
            { "H_HelmetSpecB_sand", "", 2500, "" }, //EnhancedCombatHelmetSand
            { "H_HelmetSpecB_snakeskin", "", 2500, "" }, //EnhancedCombatHelmetSnakeskin
            { "H_HelmetB_Enh_tna_F", "", 2500, "" } //EnhancedCombatHelmetTropic
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" },
			{ "G_Aviator", "", 50, "" }, //Aviators
            { "G_Tactical_Black", "", 50, "" }, //TacticalShades
            { "G_Spectacles_Tinted", "", 50, "" }, //TintedSpectacles
            { "G_Squares", "", 50, "" }, //SquareSpectacles
            { "G_Shades_Black", "", 50, "" }, //ShadesBlack
            { "G_Sport_Blackred", "", 50, "" }, //SportShadesBlack
            { "G_Lowprofile", "", 50, "" }, //LowProfileGoggles
            { "G_Combat", "", 200, "" }, //CombatGoggles
            { "G_Combat_Goggles_tna_F", "", 200, "" }, //CombatGogglesGreen
            { "G_Bandanna_blk", "", 100, "" }, //BandanaBlack
            { "G_Bandanna_khk", "", 100, "" }, //BandanaKhaki
            { "G_Bandanna_oli", "", 100, "" }, //BandanaOlive
            { "G_Bandanna_tan", "", 100, "" }, //BandanaTan
            { "G_Bandanna_beast", "", 100, "" }, //BandanaBeast
            { "G_Bandanna_sport", "", 100, "" }, //BadanaSportGlasses
            { "G_Bandanna_shades", "", 100, "" }, //BandanaShadesGlasses
            { "G_Bandanna_aviator", "", 150, "" }, //BandanaAviators
            { "G_Balaclava_blk", "", 250, "" }, //BalaclavaBlack
            { "G_Balaclava_oli", "", 250, "" }, //BalaclavaOlive
			{ "G_Balaclava_TI_blk_F", "", 350, "" }, //StealthBalaclavaBlack
            { "G_Balaclava_TI_G_blk_F", "", 350, "" }, //StealthBalaclavaBlackGoggles
            { "G_Balaclava_TI_tna_F", "", 350, "" }, //StealthBalaclavaGreen
            { "G_Balaclava_TI_G_tna_F", "", 350, "" } //StealthBalaclavaGreenGoogles
          
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" },
            { "V_TacChestrig_cbr_F", "", 500, "" }, //TacticalChestRigCoyote
            { "V_TacChestrig_grn_F", "", 500, "" }, //TacticalChestRigGreen
            { "V_TacChestrig_oli_F", "", 500, "" }, //TacticalChestRigOlive
            { "V_Chestrig_blk", "", 550, "" }, //ChestRigBlack
            { "V_Chestrig_rgr", "", 550, "" }, //ChestRigGreen
            { "V_Chestrig_khk", "", 550, "" }, //ChestRigKhaki
            { "V_Chestrig_oli", "", 550, "" }, //ChestRigOlive
            { "V_HarnessO_brn", "", 750, "" }, //LBVHarnessBrown
            { "V_HarnessO_gry", "", 750, "" }, //LBVHarnessGrey
            { "V_HarnessO_ghex_F", "", 750, "" }, //LBVHarnessHex
            { "V_TacVest_blk", "", 1500, "" }, //TacticalVestBlack
            { "V_TacVest_brn", "", 1500, "" }, //TacticalVestBrown
            { "V_TacVest_camo", "", 1500, "" }, //TacticalVestCamo
            { "V_TacVest_khk", "", 1500, "" }, //TacticalVestKhaki
            { "V_TacVest_oli", "", 1500, "" }, //TacticalVestOlive
            { "V_PlateCarrier1_rgr", "", 8500, "" }, //CarrierLiteGreen
            { "V_PlateCarrier1_tna_F", "", 8500, "" }, //CarrierLiteTropic
            { "V_PlateCarrierL_CTRG", "", 8500, "" }, //CTRGPlateCarrierRigLight
			{ "V_PlateCarrier2_rgr", "", 12500, "" }, //CarrierRigGreen
            { "V_PlateCarrier2_tna_F", "", 12500, "" }, //CarrierRigTropic
			{ "V_PlateCarrierH_CTRG", "", 12500, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" },
            { "B_OutdoorPack_blk", "", 500, "" },
            { "B_AssaultPack_khk", "", 2000, "" },
            { "B_AssaultPack_dgtl", "", 2000, "" },
            { "B_AssaultPack_rgr", "", 2000, "" },
            { "B_AssaultPack_sgg", "", 2000, "" },
            { "B_AssaultPack_blk", "", 2000, "" },
            { "B_AssaultPack_cbr", "", 2000, "" },
            { "B_AssaultPack_mcamo", "", 2000, "" },
            { "B_AssaultPack_tna_F", "", 2000, "" },
            { "B_TacticalPack_oli", "", 2500, "" },
            { "B_FieldPack_blk", "", 5000, "" },
            { "B_FieldPack_ocamo", "", 5000, "" },
            { "B_FieldPack_oucamo", "", 5000, "" },
            { "B_FieldPack_ghex_f", "", 5000, "" },
            { "B_Kitbag_mcamo", "", 3500, "" },
            { "B_Kitbag_sgg", "", 3500, "" },
            { "B_Kitbag_cbr", "", 3500, "" },
            { "B_Bergen_sgg", "", 6500, "" },
            { "B_Bergen_mcamo", "", 6500, "" },
            { "B_Bergen_rgr", "", 6500, "" },
            { "B_Bergen_blk", "", 6500, "" },
            { "B_ViperHarness_ghex_F", "", 7000, "" }, //ViperHarnessGreenHex
            { "B_ViperHarness_hex_F", "", 7000, "" }, //ViperHarnessHex
            { "B_ViperHarness_khk_F", "", 7000, "" }, //ViperHarnessKhaki
            { "B_ViperHarness_oli_F", "", 7000, "" }, //ViperHarnessOlive
            { "B_Carryall_ocamo", "", 7500, "" },
            { "B_Carryall_oucamo", "", 7500, "" },
            { "B_Carryall_mcamo", "", 7500, "" },
            { "B_Carryall_oli", "", 7500, "" },
            { "B_Carryall_khk", "", 7500, "" },
            { "B_Carryall_cbr", "", 7500, "" },
			{ "B_Bergen_dgtl_F", "", 15000, "" }, //ApexBergenDigital
			{ "B_Bergen_hex_F", "", 15000, "" }, //ApexBergenHex
			{ "B_Bergen_mcamo_F", "", 15000, "" }, //ApexBergenMTP
			{ "B_Bergen_tna_F", "", 15000, "" } //ApexBergenTropic
           
        };
    };
 
    class kart {
        title = "STR_Shops_C_Kart";
        conditions = "";
        side = "civ";
        uniforms[] = {
            { "NONE", $STR_C_Remove_uniforms, 0, "" },
            { "U_C_Driver_1_black", "", 1500, "" },
            { "U_C_Driver_1_blue", "", 1500, "" },
            { "U_C_Driver_1_red", "", 1500, "" },
            { "U_C_Driver_1_orange", "", 1500, "" },
            { "U_C_Driver_1_green", "", 1500, "" },
            { "U_C_Driver_1_white", "", 1500, "" },
            { "U_C_Driver_1_yellow", "", 1500, "" },
            { "U_C_Driver_2", "", 3500, "" },
            { "U_C_Driver_1", "", 3600, "" },
            { "U_C_Driver_3", "", 3700, "" },
            { "U_C_Driver_4", "", 3700, "" }
        };
        headgear[] = {
            { "NONE", $STR_C_Remove_headgear, 0, "" },
            { "H_RacingHelmet_1_black_F", "", 1000, "" },
            { "H_RacingHelmet_1_red_F", "", 1000, "" },
            { "H_RacingHelmet_1_white_F", "", 1000, "" },
            { "H_RacingHelmet_1_blue_F", "", 1000, "" },
            { "H_RacingHelmet_1_yellow_F", "", 1000, "" },
            { "H_RacingHelmet_1_green_F", "", 1000, "" },
            { "H_RacingHelmet_1_F", "", 2500, "" },
            { "H_RacingHelmet_2_F", "", 2500, "" },
            { "H_RacingHelmet_3_F", "", 2500, "" },
            { "H_RacingHelmet_4_F", "", 2500, "" }
        };
        goggles[] = {
            { "NONE", $STR_C_Remove_goggles, 0, "" }
        };
        vests[] = {
            { "NONE", $STR_C_Remove_vests, 0, "" }
        };
        backpacks[] = {
            { "NONE", $STR_C_Remove_backpacks, 0, "" }
        };
    };
};