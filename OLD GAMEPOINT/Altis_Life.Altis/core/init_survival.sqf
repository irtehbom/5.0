[] spawn  {
	private["_fnc_food","_fnc_water"];
	_fnc_food = 
	{
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";}
		else
		{
		life_hunger = life_hunger - 10;
		[] call life_fnc_hudUpdate;
		if(life_hunger < 2) then {player setDamage 1; hint localize "STR_NOTF_EatMSG_Death";};
		switch(life_hunger) do {
			case 30: {hint localize "STR_NOTF_EatMSG_1";};
			case 20: {hint localize "STR_NOTF_EatMSG_2";};
			case 10: {hint localize "STR_NOTF_EatMSG_3";player setFatigue 1;};
			};
		};
	};
	
	_fnc_water = 
	{
		if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";}
		else
		{
			life_thirst = life_thirst - 10;
			[] call life_fnc_hudUpdate;
			if(life_thirst < 2) then {player setDamage 1; hint localize "STR_NOTF_DrinkMSG_Death";};
			switch(life_thirst) do 
			{
				case 30: {hint localize "STR_NOTF_DrinkMSG_1";};
				case 20: {hint localize "STR_NOTF_DrinkMSG_2"; player setFatigue 1;};
				case 10: {hint localize "STR_NOTF_DrinkMSG_3"; player setFatigue 1;};
			};
		};
	};
	
	_counter = 0;
	while{true} do
	{
		_num = 600;
		_skillRank = [player, 100] call life_fnc_xpSkillRank; // Experience gain
		if (_skillRank > 0) then {
			_fe = _skillRank * 10;
			_n = 1 + _fe / 100;
			_num = _num * _n;
		};
		
		sleep _num;
		[] call _fnc_water;
		
		_counter = _counter + _num;
		
		_num = 250;
		_skillRank = [player, 100] call life_fnc_xpSkillRank; // Experience gain
		if (_skillRank > 0) then {
			_fe = _skillRank * 10;
			_n = 1 + _fe / 100;
			_num = _num * _n;
		};
		sleep _num;
		[] call _fnc_food;
		
		_counter = _counter + _num;
		
		if (_counter > 5000) then {
			_counter = 0;
			
			[[20, player, (call life_donator)], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
		};
	};
};

[] spawn
{
	private["_bp","_load","_cfg"];
	while{true} do
	{
	
	sleep 20;
	
		waitUntil {backpack player != ""};
		_bp = backpack player;
		_cfg = getNumber(configFile >> "CfgVehicles" >> (backpack player) >> "maximumload");
		_load = round(_cfg / 8);
		life_maxWeight = life_maxWeightT + _load;
		waitUntil {backpack player != _bp};
		if(backpack player == "") then 
		{
			life_maxWeight = life_maxWeightT;
		};
	};
};

[] spawn
{
	while {true} do
	{
		sleep 30;
		
		_maxWeight = life_maxWeight;
		_skillRank = [player, 107] call life_fnc_xpSkillRank; // Greasemonkey
		if (_skillRank > 0) then {
			_maxWeight = life_maxWeight + (_skillRank * 10);
		};
		if(life_carryWeight > _maxWeight && !isForcedWalk player) then {
			player forceWalk true;
			player setFatigue 1;
			hint localize "STR_NOTF_MaxWeight";
		} else {
			if(isForcedWalk player) then {
				player forceWalk false;
			};
		};
	};
};

[] spawn  
{
	private["_walkDis","_myLastPos","_MaxWalk","_runHunger","_runDehydrate"];
	_walkDis = 0;
	_myLastPos = (getPos player select 0) + (getPos player select 1);
	_MaxWalk = 1200;
	while{true} do 
	{
		sleep 180;
		if(!alive player) then {_walkDis = 0;}
		else
		{
			_CurPos = (getPos player select 0) + (getPos player select 1);
			if((_CurPos != _myLastPos) && (vehicle player == player)) then
			{
				_walkDis = _walkDis + 1;
				if(_walkDis == _MaxWalk) then
				{
					_walkDis = 0;
					life_thirst = life_thirst - 5;
					life_hunger = life_hunger - 5;
					[] call life_fnc_hudUpdate;
				};
			};
			_myLastPos = (getPos player select 0) + (getPos player select 1);
		};
	};
};