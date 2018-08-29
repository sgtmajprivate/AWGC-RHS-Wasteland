//	@file Version: 1.0
//	@file Name: smallGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group","_pos","_leader","_man2","_man3","_man4","_man5","_man6"];

_group = _this select 0;
_pos = _this select 1;

// Sniper
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
_leader addUniform "U_I_FullGhillie_sard";
_leader addVest "V_PlateCarrierIA1_dgtl";
_leader addMagazine "rhsusf_mag_10Rnd_STD_50BMG_M33";
_leader addWeapon "rhs_weap_M107";
_leader addPrimaryWeaponItem "rhsusf_acc_M8541";
_leader addMagazine "rhsusf_mag_10Rnd_STD_50BMG_M33";
_leader addMagazine "rhsusf_mag_10Rnd_STD_50BMG_M33";
_leader addMagazine "HandGrenade";

// Sniper
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
_man2 addUniform "U_I_FullGhillie_sard";
_man2 addVest "V_PlateCarrierIA1_dgtl";
_man2 addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
_man2 addWeapon "rhs_weap_m40a5";
_man2 addPrimaryWeaponItem "rhsusf_acc_M8541_low";
_man2 addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
_man2 addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
_man2 addMagazine "HandGrenade";

// Sniper
_man3 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
_man3 addUniform "U_I_FullGhillie_sard";
_man3 addVest "V_PlateCarrierIA1_dgtl";
_man3 addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
_man3 addWeapon "rhs_weap_m40a5";
_man3 addPrimaryWeaponItem "rhsusf_acc_M8541_low";
_man3 addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
_man3 addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
_man3 addMagazine "HandGrenade";

// Spotter
_man4 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man4 addUniform "U_I_FullGhillie_sard";
_man4 addVest "V_PlateCarrierIA1_dgtl";
_man4 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man4 addWeapon "rhs_weap_m14ebrri";
_man4 addPrimaryWeaponItem "optic_DMS";
_man4 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man4 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man4 addMagazine "HandGrenade";
_man4 addItem "Rangefinder";

// Spotter
_man5 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man5 addUniform "U_I_FullGhillie_sard";
_man5 addVest "V_PlateCarrierIA1_dgtl";
_man5 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man5 addWeapon "rhs_weap_m14ebrri";
_man5 addPrimaryWeaponItem "optic_DMS";
_man5 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man5 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man5 addMagazine "HandGrenade";
_man5 addItem "Rangefinder";

// Spotter
_man6 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man6 addUniform "U_I_FullGhillie_sard";
_man6 addVest "V_PlateCarrierIA1_dgtl";
_man6 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man6 addWeapon "rhs_weap_m14ebrri";
_man6 addPrimaryWeaponItem "optic_DMS";
_man6 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man6 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man6 addMagazine "HandGrenade";
_man6 addItem "Rangefinder";

//AT Defender
_man7 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man7 addUniform "U_I_FullGhillie_sard";
_man7 addVest "V_HarnessOSpec_brn";
_man7 addBackpack "B_Carryall_oli";
_man7 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man7 addWeapon "rhs_weap_sr25";
_man7 addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4";
_man7 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man7 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man7 addMagazine "rhs_mag_maaws_HEAT";
_man7 addWeapon "rhs_weap_maaws";
_man7 addMagazine "rhs_mag_maaws_HEAT";
_man7 addMagazine "rhs_mag_maaws_HEAT";
_man7 addMagazine "rhs_mag_maaws_HEAT";
_man7 addMagazine "HandGrenade";
_man7 selectWeapon "rhs_weap_maaws";

//AA Defender
_man8 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man8 addUniform "U_I_FullGhillie_sard";
_man8 addVest "V_HarnessOSpec_brn";
_man8 addBackpack "B_Carryall_oli";
_man8 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man8 addWeapon "rhs_weap_sr25";
_man8 addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4";
_man8 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man8 addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
_man8 addMagazine "rhs_fim92_mag";
_man8 addWeapon "rhs_weap_fim92";
_man8 addMagazine "rhs_fim92_mag";
_man8 addMagazine "rhs_fim92_mag";
_man8 addMagazine "rhs_fim92_mag";
_man8 addMagazine "HandGrenade";
_man8 selectWeapon "rhs_weap_fim92";

sleep 0.1; // Without this delay, headgear doesn't get removed properly

_leader = leader _group;

{
	_x call setMissionSkill;
	_x allowFleeing 0;
	_x addRating 9999999;
	_x addEventHandler ["Killed", server_playerDied];
} forEach units _group;

[_group, _pos] call defendArea;
