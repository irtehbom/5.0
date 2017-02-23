/*
    File: fn_welcomeNotification.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Called upon first spawn selection and welcomes our player.
*/
disableSerialization;
[
        "",
        0,
        0.2,
        10,
        0,
        0,
        8
] spawn BIS_fnc_dynamicText;

createDialog "RscDisplayWelcome";

_display = findDisplay 999999;
_text1 = _display displayCtrl 1100;
_buttonSpoiler = _display displayCtrl 2400;
_textSpoiler = _display displayCtrl 1101;
_text2 = _display displayCtrl 1102;

_message = "";

_message = "<br /><br />";
_message = _message + "Welcome to A3Gaming Altis Life UK!<br /><br />";
_message = _message + "We look forward to you playing here. Before you get started, please take a few minutes to read our rules found on our website so you won't run into any trouble. <br /><br />";
_message = _message + "This server is run on Altis Life v5.0 and has many custom features. If you are a new player to our server or have been with us for some time, if you need any help at anytime please contact a member of staff.<br /><br />";
_message = _message + "We invite you to join our forums where you can stay up to date with the latest news and events, tell us what's on your mind or simply just say hello!<br /><br />";
_message = _message + "We also welcome you to join our Teamspeak where you can setup your own channels and talk to your friends. Thankyou for joining the A3Gaming community.<br /><br /><br />";
_message = _message + "Information<br /><br />";
_message = _message + "Forums - a3gaming.co.uk";
_message = _message + "Teamspeak - 85.236.101.154:10897";

//Fill only the first text
_text1 ctrlSetStructuredText (parseText _message);

//Resize StructuredText component to display the scrollbar if needed
_positionText1 = ctrlPosition _text1;
_yText1 = _positionText1 select 1;
_hText1 = ctrlTextHeight _text1;
_text1 ctrlSetPosition [_positionText1 select 0, _yText1, _positionText1 select 2, _hText1];
_text1 ctrlCommit 0;
//Hide second text, spoiler text and button
_buttonSpoiler ctrlSetFade 1;
_buttonSpoiler ctrlCommit 0;
_buttonSpoiler ctrlEnable false;
_textSpoiler ctrlSetFade 1;
_textSpoiler ctrlCommit 0;
_text2 ctrlSetFade 1;
_text2 ctrlCommit 0;
