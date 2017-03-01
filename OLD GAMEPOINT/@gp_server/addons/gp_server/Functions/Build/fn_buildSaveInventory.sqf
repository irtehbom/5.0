private[];

_container = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

_objectId = _container getVariable["objectID", -1];
if (_objectId == -1) exitWith {}; // Can happen when opened too early after placing


_weapons = getWeaponCargo _container;
_magazines = getMagazineCargo _container;
_items = getItemCargo _container;
_backpacks = getBackpackCargo _container;

_arr = [_weapons, _magazines, _items, _backpacks];
_totalArray = [_arr, _container getVariable["Trunk", [[],0]]];


_totalArray = [_totalArray] call DB_fnc_mresArray;
_query = format["UPDATE build SET inventory='%1' WHERE objectID='%2'", _totalArray, _objectId];
waitUntil{!DB_Async_Active};
[_query, 1] call DB_fnc_asyncCall;