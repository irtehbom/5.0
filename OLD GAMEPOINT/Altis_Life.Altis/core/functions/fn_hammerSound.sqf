private["_hammer"];
_hammer = (nearestObjects[getPosATL player,["Land_InfoStand_V1_F"],100]) select 0;
if(isNull _hammer) exitWith {};
_hammer say3D "courtHammer";