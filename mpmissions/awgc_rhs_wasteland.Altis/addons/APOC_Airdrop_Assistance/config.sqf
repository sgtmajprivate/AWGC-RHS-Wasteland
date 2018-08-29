//Configuration for Airdrop Assistance
//Author: Apoc

APOC_AA_coolDownTime = 1; //Debug seconds
// APOC_AA_coolDownTime = 1800; //Expressed in sec. 1800 = 30 minutes

APOC_AA_VehOptions =
[ // ["Menu Text",		ItemClassname,				Price,	"Drop Type"]
["Quadbike (Civilian)", "C_Quadbike_01_F", 				2500, 	 "vehicle"],
["Hatchback Sport)",    "C_Hatchback_01_sport_F", 		5500, 	 "vehicle"],
["Offroad Camo", 		"B_G_Offroad_01_F",		    	10000, 	 "vehicle"],
["Polaris MRZR", 		"rhsusf_mrzr4_d",		   	    10000, 	 "vehicle"],
["MH-900 Civilian",	    "C_Heli_Light_01_civil_F",  	20000,	 "vehicle"],
["HUMVEE", 		        "rhsusf_m1025_w", 		        30000, 	 "vehicle"],
["M113 Unarmed APC", 	"rhsusf_m113_usarmy_unarmed", 	150000,  "vehicle"]
];

APOC_AA_SupOptions =
[// ["stringItemName", 	"Crate Type for fn_refillBox 	,Price," drop type"]
["Launchers Drop", 		"mission_USLaunchers", 			35000, "supply"],
["Assault Kit Drop", 	"mission_USSpecial", 			15000, "supply"],
["Marksman Drop", 			"mission_Main_A3snipers", 	45000, "supply"]
];
//"Menu Text",			"Crate Type", 			"Cost", "drop type"
// ["Food",				"Land_Sacks_goods_F",	5000, 	"picnic"],
// ["Water",				"Land_BarrelWater_F",	5000, 	"picnic"]
// ];