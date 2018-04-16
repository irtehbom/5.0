/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case east: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
	};
	case default {
		//Sitdown / standup script
		life_actions pushBack (player addAction["<t color='#0099FF'>Sit</t>",{[cursorObject,player] execVM "core\actions\fn_sitdown.sqf"},true,1,true,true,"""",'player distance cursorObject < 3 && {([str cursorObject,"bench"] call KRON_StrInStr || [str cursorObject,"chair"] call KRON_StrInStr)} ']);
	};
};

life_actions pushBack (player addAction["<t color = '#009900'>Put on Seatbelt</t>",life_fnc_seatbelt,"",6,false,false,"",' !life_seatbelt && vehicle player != player ']);
life_actions pushBack (player addAction["<t color = '#ff3300'>Remove Seatbelt</t>",life_fnc_seatbelt,"",6,false,false,"",' life_seatbelt && vehicle player != player ']);