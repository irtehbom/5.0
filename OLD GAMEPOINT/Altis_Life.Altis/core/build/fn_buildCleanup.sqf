// Script for cleaning up all actions and hud after either being cancelled or completed.


_camera = life_build_active_object getVariable["camera", ObjNull];
if (!isNull _camera) then {
	_camera cameraEffect ["terminate","back"];
	camDestroy _camera;
};

// Reset objects
life_build_active = false;
life_build_active_object = ObjNull;

// Reset default hud
[] call life_fnc_hudUpdate;


