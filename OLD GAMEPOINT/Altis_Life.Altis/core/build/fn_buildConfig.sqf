#define __CONST__(var1,var2) var1 = compileFinal (if(typeName var2 == "STRING") then {var2} else {str(var2)}) //Quick macro for creating a constant variable
disableSerialization;

life_build_objects =
[
	[
		"Plot pole", // Display name
		"Pole_F", // Object class name
		0, // Buy price, 0 for not buyable
		0, // Sell price, 0 for not sellable
		1, // Weight in virtual inv
		0, // Gang rank required to buy, optional. Default 0.
		0, // Default object direction, optional
		[0, 3, 0], // Default object offset, optional
		false, // Large object, different camera view and other settings, optional
		0 // Added height for special view, optional
	],
	
	
	//Stone
	[
		"Stone wall 4m",
		"Land_Stone_4m_F",
		5000,
		1000,
		8
	],
	[
		"Stone wall 8m",
		"Land_Stone_8m_F",
		8000,
		3000,
		10
	],
	
	[
		"Stone Gate",
		"Land_Stone_Gate_F",
		10000,
		5000,
		10,
		2
	],
	
	//Wood
	
	[
		"Tall wood wall",
		"Land_Shoot_House_Wall_F",
		3000,
		1000,
		5,
		0
	],
	
	[
		"Wood wall",
		"Land_Shoot_House_Wall_Stand_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood corner",
		"Land_Shoot_House_Corner_Stand_F",
		3000,
		1000,
		5,
		0
	],
	
	[
		"Wood wall low",
		"Land_Shoot_House_Wall_Crouch_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall corner low",
		"Land_Shoot_House_Corner_Crouch_F",
		3000,
		1000,
		5,
		0
	],	
	[
		"Wood wall prone corner",
		"Land_Shoot_House_Corner_Prone_F",
		3000,
		1000,
		5,
		0
	],	
	[
		"Wood wall long",
		"Land_Shoot_House_Wall_Long_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall long stand",
		"Land_Shoot_House_Wall_Long_Stand_F",
		3000,
		1000,
		5,
		0
	],	
	[
		"Wood wall long crouch",
		"Land_Shoot_House_Wall_Long_Crouch_F",
		3000,
		1000,
		5,
		0
	],		
	[
		"Wood wall long prone",
		"Land_Shoot_House_Wall_Long_Prone_F",
		3000,
		1000,
		5,
		0
	],	
	[
		"Wood wall house corner",
		"Land_Shoot_House_Corner_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house panel",
		"Land_Shoot_House_Panels_F",
		3000,
		1000,
		5,
		0
	],	
	[
		"Wood wall house panel crouch",
		"Land_Shoot_House_Panels_Crouch_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house panel prone",
		"Land_Shoot_House_Panels_Prone_F",
		3000,
		1000,
		5,
		0
	],		
	[
		"Wood wall house panel open",
		"Land_Shoot_House_Panels_Vault_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house panel window",
		"Land_Shoot_House_Panels_Window_F",
		3000,
		1000,
		5,
		0
	],		
	[
		"Wood wall house panel 2 windows",
		"Land_Shoot_House_Panels_Windows_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house tunnel",
		"Land_Shoot_House_Tunnel_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house tunnel stand",
		"Land_Shoot_House_Tunnel_Stand_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house tunnel stand",
		"Land_Shoot_House_Tunnel_Stand_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house tunnel crouch",
		"Land_Shoot_House_Tunnel_Crouch_F",
		3000,
		1000,
		5,
		0
	],
	[
		"Wood wall house tunnel prone",
		"Land_Shoot_House_Tunnel_Prone_F",
		3000,
		1000,
		5,
		0
	],

	[
		"Gang garage",
		"Land_i_Garage_V1_F",
		300000,
		75000,
		50,
		5,
		0,
		[0, 8, 0],
		true
	],
	[
		"Garage spawn",
		"Sign_Arrow_Direction_Green_F",
		1,
		1,
		1,
		5,
		0,
		[0, 3, 0.5]
	],
	[
		"Helicopter spawn",
		"Sign_Arrow_Direction_Blue_F",
		1000000,
		500000,
		1,
		16
	],
	[
		"Storage crate",
		"O_supplyCrate_F",
		400000,
		50000,
		20,
		6
	],
	[
		"Player spawn",
		"Sign_Arrow_F",
		3000000,
		2000000,
		1,
		15
	],
	
	//Rank 5
	//Sandbags/bunkers
	
		
	[
		"H Barrier corridor",
		"Land_HBarrierWall_corridor_F",
		20000,
		7500,
		20,
		6
	],
	[
		"HBarrier big 4",
		"Land_HBarrierBig_F",
		20000,
		6000,
		25,
		5
	],
	[
		"H Barrier",
		"Land_HBarrier_1_F",
		5000,
		2500,
		10,
		5
	],
	[
		"3 Bag H Barrier",
		"Land_HBarrier_3_F",
		10000,
		5000,
		15,
		5
	],
	[
		"5 Bag H Barrier",
		"Land_HBarrier_5_F",
		15000,
		7500,
		20,
		5
	],
	
	[
		"H Barrier corner/ramp",
		"Land_HBarrierWall_corner_F",
		25000,
		12500,
		30,
		5
	],
	
	
	[
		"H Barrier wall/ramp",
		"Land_HBarrierWall4_F",
		25000,
		12500,
		30,
		5
	],
	
	[
	    "Large H Barrier wall/ramp",
		"Land_HBarrierWall6_F",
		35000,
		17500,
		40,
		5
	],
	
	//Concrete 
	[
		"Concrete ramp high",
		"Land_RampConcreteHigh_F",
		15000,
		10000,
		20,
		6,
		90,
		[0, 6, 0]
	],
	[
		"Concrete ramp",
		"Land_RampConcrete_F",
		15000,
		10000,
		20,
		6
	],
	[
		"Concrete Wall",
		"Land_CncWall4_F",
		35000,
		10000,
		20,
		6
	],	
	[
		"Concrete wired fence",
		"Land_IndFnc_9_F",
		15000,
		10000,
		20,
		6
	],		
	[
		"Concrete wired fence corner",
		"Land_IndFnc_Corner_F",
		15000,
		10000,
		20,
		6
	],	
	[
		"Concrete wall center",
		"Land_Wall_IndCnc_4_F",
		15000,
		10000,
		20,
		6
	],		

	//Steel walls
	[
		"Steel wall",
		"Land_Mil_WallBig_4m_F",
		15000,
		10000,
		20,
		10
	],
	[
		"Steel wall corner",
		"Land_Mil_WallBig_Corner_F",
		15000,
		10000,
		20,
		10
	],	
	[
		"Steel gate",
		"Land_Mil_WallBig_Gate_F",
		15000,
		10000,
		20,
		10
	],	
		[
		"Steel reinforced panel",
		"Land_Wall_IndCnc_2deco_F",
		15000,
		10000,
		20,
		10
	],	
	
	//wire fencing
	
	[
		"Wired fence gate",
		"Land_Net_Fence_Gate_F",
		10000,
		5000,
		10,
		6
	],	

    [
		"Wired fence 4m",
		"Land_Wired_Fence_4m_F",
		10000,
		5000,
		10,
		6
	],	

	[
		"Wired fence 5m",
		"Land_New_WiredFence_5m_F",
		10000,
		5000,
		10,
		6
	],	
	[
		"Wired fence 10m",
		"Land_New_WiredFence_10m_F",
		10000,
		5000,
		10,
		6
	],	
	[
		"Wired sport fence",
		"Land_SportGround_fence_F",
		10000,
		5000,
		10,
		6
	],
	[
		"Razor wire",
		"Land_Razorwire_F",
		10000,
		5000,
		10,
		6
	],		
	
	
	//Pipe fences
	[
		"Pipe fence 4m",
		"Land_Pipe_fence_4m_F",
		5000,
		2500,
		5,
		6
	],	
	[
		"Pipe fence 8m",
		"Land_PipeWall_concretel_8m_F",
		5000,
		2500,
		5,
		6
	],	

	//Nests/bunkers
	

	
	[
	    "Sandbag nest",
		"Land_BagBunker_Small_F",
		30000,
		15000,
		30,
		11,
		0,
		[0, 8, 0],
		true
	],
	
	[
	    "Large camo sandbag tower",
		"Land_BagBunker_Tower_F",
		400000,
		75000,
		60,
		15,
		12,
		[0, 8, 0],
		true
	],
	[
	    "Large bag bunker",
		"Land_BagBunker_Large_F",
		200000,
		75000,
		60,
		13,
		0,
		[0, 8, 0],
		true
	],
	[
	    "Large H barrier tower",
		"Land_HBarrierTower_F",
		200000,
		75000,
		60,
		14,
		0,
		[0, 8, 0],
		true
	],
	[
	    "Small cargo tower green",
		"Land_Cargo_Patrol_V1_F",
		200000,
		75000,
		60,
		15,
		0,
		[0, 8, 0],
		true
	],	
	[
	    "Small cargo tower yellow",
		"Land_Cargo_Patrol_V2_F",
		200000,
		75000,
		60,
		15,
		0,
		[0, 8, 0],
		true
	],		
	[
	    "Large cargo tower",
		"Land_Cargo_Tower_V1_F",
		400000,
		75000,
		60,
		15,
		0,
		[0, 8, 0],
		true,
		40
	],	
	[
	    "Large cargo tower Green",
		"Land_Cargo_Tower_V1_No1_F",
		400000,
		75000,
		60,
		15,
		0,
		[0, 8, 0],
		true,
		40
	],
	[
	    "Large H barrier tower Yellow",
		"Land_Cargo_Tower_V3_F",
		300000,
		75000,
		60,
		15,
		0,
		[0, 8, 0],
		true
	],
	
	// ATMs
	[
		"Laptop (ATM)",
		"Land_Laptop_unfolded_F",
		250000,
		70000,
		5,
		5
	],
	
	[
		"Ladder",
		"Land_PierLadder_F",
		10000,
		7000,
		5,
		5
	],
	[
		"Concrete stairs",
		"Land_GH_Stairs_F",
		20000,
		10000,
		5,
		5,
		90,
		[0, 3, 0]
	],
	[
		"Bar gate",
		"Land_BarGate_F",
		150000,
		80000,
		5,
		5,
		0,
		[0, 3, 3]
	],
	[
		"Helipad circle (cosmetic)",
		"Land_HelipadCivil_F",
		10000,
		5000,
		5,
		5
	],
	[
		"Water source",
		"Land_Water_source_F",
		100000,
		30000,
		5,
		10
	]
	
	
];

