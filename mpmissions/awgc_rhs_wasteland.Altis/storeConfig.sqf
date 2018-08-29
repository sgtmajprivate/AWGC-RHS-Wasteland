// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
/*********************************************************#
# @@ScriptName: storeConfig.sqf
# @@Author: His_Shadow, AgentRev
# @@Create Date: 2013-09-16 20:40:58
#*********************************************************/

// This tracks which store owner the client is interacting with
currentOwnerName = "";

// Gunstore Weapon List - Gun Store Base List
// Text name, classname, buy cost

// empty name = name is extracted from class config

pistolArray = compileFinal str
[
	// Vanilla Handguns
	// ["P07 Pistol", "hgun_P07_F", 50],
	// ["Rook-40 Pistol", "hgun_Rook40_F", 50],
	// ["ACP-C2 Pistol", "hgun_ACPC2_F", 75],
	// ["Zubr Revolver", "hgun_Pistol_heavy_02_F", 75],
	// ["4-Five Pistol", "hgun_Pistol_heavy_01_F", 100],
	// ["Starter Pistol", "hgun_Pistol_Signal_F", 25]
	// RHS Handguns
	["Soviet PM .380 auto", "rhs_weap_makarov_pm", 100],
	["PB 6p9 .380 auto", "rhs_weap_pb_6p9", 100],
	["MR-443 Grach 9mm", "rhs_weap_pya", 200],
	["Beretta M9", "rhsusf_weap_m9", 200],
	["GLOCK 17 9MM", "rhsusf_weap_glock17g4", 200],
	["M1911 .45 ACP", "rhsusf_weap_m1911a1", 250],
	["PP-2000 9mm", "rhs_weap_pp2000_folded", 1000],
	["M-320 GLM", "rhs_weap_M320", 1500]
];

smgArray = compileFinal str
[
	// ["PDW2000 SMG", "hgun_PDW2000_F", 100],
	// ["Protector SMG", "SMG_05_F", 100],
	// ["Sting SMG", "SMG_02_F", 125],
	// ["Vermin SMG", "SMG_01_F", 125]
	["Skorpion .32 ACP", "rhs_weap_savz61", 1500],
	["PP-2000 9mm", "rhs_weap_pp2000", 1500],
	["HK MP7", "rhsusf_weap_MP7A2", 2500]
];

rifleArray = compileFinal str
[	
	// RHS Shotguns
	["MossBerg M590", "rhs_weap_M590_8RD", 2500],		// RHS
	
	// Assault Rifles
	// ["MK 18", "rhs_weap_mk18_bk", 2500],		// RHS
	["AS Val", "rhs_weap_asval", 2500],
	["AS Val w/ Rail", "rhs_weap_asval_npz", 3000],		// RHS
	["AK-74", "rhs_weap_ak74", 2500],		// RHS
	["AK-74m", "rhs_weap_ak74m", 2500],		// RHS
	["AK-74 w/ Rail", "rhs_weap_ak74m_npz", 3500],		// RHS
	["AK-74m Desert", "rhs_weap_ak74m_desert", 2500],		// RHS
	["AK-74m Desert w/ Rail", "rhs_weap_ak74m_desert_npz", 3500],		// RHS
	["H&K 416 D10", "rhs_weap_hk416d10", 3500],			// RHS
	["H&K 416 D10 w/ M320", "rhs_weap_hk416d10_m320", 5500],		// RHS
	["H&K 416 D14.5", "rhs_weap_hk416d145", 4000],
	["H&K 416 D14.5 w/ M320", "rhs_weap_hk416d145_m320", 6000],
	["H&K G36 Compact", "rhs_weap_g36c", 4500],		// RHS
	["MK18 CQB", "rhs_weap_mk18", 2000],		// RHS
	["MK18 CQB (Desert)", "rhs_weap_mk18_d", 2000],		// RHS
	["MK18 CQB (WoodLand)", "rhs_weap_mk18_wd", 2000],		// RHS
	["M16A4", "rhs_weap_m16a4_pmag", 2500],
	["M16A4 w/M203", "rhs_weap_m16a4_carryhandle_M203", 3000],
	["M4", "rhs_weap_m4", 2500],		// RHS
	["M4 w/M203", "rhs_weap_m4_m203", 3000],
	["M4 w/M203 shorty", "rhs_weap_m4_m203S", 3500],
	["M4 w/M320", "rhs_weap_m4_m320", 4000],
	["M4A1", "rhs_weap_m4a1", 2500],		// RHS
	["M4A1 (Desert)", "rhs_weap_m4a1_d", 2500],		// RHS
	["M4A1 (WoodLand)", "rhs_weap_m4a1_wd", 2500],		// RHS
	["M4A1 Magpul (Black)", "rhs_weap_m4a1_mstock", 3000],		// RHS
	["M4A1 Magpul (Desert)", "rhs_weap_m4a1_d_mstock", 3000],		// RHS
	["M4A1 Magpul (Woodland)", "rhs_weap_m4a1_wd_mstock", 3000],		// RHS
	["M4A1 w/Rail (Black)", "rhs_weap_m4a1_blockII_bk", 3200],		// RHS	
	["M4A1 w/Rail (Desert)", "rhs_weap_m4a1_blockII_d", 3200],		// RHS	
	["M4A1 w/Rail (Woodland)", "rhs_weap_m4a1_blockII_wd", 3200],		// RHS	
	["M4A1 w/M203", "rhs_weap_m4a1_m203s", 3500],
	["M4A1 w/M203 (Desert)", "rhs_weap_m4a1_m203s_d", 3500],
	["M4A1 w/M203 (Woodland)", "rhs_weap_m4a1_m203s_wd", 3500],
	["M4A1 w/M320", "rhs_weap_m4a1_m320", 4000],
	
	// RHS Marksman
	["VSS Vintorez", "rhs_weap_vss", 5500],		// RHS
	["M14 EBR", "rhs_weap_m14ebrri", 5000],		// RHS
	["M38 DMR", "rhs_weap_m38_rail", 5000],		// RHS
	
	// A3 Vanilla
	["MX 3GL Rifle", "arifle_MX_GL_F", 250],
	["SPAR-17 Rifle", "arifle_SPAR_03_blk_F", 4500],
	["SPAR-17 Rifle (Khaki)", "arifle_SPAR_03_khk_F", 4500],
	["SPAR-17 Rifle (Sand)", "arifle_SPAR_03_snd_F", 4500],

	["Mk14 Rifle (Camo)", "srifle_DMR_06_camo_F", 5000],
	["Mk14 Rifle (Olive)", "srifle_DMR_06_olive_F", 5000],
	["Mk-I EMR Rifle", "srifle_DMR_03_F", 5000],
	["Mk-I EMR Rifle (Camo)", "srifle_DMR_03_multicam_F", 5000],
	["Mk-I EMR Rifle (Khaki)", "srifle_DMR_03_khaki_F", 5000],
	["Mk-I EMR Rifle (Sand)", "srifle_DMR_03_tan_F", 5000],
	["Mk-I EMR Rifle (Woodland)", "srifle_DMR_03_woodland_F", 5000],
	["MAR-10 Rifle", "srifle_DMR_02_F", 7500],
	["MAR-10 Rifle (Camo)", "srifle_DMR_02_camo_F", 7500],
	["MAR-10 Rifle (Sand)", "srifle_DMR_02_sniper_F", 7500],
	// ["Cyrus Rifle", "srifle_DMR_05_blk_F", 7500],
	// ["Cyrus Rifle (Hex)", "srifle_DMR_05_hex_F", 7500],
	// ["Cyrus Rifle (Tan)", "srifle_DMR_05_tan_f", 7500],

	// RHS Marksman Rifles
	["M76 Zastava", "rhs_weap_m76", 5000],
	["SVD Dragunov", "rhs_weap_svdp", 5500],
	["SVD Dragunov w/ Rail", "rhs_weap_svdp_npz", 5500],
	["T-5000", "rhs_weap_t5000", 5500],
	["MK 11", "rhs_weap_sr25", 5500],
	["MK 11 Desert", "rhs_weap_sr25_d", 5500],
	["MK 11 WoodLand", "rhs_weap_sr25_wd", 5500],
	["M24 Semi-Arid", "rhs_weap_m24sws", 5500],
	["M24 Black", "rhs_weap_m24sws_blk", 5500],
	["M24 Ghillie", "rhs_weap_m24sws_ghillie", 6500],
	["M40 (Black)", "rhs_weap_m40a5", 6000],
	["M40 (Dessert)", "rhs_weap_m40a5_d", 6000],
	["M40 (Woodland)", "rhs_weap_m40a5_wd", 6000],
	["M2010 ESR (Dessert)", "rhs_weap_XM2010_d", 10000],
	["M2010 ESR (Semi-Arid)", "rhs_weap_XM2010_sa", 10000],
	["M2010 ESR (Black)", "rhs_weap_XM2010", 10000],
	["M2010 ESR (WoodLand)", "rhs_weap_XM2010_wd", 10000],
	["Barrett M82 (Black)", "rhs_weap_M107", 15000],
	["Barrett M82 (Dessert)", "rhs_weap_M107_d", 15000],
	["Barrett M82 (WoodLand)", "rhs_weap_M107_w", 15000],
	
	// ["M320 LRR Sniper", "srifle_LRR_LRPS_F", 10000],
	// ["M320 LRR Sniper (Camo)", "srifle_LRR_camo_LRPS_F", 12000],
	// ["M320 LRR Sniper (Tropic)", "srifle_LRR_tna_LRPS_F", 12000, "noDLC"],
	// ["GM6 Lynx Sniper", "srifle_GM6_LRPS_F", 12500],
	// ["GM6 Lynx Sniper (Camo)", "srifle_GM6_camo_LRPS_F", 15000],
	// ["GM6 Lynx Sniper (G Hex)", "srifle_GM6_ghex_LRPS_F", 15000, "noDLC"],

	// ["ASP-1 Kir Rifle", "srifle_DMR_04_F", 20000],
	// ["ASP-1 Kir Rifle (Tan)", "srifle_DMR_04_tan_F", 20000]
	
	// Special Purpose
	["M32 MGL", "rhs_weap_m32", 15000]
];

lmgArray = compileFinal str
[
	// RHS LMG
	["M84 Zastava", "rhs_weap_m84", 5000],	
	["PKM LMG", "rhs_weap_pkm", 5000],	
	["PKP Pecheneg LMG", "rhs_weap_pkp", 5000],	
	["M249 LMG Mini", "rhs_weap_minimi_para_railed", 5500],	
	["M249 LMG Long", "rhs_weap_m249_pip_L", 5500],	
	["M249 LMG Shorty", "rhs_weap_m249_pip_S", 5500],	
	["M240 LMG", "rhs_weap_m240B_CAP", 5500]
	// ["MX SW LMG", "arifle_MX_SW_F", 3000],
	// ["MX SW LMG (Black)", "arifle_MX_SW_Black_F", 3250],
	// ["MX SW LMG (Khaki)", "arifle_MX_SW_khk_F", 3250, "noDLC"],
	// ["Mk200 LMG", "LMG_Mk200_F", 4000],
	// ["Zafir LMG", "LMG_Zafir_F", 5000],

	// ["SPAR-16S LMG", "arifle_SPAR_02_blk_F", 3000],
	// ["SPAR-16S LMG (Khaki)", "arifle_SPAR_02_khk_F", 3000],
	// ["SPAR-16S LMG (Sand)", "arifle_SPAR_02_snd_F", 3000],
	// ["CAR-95-1 LMG", "arifle_CTARS_blk_F", 3000],
	// ["CAR-95-1 LMG (Hex)", "arifle_CTARS_hex_F", 3000],
	// ["CAR-95-1 LMG (G Hex)", "arifle_CTARS_ghex_F", 3000],
	// ["LIM-85 LMG", "LMG_03_F", 3500],

	// ["SPMG MMG (Sand)", "MMG_02_sand_F", 7500],
	// ["SPMG MMG (MTP)", "MMG_02_camo_F", 7500],
	// ["SPMG MMG (Black)", "MMG_02_black_F", 7500],
	// ["Navid MMG (Tan)", "MMG_01_tan_F", 10000],
	// ["Navid MMG (Hex)", "MMG_01_hex_F", 10000]
];

launcherArray = compileFinal str
[
	// ["RPG-7", "launch_RPG7_F", 8000],
	// ["RPG-42 Alamut", "launch_RPG32_F", 15000],
	// ["RPG-42 Alamut (G Hex)", "launch_RPG32_ghex_F", 15000, "noDLC"],
	// ["PCML", "launch_NLAW_F", 30000],
	// ["Titan MPRL Compact (Sand)", "launch_Titan_short_F", 50000],
	// ["Titan MPRL Compact (Coyote)", "launch_O_Titan_short_F", 50000],
	// ["Titan MPRL Compact (Olive)", "launch_I_Titan_short_F", 50000],
	// ["Titan MPRL Compact (Tropic)", "launch_B_Titan_short_tna_F", 50000, "noDLC"],
	// ["Titan MPRL Compact (G Hex)", "launch_O_Titan_short_ghex_F", 50000, "noDLC"],
	// ["Titan MPRL AA (Sand)", "launch_Titan_F", 60000],
	// ["Titan MPRL AA (Hex)", "launch_O_Titan_F", 60000],
	// ["Titan MPRL AA (Digi)", "launch_I_Titan_F", 60000],
	// ["Titan MPRL AA (Tropic)", "launch_B_Titan_tna_F", 60000, "noDLC"],
	// ["Titan MPRL AA (G Hex)", "launch_O_Titan_ghex_F", 60000, "noDLC"],
	// RHS Launchers
	["M136 HEAT", "rhs_weap_M136", 2500],
	["M136 HEDP", "rhs_weap_M136_hedp", 2500],
	["M136 HP", "rhs_weap_M136_hp", 2500],
	["RPG-7", "rhs_weap_rpg7", 30000],
	["9K38 Igla AA", "rhs_weap_igla", 60000],
	["FIM-92 Stinger AA", "rhs_weap_fim92", 60000],
	["MAAWS M3", "rhs_weap_maaws", 30000],
	["SMAW MK153 Green", "rhs_weap_smaw_green", 40000],
	["MAAWS MK4 Green", "launch_MRAWS_green_F", 50000],		// Tanks DLC
	["MAAWS MK4 Sand", "launch_MRAWS_sand_F", 50000],		// Tanks DLC
	["9M135 Vorona Green", "launch_O_Vorona_green_F", 60000],		// Tanks DLC
	["FGM-148 Javelin", "rhs_weap_fgm148", 60000]
];

allGunStoreFirearms = compileFinal str (call pistolArray + call smgArray + call rifleArray + call lmgArray + call launcherArray);

staticGunsArray = compileFinal str
[
	["Vehicle Ammo Crate", "Box_NATO_AmmoVeh_F", 2500],
	["DShKM HMG 12.7mm Low", "rhsgref_cdf_DSHKM_Mini_TriPod", 6000],
	["DShKM HMG 12.7mm High", "rhsgref_cdf_DSHKM", 6000],
	["KORD HMG 12.7mm Low", "rhs_KORD_MSV", 6000],
	["KORD HMG 12.7mm High", "rhs_KORD_high_MSV", 6000],
	["M2 .50 BMG Low", "RHS_M2StaticMG_MiniTripod_D", 6000],
	["M2 .50 BMG High", "RHS_M2StaticMG_D", 6000],
	["AGS-30 GMG", "RHS_AGS30_TriPod_MSV", 7000],
	["MK19 GMG", "RHS_MK19_TriPod_D", 7000],
	["Mk6 Mortar", "B_Mortar_01_F", 12500],
	["Mk6 Mortar", "O_Mortar_01_F", 12500],
	["Mk6 Mortar", "I_Mortar_01_F", 12500],
	["M252 mortar", "RHS_M252_D", 12500],
	["9K115 Metis HEAT", "rhs_Metis_9k115_2_msv", 15000],
	["Russian SPG-9M", "rhs_SPG9M_MSV", 20000],
	["BGM-71 TOW", "RHS_TOW_TriPod_D", 20000],
	["9M113 Konkurs HEAT", "rhs_Kornet_9M133_2_msv", 20000],
	["ZU-23-2 AA", "RHS_ZU23_MSV", 30000],
	["9K38 Igla AA", "rhs_Igla_AA_pod_msv", 30000],
	["Stinger AA Pod", "RHS_Stinger_AA_pod_D", 35000],
	["M119 Howitzer", "RHS_M119_D", 30000],
	["D30 122MM Howitzer", "rhs_D30_msv", 30000]	
];

throwputArray = compileFinal str
[
	["AN M14 Incendenary Grenade", "rhs_mag_an_m14_th3", 50],
	["M8 White Smoke", "rhs_mag_an_m8hc", 50],
	["F-1 Grenade", "rhs_mag_f1", 50],
	["Flash Bang Grenade", "rhs_mag_fakel", 50],
	["M67 Frag Grenade", "rhs_mag_m67", 50],
	["M18 Smoke Grenade (Yellow)", "rhs_mag_m18_yellow", 50],
	["M18 Smoke Grenade (Red)", "rhs_mag_m18_red", 50],
	["M18 Smoke Grenade (Purple)", "rhs_mag_m18_purple", 50],
	["M18 Smoke Grenade (Green)", "rhs_mag_m18_green", 50],
	["M7A3 Stun Grenade", "rhs_mag_m7a3_cs", 50],
	["M84 Stun Grenade", "rhs_mag_mk84", 50],
	["MK3A2 Concussion Grenade", "rhs_mag_mk3a2", 50],
	["RGO Frag Defensive", "rhs_mag_rgo", 50],
	["RGN Frag Offensive", "rhs_mag_rgn", 50],
	["RGD5 Frag Grenade", "rhs_mag_rgd5", 50],
	["RGN Smoke (Black)", "rhs_mag_rdg2_black", 50],
	["RGN Smoke (White)", "rhs_mag_rdg2_white", 50],
	["NSP-D Smoke (Orange)", "rhs_mag_nspd", 50],
	["C-4 Explosive", "rhsusf_m112_mag", 200],
	["C-4 Explosive x4)", "rhsusf_m112x4_mag", 600],
	["M14 AP LandMine)", "rhsusf_mine_m14_mag", 100],
	["M19 AT BlastMine", "rhs_mine_M19_mag", 1000],
	["MRUD AP Directional 3m", "rhssaf_mine_mrud_a_mag", 100],
	["MRUD AP Directional 6m", "rhssaf_mine_mrud_b_mag", 150],
	["MRUD AP Directional 10m", "rhssaf_mine_mrud_c_mag", 200],
	["MRUD AP Directional Remote", "rhssaf_mine_mrud_d_mag", 50]
	// ["RGN Mini Grenade", "MiniGrenade", 50],
	// ["RGO Frag Grenade", "HandGrenade", 100],
	// ["APERS Tripwire Mine", "APERSTripMine_Wire_Mag", 200],
	// ["APERS Bounding Mine", "APERSBoundingMine_Range_Mag", 250],
	// ["APERS Mine", "APERSMine_Range_Mag", 300],
	// ["Claymore Charge", "ClaymoreDirectionalMine_Remote_Mag", 350],
	// ["M6 SLAM Mine", "SLAMDirectionalMine_Wire_Mag", 350],
	// ["AT Mine", "ATMine_Range_Mag", 400],
	// ["Explosive Charge", "DemoCharge_Remote_Mag", 450],
	// ["Explosive Satchel", "SatchelCharge_Remote_Mag", 500],
	// ["Smoke Grenade (White)", "SmokeShell", 50],
	// ["Smoke Grenade (Purple)", "SmokeShellPurple", 50],
	// ["Smoke Grenade (Blue)", "SmokeShellBlue", 50],
	// ["Smoke Grenade (Green)", "SmokeShellGreen", 50],
	// ["Smoke Grenade (Yellow)", "SmokeShellYellow", 50],
	// ["Smoke Grenade (Orange)", "SmokeShellOrange", 50],
	// ["Smoke Grenade (Red)", "SmokeShellRed", 50]
];

