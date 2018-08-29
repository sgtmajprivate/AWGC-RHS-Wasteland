// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2016 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: vehicleSpawnClasses.sqf
//	@file Author: AgentRev

A3W_smallVehicles =
[
	"C_Quadbike_01_F",
	["B_Quadbike_01_F", "O_Quadbike_01_F", "I_Quadbike_01_F", "I_G_Quadbike_01_F"]
];

//Civilian Vehicle List - Random Spawns
civilianVehicles =
[
	"C_Hatchback_01_F",
	"C_Hatchback_01_sport_F",
	"C_SUV_01_F",
	"C_Offroad_02_unarmed_F",
	"C_Offroad_01_F",
	"rhsusf_mrzr4_d",
	["C_Van_01_box_F", "C_Van_01_transport_F", "C_Van_01_fuel_F"]
];

//Light Military Vehicle List - Random Spawns
lightMilitaryVehicles =
[
	"RHS_UAZ_MSV_01", "rhsusf_m1025_w", "rhs_tigr_m_vdv",
	"rhsusf_rg33_usmc_d", "rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy"
];

//Medium Military Vehicle List - Random Spawns
mediumMilitaryVehicles =
[
	"rhsusf_M1078A1P2_WD_fmtv_usarmy",
	"rhs_gaz66_vmf",
	"RHS_Ural_MSV_01"
];

//Water Vehicles - Random Spawns
waterVehicles =
[
	"C_Boat_Civil_01_F",
	"C_Boat_Civil_01_F",
	["C_Boat_Civil_01_police_F", "C_Boat_Civil_01_rescue_F"],
	["B_Boat_Armed_01_minigun_F", "O_Boat_Armed_01_hmg_F", "I_Boat_Armed_01_minigun_F"]
];

//Object List - Random Spawns.
staticWeaponsList =
[
	"B_Mortar_01_F",
	"O_Mortar_01_F",
	"I_Mortar_01_F",
	"I_G_Mortar_01_F"
];

//Object List - Random Helis.
staticHeliList =
[
	"C_Heli_Light_01_civil_F",
	"RHS_MELB_MH6M",
	"rhs_ka60_grey",
	"RHS_UH1Y_UNARMED"
	// don't put cargo helicopters here, it doesn't make sense to find them in towns; they spawn in the CivHeli mission
];

//Object List - Random Planes.
staticPlaneList =
[
	"I_Plane_Fighter_03_dynamicLoadout_F"
];

A3W_planeSpawnOdds = 0.25; // 0.0 to 1.0

//Random Weapon List - Change this to what you want to spawn in cars.
vehicleWeapons =
[
	["rhs_weap_savz61" /*Vermin*/, "rhs_weap_pp2000" /*Sting*/, "rhsusf_weap_MP7A2"],
	["rhs_weap_M590_8RD", "rhs_weap_asval", "rhs_weap_m4"],
	["rhs_weap_ak74", "rhs_weap_m4", "rhs_weap_hk416d10"]
	// ["rhs_weap_m4a1", "rhs_weap_m14ebrri", "rhs_weap_m38_rail"],
	// ["arifle_MXC_F", "arifle_MX_F", "arifle_MX_GL_F", "arifle_MXM_F"],
	// ["srifle_EBR_F", "srifle_DMR_01_F"],
	// ["arifle_MX_SW_F", "LMG_Mk200_F", "LMG_Zafir_F"]
];

vehicleAddition =
[
	"acc_flashlight_pistol",
	"acc_flashlight",
	"rhs_acc_ekp1",
	"rhs_acc_ekp8_02",
	"rhs_acc_pkas",
	"rhsusf_acc_T1_low",
	"rhsusf_acc_rm05",
	"acc_pointer_IR",
	"Medikit",
	"Medikit",
	"FirstAidKit",
	"ToolKit",
	"rhsusf_ANPVS_14",
	"Leupold_Mk4"
];

vehicleAddition2 =
[
	"SmokeShell",
	"SmokeShellPurple",
	"SmokeShellBlue",
	"SmokeShellGreen",
	"SmokeShellYellow",
	"SmokeShellOrange",
	"SmokeShellRed",
	"Chemlight_blue",
	"Chemlight_green",
	"Chemlight_yellow",
	"Chemlight_red"
];
