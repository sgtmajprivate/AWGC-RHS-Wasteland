//	@file Version: 1.0
//	@file Name: midGroup.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy, AgentRev
//	@file Created: 08/12/2012 21:58
//	@file Args:

if (!isServer) exitWith {};

private ["_group", "_pos", "_leader", "_man2", "_man3", "_man4", "_man5", "_man6", "_man7", "_man8", "_man9", "_man10"];

_group = _this select 0;
_pos = _this select 1;

// Leader
_leader = _group createUnit ["C_man_polo_1_F", [(_pos select 0) + 10, _pos select 1, 0], [], 1, "Form"];
_leader addUniform "U_Marshal";
_leader addGoggles "G_Balaclava_blk";
_leader addVest "rhsusf_spc_marksman";
_leader addBackpack "B_Messenger_Black_F";
_leader addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_leader addWeapon "rhs_weap_mk18_bk";
_leader addPrimaryWeaponItem "rhsusf_acc_T1_high";
_leader addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_leader addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
// _leader addMagazine "Titan_AA";
// _leader addWeapon "launch_Titan_F";
// _leader addMagazine "Titan_AA";
_leader addMagazine "HandGrenade";
// _leader selectWeapon "launch_Titan_F";

// Rifleman - AT Rockets
_man2 = _group createUnit ["C_man_polo_2_F", [(_pos select 0) - 30, _pos select 1, 0], [], 1, "Form"];
_man2 addUniform "U_Marshal";
_man2 addVest "V_PlateCarrier2_blk";
_man2 addGoggles "G_Balaclava_blk";
_man2 addBackpack "B_AssaultPack_blk";
_man2 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man2 addWeapon "rhs_weap_mk18_bk";
_man2 addPrimaryWeaponItem "rhsusf_acc_T1_high";
_man2 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man2 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man2 addMagazine "rhs_mag_smaw_HEDP";
_man2 addWeapon "rhs_weap_smaw";
_man2 addMagazine "rhs_mag_smaw_HEDP";
_man2 addMagazine "HandGrenade";
_man2 selectWeapon "rhs_weap_smaw";

// Rifleman 001
_man3 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) + 30, 0], [], 1, "Form"];
_man3 addUniform "U_Marshal";
_man3 addVest "V_PlateCarrier2_blk";
_man3 addGoggles "G_Balaclava_blk";
_man3 addBackpack "B_Messenger_Gray_F";
_man3 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man3 addWeapon "rhs_weap_m4a1_blockII_bk";
_man3 addPrimaryWeaponItem "rhsusf_acc_ACOG";
_man3 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man3 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man3 addMagazine "HandGrenade";

// MG Rifleman
_man4 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
_man4 addUniform "U_Marshal";
_man4 addVest "V_PlateCarrier2_blk";
_man4 addGoggles "G_Balaclava_blk";
_man4 addBackpack "B_Messenger_Gray_F";
_man4 addMagazine "rhs_200rnd_556x45_M_SAW";
_man4 addWeapon "rhs_weap_m249_pip_S_vfg";
_man4 addPrimaryWeaponItem "rhsusf_acc_eotech_552";
_man4 addMagazine "rhs_200rnd_556x45_M_SAW";
// _man4 addMagazine "rhs_200rnd_556x45_M_SAW";
_man4 addMagazine "HandGrenade";

// Rifleman 002
_man5 = _group createUnit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
_man5 addUniform "U_Marshal";
_man5 addVest "V_Chestrig_blk";
_man5 addGoggles "G_Balaclava_blk";
_man5 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man5 addWeapon "rhs_weap_m4_mstock";
// _man5 addPrimaryWeaponItem "optic_Holosight";
_man5 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man5 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man5 addMagazine "HandGrenade";

// Rifleman 002
_man6 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
_man6 addUniform "U_Marshal";
_man6 addVest "V_Chestrig_blk";
_man6 addGoggles "G_Balaclava_blk";
_man6 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man6 addWeapon "rhs_weap_m4_mstock";
// _man6 addPrimaryWeaponItem "optic_Holosight";
_man6 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man6 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man6 addMagazine "HandGrenade";

// Grenadier
_man7 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
_man7 addUniform "U_Marshal";
_man7 addVest "rhsusf_mbav_grenadier";
_man7 addGoggles "G_Balaclava_blk";
_man7 addBackpack "B_Messenger_Gray_F";
_man7 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man7 addMagazine "rhs_mag_M433_HEDP";
_man7 addWeapon "rhs_weap_m4a1_m203s";
_man7 addPrimaryWeaponItem "rhsusf_acc_T1_high";
_man7 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man7 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man7 addMagazine "rhs_mag_M433_HEDP";
_man7 addMagazine "rhs_mag_M433_HEDP";
_man7 addMagazine "HandGrenade";

// Rifleman 002
_man8 = _group createUnit ["C_man_polo_5_F", [_pos select 0, (_pos select 1) + 40, 0], [], 1, "Form"];
_man8 addUniform "U_Marshal";
_man8 addVest "V_Chestrig_blk";
_man8 addGoggles "G_Spectacles_Tinted";
_man8 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man8 addWeapon "rhs_weap_m4_mstock";
_man8 addPrimaryWeaponItem "optic_Holosight";
_man8 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man8 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man8 addMagazine "HandGrenade";

// Rifleman 001
_man9 = _group createUnit ["C_man_polo_4_F", [_pos select 0, (_pos select 1) - 30, 0], [], 1, "Form"];
_man9 addUniform "U_Marshal";
_man9 addVest "V_PlateCarrier2_blk";
_man9 addGoggles "G_Balaclava_blk";
_man9 addBackpack "B_Messenger_Gray_F";
_man9 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man9 addWeapon "rhs_weap_m4a1_blockII_bk";
_man9 addPrimaryWeaponItem "rhsusf_acc_ACOG";
_man9 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man9 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man9 addMagazine "HandGrenade";

// Grenadier
_man10 = _group createUnit ["C_man_polo_3_F", [_pos select 0, (_pos select 1) - 40, 0], [], 1, "Form"];
_man10 addUniform "U_Marshal";
_man10 addVest "rhsusf_mbav_grenadier";
_man10 addGoggles "G_Balaclava_blk";
_man10 addBackpack "B_Messenger_Gray_F";
_man10 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man10 addMagazine "rhs_mag_M433_HEDP";
_man10 addWeapon "rhs_weap_m4a1_m203s";
_man10 addPrimaryWeaponItem "rhsusf_acc_T1_high";
_man10 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man10 addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
_man10 addMagazine "rhs_mag_M433_HEDP";
_man10 addMagazine "rhs_mag_M433_HEDP";
_man10 addMagazine "HandGrenade";

sleep 0.1; // Without this delay, headgear doesn't get removed properly

_leader = leader _group;

{
	removeAllAssignedItems _x;
	if (_x == _leader) then { _x addHeadgear "H_Shemag_khk" }
	                   else { _x addHeadgear "H_Shemag_khk" };
	_x addPrimaryWeaponItem "acc_flashlight";
	_x enablegunlights "forceOn";
	_x call setMissionSkill;
	_x allowFleeing 0;
	_x addRating 9999999;
	_x addEventHandler ["Killed", server_playerDied];
} forEach units _group;

[_group, _pos, "LandVehicle"] call defendArea;