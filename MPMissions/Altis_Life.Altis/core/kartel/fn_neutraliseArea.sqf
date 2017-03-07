// =========================================================================================================
//  Author: Rob
// =========================================================================================================
#include "..\..\script_macros.hpp"

private ["_action","_cpRate"];

_flagObject = _this select 0;
_exit = false;
_exitMessage = "";
_cpRate = 0.0008;
_gangName = _flagObject getVariable ["gang_name",""];
_message = "";
_benefits = "";
_markerName = "";


if (_gangName == "") exitWith {titleText["Nobody owns this area","PLAIN"];}; 
if (!isNil "_action" && {!_action}) exitWith {titleText["Cancelled","PLAIN"];};
life_action_inUse = true;


switch (_flagObject) do {
    case weed_capture: {
        _message = "Weed Area";
		_benefits = "The cops have neutralised the Weed Area from the gang";
		_markerName = "weedCaptureMarker";
    };
    case cocaine_capture: {
        _message = "Cocaine Area";
		_benefits = "The cops have neutralised the Cocaine Area from the gang";
	    _markerName = "cocaineCaptureMarker";
		
    };
	case heroin_capture: {
        _message = "Heroin Area";
		_benefits = "The cops have neutralised the Heroin Area from the gang";
		_markerName = "heroinCaptureMarker";
    };
	case arms_capture: {
        _message = "Arms Area";
		_benefits = "The cops have neutralised the Arms Area from the gang";
		_markerName = "armsCaptureMarker";
    };
};

_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>%1 Neutralisation</t><br/><br/>
	<t align='center' color='#FFFFFF'>The Police are neutralising the %1 from the gang %2</t><br/><br/>
	<t align='center' color='#FFFFFF'>All benefits will be lost if recaptured</t><br/><br/>",
	_message,_gangName];
	
_hint remoteExec ["hint",0];

disableSerialization;
_title = "Neutralising Area";

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
	
	if (_cP >= 1 || !alive player) exitWith {_flagObject setVariable ["area_controlled",true,true];};
	if (life_isknocked) exitWith {_flagObject setVariable ["area_controlled",true,true];}; //Knocked
	if (life_interrupted) exitWith {_flagObject setVariable ["area_controlled",true,true];};
};


"progressBar" cutText ["","PLAIN"];
player playActionNow "stop";
if (!alive player || life_istazed || life_isknocked) exitWith {life_action_inUse = false;_flagObject setVariable ["area_controlled",true,true];};
if (player getVariable ["restrained",false]) exitWith {life_action_inUse = false;_flagObject setVariable ["area_controlled",true,true];};
if (life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_GNOTF_CaptureCancel","PLAIN"]; life_action_inUse = false;_flagObject setVariable ["area_controlled",true,true];};
life_action_inUse = false;

titleText["The Area Has Been Neutralised","PLAIN"];


_flagObject setVariable ["area_controlled",false,true];
_flagObject setVariable ["gang_name","",true];


if (life_HC_isActive) then {
		[_flagObject,_gangName] remoteExecCall ["HC_fnc_neutraliseArea",HC_Life];
} else {
		[_flagObject,_gangName] remoteExecCall ["TON_fnc_neutraliseArea",RSERV];
};

_hint = parseText format["
	<t align='center' color='#52bf90' shadow='2' size='1.75'>%1 Neutralised</t><br/><br/>
	<t align='center' color='#FFFFFF'>%3 %2</t><br/><br/>",
	_message,_gangName,_benefits];
	
_hint remoteExec ["hint",0];

_flagObject setFlagTexture "";

deleteMarker _markerName;

