/*
    File: fn_federalUpdate.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Uhhh, adds to it?
*/
private "_funds";
for "_i" from 0 to 1 step 0 do {
    uiSleep (25 * 60);
    _funds = fed_bank getVariable ["safe",0];
	_oilfunds = oil_rig getVariable ["safe",0];
    fed_bank setVariable ["safe",round(_funds+((count playableUnits)/2)),true];
	oil_rig setVariable ["safe",round(_oilfunds+((count playableUnits)/2)),true];
};
