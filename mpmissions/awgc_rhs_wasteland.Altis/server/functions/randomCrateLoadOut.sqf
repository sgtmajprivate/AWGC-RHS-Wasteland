/*
	----------------------------------------------------------------------------------------------
	
	Copyright © 2016 soulkobk (soulkobk.blogspot.com)

	This program is free software: you can redistribute it and/or modify
	it under the terms of the GNU Affero General Public License as
	published by the Free Software Foundation, either version 3 of the
	License, or (at your option) any later version.

	This program is distributed in the hope that it will be useful,
	but WITHOUT ANY WARRANTY; without even the implied warranty of
	MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
	GNU Affero General Public License for more details.

	You should have received a copy of the GNU Affero General Public License
	along with this program. If not, see <http://www.gnu.org/licenses/>.

	----------------------------------------------------------------------------------------------
	
	Name: randomCrateLoadOut.sqf
	Version: 1.0.1
	Author: soulkobk (soulkobk.blogspot.com)
	Creation Date: 4:40 PM 07/10/2016
	Modification Date: 2:20 PM 10/10/2016
	
	Description:
	For use with A3Wasteland 1.3x mission (A3Wasteland.com). This script is a replacement mission
	crate load-out script that will randomly select and place items in to mission crates.
	
	Place this script in the mission file, in path \server\functions\randomCrateLoadOut.sqf
	and edit \server\functions\serverCompile.sqf and place...	
	randomCrateLoadOut = [_path, "randomCrateLoadOut.sqf"] call mf_compile;
	underneath the line...
	_path = "server\functions";
	
	It will totally replace the A3Wasteland function 'fn_refillbox'. You will need to search and
	replace the text/function in all your mission scripts in order to get this script to function.
	See Example: below.

	The custom function will disable damage to the crate, lock the crate until mission is completed,
	and randomly fill the crate with loot. To edit the script and how it functions, see the code
	below from lines 64 to 1109. Some loot is commented out by default (OP items), I have left
	them in should you want them in your A3Wasteland mission.

	Parameter(s): <object> call randomCrateLoadOut;

	Example: (missions)
	_box1 = createVehicle ["Box_NATO_WpsSpecial_F", _missionPos, [], 5, "None"];
	_box1 setDir random 360;
	// [_box1, "mission_USSpecial"] call fn_refillbox; // <- this line is now null
	_box1 call randomCrateLoadOut; // new randomCrateLoadOut function call
	
	Example: (outposts)
	["Box_FIA_Wps_F",[-5,4.801,0],90,{_this call randomCrateLoadOut;}]
	
	Change Log:
	1.0.0 -	original base script.
	1.0.1 -	description/config changes for a clearer understanding of how this script functions and
			what function (fn_refillbox) it replaces.

	----------------------------------------------------------------------------------------------
*/

if !(isServer) exitWith {}; // DO NOT DELETE THIS LINE!

// #define __DEBUG__

_backPacks =
[
	"rhs_sidor",
	"B_AssaultPack_blk",
	"B_AssaultPack_cbr",
	"B_AssaultPack_khk",
	"rhsusf_falconii",
	"rhsusf_falconii_coy",
	"rhsusf_falconii_mc",
	"rhsusf_assault_eagleaiii_coy",
	"rhsusf_assault_eagleaiii_ocp",
	"rhsusf_assault_eagleaiii_ucp",
	"rhs_assault_umbts",
	"rhs_assault_umbts_engineer_empty",
	"B_Kitbag_cbr",
	"B_Kitbag_rgr",
	"B_Kitbag_mcamo",
	"rhssaf_kitbag_digital",
	"rhssaf_kitbag_md2camo",
	"rhssaf_kitbag_smb",
	"rhsgref_hidf_alicepack",
	"rhsgref_ttsko_alicepack",
	"rhsgref_wdl_alicepack",
	"rhssaf_alice_md2camo",
	"rhssaf_alice_smb",
	"B_ViperLightHarness_blk_F",
	"B_ViperLightHarness_hex_F",
	"B_ViperLightHarness_khk_F",
	"B_ViperLightHarness_oli_F",
	"B_ViperHarness_blk_F",
	"B_ViperHarness_hex_F",
	"B_ViperHarness_khk_F",
	"B_ViperHarness_oli_F",
	"B_Carryall_khk",
	"B_Carryall_mcamo",
	"B_Carryall_oli",
	"B_Carryall_oucamo",
	"B_Carryall_cbr",
	"B_Carryall_ghex_F",
	"B_Bergen_hex_F",
	"B_Bergen_mcamo_F"
];

_binoculars =
[
	"rhsusf_ANPVS_14",
	"rhsusf_ANPVS_15",
	"Binocular",
	"Leupold_Mk4",
	"Rangefinder",
	"lerca_1200_tan",
	"rhsusf_lrf_Vector21",
	"Laserdesignator_03"
];

_bipods =
[
	"bipod_01_F_blk", // Bipod (Black) [NATO] BIPOD"
	"bipod_01_F_khk", // Bipod (Khaki) [NATO] BIPOD"
	"bipod_01_F_mtp", // Bipod (MTP) [NATO] BIPOD"
	"bipod_01_F_snd", // Bipod (Sand) [NATO] BIPOD"
	"bipod_02_F_blk", // Bipod (Black) [CSAT] BIPOD"
	"bipod_02_F_tan", // Bipod (Tan) [CSAT] BIPOD"
	"bipod_03_F_blk", // Bipod (Black) [AAF] BIPOD"
	"bipod_03_F_oli", // Bipod (Olive) [AAF] BIPOD"
	"rhsusf_acc_harris_bipod",		// RHS
	"rhs_acc_harris_swivel"		// RHS
];

