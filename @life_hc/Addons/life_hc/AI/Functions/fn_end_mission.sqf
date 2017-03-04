// =========================================================================================================
//  Author: Rob
// =========================================================================================================

private["_message"];

_missionTimeout = _this select 0;
_itemsToDestroy = _this select 1;
_groupToDestroy = _this select 2;
_markerToDestroy =  _this select 3;
_endMessage = _this select 4;
_timer = _this select 5;

_startTime = floor(time);
waitUntil {
	sleep 1;
	_currTime = floor(time);
	
	_result = 0;
	if(_currTime - _startTime >= _missionTimeout) then {
		_result = 1;
	};
	
	(_result > 0);
};

switch (_endMessage) do {

	case 1: {
            _message = parseText format ["
			<t align='center' color='#52bf90' shadow='2' size='1.75'>Helicopter Mission Ended</t><br/><br/>
			<t align='center' color='#FFFFFF'>%1 minutes have elapsed</t><br/><br/>"
			,_timer];
    };
	
	case 2: {
			_message = parseText format ["
			<t align='center' color='#52bf90' shadow='2' size='1.75'>Drugs Stash Mission Ended</t><br/><br/>
			<t align='center' color='#FFFFFF'>%1 minutes have elapsed</t><br/><br/>"
			,_timer];
    };
	
	case 3: {
			_message = parseText format ["
			<t align='center' color='#52bf90' shadow='2' size='1.75'>Military Truck Mission Ended</t><br/><br/>
			<t align='center' color='#FFFFFF'>%1 minutes have elapsed</t><br/><br/>"
			,_timer];
    };
	
	case 4: {
			_message = parseText format ["
			<t align='center' color='#52bf90' shadow='2' size='1.75'>Assassination Mission Ended</t><br/><br/>
			<t align='center' color='#FFFFFF'>%1 minutes have elapsed</t><br/><br/>"
			,_timer];
    };

};

_message remoteExec ["hint",0];

{
	deleteVehicle _x;
	
} forEach _itemsToDestroy; 

{
	removeallweapons _x;
	removebackpack _x;
	deleteVehicle _x;
	
} forEach (units _groupToDestroy); 

deleteMarker _markerToDestroy;