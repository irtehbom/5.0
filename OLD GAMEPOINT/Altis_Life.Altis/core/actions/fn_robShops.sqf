private["_robber","_kassa","_ui","_progress","_pgText","_cP","_pos"];
shopKeeper = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param; //The object that has the action attached to it is _this. ,0, is the index of object, ObjNull is the default should there be nothing in the parameter or it's broken
_robber = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param; //Can you guess? Alright, it's the player, or the "caller". The object is 0, the person activating the object is 1
//_kassa = 1000; //The amount the shop has to rob, you could make this a parameter of the call (https://community.bistudio.com/wiki/addAction). Give it a try and post below ;)
_action = [_this,2] call BIS_fnc_param;//Action name
_kassa = 20000 + round(random 20000);
beingRobbed = shopKeeper getVariable["roberry_in_progress",false];


if !(alive _robber) exitWith {};
if (currentWeapon _robber == "") exitWith { hint "Haha, come back with a real gun!" };
if (_kassa == 0) exitWith { hint "There is no cash in the register!" };
if(side _robber != civilian) exitWith { hint "You can not rob this station!" };
if(_robber distance shopKeeper > 5) exitWith { hint "You need to be within 5m of the cashier to rob him!" };
if (vehicle player != _robber) exitWith { hint "Get out of your vehicle!" };
if (beingRobbed) exitWith { hint "Robbery already in progress!" };


shopKeeper setVariable["roberry_in_progress",true,true];
shopKeeper removeAction _action;
shopKeeper switchMove "AmovPercMstpSsurWnonDnon";

hint "The cashier hit the silent alarm, police has been alerted!"; [[1,format["ALARM! - Gas Station: %1 is being robbed!", shopKeeper]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (1%1)...","%"];
_progress progressSetPosition 0.01;
_cP = 0.001;
 

while{true} do
{
	sleep 6.0;
	_cP = _cP + 0.01;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["Robbery in Progress, stay close (10m) (%1%2)...",round(_cP * 100),"%"];
	_Pos = position player;
	_marker = createMarker ["Marker200", _Pos]; //by ehno: Place a Maker on the map
	"Marker200" setMarkerColor "ColorRed";
	"Marker200" setMarkerText "!ATTENTION! robbery !ATTENTION!";
	"Marker200" setMarkerType "mil_warning";			
	
	if(_cP >= 1) exitWith {};
	if(_robber distance shopKeeper > 10.5) exitWith { };
	if!(alive _robber) exitWith {};
};

if!(alive _robber) exitWith {shopKeeper setVariable["roberry_in_progress",false,true];  deleteMarker "Marker200"; [[1,format["ALARM! - Gas station: %1 robbery has failed", shopKeeper]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;  };
if(_robber distance shopKeeper > 10.5) exitWith { deleteMarker "Marker200"; shopKeeper switchMove ""; hint "You need to stay within 10m to Rob registry! - Now the registry is locked for 30 minutes"; 5 cutText ["","PLAIN"]; rip = false; [[1,format["ALARM! - Gas station: %1 robbery has failed", shopKeeper]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; };
5 cutText ["","PLAIN"];

titleText[format["You have stolen $%1, now get away before the cops arrive!",[_kassa] call life_fnc_numberText],"PLAIN"];
deleteMarker "Marker200"; 
ftp_cash = ftp_cash + _kassa;
[[14, player, (call life_donator)], "life_fnc_xpGenericXPGain", false, false] spawn life_fnc_MP;
[[1,format["ALARM! - Gas station: %1 was successful, better luck next time!", shopKeeper]],"life_fnc_broadcast",west,false] spawn life_fnc_MP; 

shopKeeper setVariable["roberry_in_progress",false,true];
life_use_atm = false;
sleep (30 + random(180));
life_use_atm = true;
if!(alive _robber) exitWith {};
[[getPlayerUID _robber,name _robber,"211"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;

sleep 1800;
_action = shopKeeper addAction["Rob the Gas Station",life_fnc_robShops];	
shopKeeper switchMove "";