/*
Display the crimes for the person in court
*/
private[];

_display = findDisplay 9400;
_list = _display displayCtrl 9402;
_data = lbData[9401,(lbCurSel 9401)];
_data = call compile format["%1", _data];
_crimeArrayLoop = _data select 3;

_duplicateCheck = [];
_filteredLoop = [];
{

 _filteredLoop = _x select 2;

} foreach _crimeArrayLoop;



{

_crime = _x;
	if(!(_crime in _duplicateCheck)) then
	{
	_duplicateCheck pushBack _crime;
	_list lbAdd format["%1 count(s) of %2",{_x == _crime} count _filteredLoop,_crime];
	
	};

} foreach _filteredLoop;

