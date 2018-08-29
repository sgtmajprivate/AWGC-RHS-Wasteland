// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: mission_LightArmVeh.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 15:19

if (!isServer) exitwith {};
#include "mainMissionDefines.sqf";

private ["_vehicleClass", "_nbUnits"];

_setupVars =
{
	_vehicleClass = // to specify a vehicleLoadouts variant, simply write "class/variant", e.g. "O_Heli_Light_02_dynamicLoadout_F/orcaDAR"
	[
		["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags"],
		["rhsgref_cdf_reg_uaz_spg9", "rhsusf_m1025_w_m2"],
		["rhsusf_m1025_w_mk19", "rhsusf_rg33_m2_usmc_d", "RHS_BM21_MSV_01", "rhsusf_M1232_M2_usarmy_d", "rhsusf_M1232_MK19_usarmy_d", "rhs_tigr_sts_vdv", "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", "rhs_gaz66_zu23_vmf", "rhsusf_M1220_M153_M2_usarmy_d"]
	];

	while {_vehicleClass isEqualType []} do { _vehicleClass = selectRandom _vehicleClass };
	if (_vehicleClass find "/" != -1) then { _vehicleClass = _vehicleClass splitString "/" };

	_missionType = "Light Armed Vehicle";
	_locationsArray = MissionSpawnMarkers;

	_nbUnits = if (missionDifficultyHard) then { AI_GROUP_LARGE } else { AI_GROUP_MEDIUM };
};

_this call mission_VehicleCapture;
