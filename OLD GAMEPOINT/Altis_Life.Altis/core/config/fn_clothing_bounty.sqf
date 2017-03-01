private["_filter"];
_filter = [_this,0,0,[0]] call BIS_fnc_param;
//Classname, Custom Display name (use nil for Cfg->DisplayName, price


//Shop Title Name
ctrlSetText[3103,"Bounty Hunter Clothing Shop"];


switch (_filter) do
{
//Uniforms
case 0:
{
[
["U_I_CombatUniform",nil,5000]
];
};


//Hats
case 1:
{
[
["H_MilCap_dgtl",nil,100]
];
};


//Glasses
case 2:
{
[
["G_Shades_Black",nil,25]
];
};


//Vest
case 3:
{
[
["V_TacVest_blk",nil,10000]
];
};


//Backpacks
case 4:
{
[
["B_Carryall_oli",nil,20000],
["I_UAV_01_backpack_F","Surveillance Bot",50000]
];
};
};