_headGear =
[
	// RHS Helmets USF (Blue)
	"rhsusf_ach_bare",
	"rhsusf_ach_helmet_M81",
	"rhsusf_ach_bare_tan_ess",
	"rhsusf_ach_helmet_ucp",
	"rhsusf_ach_helmet_ocp",
	"rhsusf_opscore_bk",
	"rhsusf_opscore_mc_cover_pelt",
	"rhsusf_opscore_rg_cover",
	"rhsusf_protech_helmet_ess",
	"rhsusf_mich_bare",
	"rhsusf_mich_bare_norotos",
	"rhsusf_mich_bare_semi",
	"rhsusf_mich_bare_norotos_arc_semi",
	"rhsusf_mich_bare_tan",
	"rhsusf_mich_helmet_marpatd_headset",
	"rhsusf_mich_helmet_marpatwd_headset",
	
	// RHS Helmets (Red)
	"rhs_ssh68",
	"rhs_6b27m_green_ess_bala",
	"rhs_6b26_ess",
	"rhs_6b26_ess_green",
	"rhs_altyn_novisor_ess_bala",
	"rhs_altyn_visordown",
	
	// RHS Helmets Brown (SAF)
	"rhssaf_helmet_m59_85_nocamo",
	"rhssaf_helmet_m59_85_oakleaf",
	"rhssaf_helmet_m97_md2camo",
	"rhssaf_helmet_m97_black_nocamo_black_ess_bare",
	"rhssaf_helmet_m97_digital",
	"rhssaf_helmet_m97_digital_black_ess_bare",
	"rhssaf_helmet_m97_oakleaf_black_ess_bare",
	"rhssaf_helmet_m97_olive_nocamo_black_ess_bare",
	"rhssaf_helmet_m97_woodland_black_ess_bare",
	
	// RHS Helmets Green (Gref)
	"rhsgref_helmet_M1_bare",
	"rhsgref_helmet_pasgt_3color_desert_rhino",
	"rhsgref_helmet_pasgt_altis_lizard",
	"rhsgref_helmet_pasgt_erdl_rhino",
	"rhsgref_helmet_pasgt_flecktarn",
	"rhsgref_helmet_pasgt_olive",
	"rhsgref_helmet_pasgt_woodland_rhino",
	"rhsgref_ssh68_emr",
	"rhsgref_ssh68_vsr",
	"rhsgref_ssh68_ttsko_digi",
	"rhsgref_ssh68_ttsko_forest",
	"rhsgref_ssh68_ttsko_mountain",
	"rhsgref_ssh68_ttsko_dark",
	
	// RHS Boonie Hats
	"rhs_Booniehat_m81",
	"rhs_booniehat2_marpatd",
	"rhs_booniehat2_marpatwd",
	"rhs_Booniehat_ocp",
	"rhs_Booniehat_ucp",
	"rhssaf_booniehat_digital",
	"rhssaf_booniehat_md2camo",
	"rhssaf_booniehat_woodland",
	
	// Vanilla
	"H_CrewHelmetHeli_B", // Heli Crew Helmet [NATO]
	"H_CrewHelmetHeli_I", // Heli Crew Helmet [AAF]
	"H_CrewHelmetHeli_O", // Heli Crew Helmet [CSAT]
	"H_HelmetCrew_B", // Crew Helmet [NATO]
	"H_HelmetCrew_I", // Crew Helmet [AAF]
	"H_HelmetCrew_O", // Crew Helmet [CSAT]
	"H_HelmetLeaderO_ocamo", // Defender Helmet (Hex)
	"H_HelmetLeaderO_oucamo", // Defender Helmet (Urban)
	"H_HelmetO_ocamo", // Protector Helmet (Hex)
	"H_HelmetO_oucamo", // Protector Helmet (Urban)
	"H_HelmetSpecO_ocamo", // Assassin Helmet (Hex)
	"H_PilotHelmetFighter_B", // Pilot Helmet [NATO]
	"H_PilotHelmetFighter_I", // Pilot Helmet [AAF]
	"H_PilotHelmetFighter_O", // Pilot Helmet [CSAT]
	"H_PilotHelmetHeli_B", // Heli Pilot Helmet [NATO]
	"H_PilotHelmetHeli_I", // Heli Pilot Helmet [AAF]
	"H_PilotHelmetHeli_O", // Heli Pilot Helmet [CSAT]
	"H_MilCap_rucamo",
	"H_MilCap_mcamo",
	"H_MilCap_dgtl",
	"H_Watchcap_blk",
	"H_Watchcap_cbr",
	"H_Watchcap_khk",
	"H_Watchcap_sgg",
	"H_Watchcap_camo",
	"H_Booniehat_dgtl",
	"H_Booniehat_khk_hs",
	"H_Booniehat_khk",
	"H_Booniehat_mcamo",
	"H_Booniehat_oli",
	"H_Booniehat_tan",
	"H_Cap_usblack",
	"H_Cap_tan_specops_US",
	"H_Cap_blk_Raven",
	"H_Shemag_olive",
	"H_Shemag_olive_hs",
	"H_ShemagOpen_tan",
	"H_ShemagOpen_khk",
	"H_Shemag_tan"
];

_items =
[
	"B_UavTerminal", // UAV Terminal [NATO]
	"I_UavTerminal", // UAV Terminal [AAF]
	"O_UavTerminal", // UAV Terminal [CSAT]
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"FirstAidKit", // First Aid Kit
	"ItemGPS", // GPS
	"ItemGPS",
	"ItemGPS",
	"ItemGPS",
	"ItemGPS",
	"ItemGPS",
	"ItemGPS",
	"Medikit", // Medikit
	"Medikit", // Medikit
	"Medikit", // Medikit
	"Medikit", // Medikit
	"Medikit", // Medikit
	"ToolKit",// Toolkit
	"ToolKit",// Toolkit
	"ToolKit",// Toolkit
	"ToolKit",// Toolkit
	"ToolKit"// Toolkit
];

_launcherWeapons =
[
	// "launch_B_Titan_F", // Titan MPRL (Sand)
	// "launch_B_Titan_short_F", // Titan MPRL Compact (Sand)
	// "launch_B_Titan_short_tna_F", // Titan MPRL Compact (Tropic)
	// "launch_B_Titan_tna_F", // Titan MPRL (Tropic)
	// "launch_I_Titan_F", // Titan MPRL (Digital)
	// "launch_I_Titan_short_F", // Titan MPRL Compact (Olive)
	// "launch_NLAW_F", // PCML
	// "launch_O_Titan_F", // Titan MPRL (Hex)
	// "launch_O_Titan_ghex_F", // Titan MPRL (Green Hex)
	// "launch_O_Titan_short_F", // Titan MPRL Compact (Coyote)
	// "launch_O_Titan_short_ghex_F", // Titan MPRL Compact (Green Hex)
	// "launch_RPG32_F", // RPG-42 Alamut
	// "launch_RPG32_ghex_F", // RPG-42 Alamut (Green Hex)
	// "launch_RPG7_F" // RPG-7
	"rhs_weap_M136",
	"rhs_weap_M136_hedp",
	"rhs_weap_M136_hp",
	"rhs_weap_rpg7",
	"rhs_weap_igla",
	"rhs_weap_fim92",
	"rhs_weap_maaws",
	"rhs_weap_smaw_green",
	"rhs_weap_fgm148",
	
	// Tanks DLC
	"launch_MRAWS_green_F",		// Tanks DLC
	"launch_MRAWS_sand_F",		// Tanks DLC
	"launch_O_Vorona_green_F",		// Tanks DLC
	"MineDetector" // Mine Detector
];

