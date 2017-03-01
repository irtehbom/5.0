/*
	File: fn_itemWeight.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Gets the items weight and returns it.
*/
private["_item"];
_item = [_this,0,"",[""]] call BIS_fnc_param;
if(_item == "") exitWith {};

switch (_item) do
{
	case "oilu": {6};
	case "oilp": {5};
	case "heroinu": {6};
	case "heroinp": {5};
	case "cannabis": {6};
	case "marijuana": {5};
	case "apple": {1};
	case "water": {1};
	case "rabbit": {1};
	case "salema": {2};
	case "ornate": {2};
	case "mackerel": {4};
	case "tuna": {6};
	case "mullet": {4};
	case "catshark": {6};
	case "turtle": {8};
	case "fishing": {2};
	case "turtlesoup": {2};
	case "donuts": {1};
	case "coffee": {1};
	case "fuelE": {2};
	case "fuelF": {5};
	case "gpzipties": {0};
	case "money": {0};
	case "pickaxe": {2};
	case "copperore": {6};
	case "ironore": {6};
	case "copper_r": {5};
	case "iron_r": {5};
	case "sand": {6};
	case "salt": {6};
	case "salt_r": {5};
	case "glass": {5};
	case "diamond": {6};
	case "diamondc": {5};
	case "cocaine": {6};
	case "cocainep": {5};
	case "spikeStrip": {15};
	case "rock": {6};
	case "cement": {5};
	case "goldbar": {12};
	case "treasure": {12};
	case "bonds": {24};
	case "blastingcharge": {15};
	case "c4": {15};
	case "boltcutter": {5};
	case "defusekit": {2};
	case "storagesmall": {5};
	case "storagebig": {10};
	case "crowbar": {2};
	case "tmeat": {1};
	case "uwsl": {5};
	case "usilver": {6};
	case "silver": {5};
	case "uclay": {6};
	case "clay": {5};
	case "ucobalt": {6};
	case "cobalt": {5};
	case "ulead": {6};
	case "lead": {5};
	case "utitanium": {6};
	case "titanium": {5};
	case "ufirearms": {6};
	case "firearms": {5};
	case "uopium": {6};
	case "opium": {5};
	case "sroll": {1};
		
	default {1};
};
