private[];


life_paintball_inprogress = false;
life_paintball_score = []; // [Red, Blue]
life_paintball_red_team = [];
life_paintball_blue_team = [];
life_paintball_queued = [];
life_paintball_best_of = 3;
life_paintball_timer = -1;

// Set up queueing

[] spawn {
	while {true} do {
		//while {life_paintball_inprogress} do 
			
		//};
	
		waitUntil { count life_paintball_queued >= 1 && !life_paintball_inprogress };
		
		// Wait a minute for other players to join.
		sleep 60;
		
		// Starting game.
		[] call life_fnc_paintballCreateGame;
		life_paintball_queued = [];
		
		sleep 1;
	};
};