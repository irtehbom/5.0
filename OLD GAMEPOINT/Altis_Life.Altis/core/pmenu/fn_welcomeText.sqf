disableSerialization;
private [ "_colorHighlight", "_bullet", "_display", "_message", "_posText" ];
_colorHighlight = [ "GUI", "BCG_RGB" ] call BIS_fnc_displayColorGet;
_colorHighlight = _colorHighlight call life_fnc_colorRGBtoHTML;
_bullet = "<t size='0.5' color='" + _colorHighlight + "'><img image='A3\Ui_f\data\IGUI\RscIngameUI\RscHint\indent_square' /></t>";

//--- Controls
private "_display";
_display = findDisplay 19000;
_textMessage = _display displayCtrl 19001;

//--- Message
_message = "";
_message = _message + "<t align='center' size='8' shadow='0'><img image='textures\GPLogo.paa' /></t><br />";
_message = _message + format [ localize "STR_GP_WELCOME_PARA1", _colorHighlight, _bullet ];
_message = _message + "<br /><br />";

_message = _message + format [ localize "STR_GP_WELCOME_PARA2_TITLE", _colorHighlight, _bullet ];
_message = _message + "<br />";
_message = _message + format [ localize "STR_GP_WELCOME_PARA2", _colorHighlight, _bullet ];
_message = _message + "<br /><br />";

//_message = _message + "<t align='center' size='4' shadow='0'><img image='\a3\ui_f\data\gui\cfg\Debriefing\enddefault_ca.paa' /></t><br />";
//_message = _message + "<br />";

_message = _message + format [ localize "STR_GP_WELCOME_PARA3_TITLE", _colorHighlight, _bullet ];
_message = _message + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST1" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST2" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST3" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST4" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST5" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST6" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST7" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST8" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST9" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST10" + "<br />";
_message = _message + _bullet + " " + localize "STR_GP_WELCOME_PARA3_LIST11" + "<br />";
_message = _message + "<br />";
_message = _message + format [ localize "STR_GP_WELCOME_PARA3", _colorHighlight, _bullet ];
_message = _message + "<br /><br />";

_message = _message + format [ localize "STR_GP_WELCOME_PARA4_TITLE", _colorHighlight, _bullet ];
_message = _message + "<br />";
_message = _message + format [ localize "STR_GP_WELCOME_PARA4", _colorHighlight, _bullet ];
_message = _message + "<br /><br />";
_message = _message + _bullet + " " + format [ localize "STR_GP_WELCOME_PARA4_LIST1", _colorHighlight, _bullet ] + "<br />";
_message = _message + _bullet + " " + format [ localize "STR_GP_WELCOME_PARA4_LIST2", _colorHighlight, _bullet ] + "<br />";
_message = _message + "<br />";
_message = _message + format [ localize "STR_GP_WELCOME_FOOT", _colorHighlight, _bullet ];
_message = _message + "<br /><br />";

//--- Set the message
_textMessage ctrlSetStructuredText parseText _message;

//--- Resize structuredText 
_posText = ctrlPosition _textMessage;
_textMessage ctrlSetPosition [ _posText select 0, _posText select 1, _posText select 2, ctrlTextHeight _textMessage ];
_textMessage ctrlCommit 0;

