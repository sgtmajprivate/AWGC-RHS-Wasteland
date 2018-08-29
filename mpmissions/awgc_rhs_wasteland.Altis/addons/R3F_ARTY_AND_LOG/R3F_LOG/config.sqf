/****** TOW WITH VEHICLE  ******/

/**
 * List of class names of vehicles which can tow towables objects.
 */
R3F_LOG_CFG_remorqueurs =
[
	"SUV_01_base_F",
	"Offroad_01_base_F",
	"Offroad_02_base_F",
	"Van_01_base_F",
	"Van_02_base_F",
	"LSV_01_base_F",
	"LSV_02_base_F",
	"MRAP_01_base_F",
	"MRAP_02_base_F",
	"MRAP_03_base_F",
	"LT_01_base_F",
	"Boat_Armed_01_base_F"
];

/**
 * List of class names of HEAVY vehicles which can tow heavy towables objects. Takes precedence over R3F_LOG_CFG_remorqueurs
 */
R3F_LOG_CFG_remorqueursH =
[
	"Truck_01_base_F",
	"Truck_02_base_F",
	"Truck_03_base_F",
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"MBT_04_base_F"
];

R3F_LOG_CFG_remorqueurs append R3F_LOG_CFG_remorqueursH;

/**
 * List of class names of towables objects.
 */
R3F_LOG_CFG_objets_remorquables =
[
	"Car_F",
	"Ship_F",
	"Plane",
	"LT_01_base_F",
	"UAV_03_base_F",
	"Heli_Light_01_base_F",
	"Heli_Light_02_base_F",
	"Heli_light_03_base_F",
	"Heli_Attack_01_base_F"
];

/**
 * List of class names of HEAVY towables objects. Takes precedence over R3F_LOG_CFG_objets_remorquables
 */
R3F_LOG_CFG_objets_remorquablesH =
[
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"MBT_04_base_F",
	"Heli_Attack_02_base_F",
	"Heli_Transport_01_base_F",
	"Heli_Transport_02_base_F",
	"Heli_Transport_03_base_F",
	"Heli_Transport_04_base_F",
	"VTOL_base_F",
	"UAV_05_Base_F",
	"Plane_Fighter_01_Base_F",
	"Plane_Fighter_02_Base_F",
	"Plane_CAS_01_base_F",
	"Plane_CAS_02_base_F"
];

R3F_LOG_CFG_objets_remorquables append R3F_LOG_CFG_objets_remorquablesH;

/****** LIFT WITH VEHICLE  ******/

/**
 * List of class names of air vehicles which can lift liftables objects.
 */
R3F_LOG_CFG_heliporteurs =
[
	//"Helicopter_Base_F"
	//"Heli_Light_01_base_F",
	"Heli_Light_02_base_F",
	"Heli_light_03_base_F",
	"Heli_Attack_01_base_F",
	"Heli_Attack_02_base_F",
	"Heli_Transport_01_base_F",
	"VTOL_base_F"
];

/**
 * List of class names of HEAVY air vehicles which can lift heavy liftables objects. Takes precedence over R3F_LOG_CFG_objets_remorquables
 */
R3F_LOG_CFG_heliporteursH =
[
	"Heli_Transport_02_base_F",
	"Heli_Transport_03_base_F",
	"Heli_Transport_04_base_F"
];

R3F_LOG_CFG_heliporteurs append R3F_LOG_CFG_heliporteursH;

/**
 * List of class names of liftables objects.
 */
R3F_LOG_CFG_objets_heliportables =
[
	"Car_F",
	"Ship_F",
	"Plane",
	"LT_01_base_F",
	"UAV_03_base_F",
	"Heli_Light_01_base_F"
];

/**
 * List of class names of HEAVY liftables objects. Takes precedence over R3F_LOG_CFG_objets_heliportables
 */
R3F_LOG_CFG_objets_heliportablesH =
[
	"Wheeled_APC_F",
	"APC_Tracked_01_base_F",
	"APC_Tracked_02_base_F",
	"APC_Tracked_03_base_F",
	"MBT_01_base_F",
	"MBT_02_base_F",
	"MBT_03_base_F",
	"MBT_04_base_F",
	"Heli_Light_02_base_F",
	"Heli_light_03_base_F",
	"Heli_Attack_01_base_F",
	"Heli_Attack_02_base_F",
	"Heli_Transport_01_base_F",
	"Heli_Transport_02_base_F",
	"Heli_Transport_03_base_F",
	"Heli_Transport_04_base_F",
	"Plane_CAS_01_base_F",
	"Plane_CAS_02_base_F",
	"Plane_Fighter_03_base_F",
	"VTOL_01_base_F",
	"VTOL_02_base_F"
];

