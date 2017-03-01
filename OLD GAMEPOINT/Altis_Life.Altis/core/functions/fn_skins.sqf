#include <macro.h>

switch(playerSide) do {
	case civilian: {
	
		if(uniform player == "U_I_CombatUniform") then {
				[[player,0,"textures\aff\aff_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		};
		
		if(uniform player == "U_O_CombatUniform_oucamo") then {
				[[player,0,"textures\aff\aff_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		};
		
		if(uniform player == "U_O_SpecopsUniform_blk") then {
				[[player,0,"textures\aff\aff_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		};
		
		if(uniform player == "U_I_CombatUniform_shortsleeve") then {
				[[player,0,"textures\aff\aff_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		};
		if(uniform player == "U_I_OfficerUniform") then {
				[[player,0,"textures\aff\aff_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;
		};
	};
	case west: {
		if(uniform player == "U_B_CombatUniform_mcam_worn") then {
			player setObjectTextureGlobal [0, "textures\police\uniforms\GP_Police_Uniform.jpg"];
		};
	};
	case independent: {
		if(uniform player == "U_Rangemaster") then {
			player setObjectTextureGlobal [0, "textures\medic_uniform.jpg"];
		};
	};
};
