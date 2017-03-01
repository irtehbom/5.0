/*
	File: fn_handleDamage.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Handles damage, specifically for handling the 'tazer' pistol and nothing else.
*/
private["_unit","_damage","_source","_projectile","_part","_curWep"];
_unit = _this select 0;
_part = _this select 1;
_damage = _this select 2;
_source = _this select 3;
_projectile = _this select 4;

//Internal Debugging.
if(!isNil "TON_Debug") then {
	systemChat format["PART: %1 || DAMAGE: %2 || SOURCE: %3 || PROJECTILE: %4 || FRAME: %5",_part,_damage,_source,_projectile,diag_frameno];
};


//Handle the tazer first (Top-Priority).
if(!isNull _source) then {
	if(_source != _unit) then {
		_curWep = currentWeapon _source;
		if((_projectile in ["B_9x21_Ball"] && _curWep in ["hgun_P07_snds_F"]) || (_projectile in ["B_762x54_Ball"] && _curWep in ["srifle_DMR_01_ACO_F"])) then {
				private["_distance","_isVehicle","_isQuad"];
				_distance = if(_projectile == "B_762x54_Ball") then {200} else {35};
				_isVehicle = if(vehicle player != player) then {true} else {false};
				_isQuad = if(_isVehicle) then {if(typeOf (vehicle player) == "B_Quadbike_01_F") then {true} else {false}} else {false};
				
				_damage = false;
				if(_unit distance _source < _distance) then {
					if(!life_istazed && !(_unit getVariable["restrained",false])) then {
						if(_isVehicle && _isQuad) then {
							player action ["Eject",vehicle player];
							[_unit,_source] spawn life_fnc_tazed;
						} else {
							[_unit,_source] spawn life_fnc_tazed;
						};
					};
				};
			
			
			//Temp fix for super tasers on cops.
			if(playerSide == west && side _source == west) then {
				_damage = false;
			};
		};
	};
};

if (event_vehicles) then
	{
		if (vehicle player != player) then {
			if (!((vehicle player) isKindOf "Air")) then {
				_damage = false;
				vehicle player setDamage 0;
			};
		};
	};


	if ({player distance getMarkerPos (_x select 0) < _x select 1} count (call life_safe_points) > 0) then
	{
		if (vehicle player != player) then {
			// In a vehicle.
			if (!((vehicle player) isKindOf "Air")) then {
				_damage = false;
				vehicle player setDamage 0;
			};
		} else {
			_damage = false;
			player setDamage 0;
		}
	};

[] call life_fnc_hudUpdate;

if (typeName _damage == "SCALAR") then {
	_skillRank = [_player, 104] call life_fnc_xpSkillRank; // Tough cookie
	_skillRank = _skillRank * 10;
	if (_skillRank > 0) then {
		_damage = _damage - (_damage / 100 * _skillRank);
	};
};
_damage;