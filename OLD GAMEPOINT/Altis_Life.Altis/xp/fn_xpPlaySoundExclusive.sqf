private[];

_sound = [_this, 0, "", [""]] call BIS_fnc_param;

_config = [_sound] call life_fnc_xpSoundConfig;


0.5 fadeSound 0.1;
playSound [_sound, true];
sleep (_config select 0);
1 fadeSound 1;