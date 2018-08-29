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

	_unit addVest "V_PlateCarrier1_rgr";
	_unit addMagazine "rhs_30Rnd_545x39_AK";
	_unit addMagazine "rhs_30Rnd_545x39_AK";
	_unit addMagazine "rhs_30Rnd_545x39_AK";

	switch (true) do
	{
		// Grenadier every 3 units, starting from #2
		case ((_i + 4) % 3 == 0):
		{
			_unit addUniform "rhsgref_uniform_woodland_olive";
			_unit addHeadGear "rhsgref_helmet_pasgt_olive";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addWeapon "rhs_weap_ak74m_fullplum_gp25_npz";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
			_unit addMagazine "1Rnd_HE_Grenade_shell";
		};
		// AT every 6 units, starting from #6
		case (_i % 6 == 0):
		{
			_unit addUniform "rhsgref_uniform_olive";
			_unit addHeadGear "rhsgref_helmet_pasgt_olive";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addWeapon "rhs_weap_ak74m_plummag_npz";
			_unit addMagazine "rhs_rpg7_PG7V_mag";
			_unit addWeapon "rhs_weap_rpg7";
			_unit addMagazine "rhs_rpg7_PG7V_mag";
			_unit addMagazine "rhs_rpg7_PG7V_mag";
		};
		// RPG-7 every 6 units, starting from #3
		case ((_i + 3) % 6 == 0):
		{
			_unit addUniform "rhsgref_uniform_woodland";
			_unit addHeadGear "rhsgref_helmet_pasgt_olive";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addWeapon "rhs_weap_ak74m_plummag_npz";
			_unit addMagazine "rhs_rpg7_PG7VR_mag";
			_unit addWeapon "rhs_weap_rpg7";
			_unit addMagazine "rhs_rpg7_PG7VR_mag";
			_unit addMagazine "rhs_rpg7_PG7VR_mag";
		};
		// Rifleman
		default
		{
			_unit addUniform "rhsgref_uniform_ERDL";
			_unit addHeadGear "rhsgref_helmet_pasgt_olive";
			_unit addBackpack "B_Kitbag_mcamo";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			_unit addMagazine "rhs_30Rnd_545x39_AK";
			
			if (_unit == leader _group) then
			{
				_unit addWeapon "rhs_weap_g36kv";
				_unit addPrimaryWeaponItem "optic_DMS";
				_unit setRank "SERGEANT";
			}
			else
			{
				_unit addWeapon "rhs_weap_g36kv";
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
