#define MAX_ALTITUDE_ROPES_AVAIL 70
#define MIN_ALTITUDE_ROPES_AVAIL 5
#define MAX_SPEED_ROPES_AVAIL 50

#define ROPE_LENGTH 75

#define STR_TOSS_ROPES "Toss ropes"
#define STR_FAST_ROPE "Fast-rope"
#define STR_CUT_ROPES "Cut ropes"

#define STR_JOIN_QUEUE_HINT "You're in the fast-rope queue."

GP_Fastrope_AccessLevel = 0;


GP_Fastrope_Helis = [

  ["Heli_Light_01_unarmed_base_F",[],[[1.1,0.5,-0.5],[-1.1,0.5,-0.5]]], //Hummingbird
  ["C_Heli_Light_01_civil_F",[],[[1.1,0.5,-0.5],[-1.1,0.5,-0.5]]], //Hummingbird civ
  ["O_Heli_Light_02_unarmed_F",[],[[1.1,0.5,-0.5],[-1.1,0.5,-0.5]]], //Hummingbird civ
  ["B_Heli_Light_01_armed_F",[],[[1.1,0.5,-0.5],[-1.1,0.5,-0.5]]], //Hummingbird civ    
  ["B_Heli_Transport_01_F",["door_L","door_R"],[[-1.01,2.5,0.25],[1.13,2.5,0.25]]], //Ghost Hawk
  ["Heli_Transport_03_base_F",["Door_rear_source"],[[-1.35,-4.6,-0.5],[1.24,-4.6,-0.5]]], //Huron  Side doors: "Door_L_source","Door_R_source"
  ["I_Heli_Transport_02_F",["CargoRamp_Open"],[[0,-5,0]]], //Mohawk
  ["Heli_light_03_base_F",[],[[0.95,3,-0.9],[-0.95,3,-0.9]]], //Hellcat
  ["Heli_Attack_02_base_F",["door_L","door_R"],[[1.3,1.3,-0.6],[-1.3,1.3,-0.6]]], //Kajman
  ["Heli_Light_02_base_F",[],[[1.35,1.35,0],[-1.45,1.35,0]]], //Orca
  ["O_Heli_Transport_04_covered_F",["Door_4_source","Door_5_source"],[[1.3,1.3,-0.1],[-1.5,1.3,-0.1]]], //Taru covered
  ["O_Heli_Transport_04_bench_F",["Door_4_source","Door_5_source"],[[1.3,0.15,-0.1],[-1.5,0.15,-0.1]]] //Taru bench underneath

    
];

GP_Fastrope_fnc_addActions = {
  player addAction["<t color='#ffff00'>"+STR_TOSS_ROPES+"</t>", GP_Fastrope_fnc_createRopes, [], -1, false, false, '','call GP_Fastrope_fnc_canCreate'];
  player addAction["<t color='#ff0000'>"+STR_CUT_ROPES+"</t>", GP_Fastrope_fnc_cutRopes, [], -1, false, false, '','call GP_Fastrope_fnc_canCut'];
  player addAction["<t color='#00ff00'>"+STR_FAST_ROPE+"</t>", GP_Fastrope_fnc_queueUp, [], 15, false, false, '','call GP_Fastrope_fnc_canFastrope'];
};

GP_Fastrope_fnc_AIs = {
  params [["_units",[],[[],grpNull]],"_heli"];

  if !(_units isEqualType []) then {
    _units = units _units;
  };
  
  _heli = objectParent (_units select 0);
  
  doStop (driver _heli);
  (driver _heli) setBehaviour "Careless";
  (driver _heli) setCombatMode "Blue";

  [_heli, _units] spawn {
    params ["_heli","_units","_ropes","_rope","_count","_sh",["_i",0]];
    _sh = _heli spawn GP_Fastrope_fnc_createRopes;
    waitUntil {scriptDone _sh};
    

    _ropes = _heli getVariable ["GP_Fastrope_Ropes",[]];
    _count = count _ropes;
  
    {
      if (!alive _x || isPlayer _x || objectParent _x != _heli) then {
        _units = _units - [_x];
      };
    } forEach _units;

    {
      if (_count > 0) then {
        if (_count == 2) then {
          _rope = _ropes select _i;
          if (_i == 0) then {  _i = 1 } else { _i = 0 };
        } else {
          _rope = _ropes select 0;
        };
        [_x,_rope] call GP_Fastrope_fnc_fastRope;
      };
    } forEach _units;
    
    waituntil {sleep 0.5; { (getPosATL _x select 2) < 1 } count _units == count _units };
    sleep 3;
    if ((count (_heli getVariable ["GP_Fastrope_Ropes",[]])) > 0) then {
      _heli call GP_Fastrope_fnc_cutRopes;
    };
    sleep 5;
    (driver _heli) doFollow (leader group (driver _heli));
    (driver _heli) setBehaviour "Aware";
    (driver _heli) setCombatMode "White";
  };
};

