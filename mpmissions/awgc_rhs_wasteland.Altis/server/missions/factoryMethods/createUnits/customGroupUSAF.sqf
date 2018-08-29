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
	_uPos = _pos vectorAdd ([[random _radius, 0, 0], random 360] call BIS_fnc_rotateVector2D);
	_unit = _group createUnit [_unitTypes call BIS_fnc_selectRandom, _uPos, [], 0, "Form"];
	_unit setPosATL _uPos;

	removeAllWeapons _unit;
	removeAllAssignedItems _unit;
	removeUniform _unit;
	removeVest _unit;
	removeBackpack _unit;
	removeHeadgear _unit;
	removeGoggles _unit;

	switch (true) do
	{
		// Grenadier every 3 units, starting from #2
		case ((_i + 4) % 3 == 0):
		{
			_unit addUniform "rhs_uniform_acu_ucp";
			_unit addHeadGear "rhsusf_ach_helmet_headset_ess_ucp";
			_unit addWeapon "rhs_weap_m16a4_carryhandle_M203";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_M433_HEDP";
			_unit addMagazine "rhs_mag_M433_HEDP";
			_unit addMagazine "rhs_mag_M433_HEDP";
			_unit addMagazine "rhs_mag_M433_HEDP";
			_unit addItemToBackpack "UGL_FlareWhite_F";
			_unit addItemToBackpack "rhs_mag_an_m8hc";
			_unit addItemToBackpack "rhs_mag_an_m8hc";
		};
		// MG every 6 units, starting from #6
		case (_i % 6 == 0):
		{
			_unit addUniform "rhs_uniform_acu_ucp";
			_unit addHeadGear "rhsusf_ach_helmet_headset_ess_ucp";
			_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
			_unit addWeapon "rhs_weap_m249_pip_L";
			_unit addPrimaryWeaponItem "rhsusf_acc_ELCAN";
			_unit addMagazine "rhs_200rnd_556x45_B_SAW";
			_unit addMagazine "rhs_200rnd_556x45_B_SAW";
			_unit addItemToBackpack "rhs_mag_m67";
			_unit addItemToBackpack "rhs_mag_m67";
		};
		// AT every 6 units, starting from #3
		case ((_i + 3) % 6 == 0):
		{
			_unit addUniform "rhs_uniform_acu_ucp";
			_unit addHeadGear "rhsusf_ach_helmet_headset_ess_ucp";
			_unit addBackpack "rhsusf_assault_eagleaiii_ucp";
			_unit addWeapon "rhs_weap_m4_pmag";
			_unit addWeapon "rhs_weap_M136_hedp";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
			_unit addItemToBackpack "rhs_mine_M19_mag";
		};
		// Rifleman
		default
		{
			_unit addUniform "rhs_uniform_acu_ucp";
			_unit addHeadGear "rhsusf_ach_helmet_headset_ess_ucp";
			_unit addWeapon "rhs_weap_m14ebrri";
			_unit addPrimaryWeaponItem "optic_DMS";
			_unit addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
			_unit addMagazine "rhsusf_20Rnd_762x51_m118_special_Mag";
			_unit addItem "rhs_mag_an_m8hc";
			
			if (_unit == leader _group) then
			{
				_unit addWeapon "rhs_weap_m14ebrri";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addWeapon "rhs_weap_m4_pmag";
			};
		};
	};

	_unit addPrimaryWeaponItem "acc_flashlight";
	_unit enablegunlights "forceOn";

	_unit addRating 1e11;
	_unit spawn refillPrimaryAmmo;
	_unit call setMissionSkill;
	_unit addEventHandler ["Killed", server_playerDied];
};

[_group, _pos] call defendArea;
