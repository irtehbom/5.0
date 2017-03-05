// =========================================================================================================
//  Author: Rob
// =========================================================================================================

#include "\life_server\script_macros.hpp"

private ["_query","_queryResult"];

_captureZones = [
	["weed_capture","weedCaptureMarker",weed_capture],
	["heroin_capture","heroinCaptureMarker",heroin_capture],
	["cocaine_capture","cocaineCaptureMarker",cocaine_capture],
	["arms_capture","armsCaptureMarker",arms_capture]
];

_flagTexture = [
        "\A3\Data_F\Flags\Flag_red_CO.paa",
        "\A3\Data_F\Flags\Flag_green_CO.paa",
        "\A3\Data_F\Flags\Flag_blue_CO.paa",
        "\A3\Data_F\Flags\Flag_white_CO.paa",
        "\A3\Data_F\Flags\flag_fd_red_CO.paa",
        "\A3\Data_F\Flags\flag_fd_green_CO.paa",
        "\A3\Data_F\Flags\flag_fd_blue_CO.paa",
        "\A3\Data_F\Flags\flag_fd_orange_CO.paa"
] call BIS_fnc_selectRandom;

{
	_query = format ["SELECT name FROM gangs WHERE %1='1'",_x select 0];
	_result = [_query,2] call DB_fnc_asyncCall;
	
	if (!(count _result isEqualTo 0)) then {
	
		_gangName = _result select 0;
		
		_marker = createMarker [_x select 1, _x select 2];
		_marker setMarkerColor "ColorGreen";
		_marker setMarkerText "Controlled by " + _gangName;
		_marker setMarkerType "mil_box";
		
		 _x select 2 setVariable ["area_controlled",true,true];
		 _x select 2 setVariable ["gang_name",_gangName,true];
		 _x select 2 setFlagTexture _flagTexture;
	 
	 };

} forEach _captureZones;


