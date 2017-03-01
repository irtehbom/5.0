#include <macro.h>
/*
	File: fn_p_openMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Opens the players virtual inventory menu
*/
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "playerSettings";
disableSerialization;

switch(playerSide) do
{
	case west: 
	{
		ctrlShow[2011,false];
		ctrlShow[4012,false];
	};
	
		case civilian:
	{
	    ctrlShow[2012,false];
		ctrlShow[2405,false];
		ctrlShow[4012,false];
		ctrlShow[20003,false];
	};
	
	case east:
	{
	    ctrlShow[2011,false];
	    ctrlShow[2012,false];
		ctrlShow[20003,true];
	    if(!(playerSide == east)) then
		{
			ctrlShow[4012,false];
		};

	};
	
	case independent:
	{
		ctrlShow[20003, true];
	};
};

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};

[] call life_fnc_p_updateMenu;

if(__GETC__(life_adminlevel) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
};