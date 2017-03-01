private[];

life_action_inUse = true;

_rate = [_this, 0, 0.01, [0]] call BIS_fnc_param;
_actionText = [_this, 1, "", [""]] call BIS_fnc_param;
_animate = [_this, 2, true, [true]] call BIS_fnc_param;
_animation = [_this, 3, "ainvpknlmstpslaywnondnon_medic", [""]] call BIS_fnc_param;

_loop = scriptNull;

disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText format["%2 (1%1)...","%",_actionText];
_progress progressSetPosition 0.01;
_cP = 0.01;

if (_animate) then {
	_loop = [_animation] spawn {
		_anim = _this select 0;
		
		while {true} do {
			[[player, _anim],"life_fnc_animSync",true,false] spawn life_fnc_MP;
			player playMoveNow _anim;
			waitUntil { animationState player == _anim }; 
			waitUntil { animationState player != _anim }; 
		};
	};
};

while{true} do
{
	sleep 0.27;
	_cP = _cP + _rate;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_actionText];
	if(_cP >= 1) exitWith {};
	if(!alive player) exitWith {};
	if(player != vehicle player) exitWith {};
	if(life_interrupted) exitWith {};
};

if (_animate) then {
	terminate _loop;
};

life_action_inUse = false;
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false; true;};
false;