//Text name, classname, buy cost
ammoArray = compileFinal str
[
	["12GA 00BuckShot 8Rnd", "rhsusf_8Rnd_00Buck", 20],		// RHS
	// ["9mm 10Rnd Mag", "10Rnd_9x21_Mag", 5],
	// ["9mm 16Rnd Mag", "16Rnd_9x21_Mag", 10],
	// ["9mm 30Rnd Mag", "30Rnd_9x21_Mag", 15],
	// ["9mm 30Rnd SMG Mag", "30Rnd_9x21_Mag_SMG_02", 15],
	[".32 ACP 10Rnd", "rhsgref_10rnd_765x17_vz61", 10],		// RHS
	[".32 ACP 20Rnd", "rhsgref_20rnd_765x17_vz61", 10],		// RHS
	[".380 Auto 8Rnd", "rhs_mag_9x18_8_57N181S", 5],		// RHS
	["9MM Grach 17Rnd", "rhs_mag_9x19_17", 20],		// RHS
	["9MM FMJ 17Rnd", "rhsusf_mag_17Rnd_9x19_FMJ", 20],		// RHS
	["9MM JHP 17Rnd", "rhsusf_mag_17Rnd_9x19_JHP", 20],		// RHS
	["9MM JHP 15Rnd", "rhsusf_mag_15Rnd_9x19_JHP", 20],		// RHS
	["9MM FMJ 15Rnd", "rhsusf_mag_15Rnd_9x19_FMJ", 20],		// RHS
	["9MM 20Rnd PP-2000", "rhs_mag_9x19mm_7n31_20", 100],	// RHS
	["9MM 44Rnd PP-2000", "rhs_mag_9x19mm_7n31_44", 200],	// RHS
	[".45 ACP MHP 7Rnd", "rhsusf_mag_7x45acp_MHP", 20],		//  RHS
	// [".45 ACP 6Rnd Cylinder", "6Rnd_45ACP_Cylinder", 5],
	// [".45 ACP 9Rnd Mag", "9Rnd_45ACP_Mag", 10],
	// [".45 ACP 11Rnd Mag", "11Rnd_45ACP_Mag", 15],
	// [".45 ACP 30Rnd Vermin Mag", "30Rnd_45ACP_MAG_SMG_01", 20],
	// [".45 ACP 30Rnd Tracer (Green) Mag", "30Rnd_45ACP_Mag_SMG_01_tracer_green", 15],
	["4.6x30 FMJ 40Rnd", "rhsusf_mag_40Rnd_46x30_FMJ", 20],
	["4.6x30 JHP 40Rnd", "rhsusf_mag_40Rnd_46x30_JHP", 30],
	["4.6x30 AP 40Rnd", "rhsusf_mag_40Rnd_46x30_AP", 40],
	["5.45mm 30Rnd Mag", "30Rnd_545x39_Mag_F", 20],
	["5.45mm 30Rnd Tracer (Yellow) Mag", "30Rnd_545x39_Mag_Tracer_F", 15],
	["5.45mm 30Rnd Tracer (Green) Mag", "30Rnd_545x39_Mag_Tracer_Green_F", 15],
	["5.56mm 20Rnd Underwater Mag", "20Rnd_556x45_UW_mag", 10],
	["5.56mm 30Rnd STANAG Mag", "rhs_mag_30Rnd_556x45_M855_Stanag", 20],		// RHS
	["5.56mm 30Rnd", "rhssaf_30rnd_556x45_EPR_G36", 20],		// RHS
	["5.56mm 100Rnd", "rhssaf_100rnd_556x45_EPR_G36", 100],		// RHS
	["5.56mm 30Rnd STANAG Mag", "30Rnd_556x45_Stanag", 20],
	["5.56mm 30Rnd Tracer (Green) Mag", "30Rnd_556x45_Stanag_Tracer_Green", 15],
	["5.56mm 30Rnd Tracer (Yellow) Mag", "30Rnd_556x45_Stanag_Tracer_Yellow", 15],
	["5.56mm 30Rnd Tracer (Red) Mag", "30Rnd_556x45_Stanag_Tracer_Red", 15],
	["5.56mm 150Rnd Mag", "150Rnd_556x45_Drum_Mag_F", 100],
	["5.56mm 150Rnd Tracer (Red) Mag", "150Rnd_556x45_Drum_Mag_Tracer_F", 75],
	["5.56mm 200Rnd Box", "200Rnd_556x45_Box_F", 125],
	["5.56mm 200Rnd Tracer (Yellow) Box", "200Rnd_556x45_Box_Tracer_F", 100],
	["5.56mm 200Rnd Tracer (Red) Box", "200Rnd_556x45_Box_Tracer_Red_F", 100],
	["5.56mm 200Rnd", "rhs_200rnd_556x45_B_SAW", 100],		// RHS
	// ["5.8mm 30Rnd Mag", "30Rnd_580x42_Mag_F", 20],
	// ["5.8mm 30Rnd Tracer (Green) Mag", "30Rnd_580x42_Mag_Tracer_F", 15],
	// ["5.8mm 100Rnd Mag", "100Rnd_580x42_Mag_F", 100],
	// ["5.8mm 100Rnd Tracer (Green) Mag", "100Rnd_580x42_Mag_Tracer_F", 75],
	// ["6.5mm 20Rnd Mag", "20Rnd_650x39_Cased_Mag_F", 15],
	// ["6.5mm 30Rnd STANAG Mag", "30Rnd_65x39_caseless_mag", 20],
	// ["6.5mm 30Rnd Tracer (Red) Mag", "30Rnd_65x39_caseless_mag_Tracer", 15],
	// ["6.5mm 30Rnd Caseless Mag", "30Rnd_65x39_caseless_green", 20],
	// ["6.5mm 30Rnd Tracer (Green) Mag", "30Rnd_65x39_caseless_green_mag_Tracer", 15],
	// ["6.5mm 100Rnd Belt Case", "100Rnd_65x39_caseless_mag", 75],
	// ["6.5mm 100Rnd Tracer (Red) Belt Case", "100Rnd_65x39_caseless_mag_Tracer", 50],
	// ["6.5mm 200Rnd Belt Case", "200Rnd_65x39_cased_Box", 150],
	// ["6.5mm 200Rnd Tracer (Yellow) Belt Case", "200Rnd_65x39_cased_Box_Tracer", 125],
	["9x39mm 20Rnd", "rhs_20rnd_9x39mm_SP5", 50],		// RHS
	//["7.62mm 10Rnd Mag", "10Rnd_762x51_Mag", 15],
	["7.62x39mm 30Rnd Mag", "rhs_30Rnd_545x39_AK", 20],		// RHS
	["7.62x39mm 30Rnd Mag", "30Rnd_762x39_Mag_F", 20],
	["7.62x51mm 5Rnd Mag", "rhsusf_5Rnd_762x51_m118_special_Mag", 10],		// RHS
	["7.62x51mm 10Rnd Mag", "rhsusf_10Rnd_762x51_m118_special_Mag", 10],		// RHS
	["7.62x51mm 20Rnd Mag", "rhsusf_20Rnd_762x51_m118_special_Mag", 25],		// RHS
	["7.62x51mm 20Rnd Mag", "20Rnd_762x51_Mag", 25],
	// ["7.62mm 30Rnd Tracer (Yellow) Mag", "30Rnd_762x39_Mag_Tracer_F", 15],
	// ["7.62mm 30Rnd Tracer (Green) Mag", "30Rnd_762x39_Mag_Tracer_Green_F", 15],
	["7.62x51mm 10Rnd Mag Armor Piercing", "rhsusf_10Rnd_762x51_m993_Mag", 100],		// RHS
	// ["7.62mm 150Rnd Box", "150Rnd_762x51_Box", 150],
	// ["7.62mm 150Rnd Tracer (Green) Box", "150Rnd_762x51_Box_Tracer", 125],
	["7.62x51mm 100Rnd", "rhsusf_100Rnd_762x51", 100],		// RHS
	["7.62x51mm 100Rnd Armor Piercing", "rhsusf_100Rnd_762x51_m993", 325],		// RHS
	["7.62x51mm 100Rnd Armor Piercing", "rhsusf_100Rnd_762x51_m61_ap", 425],		// RHS
	["7.62x54mm 5Rnd Mag", "rhsgref_5Rnd_762x54_m38", 10],		// RHS
	["7.62x54mm 10Rnd Mag", "10Rnd_762x54_Mag", 15],
	["7.62x54mm 10Rnd", "rhs_10Rnd_762x54mmR_7N1", 20],		// RHS
	["7.62x54mm 100Rnd", "rhs_100Rnd_762x54mmR", 125],		// RHS
	["7.62x54mm 100Rnd Tracer (Green) Box", "rhs_100Rnd_762x54mmR_green", 125],		// RHS
	["7.62x54mm 100Rnd Enhanced Penetration", "rhs_100Rnd_762x54mmR_7N13", 225],		// RHS
	["7.62x54mm 100Rnd Armor Piercing", "rhs_100Rnd_762x54mmR_7N26", 325],		// RHS
	["7.62x54mm 100Rnd Armor Piercing Incediary", "rhs_100Rnd_762x54mmR_7BZ3", 425],		// RHS
	["7.62x54mm 150Rnd Box", "150Rnd_762x54_Box", 150],
	["7.62x54mm 150Rnd Tracer (Green) Box", "150Rnd_762x54_Box_Tracer", 125],
	["7.92x57mm 10Rnd", "rhsgref_10Rnd_792x57_m76", 20],		// RHS
	[".338 Lapua 5Rnd", "rhs_5Rnd_338lapua_t5000", 20],
	[".338 LM 10Rnd Mag", "10Rnd_338_Mag", 50],
	[".338 NM 130Rnd Belt", "130Rnd_338_Mag", 150],
	["9.3mm 10Rnd Mag", "10Rnd_93x64_DMR_05_Mag", 50],
	["9.3mm 150Rnd Belt", "150Rnd_93x64_Mag", 150],
	[".408 7Rnd Cheetah Mag", "7Rnd_408_Mag", 50],
	["12.7mm 5Rnd Mag", "5Rnd_127x108_Mag", 50],
	["12.7mm 5Rnd Armor-Piercing Mag", "5Rnd_127x108_APDS_Mag", 60],
	["12.7mm 10Rnd Subsonic Mag", "10Rnd_127x54_Mag", 75],
	["300 WinMag 5Rnd Mag", "rhsusf_5Rnd_300winmag_xm2010", 20],		// RHS
	["50BMG 10Rnd Mag", "rhsusf_mag_10Rnd_STD_50BMG_M33", 50],		// RHS
	["50BMG 10Rnd HE AP Incidiary", "rhsusf_mag_10Rnd_STD_50BMG_mk211", 200],		// RHS
	// [".50 BW 10Rnd Mag", "10Rnd_50BW_Mag_F", 50],
	// ["PG-7VM HEAT Grenade", "RPG7_F", 2000],                   // Direct damage: medium    | Splash damage: low    | Guidance: none
	// ["RPG-42 Anti-Tank Rocket", "RPG32_F", 2500],              // Direct damage: high      | Splash damage: low    | Guidance: none
	// ["RPG-42 High-Explosive Rocket", "RPG32_HE_F", 2500],      // Direct damage: medium    | Splash damage: medium | Guidance: none
	// ["PCML Anti-Tank Missile", "NLAW_F", 4000],                // Direct damage: very high | Splash damage: low    | Guidance: laser, ground vehicles
	// ["Titan Anti-Tank Missile", "Titan_AT", 3500],             // Direct damage: high      | Splash damage: low    | Guidance: mouse, laser, ground vehicles
	// ["Titan Anti-Personnel Missile", "Titan_AP", 3500],        // Direct damage: low       | Splash damage: high   | Guidance: mouse, laser
	// ["Titan Anti-Air Missile", "Titan_AA", 3500],              // Direct damage: low       | Splash damage: medium | Guidance: aircraft
	
	// RHS, DLC Rocket Launcher Ammo
	["RPG AP Frag", "rhs_rpg7_OG7V_mag", 3500],
	["RPG AT AP AirBurst", "rhs_rpg7_type69_airburst_mag", 3500],
	["RPG AT", "rhs_rpg7_PG7V_mag", 3500],
	["RPG AT", "rhs_rpg7_PG7VL_mag", 4000],
	["RPG AT Thermobaric", "rhs_rpg7_TBG7V_mag", 4500],
	["RPG AT Penetrating", "rhs_rpg7_PG7VR_mag", 4500],
	["MAAWS M3 HEDP", "rhs_mag_maaws_HEDP", 2500],
	["MAAWS M3 HE", "rhs_mag_maaws_HE", 2500],
	["MAAWS M3 HEAT", "rhs_mag_maaws_HEAT", 2500],
	["SMAW MK153 HEAA", "rhs_mag_smaw_HEAA", 2500],
	["SMAW MK153 HEDP", "rhs_mag_smaw_HEDP", 2500],
	["Igla AA Rocket", "rhs_mag_9k38_rocket", 3500],
	["Stinger AA Rocket", "rhs_fim92_mag", 3500],
	["MAAWS HEAT MK4", "MRAWS_HEAT_F", 3500],		// Tanks DLC
	["MAAWS HE MK4", "MRAWS_HE_F", 3500],		// Tanks DLC
	["Vorona HEAT", "Vorona_HEAT", 4000],		// Tanks DLC
	["Vorona HE", "Vorona_HE", 4000],		// Tanks DLC
	["Javelin", "rhs_fgm148_magazine_AT", 4000],		// RHS
	
	// Grenade Launcher Ammo
	["GL Stun Grenade", "rhs_mag_m4009", 25],		// RHS
	["M576 BuckShot HE", "rhs_mag_m576", 50],		// RHS
	["M397 HE", "rhs_mag_M441_HE", 125],		// RHS
	["M397 HET", "rhs_mag_M397_HET", 125],		// RHS
	["M433 HEDP", "rhs_mag_M433_HEDP", 150],		// RHS
	["M441 HE", "rhsusf_mag_6Rnd_M441_HE", 500],		// RHS
	["40mm HE Grenade Round", "1Rnd_HE_Grenade_shell", 125],
	["40mm 3Rnd HE Grenades", "3Rnd_HE_Grenade_shell", 250],
	["40mm Smoke Round (White)", "1Rnd_Smoke_Grenade_shell", 50],
	["40mm Smoke Round (Purple)", "1Rnd_SmokePurple_Grenade_shell", 50],
	["40mm Smoke Round (Blue)", "1Rnd_SmokeBlue_Grenade_shell", 50],
	["40mm Smoke Round (Green)", "1Rnd_SmokeGreen_Grenade_shell", 50],
	["40mm Smoke Round (Yellow)", "1Rnd_SmokeYellow_Grenade_shell", 50],
	["40mm Smoke Round (Orange)", "1Rnd_SmokeOrange_Grenade_shell", 50],
	["40mm Smoke Round (Red)", "1Rnd_SmokeRed_Grenade_shell", 50],
	["40mm 3Rnd Smokes (White)", "3Rnd_Smoke_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Purple)", "3Rnd_SmokePurple_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Blue)", "3Rnd_SmokeBlue_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Green)", "3Rnd_SmokeGreen_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Yellow)", "3Rnd_SmokeYellow_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Orange)", "3Rnd_SmokeOrange_Grenade_shell", 100],
	["40mm 3Rnd Smokes (Red)", "3Rnd_SmokeRed_Grenade_shell", 100],
	["40mm Flare Round (White)", "UGL_FlareWhite_F", 25],
	["40mm Flare Round (Green)", "UGL_FlareGreen_F", 25],
	["40mm Flare Round (Yellow)", "UGL_FlareYellow_F", 25],
	["40mm Flare Round (Red)", "UGL_FlareRed_F", 25],
	["40mm Flare Round (White)(v)", "F_40mm_White", 25],
	["40mm Flare Round (Red)(v)", "F_40mm_Red", 25],
	["40mm Flare Round (Yellow)(v)", "F_40mm_Yellow", 25],
	["40mm Flare Round (Green)(v)", "F_40mm_Green", 25],
	["40mm Flare Round (IR)", "UGL_FlareCIR_F", 25],
	["82mm Mortor Flare (White)", "Flare_82mm_AMOS_White", 25],
	["40mm 3Rnd Flares (White)", "3Rnd_UGL_FlareWhite_F", 50],
	["40mm 3Rnd Flares (Green)", "3Rnd_UGL_FlareGreen_F", 50],
	["40mm 3Rnd Flares (Yellow)", "3Rnd_UGL_FlareYellow_F", 50],
	["40mm 3Rnd Flares (Red)", "3Rnd_UGL_FlareRed_F", 50],
	["40mm 3Rnd Flares (IR)", "3Rnd_UGL_FlareCIR_F", 50]
];

