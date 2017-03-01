private[];

_vehicle = (attachedObjects (vehicle player)) select 0;
detach _vehicle;

[[_vehicle], "life_fnc_eastCompleted", false, false] spawn life_fnc_MP;
ftp_atmcash = ftp_atmcash + 50000;
_vehicle setVariable["HATORequested", false, true];
hint "You've completed a HATO request and received 50,000 dollars in commission.";
[[18, player, (call life_donator)], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
[[_vehicle, false], "TON_fnc_vehicleStoreTow" ,false, false] spawn life_fnc_MP;

removeAllActions _vehicle;
deleteVehicle _vehicle;