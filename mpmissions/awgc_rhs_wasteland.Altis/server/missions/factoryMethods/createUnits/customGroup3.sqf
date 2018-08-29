// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: customGroup.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

private ["_group", "_pos", "_nbUnits", "_unitTypes", "_uPos", "_unit"];

_group = _this select 0;
_pos = _this select 1;
_nbUnits = param [2, 7, [0]];
_radius = param [3, 10, [0]];

_unitTypes =
[
	"C_man_polo_1_F", "C_man_polo_1_F_euro", "C_man_polo_1_F_afro", "C_man_polo_1_F_asia",
	"C_man_polo_2_F", "C_man_polo_2_F_euro", "C_man_polo_2_F_afro", "C_man_polo_2_F_asia",
	"C_man_polo_3_F", "C_man_polo_3_F_euro", "C_man_polo_3_F_afro", "C_man_polo_3_F_asia",
	"C_man_polo_4_F", "C_man_polo_4_F_euro", "C_man_polo_4_F_afro", "C_man_polo_4_F_asia",
	"C_man_polo_5_F", "C_man_polo_5_F_euro", "C_man_polo_5_F_afro", "C_man_polo_5_F_asia",
	"C_man_polo_6_F", "C_man_polo_6_F_euro", "C_man_polo_6_F_afro", "C_man_polo_6_F_asia"
];

for "_i" from 1 to _nbUnits do
{
	_uPos = _pos vectorAdd ([[random _radius, random _radius, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;
	
	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	_unit addVest "V_I_G_resistanceLeader_F";
	_unit addUniform "rhs_uniform_gorka_r_y";

	switch (true) do
	{
		// AT every 5 units
		case (_i % 5 == 0):
		{
			_unit addBackpack "B_ViperLightHarness_blk_F";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addWeapon "rhs_weap_g36c";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
			// _unit addMagazine "Titan_AT";
			_unit addWeapon "rhs_weap_M136";
			_unit addMagazine "rhs_m136_mag";
			// _unit addMagazine "Titan_AT";
			_unit selectWeapon "rhs_weap_M136";
		};
		// Sniper every 6 units
		case (_i % 6 == 0):
		{
			_unit addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
			_unit addWeapon "rhs_weap_m40a5";
			_unit addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_10Rnd_762x51_m118_special_Mag";
			_unit addPrimaryWeaponItem "rhsusf_acc_premier_anpvs27";
		};
		// AA every 7 units
		case (_i % 7 == 0):
		{
			_unit addBackpack "B_ViperLightHarness_blk_F";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addWeapon "rhs_weap_g36c";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addMagazine "rhssaf_30rnd_556x45_EPR_G36";
			_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
			_unit addMagazine "rhs_fim92_mag";
			_unit addWeapon "rhs_weap_fim92";
			_unit addMagazine "rhs_fim92_mag";
			_unit addMagazine "rhs_fim92_mag";
			_unit selectWeapon "rhs_weap_fim92";
		};
		// Rifleman
		default
		{
			if (_unit == leader _group) then
			{
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addWeapon "rhs_weap_m4a1_blockII_bk";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_tan";
				_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
				_unit addMagazine "HandGrenade";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addWeapon "rhs_weap_m4a1_blockII_bk";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit addPrimaryWeaponItem "rhsusf_acc_rotex5_tan";
				_unit addPrimaryWeaponItem "rhsusf_acc_harris_bipod";
				_unit addMagazine "HandGrenade";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit addHeadgear "rhs_altyn_novisor_bala";
	// _unit addGoggles "G_Balaclava_blk";
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos, "LandVehicle"] call defendArea;