//Gun Store item List
//Text name, classname, buy cost, item class
accessoriesArray = compileFinal str
[
	// Muzzle Brakes
	["DTK MuzzleBrake (AK)", "rhs_acc_dtk", 50, "item"],
	["DTK-1 MuzzleBrake (AK)", "rhs_acc_dtk1", 50, "item"],
	["DTK-2 MuzzleBrake (AK)", "rhs_acc_dtk2", 50, "item"],
	["DTK-3 MuzzleBrake (AK)", "rhs_acc_dtk3", 50, "item"],
	// FlashSuppressors
	["DPM AK-5 Flash Suppressor (AK)", "rhs_acc_ak5", 50, "item"],
	// Suppressors
	// ["Suppressor 9mm", "muzzle_snds_L", 500, "item"],
	// ["Suppressor .45 ACP", "muzzle_snds_acp", 750, "item"],
	["5.56mm Flash Suppressor", "rhsusf_acc_SF3P556", 50, "item"],
	["5.56mm Muzzle Brake", "rhsusf_acc_SFMB556", 50, "item"],
	["5.56mm Suppressor (Black)", "rhsusf_acc_nt4_black", 1000, "item"],
	["5.56mm Suppressor (Tan)", "rhsusf_acc_nt4_tan", 1000, "item"],
	["5.56mm Suppressor (Grey)", "rhsusf_acc_rotex5_grey", 1000, "item"],
	["7.62x39mm Suppressor (AK)", "rhs_acc_dtk4short", 1000, "item"],
	["7.62x39mm Suppressor (AK)", "rhs_acc_tgpa", 1000, "item"],
	["7.62x54mm Suppressor (Black)", "rhsusf_acc_SR25S", 2000, "item"],
	["7.62x54mm Suppressor (Desert)", "rhsusf_acc_SR25S_d", 2000, "item"],
	["7.62x54mm Suppressor (Woodland)", "rhsusf_acc_SR25S_wd", 2000, "item"],
	// ["Suppressor 5.56mm", "muzzle_snds_M", 1000, "item"],
	// ["Suppressor 5.56mm (Khaki)", "muzzle_snds_m_khk_F", 1000, "item", "noDLC"],
	// ["Suppressor 5.56mm (Sand)", "muzzle_snds_m_snd_F", 1000, "item", "noDLC"],
	// ["Suppressor 5.8mm", "muzzle_snds_58_blk_F", 1000, "item"],
	// ["Suppressor 5.8mm (Hex)", "muzzle_snds_58_hex_F", 1000, "item"],
	// ["Suppressor 5.8mm (G Hex)", "muzzle_snds_58_ghex_F", 1000, "item"],
	// ["Suppressor 6.5mm", "muzzle_snds_H", 1000, "item"],
	// ["Suppressor 6.5mm (Khaki)", "muzzle_snds_H_khk_F", 1000, "item", "noDLC"],
	// ["Suppressor 6.5mm (Sand)", "muzzle_snds_H_snd_F", 1000, "item", "noDLC"],
	// ["Suppressor 6.5mm LMG", "muzzle_snds_H_MG", 1250, "item"],
	// ["Suppressor 6.5mm LMG (Black)", "muzzle_snds_H_MG_blk_F", 1250, "item", "noDLC"],
	// ["Suppressor 6.5mm LMG (Khaki)", "muzzle_snds_H_MG_khk_F", 1250, "item", "noDLC"],
	// ["Suppressor 6.5mm Stealth", "muzzle_snds_65_TI_blk_F", 1250, "item"],
	// ["Suppressor 6.5mm Stealth (Hex)", "muzzle_snds_65_TI_hex_F", 1250, "item"],
	// ["Suppressor 6.5mm Stealth (G Hex)", "muzzle_snds_65_TI_ghex_F", 1250, "item"],
	// ["Suppressor 7.62mm", "muzzle_snds_B", 1250, "item"],
	// ["Suppressor 7.62mm (Khaki)", "muzzle_snds_B_khk_F", 1250, "item", "noDLC"],
	// ["Suppressor 7.62mm (Sand)", "muzzle_snds_B_snd_F", 1250, "item", "noDLC"],
	// ["Suppressor .338", "muzzle_snds_338_black", 1500, "item"],
	// ["Suppressor .338 (Green)", "muzzle_snds_338_green", 1500, "item"],
	// ["Suppressor .338 (Sand)", "muzzle_snds_338_sand", 1750, "item"],
	// ["Suppressor 9.3mm", "muzzle_snds_93mmg", 1750, "item"],
	// ["Suppressor 9.3mm (Tan)", "muzzle_snds_93mmg_tan", 1750, "item"],
	["ESR Suppressor (Desert)", "rhsusf_acc_M2010S_d", 2000, "item"],
	["ESR Suppressor (Semi-Arid)", "rhsusf_acc_M2010S_sa", 2000, "item"],
	["ESR Suppressor (WoodLand)", "rhsusf_acc_M2010S_wd", 2000, "item"],
	["LMG Compensator", "rhsusf_acc_ARDEC_M240", 2000, "item"],
	[".338 Suppressor (Black)", "muzzle_snds_338_black", 2000, "item"],
	[".338 Suppressor (Green)", "muzzle_snds_338_green", 2000, "item"],
	[".338 Suppressor (Sand)", "muzzle_snds_338_sand", 2000, "item"],
	
	// RHS, A3 Vanilla Weapon Attachments
	["Bipod (NATO)", "bipod_01_F_blk", 100, "item", "noDLC"],
	["Bipod (CSAT)", "bipod_02_F_blk", 100, "item", "noDLC"],
	["Bipod (AAF)", "bipod_03_F_blk", 100, "item", "noDLC"],
	["Bipod (MTP)", "bipod_01_F_mtp", 100, "item", "noDLC"],
	// ["Bipod (Hex)", "bipod_02_F_hex", 100, "item", "noDLC"],
	["Bipod (Olive)", "bipod_03_F_oli", 100, "item", "noDLC"],
	["Bipod (Sand)", "bipod_01_F_snd", 100, "item", "noDLC"],
	["Bipod (Tan)", "bipod_02_F_tan", 100, "item", "noDLC"],
	["Harris BiPod", "rhsusf_acc_harris_bipod", 100, "item"],
	["Harris Swivel BiPod", "rhs_acc_harris_swivel", 100, "item"],
	["Bipod (Khaki)", "bipod_01_F_khk", 100, "item", "noDLC"],
	["M952 Flashlight (Black)", "rhsusf_acc_M952V", 20, "item"],
	["WMX Flashlight (Black)", "rhsusf_acc_wmx_bk", 25, "item"],
	["WMX Flashlight (Tan)", "rhsusf_acc_wmx", 25, "item"],
	["AN/PEQ-15 (Black)", "rhsusf_acc_anpeq15side_bk", 100, "item"],
	["AN/PEQ-15 + Light (Black)", "rhsusf_acc_anpeq15_bk_light", 150, "item"],
	["AN/PEQ-15 (Tan)", "rhsusf_acc_anpeq15side", 100, "item"],
	["AN/PEQ-15 + Light (Tan)", "rhsusf_acc_anpeq15_wmx_light", 150, "item"],
	["AN/PEQ-15A (Black)", "rhsusf_acc_anpeq15A", 200, "item"],
	["AN/PEQ-16A/Light (Tan)", "rhsusf_acc_anpeq16a_light", 200, "item"],
	["Angled Fore Grip (Black)", "rhsusf_acc_grip2", 200, "item"],
	["Angled Fore Grip (Tan)", "rhsusf_acc_grip2_tan", 200, "item"],
	["Angled Fore Grip (Woodland)", "rhsusf_acc_grip2_wd", 200, "item"],
	["Vertical Grip (Black)", "rhsusf_acc_grip3", 200, "item"],
	["Vertical Grip (Tan)", "rhsusf_acc_grip3_tan", 200, "item"],
	// ["Flashlight", "acc_flashlight", 25, "item"],
	// ["Pistol Flashlight" ,"acc_flashlight_pistol", 25, "item"],
	// ["IR Laser Pointer", "acc_pointer_IR", 25, "item"],
	// ["Yorris Sight (Zubr Revolver)", "optic_Yorris", 50, "item"],
	// ["MRD Sight (4-Five Pistol)", "optic_MRD", 50, "item"],
	// ["ACO SMG (Red)", "optic_aco_smg", 50, "item"],
	// ["ACO SMG (Green)", "optic_ACO_grn_smg", 50, "item"],
	// ["ACO (Red)", "optic_Aco", 75, "item"],
	// ["ACO (Green)", "optic_Aco_grn", 75, "item"],
	// ["Holosight SMG", "optic_Holosight_smg", 50, "item"],
	// ["Holosight", "optic_Holosight", 75, "item"],
	
	//RHS, A3 Vanilla Optics
	["M3 MAAWS Sight", "rhs_optic_maaws", 50, "item"],
	["Cobra Red Dot (AK Style NoRail)", "rhs_acc_ekp1", 50, "item"],
	["Cobra Reflex (AK Style NoRail)", "rhs_acc_ekp8_02", 50, "item"],
	["PK-A Red Dot (AK Style NoRail)", "rhs_acc_pkas", 50, "item"],
	["PGO-7 V1 (AK/RPG Sight)", "rhs_acc_pgo7v", 50, "item"],
	["PGO-7 V2 (AK/RPG Sight)", "rhs_acc_pgo7v2", 50, "item"],
	["PGO-7 V3 (AK/RPG Sight)", "rhs_acc_pgo7v3", 50, "item"],
	["1P29 (AK Non-Rail)", "rhs_acc_1p29", 50, "item"],
	["Obzor 1P63 TCS (AK Style NoRail)", "rhs_acc_1p63", 50, "item"],
	["Kashtan 1P78 (AK Style NoRail)", "rhs_acc_1p78", 50, "item"],
	["1PN93 1st Gen (AK/RPG Sight)", "rhs_acc_1pn93_1", 50, "item"],
	["1PN93 2nd Gen (AK/RPG Sight)", "rhs_acc_1pn93_2", 50, "item"],
	["NIT-A (AK Style NoRail)", "rhs_acc_nita", 50, "item"],
	["1P87", "rhs_acc_1p87", 75, "item"],
	["Aimpoint Micro T1", "rhsusf_acc_T1_low", 50, "item"],
	["Trijicon RM05", "rhsusf_acc_rm05", 50, "item"],
	["eoTech", "rhsusf_acc_eotech", 75, "item"],
	["eoTech XPS", "rhsusf_acc_eotech_xps3", 75, "item"],
	["eoTech 552", "rhsusf_acc_eotech_552", 75, "item"],
	["Aimpoint Comp M4", "rhsusf_acc_compm4", 75, "item"],
	["Elcan Specter 1x-4x", "rhsusf_acc_spectedr", 75, "item"],
	["ACOG", "rhsusf_acc_ACOG_USMC", 100, "item"],
	["ACOG", "rhsusf_acc_acog", 100, "item"],
	["ACOG Desert", "rhsusf_acc_acog_d", 100, "item"],
	["ACOG MDO", "rhsusf_acc_acog_mdo", 150, "item"],
	["MICRO G33 T1", "rhsusf_acc_g33_t1", 150, "item"],
	// ["MRCO", "optic_MRCO", 100, "item"],
	// ["ERCO", "optic_ERCO_blk_F", 100, "item"],
	// ["ERCO (Khaki)", "optic_ERCO_khk_F", 100, "item"],
	// ["ERCO (Sand)", "optic_ERCO_snd_F", 100, "item"],
	// ["ARCO", "optic_Arco", 125, "item"],
	// ["ARCO (Black)", "optic_Arco_blk_F", 125, "item", "noDLC"],
	// ["ARCO (G Hex)", "optic_Arco_ghex_F", 125, "item", "noDLC"],
	// ["RCO", "optic_Hamr", 150, "item"],
	// ["RCO (Khaki)", "optic_Hamr_khk_F", 150, "item", "noDLC"],
	// ["MOS", "optic_SOS", 1500, "item"],
	// ["MOS (Khaki)", "optic_SOS_khk_F", 1500, "item", "noDLC"],
	["Rakurs 1P76 1x20", "rhs_acc_rakurspm", 150, "item"],
	["DMS", "optic_DMS", 1750, "item"],			// A3 Vanilla
	["DMS (G Hex)", "optic_DMS_ghex_F", 1750, "item", "noDLC"],		// A3 Vanilla
	["PSO-1 M2 (AK Style NoRail)", "rhs_acc_pso1m2", 1750, "item"],
	["PSO-1 M21 (AK Style NoRail)", "rhs_acc_pso1m21", 2000, "item"],
	// ["Kahlia (Sightless)", "optic_KHS_old", 200, "item"],
	// ["Kahlia", "optic_KHS_blk", 525, "item"],
	// ["Kahlia (Hex)", "optic_KHS_hex", 725, "item"],
	// ["Kahlia (Tan)", "optic_KHS_tan", 725, "item"],
	["AMS", "optic_AMS", 2500, "item"],			// A3 Vanilla
	["AMS (Khaki)", "optic_AMS_khk", 2500, "item"],			// A3 Vanilla
	["AMS (Sand)", "optic_AMS_snd", 2500, "item"],			// A3 Vanilla
	["DH5-20x56", "rhs_acc_dh520x56", 2500, "item"],
	["LRPS", "optic_LRPS", 3000, "item"],			// A3 Vanilla
	["LRPS (G Hex)", "optic_LRPS_ghex_F", 3000, "item", "noDLC"],		// A3 Vanilla
	["LRPS (Tropic)", "optic_LRPS_tna_F", 3000, "item", "noDLC"],		// A3 Vanilla
	["M8541A", "rhsusf_acc_premier_low", 3500, "item"],
	["LeupoldMK4 10x", "rhsusf_acc_LEUPOLDMK4", 3500, "item"],
	["LeupoldMK4 20x", "rhsusf_acc_LEUPOLDMK4_2", 4000, "item"],
	["ACOG NVS", "rhsusf_acc_ACOG_anpvs27", 4500, "item"],
	["M135 MUNS NVS FLIR", "rhsusf_acc_anpvs27", 7000, "item"],
	// ["NVS", "optic_NVS", 5000, "item"],
	["LeupoldMK4 10x NVS", "rhsusf_acc_premier_anpvs27", 7000, "item"],
	// ["TWS", "optic_tws", 50000, "item", "HIDDEN"], // To hide from store list, add "HIDDEN" after "item", like "item", "HIDDEN"]
	// ["TWS MG", "optic_tws_mg", 60000, "item", "HIDDEN"],
	// ["Nightstalker", "optic_Nightstalker", 75000, "item", "HIDDEN"]
	["Insight LWTS Thermal 640x480 Thermal", "rhsusf_acc_anpas13gv1", 25000, "item"]
];

