private[];

_storageCrates = [
	"O_supplyCrate_F",
	"Box_IND_AmmoOrd_F"
];

_invisibles = [
	"Sign_Arrow_Direction_Green_F",
	"Sign_Arrow_F",
	"Sign_Arrow_Direction_Blue_F"
];


diag_log ":: Build: Spawning objects..";

waitUntil {!DB_Async_Active};
_queryResult = ["SELECT * FROM build",2,true] call DB_fnc_asyncCall;

_spawnedCount = 0;
{
	_pos = [_x select 3] call DB_fnc_mresToArray;
	_dir = _pos select 0;
	_position = _pos select 1;
	_damage = _x select 4;
	
	if (_damage < 16) then {
		_spawnedCount = _spawnedCount + 1;
		_object = (_x select 2) createVehicle _position;
		_object setDir _dir;
		_object setPosATL _position;
		_object setVariable["gang", _x select 1, true];
		_object setVariable["objectID", _x select 0, true];
		_object setVariable["damage", _x select 4, true];

		_numOfDoors = getNumber(configFile >> "CfgVehicles" >> (typeOf _object) >> "numberOfDoors");
	
		for "_i" from 1 to _numOfDoors do {
		_object setVariable[format["bis_disabled_Door_%1",_i],1,true];
		};
		
		_object setVectorUp [0, 0, 1];
		
		if ((_x select 2) in _invisibles) then {
			_object hideObjectGlobal true;
		};
		
		if ((_x select 2) in _storageCrates) then {	
			// Restore inventory contents
			_object enableSimulationGlobal true;
			clearWeaponCargoGlobal _object;
			clearItemCargoGlobal _object;
			clearMagazineCargoGlobal _object;
			clearBackpackCargoGlobal _object;
			
			_storageInventories = [_x select 5] call DB_fnc_mresToArray;
			
			_inventory = [];
			if (count _storageInventories == 2) then {
				_inventory = _storageInventories select 0;
				_object setVariable["Trunk", _storageInventories select 1];
			} else {
				_inventory = _storageInventories;
			};
			
			if (count _inventory > 0) then {
				_weapons = _inventory select 0;
				_weaponCount = _weapons select 1;
				
				_magazines = _inventory select 1;
				_magazineCount = _magazines select 1;
				
				_items = _inventory select 2;
				_itemCount = _items select 1;
				
				_backpacks = _inventory select 3;
				_backpackCount = _backpacks select 1;
				
				_count = 0;
				{
					_object addWeaponCargoGlobal[_x, _weaponCount select _count];
					_count = _count + 1;
				} forEach (_weapons select 0);
				
				_count = 0;
				{
					_object addMagazineCargoGlobal[_x, _magazineCount select _count];
					_count = _count + 1;
				} forEach (_magazines select 0);
				
				_count = 0;
				{
					_object addItemCargoGlobal[_x, _itemCount select _count];
					_count = _count + 1;
				} forEach (_items select 0);
				
				_count = 0;
				{
					_object addBackpackCargoGlobal[_x, _backpackCount select _count];
					_count = _count + 1;
				} forEach (_backpacks select 0);
			};
		} else {
			_object enableSimulationGlobal false;
		};
	};
} forEach _queryResult;


diag_log format[":: Build: Done. Spawned %1 out of %2 objects.", _spawnedCount, count _queryResult];