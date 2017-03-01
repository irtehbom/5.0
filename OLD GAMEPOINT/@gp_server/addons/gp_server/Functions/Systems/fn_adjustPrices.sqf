/*
	File: fn_Ajustprices.sqf
	Author: worldtrade1101
	Moded by Ragebone
	Description:
	Sends a request to update and adjust the price of stuff in the DB.
*/
//[[0,player,life_shop_type,_amount,_price,_item],"TON_fnc_Adjustprices",false,false] spawn life_fnc_MP;
private["_type","_unit","_name","_shop","_amount","_price","_item","_tickTime","_query","_queryResult","_err","_ref"];
_type = [_this,0,"",[0]] call BIS_fnc_param; // ob verkauft wurde oder nicht.
_unit = [_this,1,"",[ObjNull]] call BIS_fnc_param;
_name = _unit getVariable"realname";
_unit = owner _unit; //for antihack purpose!
_shop = [_this,2,"",[""]] call BIS_fnc_param;
_amount = [_this,3,"",[0]] call BIS_fnc_param;
_price = [_this,4,"",[0]] call BIS_fnc_param;
_item = [_this,5,"",[""]] call BIS_fnc_param;

_randomnumber = random 100;

if (_randomnumber < 80) exitwith {diag_log "This transaction doesn't update the price!"};
// Error checks.
/*
_err = [];
if(_type == "")then{_err pushBack "unknowen type of shop-ACTION";}; 
if(_unit == "")then{_err pushBack "No Buyer/Seller";};
if(_shop == "")then{_err pushBack "No Shop";};
if(_amount == "")then{_err pushBack "No Shop";};
if(_price == "")then{_err pushBack "No price";};
if(_item == "")then{_err pushBack "No item";};
if!(isNil{_err select 0})exitWith{diag_log format["%1",_err];
*/
if(_type == 0)then{
	diag_log format ["%1   %2    %3    %4      %5      %6","Sell",_unit,_name,_shop,_amount,_price,_item];
}else{
	diag_log format ["%1   %2    %3    %4      %5      %6","Buy",_unit,_name,_shop,_amount,_price,_item];
};
 
_query = format["SELECT ressource, buyprice, sellprice, varprice, minprice, maxprice from `economy` WHERE factor IN (SELECT factor From `economy` WHERE ressource ='%1');",_item];

waitUntil{sleep (random 0.3); !DB_Async_Active};
_tickTime = diag_tickTime;
_queryResult = [_query,2,true] call DB_fnc_asyncCall;
 
diag_log "------------- Client Adjust Economy Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "---------------------------------------------------------------";
 
_sellingfactor =((count _queryResult)-1);
_ref= 0;
{	
	_ressource = (_x select 0);	
	_buyprice =  (_x select 1);
	_sellprice =  (_x select 2);
	_itemprice =  (_x select 3);
	_minprice = (_x select 4);
	_maxprice = (_x select 5);
 
	if (_ressource == _item) then {
		if (_type == 0) then {
			if (_buyprice != 0) then {
				if( (_buyprice - (_itemprice * _amount)) > _minprice) then {
					_buyprice= _buyprice - (_itemprice * _amount);
				};
				if ((_sellprice >= _buyprice)) then {
					_buyprice=_sellprice + 15;
				};
			};
			if ((_sellprice - (_itemprice * _amount *_sellingfactor)) > _minprice) then {
				_sellprice = _sellprice - (_itemprice * _amount *_sellingfactor);
			};			
		} else {
			if (_buyprice != 0) then {
				if( (_buyprice + (_itemprice * _amount)) < (_maxprice+15)) then {
					_buyprice = _buyprice + (_itemprice * _amount);
				};
			};
			if ((_sellprice + (_itemprice * _amount)) < _maxprice) then {
				_sellprice = _sellprice + (_itemprice * _amount);
			};
		};
	}else{
		if (_type == 0) then {
			if (_buyprice != 0) then {
				if( (_buyprice + (_itemprice * _amount)) < (_maxprice)) then {
					_buyprice = _buyprice + (_itemprice * _amount);
				};
			};
			if ((_sellprice + (_itemprice * _amount)) < _maxprice) then {
				_sellprice = _sellprice + (_itemprice * _amount);
			};
		}else{ 
			if (_buyprice != 0) then {
				if( (_buyprice - (_itemprice * _amount)) > _minprice ) then {
					_buyprice= _buyprice - (_itemprice * _amount);
				};
			};
			if ((_sellprice - (_itemprice * _amount)) > _minprice) then {
				_sellprice = _sellprice - (_itemprice * _amount);
			};
		};
	};	
	
	/*
	if(_ref==0)then{
		_query = format["UPDATE economy SET buyprice='%1', sellprice='%2' WHERE ressource='%3';",_buyprice,_sellprice,_ressource];
	}else{
		_varQuery = format["UPDATE economy SET buyprice='%1', sellprice='%2' WHERE ressource='%3';",_buyprice,_sellprice,_ressource];
		_query = format["%1 %2",_query,_varQuery];
	};
	_ref = _ref + 1;*/
	_query = format["UPDATE economy SET buyprice='%1', sellprice='%2' WHERE ressource='%3'", _buyprice, _sellprice, _ressource];
	waitUntil {sleep (random 0.3); !DB_Async_Active};
	_queryResult = [_query,1] call DB_fnc_asyncCall;
}foreach _queryResult;
 
 /*
waitUntil {sleep (random 0.3); !DB_Async_Active};
_queryResult = [_query,1] call DB_fnc_asyncCall;
diag_log "------------- Client Adjust Economy Query Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "---------------------------------------------------------------";*/