// If commented, means the color/camo isn't implemented or is a duplicate of another hat
headArray = compileFinal str
[
	// RHS Helmets Blue (USF)
	["ACH (Green)", "rhsusf_ach_bare", 50, "hat"],
	["ACH (M-81)", "rhsusf_ach_helmet_M81", 50, "hat"],
	["ACH (Tan)", "rhsusf_ach_bare_tan_ess", 50, "hat"],
	["ACH (UCP)", "rhsusf_ach_helmet_ucp", 50, "hat"],
	["ACH (OCP)", "rhsusf_ach_helmet_ocp", 50, "hat"],
	["SpecOps (Black)", "rhsusf_opscore_bk", 50, "hat"],
	["SpecOps (MTP)", "rhsusf_opscore_mc_cover_pelt", 50, "hat"],
	["SpecOps (Ranger)", "rhsusf_opscore_rg_cover", 50, "hat"],
	["SpecOps ProTech", "rhsusf_protech_helmet_ess", 50, "hat"],
	["MICH", "rhsusf_mich_bare", 50, "hat"],
	["MICH NVG Support", "rhsusf_mich_bare_norotos", 50, "hat"],
	["MICH (Semi-Arid)", "rhsusf_mich_bare_semi", 50, "hat"],
	["MICH ARC (Semi-Arid)", "rhsusf_mich_bare_norotos_arc_semi", 50, "hat"],
	["MICH (TAN)", "rhsusf_mich_bare_tan", 50, "hat"],
	["MARPAT (Desert)", "rhsusf_lwh_helmet_marpatd_headset", 50, "hat"],
	["MARPAT (Woodland)", "rhsusf_lwh_helmet_marpatwd_headset_blk", 50, "hat"],
	
	// RHS Helmets Red (AFRF)
	["SSH-68", "rhs_ssh68", 50, "hat"],
	["CH Green", "rhs_6b27m_green_ess_bala", 50, "hat"],
	["CH Jungle", "rhs_6b26_ess", 50, "hat"],
	["CH Green ESS", "rhs_6b26_ess_green", 50, "hat"],
	["Altyn", "rhs_altyn_novisor_ess_bala", 50, "hat"],
	["Altyn Visor", "rhs_altyn_visordown", 50, "hat"],
	
	// RHS Helmets Brown (SAF)
	["M59", "rhssaf_helmet_m59_85_nocamo", 50, "hat"],
	["M59 Oakleaf", "rhssaf_helmet_m59_85_oakleaf", 50, "hat"],
	["M97 MD2 Camo", "rhssaf_helmet_m97_md2camo", 50, "hat"],
	["M97 Black", "rhssaf_helmet_m97_black_nocamo_black_ess_bare", 50, "hat"],
	["M97 DIGI (Woodland)", "rhssaf_helmet_m97_digital", 50, "hat"],
	["M97 DIGI ESS(Woodland)", "rhssaf_helmet_m97_digital_black_ess_bare", 50, "hat"],
	["M97 Oakleaf", "rhssaf_helmet_m97_oakleaf_black_ess_bare", 50, "hat"],
	["M97 OD", "rhssaf_helmet_m97_olive_nocamo_black_ess_bare", 50, "hat"],
	["M97 Woodland", "rhssaf_helmet_m97_woodland_black_ess_bare", 50, "hat"],
	
	// RHS Helmets Green (Gref)
	["M1 Bare", "rhsgref_helmet_M1_bare", 50, "hat"],
	["PASGT Tri Color (Desert)", "rhsgref_helmet_pasgt_3color_desert_rhino", 50, "hat"],
	["PASGT (Altis Lizard)", "rhsgref_helmet_pasgt_altis_lizard", 50, "hat"],
	["PASGT (ERDL Rhino)", "rhsgref_helmet_pasgt_erdl_rhino", 50, "hat"],
	["PASGT (FleckTarn)", "rhsgref_helmet_pasgt_flecktarn", 50, "hat"],
	["PASGT (OD)", "rhsgref_helmet_pasgt_olive", 50, "hat"],
	["PASGT (Woodland)", "rhsgref_helmet_pasgt_woodland_rhino", 50, "hat"],
	["SSH-68 (EMR)", "rhsgref_ssh68_emr", 50, "hat"],
	["SSH-68 (VSR)", "rhsgref_ssh68_vsr", 50, "hat"],
	["SSH-68 TTsKO (DIGI)", "rhsgref_ssh68_ttsko_digi", 50, "hat"],
	["SSH-68 TTsKO (Forest)", "rhsgref_ssh68_ttsko_forest", 50, "hat"],
	["SSH-68 TTsKO (Mountain)", "rhsgref_ssh68_ttsko_mountain", 50, "hat"],
	["SSH-68 TTsKO (Dark)", "rhsgref_ssh68_ttsko_dark", 50, "hat"],

	//A3 Vanilla Helmets
	["Modular Helmet (Digi)", "H_HelmetIA", 50, "hat"],
	// ["MICH (Camo)", "H_HelmetIA_net", 50, "hat"],
	// ["MICH 2 (Camo)", "H_HelmetIA_camo", 50, "hat"],
	["Combat Helmet", "H_HelmetB", 50, "hat"],
	["Combat Helmet (Black)", "H_HelmetB_black", 50, "hat"],
	["Combat Helmet (Camonet)", "H_HelmetB_camo", 50, "hat"],
	// ["Stealth Combat Helmet", "H_HelmetB_TI_tna_F", 75, "hat"],
	["Enhanced Combat Helmet", "H_HelmetSpecB", 75, "hat"],
	["Enhanced Combat Helmet (Black)", "H_HelmetSpecB_blk", 75, "hat"],
	["Enhanced Combat Helmet (Snakeskin)", "H_HelmetSpecB_snakeskin", 75, "hat"],
	["Enhanced Combat Helmet (Tropic)", "H_HelmetB_Enh_tna_F", 75, "hat", "noDLC"],
	// ["Protector Helmet (Hex)", "H_HelmetO_ocamo", 60, "hat"],
	// ["Protector Helmet (Urban)", "H_HelmetO_oucamo", 60, "hat"],
	// ["Assassin Helmet (Hex)", "H_HelmetSpecO_ocamo", 75, "hat"],
	// ["Assassin Helmet (Black)", "H_HelmetSpecO_blk", 75, "hat"],
	// ["Defender Helmet (Hex)", "H_HelmetLeaderO_ocamo", 100, "hat"],
	// ["Defender Helmet (Urban)", "H_HelmetLeaderO_oucamo", 100, "hat"],
	// ["Defender Helmet (G Hex)", "H_HelmetLeaderO_ghex_F", 100, "hat", "noDLC"],

	
	// RHS Aviation Helmets
	["CrewChief Helmet Black", "rhsusf_hgu56p_mask_black", 50, "hat"],
	["CrewChief Helmet OD", "rhsusf_hgu56p_mask_green", 50, "hat"],
	["CrewChief Skull Shield", "rhsusf_hgu56p_mask_black_skull", 50, "hat"],
	["Jet Pilot AMERICA", "rhsusf_hgu56p_visor_usa", 50, "hat"],
	["Jet Pilot w/ Visor", "rhsusf_hgu56p_visor", 50, "hat"],
	["Jet Pilot w/ Mask", "rhsusf_hgu56p_visor_mask", 50, "hat"],
	
	// A3 Vanilla Aviation Helmets
	["Heli Pilot Helmet (NATO)", "H_PilotHelmetHeli_B", 50, "hat"],
	["Heli Pilot Helmet (CSAT)", "H_PilotHelmetHeli_O", 50, "hat"],
	["Heli Pilot Helmet (AAF)", "H_PilotHelmetHeli_I", 50, "hat"],
	["Heli Crew Helmet (NATO)", "H_CrewHelmetHeli_B", 50, "hat"],
	["Heli Crew Helmet (CSAT)", "H_CrewHelmetHeli_O", 50, "hat"],
	["Heli Crew Helmet (AAF)", "H_CrewHelmetHeli_I", 50, "hat"],
	["Pilot Helmet (NATO)", "H_PilotHelmetFighter_B", 60, "hat"],
	["Pilot Helmet (CSAT)", "H_PilotHelmetFighter_O", 60, "hat"],
	["Pilot Helmet (AAF)", "H_PilotHelmetFighter_I", 60, "hat"],
	["Crew Helmet (NATO)", "H_HelmetCrew_B", 60, "hat"],
	["Crew Helmet (CSAT)", "H_HelmetCrew_O", 60, "hat"],
	["Crew Helmet (AAF)", "H_HelmetCrew_I", 60, "hat"],
	
	// Vanilla Caps
	// ["Military Cap (Blue)", "H_MilCap_blue", 25, "hat"],
	// ["Military Cap (Gray)", "H_MilCap_gry", 25, "hat"],
	// ["Military Cap (Urban)", "H_MilCap_oucamo", 25, "hat"],
	["Military Cap (Russia)", "H_MilCap_rucamo", 25, "hat"],
	["Military Cap (MTP)", "H_MilCap_mcamo", 25, "hat"],
	// ["Military Cap (Hex)", "H_MilCap_ocamo", 25, "hat"],
	["Military Cap (AAF)", "H_MilCap_dgtl", 25, "hat"],
	// ["Rangemaster Cap", "H_Cap_headphones", 25, "hat"],
	// ["Bandana (Black)", "H_Bandanna_gry", 10, "hat"],
	// ["Bandana (Blue)", "H_Bandanna_blu", 10, "hat"],
	// ["Bandana (Coyote)", "H_Bandanna_cbr", 10, "hat"],
	// ["Bandana (Headset)", "H_Bandanna_khk_hs", 10, "hat"],
	// ["Bandana (Khaki)", "H_Bandanna_khk", 10, "hat"],
	// ["Bandana (MTP)", "H_Bandanna_mcamo", 10, "hat"],
	// ["Bandana (Sage)", "H_Bandanna_sgg", 10, "hat"],
	// ["Bandana (Sand)", "H_Bandanna_sand", 10, "hat"],
	// ["Bandana (Woodland)", "H_Bandanna_camo", 10, "hat"],
	// ["Bandanna Mask (Black)", "H_BandMask_blk", 10, "hat"],
	// ["Bandanna Mask (Demon)", "H_BandMask_demon", 10, "hat"],
	// ["Bandanna Mask (Khaki)", "H_BandMask_khk", 10, "hat"],
	// ["Bandanna Mask (Reaper)", "H_BandMask_reaper", 10, "hat"],

	["Beanie (Black)", "H_Watchcap_blk", 10, "hat"],
	["Beanie (Brown)", "H_Watchcap_cbr", 10, "hat"],
	["Beanie (Khaki)", "H_Watchcap_khk", 10, "hat"],
	["Beanie (Navy)", "H_Watchcap_sgg", 10, "hat"],
	["Beanie (Olive)", "H_Watchcap_camo", 10, "hat"],
	// A3 Vanilla Boonie Hat
	["Booniehat (AAF)", "H_Booniehat_dgtl", 10, "hat"],
	["Booniehat (Headset)", "H_Booniehat_khk_hs", 10, "hat"],
	["Booniehat (Khaki)", "H_Booniehat_khk", 10, "hat"],
	["Booniehat (MTP)", "H_Booniehat_mcamo", 10, "hat"],
	["Booniehat (Olive)", "H_Booniehat_oli", 10, "hat"],
	["Booniehat (Sand)", "H_Booniehat_tan", 10, "hat"],
	
	// RHS Boonie Hat
	["Boonie Hat (M81)", "rhs_Booniehat_m81", 10, "hat"],
	["MARPAT Boonie (Desert)", "rhs_booniehat2_marpatd", 10, "hat"],
	["MARPAT Boonie (Woodland)", "rhs_booniehat2_marpatwd", 10, "hat"],
	["Boonie Hat (OCP)", "rhs_Booniehat_ocp", 10, "hat"],
	["Boonie Hat (UCP)", "rhs_Booniehat_ucp", 10, "hat"],
	["Boonie Hat (DIGI)", "rhssaf_booniehat_digital", 10, "hat"],
	["Boonie Hat (MD2)", "rhssaf_booniehat_md2camo", 10, "hat"],
	["Boonie Hat (Woodland)", "rhssaf_booniehat_woodland", 10, "hat"],
	
	// ["Cap (BI)", "H_Cap_grn_BI", 10, "hat"],
	// ["Cap (Black)", "H_Cap_blk", 10, "hat"],
	// ["Cap (Blue)", "H_Cap_blu", 10, "hat"],
	// ["Cap (CMMG)", "H_Cap_blk_CMMG", 10, "hat"],
	// ["Cap (Green)", "H_Cap_grn", 10, "hat"],
	// ["Cap (ION)", "H_Cap_blk_ION", 10, "hat"],
	// ["Cap (Olive)", "H_Cap_oli", 10, "hat"],
	// ["Cap (Olive, Headset)", "H_Cap_oli_hs", 10, "hat"],
	// ["Cap (Police)", "H_Cap_police", 10, "hat"],
	// ["Cap (Press)", "H_Cap_press", 10, "hat"],
	// ["Cap (Red)", "H_Cap_red", 10, "hat"],
	// ["Cap (Surfer)", "H_Cap_surfer", 10, "hat"],
	// ["Cap (Tan)", "H_Cap_tan", 10, "hat"],
	// ["Cap (UK)", "H_Cap_khaki_specops_UK", 10, "hat"],
	["Cap (US Black)", "H_Cap_usblack", 10, "hat"],
	["Cap (US MTP)", "H_Cap_tan_specops_US", 10, "hat"],
	["Cap (AAF)", "H_Cap_blk_Raven", 10, "hat"],
	["Cap (OPFOR)", "H_Cap_brn_SPECOPS", 10, "hat"],
	["Shemag (Olive)", "H_Shemag_olive", 25, "hat"],
	["Shemag (Olive, Headset)", "H_Shemag_olive_hs", 25, "hat"],
	["Shemag (Tan)", "H_ShemagOpen_tan", 25, "hat"],
	["Shemag (White)", "H_ShemagOpen_khk", 25, "hat"],
	["Shemag mask (Tan)", "H_Shemag_tan", 25, "hat"]
	// ["Racing Helmet (Black)", "H_RacingHelmet_1_black_F", 25, "hat"],
	// ["Racing Helmet (Blue)", "H_RacingHelmet_1_blue_F", 25, "hat"],
	// ["Racing Helmet (Green)", "H_RacingHelmet_1_green_F", 25, "hat"],
	// ["Racing Helmet (Yellow)", "H_RacingHelmet_1_yellow_F", 25, "hat"],
	// ["Racing Helmet (Orange)", "H_RacingHelmet_1_orange_F", 25, "hat"],
	// ["Racing Helmet (Red)", "H_RacingHelmet_1_red_F", 25, "hat"],
	// ["Racing Helmet (White)", "H_RacingHelmet_1_white_F", 25, "hat"],
	// ["Racing Helmet (Fuel)", "H_RacingHelmet_1_F", 25, "hat"],
	// ["Racing Helmet (Bluking)", "H_RacingHelmet_2_F", 25, "hat"],
	// ["Racing Helmet (Redstone)", "H_RacingHelmet_3_F", 25, "hat"],
	// ["Racing Helmet (Vrana)", "H_RacingHelmet_4_F", 25, "hat"]
];

uniformArray = compileFinal str
[
	// A3 Vanilla
	["Wetsuit", "U_B_Wetsuit", 200, "uni"],
	["Wetsuit", "U_O_Wetsuit", 200, "uni"],
	["Wetsuit", "U_I_Wetsuit", 200, "uni"],
	["Light Ghillie", "U_B_GhillieSuit", 2000, "uni"],
	["Light Ghillie", "U_O_GhillieSuit", 2000, "uni"],
	["Light Ghillie", "U_I_GhillieSuit", 2000, "uni"],
	["Light Ghillie (Jungle)", "U_B_T_Sniper_F", 2000, "uni"],
	["Light Ghillie (Jungle)", "U_O_T_Sniper_F", 2000, "uni"],
	["Full Ghillie (Arid)", "U_B_FullGhillie_ard", 20000, "uni"],
	["Full Ghillie (Arid)", "U_O_FullGhillie_ard", 20000, "uni"],
	["Full Ghillie (Arid)", "U_I_FullGhillie_ard", 20000, "uni"],
	["Full Ghillie (Lush)", "U_B_FullGhillie_lsh", 20000, "uni"],
	["Full Ghillie (Lush)", "U_O_FullGhillie_lsh", 20000, "uni"],
	["Full Ghillie (Lush)", "U_I_FullGhillie_lsh", 20000, "uni"],
	["Full Ghillie (Semi-Arid)", "U_B_FullGhillie_sard", 20000, "uni"],
	["Full Ghillie (Semi-Arid)", "U_O_FullGhillie_sard", 20000, "uni"],
	["Full Ghillie (Semi-Arid)", "U_I_FullGhillie_sard", 20000, "uni"],
	["Full Ghillie (Jungle)", "U_B_T_FullGhillie_tna_F", 20000, "uni"],
	["Full Ghillie (Jungle)", "U_O_T_FullGhillie_tna_F", 20000, "uni"],
	["Pilot Coveralls", "U_B_PilotCoveralls", 25, "uni"],
	["Pilot Coveralls", "U_O_PilotCoveralls", 25, "uni"],
	["Pilot Coveralls", "U_I_pilotCoveralls", 25, "uni"],
	["Heli Pilot Coveralls", "U_B_HeliPilotCoveralls", 25, "uni"],
	["Heli Pilot Coveralls", "U_I_HeliPilotCoveralls", 25, "uni"],
	
	// RHS Blue (USAF)
	["G3 Uniform (Black)", "rhs_uniform_g3_blk", 25, "uni"],
	["G3 Uniform (M81)", "rhs_uniform_g3_m81", 25, "uni"],
	["G3 Uniform (MTP)", "rhs_uniform_g3_mc", 25, "uni"],
	["G3 Uniform (Ranger)", "rhs_uniform_g3_rgr", 25, "uni"],
	["G3 Uniform (Tan)", "rhs_uniform_g3_tan", 25, "uni"],
	["Army Combat Uniform (UCP)", "rhs_uniform_acu_ucp", 25, "uni"],
	["Combat Uniform (UCP)", "rhs_uniform_cu_ucp", 25, "uni"],
	["Combat Uniform (OCP)", "rhs_uniform_cu_ocp", 25, "uni"],
	["MARPAT (Desert)", "rhs_uniform_FROG01_d", 25, "uni"],
	["MARPAT (Woodland)", "rhs_uniform_FROG01_wd", 25, "uni"],
	
	// RHS Red (AFRF)(CSAT)
	["Izlom", "rhs_uniform_mvd_izlom", 25, "uni"],
	["Gorka (Green)", "rhs_uniform_gorka_r_g", 25, "uni"],
	["Gorka (Tan)", "rhs_uniform_gorka_r_y", 25, "uni"],
	["EMR (Dessert)", "rhs_uniform_emr_des_patchless", 25, "uni"],
	["EMR (Summer 1)", "rhs_uniform_emr_patchless", 25, "uni"],
	["EMR (Summer 2)", "rhs_uniform_vdv_emr", 25, "uni"],
	["Flora", "rhs_uniform_flora_patchless", 25, "uni"],
	["Flora Alt.", "rhs_uniform_flora_patchless_alt", 25, "uni"],
	["Mountain Flora", "rhs_uniform_mflora_patchless", 25, "uni"],
	["M88 (Tan)", "rhs_uniform_m88_patchless", 25, "uni"],
	["DF15 Pilot (Blue)", "rhs_uniform_df15", 25, "uni"],
	["DF15 Pilot (Tan)", "rhs_uniform_df15_tan", 25, "uni"],
	["Fatigues (HEX)", "U_O_CombatUniform_ocamo", 25, "uni"],
	["Fatigues (Urban)", "U_O_CombatUniform_oucamo", 25, "uni"],
	["Officer Fatigues (HEX)", "U_O_OfficerUniform_ocamo", 25, "uni"],
	["Recon Fatigues (HEX)", "U_O_SpecopsUniform_ocamo", 25, "uni"],
	
	// RHS Brown (SAF)
	["M10 (Desert)", "rhssaf_uniform_m10_digital_desert", 25, "uni"],
	["M10 (Summer/TanBoots)", "rhssaf_uniform_m10_digital_tan_boots", 25, "uni"],
	["M10 (Summer)", "rhssaf_uniform_m10_digital_summer", 25, "uni"],
	["M93 (Oakleaf)", "rhssaf_uniform_m93_oakleaf", 25, "uni"],
	["M93 (Oakleaf Summer)", "rhssaf_uniform_m93_oakleaf_summer", 25, "uni"],
	["DF15 Pilot (Green)", "rhssaf_uniform_mig29_pilot", 25, "uni"],
	
	// RHS Green (Gref)
	["M10 (Mountain)", "rhsgref_uniform_para_ttsko_mountain", 25, "uni"],
	["M10 (OxBlood)", "rhsgref_uniform_para_ttsko_oxblood", 25, "uni"],
	["M10 (Urban)", "rhsgref_uniform_para_ttsko_urban", 25, "uni"],
	
	["M88 (VSR)", "rhsgref_uniform_vsr", 25, "uni"],
	["M88 (Forest)", "rhsgref_uniform_ttsko_forest", 25, "uni"],
	["M88 (Mountain)", "rhsgref_uniform_ttsko_mountain", 25, "uni"],
	["M88 (Urban)", "rhsgref_uniform_ttsko_urban", 25, "uni"],
	
	["M93 Tri Color (Desert)", "rhsgref_uniform_3color_desert", 25, "uni"],
	["M93 (AlpenFlage)", "rhsgref_uniform_alpenflage", 25, "uni"],
	["M93 (Altis Lizard)", "rhsgref_uniform_altis_lizard", 25, "uni"],
	["M93 (Altis Lizard / OD)", "rhsgref_uniform_altis_lizard_olive", 25, "uni"],
	["M93 (Jungle)", "rhsgref_uniform_dpm", 25, "uni"],
	["M93 (Jungle / OD)", "rhsgref_uniform_dpm_olive", 25, "uni"],
	["M93 (ERDL)", "rhsgref_uniform_ERDL", 25, "uni"],
	["M93 (Flecktarn)", "rhsgref_uniform_flecktarn_full", 25, "uni"],
	["M93 (Flecktarn / OD)", "rhsgref_uniform_flecktarn", 25, "uni"],
	["M93 (OG-107)", "rhsgref_uniform_og107", 25, "uni"],
	["M93 (OD)", "rhsgref_uniform_olive", 25, "uni"],
	["M93 (TigerStripe)", "rhsgref_uniform_tigerstripe", 25, "uni"],
	["M93 (UrbanReed)", "rhsgref_uniform_reed", 25, "uni"],
	["M93 (Woodland Jungle)", "rhsgref_uniform_woodland", 25, "uni"],
	["M93 (Woodland Jungle OD)", "rhsgref_uniform_woodland_olive", 25, "uni"],
	
	["Specter", "rhsgref_uniform_specter", 25, "uni"]
];

