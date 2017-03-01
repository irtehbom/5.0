enableSaving [false, false];

X_Server = false;
X_Client = false;
X_JIP = false;
StartProgress = false;

if(!isDedicated) then { X_Client = true;};
enableSaving[false,false];

life_versionInfo = "Altis Life RPG v3.1.4.8";
[] execVM "briefing.sqf"; //Load Briefing
[] execVM "KRON_Strings.sqf";

//Weather
14400 setFog 0;
14400 setOvercast 0;

StartProgress = true;