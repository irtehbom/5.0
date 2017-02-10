#include <macro.h>
/*
Creates the real estate menu
*/
private["_display"];


#define Btn1 13001
#define Btn2 13002
#define Btn3 13003
#define RentText 13010
#define marketDueDate 13008
#define AlreadyBought 13009

disableSerialization;
createDialog "real_estate_menu";

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; 

_owner = _curTarget getVariable["estate_owned", [0,""]] select 1;
_rentDueSwitch = _curTarget getVariable["rent", 0];
_rentDue = 0;

switch (_rentDueSwitch) do {
case 0: 	{ _rentDue = 10; };
case 1: 	{ _rentDue = 9;  };
case 2: 	{ _rentDue = 8;  };
case 3: 	{ _rentDue = 7;  };
case 4: 	{ _rentDue = 6;  };
case 5: 	{ _rentDue = 5;  };
case 6: 	{ _rentDue = 4;  };
case 7: 	{ _rentDue = 3;  };
case 8: 	{ _rentDue = 2;  };
case 9: 	{ _rentDue = 1;  };
case 10:	{ _rentDue = 0;  };
};

_display = findDisplay 13000;

_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_RentText = _display displayCtrl RentText;
_marketDueDate = _display displayCtrl marketDueDate;
_AlreadyBought = _display displayCtrl AlreadyBought;

_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
//_RentText ctrlShow false;

life_pInact_curTarget = _curTarget;


if(isNil {_curTarget getVariable "estate_owned"}) then {
	_Btn1 ctrlSetText "Purchase Estate";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_purchaseEstate; closeDialog 0;";
	_Btn1 ctrlShow true;
	
	if(!isNil {_curTarget getVariable "estate_owned"}) then {
		_Btn1 ctrlEnable false;
	};
	
	} else {
	if(((_curTarget getVariable "estate_owned") select 0) == (getPlayerUID player)) then {
	
	_Btn1 ctrlSetText "Sell Estate";
	_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_sellEstate; closeDialog 0;";
	_Btn1 ctrlShow true;
	
	_Btn2 ctrlSetText "Pay Rent";
	_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_realEstatePayRent; closeDialog 0;";
	_Btn2 ctrlShow true;
	
	_lockCheck = life_pInact_curTarget getVariable["estate_locked",true];
	
	if (_lockCheck) then {
	_Btn3 ctrlSetText "Unlock Storage";
	} else {
	_Btn3 ctrlSetText "Lock Storage";
	};
	
	_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_locksRealEstate; closeDialog 0;";
	_Btn3 ctrlShow true;
	

	_RentText ctrlSetText format["You have %1 days left to pay rent!",_rentDue];
	
	};
	
	if(((_curTarget getVariable "estate_owned") select 0) != (getPlayerUID player)) then {
	
		_Btn1 ctrlEnable false;
		_AlreadyBought ctrlSetText format["This Estate is owned by %1",_owner];
		_marketDueDate ctrlSetText format["The property will be back on the market in %1 days if the rent is unpaid!
		",_rentDue];
	};
};