R3F_LOG_CFG_objets_heliportables append R3F_LOG_CFG_objets_heliportablesH;


/****** LOAD IN VEHICLE / CHARGER DANS LE VEHICULE ******/


/**
 * List of class names of (ground or air) vehicles which can transport transportables objects.
 * The second element of the arrays is the load capacity (in relation with the capacity cost of the objects).
 */
R3F_LOG_CFG_transporteurs =
[
	["C_Offroad_02_unarmed_F", 30],
	["RHS_UH1Y_UNARMED", 50],
	["RHS_Mi8AMT_vvs", 50],
	["RHS_Mi8MTV3_vvs", 50],
	["rhsusf_CH53E_USMC", 50],
	["RHS_CH_47F", 50],
	["RHS_UH60M2", 30],
	["RHS_UH60M", 30],
	["B_Heli_Transport_01_F", 30],
	["B_Heli_Light_01_dynamicLoadout_F", 30],
	["RHS_MELB_AH6M", 30],
	["O_Heli_Light_02_dynamicLoadout_F", 30],
	["I_Heli_light_03_dynamicLoadout_F", 30],
	["RHS_UH1Y", 30],
	["rhs_mi28n_vvs", 10],
	["RHS_AH64D", 10],
	["RHS_AH1Z", 10],
	["C_Heli_Light_01_civil_F", 20],
	["B_Heli_Light_01_F", 20],
	["RHS_MELB_MH6M", 20],
	["I_Heli_light_03_unarmed_F", 20],
	["rhs_ka60_grey", 20],
	["RHS_Mi24Vt_vvs", 20],
	["O_Heli_Transport_04_ammo_F", 50],
	["O_Heli_Transport_04_F", 50],
	["O_Heli_Transport_04_box_F", 50],
	["O_Heli_Transport_04_fuel_F", 50],
	["O_Heli_Transport_04_bench_F", 20],
	["O_Heli_Transport_04_covered_F", 50],
	["O_Heli_Transport_04_medevac_F", 50],
	["O_Heli_Transport_04_repair_F", 50],
	["rhsusf_M977A4_AMMO_usarmy_wd", 10],
	["rhsusf_M977A4_REPAIR_usarmy_wd", 10],
	["rhsusf_M977A4_usarmy_wd", 50],
	["rhsusf_M1085A1P2_B_WD_Medical_fmtv_usarmy", 50],
	["rhsusf_M1078A1P2_WD_fmtv_usarmy", 50],
	["rhs_gaz66_ap2_vmf", 10],
	["rhs_gaz66_vmf", 50],
	["RHS_Ural_Open_MSV_01", 50],
	["rhs_typhoon_vdv", 50],
	["rhsusf_mrzr4_d", 10],
	["RHS_UAZ_MSV_01", 20],
	["rhsusf_m1025_w", 20],
	["rhs_tigr_m_vdv", 20],
	["rhsusf_rg33_usmc_d", 30],
	["rhsusf_M1078A1P2_B_WD_CP_fmtv_usarmy", 30],
	["rhsgref_cdf_reg_uaz_spg9", 20],
	["rhsusf_m1025_w_m2", 20],
	["rhsusf_m1025_w_mk19", 20],
	["rhsusf_rg33_m2_usmc_d", 20],
	["rhsusf_M1232_M2_usarmy_d", 20],
	["rhsusf_M1232_MK19_usarmy_d", 20],
	["rhs_tigr_sts_vdv", 20],
	["rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", 30],
	["rhs_gaz66_zu23_vmf", 5],
	["RHS_BM21_MSV_01", 20],
	["rhsusf_M1220_M153_M2_usarmy_d", 20],
	["rhs_btr70_vmf", 30],
	["rhsusf_m113_usarmy", 20],
	["rhs_bmd1pk", 20],
	["rhsusf_M1220_usarmy_d", 40],
	["rhsusf_M977A4_AMMO_BKIT_usarmy_wd", 40],
	["rhsusf_M978A4_usarmy_wd", 40],
	["RHS_Ural_MSV_01", 40],
	["RHS_Ural_Fuel_MSV_01", 5],
	["RHS_Ural_Repair_MSV_01", 40],
	["rhs_gaz66_repair_vmf", 40],
	["rhs_gaz66_ammo_vmf", 40],
	["rhs_kamaz5350_msv", 40],
	["rhs_typhoon_vdv", 40],
	["Quadbike_01_base_F", 5],
	["UGV_01_base_F", 10],
	["Hatchback_01_base_F", 10],
	["SUV_01_base_F", 20],
	["Offroad_01_base_F", 30],
	["Offroad_02_base_F", 20],
	["Van_01_base_F", 40],
	["Van_02_base_F", 50],
	["LSV_01_base_F", 15],
	["LSV_02_base_F", 15],
	["MRAP_01_base_F", 20],
	["MRAP_02_base_F", 20],
	["MRAP_03_base_F", 20],
	["B_Truck_01_box_F", 150],
	["Truck_F", 75],
	["Wheeled_APC_F", 30],
	["LT_01_base_F", 10],
	["Tank_F", 30],
	["rhsusf_m113_usarmy_unarmed", 50],
	["rhsusf_m113_usarmy_M240", 50],
	["rhsusf_m113_usarmy", 50],
	["rhsusf_m113_usarmy_MK19", 50],
	["rhs_bmd1", 50],
	["rhs_bmd1p", 50],
	["rhs_bmd1r", 50],
	["rhs_bmd2", 50],
	["rhs_bmd2m", 50],
	["rhs_bmd4_vdv", 50],
	["rhs_bmp1_vdv", 50],
	["rhs_bmp1p_vdv", 50],
	["rhs_bmp2k_vdv", 50],
	["rhs_bmp3_late_msv", 50],
	["rhs_btr80_msv", 30],
	["rhsusf_M1117_D", 30],
	["B_Truck_01_mover_F", 50],
	["rhs_brm1k_vdv", 30],
	["RHS_M2A2", 30],
	["rhs_zsu234_aa", 30],
	["RHS_M2A3", 30],
	["rhs_t80", 30],
	["rhs_t80um", 30],
	["rhs_sprut_vdv", 30],
	["rhs_t72bd_tv", 30],
	["rhs_2s3_tv", 30],
	["rhs_t90a_tv", 30],
	["rhsusf_m1a1aimwd_usarmy", 30],
	["rhsusf_m109_usarmy", 30],
	["Scooter_Transport_01_base_F", 5],
	["SDV_01_base_F", 10],
	["Rubber_duck_base_F", 10],
	["Boat_Civil_01_base_F", 10],
	["Boat_Transport_02_base_F", 15],
	["Boat_Armed_01_base_F", 20],
	["Heli_Light_01_base_F", 10],
	["Heli_Light_02_base_F", 20],
	["Heli_light_03_base_F", 20],
	["Heli_Transport_01_base_F", 25],
	["Heli_Transport_02_base_F", 30],
	["Heli_Transport_03_base_F", 30],
	["Heli_Transport_04_base_F", 30],
	["Heli_Attack_01_base_F", 10],
	["Heli_Attack_02_base_F", 20],
	["Plane_Civil_01_base_F", 5],
	["VTOL_01_base_F", 50],
	["Land_Pod_Heli_Transport_04_box_F", 300],
	["VTOL_02_base_F", 30]
];


