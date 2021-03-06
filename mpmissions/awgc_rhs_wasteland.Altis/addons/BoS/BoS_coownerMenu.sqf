//	@file Version:
//	@file Name:
//	@file Author: Cael817, all credit to A3W
//	@file Created:

#define BoS_Menu_option 17001
disableSerialization;

private ["_start","_panelOptions","_BoS_select","_displayBoS"];
_uid = getPlayerUID player;
if (!isNil "_uid") then {
	_start = createDialog "BoS_Menu";

	_displayBoS = uiNamespace getVariable "BoS_Menu";
	_BoS_select = _displayBoS displayCtrl BoS_Menu_option;

	_panelOptions = [
					"ReLock Base Objects",
					"Show Objects Owned by You",
					"Show Base Border",
					"Lights OFF",
					"Lights ON",
					"Lock Down Base",
					"Release Lock Down",
					"Change PIN",
					"Lock All Doors",
					"UnLock All Doors",
					"Repair Base Locker"
	];

	{
		_BoS_select lbAdd _x;
	} forEach _panelOptions;
};