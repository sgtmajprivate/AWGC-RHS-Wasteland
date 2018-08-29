// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: storeOwners.sqf
//	@file Author: AgentRev, JoSchaap, His_Shadow

// Notes: Gun and general stores have position of spawned crate, vehicle stores have an extra air spawn direction
//
// Array contents are as follows:
// Name, Building Position, Desk Direction (or [Desk Direction, Front Offset]), Excluded Buttons
storeOwnerConfig = compileFinal str
[
	["GenStore1", 6, 240, []],
	["GenStore2", 6, 250, []],
	["GenStore3", 6, 45, []],
	["GenStore4", 0, 265, []],
	["GenStore5", 5, 350, []],

	["GunStore1", 1, 0, []],
	["GunStore2", 1, 75, []],
	["GunStore3", 6, 135, []],
	["GunStore4", 1, 65, []],
	["GunStore5", 5, 83, []],

	// Buttons you can disable: "Land", "Armored", "Tanks", "Helicopters", "Boats", "Planes"
	["VehStore1", 1, 75, []],
	["VehStore2", 6, 45, ["Boats"]],
	["VehStore3", 4, 250, ["Boats"]],
	["VehStore4", 5, 155, ["Boats"]],
	["VehStore5", 1e9, 69, ["Planes"]],
	["VehStore6", 1e9, 282, ["Boats", "Planes"]]  //Dump
];

// Outfits for store owners
storeOwnerConfigAppearance = compileFinal str
[
	["GenStore1", [["weapon", ""], ["uniform", "U_BG_Guerilla2_1"], ["goggles", "G_Balaclava_blk"]]],
	["GenStore2", [["weapon", ""], ["uniform", "U_BG_Guerilla2_1"], ["goggles", "G_Balaclava_blk"]]],
	["GenStore3", [["weapon", ""], ["uniform", "U_IG_Guerilla3_1"], ["goggles", "G_Balaclava_blk"]]],
	["GenStore4", [["weapon", ""], ["uniform", "U_IG_Guerilla2_1"], ["goggles", "G_Balaclava_blk"]]],
	["GenStore5", [["weapon", ""], ["uniform", "U_BG_Guerilla2_1"], ["goggles", "G_Balaclava_blk"]]],

	["GunStore1", [["weapon", ""], ["uniform", "rhs_uniform_gorka_r_y"], ["headgear", "rhsgref_helmet_M1_liner"]]],
	["GunStore2", [["weapon", ""], ["uniform", "rhs_uniform_m88_patchless"], ["headgear", "H_ShemagOpen_khk"]]],
	["GunStore3", [["weapon", ""], ["uniform", "rhs_uniform_gorka_r_y"], ["headgear", "rhsgref_helmet_M1_liner"]]],
	["GunStore4", [["weapon", ""], ["uniform", "rhs_uniform_m88_patchless"], ["headgear", "H_ShemagOpen_khk"]]],
	["GunStore5", [["weapon", ""], ["uniform", "rhs_uniform_gorka_r_y"], ["headgear", "rhsgref_helmet_M1_liner"]]],

	["VehStore1", [["weapon", ""], ["uniform", "U_Marshal"], ["goggles", "G_Spectacles"]]],
	["VehStore2", [["weapon", ""], ["uniform", "U_Marshal"], ["goggles", "G_Spectacles"]]],
	["VehStore3", [["weapon", ""], ["uniform", "U_Marshal"], ["goggles", "G_Spectacles"]]],
	["VehStore4", [["weapon", ""], ["uniform", "U_Marshal"], ["goggles", "G_Spectacles"]]],
	["VehStore5", [["weapon", ""], ["uniform", "U_Marshal"], ["goggles", "G_Spectacles"]]],
	["VehStore6", [["weapon", ""], ["uniform", "U_Marshal"], ["goggles", "G_Spectacles"]]]
];
