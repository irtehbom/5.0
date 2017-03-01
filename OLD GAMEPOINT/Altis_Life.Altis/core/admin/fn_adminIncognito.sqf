private[];


if (isNil "life_admin_controlling") then {

	life_admin_controlling = (createGroup civilian) createUnit["Rabbit_F", position player, [], 5, "NONE"];
	life_admin_controlling allowDamage false;
	player remoteControl life_admin_controlling;
	life_admin_controlling switchCamera "EXTERNAL";
} else {
	objNull remoteControl life_admin_controlling;
	player switchCamera "INTERNAL";
	
	deleteVehicle life_admin_controlling;
	life_admin_controlling = nil;
};