_magazines =
[	
	"rhsusf_8Rnd_00Buck",
	"rhsgref_10rnd_765x17_vz61",
	"rhsgref_20rnd_765x17_vz61",
	"rhs_mag_9x18_8_57N181S",
	"rhs_mag_9x19_17",
	"rhsusf_mag_17Rnd_9x19_FMJ",
	"rhsusf_mag_17Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_JHP",
	"rhsusf_mag_15Rnd_9x19_FMJ",
	"rhs_mag_9x19mm_7n31_20",
	"rhs_mag_9x19mm_7n31_44",
	"rhsusf_mag_7x45acp_MHP",
	"rhsusf_mag_40Rnd_46x30_FMJ",
	"rhsusf_mag_40Rnd_46x30_JHP",
	"rhsusf_mag_40Rnd_46x30_AP",
	"rhs_mag_30Rnd_556x45_M855_Stanag",
	"rhssaf_30rnd_556x45_EPR_G36",
	"rhssaf_100rnd_556x45_EPR_G36",
	"rhs_20rnd_9x39mm_SP5",
	"rhs_30Rnd_545x39_AK",
	"rhsusf_5Rnd_762x51_m118_special_Mag",
	"rhsusf_10Rnd_762x51_m118_special_Mag",
	"rhsusf_20Rnd_762x51_m118_special_Mag",
	"rhsusf_10Rnd_762x51_m993_Mag",
	"rhsusf_100Rnd_762x51",
	"rhsusf_100Rnd_762x51_m993",
	"rhsusf_100Rnd_762x51_m61_ap",
	"rhsgref_5Rnd_762x54_m38",
	"rhs_10Rnd_762x54mmR_7N1",
	"rhs_100Rnd_762x54mmR",
	"rhs_100Rnd_762x54mmR_green",
	"rhs_100Rnd_762x54mmR_7N13",
	"rhs_100Rnd_762x54mmR_7N26",
	"rhs_100Rnd_762x54mmR_7BZ3",
	"rhsgref_10Rnd_792x57_m76",
	"rhsusf_5Rnd_300winmag_xm2010",
	"rhsusf_mag_10Rnd_STD_50BMG_M33",
	"rhsusf_mag_10Rnd_STD_50BMG_mk211",
	"rhs_rpg7_OG7V_mag",
	"rhs_rpg7_type69_airburst_mag",
	"rhs_rpg7_PG7V_mag",
	"rhs_rpg7_PG7VL_mag",
	"rhs_rpg7_TBG7V_mag",
	"rhs_rpg7_PG7VR_mag",
	"rhs_mag_maaws_HEDP",
	"rhs_mag_maaws_HE",
	"rhs_mag_maaws_HEAT",
	"rhs_mag_smaw_HEAA",
	"rhs_mag_smaw_HEDP",
	"rhs_mag_9k38_rocket",
	"rhs_fim92_mag",
	"rhs_fgm148_magazine_AT",
	
	// RHS GL Ammo
	"rhs_mag_m4009",
	"rhs_mag_m576",
	"rhs_mag_M441_HE",
	"rhs_mag_M397_HET",
	"rhs_mag_M433_HEDP",
	"rhsusf_mag_6Rnd_M441_HE",
	
	// Tanks DLC
	"MRAWS_HEAT_F",		// Tanks DLC
	"MRAWS_HE_F",		// Tanks DLC
	"Vorona_HEAT",		// Tanks DLC
	"Vorona_HE",		// Tanks DLC
	
	// Vanilla
	"100Rnd_580x42_Mag_F", // 5.8 mm 100Rnd Mag
	"100Rnd_580x42_Mag_Tracer_F", // 5.8 mm 100Rnd Tracer (Green) Mag
	// "100Rnd_65x39_caseless_mag", // 6.5 mm 100Rnd Mag
	// "100Rnd_65x39_caseless_mag_Tracer", // 6.5 mm 100Rnd Tracer (Red) Mag
	// "10Rnd_127x54_Mag", // 12.7mm 10Rnd Mag
	"10Rnd_338_Mag", // .338 LM 10Rnd Mag
	"10Rnd_50BW_Mag_F", // .50 BW 10Rnd Caseless Mag
	"10Rnd_762x51_Mag", // 7.62mm 10Rnd Mag
	"10Rnd_762x54_Mag", // 7.62mm 10Rnd Mag
	"10Rnd_93x64_DMR_05_Mag", // 9.3mm 10Rnd Mag
	"10Rnd_9x21_Mag", // 9 mm 10Rnd Mag
	"11Rnd_45ACP_Mag", // .45 ACP 11Rnd Mag
	"130Rnd_338_Mag", // .338 NM 130Rnd Belt
	"150Rnd_556x45_Drum_Mag_F", // 5.56 mm 150Rnd Mag
	"150Rnd_556x45_Drum_Mag_Tracer_F", // 5.56 mm 150Rnd Tracer (Red) Mag
	"150Rnd_762x51_Box", // 7.62 mm 150Rnd Box
	"150Rnd_762x51_Box_Tracer", // 7.62 mm 150Rnd Tracer (Green) Box
	"150Rnd_762x54_Box", // 7.62 mm 150Rnd Box
	"150Rnd_762x54_Box_Tracer", // 7.62 mm 150Rnd Tracer (Green) Box
	"150Rnd_93x64_Mag", // 9.3mm 150Rnd Belt
	"16Rnd_9x21_green_Mag", // 9 mm 16Rnd Reload Tracer (Green) Mag
	"16Rnd_9x21_Mag", // 9 mm 16Rnd Mag
	"16Rnd_9x21_red_Mag", // 9 mm 16Rnd Reload Tracer (Red) Mag
	"16Rnd_9x21_yellow_Mag", // 9 mm 16Rnd Reload Tracer (Yellow) Mag
	"1Rnd_HE_Grenade_shell", // 40 mm HE Grenade Round
	"1Rnd_SmokeBlue_Grenade_shell", // Smoke Round (Blue)
	"1Rnd_SmokeGreen_Grenade_shell", // Smoke Round (Green)
	"1Rnd_SmokeOrange_Grenade_shell", // Smoke Round (Orange)
	"1Rnd_SmokePurple_Grenade_shell", // Smoke Round (Purple)
	"1Rnd_SmokeRed_Grenade_shell", // Smoke Round (Red)
	"1Rnd_SmokeYellow_Grenade_shell", // Smoke Round (Yellow)
	"1Rnd_Smoke_Grenade_shell", // Smoke Round (White)
	"200Rnd_556x45_Box_F", // 5.56 mm 200Rnd Reload Tracer (Yellow) Box
	"200Rnd_556x45_Box_Red_F", // 5.56 mm 200Rnd Reload Tracer (Red) Box
	"200Rnd_556x45_Box_Tracer_F", // 5.56 mm 200Rnd Tracer (Yellow) Box
	"200Rnd_556x45_Box_Tracer_Red_F", // 5.56 mm 200Rnd Tracer (Red) Box
	"200Rnd_65x39_cased_Box", // 6.5 mm 200Rnd Belt
	"200Rnd_65x39_cased_Box_Tracer", // 6.5 mm 200Rnd Belt Tracer (Yellow)
	"20Rnd_556x45_UW_mag", // 5.56 mm 20Rnd Dual Purpose Mag
	"20Rnd_650x39_Cased_Mag_F", // 6.5 mm 20Rnd Mag
	"20Rnd_762x51_Mag", // 7.62 mm 20Rnd Mag
	"30Rnd_45ACP_Mag_SMG_01", // .45 ACP 30Rnd Vermin Mag
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Green", // .45 ACP 30Rnd Vermin Tracers (Green) Mag
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Red", // .45 ACP 30Rnd Vermin Tracers (Red) Mag
	"30Rnd_45ACP_Mag_SMG_01_Tracer_Yellow", // .45 ACP 30Rnd Vermin Tracers (Yellow) Mag
	"30Rnd_545x39_Mag_F", // 5.45 mm 30Rnd Reload Tracer (Yellow) Mag
	"30Rnd_545x39_Mag_Green_F", // 5.45 mm 30Rnd Reload Tracer (Green) Mag
	"30Rnd_545x39_Mag_Tracer_F", // 5.45 mm 30Rnd Tracer (Yellow) Mag
	"30Rnd_545x39_Mag_Tracer_Green_F", // 5.45 mm 30Rnd Tracer (Green) Mag
	"30Rnd_556x45_Stanag", // 5.56 mm 30rnd STANAG Reload Tracer (Yellow) Mag
	"30Rnd_556x45_Stanag_green", // 5.56 mm 30rnd STANAG Reload Tracer (Green) Mag
	"30Rnd_556x45_Stanag_red", // 5.56 mm 30rnd STANAG Reload Tracer (Red) Mag
	"30Rnd_556x45_Stanag_Tracer_Green", // 5.56 mm 30rnd Tracer (Green) Mag
	"30Rnd_556x45_Stanag_Tracer_Red", // 5.56 mm 30rnd Tracer (Red) Mag
	"30Rnd_556x45_Stanag_Tracer_Yellow", // 5.56 mm 30rnd Tracer (Yellow) Mag
	"30Rnd_580x42_Mag_F", // 5.8 mm 30Rnd Mag
	"30Rnd_580x42_Mag_Tracer_F", // 5.8 mm 30Rnd Tracer (Green) Mag
	"30Rnd_65x39_caseless_green", // 6.5mm 30Rnd Caseless Mag
	"30Rnd_65x39_caseless_green_mag_Tracer", // 6.5 mm 30Rnd Tracer (Green) Caseless Mag
	"30Rnd_65x39_caseless_mag", // 6.5 mm 30Rnd STANAG Mag
	"30Rnd_65x39_caseless_mag_Tracer", // 6.5 mm 30Rnd Tracer (Red) Mag
	"30Rnd_762x39_Mag_F", // 7.62 mm 30Rnd Reload Tracer (Yellow) Mag
	"30Rnd_762x39_Mag_Green_F", // 7.62 mm 30Rnd Reload Tracer (Green) Mag
	"30Rnd_762x39_Mag_Tracer_F", // 7.62 mm 30Rnd Tracer (Yellow) Mag
	"30Rnd_762x39_Mag_Tracer_Green_F", // 7.62 mm 30Rnd Tracer (Green) Mag
	"30Rnd_9x21_Green_Mag", // 9 mm 30Rnd Reload Tracer (Green) Mag
	"30Rnd_9x21_Mag", // 9 mm 30Rnd Mag
	"30Rnd_9x21_Mag_SMG_02", // 9 mm 30Rnd Mag
	"30Rnd_9x21_Mag_SMG_02_Tracer_Green", // 9 mm 30Rnd Reload Tracer (Green) Mag
	"30Rnd_9x21_Mag_SMG_02_Tracer_Red", // 9 mm 30Rnd Reload Tracer (Red) Mag
	"30Rnd_9x21_Mag_SMG_02_Tracer_Yellow", // 9 mm 30Rnd Reload Tracer (Yellow) Mag
	"30Rnd_9x21_Red_Mag", // 9 mm 30Rnd Reload Tracer (Red) Mag
	"30Rnd_9x21_Yellow_Mag", // 9 mm 30Rnd Reload Tracer (Yellow) Mag
	"3Rnd_HE_Grenade_shell", // 40 mm 3Rnd HE Grenade
	"3Rnd_SmokeBlue_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Blue)
	"3Rnd_SmokeGreen_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Green)
	"3Rnd_SmokeOrange_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Orange)
	"3Rnd_SmokePurple_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Purple)
	"3Rnd_SmokeRed_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Red)
	"3Rnd_SmokeYellow_Grenade_shell", // 3Rnd 3GL Smoke Rounds (Yellow)
	"3Rnd_Smoke_Grenade_shell", // 3Rnd 3GL Smoke Rounds (White)
	"3Rnd_UGL_FlareCIR_F", // 3Rnd 3GL Flares (IR)
	"3Rnd_UGL_FlareGreen_F", // 3Rnd 3GL Flares (Green)
	"3Rnd_UGL_FlareRed_F", // 3Rnd 3GL Flares (Red)
	"3Rnd_UGL_FlareWhite_F", // 3Rnd 3GL Flares (White)
	"3Rnd_UGL_FlareYellow_F", // 3Rnd 3GL Flares (Yellow)
	"5Rnd_127x108_APDS_Mag", // 12.7mm 5Rnd APDS Mag
	"5Rnd_127x108_Mag", // 12.7 mm 5Rnd Mag
	"6Rnd_45ACP_Cylinder", // .45 ACP 6Rnd Cylinder
	"6Rnd_GreenSignal_F", // 6Rnd Signal Cylinder (Green)
	"6Rnd_RedSignal_F", // 6Rnd Signal Cylinder (Red)
	"7Rnd_408_Mag", // .408 7Rnd LRR Mag
	"9Rnd_45ACP_Mag", // .45 ACP 9Rnd Mag
	"FlareGreen_F", // Flare (Green)
	"FlareRed_F", // Flare (Red)
	"FlareWhite_F", // Flare (White)
	"FlareYellow_F", // Flare (Yellow)
	//"Laserbatteries", // Designator Batteries
	//"NLAW_F", // PCML Missile
	//"RPG32_F", // RPG-42 Rocket
	//"RPG32_HE_F", // RPG-42 HE Rocket
	//"RPG7_F", // PG-7VM HEAT Grenade
	//"Titan_AA", // Titan AA Missile
	//"Titan_AP", // Titan AP Missile
	//"Titan_AT", // Titan AT Missile
	"UGL_FlareCIR_F", // Flare Round (IR)
	"UGL_FlareGreen_F", // Flare Round (Green)
	"UGL_FlareRed_F", // Flare Round (Red)
	"UGL_FlareWhite_F", // Flare Round (White)
	"UGL_FlareYellow_F" // Flare Round (Yellow)
];

