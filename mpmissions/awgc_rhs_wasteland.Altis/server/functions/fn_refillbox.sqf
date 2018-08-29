// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: fn_refillbox.sqf  "fn_refillbox"
//	@file Author: [404] Pulse , [404] Costlyy , [404] Deadbeat, AgentRev
//	@file Created: 22/1/2012 00:00
//	@file Args: [OBJECT (Weapons box that needs filling), STRING (Name of the fill to give to object)]

if (!isServer) exitWith {};

#define RANDOM_BETWEEN(START,END) ((START) + floor random ((END) - (START) + 1))
#define RANDOM_ODDS(ODDS) ([0,1] select (random 1 < (ODDS))) // between 0.0 and 1.0

private ["_box", "_boxType", "_boxItems", "_item", "_qty", "_mag"];
_box = _this select 0;
_boxType = _this select 1;

_box setVariable [call vChecksum, true];

_box allowDamage false; // No more fucking busted crates
_box setVariable ["allowDamage", false, true];
_box setVariable ["A3W_inventoryLockR3F", true, true];

// Clear pre-existing cargo first
//clearBackpackCargoGlobal _box;
clearMagazineCargoGlobal _box;
clearWeaponCargoGlobal _box;
clearItemCargoGlobal _box;

if (_boxType == "mission_USSpecial2") then { _boxType = "mission_USSpecial" };

