#include <macro.h>
/*
	File: fn_clothing_cop.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master config file for Cop clothing store.
*/
private["_filter","_ret"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price

//Shop Title Name
ctrlSetText[3103,"Altis Police Department Shop"];

_ret = [];
switch (_filter) do
{
	//Uniforms
	case 0:
	{
		_ret pushback["U_B_Wetsuit","Wetsuit",1000];
		_ret pushback["U_B_CombatUniform_mcam_worn","Cop Uniform",25];
		
			if(__GETC__(life_coplevel) > 3) then
				{
					_ret pushback["U_I_FullGhillie_ard",nil,25000];
					_ret pushback["U_O_FullGhillie_ard",nil,25000];
					_ret pushback["U_B_FullGhillie_ard",nil,25000];
					_ret pushback["U_I_FullGhillie_lsh",nil,25000];
					_ret pushback["U_O_FullGhillie_lsh",nil,25000];
					_ret pushback["U_I_FullGhillie_sard",nil,25000];
					_ret pushback["U_O_FullGhillie_sard",nil,25000];
					_ret pushback["U_B_FullGhillie_sard",nil,25000];
				};
		
	};
	
	//Hats
	case 1:
	{
		_ret pushback["H_Cap_Police", nil, 75];
		_ret pushback["H_Beret_blk_POLICE",nil,75];
		_ret pushback["H_Watchcap_blk", nil, 50];
		_ret pushback["H_Booniehat_khk_hs", nil, 50];
		_ret pushback["H_Beret_brn_SF",nil,50];
		_ret pushback["H_HelmetB_light_black",nil,2500];
		
	};
	
	//Glasses
	case 2:
	{
		_ret pushback["G_Shades_Black",nil,1000];
		_ret pushback["G_Shades_Blue",nil,1000];
		_ret pushback["G_Spectacles_Tinted",nil,1000];
		_ret pushback["G_Sport_Checkered",nil,1000];
		_ret pushback["G_Sport_Greenblack",nil,1000];
		_ret pushback["G_Squares",nil,1000];
		_ret pushback["G_Tactical_Black",nil,1000];
		_ret pushback["G_Aviator",nil,1000];
		_ret pushback["G_Diving",nil,1000];
	};
	
	//Vest
	case 3:
	{

		_ret pushback["V_TacVest_blk_POLICE",nil,1500];
		_ret pushback["V_TacVestIR_blk",nil,8000];
		_ret pushback["V_Rangemaster_belt",nil,800];
		_ret pushback["V_PlateCarrierGL_blk",nil,15000];
		_ret pushback["V_PlateCarrierGL_mtp",nil,15000];
		_ret pushback["V_PlateCarrierIAGL_oli",nil,15000];
		_ret pushback["V_PlateCarrierSpec_blk",nil,15000];
		_ret pushback["V_PlateCarrierSpec_mtp",nil,15000];
		_ret pushback["V_RebreatherB",nil,1000];
	};
	
	//Backpacks
	case 4:
	{
			_ret pushback["B_Kitbag_cbr",nil,800];
			_ret pushback["B_FieldPack_cbr",nil,500];
			_ret pushback["B_AssaultPack_cbr",nil,700];
			_ret pushback["B_Bergen_sgg",nil,2500];
			_ret pushback["B_Carryall_cbr",nil,3500];
		
			if(__GETC__(life_coplevel) > 3) then
				{
					_ret pushBack["B_UAV_01_backpack_F",nil,80000];
				};
	};			
};

_ret;