_throwables =
[
	"rhs_mag_an_m14_th3",
	"rhs_mag_an_m8hc",
	"rhs_mag_f1",
	"rhs_mag_fakel",
	"rhs_mag_m67",
	"rhs_mag_m18_yellow",
	"rhs_mag_m18_red",
	"rhs_mag_m18_purple",
	"rhs_mag_m18_green",
	"rhs_mag_m7a3_cs",
	"rhs_mag_mk84",
	"rhs_mag_mk3a2",
	"rhs_mag_rgo",
	"rhs_mag_rgn",
	"rhs_mag_rgd5",
	"rhs_mag_rdg2_black",
	"rhs_mag_rdg2_white",
	"rhs_mag_nspd",
	"rhs_mag_nspn_green",
	"rhs_mag_nspn_red",
	"rhs_mag_nspn_yellow",
	"Chemlight_blue", // Chemlight (Blue)
	"Chemlight_green", // Chemlight (Green)
	"Chemlight_red", // Chemlight (Red)
	"Chemlight_yellow" // Chemlight (Yellow)
];

_muzzles =
[
	"muzzle_snds_338_black", // Sound Suppressor (.338, Black)
	"muzzle_snds_338_green", // Sound Suppressor (.338, Green)
	"muzzle_snds_338_sand", // Sound Suppressor (.338, Sand)
	"muzzle_snds_58_blk_F", // Stealth Sound Suppressor (5.8 mm, Black)
	"muzzle_snds_58_ghex_F", // Stealth Sound Suppressor (5.8 mm, Green Hex)
	"muzzle_snds_58_hex_F", // Sound Suppressor (5.8 mm, Hex)
	"muzzle_snds_65_TI_blk_F", // Stealth Sound Suppressor (6.5 mm, Black)
	"muzzle_snds_65_TI_ghex_F", // Stealth Sound Suppressor (6.5 mm, Green Hex)
	"muzzle_snds_65_TI_hex_F", // Stealth Sound Suppressor (6.5 mm, Hex)
	"muzzle_snds_93mmg", // Sound Suppressor (9.3mm, Black)
	"muzzle_snds_93mmg_tan", // Sound Suppressor (9.3mm, Tan)
	"muzzle_snds_acp", // Sound Suppressor (.45 ACP)
	"muzzle_snds_B", // Sound Suppressor (7.62 mm)
	"muzzle_snds_B_khk_F", // Sound Suppressor (7.62 mm, Khaki)
	"muzzle_snds_B_snd_F", // Sound Suppressor (7.62 mm, Sand)
	"muzzle_snds_H", // Sound Suppressor (6.5 mm)
	"muzzle_snds_H_khk_F", // Sound Suppressor (6.5 mm, Khaki)
	"muzzle_snds_H_snd_F", // Sound Suppressor (6.5 mm, Sand)
	"muzzle_snds_L", // Sound Suppressor (9 mm)
	"muzzle_snds_M", // Sound Suppressor (5.56 mm)
	"muzzle_snds_m_khk_F", // Sound Suppressor (5.56 mm, Khaki)
	"muzzle_snds_m_snd_F", // Sound Suppressor (5.56 mm, Sand)
	
	// RHS
	"rhs_acc_dtk",
	"rhs_acc_dtk1",
	"rhs_acc_dtk2",
	"rhs_acc_dtk3",
	"rhs_acc_ak5",
	"rhs_acc_dtk4short",
	"rhs_acc_tgpa",
	"rhsusf_acc_SF3P556",
	"rhsusf_acc_SFMB556",
	"rhsusf_acc_nt4_black",
	"rhsusf_acc_nt4_tan",
	"rhsusf_acc_rotex5_grey",
	"rhsusf_acc_SR25S",
	"rhsusf_acc_SR25S_d",
	"rhsusf_acc_SR25S_wd",
	"rhsusf_acc_M2010S_d",
	"rhsusf_acc_M2010S_sa",
	"rhsusf_acc_M2010S_wd",
	"rhsusf_acc_ARDEC_M240",
	"rhs_acc_pbs1"
];

