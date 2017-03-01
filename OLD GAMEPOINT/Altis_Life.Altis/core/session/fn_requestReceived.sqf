#include <macro.h>
/*
	File: fn_requestReceived.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Called by the server saying that we have a response so let's 
	sort through the information, validate it and if all valid 
	set the client up.
*/
life_session_tries = life_session_tries + 1;
if(life_session_completed) exitWith {}; //Why did this get executed when the client already initialized? Fucking arma...
if(life_session_tries > 3) exitWith {cutText[localize "STR_Session_Error","BLACK FADED"]; 0 cutFadeOut 999999999;};

0 cutText [localize "STR_Session_Received","BLACK FADED"];
0 cutFadeOut 9999999;

//Error handling and  junk..
if(isNil "_this") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(typeName _this == "STRING") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if(count _this == 0) exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((_this select 0) == "Error") exitWith {[] call SOCK_fnc_insertPlayerInfo;};
if((getPlayerUID player) != _this select 0) exitWith {[] call SOCK_fnc_dataQuery;};

//Lets make sure some vars are not set before hand.. If they are get rid of them, hopefully the engine purges past variables but meh who cares.
if(!isServer && (!isNil "life_adminlevel" OR !isNil "life_coplevel" OR !isNil "life_donator")) exitWith {
	[[profileName,getPlayerUID player,"VariablesAlreadySet"],"SPY_fnc_cookieJar",false,false] spawn life_fnc_MP;
	[[profileName,format["Variables set before client initialization...\nlife_adminlevel: %1\nlife_coplevel: %2\nlife_donator: %3",life_adminlevel,life_coplevel,life_donator]],"SPY_fnc_notifyAdmins",true,false] spawn life_fnc_MP;
	sleep 0.9;
	["SpyGlass",false,false] execVM "\a3\functions_f\Misc\fn_endMission.sqf";
};

//Parse basic player information.
ftp_cash = parseNumber (_this select 2);
ftp_atmcash = parseNumber (_this select 3);
__CONST__(life_adminlevel,parseNumber(_this select 4));
__CONST__(life_donator,parseNumber(_this select 5));

//Loop through licenses
if(count (_this select 6) > 0) then {
	{missionNamespace setVariable [(_x select 0),(_x select 1)];} foreach (_this select 6);
};

life_gear = _this select 8;
/*
diag_log format["Shit: %1", _this];
diag_log format["0: %1", _this select 0];
diag_log format["1: %1", _this select 1];
diag_log format["2: %1", _this select 2];
diag_log format["3: %1", _this select 3];
diag_log format["4: %1", _this select 4];
diag_log format["5: %1", _this select 5];
diag_log format["6: %1", _this select 6];
diag_log format["7: %1", _this select 7];
diag_log format["8: %1", _this select 8];
diag_log format["9: %1", _this select 9];
diag_log format["10: %1", _this select 10];
diag_log format["11: %1", _this select 11];
diag_log format["12: %1", _this select 12];
diag_log format["13: %1", _this select 13];
diag_log format["14: %1", _this select 14];
diag_log format["15: %1", _this select 15];
diag_log format["16: %1", _this select 16];
diag_log format["17: %1", _this select 17];
diag_log format["18: %1", _this select 18];
*/

//Parse side specific information.
switch(playerSide) do {
	case west: {
		__CONST__(life_coplevel, parseNumber(_this select 7));
		__CONST__(life_medicLevel,0);
		life_blacklisted = _this select 9;
		
		
		player setVariable["Level", _this select 10, true];
		player setVariable["Experience", _this select 11, true];
		player setVariable["SkillPoints", _this select 12, true];
		player setVariable["Skills", call compile (_this select 13), true];
		real_estate_houses_recieve = _this select 14;
		{
			_realEstateGetObject = nearestObject [(call compile format["%1", _x select 0]), "Land_i_House_Big_01_V1_F"];
			real_estate pushBack _realEstateGetObject;
		} foreach real_estate_houses_recieve;
		[] spawn life_fnc_realEstateMarkers;
	};
	
	case civilian: {
		life_is_arrested = _this select 7;
		__CONST__(life_coplevel, 0);
		__CONST__(life_medicLevel, 0);
		life_aff_whitelist = _this select 9;
		life_court_whitelist = _this select 10;
		life_introran = _this select 15;
		life_houses = _this select 16;
		{
			_house = nearestBuilding (call compile format["%1", _x select 0]);
			life_vehicles pushBack _house;
			
		} foreach life_houses;
		
		real_estate_houses_recieve = _this select 17;
		{
			_realEstateGetObject = nearestObject [(call compile format["%1", _x select 0]), "Land_i_House_Big_01_V1_F"];
			real_estate pushBack _realEstateGetObject;
		} foreach real_estate_houses_recieve;
		
		player setVariable["Level", _this select 11, true];
		player setVariable["Experience", _this select 12, true];
		player setVariable["SkillPoints", _this select 13, true];
		player setVariable["Skills", call compile (_this select 14), true];
		
		[] spawn life_fnc_initHouses;
		//Real Estate Markers
		[] spawn life_fnc_realEstateMarkers;
	};
	
	case independent: {
		__CONST__(life_medicLevel, parseNumber(_this select 7));
		__CONST__(life_coplevel,0);
		
		
		player setVariable["Level", _this select 9, true];
		player setVariable["Experience", _this select 10, true];
		player setVariable["SkillPoints", _this select 11, true];
		player setVariable["Skills", call compile (_this select 12), true];
	};
	
	case east: { 
		life_is_arrested = _this select 7;
		life_pmc_whitelist = parseNumber(_this select 9);
		
		
		player setVariable["Level", _this select 10, true];
		player setVariable["Experience", _this select 11, true];
		player setVariable["SkillPoints", _this select 12, true];
		player setVariable["Skills", call compile (_this select 13), true];
	};
};
if(count (_this select 18) > 0) then {
	{life_vehicles pushBack _x;} foreach (_this select 18);
};

switch(__GETC__(life_donator)) do
{
	case 1: {life_paycheck = life_paycheck + 1500;};
	case 2: {life_paycheck = life_paycheck + 3000;};
	case 3: {life_paycheck = life_paycheck + 4500;};
	case 4: {life_paycheck = life_paycheck + 6000;};
};
[] call life_fnc_loadGear;
life_session_completed = true;