R3F_LOG_CFG_objets_transportables =
[
	["Land_Device_assembled_F", 10],
	["Land_SatellitePhone_F", 2],
	["Land_Canal_Wall_10m_F", 10], // Base door
	["Land_InfoStand_V2_F", 3], // Base door key
	["Land_Cargo_House_V1_F", 10],
	["Land_Airport_Tower_F", 10],
	["Land_Cargo_HQ_V1_F", 10],
	["Land_LightHouse_F", 10],
	["Land_Shed_Small_F", 10],
	["Land_Shed_big_F", 20],
	["Land_Pod_Heli_Transport_04_Box_F", 5],
	["Land_runway_edgelight", 2],
	["Static_Designator_01_base_F", 2],
	["Static_Designator_02_base_F", 2],
	["StaticWeapon", 5],
	["Box_NATO_AmmoVeh_F", 10],
	["B_supplyCrate_F", 5],
	["ReammoBox_F", 3],
	["Kart_01_Base_F", 5],
	["Quadbike_01_base_F", 10],
	["Rubber_duck_base_F", 10],
	["UAV_01_base_F", 2],
	["UAV_06_base_F", 2],
	["Land_PierLadder_F", 3],
	["Land_BagBunker_Large_F", 10],
	["Land_BagBunker_Small_F", 5],
	["Land_BagBunker_Tower_F", 7],
	["Land_BagFence_Corner_F", 2],
	["Land_BagFence_End_F", 2],
	["Land_BagFence_Long_F", 3],
	["Land_BagFence_Round_F", 2],
	["Land_BagFence_Short_F", 2],
	["Land_BarGate_F", 3],
	["Land_Canal_WallSmall_10m_F", 4],
	["Land_Canal_Wall_Stairs_F", 3],
	["Land_CargoBox_V1_F", 5],
	["Land_Cargo_Patrol_V1_F", 7],
	["Land_Cargo_Tower_V1_F", 30],
	["Land_CncBarrier_F", 4],
	["Land_CncBarrierMedium_F", 4],
	["Land_CncBarrierMedium4_F", 4],
	["Land_CncShelter_F", 2],
	["Land_CncWall1_F", 3],
	["Land_CncWall4_F", 5],
	["Land_Crash_barrier_F", 5],
	["Land_HBarrierBig_F", 5],
	["Land_HBarrierTower_F", 8],
	["Land_HBarrierWall4_F", 4],
	["Land_HBarrierWall6_F", 6],
	["Land_HBarrier_1_F", 3],
	["Land_HBarrier_3_F", 4],
	["Land_HBarrier_5_F", 5],
	["Land_LampHarbour_F", 2],
	["Land_LampShabby_F", 2],
	["Land_MetalBarrel_F", 2],
	["Land_Mil_ConcreteWall_F", 5],
	["Land_Mil_WallBig_4m_F", 5],
	["Land_Obstacle_Ramp_F", 5],
	["Land_Pipes_large_F", 5],
	["Land_RampConcreteHigh_F", 6],
	["Land_RampConcrete_F", 5],
	["Land_Razorwire_F", 5],
	["Land_Sacks_goods_F", 2],
	["Land_Scaffolding_F", 5],
	["Land_Shoot_House_Wall_F", 3],
	["Land_Stone_8m_F", 5],
	["Land_ToiletBox_F", 2],
	["Land_BarrelWater_F", 2]
];

