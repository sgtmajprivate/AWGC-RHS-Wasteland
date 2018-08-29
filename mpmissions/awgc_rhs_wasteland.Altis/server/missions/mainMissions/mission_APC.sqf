// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_APC.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = // to specify a vehicleLoadouts variant, simply write "class/variant", e.g. "O_Heli_Light_02_dynamicLoadout_F/orcaDAR"
	[
		["RHS_BM21_MSV_01", "rhsusf_M1220_M153_M2_usarmy_d", "rhs_zsu234_aa"],
		["rhsusf_M1117_D", "rhs_btr70_vmf", "rhs_zsu234_aa"],
		["rhs_btr80_msv", "rhs_bmd1pk"],
		["rhs_bmd1", "rhs_bmd1p", "rhs_bmd1r", "rhs_bmd2", "rhs_bmd2m", "rhs_bmd4_vdv", "rhs_bmp1_vdv", "rhs_bmp1p_vdv", "rhs_bmp2k_vdv", "rhs_bmp3_late_msv"]
	];

	while {_vehicleClass isEqualType []} do { _vehicleClass = selectRandom _vehicleClass };
	if (_vehicleClass find "/" != -1) then { _vehicleClass = _vehicleClass splitString "/" };

	private _vehicleClassTmp = _vehicleClass;
	if (_vehicleClassTmp isEqualType []) then { _vehicleClassTmp = _vehicleClassTmp select 0 };

	_missionType = switch (true) do
	{
		case ({_vehicleClassTmp isKindOf _x} count ["rhs_zsu234_aa", "rhs_zsu234_aa"] > 0): { "Anti Aircraft Vehicle" };
		case (_vehicleClassTmp isKindOf "Tank_F"):                                                          { "Infantry Fighting Vehicle" };
		case (_vehicleClassTmp isKindOf "AFV_Wheeled_01_base_F"):                                           { "Armored Fighting Vehicle" };
		default                                                                                             { "Armored Personnel Carrier" };
	};

	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
