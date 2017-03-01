/*
	File: fn_varHandle.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master handler for getting a variables name, short name, etc.
*/
private["_var","_mode"];
_var = [_this,0,"",[""]] call BIS_fnc_param;
_mode = [_this,1,-1,[0]] call BIS_fnc_param;
if(_var == "" OR _mode == -1) exitWith {""};

_return = "";
if (["build", _var] call BIS_fnc_inString) then {
	_result = [_var] call build_getObject;
	
	if (count _result > 0) then {
		if (_mode == 0) exitWith { _return = "life_inv_build_" + (_result select 1) };
		if (_mode == 1) exitWith { _return = "build_" + (_result select 1) };
	};
};

if (_return != "") exitWith {_return};

switch (_mode) do
{
	case 0:
	{
		switch (_var) do
		{
			case "oilu": {"life_inv_oilu"};
			case "oilp": {"life_inv_oilp"};
			case "heroinu": {"life_inv_heroinu"};
			case "heroinp": {"life_inv_heroinp"};
			case "cannabis": {"life_inv_cannabis"};
			case "marijuana": {"life_inv_marijuana"};
			case "apple": {"life_inv_apple"};
			case "water": {"life_inv_water"};
			case "rabbit": {"life_inv_rabbit"};
			case "salema": {"life_inv_salema"};
			case "ornate": {"life_inv_ornate"};
			case "mackerel": {"life_inv_mackerel"};
			case "tuna": {"life_inv_tuna"};
			case "mullet": {"life_inv_mullet"};
			case "catshark": {"life_inv_catshark"};
			case "turtle": {"life_inv_turtle"};
			case "fishing": {"life_inv_fishingpoles"};
			case "coffee": {"life_inv_coffee"};
			case "turtlesoup": {"life_inv_turtlesoup"};
			case "donuts": {"life_inv_donuts"};
			case "fuelE": {"life_inv_fuelE"};
			case "fuelF": {"life_inv_fuelF"};
			case "gpzipties": {"life_inv_gpzipties"};
			case "money": {"ftp_cash"};
			case "pickaxe": {"life_inv_pickaxe"};
			case "copperore": {"life_inv_copperore"};
			case "ironore": {"life_inv_ironore"};
			case "iron_r": {"life_inv_ironr"};
			case "copper_r": {"life_inv_copperr"};
			case "salt": {"life_inv_salt"};
			case "salt_r": {"life_inv_saltr"};
			case "sand": {"life_inv_sand"};
			case "glass": {"life_inv_glass"};
			case "tbacon": {"life_inv_tbacon"};
			case "lockpick": {"life_inv_lockpick"};
			case "redgull": {"life_inv_redgull"};
			case "peach": {"life_inv_peach"};
			case "diamond": {"life_inv_diamond"};
			case "diamondc": {"life_inv_diamondr"};
			case "cocaine": {"life_inv_coke"};
			case "cocainep": {"life_inv_cokep"};
			case "spikeStrip": {"life_inv_spikeStrip"};
			case "cement": {"life_inv_cement"};
			case "rock": {"life_inv_rock"};
			case "goldbar": {"life_inv_goldbar"};
			case "treasure": {"life_inv_treasure"};
			case "bonds": {"life_inv_bonds"};
			case "blastingcharge": {"life_inv_blastingcharge"};
			case "c4": {"life_inv_c4"};
			case "boltcutter": {"life_inv_boltcutter"};
			case "defusekit": {"life_inv_defusekit"};
			case "storagesmall": {"life_inv_storagesmall"};
			case "storagebig": {"life_inv_storagebig"};
			case "crowbar": { "life_inv_crowbar" };
			case "uwsl": {"life_inv_uwsl"};
			case "silver": {"life_inv_silver"};
			case "clay": {"life_inv_clay"};
			case "cobalt": {"life_inv_cobalt"};
			case "lead": { "life_inv_lead" };
			case "titanium": {"life_inv_titanium"};
			case "usilver": {"life_inv_usilver"};
			case "uclay": {"life_inv_uclay"};
			case "ucobalt": {"life_inv_ucobalt"};
			case "ulead": { "life_inv_ulead" };
			case "utitanium": {"life_inv_utitanium"};	
			case "ufirearms": { "life_inv_ufirearms" };
			case "firearms": {"life_inv_firearms"};	
			case "uopium": { "life_inv_uopium" };
			case "opium": {"life_inv_opium"};	
			case "sroll": {"life_inv_sroll"};			
		};
	};
	
	case 1:
	{
		switch (_var) do
		{
			case "life_inv_oilu": {"oilu"};
			case "life_inv_oilp": {"oilp"};
			case "life_inv_heroinu": {"heroinu"};
			case "life_inv_heroinp": {"heroinp"};
			case "life_inv_cannabis": {"cannabis"};
			case "life_inv_marijuana": {"marijuana"};
			case "life_inv_apple": {"apple"};
			case "life_inv_water": {"water"};
			case "life_inv_rabbit": {"rabbit"};
			case "life_inv_salema": {"salema"};
			case "life_inv_ornate": {"ornate"};
			case "life_inv_mackerel": {"mackerel"};
			case "life_inv_tuna": {"tuna"};
			case "life_inv_mullet": {"mullet"};
			case "life_inv_catshark": {"catshark"};
			case "life_inv_turtle": {"turtle"};
			case "life_inv_fishingpoles": {"fishing"};
			case "life_inv_coffee": {"coffee"};
			case "life_inv_turtlesoup": {"turtlesoup"};
			case "life_inv_donuts": {"donuts"};
			case "life_inv_fuelE": {"fuelE"};
			case "life_inv_gpzipties": {"gpzipties"};
			case "life_inv_fuelF": {"fuelF"};
			case "ftp_cash": {"money"};
			case "life_inv_pickaxe": {"pickaxe"};
			case "life_inv_copperore": {"copperore"};
			case "life_inv_ironore": {"ironore"};
			case "life_inv_ironr": {"iron_r"};
			case "life_inv_copperr": {"copper_r"};
			case "life_inv_sand": {"sand"};
			case "life_inv_salt": {"salt"};
			case "life_inv_glass": {"glass"};
			case "life_inv_redgull": {"redgull"};
			case "life_inv_lockpick": {"lockpick"};
			case "life_inv_tbacon": {"tbacon"};
			case "life_inv_peach": {"peach"};
			case "life_inv_diamond": {"diamond"};
			case "life_inv_diamondr": {"diamondc"};
			case "life_inv_saltr": {"salt_r"};
			case "life_inv_coke": {"cocaine"};
			case "life_inv_cokep": {"cocainep"};
			case "life_inv_spikeStrip": {"spikeStrip"};
			case "life_inv_cement": {"cement"};
			case "life_inv_rock": {"rock"};
			case "life_inv_bonds": {"bonds"};
			case "life_inv_goldbar": {"goldbar"};
			case "life_inv_treasure": {"treasure"};
			case "life_inv_blastingcharge": {"blastingcharge"};
			case "life_inv_c4": {"c4"};
			case "life_inv_boltcutter": {"boltcutter"};
			case "life_inv_defusekit": {"defusekit"};
			case "life_inv_storagesmall": {"storagesmall"};
			case "life_inv_storagebig": {"storagebig"};
			case "life_inv_crowbar": { "crowbar" };
			case "life_inv_uwsl": {"uwsl"};
			case "life_inv_usilver": {"usilver"};
			case "life_inv_uclay": {"uclay"};
			case "life_inv_ucobalt": {"ucobalt"};
			case "life_inv_ulead": { "ulead" };
			case "life_inv_utitanium": {"utitanium"};
			case "life_inv_silver": {"silver"};
			case "life_inv_clay": {"clay"};
			case "life_inv_cobalt": {"cobalt"};
			case "life_inv_lead": { "lead" };
			case "life_inv_titanium": {"titanium"};
			case "life_inv_firearms": { "firearms" };
			case "life_inv_ufirearms": {"ufirearms"};
			case "life_inv_opium": { "opium" };
			case "life_inv_uopium": {"uopium"};		
			case "life_inv_sroll": {"sroll"};	
		};
	};
};
