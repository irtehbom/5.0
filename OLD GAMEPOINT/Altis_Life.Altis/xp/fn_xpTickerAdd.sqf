disableSerialization;

_message = [_this, 0, "", [""]] call BIS_fnc_param;

_display = uiNamespace getVariable ["XPTicker", displayNull];

if (isNull _display) then {
	cutRsc ["Transcend_XPTicker", "PLAIN"];
	
	waitUntil {
		_display = uiNamespace getVariable ["XPTicker", displayNull];
		
		!isNull(_display);
	};
};

_textMan = _display displayCtrl 1;
_textOne = _display displayCtrl 2;
_textTwo = _display displayCtrl 3;
_textThree = _display displayCtrl 4;

_textThree ctrlSetText (ctrlText _textTwo);
_textTwo ctrlSetText (ctrlText _textOne);
_textOne ctrlSetText (ctrlText _textMan);
_textMan ctrlSetText  _message;


uiNamespace setVariable["XP0", false];
uiNamespace setVariable["XP1", false];
uiNamespace setVariable["XP2", false];
uiNamespace setVariable["XP3", false];



[_textMan, "XP0"] spawn life_fnc_xpTickerFade;

if (ctrlText _textOne != "") then {
	_textOne ctrlSetFade 0;
	_textOne ctrlCommit 0;
	_textOne ctrlShow true;
	[_textOne, "XP1"] spawn life_fnc_xpTickerFade;
};
if (ctrlText _textTwo != "") then {
	_textTwo ctrlSetFade 0;
	_textTwo ctrlCommit 0;
	_textTwo ctrlShow true;
	[_textTwo, "XP2"] spawn life_fnc_xpTickerFade;
};

if (ctrlText _textThree != "") then {
	_textThree ctrlSetFade 0;
	_textThree ctrlCommit 0;
	_textThree ctrlShow true;
	[_textThree, "XP3"] spawn life_fnc_xpTickerFade;
};