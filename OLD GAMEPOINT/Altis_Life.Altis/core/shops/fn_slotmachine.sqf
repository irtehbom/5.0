/*
	File: fn_slotmachine.sqf
	Author: Jacob "PapaBear" Tyler
	Description: intializes the slotmachine gui
*/

createDialog "SlotMachineGUI";
disableSerialization;

_display = findDisplay 5780;

_slotPic1 = _display displayCtrl 5771;
_slotPic2 = _display displayCtrl 5772;
_slotPic3 = _display displayCtrl 5773;

_slotPic1 ctrlSetText "Pics\slot_four.jpg";
_slotPic2 ctrlSetText "Pics\slot_four.jpg";
_slotPic3 ctrlSetText "Pics\slot_four.jpg";