// Check if the player is allowed to drop the ropes
// Conditions: chopper speed low enough, no ropes attached yet, chopper altitude between given values, suitable access level
GP_Fastrope_fnc_canCreate = {
  private ["_heli","_alt","_altBool","_speedBool","_ropesBool","_role","_roleBool"];
  _heli = objectParent player;
  _roleBool = call GP_Fastrope_fnc_hasAccess;
  
  _alt = (getPosATL _heli select 2);
  _altBool = ((_alt < MAX_ALTITUDE_ROPES_AVAIL) && (_alt > MIN_ALTITUDE_ROPES_AVAIL));
  _speedBool = ((abs (speed _heli)) < MAX_SPEED_ROPES_AVAIL);
  _ropesBool = (count (_heli getVariable ["GP_Fastrope_Ropes",[]]) == 0);

  (_altBool && _speedBool && _ropesBool && _roleBool)
};

GP_Fastrope_fnc_canCut = {
  private ["_heli","_flag","_ropesBool","_roleBool"];
  _heli = objectParent player;
  _roleBool = call GP_Fastrope_fnc_hasAccess;
  _ropesBool = (count (_heli getVariable ["GP_Fastrope_Ropes",[]]) > 0);
  
  (_roleBool && _ropesBool)
};

GP_Fastrope_fnc_canFastrope = {
  private ["_heli","_alt","_flag"];
  _heli = objectParent player;
  _alt = getPosATL _heli select 2;
  _flag = (!(player in (_heli getVariable ["GP_Fastrope_Queue",[]])) && (count (_heli getVariable ["GP_Fastrope_Ropes",[]]) > 0) && (_alt < MAX_ALTITUDE_ROPES_AVAIL) && _heli getCargoIndex player > -1);
  _flag
};

GP_Fastrope_fnc_createRopes = {
  private ["_heli","_ropesPos","_ropesObj","_rope"];

  _heli = _this;
    
  if (_this isEqualType []) then {
    _heli = objectParent player;
  };

  _ropesPos = _heli getVariable ["GP_Fastrope_Ropes",[]];
  
  if (count _ropesPos > 0) exitWith {};
  
  {
      if (_heli isKindOf (_x select 0)) exitWith {
      {
        _heli animateDoor [_x,1];
      } forEach (_x select 1);
      
      _ropesPos = (_x select 2);
    };
  } forEach GP_Fastrope_Helis;

  _ropesObj = [];
  {
    _rope = ropeCreate [_heli, _x, ROPE_LENGTH];
    _ropesObj pushBack _rope;
  } forEach _ropesPos;
  
  _heli setVariable ["GP_Fastrope_Ropes", _ropesObj, true];
  _heli setVariable ["GP_Fastrope_Queue", [], true];
  
  _heli spawn {
    params ["_heli","_ropes"];
    waitUntil {_ropes = (_heli getVariable ["GP_Fastrope_Ropes",[]]); abs (speed _heli) > MAX_SPEED_ROPES_AVAIL || (count _ropes == 0)};
    
    // Ropes already removed by call from addAction
    if (count _ropes > 0) then {
      _heli call GP_Fastrope_fnc_cutRopes;
    };
  };
};

GP_Fastrope_fnc_cutRopes = {
  private ["_heli","_ropes"];

  _heli = _this;
    
  if (_this isEqualType []) then {
    _heli = objectParent player;
  };
  
  _ropes = _heli getVariable ["GP_Fastrope_Ropes",[]];
  {
    ropeCut [_x,0];
  } forEach _ropes;
  
  _heli setVariable ["GP_Fastrope_Ropes", [], true];
  _heli setVariable ["GP_Fastrope_Queue", [], true];
  
  // Close doors
  {
    if (_heli isKindOf (_x select 0)) exitWith {
      {
        _heli animateDoor [_x,0];
      } forEach (_x select 1);
    };
  } forEach GP_Fastrope_Helis;  
};

GP_Fastrope_fnc_fastRope = {
  params ["_unit","_rope"];
  
  [_unit,_rope] spawn { 
    params ["_unit","_rope","_ropePos","_endOfRope","_heli","_altPrev","_altCur"];
    _heli = objectParent _unit;
    
    waitUntil {isNull objectParent _unit};
    if (local _unit) then {
      _unit allowDamage false;
      unassignVehicle _unit;
      [_unit] allowGetIn false;
      _ropePos = (ropeEndPosition _rope) select 0;
      _unit setPosATL [(_ropePos select 0),(_ropePos select 1),(_ropePos select 2)-2];
      _unit switchMove "LadderRifleStatic";
      _endOfRope = ((ropeEndPosition _rope select 1) select 2);
      
      _altPrev = 0;
      while {_altCur = (getPosATL _unit select 2); alive _unit && (_altCur - _endOfRope) > 1} do {
        if (_altPrev isEqualTo _altCur) exitWith {}; 
        _unit setVelocity [0,0,-8];
        sleep 0.2;
        _altPrev = _altCur;
      };
      _unit setVelocity [0,0,0];
      _unit playMove "LadderRifleDownOff";
      _unit switchMove "";
      _unit allowDamage true;
    };
  };
  
  moveOut _unit;
  
  sleep 1.2 + (random 0.3); 
};

