//the function to switch on/off of SATCOM system
//[unitName, activeStatus] call PXS_switcher
//unitName - the unit for SATCOM action
//activeStatus - true or false
//v1.0 A3

private ["_unit","_status"];
_unit = [_this, 0, player] call BIS_fnc_param;
_status = [_this, 1, true] call BIS_fnc_param;

if (_status) then {
_unit removeAction PXS_action;
PXS_action = _unit addAction ["Switch on satellite view","pxs_satcom_a3\start_satellite.sqf"];
//hint "SATCOM system is connected.";
} else {
if (!isNil "PXS_action") then
{
	_unit removeAction PXS_action;
};
if (!isNil "PXS_SatelliteActive") then
{
	if (PXS_SatelliteActive) then
	{
		call PXS_closeCamera;
	};
};
//hint localize "SATCOM system is disconnected.";
};