_optics =
[
	// Vanilla
	"optic_AMS", // AMS (Black)
	"optic_AMS_khk", // AMS (Khaki)
	"optic_AMS_snd", // AMS (Sand)
	"optic_DMS", // DMS
	"optic_DMS_ghex_F", // DMS (Green Hex)
	"optic_LRPS", // LRPS
	"optic_LRPS_ghex_F", // LRPS (Green Hex)
	"optic_LRPS_tna_F", // LRPS (Tropic)
	
	// RHS
	"rhs_optic_maaws",
	"rhs_acc_ekp1",
	"rhs_acc_ekp8_02",
	"rhs_acc_pkas",
	"rhs_acc_pgo7v",
	"rhs_acc_pgo7v2",
	"rhs_acc_pgo7v3",
	"rhs_acc_1p29",
	"rhs_acc_1p63",
	"rhs_acc_1p78",
	"rhs_acc_1pn93_1",
	"rhs_acc_1pn93_2",
	"rhs_acc_nita",
	"rhs_acc_1p87",
	"rhsusf_acc_T1_low",
	"rhsusf_acc_rm05",
	"rhsusf_acc_eotech",
	"rhsusf_acc_eotech_xps3",
	"rhsusf_acc_eotech_552",
	"rhsusf_acc_compm4",
	"rhsusf_acc_spectedr",
	"rhsusf_acc_ACOG_USMC",
	"rhsusf_acc_acog",
	"rhsusf_acc_acog_d",
	"rhsusf_acc_acog_mdo",
	"rhsusf_acc_g33_t1",
	"rhs_acc_rakurspm",
	"rhs_acc_pso1m2",
	"rhs_acc_pso1m21",
	"rhs_acc_dh520x56",
	"rhsusf_acc_premier_low",
	"rhsusf_acc_LEUPOLDMK4",
	"rhsusf_acc_LEUPOLDMK4_2",
	"rhsusf_acc_ACOG_anpvs27",
	"rhsusf_acc_anpvs27",
	"rhsusf_acc_premier_anpvs27",
	"rhsusf_acc_anpas13gv1"
];

_primaryWeapons =
[
	// RHS Assault Rifles
	"rhs_weap_m16a4_carryhandle_M203",
	"rhs_weap_m4_m203",
	"rhs_weap_m4_m203S",
	"rhs_weap_m4_m320",
	"rhs_weap_m4a1_d",
	"rhs_weap_m4a1_wd",
	"rhs_weap_m4a1_mstock",
	"rhs_weap_m4a1_d_mstock",
	"rhs_weap_m4a1_wd_mstock",
	"rhs_weap_m4a1_blockII_d",
	"rhs_weap_m4a1_blockII_wd",
	"rhs_weap_m4a1_m203s",
	"rhs_weap_m4a1_m203s_d",
	"rhs_weap_m4a1_m320",
	"rhs_weap_hk416d145",
	"rhs_weap_hk416d145_m320",
	"rhs_weap_M590_8RD",
	"rhs_weap_mk18_bk",
	"rhs_weap_asval",
	"rhs_weap_asval_npz",
	"rhs_weap_ak74",
	"rhs_weap_ak74m",
	"rhs_weap_ak74m_npz",
	"rhs_weap_ak74m_desert",
	"rhs_weap_ak74m_desert_npz",
	"rhs_weap_hk416d10",
	"rhs_weap_hk416d10_m320",
	"rhs_weap_g36c",
	"rhs_weap_mk18",
	"rhs_weap_mk18_d",
	"rhs_weap_mk18_wd",
	"rhs_weap_m4",
	"rhs_weap_m4a1",
	"rhs_weap_m4a1_d",
	"rhs_weap_m4a1_wd",
	"rhs_weap_m4a1_blockII_d",
	"rhs_weap_m4a1_blockII_wd",
	"rhs_weap_m16a4_pmag",
	"rhs_weap_m4a1_blockII_bk",
	"rhs_weap_vss",
	"rhs_weap_m14ebrri",
	"rhs_weap_m38_rail",
	
	// RHS Marksman
	"rhs_weap_vss",
	"rhs_weap_m14ebrri",
	"rhs_weap_m38_rail",
	"rhs_weap_m76",
	"rhs_weap_svdp",
	"rhs_weap_svdp_npz",
	"rhs_weap_sr25",
	"rhs_weap_sr25_d",
	"rhs_weap_sr25_wd",
	"rhs_weap_m24sws",
	"rhs_weap_m24sws_blk",
	"rhs_weap_m24sws_ghillie",
	"rhs_weap_m40a5",
	"rhs_weap_m40a5_d",
	"rhs_weap_m40a5_wd",
	"rhs_weap_XM2010_d",
	"rhs_weap_XM2010_sa",
	"rhs_weap_XM2010",
	"rhs_weap_XM2010_wd",
	"rhs_weap_M107",
	"rhs_weap_M107_d",
	"rhs_weap_M107_w",
	"M32 MGL", "rhs_weap_m32",
	
	// RHS LMG
	"rhs_weap_m84",
	"rhs_weap_pkm",
	"rhs_weap_pkp",
	"rhs_weap_minimi_para_railed",
	"rhs_weap_m249_pip_L",
	"rhs_weap_m249_pip_S",
	"rhs_weap_m240B_CAP",
	
	// RHS SMG
	"rhs_weap_savz61",
	"rhs_weap_pp2000",
	"rhsusf_weap_MP7A2",

	// Vanilla
	"arifle_SDAR_F",
	"arifle_SPAR_03_blk_F",
	"arifle_SPAR_03_khk_F",
	"arifle_SPAR_03_snd_F",
	"srifle_DMR_06_camo_F",
	"srifle_DMR_06_olive_F",
	"srifle_DMR_03_F",
	"srifle_DMR_03_multicam_F",
	"srifle_DMR_03_khaki_F",
	"srifle_DMR_03_tan_F",
	"srifle_DMR_03_woodland_F",
	"srifle_DMR_02_F",
	"srifle_DMR_02_camo_F",
	"srifle_DMR_02_sniper_F"
];

