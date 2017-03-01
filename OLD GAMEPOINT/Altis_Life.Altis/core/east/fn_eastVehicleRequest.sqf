private[];
disableSerialization;

_vehicle = [_this, 0, ObjNull, [ObjNull]] call BIS_fnc_param;

if (isNull _vehicle) then {
	_dialog = findDisplay 2700;
	_list = _dialog displayCtrl 2701;
	_sel = lbCurSel _list;
	if(_sel == -1) exitWith {hint "No vehicle selected";};
	_index = (parseNumber(_list lbData _sel));
	_vehicle = life_vehicles select _index;

	if (player distance _vehicle > 200) exitWith { hint "You need to be within 200 meters of your vehicle to call a mechanic."; };
};


// We're gonna sleep for a second or two so spawn subscript
[_vehicle] spawn {

	hint "Dialing HATO..";
	sleep 1;
	
	_action = [
		"'Hello mate what can I help you with today?'",
		"Call HATO",
		"Repair/Refuel",
		"Tow back to garage"
	] call BIS_fnc_guiMessage;

	
	if (playerSide == civilian) then {
	
		if (_action) then {
			_secAction = [
				"'Alright. You'll have to wait near your vehicle. Repairing or refueling will cost a bit of dosh mate, are you okay with that? It costs 5,000 dollars.'",
				"Repair/refuel",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
			
			if (_secAction) then {
				_bail = false;
				if (ftp_cash > 5000) then {
					ftp_cash = ftp_cash - 5000;
				} else {
					if (ftp_atmcash > 5000) then {
						ftp_atmcash = ftp_atmcash - 5000;
					} else {
						_bail = true;
					};
				};
				if (_bail) exitWith { hint "You do not have enough money to have a mechanic come over."; };
				
				[_this select 0] call life_fnc_eastRequest;
				hint "'Alright we'll be there in a few minutes, just hold tight!'";
			};
		} else {
			_secAction = [
				"'Alright, we'll take that vehicle back to your garage, you don't even have to be near your vehicle - we take care of everything! Will cost a bit of dosh though; 10,000 dollars.'",
				"Tow to garage",
				"Yes",
				"No"
			] call BIS_fnc_guiMessage;
			
			if (_secAction) then {
				_bail = false;
				if (ftp_cash > 10000) then {
					ftp_cash = ftp_cash - 10000;
				} else {
					if (ftp_atmcash > 10000) then {
						ftp_atmcash = ftp_atmcash - 10000;
					} else {
						_bail = true;
					};
				};
				if (_bail) exitWith { hint "You do not have enough money to have a mechanic come over."; };
				
				[_this select 0, "Tow"] call life_fnc_eastRequest;
				hint "'Alright great, we'll take your car back to the garage for you.'";
			};
		};
		
	} else {
		if (_action) then {
			[_this select 0] call life_fnc_eastRequest;
			hint "'Alright we'll be there in a few minutes, just hold tight!'";
		} else {
			[_this select 0, "Tow"] call life_fnc_eastRequest;
			hint "'Alright we'll take that car back to the garage for you.";
		};
	};
};