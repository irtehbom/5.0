/*
	File: fn_useItem.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main function for item effects and functionality through the player menu.
*/
private["_item"];
disableSerialization;
if((lbCurSel 2005) == -1) exitWith {hint localize "STR_ISTR_SelectItemFirst";};
_item = lbData[2005,(lbCurSel 2005)];
_itemArray = toArray _item;
_itemArray resize 5;

_bool = true;

if (toString _itemArray == "build") then {
	[_item] spawn life_fnc_build;
	closeDialog 0;
	_bool = false; // Skip the check, we don't need it!
};

if (!_bool) exitWith
{
	[] call life_fnc_p_updateMenu;
	[] call life_fnc_hudUpdate;
};

switch (_bool) do
{
	case (_item == "water" or _item == "coffee"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
		};
	};
	
	case (_item == "boltcutter"): {
		[cursorTarget] spawn life_fnc_boltcutter;
		closeDialog 0;
	};
	
	case (_item == "blastingcharge"): {
		player reveal fed_bank;
		(group player) reveal fed_bank;
		[cursorTarget] spawn life_fnc_blastingCharge;
		
	};
	
	case (_item == "c4"): {
	
		player reveal oil_rig;
		(group player) reveal oil_rig;
		[cursorTarget] spawn life_fnc_c4;
	};
	
	case (_item == "defusekit"): {
		[cursorTarget] spawn life_fnc_defuseKit;
	};
	
	case (_item in ["storagesmall","storagebig"]): {
		[_item] call life_fnc_storageBox;
	};
	
	case (_item == "crowbar"): {
		[cursorTarget] spawn life_fnc_buildRemove;
	};

	
	case (_item == "redgull"):
	{
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			life_thirst = 100;
			player setFatigue 0;
			[] spawn
			{
				life_redgull_effect = time;
				titleText[localize "STR_ISTR_RedGullEffect","PLAIN"];
				player enableFatigue false;
				waitUntil {!alive player OR ((time - life_redgull_effect) > (3 * 60))};
				player enableFatigue true;
			};
		};
	};
	
	case (_item == "spikeStrip"):
	{
		if(!isNull life_spikestrip) exitWith {hint localize "STR_ISTR_SpikesDeployment"};
		if(([false,_item,1] call life_fnc_handleInv)) then
		{
			[] spawn life_fnc_spikeStrip;
		};
	};
	
	case (_item == "fuelF"):
	{
		if(vehicle player != player) exitWith {hint localize "STR_ISTR_RefuelInVehicle"};
		[] spawn life_fnc_jerryRefuel;
	};
	
	case (_item == "lockpick"):
	{
		[] spawn life_fnc_lockpick;
	};
	
	case (_item in ["apple","rabbit","salema","ornate","mackerel","tuna","mullet","catshark","turtle","turtlesoup","donuts","tbacon","peach","sroll"]):
	{
		[_item] call life_fnc_eatFood;
	};

	case (_item == "pickaxe"):
	{
		[] spawn life_fnc_pickAxeUse;
	};
	
	case (_item == "uwsl"): {
		private["_handle"];
        _OBJ = nearestObject [player, "Land_Wreck_Traw_F"];
		if (_OBJ == ObjNull) exitWith { hint "You're not near the shipwreck!"; };
		if (player distance _OBJ < 100) then {
			if (!([false,_item,1] call life_fnc_handleInv)) exitWith { hint "Error: Object not found"; };
			
			_ship = _OBJ getVariable "opened";
			_ship_obj = _OBJ;
			if (_ship) then {hint "The ship is already open!"};
			if (!_ship) then {
				hint "The charge has been planted! Get away from the shipwreck!";
				playSound3D ["A3\Sounds_F\sfx\alarm_independent.wss", _ship_obj];
				[] spawn {
                    _handle = [] spawn life_fnc_wrecktimer;
                    waitUntil {scriptDone _handle};
					_objOverride = nearestObject [player, "Land_Wreck_Traw_F"];
                    _bomb = "Bo_GBU12_LGB_MI10" createVehicle [getPos _objOverride select 0, getPos _objOverride select 1, 0];
                    schiffwoffen = true;
                    publicVariableServer "schiffwoffen";
                };
			};
		};
	};
	
	default
	{
		hint localize "STR_ISTR_NotUsable";
	};
};
	
[] call life_fnc_p_updateMenu;
[] call life_fnc_hudUpdate;