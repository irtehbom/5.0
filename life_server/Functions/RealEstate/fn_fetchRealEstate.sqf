/*
	Fetches the real estate containers & y inventory(WIP)
*/
private["_query","_houses"];
if(_this == "") exitWith {};

_query = format["SELECT pid, pos, inventory, containers FROM realestate WHERE pid='%1' AND owned='1'",_this];
waitUntil{!DB_Async_Active};
_queryResult = [_query,2,true] call DB_fnc_asyncCall;

_return = [];
{
	_pos = call compile format["%1",_x select 1];
	gotStorageObject = objnull;
	_estate = nearestObject [_pos, "Land_i_House_Big_01_V1_F"];
	_estate allowDamage false;
	_containers = [];
	_trunk = [_x select 2] call DB_fnc_mresToArray;
	if(typeName _trunk == "STRING") then {_trunk = call compile format["%1", _trunk];};
	_containerData = [_x select 3] call DB_fnc_mresToArray;
	if(typeName _containerData == "STRING") then {_containerData = call compile format["%1", _containerData];};
	_estate setVariable["Trunk",_trunk,true];
	_counter = 0;
	storageContainerArr = nearestObjects [_pos, ["CargoNet_01_box_F"],30];
	{
	
	switch (_counter) do
	{
		case 0: {
		
		storageContainerObject = storageContainerArr select 0;
		
		_containers pushBack storageContainerObject;
		
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;
		

		clearWeaponCargoGlobal storageContainerObject;
		clearItemCargoGlobal storageContainerObject;
		clearMagazineCargoGlobal storageContainerObject;
		clearBackpackCargoGlobal storageContainerObject;
		
		//Add weapons to the crate.
		{
			_weaponCount = (_weapons select 1) select _forEachIndex;
			storageContainerObject addWeaponCargoGlobal [_x,_weaponCount];
		} foreach (_weapons select 0);
		
		//Add magazines
		{
			_magazineCount = (_magazines select 1) select _forEachIndex;
			storageContainerObject addMagazineCargoGlobal [_x,_magazineCount];
		} foreach (_magazines select 0);
			
		//Add items
		{
			_itemCount = (_items select 1) select _forEachIndex;
			storageContainerObject addItemCargoGlobal [_x,_itemCount];
		} foreach (_items select 0);
		
		//Add backpacks
		{
			_backpackCount = (_backpacks select 1) select _forEachIndex;
			storageContainerObject addBackpackCargoGlobal [_x,_backpackCount];
		} foreach (_backpacks select 0);
		
		};
		case 1: {
		
		storageContainerObject = storageContainerArr select 1;
		
		_containers pushBack storageContainerObject;
		
		clearWeaponCargoGlobal storageContainerObject;
		clearItemCargoGlobal storageContainerObject;
		clearMagazineCargoGlobal storageContainerObject;
		clearBackpackCargoGlobal storageContainerObject;
		
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;
		
		//Add weapons to the crate.
		{
			_weaponCount = (_weapons select 1) select _forEachIndex;
			storageContainerObject addWeaponCargoGlobal [_x,_weaponCount];
		} foreach (_weapons select 0);
		
		//Add magazines
		{
			_magazineCount = (_magazines select 1) select _forEachIndex;
			storageContainerObject addMagazineCargoGlobal [_x,_magazineCount];
		} foreach (_magazines select 0);
			
		//Add items
		{
			_itemCount = (_items select 1) select _forEachIndex;
			storageContainerObject addItemCargoGlobal [_x,_itemCount];
		} foreach (_items select 0);
		
		//Add backpacks
		{
			_backpackCount = (_backpacks select 1) select _forEachIndex;
			storageContainerObject addBackpackCargoGlobal [_x,_backpackCount];
		} foreach (_backpacks select 0);
		
		};
		case 2: {
		
		storageContainerObject = storageContainerArr select 2;
		
		_containers pushBack storageContainerObject;
		
		clearWeaponCargoGlobal storageContainerObject;
		clearItemCargoGlobal storageContainerObject;
		clearMagazineCargoGlobal storageContainerObject;
		clearBackpackCargoGlobal storageContainerObject;
		
		_className = _x select 0;
		_weapons = (_x select 1) select 0;
		_magazines = (_x select 1) select 1;
		_items = (_x select 1) select 2;
		_backpacks = (_x select 1) select 3;
		
		//Add weapons to the crate.
		{
			_weaponCount = (_weapons select 1) select _forEachIndex;
			storageContainerObject addWeaponCargoGlobal [_x,_weaponCount];
		} foreach (_weapons select 0);
		
		//Add magazines
		{
			_magazineCount = (_magazines select 1) select _forEachIndex;
			storageContainerObject addMagazineCargoGlobal [_x,_magazineCount];
		} foreach (_magazines select 0);
			
		//Add items
		{
			_itemCount = (_items select 1) select _forEachIndex;
			storageContainerObject addItemCargoGlobal [_x,_itemCount];
		} foreach (_items select 0);
		
		//Add backpacks
		{
			_backpackCount = (_backpacks select 1) select _forEachIndex;
			storageContainerObject addBackpackCargoGlobal [_x,_backpackCount];
		} foreach (_backpacks select 0)
		
		};
	};
	
	_counter = _counter + 1;
	
	} foreach _containerData; // runs 3 times
	
	_return pushBack [_x select 1,_containers];
} foreach _queryResult;  //runs once


missionNamespace setVariable[format["realEstate_%1",_this],_return];