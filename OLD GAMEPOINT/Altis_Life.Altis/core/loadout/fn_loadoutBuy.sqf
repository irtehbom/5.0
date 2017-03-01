private["_display","_list","_crimes","_bounty","_mylist","_rank"];
disableSerialization;

_display = findDisplay 70000;
_list = _display displayCtrl 70003;
_data = lbData[70002,(lbCurSel 70002)];
_data = call compile format["%1", _data];

_costs = [_data] call life_fnc_loadoutCalculateCosts;
_extraCosts = "";
switch (call life_donator) do {
	case 0:
	{
		_extraCosts = "The $25,000 extra costs are already included.";
	};
	
	case 1:
	{
		_extraCosts = "The $20,000 extra costs are already included, but you save 10% since you're donator level 1.";
	};
	
	case 2:
	{
		_extraCosts = "The $15,000 extra costs are already included, but you save 20% because you're donator level 2.";
	};
	
	case 3:
	{
		_extraCosts = "The $10,000 extra costs are already included, you save 30% because you're donator level 3.";
	};
	
	case 4:
	{
		_extraCosts = "You save 50% off the total cost because you're donator level 4.";
	};
};

_rank = player getVariable["gangRank", -1];
_personalMoney = true;
_successful = false;
if (_rank != -1) then {
	_rankConfig = [_rank] call life_fnc_gangGetRank;
	_allowed = false;
	if (count _rankConfig > 0) then {
		_allowed = _rankConfig select 4;
	};
	
	_gangBank = (group player) getVariable["gangBank", 0];
	
	if (_allowed && _gangBank >= _costs) then {
		_message = format["It costs $%1 to buy this loadout. %2 Would you like to purchase this using gang funds or your personal money?", [_costs] call life_fnc_numberText, _extraCosts];
		
		_action = [
				_message,
			localize "STR_Shop_Virt_YourorGang",
			localize "STR_Shop_Virt_UI_GangFunds",
			localize "STR_Shop_Virt_UI_YourCash"
		] call BIS_fnc_guiMessage;
		
		if (_action) then {
			_personalMoney = false;
			
			_gangBank = (group player) getVariable "gangBank";
			_gangBank = _gangBank - _costs;
			
			(group player) setVariable["gangBank", _gangBank, true];
			_successful = true;
		} else {
			_personalMoney = true;
		};
	} else {
		_successful = false;
		hint "There was not enough money in the gang bank to purchase this loadout.";
	};
};

if (_personalMoney) then {
	if (ftp_cash >= _costs) then {
		ftp_cash = ftp_cash - _costs;
		[6] call SOCK_fnc_updatePartial;
		_successful = true;
	} else {
		if (ftp_atmcash >= _costs) then {
			ftp_atmcash = ftp_atmcash - _costs;
			_successful = true;
		} else {
			hint "You do not have enough money to purchase this loadout.";
		};
	};
};

if (_successful) then {
	{	
		[_x, true, false, false, false] call life_fnc_handleItem;
	} forEach (_data select 4);
	
	{
		//player addWeapon _x;
		[_x, true, false, false, false] call life_fnc_handleItem;
	} forEach (_data select 2);
	
	{
		for "_i" from 0 to ((_x select 1) - 1) step 1 do {
			//player addMagazine (_x select 0);
			[_x select 0, true, false, false, false] call life_fnc_handleItem;
		};
	} forEach (_data select 3);
};