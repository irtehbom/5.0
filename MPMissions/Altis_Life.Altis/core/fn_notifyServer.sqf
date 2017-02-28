#include "..\script_macros.hpp"
/*
Notify Server

Author Rob
*/


if (life_altf4 == 0) then {

life_altf4 = life_altf4 + 1;

if (isServer && !hasInterface) exitWith {};
hint parseText format ["<t align='center'><t color='#FF0000'><t size='3'>Notification</t></t><br/>%1</t><br/><br/>Name: %2<br/><br/>Detection: %3",(_this select 0),(_this select 1),(_this select 2)];
[8] call SOCK_fnc_updatePartial;
playSound "flashbang";
player setDamage 0.9;

};