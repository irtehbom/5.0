/*
	File: fn_gpsMarker.sqf
	Author: Rob
*/
private["_markers","_east"];
_markers = [];
sleep 1;
if(visibleMap) then {
	
	_marker = createMarkerLocal [format["%1_marker",player],visiblePosition player];
	_marker setMarkerColorLocal "ColorRed";
	_marker setMarkerTypeLocal "select";
		
	while {visibleMap} do
	{	
		_marker setMarkerPosLocal (visiblePosition player);
		
		if(!visibleMap) exitWith {};
		sleep 0.50;
	};

	deleteMarkerLocal _marker;
	_markers = [];
};