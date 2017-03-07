// =========================================================================================================
//  Author: Rob
// =========================================================================================================
#include "..\..\script_macros.hpp"

private ["_action","_cpRate"];

_flagObject = _this select 0;
_player = _this select 1;
_exit = false;
_exitMessage = "";
_cpRate = 0.0008;
_gangName = group player getVariable "gang_name";
_gangNameFlag = _flagObject getVariable ["gang_name",""];
_message = "";
_benefits = "";
_gangOwner = format["Controlled by %1",_gangName];
_markerName = "";

if (isNil {group player getVariable "gang_name"}) exitWith{_exit = true; _exitMessage = "STR_GNOTF_CreateGang";};
if (_exit) exitWith {titleText[localize _exitMessage,"PLAIN"];};

if (_flagObject getVariable "gang_name" == group player getVariable "gang_name") exitWith {hint "You already have control of this area!"};
if (!isNil "_action" && {!_action}) exitWith {titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"];};
life_action_inUse = true;

switch (_flagObject) do {
    case weed_capture: {
        _message = "Weed Area";
		_benefits = "The gang will now gain a 10% profit on all Weed sold by anybody!";
		_markerName = "weedCaptureMarker";
    };
    case cocaine_capture: {
        _message = "Cocaine Area";
	    _benefits = "The gang will now gain a 10% profit on all Cocaine sold by anybody!";
	    _markerName = "cocaineCaptureMarker";
		
    };
	case heroin_capture: {
        _message = "Heroin Area";
		_benefits = "The gang will now gain a 10% profit on all Heroin sold by anybody!";
		_markerName = "heroinCaptureMarker";
    };
	case arms_capture: {
        _message = "Arms Area";
		_benefits = "The gang will now gain a 5% profit on all weapons bought by anybody!";
		_markerName = "armsCaptureMarker";
    };
};

if (_gangNameFlag != "") then {

	_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>%1 Being Captured</t><br/><br/>
	<t align='center' color='#FFFFFF'>The gang %2 is capturing the %1 from the gang %3 </t><br/><br/>",
	_message,_gangName,_gangNameFlag];
	
	_hint remoteExec ["hint",0];
};



disableSerialization;
_title = "Capturing Area";

"progressBar" cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format ["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

for "_i" from 0 to 1 step 0 do {
    if (animationState player != "AinvPknlMstpSnonWnonDnon_medic_1") then {
        [player,"AinvPknlMstpSnonWnonDnon_medic_1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
        player switchMove "AinvPknlMstpSnonWnonDnon_medic_1";
        player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
    };
    sleep 0.26;
    if (isNull _ui) then {
        "progressBar" cutRsc ["life_progress","PLAIN"];
        _ui = uiNamespace getVariable "life_progress";
        _progressBar = _ui displayCtrl 38201;
        _titleText = _ui displayCtrl 38202;
    };
    _cP = _cP + _cpRate;
    _progressBar progressSetPosition _cP;
    _titleText ctrlSetText format ["%3 (%1%2)...",round(_cP * 100),"%",_title];
	
	if (_cP >= 1 || !alive player) exitWith {_flagObject setVariable ["area_controlled",false,true];};
	if (life_istazed) exitWith {_flagObject setVariable ["area_controlled",false,true];}; //Tazed
	if (life_isknocked) exitWith {_flagObject setVariable ["area_controlled",false,true];}; //Knocked
	if (life_interrupted) exitWith {_flagObject setVariable ["area_controlled",false,true];};
};


"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;_flagObject setVariable ["area_controlled",false,true];};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;_flagObject setVariable ["area_controlled",false,true];};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_flagObject setVariable ["area_controlled",false,true];};
life_action_inUse = false;

titleText["The Area Has Been Captured","PLAIN"];
private _flagTexture = [
        "\A3\Data_F\Flags\Flag_red_CO.paa",
        "\A3\Data_F\Flags\Flag_green_CO.paa",
        "\A3\Data_F\Flags\Flag_blue_CO.paa",
        "\A3\Data_F\Flags\Flag_white_CO.paa",
        "\A3\Data_F\Flags\flag_fd_red_CO.paa",
        "\A3\Data_F\Flags\flag_fd_green_CO.paa",
        "\A3\Data_F\Flags\flag_fd_blue_CO.paa",
        "\A3\Data_F\Flags\flag_fd_orange_CO.paa"
    ] call BIS_fnc_selectRandom;
_flagObject setFlagTexture _flagTexture;

_flagObject setVariable ["area_controlled",true,true];
_flagObject setVariable ["gang_name",group player getVariable "gang_name",true];


if (life_HC_isActive) then {
		[_flagObject,_gangName] remoteExecCall ["HC_fnc_updateGangArea",HC_Life];
} else {
		[_flagObject,_gangName] remoteExecCall ["TON_fnc_updateGangArea",RSERV];
};

[_flagObject,_gangName] remoteExecCall ["HC_fnc_updateGangArea"];

_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>%1 Captured</t><br/><br/>
	<t align='center' color='#FFFFFF'>%2 has captured the %1</t><br/><br/>
	<t align='center' color='#FFFFFF'>%3</t><br/><br/>",
	_message,_gangName,_benefits];
	
_hint remoteExec ["hint",0];

deleteMarker _markerName;
	
_marker = createMarker [_markerName, _flagObject];
_marker setMarkerColor "ColorGreen";
_marker setMarkerText _gangOwner;
_marker setMarkerType "mil_box";

