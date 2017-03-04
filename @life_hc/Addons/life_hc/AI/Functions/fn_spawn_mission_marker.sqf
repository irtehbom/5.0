// =========================================================================================================
//  Author: Rob
// =========================================================================================================

_positionToCreate = _this select 0;
_markerName = _this select 1;
_markerColor = _this select 2;
_markerText = _this select 3;
_markerType = _this select 4;

_marker = createMarker [_markerName, _positionToCreate];
_marker setMarkerColor _markerColor;
_marker setMarkerText _markerText;
_marker setMarkerType _markerType;

_markerName;