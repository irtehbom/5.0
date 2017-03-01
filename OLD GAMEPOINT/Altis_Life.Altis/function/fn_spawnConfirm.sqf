private["_spCfg","_sp","_spawnPos"];
closeDialog 0;
cutText ["","BLACK IN"];
if(count life_spawn_point == 0) then
{
	private["_sp","_spCfg"];
	_spCfg = [playerSide] call life_fnc_spawnPointCfg;
	_sp = _spCfg select 0;
	
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1", _sp select 0])}) then {
			player setPos (getMarkerPos (_sp select 0));
		} else {
			_spawnPos = (call compile format["%1", _sp select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
	else
	{
		player setPos (getMarkerPos (_sp select 0));
	};
	titleText[format["%2 %1",_sp select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
}
else
{
	if(playerSide == civilian) then
	{
		if(isNil {(call compile format["%1",life_spawn_point select 0])}) then {
			if((["house",life_spawn_point select 0] call BIS_fnc_inString)) then {
				private["_bPos","_house","_pos"];
				_house = nearestObjects [getMarkerPos (life_spawn_point select 0),["House_F"],10] select 0;
				_bPos = [_house] call life_fnc_getBuildingPositions;

				if(count _bPos == 0) exitWith {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};
				
				_pos = _bPos call BIS_fnc_selectRandom;
				player setPosATL _pos;
			} else {
				if (count (life_spawn_point select 0) == 3) then {
					player setPos (life_spawn_point select 0);
				} else {
					player setPos (getMarkerPos (life_spawn_point select 0));
				};
			};
		} else {
			_spawnPos = (call compile format["%1", life_spawn_point select 0]) call BIS_fnc_selectRandom;
			_spawnPos = _spawnPos buildingPos 0;
			player setPos _spawnPos;
		};
	}
	else
	{
		if (typeName (life_spawn_point select 0) == "STRING") then {
			player setPos (getMarkerPos (life_spawn_point select 0));
		} else {
			player setPos (life_spawn_point select 0);
			life_build_last_spawned = time;
		};
	};
	titleText[format["%2 %1",life_spawn_point select 1,localize "STR_Spawn_Spawned"],"BLACK IN"];
};

if (!("ItemMap" in items player)) then {
	// New player!
	switch(playerSide) do
	{
		case civilian: {
			//[] call life_fnc_civFetchGear;
			[] call life_fnc_civilianDefault;
		};
	};
};

life_is_alive = true;
[] call life_fnc_hudSetup;

//intro doesn't work here
