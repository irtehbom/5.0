// Updates the building hud when settings have changed.
disableSerialization;
if (!life_build_active) exitWith {};

_ui = uiNameSpace getVariable ["buildingHUD", displayNull];

_buildOnGround = _ui displayCtrl 80000;

_buildOnGroundSetting = life_build_active_object getVariable["snapToGround", false];
if (_buildOnGroundSetting) then {
	_buildOnGround ctrlSetStructuredText parseText "<t color='#ffffff' align='left'>[G] Build on ground level</t><t align='right' color='#00ff00'>Yes</t>";
} else {
	_buildOnGround ctrlSetStructuredText parseText "<t color='#ffffff' align='left'>[G] Build on ground level</t><t align='right' color='#ff0000'>No</t>";
};