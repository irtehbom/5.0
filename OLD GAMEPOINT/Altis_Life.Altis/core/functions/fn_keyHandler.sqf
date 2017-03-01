private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorTarget;
_handled = false;

_interactionKey = if(count (actionKeys "User10") == 0) then {219} else {(actionKeys "User10") select 0};

_mapKey = actionKeys "ShowMap" select 0;
//hint str _code;
_interruptionKeys = [17,30,31,32]; //A,S,W,D

//Vault handling...
if((_code in (actionKeys "GetOver") || _code in (actionKeys "salute")) && {(player getVariable ["restrained",false])}) exitWith {
	true;
};

if(life_action_inUse) exitWith {
	if(!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
	_handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if(count (actionKeys "User10") != 0 && {(inputAction "User10" > 0)}) exitWith {
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
	if(!life_action_inUse) then {
		[] spawn 
		{
			private["_handle"];
			_handle = [] spawn life_fnc_actionKeyHandler;
			waitUntil {scriptDone _handle};
			life_action_inUse = false;
		};
	};
	true;
};

if (life_placeable_placing_active) then {
	switch (_code) do
	{
		case 57: // Space
		{
			[] spawn life_fnc_placeablesPlaceComplete;
		};
	};
	true;
};

// Feed keys when building
if (life_build_active) then {
	[_code, _shift, _ctrlKey, _alt] spawn life_fnc_buildKeyHandler;
	true;
};

switch (_code) do
{
	//Space key for Jumping
	case 57:
	{
		if(isNil "jumpActionTime") then {jumpActionTime = 0;};
		if(_shift && {animationState player != "AovrPercMrunSrasWrflDf"} && {isTouchingGround player} && {stance player == "STAND"} && {speed player > 2} && {!life_is_arrested} && {(velocity player) select 2 < 2.5} && {time - jumpActionTime > 5}) then {
			jumpActionTime = time; //Update the time.
			[player,true] spawn life_fnc_jumpFnc; //Local execution
			[[player,false],"life_fnc_jumpFnc",nil,FALSE] call life_fnc_MP; //Global execution 
			_handled = true;
		};
	};
	
	// ALT + F4
	case 62:
	{
		if(_alt && !_shift) then 
		{
			diag_log format["Warning: Player %1 pressed ALT+F4", _player getVariable["realname", name _player]];
			if (!isNull life_corpse) then {
				diag_log format["Warning: Player %1 pressed ALT+F4 while they were dead.", _player getVariable["realname", name _player]];
				
				life_gear = [];
				// Clears gear
				_packet = [steamid,playerSide, [], 3];
				[_packet,"DB_fnc_updatePartial",false,false] call life_fnc_MP;
			};
		};
	};
	

	// CTRL + ESC
	case 1:
	{
		if( _ctrlKey )  then 
		{
			diag_log format["Warning: Player %1 pressed CTRL+ESC.", _player getVariable["realname", name _player]];
			if (!isNull life_corpse) then {
				diag_log format["Warning: Player %1 pressed CTRL+ESC while they were dead.", _player getVariable["realname", name _player]];
				
				
				life_gear = [];
				// Clears gear
				_packet = [steamid,playerSide, [], 3];
				[_packet,"DB_fnc_updatePartial",false,false] call life_fnc_MP;
			};
		};
	};	
	
	//Map Key
	case _mapKey:
	{
		switch (playerSide) do 
		{
			case west: {if(!visibleMap) then {[] spawn life_fnc_copMarkers;}};
			case independent: {if(!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
			case civilian: {if(!visibleMap) then {[] spawn life_fnc_gangMarkers;}};
			case east: {
				if(!visibleMap) then {
					[[player], "life_fnc_eastGetRequests", false, false] spawn life_fnc_MP;
				};
			};
		};
	};
	
	//Holster / recall weapon.
	case 35:
	{
		if(_shift && !_ctrlKey && currentWeapon player != "") then {
			life_curWep_h = currentWeapon player;
			player action ["SwitchWeapon", player, player, 100];
			player switchcamera cameraView;
		};
		
		if(!_shift && _ctrlKey && !isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
	};
	//Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey:
	{
		if(!life_action_inUse) then {
			[] spawn 
			{
				private["_handle"];
				_handle = [] spawn life_fnc_actionKeyHandler;
				waitUntil {scriptDone _handle};
				life_action_inUse = false;
			};
		};
	};
	
	case 47: 
		{
		if(_shift) then {_handled = true;};
		
		if (_shift) then
		{
			if (vehicle player == player && !(player getVariable ["restrained", false]) && !(player getVariable ["hostage", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
			{
				if (player getVariable ["surrender", false]) then
				{
					player setVariable ["surrender", false, true];
				} else
				{
					[] spawn life_fnc_surrender;
				};
			};
		};
	};
	

	
	//Restraining (Shift + R)
	case 19:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == west && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1) then
		{
			[] call life_fnc_restrainAction;
		};
		
		if (cursorTarget distance player < 3.5) then {
				if(_shift && playerSide == civilian && license_civ_rebel && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,east,west]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && animationState cursorTarget == "Incapacitated") then
				{
				  if (life_inv_gpzipties > 0) then {
					[] call life_fnc_restrainActionCiv;
					[false,"gpzipties",1] call life_fnc_handleInv;
					};
				};

				
				if(_shift && playerSide == east && !isNull cursorTarget && cursorTarget isKindOf "Man" && (isPlayer cursorTarget) && (side cursorTarget in [civilian,independent,east]) && alive cursorTarget && cursorTarget distance player < 3.5 && !(cursorTarget getVariable "Escorting") && !(cursorTarget getVariable "restrained") && speed cursorTarget < 1 && animationState cursorTarget == "Incapacitated") then
				{
					[] call life_fnc_restrainAction;
				};
		};
		
	};
	
	//Knock out, this is experimental and yeah...
	case 34:
	{
		if(_shift) then {_handled = true;};
		if(_shift && playerSide == civilian && !isNull cursorTarget && cursorTarget isKindOf "Man" && isPlayer cursorTarget && alive cursorTarget && cursorTarget distance player < 4 && speed cursorTarget < 1) then
		{
			if((animationState cursorTarget) != "Incapacitated" && (currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["restrained",false]) && !life_istazed) then
			{
				[cursorTarget] spawn life_fnc_knockoutAction;
			};
		};
	};

	//T Key (Trunk)
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
		    if((cursorTarget isKindOf "House_F") && player distance cursorTarget < 20) then
			{
					if (cursorTarget getVariable["estate_locked",false]) then {
					   hint 'The trunk is locked, open your estate menu to unlock it'
					} else {
					 [cursorTarget] call life_fnc_openInventory;
					};
			};
		
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] call life_fnc_openInventory;
				};
			}
			else
			{
			
				if((cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 7 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] call life_fnc_openInventory;
					};
				};		_
			};
			_shipWreck = nearestObjects [player, ["Land_Wreck_Traw_F"], 50];
			_shipWreck = nearestObject [player, "Land_Wreck_Traw_F"];
			[_shipWreck] spawn life_fnc_openInventory;
		};
	};
	//L Key?
	case 38: 
	{
		//If cop run checks for turning lights on.
		if(_shift && playerSide in [west,independent,east]) then {
			if(vehicle player != player && (typeOf vehicle player) in ["C_Offroad_01_F","C_Offroad_01_repair_F","B_MRAP_01_F","C_SUV_01_F","C_Hatchback_01_F","C_Van_01_box_F"]) then {
				if(!isNil {vehicle player getVariable "lights"}) then {
				
					switch (playerSide) do {
						case west:
						{
							[vehicle player] call life_fnc_sirenLights;
						};
						
						case independent:
						{
							[vehicle player] call life_fnc_medicSirenLights;
						};
						
						case east:
						{
							[vehicle player] call life_fnc_eastSirenLights;
						};
					};
					_handled = true;
				};
			};
		};
		
		if(!_alt && !_ctrlKey) then { [] call life_fnc_radar; };
	};
	//Y Player Menu
	case 21:
	{
		if (_ctrlKey) then
		{
			[] call life_fnc_xpOpenMenu;
		}
		else
		{
			if(!_alt && !_ctrlKey && !dialog) then
			{
				[] call life_fnc_p_openMenu;
			};
		};
	};
	
	
	
	//F Key
	case 33:
	{
		if(playerSide in [west,independent] && vehicle player != player && !life_siren_active && ((driver vehicle player) == player)) then
		{
			[] spawn
			{
				life_siren_active = true;
				sleep 4.7;
				life_siren_active = false;
			};
			_veh = vehicle player;
			if(isNil {_veh getVariable "siren"}) then {_veh setVariable["siren",false,true];};
			if((_veh getVariable "siren")) then
			{
				titleText [localize "STR_MISC_SirensOFF","PLAIN"];
				_veh setVariable["siren",false,true];
			}
				else
			{
				titleText [localize "STR_MISC_SirensON","PLAIN"];
				_veh setVariable["siren",true,true];
				if(playerSide == west) then {
					[[_veh],"life_fnc_copSiren",nil,true] spawn life_fnc_MP;
				} else {
					//I do not have a custom sound for this and I really don't want to go digging for one, when you have a sound uncomment this and change medicSiren.sqf in the medical folder.
					[[_veh],"life_fnc_medicSiren",nil,true] spawn life_fnc_MP;
				};
			};
		};
	};
	//U Key
	case 22:
	{
		if(!_alt && !_ctrlKey) then {
			if(vehicle player == player) then {
				_veh = cursorTarget;
			} else {
				_veh = vehicle player;
			};
			
			if(_veh isKindOf "House_F" && playerSide == civilian) then {
				if(_veh in life_vehicles && player distance _veh < 8) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			} else {
				_locked = locked _veh;
				if (side player == independent && player distance _veh < 8) then {
					if(_locked == 2) then {
						if(local _veh) then {
							_veh lock 0;
						} else {
							[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};
						systemChat localize "STR_MISC_VehUnlock";
						player say3D "car_lock";
						{
							deleteVehicle _x; // Stops any currently playing sounds.
						} forEach (attachedObjects _veh);
						
						removeAllActions _veh;
						_veh addAction["<t color='#FF0000'>[HATO]</t> Request HATO", life_fnc_eastVehicleRequest, _vehicle, 0, FALSE, FALSE, "", 'player distance _target < 8'];
					} else {
						if(local _veh) then {
							_veh lock 2;
						} else {
							[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
						};	
						systemChat localize "STR_MISC_VehLock";
						player say3D "unlock";
					};
				} else {
					if(_veh in life_vehicles && player distance _veh < 8) then {
						if(_locked == 2) then {
							if(local _veh) then {
								_veh lock 0;
							} else {
								[[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							};
							systemChat localize "STR_MISC_VehUnlock";
							player say3D "car_lock";
							{
								deleteVehicle _x; // Stops any currently playing sounds.
							} forEach (attachedObjects _veh);
							
							removeAllActions _veh;
							_veh addAction["<t color='#FF0000'>[HATO]</t> Request HATO", life_fnc_eastVehicleRequest, _vehicle, 0, FALSE, FALSE, "", 'player distance _target < 8'];

						} else {
							if(local _veh) then {
								_veh lock 2;
							} else {
								[[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
							};	
							systemChat localize "STR_MISC_VehLock";
							player say3D "unlock";
						};
					};
				};
			};
			
			if(((_veh getVariable "estate_owned") select 0) == (getPlayerUID player)) then {
			    if (player distance _veh < 25) then {
					_door = [_veh] call life_fnc_nearestDoor;
					if(_door == 0) exitWith {hint localize "STR_House_Door_NotNear"};
					_locked = _veh getVariable [format["bis_disabled_Door_%1",_door],0];
					if(_locked == 0) then {
						_veh setVariable[format["bis_disabled_Door_%1",_door],1,true];
						_veh animate [format["door_%1_rot",_door],0];
						systemChat localize "STR_House_Door_Lock";
					} else {
						_veh setVariable[format["bis_disabled_Door_%1",_door],0,true];
						_veh animate [format["door_%1_rot",_door],1];
						systemChat localize "STR_House_Door_Unlock";
					};
				};
			};
		};
	};
	case 45:
	{    		
		if((!life_action_inUse) && (vehicle player == player) ) then
		{
			{
				_str = [_x] call life_fnc_varToStr;
				_val = missionNameSpace getVariable _x;
				if(_val > 0 ) then
				{
					if( _str == "Spitzhacke" || _str == "pickaxe" ) then
					{
						[] spawn life_fnc_pickAxeUse;
					};
				};
			} foreach life_inv_items;
		};
	};
	
	//O KEY OILRIG
	case 24:
	{
	  if(playerSide != west) exitWith {};
	  if(!life_action_inUse) then {
			    private["_curTarget"];
				_curTarget = cursorTarget;
                if(_curTarget isKindOf "Land_Research_HQ_F") then {
                [_curTarget] call life_fnc_copInteractionMenu;
			};
		};
	};
	
	case 20:
	{
		if(!_alt && !_ctrlKey) then
		{
			if(vehicle player != player && alive vehicle player) then
			{
				if((vehicle player) in life_vehicles) then
				{
					[vehicle player] spawn life_fnc_openInventory;
				};
			}
				else
			{
				if((cursorTarget isKindOf "Land_Wreck_Traw_F" OR cursorTarget isKindOf "Land_Wreck_Traw2_F" OR cursorTarget isKindOf "Car" OR cursorTarget isKindOf "Air" OR cursorTarget isKindOf "Ship" OR cursorTarget isKindOf "House_F") && player distance cursorTarget < 10 && vehicle player == player && alive cursorTarget) then
				{
					if(cursorTarget in life_vehicles OR {!(cursorTarget getVariable ["locked",true])}) then
					{
						[cursorTarget] spawn life_fnc_openInventory;
					};
					if (cursorTarget isKindOf "Land_Wreck_Traw_F" OR cursorTarget isKindOf "Land_Wreck_Traw2_F") then {
						[cursorTarget] spawn life_fnc_openInventory;
					};
				};
			};
		};
	};
	
	case 62:
	{
	if(_alt) then {
		[3] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};
	};
	
	case 211:
	{
	if(_alt && _ctrlKey) then {
		[3] call SOCK_fnc_updatePartial;
		[6] call SOCK_fnc_updatePartial;
	};
	};
	
};

_handled;