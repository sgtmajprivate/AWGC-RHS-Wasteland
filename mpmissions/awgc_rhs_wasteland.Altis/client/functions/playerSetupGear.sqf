// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: playerSetupGear.sqf
//	@file Author: [GoT] JoSchaap, AgentRev

private ["_player", "_uniform", "_vest", "_headgear", "_goggles"];
_player = _this;

// Clothing is now defined in "client\functions\getDefaultClothing.sqf"

_uniform = [_player, "uniform"] call getDefaultClothing;
_vest = [_player, "vest"] call getDefaultClothing;
_headgear = [_player, "headgear"] call getDefaultClothing;
_goggles = [_player, "goggles"] call getDefaultClothing;

if (_uniform != "") then { _player addUniform _uniform };
if (_vest != "") then { _player addVest _vest };
if (_headgear != "") then { _player addHeadgear _headgear };
if (_goggles != "") then { _player addGoggles _goggles };

sleep 0.1;

// Remove GPS
// _player unlinkItem "ItemGPS";

// Add GPS 
_player linkItem "ItemGPS";

// Remove radio
//_player unlinkItem "ItemRadio";

// Remove NVG
// if (hmd _player != "") then { _player unlinkItem hmd _player };

// Add NVG
_player linkItem "rhsusf_ANPVS_14";

// Default gear
_player addWeapon "rhsusf_weap_glock17g4";
_player addWeapon "Binocular";
_player addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_player addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_player addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_player addMagazine "rhsusf_mag_17Rnd_9x19_FMJ";
_player addItem "FirstAidKit";
_player selectWeapon "rhsusf_weap_glock17g4";
// _player addHandgunItem "rhsusf_acc_omega9k";		// Silencer
_player addHandgunItem "acc_flashlight_pistol";

switch (true) do
{
	case (["_medic_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "rhsusf_falconii";
		_player addWeapon "rhs_weap_m4";
		_player addPrimaryWeaponItem "rhsusf_acc_T1_high";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
		_player addMagazine "rhs_mag_30Rnd_556x45_M855_Stanag";
		_player removeItem "FirstAidKit";
		_player addItem "Medikit";
		_player addItem "rhs_mag_an_m8hc";		// Smoke
		_player addItem "rhs_mag_an_m8hc";		// Smoke
	};
	case (["_engineer_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "rhsgref_hidf_alicepack";
		_player addWeapon "rhs_weap_M590_8RD";
		_player addMagazine "rhsusf_8Rnd_00Buck";
		_player addMagazine "rhsusf_8Rnd_00Buck";
		_player addMagazine "rhsusf_8Rnd_00Buck";
		_player addMagazine "rhsusf_8Rnd_00Buck";
		_player addWeapon "rhs_weap_M136_hedp";		// Single Use M-136
		_player addItem "MineDetector";
		_player addItem "Toolkit";
		_player addItem "rhs_mine_M19_mag";		// AT Mine
		_player addItem "rhs_mag_an_m14_th3";		// Incendenary grenade
		_player addItem "rhs_mag_an_m14_th3";		// Incendenary grenade
	};
	case (["_sniper_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "rhsusf_falconii";
		_player addWeapon "rhs_weap_m24sws_blk";
		_player addPrimaryWeaponItem "rhsusf_acc_LEUPOLDMK4";
		_player addItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		_player addItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		_player addItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		_player addItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		_player addItem "rhsusf_5Rnd_762x51_m118_special_Mag";
		_player addItem "rhsusf_mine_m14_mag";		// AP Mine
		_player addItem "rhsusf_mine_m14_mag";		// AP Mine
		_player addItem "rhsusf_mine_m14_mag";		// AP Mine
		_player addItem "rhsusf_m112_mag";		// Explosive Charge
		_player addItem "rhsusf_m112_mag";		// Explosive Charge
		_player addItem "rhsusf_m112_mag";		// Explosive Charge
		_player addWeapon "rhsusf_lrf_Vector21";
	};
	case (["_pilot_", typeOf _player] call fn_findString != -1):
	{
		_player addBackpack "B_UAV_01_backpack_F";
		_player addWeapon "rhsusf_weap_MP7A2_grip2";
		_player addPrimaryWeaponItem "rhsusf_acc_eotech_xps3";
		_player addPrimaryWeaponItem "rhsusf_acc_grip2";
		_player addItem "rhsusf_mag_40Rnd_46x30_AP";
		_player addItem "rhsusf_mag_40Rnd_46x30_AP";
		_player addItem "rhsusf_mag_40Rnd_46x30_AP";
		_player addItem "rhsusf_mag_40Rnd_46x30_AP";
		_player addWeapon "Binocular";
		_player linkItem "B_UavTerminal";
		_player linkItem "rhsusf_ANPVS_15";
		};
	};

	switch (side _player) do
{
	case west:
	{
		_player linkItem "B_UavTerminal";
	};
	case east:
	{
		_player linkItem "O_UavTerminal";
	};
	case resistance:
	{
		_player linkItem "I_UavTerminal";
	};
};
if (_player == player) then
{
	thirstLevel = 100;
	hungerLevel = 100;
};