/****** MOVABLE-BY-PLAYER OBJECTS / OBJETS DEPLACABLES PAR LE JOUEUR ******/

R3F_LOG_CFG_objets_deplacables =
[
	"Land_Device_assembled_F",
	"Land_SatellitePhone_F",
	"Land_Canal_Wall_10m_F", // Base door
	"Land_InfoStand_V2_F", // Base door key
	"Land_Cargo_House_V1_F",
	"Land_Airport_Tower_F",
	"Land_Cargo_HQ_V1_F",
	"Land_LightHouse_F",
	"Land_Shed_Small_F",
	"Box_FIA_Support_F",
	"Land_Pod_Heli_Transport_04_Box_F",
	"land_gh_stairs_f",
	"StaticWeapon",
	"ReammoBox_F",
	"Kart_01_Base_F",
	"Quadbike_01_base_F",
	"Rubber_duck_base_F",
	"SDV_01_base_F",
	"UAV_01_base_F",
	"UAV_06_base_F",
	"Land_PierLadder_F",
	"Land_BagBunker_Large_F",
	"Land_BagBunker_Small_F",
	"Land_BagBunker_Tower_F",
	"Land_BagFence_Corner_F",
	"Land_BagFence_End_F",
	"Land_BagFence_Long_F",
	"Land_BagFence_Round_F",
	"Land_BagFence_Short_F",
	"Land_BarGate_F",
	"Land_Canal_WallSmall_10m_F",
	"Land_Canal_Wall_Stairs_F",
	"Land_CargoBox_V1_F",
	"Land_Cargo_Patrol_V1_F",
	"Land_Cargo_Tower_V1_F",
	"Land_CncBarrier_F",
	"Land_CncBarrierMedium_F",
	"Land_CncBarrierMedium4_F",
	"Land_CncShelter_F",
	"Land_CncWall1_F",
	"Land_CncWall4_F",
	"Land_Crash_barrier_F",
	"Land_HBarrierBig_F",
	"Land_HBarrierTower_F",
	"Land_HBarrierWall4_F",
	"Land_HBarrierWall6_F",
	"Land_HBarrier_1_F",
	"Land_HBarrier_3_F",
	"Land_HBarrier_5_F",
	"Land_runway_edgelight",
	"Land_LampHarbour_F",
	"Land_LampShabby_F",
	"Land_MetalBarrel_F",
	"Land_Mil_ConcreteWall_F",
	"Land_Mil_WallBig_4m_F",
	"Land_Obstacle_Ramp_F",
	"Land_Pipes_large_F",
	"Land_RampConcreteHigh_F",
	"Land_RampConcrete_F",
	"Land_Razorwire_F",
	"Land_Sacks_goods_F",
	"Land_Scaffolding_F",
	"Land_Shoot_House_Wall_F",
	"Land_Stone_8m_F",
	"Land_ToiletBox_F",
	"Land_BarrelWater_F"
];
