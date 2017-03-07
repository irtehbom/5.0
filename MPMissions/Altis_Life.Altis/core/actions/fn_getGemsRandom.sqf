#include "..\..\script_macros.hpp"
/*
 Author: Rob
*/

private["_gems","_weights","_result"];

_gems = [
	"amethyst",
	"ametrine",
	"aquamarine",
	"bloodstone",
	"blue_saphire",
	"citrine",
	"emerald",
	"opal",
	"quartz",
	"ruby",
	"emerald"
];

_weights = [
	0.9,
	0.9,
	0.8,
	0.8,
	0.7,
	0.7,
	0.6,
	0.6,
	0.5,
	0.2,
	0.1
];

_result = [_gems, _weights] call BIS_fnc_selectRandomWeighted;
_result;