_secondaryWeapons =
[
	"rhs_weap_makarov_pm",
	"rhs_weap_pb_6p9",
	"rhs_weap_pya",
	"rhsusf_weap_m9",
	"rhsusf_weap_glock17g4",
	"rhsusf_weap_m1911a1",
	"rhs_weap_pp2000_folded",
	"rhs_weap_M320"
];

_uniforms =
[
	// Vanilla
	"U_B_Wetsuit",
	"U_O_Wetsuit",
	"U_I_Wetsuit",
	"U_B_GhillieSuit",
	"U_O_GhillieSuit",
	"U_I_GhillieSuit",
	"U_B_T_Sniper_F",
	"U_O_T_Sniper_F",
	"U_B_FullGhillie_ard",
	"U_O_FullGhillie_ard",
	"U_I_FullGhillie_ard",
	"U_B_FullGhillie_lsh",
	"U_O_FullGhillie_lsh",
	"U_I_FullGhillie_lsh",
	"U_B_FullGhillie_sard",
	"U_O_FullGhillie_sard",
	"U_I_FullGhillie_sard",
	"U_B_T_FullGhillie_tna_F",
	"U_O_T_FullGhillie_tna_F",
	"U_B_PilotCoveralls",
	"U_O_PilotCoveralls",
	"U_I_pilotCoveralls",
	"U_B_HeliPilotCoveralls",
	"U_I_HeliPilotCoveralls",
	"U_B_PilotCoveralls",
	"U_O_PilotCoveralls",
	"U_I_pilotCoveralls",
	"U_B_HeliPilotCoveralls",
	"U_I_HeliPilotCoveralls",
	"U_O_CombatUniform_ocamo",
	"U_O_CombatUniform_oucamo",
	"U_O_OfficerUniform_ocamo",
	"U_O_SpecopsUniform_ocamo",
	
	// RHS USAF
	"rhs_uniform_g3_blk",
	"rhs_uniform_g3_m81",
	"rhs_uniform_g3_mc",
	"rhs_uniform_g3_rgr",
	"rhs_uniform_g3_tan",
	"rhs_uniform_acu_ucp",
	"rhs_uniform_cu_ucp",
	"rhs_uniform_cu_ocp",
	"rhs_uniform_FROG01_d",
	"rhs_uniform_FROG01_wd",
	
	// RHS AFRF
	"rhs_uniform_mvd_izlom",
	"rhs_uniform_gorka_r_g",
	"rhs_uniform_gorka_r_y",
	"rhs_uniform_emr_des_patchless",
	"rhs_uniform_emr_patchless",
	"rhs_uniform_vdv_emr",
	"rhs_uniform_flora_patchless",
	"rhs_uniform_flora_patchless_alt",
	"rhs_uniform_mflora_patchless",
	"rhs_uniform_m88_patchless",
	"rhs_uniform_df15",
	"rhs_uniform_df15_tan",
	
	// RHS saf
	"rhssaf_uniform_m10_digital_desert",
	"rhssaf_uniform_m10_digital_tan_boots",
	"rhssaf_uniform_m10_digital_summer",
	"rhssaf_uniform_m93_oakleaf",
	"rhssaf_uniform_m93_oakleaf_summer",
	"rhssaf_uniform_mig29_pilot",
	
	// RHS Gref
	"rhsgref_uniform_para_ttsko_mountain",
	"rhsgref_uniform_para_ttsko_oxblood",
	"rhsgref_uniform_para_ttsko_urban",
	"rhsgref_uniform_vsr",
	"rhsgref_uniform_ttsko_forest",
	"rhsgref_uniform_ttsko_mountain",
	"rhsgref_uniform_ttsko_urban",
	"rhsgref_uniform_3color_desert",
	"rhsgref_uniform_alpenflage",
	"rhsgref_uniform_altis_lizard",
	"rhsgref_uniform_altis_lizard_olive",
	"rhsgref_uniform_dpm",
	"rhsgref_uniform_dpm_olive",
	"rhsgref_uniform_ERDL",
	"rhsgref_uniform_flecktarn_full",
	"rhsgref_uniform_flecktarn",
	"rhsgref_uniform_og107",
	"rhsgref_uniform_olive",
	"rhsgref_uniform_tigerstripe",
	"rhsgref_uniform_reed",
	"rhsgref_uniform_woodland",
	"rhsgref_uniform_woodland_olive",
	"rhsgref_uniform_specter"
];

