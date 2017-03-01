/*
	File: fn_copLights.sqf
	Author: mindstorm, modified by Adanteh
	Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
	
	Description:
	Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;
	
if(isNil "_vehicle" OR isNull _vehicle OR !(_vehicle getVariable "lights")) exitWith {};

_lightColors = [ [ 1, 0.3, 0 ], [ 1, 0.4, 0 ], 20 ];
//--- Create lights
_lightLeft = "#lightpoint" createVehicle getpos _vehicle;   
_lightRight = "#lightpoint" createVehicle getpos _vehicle;  

//--- Setup lights 
_lightLeft setLightBrightness 0;
_lightLeft setLightColor ( _lightColors select 0 ); 
_lightLeft setLightAmbient ( _lightColors select 0 );
_lightLeft setLightAttenuation [ 0.181, 0, 1000, 130 ]; 
_lightLeft setLightIntensity 10;
_lightLeft setLightFlareSize 0.38;
_lightLeft setLightFlareMaxDistance 150;
_lightLeft setLightUseFlare true;
_lightLeft setLightDayLight true;

_lightRight setLightBrightness 0;
_lightRight setLightColor ( _lightColors select 1 ); 
_lightRight setLightAmbient ( _lightColors select 1 );
_lightRight setLightAttenuation [ 0.181, 0, 1000, 130 ]; 
_lightRight setLightIntensity 10;
_lightRight setLightFlareSize 0.38;
_lightRight setLightFlareMaxDistance 150;
_lightRight setLightUseFlare true;
_lightRight setLightDayLight true;


switch (typeOf _vehicle) do
{
	case "C_Offroad_01_repair_F":
	{
		_lightLeft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
		_lightRight lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
	};
};
_leftRed = true;  
while{ (alive _vehicle)} do  
{  
	if(!(_vehicle getVariable "lights")) exitWith {};
	if(_leftRed) then  
	{  
		_leftRed = false;  
		_lightRight setLightBrightness 0.0;  
		sleep 0.05;
		_lightLeft setLightBrightness 6;  
	}  
		else  
	{  
		_leftRed = true;  
		_lightLeft setLightBrightness 0.0;  
		sleep 0.05;
		_lightRight setLightBrightness 6;  
	};  
	sleep (_this select 1);  
};  
deleteVehicle _lightLeft;
deleteVehicle _lightRight;