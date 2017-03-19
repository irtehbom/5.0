/*

Real Estate Config

*/
private[];

real_estate_houses = [
"Land_i_House_Big_01_V1_F"
];

real_estate_rent = 70000;
 
real_estate_markers = [
	"re_marker_1",
	"re_marker_2",
	"re_marker_4",
	"re_marker_6",
	"re_marker_8",
	"re_marker_3",
	"re_marker_9",
	"re_marker_7",
	"re_marker_11",
	"re_marker_10",
	"re_marker_12",
	"re_marker_13",
	"re_marker_14",
	"re_marker_15",
	"re_marker_16",
	"re_marker_17"
];

real_estate_marker_pos = [];
{

_x setMarkerAlphaLocal 0;
getRePos = getMarkerPos _x;
real_estate_marker_pos pushback getRePos;

} foreach real_estate_markers;


real_estate_storage = [
"CargoNet_01_box_F"
];

{
	{
		_x removeAction 0;
		_x addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Menu",life_fnc_realEstateMenu,"",0,false,false,"",''];
	} foreach nearestObjects[_x, [real_estate_houses select 0], 200];
} foreach real_estate_marker_pos;