_vests =
[
	// Vanilla
	"V_RebreatherB",
	"V_RebreatherIR",
	"V_RebreatherIA",
	"V_TacVest_blk",
	"V_TacVest_brn",
	"V_TacVest_camo",
	"V_TacVest_khk",
	"V_TacVest_oli",
	"V_TacVest_blk_POLICE",
	"V_I_G_resistanceLeader_F",
	
	// RHS
	"rhsgref_TacVest_ERDL",
	"rhs_vest_commander",
	
	//RHS AFRF
	"rhs_6b13_Flora",
	"rhs_6b13_Flora_crewofficer",
	"rhs_6b13_Flora_6sh92",
	"rhs_6b13_Flora_6sh92_vog",
	"rhs_6b23",
	"rhs_6b23_crewofficer",
	"rhs_6b23_6sh92",
	"rhs_6b23_6sh92_vog",
	"rhs_6b23_medic",
	"rhs_6b13_EMR",
	"rhs_6b13_EMR_6sh92",
	"rhs_6b13_EMR_6sh92_vog",
	"rhs_6b23_digi",
	"rhs_6b23_digi_crewofficer",
	"rhs_6b23_6sh116",
	"rhs_6b23_6sh116_vog",
	"rhs_6b23_digi_medic",
	"rhs_uniform_vdv_mflora",
	"rhs_6b23_ML_crewofficer",
	"rhs_6b23_ML_6sh92",
	"rhs_6b23_ML_6sh92_vog",
	"rhs_6b23_ML_medic",
	"rhs_6b13",
	"rhs_6b13_crewofficer",
	"rhs_6b13_6sh92",
	"rhs_6b13_6sh92_vog",
	"rhs_6b23_6sh116_od",
	"rhs_6b23_6sh116_vog_od",
	"rhs_vydra_3m",
	"rhs_6sh92",
	"rhs_6sh92_vog",
	"rhs_6sh92_digi",
	"rhs_6sh92_digi_vog",
	"rhs_6sh92_vsr",
	"rhs_6sh92_vsr_vog",
	
	// RHS Gref
	"rhsgref_6b23_khaki_officer",
	"rhsgref_6b23_khaki_rifleman",
	"rhsgref_6b23_khaki_medic",
	"rhsgref_6b23_ttsko_mountain_officer",
	"rhsgref_6b23_ttsko_mountain_rifleman",
	"rhsgref_6b23_ttsko_mountain_medic",
	"rhsgref_6b23_ttsko_digi_officer",
	"rhsgref_6b23_ttsko_digi_rifleman",
	"rhsgref_6b23_ttsko_digi_medic",
	"rhs_6b5_officer_khaki",
	"rhs_6b5_khaki",
	"rhs_6b5_medic_khaki",
	"rhs_6b5",
	"rhs_6b5_officer",
	"rhs_6b5_medic",
	"rhs_6b5_ttsko",
	"rhs_6b5_officer_ttsko",
	"rhs_6b5_medic_ttsko",
	"rhs_6b5_vsr",
	"rhs_6b5_officer_vsr",
	"rhs_6b5_medic_vsr",
	"rhsgref_otv_digi",
	"rhsgref_otv_khaki",
	"rhsgref_alice_webbing",
	
	// RHS USAF
	"rhsusf_iotv_ocp",
	"rhsusf_iotv_ocp_Teamleader",
	"rhsusf_iotv_ocp_Rifleman",
	"rhsusf_iotv_ocp_SAW",
	"rhsusf_iotv_ocp_Grenadier",
	"rhsusf_iotv_ocp_Medic",
	"rhsusf_iotv_ocp_Repair",
	"rhsusf_spcs_ocp",
	"rhsusf_spcs_ocp_rifleman",
	"rhsusf_spcs_ocp_rifleman",
	"rhsusf_iotv_ucp",
	"rhsusf_iotv_ucp_Teamleader",
	"rhsusf_iotv_ucp_Rifleman",
	"rhsusf_iotv_ucp_SAW",
	"rhsusf_iotv_ucp_Grenadier",
	"rhsusf_iotv_ucp_Medic",
	"rhsusf_iotv_ucp_Repair",
	"rhsusf_spcs_ucp",
	"rhsusf_spcs_ucp_rifleman",
	"rhsusf_spcs_ucp_rifleman",
	"rhsusf_mbav",
	"rhsusf_mbav_rifleman",
	"rhsusf_mbav_mg",
	"rhsusf_mbav_medic",
	"rhsusf_spc",
	"rhsusf_spc_squadleader",
	"rhsusf_spc_rifleman",
	"rhsusf_spc_mg",
	"rhsusf_spc_teamleader",
	"rhsusf_spc_corpsman",
	"rhsusf_spc_marksman",
	"rhsusf_spc_crewman",
	
	//RHS SAF
	"rhssaf_vest_md98_rifleman",
	"rhssaf_vest_md99_md2camo_rifleman",
	"rhssaf_vest_md99_woodland_rifleman",
	"rhssaf_vest_md99_digital",
	"rhssaf_vest_md99_digital_rifleman",
	"rhssaf_vest_md12_digital",
	"rhssaf_vest_md12_digital_desert",
	"rhssaf_vest_otv_md2camo"
];
	
_weaponAccessories =
[
	"rhsusf_acc_M952V",
	"rhsusf_acc_wmx_bk",
	"rhsusf_acc_wmx",
	"rhsusf_acc_anpeq15side_bk",
	"rhsusf_acc_anpeq15_bk_light",
	"rhsusf_acc_anpeq15side",
	"rhsusf_acc_anpeq15_wmx_light",
	"rhsusf_acc_anpeq15A",
	"rhsusf_acc_anpeq16a_light",
	"rhsusf_acc_grip2",
	"rhsusf_acc_grip2_tan",
	"rhsusf_acc_grip2_wd",
	"rhsusf_acc_grip3",
	"rhsusf_acc_grip3_tan"
];

_mines =
[
	"rhsusf_m112_mag",
	"rhsusf_m112x4_mag",
	"rhsusf_mine_m14_mag",
	"rhs_mine_M19_mag",
	"rhssaf_mine_mrud_a_mag",
	"rhssaf_mine_mrud_b_mag",
	"rhssaf_mine_mrud_c_mag",
	"rhssaf_mine_mrud_d_mag",
	"IEDLandBig_Remote_Mag", // Large IED (Dug-in)
	"IEDLandSmall_Remote_Mag", // Small IED (Dug-in)
	"IEDUrbanBig_Remote_Mag", // Large IED (Urban)
	"IEDUrbanSmall_Remote_Mag" // Small IED (Urban)
];

_goggles =
[
	"G_B_Diving", // Diving Goggles [NATO]
	"G_Balaclava_blk", // Balaclava (Black)
	"G_Balaclava_combat", // Balaclava (Combat Goggles)
	"G_Balaclava_lowprofile", // Balaclava (Low Profile Goggles)
	"G_Balaclava_oli", // Balaclava (Olive)
	"G_Balaclava_TI_blk_F", // Stealth Balaclava (Black)
	"G_Balaclava_TI_G_blk_F", // Stealth Balaclava (Black, Goggles)
	"G_Balaclava_TI_G_tna_F", // Stealth Balaclava (Green, Goggles)
	"G_Balaclava_TI_tna_F", // Stealth Balaclava (Green)
	"G_Combat", // Combat Goggles
	"G_Combat_Goggles_tna_F", // Combat Goggles (Green)
	"G_Diving", // Diving Goggles
	"G_Lowprofile" // "Low Profile Goggles
];

_overallLoopAmount = floor (round (random 8) + 2); // minimum 2, maximum 10

