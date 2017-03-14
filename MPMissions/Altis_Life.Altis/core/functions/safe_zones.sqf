#define POLICE_ZONES [["pz_xx", 50]]

#define EAST_ZONES [["EAST_xx", 50]]

#define KOS_ZONES [["kos_xx", 50]]



#define PZ_MSG "You are entering the Police Base. Do not Kill or Rob here!"

#define EAST_MSG "You are entering a Rebel SafeZone. Do not commit crimes, rob people, or kill!"

#define KOS_MSG "You are entering a KOS (Kill on sight) area. You may commit crimes, rob, and kill people without initation."



if (isDedicated) exitWith {};

waitUntil {!isNull player};



switch (playerSide) do

{ 

case east:

{

player addEventHandler ["Fired", {

if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count POLICE_ZONES > 0) then

{

deleteVehicle (_this select 6);

titleText [PZ_MSG, "PLAIN", 3];

};

}]; 

};

};



switch (playerSide) do

{ 

case civilian:

{

player addEventHandler ["Fired", {

if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count East_ZONES > 0) then

{

deleteVehicle (_this select 6);

titleText [CIV_MSG, "PLAIN", 3];

};

}]; 

};

};



switch (playerSide) do

{

case east:

{

player addEventHandler ["Fired", {

if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count KOS_ZONES > 0) then

{

deleteVehicle (_this select 6);

titleText [KOS_MSG, "PLAIN", 3];

};

}]; 

};

};