life_build_garages = [
	"Land_i_Garage_V1_F"
];

life_build_storage_crates = [
	"O_supplyCrate_F"
];

life_build_actionable_objects = [
	"O_supplyCrate_F",
	"Land_i_Garage_V1_F",
	"Pole_F",
	"Land_Stone_Gate_F",
	"Land_Laptop_unfolded_F",
	"Land_Water_source_F",
	"Land_Mil_WallBig_Gate_F",
	"Land_Cargo_Tower_V1_No1_F",
	"Land_Cargo_Tower_V1_F"
];

life_build_lockable_objects = [
	"Land_Stone_Gate_F",
	"Land_Mil_WallBig_Gate_F",
	"Land_Cargo_Tower_V1_No1_F",
	"Land_Cargo_Tower_V1_F",
	"Land_i_Garage_V1_F"
];

life_build_atm_objects = [
	"Land_Laptop_unfolded_F"
];

life_build_garage_spawn = "Sign_Arrow_Direction_Green_F";
life_build_garage_chopper_spawn = "Sign_Arrow_Direction_Blue_F";
life_build_spawnpoint = "Sign_Arrow_F";
life_build_spawn_delay = 60 * 10; // 10 Minutes
life_build_spawnpoints = []; // Used
life_build_last_spawned = -1;
life_build_areas_on = false;

