private[];


GP_Skills = [
	// Generic skills
	[
		sideUnknown, // Side restriction. sideUnknown = all
		100, // Skill number ID, matches to dialog icon control
		"Healthy Living", // Skill name - Done
		"Living healthy has allowed you to require <t color='#ff0000'>10% less food and water per rank</t>.", // Skill description
		5, // Max ranks (1 skill = 1 rank),
		5, // Level requirement
		0 // Prerequisite
	],
	[
		sideUnknown,
		102,
		"Experienced", // Done
		"You pick up new things quickly. As such, XP gain is increased by <t color='#ff0000'>10% per rank</t>.",
		5,
		0,
		0
	],
	[
		sideUnknown,
		103,
		"Lucky Man", // Done
		"They call you the Lucky Man. You have a small chance (<t color='#ff0000'>5%</t>) of gaining double XP from any action.",
		1,
		5,
		102
	],
	[
		sideUnknown,
		104,
		"Tough Cookie", // Done
		"You take no shits and take less damage (<t color='#ff0000'>10% per rank</t>) from all sources.",
		5,
		10,
		100
	],
	[
		sideUnknown,
		105,
		"Moneybags Murphy", // Done
		"They call you Moneybags Murphy. Every money transaction you receive, for example by selling things, nets you <t color='#ff0000'>1% per rank</t> more cash.",
		10,
		15,
		0
	],
	[
		sideUnknown,
		106,
		"Skillful", // Done
		"Countless of hours of Twitch streaming has shown the world your amazing skills. You gain more <t color='#ff0000'>1 more skill point</t> for each level you attain.",
		1,
		0,
		0
	],
	
	// Utility skills
	[
		sideUnknown,
		501,
		"Greasemonkey", // Done
		"Back in 'Nam you fixed a few vehicles in your time, allowing you to repair vehicles <t color='#ff0000'>10% per rank</t> quicker.",
		5,
		0,
		0
	],
	[
		sideUnknown,
		107,
		"Beefcake", // Done
		"You can carry <t color='#ff0000'>10kg</t> more per rank.",
		3,
		5,
		501
	],
	[
		sideUnknown,
		108,
		"Jumping Jack", // Done
		"You did not skip leg day. You jump about <t color='#ff0000'>25%</t> higher than you normally would.",
		1,
		10,
		107
	],
	[
		sideUnknown,
		109,
		"Overseer", // Done
		"You worked as an overseer for a building site before. All build actions are <t color='#ff0000'>10% per rank</t> quicker.",
		5,
		5,
		0
	],
	[
		sideUnknown,
		110,
		"Planning Permission", // Done
		"The almighty Levia has given you planning permission. You can now place <t color='#ff0000'>2 per rank</t> more objects in your gang base.",
		5,
		10,
		109
	],
	[
		sideUnknown,
		111,
		"Scavenger", // Done
		"If you're the first to open a mission crate, you have a <t color='#ff0000'>5% per rank</t> chance to obtain something very valuable.",
		10,
		15,
		0
	]
	
];

xp_findSkillByID = {
	private["_name"];
	_name = [_this, 0, 0, [0]] call BIS_fnc_param;
	
	_return = [];
	{
		if (_name == _x select 1) exitWith {
			_return = _x;
		};
	} forEach (GP_Skills);
	
	_return;
};

xp_findChosenSkillByID = {
	private["_id"]; // omg this almost wrecked me
	_id = [_this, 0, 0, [0]] call BIS_fnc_param;
	
	_return = [];
	{
		if (_id == _x select 0) exitWith { _return = _x; };
	} forEach (player getVariable["Skills", []]);
	
	_return;
};