vestArray = compileFinal str
[
	// Vanilla
	["Rebreather (NATO)", "V_RebreatherB", 2000, "vest"],
	["Rebreather (CSAT)", "V_RebreatherIR", 2000, "vest"],
	["Rebreather (AAF)", "V_RebreatherIA", 2000, "vest"],
	
	["Tactical Vest (Black)", "V_TacVest_blk", -1, "vest"],
	["Tactical Vest (Brown)", "V_TacVest_brn", -1, "vest"],
	["Tactical Vest (Camo)", "V_TacVest_camo", -1, "vest"],
	["Tactical Vest (ERDL)", "rhsgref_TacVest_ERDL", -1, "vest"],		// RHS
	["Tactical Vest (Kaki)", "V_TacVest_khk", -1, "vest"],
	["Tactical Vest (OD)", "V_TacVest_oli", -1, "vest"],
	["Tactical Vest (Police)", "V_TacVest_blk_POLICE", -1, "vest"],
	["Tactical Vest (Stavrou)", "V_I_G_resistanceLeader_F", -1, "vest"],
	
	// RHS Red (AFRF)
	["6B13 (Flora)", "rhs_6b13_Flora", -1, "vest"],
	["6B13 Officer(Flora)", "rhs_6b13_Flora_crewofficer", -1, "vest"],
	["6B13 Rifleman (Flora)", "rhs_6b13_Flora_6sh92", -1, "vest"],
	["6B13 MG (Flora)", "rhs_6b13_Flora_6sh92_vog", -1, "vest"],
	["6B23 (Flora)", "rhs_6b23", -1, "vest"],
	["6B23 Officer (Flora)", "rhs_6b23_crewofficer", -1, "vest"],
	["6B23 Rifleman (Flora)", "rhs_6b23_6sh92", -1, "vest"],
	["6B23 MG (Flora)", "rhs_6b23_6sh92_vog", -1, "vest"],
	["6B23 Medic (Flora)", "rhs_6b23_medic", -1, "vest"],
	
	["6B13 (Summer)", "rhs_6b13_EMR", -1, "vest"],
	["6B13 Rifleman (Summer)", "rhs_6b13_EMR_6sh92", -1, "vest"],
	["6B13 MG (Summer)", "rhs_6b13_EMR_6sh92_vog", -1, "vest"],
	["6B23 (Summer)", "rhs_6b23_digi", -1, "vest"],
	["6B23 Officer (Summer)", "rhs_6b23_digi_crewofficer", -1, "vest"],
	["6B23 Rifleman (Summer)", "rhs_6b23_6sh116", -1, "vest"],
	["6B23 MG (Summer)", "rhs_6b23_6sh116_vog", -1, "vest"],
	["6B23 Medic (Summer)", "rhs_6b23_digi_medic", -1, "vest"],
	
	["6B23 (Mountain)", "rhs_uniform_vdv_mflora", -1, "vest"],
	["6B23 Officer (Mountain)", "rhs_6b23_ML_crewofficer", -1, "vest"],
	["6B23 Rifleman (Mountain)", "rhs_6b23_ML_6sh92", -1, "vest"],
	["6B23 MG (Mountain)", "rhs_6b23_ML_6sh92_vog", -1, "vest"],
	["6B23 Medic (Mountain)", "rhs_6b23_ML_medic", -1, "vest"],
	
	["6B13 (VSR)", "rhs_6b13", -1, "vest"],
	["6B13 Officer (VSR)", "rhs_6b13_crewofficer", -1, "vest"],
	["6B13 Rifleman (VSR)", "rhs_6b13_6sh92", -1, "vest"],
	["6B13 MG (VSR)", "rhs_6b13_6sh92_vog", -1, "vest"],
	
	["6B13 Rifleman (OD)", "rhs_6b23_6sh116_od", -1, "vest"],
	["6B13 MG (OD)", "rhs_6b23_6sh116_vog_od", -1, "vest"],
	["Vydra 3M (Green)", "rhs_vydra_3m", -1, "vest"],
	
	["6SH92 Rifleman (Flora)", "rhs_6sh92", -1, "vest"],
	["6SH92 MG (Flora)", "rhs_6sh92_vog", -1, "vest"],
	["6SH92 Rifleman (Summer)", "rhs_6sh92_digi", -1, "vest"],
	["6SH92 MG (Summer)", "rhs_6sh92_digi_vog", -1, "vest"],
	["6SH92 Rifleman (VSR)", "rhs_6sh92_vsr", -1, "vest"],
	["6SH92 MG (VSR)", "rhs_6sh92_vsr_vog", -1, "vest"],

	["Map Case and Holster", "rhs_vest_commander", -1, "vest"],	
	
	// RHS Green (GREF)
	["6B23 Officer (Khaki)", "rhsgref_6b23_khaki_officer", -1, "vest"],
	["6B23 Rifleman (Khaki)", "rhsgref_6b23_khaki_rifleman", -1, "vest"],
	["6B23 Medic (Khaki)", "rhsgref_6b23_khaki_medic", -1, "vest"],
	
	["6B23 Officer (Mountain)", "rhsgref_6b23_ttsko_mountain_officer", -1, "vest"],
	["6B23 Rifleman (Mountain)", "rhsgref_6b23_ttsko_mountain_rifleman", -1, "vest"],
	["6B23 Medic (Mountain)", "rhsgref_6b23_ttsko_mountain_medic", -1, "vest"],
	
	["6B23 Officer (DIGI)", "rhsgref_6b23_ttsko_digi_officer", -1, "vest"],
	["6B23 Rifleman (DIGI)", "rhsgref_6b23_ttsko_digi_rifleman", -1, "vest"],
	["6B23 Medic (DIGI)", "rhsgref_6b23_ttsko_digi_medic", -1, "vest"],
	
	["6B5-19 Offcer (Kaki)", "rhs_6b5_officer_khaki", -1, "vest"],
	["6B5-19 Rifleman (Kaki)", "rhs_6b5_khaki", -1, "vest"],
	["6B5-19 Medic (Kaki)", "rhs_6b5_medic_khaki", -1, "vest"],
	
	["6B5-19 Rifleman (OD)", "rhs_6b5", -1, "vest"],
	["6B5-19 Officer (OD)", "rhs_6b5_officer", -1, "vest"],
	["6B5-19 Medic (OD)", "rhs_6b5_medic", -1, "vest"],
	
	["6B5-19 Rifleman (TTsKO)", "rhs_6b5_ttsko", -1, "vest"],
	["6B5-19 Officer (TTsKO)", "rhs_6b5_officer_ttsko", -1, "vest"],
	["6B5-19 Medic (TTsKO)", "rhs_6b5_medic_ttsko", -1, "vest"],
	
	["6B5-19 Rifleman (VSR)", "rhs_6b5_vsr", -1, "vest"],
	["6B5-19 Officer (VSR)", "rhs_6b5_officer_vsr", -1, "vest"],
	["6B5-19 Medic (VSR)", "rhs_6b5_medic_vsr", -1, "vest"],
	
	["OTV (DIGI)", "rhsgref_otv_digi", -1, "vest"],
	["OTV (OD)", "rhsgref_otv_khaki", -1, "vest"],
	
	["ALICE WebGear", "rhsgref_alice_webbing", -1, "vest"],
	
	// RHS Blue (USAF)
	["IOTV (OCP)", "rhsusf_iotv_ocp", -1, "vest"],
	["IOTV TeamLeader (OCP)", "rhsusf_iotv_ocp_Teamleader", -1, "vest"],
	["IOTV Rifleman (OCP)", "rhsusf_iotv_ocp_Rifleman", -1, "vest"],
	["IOTV MG (OCP)", "rhsusf_iotv_ocp_SAW", -1, "vest"],
	["IOTV Grenadier (OCP)", "rhsusf_iotv_ocp_Grenadier", -1, "vest"],
	["IOTV Medic (OCP)", "rhsusf_iotv_ocp_Medic", -1, "vest"],
	["IOTV Engineer (OCP)", "rhsusf_iotv_ocp_Repair", -1, "vest"],
	["SPCS Carrier (OCP)", "rhsusf_spcs_ocp", -1, "vest"],
	["SPCS Carrier Rifleman (OCP)", "rhsusf_spcs_ocp_rifleman", -1, "vest"],
	["SpecOps OCP", "rhsusf_spcs_ocp_rifleman", -1, "vest"],
	
	["IOTV (UCP)", "rhsusf_iotv_ucp", -1, "vest"],
	["IOTV TeamLeader (UCP)", "rhsusf_iotv_ucp_Teamleader", -1, "vest"],
	["IOTV Rifleman (UCP)", "rhsusf_iotv_ucp_Rifleman", -1, "vest"],
	["IOTV MG (UCP)", "rhsusf_iotv_ucp_SAW", -1, "vest"],
	["IOTV Grenadier (UCP)", "rhsusf_iotv_ucp_Grenadier", -1, "vest"],
	["IOTV Medic (UCP)", "rhsusf_iotv_ucp_Medic", -1, "vest"],
	["IOTV Engineer (UCP)", "rhsusf_iotv_ucp_Repair", -1, "vest"],
	["SPCS Carrier (UCP)", "rhsusf_spcs_ucp", -1, "vest"],
	["SPCS Carrier Rifleman (UCP)", "rhsusf_spcs_ucp_rifleman", -1, "vest"],
	["SpecOps (UCP)", "rhsusf_spcs_ucp_rifleman", -1, "vest"],
	
	["MBAV", "rhsusf_mbav", -1, "vest"],
	["MBAV Rifleman", "rhsusf_mbav_rifleman", -1, "vest"],
	["MBAV MG", "rhsusf_mbav_mg", -1, "vest"],
	["MBAV Medic", "rhsusf_mbav_medic", -1, "vest"],
	
	["SPC Carrier", "rhsusf_spc", -1, "vest"],
	["SPC Carrier SquadLead", "rhsusf_spc_squadleader", -1, "vest"],
	["SPC Carrier Rifleman", "rhsusf_spc_rifleman", -1, "vest"],
	["SPC Carrier MG", "rhsusf_spc_mg", -1, "vest"],
	["SPC Carrier Grenadier", "rhsusf_spc_teamleader", -1, "vest"],
	["SPC Carrier Medic", "rhsusf_spc_corpsman", -1, "vest"],
	["SPC Carrier Marksman", "rhsusf_spc_marksman", -1, "vest"],
	["SPC Carrier Crewman", "rhsusf_spc_crewman", -1, "vest"],

	// RHS SAF
	["MD98 Rifleman", "rhssaf_vest_md98_rifleman", -1, "vest"],
	["MD99 Rifleman Rig", "rhssaf_vest_md99_md2camo_rifleman", -1, "vest"],
	["MD99 Rifleman Rig (Woodland)", "rhssaf_vest_md99_woodland_rifleman", -1, "vest"],
	["MD99 Digi (Woodland)", "rhssaf_vest_md99_digital", -1, "vest"],
	["MD99 Digi Rifleman (Woodland)", "rhssaf_vest_md99_digital_rifleman", -1, "vest"],
	["MD12 Digi Carrier (Woodland)", "rhssaf_vest_md12_digital", -1, "vest"],
	["MD12 Digi Carrier (Desert)", "rhssaf_vest_md12_digital_desert", -1, "vest"],
	["OTV (MD2)", "rhssaf_vest_otv_md2camo", -1, "vest"]
];

backpackArray = compileFinal str
[
	//["Parachute", "B_Parachute", 200, "backpack"],
	["Sidor (Olive)", "rhs_sidor", 50, "backpack"],
	["Assault Pack (Black)", "B_AssaultPack_blk", 100, "backpack"],
	// ["Assault Pack (Green)", "B_AssaultPack_rgr", 100, "backpack"],
	// ["Assault Pack (MTP)", "B_AssaultPack_mcamo", 100, "backpack"],
	["Assault Pack (Coyote)", "B_AssaultPack_cbr", 100, "backpack"],
	["Assault Pack (Kaki)", "B_AssaultPack_khk", 100, "backpack"],
	["Assault Pack (Olive)", "rhsusf_falconii", 100, "backpack"],
	["Assault Pack (Coyote)", "rhsusf_falconii_coy", 100, "backpack"],
	["Assault Pack (MultiCam)", "rhsusf_falconii_mc", 100, "backpack"],
	// ["Assault Pack (Hex)", "B_AssaultPack_ocamo", 100, "backpack"],
	// ["Assault Pack (Tropic)", "B_AssaultPack_tna_F", 100, "backpack", "noDLC"],

	// ["Field Pack (Black)", "B_FieldPack_blk", 200, "backpack"],
	// ["Field Pack (Coyote)", "B_FieldPack_cbr", 200, "backpack"],
	// ["Field Pack (Khaki)", "B_FieldPack_khk", 200, "backpack"],
	// ["Field Pack (Urban)", "B_FieldPack_oucamo", 200, "backpack"],
	// ["Field Pack (Olive)", "B_FieldPack_oli", 200, "backpack"],
	// ["Field Pack (G Hex)", "B_FieldPack_ghex_F", 200, "backpack", "noDLC"],

	["Eagle Coyote", "rhsusf_assault_eagleaiii_coy", 200, "backpack"],
	["Eagle (OCP)", "rhsusf_assault_eagleaiii_ocp", 200, "backpack"],
	["Eagle (UCP)", "rhsusf_assault_eagleaiii_ucp", 200, "backpack"],
	["UMBTS Green", "rhs_assault_umbts", 200, "backpack"],
	["UMBTS Engineer Green", "rhs_assault_umbts_engineer_empty", 200, "backpack"],

	["Kitbag (Coyote)", "B_Kitbag_cbr", 350, "backpack"],
	["Kitbag (Green)", "B_Kitbag_rgr", 350, "backpack"],
	["Kitbag (MTP)", "B_Kitbag_mcamo", 350, "backpack"],
	["KitBag DIGI (Woodland)", "rhssaf_kitbag_digital", 500, "backpack"],
	["KitBag (MD-2)", "rhssaf_kitbag_md2camo", 350, "backpack"],
	["KitBag (Sage)", "rhssaf_kitbag_smb", 350, "backpack"],
	
	["ALICE Pack (Olive)", "rhsgref_hidf_alicepack", 750, "backpack"],
	["ALICE Pack (TTsKO)", "rhsgref_ttsko_alicepack", 750, "backpack"],
	["ALICE Pack (Woodland)", "rhsgref_wdl_alicepack", 750, "backpack"],
	["ALICE Pack (MD-2)", "rhssaf_alice_md2camo", 750, "backpack"],
	["ALICE Pack (Sage)", "rhssaf_alice_smb", 750, "backpack"],

	// ["Kitbag (Sage)", "B_Kitbag_sgg", 350, "backpack"],
	// ["Kitbag (Black)", "B_TacticalPack_blk", 350, "backpack"],
	// ["Kitbag (MTP)", "B_TacticalPack_mcamo", 350, "backpack"],
	// ["Kitbag (HEX)", "B_TacticalPack_ocamo", 350, "backpack"],
	// ["Kitbag (Olive)", "B_TacticalPack_oli", 350, "backpack"],
	// ["Kitbag (Green)", "B_TacticalPack_rgr", 350, "backpack"],

	["Viper Light Harness (Black)", "B_ViperLightHarness_blk_F", 3500, "backpack", "noDLC"],
	["Viper Light Harness (Hex)", "B_ViperLightHarness_hex_F", 3500, "backpack", "noDLC"],
	// ["Viper Light Harness (G Hex)", "B_ViperLightHarness_ghex_F", 3500, "backpack", "noDLC"],
	["Viper Light Harness (Khaki)", "B_ViperLightHarness_khk_F", 3500, "backpack", "noDLC"],
	["Viper Light Harness (Olive)", "B_ViperLightHarness_oli_F", 3500, "backpack", "noDLC"],

	["Viper Harness (Black)", "B_ViperHarness_blk_F", 4250, "backpack", "noDLC"],
	["Viper Harness (Hex)", "B_ViperHarness_hex_F", 4250, "backpack", "noDLC"],
	// ["Viper Harness (G Hex)", "B_ViperHarness_ghex_F", 4250, "backpack", "noDLC"],
	["Viper Harness (Khaki)", "B_ViperHarness_khk_F", 4250, "backpack", "noDLC"],
	["Viper Harness (Olive)", "B_ViperHarness_oli_F", 4250, "backpack", "noDLC"],
	
	["Carryall (Khaki)", "B_Carryall_khk", 5000, "backpack"],
	["Carryall (MTP)", "B_Carryall_mcamo", 5000, "backpack"],
	["Carryall (Olive)", "B_Carryall_oli", 5000, "backpack"],
	["Carryall (Urban)", "B_Carryall_oucamo", 5000, "backpack"],
	["Carryall (Coyote)", "B_Carryall_cbr", 5000, "backpack"],
	["Carryall (G Hex)", "B_Carryall_ghex_F", 5000, "backpack", "noDLC"],

	// ["Bergen (Digital)", "B_Bergen_dgtl_F", 10000, "backpack", "noDLC"],
	["Bergen (Hex)", "B_Bergen_hex_F", 10000, "backpack", "noDLC"],
	["Bergen (MTP)", "B_Bergen_mcamo_F", 10000, "backpack", "noDLC"]
	// ["Bergen (Tropic)", "B_Bergen_tna_F", 10000, "backpack", "noDLC"]
];

