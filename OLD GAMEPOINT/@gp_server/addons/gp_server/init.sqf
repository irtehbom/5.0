
#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)})
DB_Async_Active = false;
DB_Async_ExtraLock = false;
life_server_isReady = false;
ftp_hitman_list = [];
GP_HC = ObjNull;

life_ai_respawn_list = [];
life_ai_respawn_tick = 60;
life_ai_respawn_enabled = true;

publicVariable "life_server_isReady";
gp_court_list = [];
publicVariable "removeAfter";
removeAfter = [];
publicVariable "gp_court_list";
[] execVM "\gp_server\functions.sqf";
[] execVM "\gp_server\eventhandlers.sqf";
[] execVM "\gp_server\Functions\Schiffswrack\fn_generateschiffwrackAuto.sqf";

//I am aiming to confuse people including myself, ignore the ui checks it's because I test locally.

_extDB = false;

//Only need to setup extDB once.
if(isNil {uiNamespace getVariable "life_sql_id"}) then {
	life_sql_id = round(random(9999));
	__CONST__(life_sql_id,life_sql_id);
	uiNamespace setVariable ["life_sql_id",life_sql_id];

	//extDB Version
	_result = "extDB" callExtension "9:VERSION";
	diag_log format ["extDB: Version: %1", _result];
	if(_result == "") exitWith {};
	if ((parseNumber _result) < 14) exitWith {diag_log "Error: extDB version 14 or Higher Required";};

	//Initialize the database
	_result = "extDB" callExtension "9:DATABASE:Database2";
	if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
	_result = "extDB" callExtension format["9:ADD:DB_RAW_V2:%1",(call life_sql_id)];
	if(_result != "[1]") exitWith {diag_log "extDB: Error with Database Connection";};
	"extDB" callExtension "9:LOCK";
	_extDB = true;
	diag_log "extDB: Connected to Database";
} else {
	life_sql_id = uiNamespace getVariable "life_sql_id";
	__CONST__(life_sql_id,life_sql_id);
	_extDB = true;
	diag_log "extDB: Still Connected to Database";
};

//Broadbase PV to Clients, to warn about extDB Error.
//	exitWith to stop trying to run rest of Server Code
if (!_extDB) exitWith {
	life_server_extDB_notLoaded = true;
	publicVariable "life_server_extDB_notLoaded";
	diag_log "extDB: Error checked extDB/logs for more info";
};

//Run procedures for SQL cleanup on mission start.
["CALL resetLifeVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteDeadVehicles",1] spawn DB_fnc_asyncCall;
["CALL deleteOldHouses",1] spawn DB_fnc_asyncCall;
["CALL deleteOldGangs",1] spawn DB_fnc_asyncCall; //Maybe delete old gangs

life_adminlevel = 0;
life_medicLevel = 0;
life_coplevel = 0;

//Null out harmful things for the server.
__CONST__(JxMxE_PublishVehicle,"No");

//[] execVM "\gp_server\fn_initHC.sqf";

life_radio_west = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_civ = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];
life_radio_indep = radioChannelCreate [[0, 0.95, 1, 0.8], "Side Channel", "%UNIT_NAME", []];

serv_sv_use = [];

fed_bank setVariable["safe",(count playableUnits),true];

//General cleanup for clients disconnecting.
addMissionEventHandler ["HandleDisconnect",{_this call TON_fnc_clientDisconnect; false;}]; //Do not second guess this, this can be stacked this way.

[] spawn TON_fnc_cleanup;
life_gang_list = [];
publicVariable "life_gang_list";
life_wanted_list = [];
client_session_list = [];

[] execFSM "\gp_server\cleanup.fsm";

[] spawn
{
	private["_logic","_queue"];
	while {true} do
	{
		sleep (30 * 60);
		_logic = missionnamespace getvariable ["bis_functions_mainscope",objnull];
		_queue = _logic getvariable "BIS_fnc_MP_queue";
		_logic setVariable["BIS_fnc_MP_queue",[],TRUE];
	};
};

[] spawn TON_fnc_federalUpdate;

[] spawn
{
	while {true} do
	{
		sleep (30 * 60);
		{
			_x setVariable["sellers",[],true];
		} foreach [Dealer_1,Dealer_2];
	};
};

//Strip NPC's of weapons
{
	if(!isPlayer _x) then {
		_npc = _x;
		{
			if(_x != "") then {
				_npc removeWeapon _x;
			};
		} foreach [primaryWeapon _npc,secondaryWeapon _npc,handgunWeapon _npc];
	};
} foreach allUnits;

[] spawn TON_fnc_initHouses;
[] spawn TON_fnc_initRealEstate;
oil_rig setVariable["safe_bonds", 15 + round(random 30),true];

//Lockup the dome
private["_dome","_rsb","_oilrig"];
_oilrig = nearestObject [[24525.4,19186.7,16.5238],"Land_Research_HQ_F"];
_dome = nearestObject [[20915.5,19234.6,0.00143909],"Land_Dome_Big_F"];
_prison = nearestObject [[22919,17016.6,0.00143886],"Land_Dome_Big_F"];
_rsb = nearestObject [[20884.4,19244.1,0.59523],"Land_Research_house_V1_F"];

for "_i" from 1 to 3 do {
_dome setVariable[format["bis_disabled_Door_%1",_i],1,true];
 _dome animate [format["Door_%1_rot",_i],0];
 };
_rsb setVariable["bis_disabled_Door_1",1,true];
_rsb allowDamage false;
_dome allowDamage false;

for "_i" from 1 to 3 do {_oilrig setVariable[format["bis_disabled_Door_%1",_i],1,true]; _oilrig animate [format["Door_%1_rot",_i],0];};
_oilrig allowDamage false;

for "_i" from 1 to 3 do {_prison setVariable[format["bis_disabled_Door_%1",_i],1,true]; _prison animate [format["Door_%1_rot",_i],0];};
_prison allowDamage false;


diag_log ":: Initializing AI manager..";
[] spawn life_fnc_respawnManager;

diag_log ":: Initializing gang building zones..";
[] call life_fnc_buildInit;

[] call life_fnc_paintballInit;

diag_log ":: Initializing HATO..";
[] call life_fnc_eastInit;


[] call life_fnc_xpLevelConfig;

east setFriend[civilian, 0];
civilian setFriend[east, 0];


life_server_isReady = true;
publicVariable "life_server_isReady";

event_vehicles = false;
"event_vehicles" addPublicVariableEventHandler {event_vehicles; };