life_build_areas = [
	"mrkBuildArea1",
	"mrkBuildArea2",
	"mrkBuildArea3",
	"mrkBuildArea4",
	"mrkBuildArea5",
	"mrkBuildArea6",
	"mrkBuildArea7",
	"mrkBuildArea8",
	"mrkBuildArea9",
	"mrkBuildArea10",
	"mrkBuildArea11"	
];
{_x setMarkerAlphaLocal 0; } foreach life_build_areas;

life_build_plot_pole = "Pole_F";
life_build_plot_radius = 45;
life_build_plot_space_between = 10;
life_build_plot_object_limit = 130;



__CONST__(life_build_objects, life_build_objects);
__CONST__(life_build_garages, life_build_garages);
__CONST__(life_build_lockable_objects, life_build_lockable_objects);
__CONST__(life_build_atm_objects, life_build_atm_objects);


// Define some helper functions
build_getObject = {
	_item = [_this,0,"",[""]] call BIS_fnc_param;
	
	_found = [];
	
	{
		if (_x select 1 == _item) exitWith { _found = _x }; // Find by life id
		if ("life_inv_build_" + (_x select 1) == _item) exitWith { _found = _x };
		if ("build_" + (_x select 1) == _item) exitWith { _found = _x };
		if (_x select 0 == _item) exitWith { _found = _x }; // Find by id
	} forEach (call life_build_objects);
	
	_found;
};