genItemArray = compileFinal str
[
	["UAV Terminal (NATO)", "B_UavTerminal", 1500, "gps"],
	["UAV Terminal (CSAT)", "O_UavTerminal", 1500, "gps"],
	["UAV Terminal (AAF)", "I_UavTerminal", 1500, "gps"],
	["Quadcopter UAV (NATO)", "B_UAV_01_backpack_F", 25000, "backpack"],
	["Quadcopter UAV (CSAT)", "O_UAV_01_backpack_F", 25000, "backpack"],
	["Quadcopter UAV (AAF)", "I_UAV_01_backpack_F", 25000, "backpack"],
	["Hexacopter UAV (NATO)", "B_UAV_06_backpack_F", 10000, "backpack"],
	["Hexacopter UAV (CSAT)", "O_UAV_06_backpack_F", 10000, "backpack"],
	["Hexacopter UAV (AAF)", "I_UAV_06_backpack_F", 10000, "backpack"],
	["Hexacopter Medical UAV (NATO)", "B_UAV_06_medical_backpack_F", 15000, "backpack"],
	["Hexacopter Medical UAV (CSAT)", "O_UAV_06_medical_backpack_F", 15000, "backpack"],
	["Hexacopter Medical UAV (AAF)", "I_UAV_06_medical_backpack_F", 15000, "backpack"],
	["Hexacopter Demining UAV", "C_IDAP_UAV_06_antimine_backpack_F", 100000, "backpack"],
	["Remote Designator (Sand)", "B_Static_Designator_01_weapon_F", 7500, "backpack"],
	// ["Remote Designator (Hex)", "O_Static_Designator_02_weapon_F", 7500, "backpack"],
	["GPS", "ItemGPS", 100, "gps"],
	["First Aid Kit", "FirstAidKit", 25, "item"],
	["Medikit", "Medikit", 1500, "item"],
	["Toolkit", "ToolKit", 1500, "item"],
	["Mine Detector", "MineDetector", 1000, "item"],
	["Diving Goggles", "G_Diving", 1000, "gogg"],
	// ["NV Goggles (Brown)", "NVGoggles", 100, "nvg"],
	// ["NV Goggles (Black)", "NVGoggles_OPFOR", 100, "nvg"],
	// ["NV Goggles (Green)", "NVGoggles_INDEP", 100, "nvg"],
	// ["NV Goggles (Tropic)", "NVGoggles_tna_F", 100, "nvg"],
	// ["Compact NVG (Hex)", "O_NVGoggles_hex_F", 150, "nvg"],
	// ["Compact NVG (G Hex)", "O_NVGoggles_ghex_F", 150, "nvg"],
	// ["Compact NVG (Urban)", "O_NVGoggles_urb_F", 150, "nvg"],
	["AN/PVS 14 NVG", "rhsusf_ANPVS_14", 150, "nvg"],
	["AN/PVS 15 NVG", "rhsusf_ANPVS_15", 200, "nvg"],
	["Binoculars", "Binocular", 50, "binoc"],
	["Leupold Spotting Scope", "Leupold_Mk4", 100, "binoc"],
	["Rangefinder", "Rangefinder", 1500, "binoc"],
	["Lerca 1200 Tan", "lerca_1200_tan", 1500, "binoc"],
	["Vector 21 Range NV", "rhsusf_lrf_Vector21", 1500, "binoc"],
	//["Laser Designator (Sand)", "Laserdesignator", 2500, "binoc", "noDLC"],
	//["Laser Designator (Olive)", "Laserdesignator_03", 2500, "binoc", "noDLC"],
	// ["Laser Designator (Khaki)", "Laserdesignator_01_khk_F", 2500, "binoc", "noDLC"],
	// ["Laser Designator (Hex)", "Laserdesignator_02", 3000, "binoc", "noDLC"],
	// ["Laser Designator (G Hex)", "Laserdesignator_02_ghex_F", 3000, "binoc", "noDLC"],
	["IR Designator Grenade", "B_IR_Grenade", 50, "mag", "WEST"],
	["IR Designator Grenade", "O_IR_Grenade", 50, "mag", "EAST"],
	["IR Designator Grenade", "I_IR_Grenade", 50, "mag", "GUER"],
	["Chemlight (Blue)", "Chemlight_blue", 25, "mag"],
	["Chemlight (Green)", "Chemlight_green", 25, "mag"],
	["Chemlight (Yellow)", "Chemlight_yellow", 25, "mag"],
	["Chemlight (Red)", "Chemlight_red", 25, "mag"],
	["Stealth Balaclava (Black)", "G_Balaclava_TI_blk_F", 200, "gogg"],
	["Stealth Balaclava (Black, Goggles)", "G_Balaclava_TI_G_blk_F", 250, "gogg"],
	["Stealth Balaclava (Green)", "G_Balaclava_TI_tna_F", 200, "gogg"],
	["Stealth Balaclava (Green, Goggles)", "G_Balaclava_TI_G_tna_F", 250, "gogg"],
	["Combat Goggles", "G_Combat", 25, "gogg"],
	["Combat Goggles FULL NVG", "G_Combat_Goggles_tna_F", 5000, "gogg", "noDLC"],
	["VR Goggles", "G_Goggles_VR", 25, "gogg"],
	["Balaclava (Black)", "G_Balaclava_blk", 25, "gogg"],
	["Balaclava (Combat Goggles)", "G_Balaclava_combat", 25, "gogg"],
	["Balaclava (Low Profile Goggles)", "G_Balaclava_lowprofile", 25, "gogg"],
	["Balaclava (Olive)", "G_Balaclava_oli", 25, "gogg"],
	["Bandana (Aviator)", "G_Bandanna_aviator", 25, "gogg"],
	["Bandana (Beast)", "G_Bandanna_beast", 25, "gogg"],
	["Bandana (Black)", "G_Bandanna_blk", 25, "gogg"],
	["Bandana (Khaki)", "G_Bandanna_khk", 25, "gogg"],
	["Bandana (Olive)", "G_Bandanna_oli", 25, "gogg"],
	["Bandana (Shades)", "G_Bandanna_shades", 25, "gogg"],
	["Bandana (Sport)", "G_Bandanna_sport", 25, "gogg"],
	["Bandana (Tan)", "G_Bandanna_tan", 25, "gogg"],
	["Aviator Glasses", "G_Aviator", 10, "gogg"],
	// ["Ladies Shades", "G_Lady_Blue", 10, "gogg"],
	// ["Ladies Shades (Fire)", "G_Lady_Red", 10, "gogg"],
	// ["Ladies Shades (Iridium)", "G_Lady_Mirror", 10, "gogg"],
	// ["Ladies Shades (Sea)", "G_Lady_Dark", 10, "gogg"],
	["Low Profile Goggles", "G_Lowprofile", 10, "gogg"],
	["Shades (Black)", "G_Shades_Black", 10, "gogg"],
	// ["Shades (Blue)", "G_Shades_Blue", 10, "gogg"],
	// ["Shades (Green)", "G_Shades_Green", 10, "gogg"],
	// ["Shades (Red)", "G_Shades_Red", 10, "gogg"],
	["Spectacle Glasses", "G_Spectacles", 10, "gogg"],
	// ["Sport Shades (Fire)", "G_Sport_Red", 10, "gogg"],
	// ["Sport Shades (Poison)", "G_Sport_Blackyellow", 10, "gogg"],
	// ["Sport Shades (Shadow)", "G_Sport_BlackWhite", 10, "gogg"],
	// ["Sport Shades (Style)", "G_Sport_Checkered", 10, "gogg"],
	// ["Sport Shades (Vulcan)", "G_Sport_Blackred", 10, "gogg"],
	// ["Sport Shades (Yetti)", "G_Sport_Greenblack", 10, "gogg"],
	["Square Shades", "G_Squares_Tinted", 10, "gogg"],
	["Square Spectacles", "G_Squares", 10, "gogg"],
	["Tactical Glasses", "G_Tactical_Clear", 10, "gogg"],
	["Tactical Shades", "G_Tactical_Black", 10, "gogg"],
	["Tinted Spectacles", "G_Spectacles_Tinted", 10, "gogg"]
];

allStoreMagazines = compileFinal str (call ammoArray + call throwputArray + call genItemArray);
allRegularStoreItems = compileFinal str (call allGunStoreFirearms + call allStoreMagazines + call accessoriesArray);
allStoreGear = compileFinal str (call headArray + call uniformArray + call vestArray + call backpackArray);

genObjectsArray = compileFinal str
[
	["Base Locker", "Land_Device_assembled_F", 1000000, "object"],
	["Base door", "Land_Canal_Wall_10m_F", 25000, "object"],
	["Base door key", "Land_InfoStand_V2_F", 10000, "object"],
	["Camo Net", "CamoNet_INDP_open_F", 200, "object", "HIDDEN"], // unlisted, only for object saving
	["Cargo House", "Land_Cargo_House_V1_F", 100000, "object"],
	["Airport Tower", "Land_Airport_Tower_F", 300000, "object"],
	["Cargo HQ", "Land_Cargo_HQ_V1_F", 250000, "object"],
	["LightHouse", "Land_LightHouse_F", 300000, "object"],
	["Car Port", "Land_Shed_Small_F", 200000, "object"],
	["Car Port Big", "Land_Shed_big_F", 300000, "object"],
	["Pier Ladder", "Land_PierLadder_F", 2500, "object"],
	["Ammo Cache", "Box_FIA_Support_F", 2500, "ammocrate"],
	["Taru Cargo Pod", "Land_Pod_Heli_Transport_04_Box_F", 7500, "object"],
	["Metal Barrel", "Land_MetalBarrel_F", 25, "object"],
	// ["Toilet Box", "Land_ToiletBox_F", 25, "object"],
	["Runway Lamp", "Land_runway_edgelight", 500, "object"],
	["Lamp Post (Harbour)", "Land_LampHarbour_F", 1000, "object"],
	["Lamp Post (Shabby)", "Land_LampShabby_F", 1000, "object"],
	["Boom Gate", "Land_BarGate_F", 1500, "object"],
	// ["Pipes", "Land_Pipes_Large_F", 2000, "object"],
	["Concrete Frame", "Land_CncShelter_F", 2000, "object"],
	["Highway Guardrail", "Land_Crash_barrier_F", 2000, "object"],
	["Concrete Barrier", "Land_CncBarrier_F", 2000, "object"],
	["Concrete Barrier (Medium)", "Land_CncBarrierMedium_F", 3500, "object"],
	["Concrete Barrier (Long)", "Land_CncBarrierMedium4_F", 5000, "object"],
	["Sandbag Corner", "land_bagfence_corner_F", 500, "object"],
	["Sandbag Long", "land_bagfence_long_F", 750, "object"],
	["HBarrier (1 block)", "Land_HBarrier_1_F", 1500, "object"],
	["HBarrier (3 blocks)", "Land_HBarrier_3_F", 2000, "object"],
	["HBarrier (5 blocks)", "Land_HBarrier_5_F", 2500, "object"],
	["HBarrier Big", "Land_HBarrierBig_F", 5000, "object"],
	["HBarrier Wall (4 blocks)", "Land_HBarrierWall4_F", 4000, "object"],
	["HBarrier Wall (6 blocks)", "Land_HBarrierWall6_F", 5000, "object"],
	["HBarrier Watchtower", "Land_HBarrierTower_F", 6000, "object"],
	["Concrete Wall", "Land_CncWall1_F", 4000, "object"],
	["Concrete Military Wall", "Land_Mil_ConcreteWall_F", 4000, "object"],
	["Concrete Wall (Long)", "Land_CncWall4_F", 6000, "object"],
	["Military Wall (Big)", "Land_Mil_WallBig_4m_F", 6000, "object"],
	["Shoot House Wall", "Land_Shoot_House_Wall_F", 1800, "object"],
	["Canal Wall (Small)", "Land_Canal_WallSmall_10m_F", 4000, "object"],
	["Canal Stairs", "Land_Canal_Wall_Stairs_F", 5000, "object"],
	["Razorwire", "Land_Razorwire_F", 5000, "object"],
	["Bag Fence (Corner)", "Land_BagFence_Corner_F", 1500, "object"],
	["Bag Fence (End)", "Land_BagFence_End_F", 1500, "object"],
	["Bag Fence (Long)", "Land_BagFence_Long_F", 2000, "object"],
	["Bag Fence (Round)", "Land_BagFence_Round_F", 1500, "object"],
	["Bag Fence (Short)", "Land_BagFence_Short_F", 1500, "object"],
	["Bag Bunker (Small)", "Land_BagBunker_Small_F", 2500, "object"],
	["Bag Bunker (Large)", "Land_BagBunker_Large_F", 5000, "object"],
	["Bag Bunker Tower", "Land_BagBunker_Tower_F", 10000, "object"],
	["Military Cargo Post", "Land_Cargo_Patrol_V1_F", 8000, "object"],
	["Military Cargo Tower", "Land_Cargo_Tower_V1_F", 100000, "object"],
	["Concrete Ramp", "Land_RampConcrete_F", 3500, "object"],
	["Concrete Ramp (High)", "Land_RampConcreteHigh_F", 5000, "object"],
	["Concrete Stairs", "land_gh_stairs_f", 750, "object"],
	["Scaffolding", "Land_Scaffolding_F", 2500, "object"]
];

allGenStoreVanillaItems = compileFinal str (call genItemArray + call genObjectsArray + call allStoreGear);