_backPackAmount = floor (round (random 3) + 3); // minimum 3, maximum 6
_binocularAmount = floor (round (random 5) + 2); // minimum 3, maximum 7
_bipodAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_headGearAmount = floor (round (random 3) + 5); // minimum 5, maximum 8
_itemAmount = floor (round (random 3) + 5); // minimum 5, maximum 8
_launcherAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_magazineAmount = floor (round (random 5) + 5); // minimum 5, maximum 10
_throwableAmount = floor (round (random 3) + 3); // minimum 3, maximum 6
_muzzleAmount = floor (round (random 2) + 2); // minimum 2, maximum 4
_opticAmount = floor (round (random 4) + 5); // minimum 5, maximum 9
_primaryWeaponAmount = floor (round (random 5) + 5); // minimum 5, maximum 10
_secondaryWeaponAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_uniformAmount = floor (round (random 4) + 3); // minimum 3, maximum 7
_vestAmount = floor (round (random 4) + 3); // minimum 3, maximum 7
_weaponAccessoryAmount = floor (round (random 3) + 2); // minimum 2, maximum 5
_minesAmount = floor (round (random 2) + 2); // minimum 2, maximum 4
_goggleAmount = floor (round (random 2) + 2); // minimum 2, maximum 4

_loadCrateWithWhatArray =
[
	"_backPacks",
	"_binoculars",
	"_bipods",
	"_headGear",
	"_items",
	"_launcherWeapons",
	"_magazines",
	"_throwables",
	"_muzzles",
	"_optics",
	"_primaryWeapons",
	"_secondaryWeapons",
	"_uniforms",
	"_vests",
	"_weaponAccessories",
	"_mines",
	"_goggles"
];

/*	------------------------------------------------------------------------------------------
	DO NOT EDIT BELOW HERE!
	------------------------------------------------------------------------------------------	*/

params ["_crate"];

_crate allowDamage false;
_crate setVariable ["A3W_inventoryLockR3F", true, true];

clearBackpackCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
clearWeaponCargoGlobal _crate;
clearItemCargoGlobal _crate;

_loadCrateAmount = 0;
_loadCrateWithWhat = "";

#ifdef __DEBUG__
	diag_log "----------------------------------------------------";
#endif

for [{_i = 0},{_i < _overallLoopAmount},{_i = _i + 1}] do
{
	_loadCrateWithWhat = selectRandom _loadCrateWithWhatArray;
	
	#ifdef __DEBUG__
		diag_log format ["%1 -> %2",(_i + 1),_loadCrateWithWhat];
	#endif
	
	switch (_loadCrateWithWhat) do
	{
		case "_backPacks": {
			_loadCrateAmount = _backPackAmount;
			for [{_lootCount = 0 },{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _backPacks;
				_crate addBackpackCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_binoculars": {
			_loadCrateAmount = _binocularAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _binoculars;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_bipods": {
			_loadCrateAmount = _bipodAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _bipods;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_headGear": {
			_loadCrateAmount = _headGearAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _headGear;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif

			};
		};
		case "_items": {
			_loadCrateAmount = _itemAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _items;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif

			};
		};
		case "_launcherWeapons": {
			_loadCrateAmount = _launcherAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _launcherWeapons;
				_loadCrateLootMagazine = getArray (configFile / "CfgWeapons" / _loadCrateItem / "magazines");
				_loadCrateLootMagazineClass = selectRandom _loadCrateLootMagazine;
				_loadCrateLootMagazineNum = floor (round (random 4) + 2); // minimum 2, maximum 6
				_crate addMagazineCargoGlobal [_loadCrateLootMagazineClass, _loadCrateLootMagazineNum];
				_crate addWeaponCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2 with %3x %4 rockets",_loadCrateWithWhat,_loadCrateItem,_loadCrateLootMagazineNum,_loadCrateLootMagazineClass];
				#endif

			};
		};
		case "_magazines": {
			_loadCrateAmount = _magazineAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _magazines;
				_loadCrateLootMagazineNum = floor (round (random 4) + 2); // minimum 2, maximum 6
				_crate addMagazineCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3 magazines",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif

			};
		};
		case "_throwables": {
			_loadCrateAmount = _throwableAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _throwables;
				_loadCrateLootMagazineNum = floor (round (random 8) + 2); // minimum 2, maximum 10
				_crate addMagazineCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif
			};
		};
		case "_muzzles": {
			_loadCrateAmount = _muzzleAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _muzzles;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_optics": {
			_loadCrateAmount = _opticAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _optics;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_primaryWeapons": {
			_loadCrateAmount = _primaryWeaponAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _primaryWeapons;
				_loadCrateLootMagazine = getArray (configFile / "CfgWeapons" / _loadCrateItem / "magazines");
				_loadCrateLootMagazineClass = selectRandom _loadCrateLootMagazine;
				_loadCrateLootMagazineNum = floor (round (random 6) + 4); // minimum 4, maximum 10
				_crate addMagazineCargoGlobal [_loadCrateLootMagazineClass, _loadCrateLootMagazineNum];
				_crate addWeaponCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2 with %3x %4 magazines",_loadCrateWithWhat,_loadCrateItem,_loadCrateLootMagazineNum,_loadCrateLootMagazineClass];
				#endif
			};
		};
		case "_secondaryWeapons": {
			_loadCrateAmount = _secondaryWeaponAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _secondaryWeapons;
				_loadCrateLootMagazine = getArray (configFile / "CfgWeapons" / _loadCrateItem / "magazines");
				_loadCrateLootMagazineClass = selectRandom _loadCrateLootMagazine;
				_loadCrateLootMagazineNum = floor (round (random 4) + 2); // minimum 2, maximum 6
				_crate addMagazineCargoGlobal [_loadCrateLootMagazineClass, _loadCrateLootMagazineNum];
				_crate addWeaponCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2 with %3x %4 magazines",_loadCrateWithWhat,_loadCrateItem,_loadCrateLootMagazineNum,_loadCrateLootMagazineClass];
				#endif
			};
		};
		case "_uniforms": {
			_loadCrateAmount = _uniformAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _uniforms;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_vests": {
			_loadCrateAmount = _vestAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _vests;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_weaponAccessories": {
			_loadCrateAmount = _weaponAccessoryAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _weaponAccessories;
				_crate addItemCargoGlobal [_loadCrateItem, 1];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> 1x %2",_loadCrateWithWhat,_loadCrateItem];
				#endif
			};
		};
		case "_mines": {
			_loadCrateAmount = _minesAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _mines;
				_loadCrateLootMagazineNum = floor (round (random 2) + 2); // minimum 2, maximum 4
				_crate addMagazineCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif
			};
		};
		case "_goggles": {
			_loadCrateAmount = _goggleAmount;
			for [{_lootCount = 0},{_lootCount < _loadCrateAmount},{_lootCount = _lootCount + 1}] do
			{
				_loadCrateItem = selectRandom _goggles;
				_loadCrateLootMagazineNum = floor (round (random 2) + 2); // minimum 2, maximum 4
				_crate addItemCargoGlobal [_loadCrateItem, _loadCrateLootMagazineNum];
				#ifdef __DEBUG__
					diag_log format [" + %1 added -> %2x %3",_loadCrateWithWhat,_loadCrateLootMagazineNum,_loadCrateItem];
				#endif
			};
		};
	};
};
#ifdef __DEBUG__
	diag_log "----------------------------------------------------";
#endif
