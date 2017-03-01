#include <macro.h>
/*
	File: fn_spawnPointCfg.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Master configuration for available spawn points depending on the units side.
	
	Return:
	[Spawn Marker,Spawn Name,Image Path]
*/
private["_side","_return"];
_side = [_this,0,civilian,[civilian]] call BIS_fnc_param;

//Spawn Marker, Spawn Name, PathToImage
switch (_side) do
{
	case west:
	{
		_return = [
			["cop_spawn_1","Kavala HQ","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["cop_spawn_2","Pyrgos HQ","\a3\ui_f\data\map\MapControl\fuelstation_ca.paa"],
			["cop_spawn_3","Athira Police Station","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_4","Police Air Station","\a3\ui_f\data\map\Markers\NATO\b_air.paa"],
			["cop_spawn_5","Sofia Police Station","\a3\ui_f\data\map\GroupIcons\badge_rotate_0_gs.paa"],
			["cop_spawn_6","Iremi Police Harbour","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["agios_cp","Agios Police CP","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(count real_estate_houses_recieve > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestObject [_pos, "Land_i_House_Big_01_V1_F"];
				
				_return pushBack [format["house_%1",_house getVariable "uid"],"Real Estate","\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach real_estate_houses_recieve;
		};	
	};
	
	case civilian:
	{
	
		_return = [
			["civ_spawn_1","Kavala","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_2","Pyrgos","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_3","Athira","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			["civ_spawn_4","Sofia","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		];
		
		if(count life_houses > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestBuilding _pos;
				_houseName = getText(configFile >> "CfgVehicles" >> (typeOf _house) >> "displayName");
				_return pushBack [format["house_%1",_house getVariable "uid"],_houseName,"\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];
			} foreach life_houses;
		};

		if(count real_estate_houses_recieve > 0) then {
			{
				_pos = call compile format["%1",_x select 0];
				_house = nearestObject [_pos, "Land_i_House_Big_01_V1_F"];
				
				_return pushBack [format["house_%1",_house getVariable "uid"],"Real Estate","\a3\ui_f\data\map\MapControl\lighthouse_ca.paa"];

			} foreach real_estate_houses_recieve;
		};	
		
		if(__GETC__(life_donator) >= 3) then {
		
			_return pushBack ["donator_spawn_1","Airfield","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			_return pushBack ["reb_spawn_1","Rebel Outpost","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			_return pushBack ["reb_spawn_2","Rebel Outpost","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			_return pushBack ["donator_east","Donator East","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			_return pushBack ["donator_west","Donator West","\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
		};
		
		_affwhitelist = parseNumber(life_aff_whitelist);
		
		if(_affwhitelist >= 1) then {
		
			_return pushBack ["aff_base_spawn","AFF Base","\a3\ui_f\data\map\MapControl\watertower_ca.paa"];
			
		};
		
		if (__GETC__(life_donator) <= 2) then{
			if(license_civ_rebel) then	{
		
				_return pushBack ["reb_spawn_1","Rebel Outpost","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
				_return pushBack ["reb_spawn_2","Rebel Outpost","\a3\ui_f\data\map\MapControl\watertower_ca.paa"],
			};
		};
	
	
		if (count life_build_spawnpoints > 0) then {
			if (life_build_last_spawned == -1 || (time - life_build_last_spawned) > life_build_spawn_delay) then {
				_gangSpawnCount = 1;
				{
					_return = _return + [
						[position _x, format["Gang base #%1", _gangSpawnCount], "\a3\ui_f\data\map\MapControl\watertower_ca.paa"]
					];
					_gangSpawnCount = _gangSpawnCount + 1;
				} forEach life_build_spawnpoints;
			};
		};
	};
	
	case independent: {
		_return = [
			["medic_spawn_1","Kavala Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_2","Athira Regional","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_3","Pygros Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["medic_spawn_4","Sofia Hospital","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
	
	case east: {
		_return = [
			["east_spawn_1","Kavala Station","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["east_spawn_2","Athira Station","\a3\ui_f\data\map\MapControl\hospital_ca.paa"],
			["east_spawn_3","Pyrgos Station","\a3\ui_f\data\map\MapControl\hospital_ca.paa"]
		];
	};
};

_return;