//Text name, classname, buy cost, spawn type, sell price (selling not implemented) or spawning color
landArray = compileFinal str
[
	// SKIPSAVE = will not be autosaved until first manual force save, good for cheap vehicles that usually get abandoned

	// ["Kart", "C_Kart_01_F", 500, "vehicle", "SKIPSAVE"],

	["Quadbike (Civilian)", "C_Quadbike_01_F", 600, "vehicle", "SKIPSAVE"],
	["Quadbike (NATO)", "B_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],
	["Quadbike (CSAT)", "O_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],
	["Quadbike (AAF)", "I_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],
	["Quadbike (FIA)", "B_G_Quadbike_01_F", 650, "vehicle", "SKIPSAVE"],

	["Hatchback", "C_Hatchback_01_F", 800, "vehicle", "SKIPSAVE"],
	["Hatchback Sport", "C_Hatchback_01_sport_F", 1000, "vehicle", "SKIPSAVE"],
	["SUV", "C_SUV_01_F", 1100, "vehicle", "SKIPSAVE"],

	["MB 4WD", "C_Offroad_02_unarmed_F", 1000, "vehicle", "SKIPSAVE"],
	// ["MB 4WD (Guerilla)", "I_C_Offroad_02_unarmed_F", 900, "vehicle", "SKIPSAVE"],

	["Offroad", "C_Offroad_01_F", 1100, "vehicle", "SKIPSAVE"],
	["Offroad Camo", "B_G_Offroad_01_F", 1250, "vehicle", "SKIPSAVE"],
	["Offroad Police", "B_GEN_Offroad_01_gen_F", 1250, "vehicle", "SKIPSAVE", "noDLC"],
	["Offroad Repair", "C_Offroad_01_repair_F", 15000, "vehicle", "SKIPSAVE"],
	["Offroad HMG", "B_G_Offroad_01_armed_F", 25000, "vehicle", "SKIPSAVE"],

	["Truck", "C_Van_01_transport_F", 700, "vehicle", "SKIPSAVE"],
	// ["Truck Camo", "B_G_Van_01_transport_F", 800, "vehicle", "SKIPSAVE"],
	// ["Truck Box", "C_Van_01_box_F", 900, "vehicle", "SKIPSAVE"],
	// ["Fuel Truck", "C_Van_01_fuel_F", 20000, "vehicle", "SKIPSAVE"],
	// ["Fuel Truck Camo", "B_G_Van_01_fuel_F", 21000, "vehicle", "SKIPSAVE"],

	// ["Van Cargo", "C_Van_02_vehicle_F", 1000, "vehicle", "SKIPSAVE"],
	// ["Van Transport", "C_Van_02_transport_F", 1000, "vehicle", "SKIPSAVE"],
	// ["Van Police Cargo", "B_GEN_Van_02_vehicle_F", 1250, "vehicle", "SKIPSAVE"],
	// ["Van Police Transport", "B_GEN_Van_02_transport_F", 1250, "vehicle", "SKIPSAVE"],
	// ["Van Ambulance", "C_Van_02_medevac_F", 1500, "vehicle", "SKIPSAVE"],
	// ["Van Repair", "C_Van_02_service_F", 20000, "vehicle", "SKIPSAVE"],

	// ["HEMTT Resupply", "B_Truck_01_ammo_F", 50000, "vehicle"],
	// ["HEMTT Transport", "B_Truck_01_transport_F", 6000, "vehicle"],
	// ["HEMTT Covered", "B_Truck_01_covered_F", 7000, "vehicle"],
	// ["HEMTT Fuel", "B_Truck_01_fuel_F", 80000, "vehicle"],
	// ["HEMTT Medical", "B_Truck_01_medical_F", 90000, "vehicle"],
	// ["HEMTT Repair", "B_Truck_01_Repair_F", 100000, "vehicle"],
	// ["HEMTT Cargo", "B_Truck_01_box_F", 6000, "vehicle"],


	// RHS Support Vehicles
	["Ural Open", "RHS_Ural_Open_MSV_01", 2000, "vehicle"],
	["Ural Covered", "RHS_Ural_MSV_01", 2000, "vehicle"],
	["Ural Fuel", "RHS_Ural_Fuel_MSV_01", 80000, "vehicle"],
	["Ural Repair", "RHS_Ural_Repair_MSV_01", 100000, "vehicle"],
	["GAZ 66 Covered", "rhs_gaz66_vmf", 2000, "vehicle"],
	["GAZ 66 Medical", "rhs_gaz66_ap2_vmf", 75000, "vehicle"],
	["GAZ 66 Repair", "rhs_gaz66_repair_vmf", 100000, "vehicle"],
	["GAZ 66 Resupply", "rhs_gaz66_ammo_vmf", 50000, "vehicle"],
	["Kamaz Covered", "rhs_kamaz5350_msv", 2000, "vehicle"],
	["Typhoon Box", "rhs_typhoon_vdv", 2000, "vehicle"],
	["M1078 Covered", "rhsusf_M1078A1P2_WD_fmtv_usarmy", 2000, "vehicle"],
	["M1078 Box", "rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy", 2000, "vehicle"],
	["M1085 Medical", "rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy", 75000, "vehicle"],
	["HEMTT FlatBed", "rhsusf_M977A4_usarmy_wd", 2000, "vehicle"],
	["HEMTT Tractor", "B_Truck_01_mover_F", 4000, "vehicle"],
	["HEMTT Repair", "rhsusf_M977A4_REPAIR_usarmy_wd", 100000, "vehicle"],
	["HEMTT Resupply", "rhsusf_M977A4_AMMO_usarmy_wd", 50000, "vehicle"],
	["HEMTT Fuel", "rhsusf_M978A4_usarmy_wd", 50000, "vehicle"]
	// ["Tempest Device", "O_Truck_03_device_F", 4000, "vehicle"],
	// ["Tempest Resupply", "O_Truck_03_ammo_F", 50000, "vehicle"],
	// ["Tempest Transport", "O_Truck_03_transport_F", 6000, "vehicle"],
	// ["Tempest Covered", "O_Truck_03_covered_F", 7000, "vehicle"],
	// ["Tempest Fuel", "O_Truck_03_fuel_F", 80000, "vehicle"],
	// ["Tempest Medical", "O_Truck_03_medical_F", 90000, "vehicle"],
	// ["Tempest Repair", "O_Truck_03_repair_F", 100000, "vehicle"],

	// ["Zamak Resupply", "I_Truck_02_ammo_F", 40000, "vehicle"],
	// ["Zamak Transport", "I_Truck_02_transport_F", 4500, "vehicle"],
	// ["Zamak Covered", "I_Truck_02_covered_F", 5000, "vehicle"],
	// ["Zamak Fuel", "I_Truck_02_fuel_F", 60000, "vehicle"],
	// ["Zamak Medical", "I_Truck_02_medical_F", 70000, "vehicle"],
	// ["Zamak Repair", "I_Truck_02_box_F", 80000, "vehicle"],

	// ["UGV Stomper (NATO)", "B_UGV_01_F", 25000, "vehicle"],
	// ["UGV Stomper RCWS (NATO)", "B_UGV_01_rcws_F", 150000, "vehicle"],
	// ["UGV Stomper (AAF)", "I_UGV_01_F", 25000, "vehicle"],
	// ["UGV Stomper RCWS (AAF)", "I_UGV_01_rcws_F", 150000, "vehicle"],
	// ["UGV Saif (CSAT)", "O_UGV_01_F", 25000, "vehicle"],
	// ["UGV Saif RCWS (CSAT)", "O_UGV_01_rcws_F", 150000, "vehicle"]
];

armoredArray = compileFinal str
[
	// ["Prowler (Doorless)", "B_CTRG_LSV_01_light_F", 1500, "vehicle", "SKIPSAVE"],
	// ["Prowler", "B_T_LSV_01_unarmed_F", 2000, "vehicle", "SKIPSAVE"],
	// ["Prowler HMG", "B_T_LSV_01_armed_F", 6000, "vehicle", "SKIPSAVE"],
	// ["Qilin", "O_T_LSV_02_unarmed_F", 2000, "vehicle", "SKIPSAVE"],
	// ["Qilin Minigun", "O_T_LSV_02_armed_F", 6000, "vehicle", "SKIPSAVE"],
	// RHS Unarmed Land Vehicles
	["POLARIS MRZR", "rhsusf_mrzr4_d", 2000, "vehicle"],		// RHS
	["UAZ", "RHS_UAZ_MSV_01", 3000, "vehicle"],		// RHS
	["HUMVEE", "rhsusf_m1025_w", 7000, "vehicle"],		// RHS
	["GAZ Tigr", "rhs_tigr_m_vdv", 7000, "vehicle"],		// RHS
	["RG-33", "rhsusf_rg33_usmc_d", 10000, "vehicle"],		// RHS
	["M1078 4x4 2.5 Ton", "rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy", 12000, "vehicle"],		// RHS
	// RHS Armed Land Vehicles
	["UAZ w/ DShK", "rhsgref_cdf_reg_uaz_dshkm", 50000, "vehicle"],
	["UAZ w/ GMG", "rhsgref_cdf_reg_uaz_ags", 50000, "vehicle"],
	["UAZ w/ SPG9", "rhsgref_cdf_reg_uaz_spg9", 50000, "vehicle"],		// RHS
	["HUMVEE HMG", "rhsusf_m1025_w_m2", 100000, "vehicle"],		// RHS
	["HUMVEE GMG", "rhsusf_m1025_w_mk19", 150000, "vehicle"],		// RHS
	["RG-33 HMG", "rhsusf_rg33_m2_usmc_d", 100000, "vehicle"],		// RHS
	["BM-21 Grad", "RHS_BM21_MSV_01", 100000, "vehicle"],		// RHS
	["Caiman with M153", "rhsusf_M1220_M153_M2_usarmy_d", 175000, "vehicle"],		// RHS
	["M1232 MRAP HMG", "rhsusf_M1232_M2_usarmy_d", 200000, "vehicle"],		// RHS
	["M1232 MRAP GMG", "rhsusf_M1232_MK19_usarmy_d", 250000, "vehicle"],		// RHS
	["GAZ Tigr Armed", "rhs_tigr_sts_vdv", 200000, "vehicle"],		// RHS
	["M1078 4x4 Armed", "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", 200000, "vehicle"],		// RHS
	["GAZ-66 /w ZU-23 AA", "rhs_gaz66_zu23_vmf", 200000, "vehicle"],		// RHS
	// RHS APC
	["M-1117 ASV", "rhsusf_M1117_D", 200000, "vehicle"],
	["BTR-70", "rhs_btr70_vmf", 150000, "vehicle"],	
	["BTR-80", "rhs_btr80_msv", 200000, "vehicle"],
	["M113 APC (UnArmed)", "rhsusf_m113_usarmy_unarmed", 20000, "vehicle"],
	["M113 APC (M240)", "rhsusf_m113_usarmy_M240", 50000, "vehicle"],
	["M113 APC (M2)", "rhsusf_m113_usarmy", 100000, "vehicle"],
	["M113 APC (MK19)", "rhsusf_m113_usarmy_MK19", 100000, "vehicle"],
	["BMD-1PK", "rhs_bmd1pk", 100000, "vehicle"],
	["BMD-1", "rhs_bmd1", 150000, "vehicle"],
	["BMD-1P", "rhs_bmd1p", 200000, "vehicle"],
	["BMD-1R", "rhs_bmd1r", 250000, "vehicle"],
	["BMD-2", "rhs_bmd2", 150000, "vehicle"],
	["BMD-2M", "rhs_bmd2m", 250000, "vehicle"],
	["BMD-4", "rhs_bmd4_vdv", 300000, "vehicle"],
	["BMP-1", "rhs_bmp1_vdv", 200000, "vehicle"],
	["BMP-1P", "rhs_bmp1p_vdv", 250000, "vehicle"],
	["BMP-2K", "rhs_bmp2k_vdv", 300000, "vehicle"],
	["BMP-3", "rhs_bmp3_late_msv", 300000, "vehicle"]
];

tanksArray = compileFinal str
[
	["BRM-1k", "rhs_brm1k_vdv", 325000, "vehicle"],
	["M2A2 Bradley", "RHS_M2A2", 375000, "vehicle"],
	["Shilka AA ZSU-23", "rhs_zsu234_aa", 375000, "vehicle"],
	["M2A3 Bradley", "RHS_M2A3", 400000, "vehicle"],
	["T-80", "rhs_t80", 400000, "vehicle"],
	["T-80UM", "rhs_t80um", 450000, "vehicle"],
	["2S25 Sprut-SD", "rhs_sprut_vdv", 400000, "vehicle"],
	["T-72 B3", "rhs_t72bd_tv", 500000, "vehicle"],
	["2S3 Akatsiya", "rhs_2s3_tv", 500000, "vehicle"],
	["T-90 TV", "rhs_t90a_tv", 500000, "vehicle"],
	["M1A1 Abrams", "rhsusf_m1a1aimwd_usarmy", 500000, "vehicle"],
	["M-109 Howitzer", "rhsusf_m109_usarmy", 500000, "vehicle"]
];

helicoptersArray = compileFinal str
[
	// ["Hexacopter Demining UAV", "C_IDAP_UAV_06_antimine_F", (call genItemArray) select {_x select 1 == "C_IDAP_UAV_06_antimine_backpack_F"} select 0 select 2, "vehicle", "HIDDEN"], // for resupply price
	["M-900 Civilian", "C_Heli_Light_01_civil_F", 6000, "vehicle"], // MH-6, no flares
	//["MH-9 Hummingbird", "B_Heli_Light_01_F", 8000, "vehicle"], // MH-6
	["MH-6M", "RHS_MELB_MH6M", 7000, "vehicle"],		// RHS
	// ["PO-30 Orca (Unarmed)", "O_Heli_Light_02_unarmed_F", 6000, "vehicle"], // Ka-60
	// ["WY-55 Hellcat (Unarmed)", "I_Heli_light_03_unarmed_F", 7000, "vehicle"], // AW159
	["UH-1Y (Unarmed)", "RHS_UH1Y_UNARMED", 7000, "vehicle"],
	// ["CH-49 Mohawk", "I_Heli_Transport_02_F", 8000, "vehicle"], // AW101
	["Kamov Ka-60", "rhs_ka60_grey", 8000, "vehicle"],		// RHS
	["Russian Mi-24", "RHS_Mi24Vt_vvs", 8000, "vehicle"],		// RHS

	["Mi-290 Taru (Resupply)", "O_Heli_Transport_04_ammo_F", 100000, "vehicle"],
	["Mi-290 Taru (Crane)", "O_Heli_Transport_04_F", 7500, "vehicle"], // CH-54
	["Mi-290 Taru (Box)", "O_Heli_Transport_04_box_F", 8000, "vehicle"],
	["Mi-290 Taru (Fuel)", "O_Heli_Transport_04_fuel_F", 8500, "vehicle"],
	["Mi-290 Taru (Bench)", "O_Heli_Transport_04_bench_F", 9000, "vehicle"],
	["Mi-290 Taru (Transport)", "O_Heli_Transport_04_covered_F", 9500, "vehicle"],
	["Mi-290 Taru (Medical)", "O_Heli_Transport_04_medevac_F", 125000, "vehicle"],
	["Mi-290 Taru (Repair)", "O_Heli_Transport_04_repair_F", 150000, "vehicle"],
	
	["Russian Mi-8", "RHS_Mi8AMT_vvs", 75000, "vehicle"],
	["CH-47 Chinook Armed", "RHS_CH_47F", 75000, "vehicle"],		// RHS
	// ["CH-67 Huron (Unarmed)", "B_Heli_Transport_03_unarmed_F", 10000, "vehicle"], // CH-47
	// ["CH-67 Huron (Armed)", "B_Heli_Transport_03_F", 200000, "vehicle"], // CH-47 with 2 side miniguns
	["CH-53 Super Stallion", "rhsusf_CH53E_USMC", 50000, "vehicle"],		// RHS
	["Russian Mi-8 Unarmed", "RHS_Mi8mt_vvs", 50000, "vehicle"],		// RHS
	["Russian Mi-8 Armed", "RHS_Mi8MTV3_vvs", 75000, "vehicle"],		// RHS

	["UH-60 Black Hawk UnArmed", "RHS_UH60M2", 50000, "vehicle"],		// RHS
	["UH-60 Black Hawk Armed", "RHS_UH60M", 100000, "vehicle"],		// RHS
	["UH-80 Ghost Hawk", "B_Heli_Transport_01_F", 125000, "vehicle"], // UH-60 Stealth with 2 side miniguns
	//["AH-9 Pawnee", "B_Heli_Light_01_dynamicLoadout_F", 350000, "vehicle", "variant_pawneeNormal"], // Armed AH-6
	["AH-6M LittleBird", "RHS_MELB_AH6M", 150000, "vehicle"],		// RHS
	["PO-30 Orca (DAGR)", "O_Heli_Light_02_dynamicLoadout_F", 300000, "vehicle", "variant_orcaDAR"], // Armed Ka-60
	["WY-55 Hellcat (Armed)", "I_Heli_light_03_dynamicLoadout_F", 400000, "vehicle"], // Armed AW159
	// ["AH-99 Blackfoot", "B_Heli_Attack_01_dynamicLoadout_F", 500000, "vehicle"], // RAH-66 with gunner
	["UH-1Y Venom", "RHS_UH1Y", 500000, "vehicle"], 		// RHS
	// ["Mi-48 Kajman", "O_Heli_Attack_02_dynamicLoadout_F", 600000, "vehicle"], // Mi-28 with gunner
	["Mi-24V", "RHS_Mi24V_vvs", 550000, "vehicle"], 		// RHS	
	["Mi-24G", "rhsgref_mi24g_CAS", 575000, "vehicle"], 		// RHS	
	["Russian Mi-28", "rhs_mi28n_vvs", 600000, "vehicle"],		// RHS
	["Kamov Ka-52", "RHS_Ka52_vvsc", 600000, "vehicle"],		// RHS
	["AH64D Apache", "RHS_AH64D", 600000, "vehicle"],		// RHS
	["AH1ZD Viper", "RHS_AH1Z", 600000, "vehicle"],		// RHS
	["Solviet Mi-8MTV3", "RHS_Mi8MTV3_vvs", 650000, "vehicle"],		// RHS

	["MQ-12 Falcon UAV", "B_T_UAV_03_F", 500000, "vehicle"] // Do NOT use "B_T_UAV_03_dynamicLoadout_F" (doesn't support ASRAAM pylons)
];

planesArray = compileFinal str
[
	["Antonov An-2", "RHS_AN2", 1500, "vehicle"],		// RHS
	["Caesar BTT", "C_Plane_Civil_01_F", 2500, "vehicle"],
	["TU-95 Tupolev", "RHS_TU95MS_vvs_old", 25000, "vehicle"],			// RHS

	// ["A-143 Buzzard AA", "I_Plane_Fighter_03_dynamicLoadout_F", 400000, "vehicle", "variant_buzzardAA"],
	// ["A-143 Buzzard CAS", "I_Plane_Fighter_03_dynamicLoadout_F", 500000, "vehicle", "variant_buzzardCAS"],

	// ["A-149 Gryphon", "I_Plane_Fighter_04_F", 500000, "vehicle"],

	["F/A-181 Black Wasp (Gun-Only)", "B_Plane_Fighter_01_Stealth_F", 200000, "vehicle"], // no missiles or bombs
	["F/A-181 Black Wasp", "B_Plane_Fighter_01_F", 650000, "vehicle"],

	// ["To-201 Shikra (Gun-Only)", "O_Plane_Fighter_02_Stealth_F", 250000, "vehicle"], // no missiles or bombs
	// ["To-201 Shikra", "O_Plane_Fighter_02_F", 750000, "vehicle"],

	["A-10 ThunderBolt", "RHS_A10", 500000, "vehicle"],			// RHS
	// ["A-164 Wipeout CAS", "B_Plane_CAS_01_dynamicLoadout_F", 750000, "vehicle"],
	// ["To-199 Neophron CAS", "O_Plane_CAS_02_dynamicLoadout_F", 750000, "vehicle"],

	// ["V-44 X Blackfish (Infantry)", "B_T_VTOL_01_infantry_F", 10000, "vehicle"],
	// ["V-44 X Blackfish (Gunship)", "B_T_VTOL_01_armed_F", 600000, "vehicle"],
	["Y-32 VTOL", "O_T_VTOL_02_infantry_dynamicLoadout_F", 300000, "vehicle"],
	["T-50 Golden Eagle", "RHS_T50_vvs_generic", 200000, "vehicle"],		// RHS
	["Aero L-39 Albatros", "rhs_l39_cdf", 200000, "vehicle"],		// RHS
	["Aero L-159 Alca", "rhs_l159_CDF", 200000, "vehicle"],		// RHS
	["SU-25 Sukhoi", "RHS_Su25SM_vvs", 250000, "vehicle"],		// RHS
	["MiG-29 Mikoyan", "rhs_mig29sm_vvs", 300000, "vehicle"],		// RHS
	["MiG-29s Mikoyan", "rhs_mig29s_vvs", 300000, "vehicle"],		// RHS
	["F-22 Raptor", "rhsusf_f22", 300000, "vehicle"],		// RHS
	["C-130 Hercules", "RHS_C130J", 10000, "vehicle"],		// RHS
	

	// ["KH-3A Fenghuang Missile UAV", "O_T_UAV_04_CAS_F", 300000, "vehicle"],

	["Yakovlev Pchela", "rhs_pchela1t_vvs", 10000, "vehicle"],		// RHS
	
	["MQ4A Greyhawk Missile UAV", "B_UAV_02_dynamicLoadout_F", 300000, "vehicle", "variant_greyhawkMissile"],
	["K40 Ababil-3 Missile UAV", "O_UAV_02_dynamicLoadout_F", 300000, "vehicle", "variant_greyhawkMissile"],
	["K40 Ababil-3 Missile UAV", "I_UAV_02_dynamicLoadout_F", 300000, "vehicle", "variant_greyhawkMissile"],

	["MQ4A Greyhawk Bomber UAV", "B_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkBomber"], // Bomber UAVs are a lot harder to use, hence why they are cheaper than Missile ones
	["K40 Ababil-3 Bomber UAV", "O_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkBomber"],
	["K40 Ababil-3 Bomber UAV", "I_UAV_02_dynamicLoadout_F", 150000, "vehicle", "variant_greyhawkBomber"],

	["MQ4A Greyhawk Cluster UAV", "B_UAV_02_dynamicLoadout_F", 200000, "vehicle", "variant_greyhawkCluster"],
	["K40 Ababil-3 Cluster UAV", "O_UAV_02_dynamicLoadout_F", 200000, "vehicle", "variant_greyhawkCluster"],
	["K40 Ababil-3 Cluster UAV", "I_UAV_02_dynamicLoadout_F", 200000, "vehicle", "variant_greyhawkCluster"],

	["MQ4A Greyhawk DAGR UAV", "B_UAV_02_dynamicLoadout_F", 600000, "vehicle", "variant_greyhawkDAGR"],
	["K40 Ababil-3 DAGR UAV", "O_UAV_02_dynamicLoadout_F", 600000, "vehicle", "variant_greyhawkDAGR"],
	["K40 Ababil-3 DAGR UAV", "I_UAV_02_dynamicLoadout_F", 600000, "vehicle", "variant_greyhawkDAGR"]

	// ["UCAV Sentinel Missile", "B_UAV_05_F", 400000, "vehicle", "variant_sentinelMissile"],
	// ["UCAV Sentinel Bomber", "B_UAV_05_F", 200000, "vehicle", "variant_sentinelBomber"],
	// ["UCAV Sentinel Cluster", "B_UAV_05_F", 250000, "vehicle", "variant_sentinelCluster"]
];

boatsArray = compileFinal str
[
	["Water Scooter", "C_Scooter_Transport_01_F", 500, "boat", "SKIPSAVE"],

	["Rescue Boat", "C_Rubberboat", 500, "boat", "SKIPSAVE"],
	["Rescue Boat (NATO)", "B_Lifeboat", 500, "boat", "SKIPSAVE"],
	["Rescue Boat (CSAT)", "O_Lifeboat", 500, "boat", "SKIPSAVE"],
	["Assault Boat (NATO)", "B_Boat_Transport_01_F", 600, "boat", "SKIPSAVE"],
	["Assault Boat (CSAT)", "O_Boat_Transport_01_F", 600, "boat", "SKIPSAVE"],
	["Assault Boat (AAF)", "I_Boat_Transport_01_F", 600, "boat", "SKIPSAVE"],
	["Assault Boat (FIA)", "B_G_Boat_Transport_01_F", 600, "boat", "SKIPSAVE"],
	["Motorboat", "C_Boat_Civil_01_F", 1000, "boat", "SKIPSAVE"],
	["Motorboat Rescue", "C_Boat_Civil_01_rescue_F", 900, "boat", "SKIPSAVE"],
	["Motorboat Police", "C_Boat_Civil_01_police_F", 1100, "boat", "SKIPSAVE"],

	["RHIB", "I_C_Boat_Transport_02_F", 1500, "boat", "SKIPSAVE"],
	
	["Mk. V SOC", "rhsusf_mkvsoc", 40000, "boat"],

	["Speedboat HMG (CSAT)", "O_Boat_Armed_01_hmg_F", 40000, "boat", "SKIPSAVE"],
	["Speedboat Minigun (NATO)", "B_Boat_Armed_01_minigun_F", 40000, "boat", "SKIPSAVE"],
	["Speedboat Minigun (AAF)", "I_Boat_Armed_01_minigun_F", 40000, "boat", "SKIPSAVE"],
	["SDV Submarine (NATO)", "B_SDV_01_F", 15000, "submarine", "SKIPSAVE"],
	["SDV Submarine (CSAT)", "O_SDV_01_F", 15000, "submarine", "SKIPSAVE"],
	["SDV Submarine (AAF)", "I_SDV_01_F", 15000, "submarine", "SKIPSAVE"]
];

allVehStoreVehicles = compileFinal str (call landArray + call armoredArray + call tanksArray + call helicoptersArray + call planesArray + call boatsArray);

uavArray = compileFinal str
[
	// Deprecated
];

noColorVehicles = compileFinal str
[
	// Deprecated
];

rgbOnlyVehicles = compileFinal str
[
	// Deprecated
];

_color = "#(rgb,1,1,1)color";
_texDir = "client\images\vehicleTextures\";
_kartDir = "\A3\soft_f_kart\Kart_01\Data\";
_mh9Dir = "\A3\air_f\Heli_Light_01\Data\";
_mohawkDir = "\A3\air_f_beta\Heli_Transport_02\Data\";
_wreckDir = "\A3\structures_f\wrecks\data\";
_gorgonDir = "\A3\armor_f_gamma\APC_Wheeled_03\data\";

colorsArray = compileFinal str
[
	[ // Main colors
		"All",
		[
			["Black", _color + "(0.01,0.01,0.01,1)"], // #(argb,8,8,3)color(0.1,0.1,0.1,0.1)
			["Gray", _color + "(0.15,0.151,0.152,1)"], // #(argb,8,8,3)color(0.5,0.51,0.512,0.3)
			["White", _color + "(0.75,0.75,0.75,1)"], // #(argb,8,8,3)color(1,1,1,0.5)
			["Dark Blue", _color + "(0,0.05,0.15,1)"], // #(argb,8,8,3)color(0,0.3,0.6,0.05)
			["Blue", _color + "(0,0.03,0.5,1)"], // #(argb,8,8,3)color(0,0.2,1,0.75)
			["Teal", _color + "(0,0.3,0.3,1)"], // #(argb,8,8,3)color(0,1,1,0.15)
			["Green", _color + "(0,0.5,0,1)"], // #(argb,8,8,3)color(0,1,0,0.15)
			["Yellow", _color + "(0.5,0.4,0,1)"], // #(argb,8,8,3)color(1,0.8,0,0.4)
			["Orange", _color + "(0.4,0.09,0,1)"], // #(argb,8,8,3)color(1,0.5,0,0.4)
			["Red", _color + "(0.45,0.005,0,1)"], // #(argb,8,8,3)color(1,0.1,0,0.3)
			["Pink", _color + "(0.5,0.03,0.3,1)"], // #(argb,8,8,3)color(1,0.06,0.6,0.5)
			["Purple", _color + "(0.1,0,0.3,1)"], // #(argb,8,8,3)color(0.8,0,1,0.1)
			["NATO Tan", _texDir + "nato.paa"], // #(argb,8,8,3)color(0.584,0.565,0.515,0.3)
			["CSAT Brown", _texDir + "csat.paa"], // #(argb,8,8,3)color(0.624,0.512,0.368,0.3)
			["AAF Green", _texDir + "aaf.paa"], // #(argb,8,8,3)color(0.546,0.59,0.363,0.2)
			["Bloodshot", _texDir + "bloodshot.paa"],
			["Carbon", _texDir + "carbon.paa"],
			["Confederate", _texDir + "confederate.paa"],
			["Denim", _texDir + "denim.paa"],
			["Digital", _texDir + "digi.paa"],
			["Digital Black", _texDir + "digi_black.paa"],
			["Digital Desert", _texDir + "digi_desert.paa"],
			["Digital Woodland", _texDir + "digi_wood.paa"],
			["Doritos", _texDir + "doritos.paa"],
			["Drylands", _texDir + "drylands.paa"],
			["Hello Kitty", _texDir + "hellokitty.paa"],
			["Hex", _texDir + "hex.paa"],
			["Hippie", _texDir + "hippie.paa"],
			["ISIS", _texDir + "isis.paa"],
			["Leopard", _texDir + "leopard.paa"],
			["Mountain Dew", _texDir + "mtndew.paa"],
			["'Murica", _texDir + "murica.paa"],
			["Nazi", _texDir + "nazi.paa"],
			["Orange Camo", _texDir + "camo_orange.paa"],
			["Pink Camo", _texDir + "camo_pink.paa"],
			["Pride", _texDir + "pride.paa"],
			["Psych", _texDir + "psych.paa"],
			["Red Camo", _texDir + "camo_red.paa"],
			["Rusty", _texDir + "rusty.paa"],
			["Sand", _texDir + "sand.paa"],
			["Snake", _texDir + "snake.paa"],
			["Stripes", _texDir + "stripes.paa"],
			["Stripes 2", _texDir + "stripes2.paa"],
			["Stripes 3", _texDir + "stripes3.paa"],
			["Swamp", _texDir + "swamp.paa"],
			["Tiger", _texDir + "tiger.paa"],
			["Trippy", _texDir + "rainbow.paa"],
			["Union Jack", _texDir + "unionjack.paa"],
			["Urban", _texDir + "urban.paa"],
			["Weed", _texDir + "weed.paa"],
			["Woodland", _texDir + "woodland.paa"],
			["Woodland Dark", _texDir + "wooddark.paa"],
			["Woodland Tiger", _texDir + "woodtiger.paa"]
		]
	],
	[ // Kart colors
		"Kart_01_Base_F",
		[
			["Bluking (Kart)", ["Bluking"]],
			["Fuel (Kart)", ["Fuel"]],
			["Redstone (Kart)", ["Redstone"]],
			["Vrana (Kart)", ["Vrana"]],
			["Black (Kart)", ["Black"]], // ["Black (Kart)", [configName (configFile >> "CfgVehicles" >> "C_Kart_01_F" >> "TextureSources" >> "Black")]],
			["White (Kart)", ["White"]],
			["Blue (Kart)", ["Blue"]],
			["Green (Kart)", ["Green"]],
			["Yellow (Kart)", ["Yellow"]],
			["Orange (Kart)", ["Orange"]],
			["Red (Kart)", [[0, _kartDir + "kart_01_base_red_co.paa"]]] // no red TextureSource :(
		]
	],
	[ // Ambulance color
		"Van_02_medevac_base_F",
		[
			["IDAP Ambulance (Van)", ["IdapAmbulance"]]
		]
	],
	[ // Van colors
		"Van_02_base_F",
		[
			["AAN News (Van)", ["AAN"]],
			["Battle Bus (Van)", ["BattleBus"]],
			["Black (Van)", ["Black"]],
			["Blue (Van)", ["Blue"]],
			["Blue Pearl (Van)", ["BluePearl"]],
			["Daltgreen (Van)", ["Daltgreen"]],
			["Dazzle (Van)", ["Masked"]],
			["Guerilla 1 (Van)", ["FIA1"]],
			["Guerilla 2 (Van)", ["FIA2"]],
			["Guerilla 3 (Van)", ["FIA3"]],
			["Fuel (Van)", ["Fuel"]],
			["Green (Van)", ["Green"]],
			["IDAP (Van)", ["IDAP"]],
			["Orange (Van)", ["Orange"]],
			["Port Authority (Van)", ["CivService"]],
			["Red (Van)", ["Red"]],
			["Redstone (Van)", ["Redstone"]],
			["Swifd (Van)", ["Swifd"]],
			["Syndikat (Van)", ["Syndikat"]],
			["Vrana (Van)", ["Vrana"]],
			["White (Van)", ["White"]]
		]
	],
	[ // MH-9 colors
		"Heli_Light_01_base_F",
		[
			["AAF Camo (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_indp_co.paa"]]],
			["Blue 'n White (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_blue_co.paa"]]],
			["Blueline (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_blueline_co.paa"]]],
			["Cream Gravy (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_co.paa"]]],
			["Digital (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_digital_co.paa"]]],
			["Elliptical (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_elliptical_co.paa"]]],
			["Furious (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_furious_co.paa"]]],
			["Graywatcher (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_graywatcher_co.paa"]]],
			["ION (MH-9)", [[0, _mh9Dir + "heli_light_01_ext_ion_co.paa"]]],
			["Jeans (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_jeans_co.paa"]]],
			["Light (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_light_co.paa"]]],
			["Shadow (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_shadow_co.paa"]]],
			["Sheriff (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sheriff_co.paa"]]],
			["Speedy (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_speedy_co.paa"]]],
			["Sunset (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_sunset_co.paa"]]],
			["Vrana (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_vrana_co.paa"]]],
			["Wasp (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wasp_co.paa"]]],
			["Wave (MH-9)", [[0, _mh9Dir + "Skins\heli_light_01_ext_wave_co.paa"]]]
		]
	],
	[ // Mohawk colors
		"Heli_Transport_02_base_F",
		[
			["Dahoman (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_dahoman_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_dahoman_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_dahoman_co.paa"]
			]],
			["ION (Mohawk)", [
				[0, _mohawkDir + "Skins\heli_transport_02_1_ion_co.paa"],
				[1, _mohawkDir + "Skins\heli_transport_02_2_ion_co.paa"],
				[2, _mohawkDir + "Skins\heli_transport_02_3_ion_co.paa"]
			]],
			["IDAP (Mohawk)", [
				[0, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_1_idap_co.paa"],
				[1, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_2_idap_co.paa"],
				[2, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_3_idap_co.paa"],
				[3, "\A3\air_f_orange\heli_transport_02\data\heli_transport_02_int_02_idap_co.paa"]
			]]
		]
	],
	[ // Armed Orca paintjob
		"Heli_Light_02_dynamicLoadout_base_F",
		[
			["Orca (Orca)", ["Blackcustom"]]
		]
	],
	[ // Orca paintjob
		"Heli_Light_02_base_F",
		[
			["Blue (Orca)", ["Blue"]]
		]
	],
	[ // Taru paintjob
		"Heli_Transport_04_base_F",
		[
			["Black (Taru)", ["Black"]]
		]
	],
	[ // Blackfoot paintjob
		"Heli_Attack_01_base_F",
		[
			["Rusty (Blackfoot)", [[0, _wreckDir + "wreck_heli_attack_01_co.paa"]]]
		]
	],
	[ // Kajman paintjobs
		"Heli_Attack_02_base_F",
		[
			["Black (Kajman)", ["Black"]],
			["Rusty (Kajman)", [
				[0, _wreckDir + "wreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "wreck_heli_attack_02_body2_co.paa"]
			]],
			["Mossy (Kajman)", [
				[0, _wreckDir + "uwreck_heli_attack_02_body1_co.paa"],
				[1, _wreckDir + "uwreck_heli_attack_02_body2_co.paa"]
			]]
		]
	],
	[ // Ghost Hawk camo
		"Heli_Transport_01_base_F",
		[
			//["Black (Ghost Hawk)", ["Black"]], // default
			["Olive (Ghost Hawk)", ["Green"]],
			["Dazzle Black (Ghost Hawk)", ["Olive"]],
			["Dazzle Tan (Ghost Hawk)", ["Sand"]]
		]
	],
	[ // Zamak paintjobs
		"Truck_02_base_F",
		[
			//["AAF (Zamak)", ["Indep"]], // default
			["Hex (Zamak)", ["Opfor"]],
			["Orange (Zamak)", ["Orange"]]
		]
	],
	[ // Strider NATO color
		"MRAP_03_base_F",
		[
			["Tan (Strider)", ["Blufor"]]
		]
	],
	[ // Gorgon paintjobs
		"APC_Wheeled_03_base_F",
		[
			["Guerilla 1 (Gorgon)", ["Guerilla_01"]],
			["Guerilla 2 (Gorgon)", ["Guerilla_02"]],
			["Guerilla 3 (Gorgon)", ["Guerilla_03"]],
			["Tan (Gorgon)", [
				[0, _gorgonDir + "apc_wheeled_03_ext_co.paa"],
				[1, _gorgonDir + "apc_wheeled_03_ext2_co.paa"],
				[2, _gorgonDir + "rcws30_co.paa"],
				[3, _gorgonDir + "apc_wheeled_03_ext_alpha_co.paa"]
			]]
		]
	],
	[ // Hatchback wreck paintjob
		"Hatchback_01_base_F",
		[
			["Rusty (Hatchback)", [[0, _wreckDir + "civilcar_extwreck_co.paa"]]]
		]
	],
	[ // GOD EMPEROR
		"B_MBT_01_cannon_F",
		[
			["Trump (Slammer)", [
				[0, _texDir + "slammer_trump_0.paa"],
				[1, _texDir + "slammer_trump_1.paa"]
			]]
		]
	],
	[
		"B_MBT_01_TUSK_F",
		[
			["Trump (Slammer)", [[2, _texDir + "slammer_trump_2.paa"]]]
		]
	],
	[ // RHIB paintjob
		"Boat_Transport_02_base_F",
		[
			["Civilian (RHIB)", ["Civilian"]]
		]
	],
	[ // Prowler paintjobs
		"LSV_01_base_F",
		[
			["Olive (Prowler)", ["Olive"]],
			["Dazzle (Prowler)", ["Dazzle"]],
			["Black (Prowler)", ["Black"]],
			["Tan (Prowler)", ["Sand"]]
		]
	],
	[ // Qilin paintjobs
		"LSV_02_base_F",
		[
			//["Green Hex (Qilin)", ["GreenHex"]], // default
			["Hex (Qilin)", ["Arid"]],
			["Black (Qilin)", ["Black"]]
		]
	],
	[ // Blackfish paintjobs
		"VTOL_01_base_F",
		[
			//["Olive (Blackfish)", ["Olive"]], // default
			["Blue (Blackfish)", ["Blue"]]
		]
	],
	[ // Xi'an paintjobs
		"VTOL_02_base_F",
		[
			//["Green Hex (Xi'an)", ["GreenHex"]], // default
			["Hex (Xi'an)", ["Hex"]],
			["Gray Hex (Xi'an)", ["Grey"]]
		]
	],
	[ // Black Wasp paintjob
		"Plane_Fighter_01_Base_F",
		[
			["Grey Camo (Black Wasp)", ["DarkGreyCamo"]]
		]
	],
	[ // Shikra paintjobs
		"Plane_Fighter_02_Base_F",
		[
			["Grey Hex (Shikra)", ["CamoGreyHex"]],
			["Russian Blue (Shikra)", ["CamoBlue"]]
		]
	],
	[ // Gryphon paintjobs
		"Plane_Fighter_04_Base_F",
		[
			["Grey (Gryphon)", ["CamoGrey"]],
			["Digital Grey (Gryphon)", ["DigitalCamoGrey"]]
		]
	],
	[ // Sentinel paintjob
		"UAV_05_Base_F",
		[
			["Grey Camo (Sentinel)", ["DarkGreyCamo"]]
		]
	],
	[ // UGV paintjobs
		"UGV_01_base_F",
		[
			["Tan (UGV)", ["Blufor"]],
			["Hex (UGV)", ["Opfor"]],
			["Digital (UGV)", ["Indep"]],
			["Green Hex (UGV)", ["GreenHex"]]
		]
	],
	[ // Ifrit GreenHex
		"MRAP_02_base_F",
		[
			["Green Hex (Ifrit)", ["GreenHex"]]
		]
	],
	[ // Tempest GreenHex
		"Truck_03_base_F",
		[
			["Green Hex (Tempest)", ["GreenHex"]]
		]
	],
	[ // Marid GreenHex
		"APC_Wheeled_02_base_F",
		[
			["Green Hex (Marid)", ["GreenHex"]]
		]
	],
	[ // Kamysh & Tigris GreenHex
		"APC_Tracked_02_base_F",
		[
			["Green Hex (Kamysh)", ["GreenHex"]]
		]
	],
	[ // Varsuk & Sochor GreenHex
		"MBT_02_base_F",
		[
			["Green Hex (Varsuk)", ["GreenHex"]]
		]
	]
];

//General Store Item List
//Display Name, Class Name, Description, Picture, Buy Price, Sell Price.
// ["Medical Kit", "medkits", localize "STR_WL_ShopDescriptions_MedKit", "client\icons\medkit.paa", 400, 200],  // not needed since there are First Ait Kits
customPlayerItems = compileFinal str
[
	["Artillery Strike", "artillery", "", "client\icons\tablet.paa", 500000, 100000],
	["SATCOM Console", "satcom", localize "STR_WL_ShopDescriptions_Satcom", "client\icons\satellite.paa", 10000, 500],
	["Vehicle Pinlock", "pinlock", localize "STR_WL_ShopDescriptions_Pinlock", "client\icons\keypad.paa", 1000, 500],
	["LSD", "lsd", localize "STR_WL_ShopDescriptions_LSD", "client\icons\lsd.paa", 12500, 6250],
	["Marijuana", "marijuana", localize "STR_WL_ShopDescriptions_Marijuana", "client\icons\marijuana.paa", 10000, 5000],
	["Cocaine", "cocaine", localize "STR_WL_ShopDescriptions_Cocaine", "client\icons\cocaine.paa", 14000, 7000],
	["Heroin", "heroin", localize "STR_WL_ShopDescriptions_Heroin", "client\icons\heroin.paa", 15000, 7500],
	["Water Bottle", "water", localize "STR_WL_ShopDescriptions_Water", "client\icons\waterbottle.paa", 30, 15],
	["Canned Food", "cannedfood", localize "STR_WL_ShopDescriptions_CanFood", "client\icons\cannedfood.paa", 30, 15],
	["Repair Kit", "repairkit", localize "STR_WL_ShopDescriptions_RepairKit", "client\icons\briefcase.paa", 500, 250],
	["Jerry Can (Full)", "jerrycanfull", localize "STR_WL_ShopDescriptions_fuelFull", "client\icons\jerrycan.paa", 150, 75],
	["Jerry Can (Empty)", "jerrycanempty", localize "STR_WL_ShopDescriptions_fuelEmpty", "client\icons\jerrycan.paa", 50, 25],
	["Spawn Beacon", "spawnbeacon", localize "STR_WL_ShopDescriptions_spawnBeacon", "client\icons\spawnbeacon.paa", 1500, 750],
	["Camo Net", "camonet", localize "STR_WL_ShopDescriptions_Camo", "client\icons\camonet.paa", 200, 100],
	["Syphon Hose", "syphonhose", localize "STR_WL_ShopDescriptions_SyphonHose", "client\icons\syphonhose.paa", 200, 100],
	["Energy Drink", "energydrink", localize "STR_WL_ShopDescriptions_Energy_Drink", "client\icons\energydrink.paa", 100, 50],
	["Warchest", "warchest", localize "STR_WL_ShopDescriptions_Warchest", "client\icons\warchest.paa", 1000, 500]
];

call compile preprocessFileLineNumbers "mapConfig\storeOwners.sqf";

storeConfigDone = compileFinal "true";