GP_Fastrope_fnc_hasAccess = {
  private ["_heli","_role","_roleBool"];
  _heli = objectParent player;
  _role = _heli getCargoIndex player;
  _roleBool = true;
  
  if (GP_Fastrope_AccessLevel == 1 && _role < 0) then { _roleBool = false }; // No pilots
  if (GP_Fastrope_AccessLevel == 2 && _role >= 0) then { _roleBool = false }; // No cargo
  
  _roleBool
};

GP_Fastrope_fnc_processQueue = {
  params ["_heli","_queue","_ropes","_count","_rope",["_i",0]];
  
  _heli = objectParent player;
  _queue = _heli getVariable ["GP_Fastrope_Queue",[]];
  _ropes = _heli getVariable ["GP_Fastrope_Ropes",[]];
  _count = count _ropes;

  waitUntil {_queue find player == 0};
  hintSilent "";
  
  doStop (driver _heli);
  (driver _heli) setBehaviour "Careless";
  (driver _heli) setCombatMode "Blue";

  {
    if (_x == player || (group _x == group player && !isPlayer _x)) then {
      _queue = _queue - [_x];
      if (_count > 0) then {
        if (_count == 2) then {
          _rope = _ropes select _i;
          if (_i == 0) then {  _i = 1 } else { _i = 0 };
        } else {
          _rope = _ropes select 0;
        };
        [_x,_rope] call GP_Fastrope_fnc_fastRope;
      };
    };
  } forEach _queue;
  
  _heli setVariable ["GP_Fastrope_Queue", _queue, true];
  
  sleep 5;
  (driver _heli) doFollow (leader group (driver _heli));
  (driver _heli) setBehaviour "Aware";
  (driver _heli) setCombatMode "White";
};

GP_Fastrope_fnc_queueUp = {
  params ["_heli","_queue","_veh"];
  
  _heli = objectParent player;
  _queue = _heli getVariable ["GP_Fastrope_Queue",[]];
  
  _queue pushBack player;
  hintSilent STR_JOIN_QUEUE_HINT;
  
  if (player == leader group player) then {
    {
      _veh = objectParent _x;
      if (!isPlayer _x && _veh == _heli && _heli getCargoIndex _x > -1) then {
        _queue pushBack _x;
      };
    } forEach (units group player);
  };
  
  _heli setVariable ["GP_Fastrope_Queue", _queue, true];
  
  _heli spawn GP_Fastrope_fnc_processQueue;
};

if (isClass(configFile >> "CfgPatches" >> "GP_main")) then {
  private ["_actMenu","_actCreate","_actCut","_actUse"];
  _actMenu = ["GP_Fastrope", "Fast-rope", "", {}, {true}] call GP_interact_menu_fnc_createAction;
  _actCreate = ["GP_Fastrope_createRopes",STR_TOSS_ROPES, "", GP_Fastrope_fnc_createRopes, {call GP_Fastrope_fnc_canCreate}] call GP_interact_menu_fnc_createAction;
  _actCut = ["GP_Fastrope_cutRope",STR_CUT_ROPES, "", GP_Fastrope_fnc_cutRopes, {call GP_Fastrope_fnc_canCut}] call GP_interact_menu_fnc_createAction;
  _actUse = ["GP_Fastrope_fastRope",STR_FAST_ROPE, "", {[] spawn GP_Fastrope_fnc_queueUp}, {call GP_Fastrope_fnc_canFastrope}] call GP_interact_menu_fnc_createAction;
  [player, 1, ["GP_SelfActions"], _actMenu] call GP_interact_menu_fnc_addActionToObject;
  [player, 1, ["GP_SelfActions","GP_Fastrope"], _actCreate] call GP_interact_menu_fnc_addActionToObject;
  [player, 1, ["GP_SelfActions","GP_Fastrope"], _actCut] call GP_interact_menu_fnc_addActionToObject;
  [player, 1, ["GP_SelfActions","GP_Fastrope"], _actUse] call GP_interact_menu_fnc_addActionToObject;
} else {
  call GP_Fastrope_fnc_addActions;
  player addEventHandler ["Respawn",{call GP_Fastrope_fnc_addActions;}];
};