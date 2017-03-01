/*
	File: fn_clothing_reb.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration file for Reb shop.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price
_affwhitelist = parseNumber(life_aff_whitelist);
//Shop Title Name
ctrlSetText[3103,"Mohammed's Jihadi Shop"];
_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushback ["NVGoggles_OPFOR",nil,1000];
		_ret pushback ["U_IG_Guerilla1_1",nil,1000];
		_ret pushback ["U_IG_Guerilla2_1",nil,1000];		
		_ret pushback ["U_IG_Guerilla2_2",nil,1000];		
		_ret pushback ["U_IG_Guerilla2_3",nil,1000];
		_ret pushback ["U_IG_Guerilla3_1",nil,1000];
		_ret pushback ["U_IG_leader",nil,1000];		
		_ret pushback ["U_IG_Guerrilla_6_1",nil,1000];		
		_ret pushback ["U_I_G_Story_Protagonist_F",nil,1000];		
		_ret pushback ["U_I_G_resistanceLeader_F",nil,1000];		
		_ret pushback ["U_B_CombatUniform_mcam",nil,1000];
		_ret pushback ["U_B_CombatUniform_mcam_vest",nil,1000];
		_ret pushback ["U_B_CombatUniform_mcam_tshirt",nil,1000];
		_ret pushback ["U_B_survival_uniform",nil,1000];		
		_ret pushback ["U_I_CombatUniform",nil,1000];		
		_ret pushback ["U_I_CombatUniform_shortsleeve",nil,1000];		
		_ret pushback ["U_O_CombatUniform_ocamo",nil,1000];		
		_ret pushback ["U_O_CombatUniform_oucamo",nil,1000];
		_ret pushback ["U_B_PilotCoveralls",nil,1000];
		_ret pushback ["U_I_pilotCoveralls",nil,1000];
		_ret pushback ["U_O_PilotCoveralls",nil,1000];
		_ret pushback ["U_B_HeliPilotCoveralls",nil,1000];
		_ret pushback ["U_I_HeliPilotCoveralls",nil,1000];
		_ret pushback ["U_B_GhillieSuit",nil,30000];
		_ret pushback ["U_O_GhillieSuit",nil,30000];
		_ret pushback ["U_I_GhillieSuit",nil,30000];
		_ret pushback ["U_O_FullGhillie_ard",nil,30000];
		_ret pushback ["U_O_FullGhillie_lsh",nil,30000];
		_ret pushback ["U_O_FullGhillie_sard",nil,30000];
		
        if(_affwhitelist >= 1) then {
		
		_ret pushback ["U_B_CTRG_1",nil,1000];	
		_ret pushback ["U_B_CTRG_2",nil,1000];
		_ret pushback ["U_B_CTRG_3",nil,1000];
		_ret pushback ["U_O_FullGhillie_sard",nil,30000];
		_ret pushback ["U_O_FullGhillie_ard",nil,30000];
		_ret pushback ["U_O_FullGhillie_lsh",nil,30000];
		
		};
		
		if(_affwhitelist == 7) then {
		_ret pushback ["U_I_OfficerUniform",nil,500];
	};
	};
	
	//Hats
	case 1:
	{   
		_ret pushback ["H_Shemag_olive",nil,500];
		_ret pushback ["H_ShemagOpen_khk",nil,500];
		_ret pushback ["H_ShemagOpen_tan",nil,500];
		_ret pushback ["H_MilCap_mcamo",nil,500];
		_ret pushback ["H_MilCap_oucamo",nil,500];
		_ret pushback ["H_MilCap_gry",nil,500];
		_ret pushback ["H_MilCap_dgtl",nil,500];
		_ret pushback ["H_Cap_tan_specops_US",nil,500];		
		_ret pushback ["H_Cap_brn_SPECOPS",nil,500];		
		_ret pushback ["H_Cap_blk_Raven",nil,500];
		_ret pushback ["H_Booniehat_khk",nil,500];
		_ret pushback ["H_Booniehat_oli",nil,500];		
		_ret pushback ["H_Booniehat_tan",nil,500];
		_ret pushback ["H_Booniehat_mcamo",nil,500];
		_ret pushback ["H_Booniehat_indp",nil,500];
		_ret pushback ["H_Watchcap_blk",nil,500];
		_ret pushback ["H_Watchcap_cbr",nil,500];
		_ret pushback ["H_Watchcap_khk",nil,500];
		_ret pushback ["H_Watchcap_camo",nil,500];
		_ret pushback ["H_Bandanna_gry",nil,500];
		_ret pushback ["H_Bandanna_khk",nil,500];		
		_ret pushback ["H_Bandanna_cbr",nil,500];		
		_ret pushback ["H_Bandanna_sand",nil,500];
		_ret pushback ["H_Bandanna_mcamo",nil,500];
		_ret pushback ["H_Bandanna_camo",nil,500];
		_ret pushback ["H_HelmetSpecB",nil,1500];
		_ret pushback ["H_HelmetSpecB_paint1",nil,1500];
		_ret pushback ["H_HelmetB",nil,2500];
		_ret pushback ["H_HelmetB_camo",nil,2500];
		_ret pushback ["H_HelmetB_paint",nil,2500];
		_ret pushback ["H_HelmetIA",nil,1500];	
		_ret pushback ["H_HelmetSpecO_blk",nil,1500];
		_ret pushback ["H_HelmetSpecO_ocamo",nil,1500];
		_ret pushback ["H_HelmetO_ocamo",nil,1500];	
		_ret pushback ["H_HelmetO_oucamo",nil,1500];		
		_ret pushback ["H_HelmetLeaderO_ocamo",nil,2500];	
		_ret pushback ["H_HelmetLeaderO_oucamo",nil,2500];
		_ret pushback ["H_HelmetCrew_B",nil,1500];	
		_ret pushback ["H_HelmetCrew_O",nil,1500];		
		_ret pushback ["H_HelmetCrew_I",nil,2500];	
		_ret pushback ["H_CrewHelmetHeli_B",nil,2500];
		_ret pushback ["H_CrewHelmetHeli_O",nil,2500];
		_ret pushback ["H_CrewHelmetHeli_I",nil,2500];
		_ret pushback ["H_PilotHelmetHeli_B",nil,2500];
		_ret pushback ["H_PilotHelmetHeli_O",nil,2500];
		_ret pushback ["H_PilotHelmetHeli_I",nil,2500];		
	
		if(_affwhitelist >= 1) then {
			
		_ret pushback ["H_Beret_blk",nil,500];
		_ret pushback ["H_Cap_tan",nil,500];
		_ret pushback ["H_HelmetB_sand",nil,500];
		_ret pushback ["H_PilotHelmetHeli_O",nil,500];
		_ret pushback ["H_CrewHelmetHeli_O",nil,500];		

	    };
		
		if(_affwhitelist >= 5) then {
		
		_ret pushback ["H_Beret_02",nil,500];
		_ret pushback ["H_Beret_Colonel",nil,500];
		
		};
	};
	
	//Glasses
	case 2:
	{
	    _ret pushback ["G_Shades_Black",nil,25];
		_ret pushback ["G_Shades_Blue",nil,20];
		_ret pushback ["G_Sport_Blackred",nil,20];
		_ret pushback ["G_Sport_Checkered",nil,20];
		_ret pushback ["G_Sport_Blackyellow",nil,20];
		_ret pushback ["G_Sport_BlackWhite",nil,20];
		_ret pushback ["G_Squares",nil,10];
		_ret pushback ["G_Lowprofile",nil,30];
		_ret pushback ["G_Combat",nil,55];	
		_ret pushback ["G_Balaclava_blk",nil,20];
		_ret pushback ["G_Balaclava_combat",nil,20];
		_ret pushback ["G_Balaclava_oli",nil,20];
		_ret pushback ["G_Bandanna_aviator",nil,20];	
		_ret pushback ["G_Bandanna_beast",nil,20];
		_ret pushback ["G_Bandanna_oli",nil,20];
		_ret pushback ["G_Bandanna_khk",nil,20];
		_ret pushback ["G_Bandanna_blk",nil,20];
		_ret pushback ["G_Bandanna_sport",nil,20];		
		_ret pushback ["G_Aviator",nil,20];		
		
		if(_affwhitelist >= 1) then {
		};
	};
	
	//Vest
	case 3:
	{
		_ret pushback ["V_Rangemaster_belt",nil,2500];
		_ret pushback ["V_BandollierB_blk",nil,5000];
		_ret pushback ["V_BandollierB_oli",nil,5000];		
		_ret pushback ["V_BandollierB_cbr",nil,5000];		
		_ret pushback ["V_BandollierB_khk",nil,5000];		
		_ret pushback ["V_HarnessO_brn",nil,7500];	
		_ret pushback ["V_HarnessO_gry",nil,7500];
		_ret pushback ["V_HarnessOGL_brn",nil,7500];
		_ret pushback ["V_HarnessOGL_gry",nil,7500];
		_ret pushback ["V_Chestrig_blk",nil,7500];		
		_ret pushback ["V_Chestrig_rgr",nil,7500];		
		_ret pushback ["V_Chestrig_khk",nil,7500];	
		_ret pushback ["V_TacVest_khk",nil,12500];
		_ret pushback ["V_TacVest_brn",nil,12500];
		_ret pushback ["V_TacVest_camo",nil,12500];
		_ret pushback ["V_TacVest_oli",nil,12500];		
		_ret pushback ["V_PlateCarrierGL_blk",nil,20000];
		_ret pushback ["V_PlateCarrierGL_mtp",nil,20000];
		_ret pushback ["V_PlateCarrierGL_rgr",nil,15000];		
		_ret pushback ["V_PlateCarrierIAGL_oli",nil,20000];
		_ret pushback ["V_PlateCarrierSpec_blk",nil,20000];
		_ret pushback ["V_PlateCarrierSpec_mtp",nil,20000];	
		_ret pushback ["V_PlateCarrierSpec_rgr",nil,20000];			
		
		if(_affwhitelist >= 1) then {
			
		_ret pushback ["V_Rangemaster_belt",nil,5000];
		_ret pushback ["V_bandollierB_rgr",nil,7500];
		_ret pushback ["V_PlateCarrierL_CTRG",nil,10000];
		_ret pushback ["V_PlateCarrierH_CTRG",nil,10000];
		_ret pushback ["V_PlateCarrierSpec_rgr",nil,15000];
		_ret pushback ["V_PlateCarrierGL_rgr",nil,15000];
		
		};
	};
	
	//Backpacks
	case 4:
	{
		_ret pushback ["B_AssaultPack_cbr",nil,2500];
		_ret pushback ["B_Kitbag_mcamo",nil,4500];
		_ret pushback ["B_TacticalPack_oli",nil,3500];
		_ret pushback ["B_FieldPack_ocamo",nil,3000];
		_ret pushback ["B_Bergen_sgg",nil,4500];
		_ret pushback ["B_Kitbag_cbr",nil,4500];
		_ret pushback ["B_Carryall_oli",nil,5000];
		_ret pushback ["B_Carryall_khk",nil,5000];
	};
};
_ret;
