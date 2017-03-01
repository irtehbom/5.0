
if (life_build_areas_on) then {
	{ _x setMarkerAlphaLocal 0; } foreach life_build_areas;
} else {
	{ _x setMarkerAlphaLocal 0.7; } foreach life_build_areas;
	openMap true;
};
life_build_areas_on = !life_build_areas_on;