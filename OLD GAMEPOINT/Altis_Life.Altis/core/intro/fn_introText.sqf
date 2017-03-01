// Text for the intro

diag_log "--------------------------------- INTRO TEXT ----------------------------------";

_messages = [
   ["Welcome to GamePoint", 'The Home of Altis Life'],
   ["Unique Features", "Realtime Persistant Base Building"],
   ["Fun Server Minigames", "Paintball and other events!"],
   ["Dynamic Market System", "When supply is high, demand is low! Check the market through the player menu"],
   ["Paramilitary Faction", "Join the AFF today!"],
   ["XP and Perk System", "What path will you take?"],
   ["Fully-functioning Prison", "If you are unlucky enough to be sentenced to jail, your friends can break you out!"],
   ["Player Housing", "Buy a house to store all your gear and items!"],
   ["Robbable oil rig!", "Will your gang get away with the heist?"],
   ["Hitman System", "Take a hit, assasinate the target, recieve money"],
   ["Enjoy your journey on our server!", "We hope you have fun!"],
   ["Visit our website", "www.gamepointeu.co.uk"],
   ["Join us on Teamspeak", "gamepointeu.enjinvoice.com"]
];



_timeout = 5;
{
   private ["_title", "_content", "_titleText"];
   uiSleep 2;
   _title = _x select 0;
   _content = _x select 1;
   _titleText = format[("<t font='TahomaB' size='0.8' color='#199630' align='center' shadow='1' shadowColor='#000000'>%1</t><br /><t shadow='1'shadowColor='#000000' font='TahomaB' size='0.60' color='#FFFFFF' align='center'>%2</t>"), _title, _content];
   [_titleText,[safezoneX + safezoneW - 1.7,1],[safezoneY + safezoneH - 1,1],_timeout,0.5] spawn BIS_fnc_dynamicText;
   uiSleep (_timeout * 1.1);
} forEach _messages;