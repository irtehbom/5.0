#include <macro.h>
_unit = [_this,0,objNull,[objNull]] call BIS_fnc_param;

player setObjectTextureGlobal [0, "textures\aff\aff_uniform.jpg"];
[[player,0,"textures\aff\aff_uniform.jpg"],"life_fnc_setTexture",true,false] spawn life_fnc_MP;