switch (_boxType) do
{
	case "mission_USLaunchers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["lerca_1200_tan", "lerca_1200_tan", "rhsusf_lrf_Vector21"], 1, 1],
			["wep", ["rhs_weap_M136", "rhs_weap_M136_hedp", "rhs_weap_M136_hp"], RANDOM_BETWEEN(2,5), RANDOM_BETWEEN(0,0)],
			["wep", "rhs_weap_maaws", RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(1,2)],
			["mag", ["APERSTripMine_Wire_Mag", "APERSBoundingMine_Range_Mag", "APERSMine_Range_Mag", "ClaymoreDirectionalMine_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", ["SLAMDirectionalMine_Wire_Mag", "ATMine_Range_Mag", "DemoCharge_Remote_Mag", "SatchelCharge_Remote_Mag"], RANDOM_BETWEEN(2,5)],
			["mag", "HandGrenade", RANDOM_BETWEEN(5,10)],
			["mag", "1Rnd_HE_Grenade_shell", RANDOM_BETWEEN(5,10)],
			["itm", [["rhssaf_helmet_m59_85_nocamo", "rhssaf_helmet_m97_md2camo"], ["rhssaf_helmet_m97_olive_nocamo_black_ess_bare", "rhssaf_helmet_m97_black_nocamo_black_ess_bare"], "rhssaf_helmet_m59_85_oakleaf"], RANDOM_BETWEEN(1,4)],
			["itm", [["rhssaf_vest_md98_rifleman", "rhssaf_vest_md99_md2camo_rifleman", "rhssaf_vest_md99_woodland_rifleman"], // Lite
			         ["rhssaf_vest_md99_digital", "rhssaf_vest_md99_digital_rifleman", "rhssaf_vest_md12_digital"], // Rig
			         ["rhssaf_vest_md12_digital_desert", "V_PlateCarrierSpec_blk", "V_PlateCarrierSpec_mtp"], // Special
			         ["rhssaf_vest_otv_md2camo", "rhssaf_vest_otv_md2camo", "rhssaf_vest_md98_rifleman", "rhssaf_vest_md99_md2camo_rifleman", "rhssaf_vest_otv_md2camo"]] /* GL */, RANDOM_BETWEEN(1,4)]
		];
	};
	case "mission_USSpecial":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			//["itm", "NVGoggles", 5],
			["wep", ["Binocular", "Rangefinder"], RANDOM_BETWEEN(0,3)],
			["itm", "Medikit", RANDOM_BETWEEN(1,3)],
			["itm", "Toolkit", RANDOM_BETWEEN(1,3)],
			["itm", ["rhs_acc_ekp1", "rhs_acc_ekp8_02", "rhs_acc_pkas", "rhsusf_acc_rm05", "rhsusf_acc_compm4"], RANDOM_BETWEEN(3,4)],
			["itm", ["rhsusf_acc_SR25S", "rhsusf_acc_nt4_black", "rhsusf_acc_SFMB556", "rhsusf_acc_SF3P556", "rhs_acc_pbs1", ["rhsusf_acc_ARDEC_M240", "muzzle_snds_338_green", "muzzle_snds_338_sand"], ["muzzle_snds_93mmg", "muzzle_snds_93mmg_tan"]], RANDOM_BETWEEN(2,3)],
			["wep", [["rhs_weap_mk18", "rhs_weap_m4", "rhs_weap_m4a1"], ["rhs_weap_ak74m", "rhs_weap_ak74m"]], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_m249_pip_L", "rhs_weap_pkm"], RANDOM_BETWEEN(1,2), RANDOM_BETWEEN(2,4)],
			["wep", ["rhs_weap_m14ebrri", "rhs_weap_m38_rail"], RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(4,8)],
			["wep", "rhs_weap_sr25", RANDOM_BETWEEN(0,2), RANDOM_BETWEEN(3,5)],
			["wep", ["rhsusf_weap_glock17g4", "rhs_weap_pp2000_folded", "rhsusf_weap_m1911a1", "rhsusf_weap_glock17g4"], RANDOM_BETWEEN(1,3), RANDOM_BETWEEN(4,8)],
			["mag", "rhs_mag_30Rnd_556x45_M855_Stanag", RANDOM_BETWEEN(5,10)],
			["mag", "rhs_30Rnd_545x39_AK", RANDOM_BETWEEN(5,10)],
			["mag", "rhsusf_100Rnd_762x51", RANDOM_BETWEEN(5,10)],
			["mag", "rhs_100Rnd_762x54mmR", RANDOM_BETWEEN(5,10)],
			["mag", "rhsusf_20Rnd_762x51_m118_special_Mag", RANDOM_BETWEEN(5,10)]
		];
	};
	case "mission_Main_A3snipers":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["lerca_1200_tan", "lerca_1200_tan", "rhsusf_lrf_Vector21"], 1, 1],
			["wep", ["rhs_weap_sr25", "rhs_weap_m14ebrri", "rhs_weap_m38_rail", "arifle_SPAR_03_blk_F"], RANDOM_BETWEEN(1,4), RANDOM_BETWEEN(5,10)],
			["wep", ["rhs_weap_m24sws_blk", "rhs_weap_svdp_npz"], RANDOM_BETWEEN(0,3), RANDOM_BETWEEN(5,10)],
			["itm", ["rhsusf_acc_LEUPOLDMK4_2", "rhsusf_acc_LEUPOLDMK4", "rhsusf_acc_premier_low"], RANDOM_BETWEEN(2,4)],
			["itm", ["rhs_acc_pso1m21", "rhs_acc_pso1m2", "rhs_acc_rakurspm", "rhs_acc_dh520x56", "rhsusf_acc_spectedr", "rhs_acc_dh520x56"], RANDOM_BETWEEN(1,3)],
			["itm", ["rhsusf_acc_anpas13gv1", "rhsusf_acc_premier_anpvs27", "rhsusf_acc_anpvs27"], RANDOM_ODDS(0.5)], // o shit waddup!!
			["itm", ["bipod_01_F_blk", "bipod_01_F_mtp", "bipod_01_F_snd", "bipod_02_F_blk", "bipod_02_F_hex", "bipod_02_F_tan", "bipod_03_F_blk", "bipod_03_F_oli"], RANDOM_BETWEEN(1,4)],
			["itm", ["rhs_acc_pbs1", ["rhsusf_acc_SR25S", "rhsusf_acc_ARDEC_M240", "rhsusf_acc_SF3P556"], ["rhsusf_acc_SFMB556", "rhsusf_acc_nt4_black"]], RANDOM_BETWEEN(1,4)]
		];
	};
		case "airdrop_DLC_Rifles":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["srifle_DMR_03_multicam_F", "srifle_DMR_02_sniper_F", "srifle_DMR_05_hex_F", "srifle_DMR_04_Tan_F"], 2, 4],
			["itm", ["V_RebreatherB", "V_PlateCarrierIAGL_dgtl", "V_TacVest_camo", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(1,8)],
			["itm", ["B_Carryall_mcamo", "B_Kitbag_mcamo"], RANDOM_BETWEEN(2,5)],
			["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], 3, 3]
		];
	};
	case "airdrop_DLC_LMGs":
	{
		_boxItems =
		[
			// Item type, Item class(es), # of items, # of magazines per weapon
			["wep", ["MMG_02_black_F", "MMG_01_hex_F"], 2, 5],
			["itm", ["V_RebreatherB", "V_PlateCarrierIAGL_dgtl", "V_TacVest_camo", "V_PlateCarrierGL_rgr"], RANDOM_BETWEEN(1,8)],
			["itm", ["B_Carryall_mcamo", "B_Kitbag_mcamo"], RANDOM_BETWEEN(2,5)],
			["itm", ["bipod_01_F_blk", "bipod_02_F_hex"], 2, 3]

		];
	};
};

[_box, _boxItems] call processItems;

if (["A3W_artilleryStrike"] call isConfigOn) then
{
	if (random 1.0 < ["A3W_artilleryCrateOdds", 1/10] call getPublicVar) then
	{
		_box setVariable ["artillery", 1, true];
	};
};
