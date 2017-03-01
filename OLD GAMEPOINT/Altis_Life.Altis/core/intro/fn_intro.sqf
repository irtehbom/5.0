private ["_camera", "_camDistance","_randCamX","_randCamY","_camTime"];

_camDistance = 150;
_randCamX = 75 - floor(random 150);
_randCamY = 75 - floor(random 150);
_BASEBUILDINGcamTime = 16;
_PAINTBALLcamTime = 14;
_AFFcamTime = 16;
_PRISONcamTime = 16;
_OILRIGcamTime = 10;
_PLAYERcamTime = 10;


plotPole = [_this, 0, [], []] call BIS_fnc_param;

getRandomPlot = plotPole call BIS_fnc_selectRandom;

getRandomPlot set [2,1];

[] spawn life_fnc_introText;

showCinemaBorder true;
camUseNVG false;

playMusic "introMusic";
145 fadeMusic 0; 

_cameraBASEBUILDING = "camera" camCreate [(getRandomPlot select 0)+_randCamX, (getRandomPlot select 1)+_randCamY,(getRandomPlot select 2)+_camDistance];

_cameraBASEBUILDING cameraEffect ["internal","back"];

_cameraBASEBUILDING camSetFOV 0.7;
_cameraBASEBUILDING camCommit 0;
waitUntil {camCommitted _cameraBASEBUILDING};

_cameraBASEBUILDING camSetTarget getRandomPlot;

_cameraBASEBUILDING camSetRelPos [0,0,2];
_cameraBASEBUILDING camCommit _BASEBUILDINGcamTime;

waitUntil {camCommitted _cameraBASEBUILDING};

_cameraBASEBUILDING cameraEffect ["terminate","back"];
camDestroy _cameraBASEBUILDING;


_cameraPAINTBALL = "camera" camCreate [16563.6,13497.4,5];

_cameraPAINTBALL cameraEffect ["internal","BACK TOP"];

_cameraPAINTBALL camSetFOV 0.7;
_cameraPAINTBALL camCommit 0;
waitUntil {camCommitted _cameraPAINTBALL};

_cameraPAINTBALL camSetTarget [16739.8,13634.6,0.00180054];

_cameraPAINTBALL camSetRelPos [0,0,50];
_cameraPAINTBALL camCommit _PAINTBALLcamTime;

waitUntil {camCommitted _cameraPAINTBALL};

_cameraPAINTBALL cameraEffect ["terminate","back"];
camDestroy _cameraPAINTBALL;


//AFF

_cameraAFF = "camera" camCreate [10617.9,10198.4,5];

_cameraAFF cameraEffect ["internal","back"];

_cameraAFF camSetFOV 0.7;
_cameraAFF camCommit 0;
waitUntil {camCommitted _cameraAFF};

_cameraAFF camSetTarget [10743.7,10430.5,5];

_cameraAFF camSetRelPos [0,0,50];
_cameraAFF camCommit _AFFcamTime;

waitUntil {camCommitted _cameraAFF};

_cameraAFF cameraEffect ["terminate","back"];
camDestroy _cameraAFF;


//PRISON

_cameraPRISON = "camera" camCreate [23094.7,17187.8,5];

_cameraPRISON cameraEffect ["internal","back"];

_cameraPRISON camSetFOV 0.7;
_cameraPRISON camCommit 0;
waitUntil {camCommitted _cameraPRISON};

_cameraPRISON camSetTarget [22919.8,17015.6,5];

_cameraPRISON camSetRelPos [0,0,80];
_cameraPRISON camCommit _PRISONcamTime;

waitUntil {camCommitted _cameraPRISON};

_cameraPRISON cameraEffect ["terminate","back"];
camDestroy _cameraPRISON;



//OILRIG

_cameraOILRIG = "camera" camCreate [24611.7,19084.3,5];

_cameraOILRIG cameraEffect ["internal","back"];

_cameraOILRIG camSetFOV 0.7;
_cameraOILRIG camCommit 0;
waitUntil {camCommitted _cameraOILRIG};

_cameraOILRIG camSetTarget [24522.5,19194.6,5];

_cameraOILRIG camSetRelPos [0,0,100];
_cameraOILRIG camCommit _PLAYERcamTime;

waitUntil {camCommitted _cameraOILRIG};

_cameraOILRIG cameraEffect ["terminate","back"];
camDestroy _cameraOILRIG;


//PLAYER

_cameraOILRIG = "camera" camCreate [(position player select 0)+_randCamX, (position player select 1)+_randCamY,(position player select 2)+_camDistance];

_cameraOILRIG cameraEffect ["internal","back"];

_cameraOILRIG camSetFOV 0.7;
_cameraOILRIG camCommit 0;
waitUntil {camCommitted _cameraOILRIG};

_cameraOILRIG camSetTarget vehicle player;

_cameraOILRIG camSetRelPos [0,0,2];
_cameraOILRIG camCommit _PLAYERcamTime;

waitUntil {camCommitted _cameraOILRIG};

_cameraOILRIG cameraEffect ["terminate","back"];
camDestroy _cameraOILRIG;
