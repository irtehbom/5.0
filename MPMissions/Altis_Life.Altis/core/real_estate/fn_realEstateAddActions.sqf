/*

Real Estate House Actions

*/
private[];

{
_x removeAction 0;
_x addAction["<t color='#FF0000'>Real Estate Menu</t>",life_fnc_realEstateMenu,"",0,false,false,"",''];
} foreach nearestObjects[real_estate_marker_pos, [real_estate_houses select 0], 100];


