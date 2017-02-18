/*
	Creates markers for real estate & sets up garage menu's
*/
if(count real_estate_houses_recieve == 0) exitWith {}; //Nothing to do.

{
	_position = call compile format["%1",_x select 0];
	_realEstate = nearestObject [_position, "Land_i_House_Big_01_V1_F"];
	_realEstate setVariable["uid",round(random 99999),true];
	

	_garage = nearestObject [_position, "Land_i_Garage_V1_F"];
	_garage addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Car Garage",life_fnc_realEstateGarageMenu,"",0,false,false,"",''];
	

	_heli = nearestObject [_position, "Land_Laptop_unfolded_F"];
	_heli addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Air Garage",life_fnc_realEstateGarageMenu,"",0,false,false,"",''];
	
	_computer = nearestObjects [_position, ["Land_PCSet_01_screen_F"],20] select 0;

	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Online Rebel Market",life_fnc_virt_menu,"rebel"];
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Online Market",life_fnc_virt_menu,"market"];
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Online Clothing Shop",life_fnc_clothingMenu,"reb",0,false,false,"",'playerSide == east'];
	_computer addAction["<t color='#FF0000'>[</t><t color='#FFFFFF'>Realestate</t><t color='#FF0000'>]</t> Bank",life_fnc_atmMenu,"",0,false,false,"",'vehicle player == player && player distance _target < 5'];
	
	_marker = createMarkerLocal [format["house_%1",(_realEstate getVariable "uid")],_position];
	_marker setMarkerTextLocal "Real Estate";
	_marker setMarkerColorLocal "ColorGreen";
	_marker setMarkerTypeLocal "loc_Lighthouse";
	
} foreach real_estate_houses_recieve;