{
  if (!local _x) then
  {
    private ["_setOwner_time"];
    _setOwner_time = time;
    [_x, "setOwnerTo", player] call R3F_LOG_FNCT_exec_commande_MP; // Requires R3F 3.1
    waitUntil {local _x || time > _setOwner_time + 1.5};
  };
  _x setVariable ['bis_disabled_Door_1',1,true];
} forEach nearestObjects [player,
  [
    "Land_LightHouse_F",		// add
	"Land_BarGate_F",  		// add
	"Land_LightHouse_F",
	"Land_Cargo_House_V3_F",
    "Land_Cargo_House_V1_F",
    "Land_Medevac_house_V1_F",
    "Land_Cargo_House_V2_F",
    "Land_Research_house_V1_F",
    "Land_Kiosk_blueking_F",
    "Land_Kiosk_gyros_F",
    "Land_Kiosk_papers_F",
    "Land_Kiosk_redburger_F",
    "Land_spp_Tower_F",
    "Land_i_Garage_V1_F",
    "Land_i_Garage_V2_F",
    "Land_i_Addon_02_V1_F",
    "Land_Slum_House02_F",
    "Land_Slum_House03_F",
    "Land_Slum_House01_F",
    "Land_i_Stone_Shed_V2_F",
    "Land_i_Stone_Shed_V1_F",
    "Land_i_Stone_Shed_V3_F"
], 100];

{
  if (!local _x) then
  {
    private ["_setOwner_time"];
    _setOwner_time = time;
    [_x, "setOwnerTo", player] call R3F_LOG_FNCT_exec_commande_MP; // Requires R3F 3.1
    waitUntil {local _x || time > _setOwner_time + 1.5};
  };
  _x setVariable ['bis_disabled_Door_1',1,true];
  _x setVariable ['bis_disabled_Door_2',1,true];
} forEach nearestObjects [player,
  [
  "Land_Airport_Tower_F",  		// add
  "Land_Cargo_Patrol_V1_F",		// add
  "Land_i_House_Small_03_V1_F",
  "Land_i_House_Big_01_V3_F",
  "Land_i_House_Big_01_V2_F",
  "Land_i_House_Big_01_V1_F",
  "Land_Dome_Small_F",
  "Land_Cargo_HQ_V3_F",
  "Land_Cargo_HQ_V1_F",
  "Land_Medevac_HQ_V1_F",
  "Land_Cargo_HQ_V2_F",
  "Land_Research_HQ_F",
  "Land_FuelStation_Build_F",
  "Land_GH_House_2_F",
  "Land_i_House_Small_02_V3_F",
  "Land_i_House_Small_02_V1_F",
  "Land_i_House_Small_02_V2_F",
  "Land_i_House_Small_01_V3_F",
  "Land_i_House_Small_01_V1_F",
  "Land_i_House_Small_01_V2_F",
  "Land_i_Stone_HouseSmall_V3_F",
  "Land_i_Stone_HouseSmall_V1_F",
  "Land_i_Stone_HouseSmall_V2_F"
  ], 100];
  {
    if (!local _x) then
    {
      private ["_setOwner_time"];
      _setOwner_time = time;
      [_x, "setOwnerTo", player] call R3F_LOG_FNCT_exec_commande_MP; // Requires R3F 3.1
      waitUntil {local _x || time > _setOwner_time + 1.5};
    };
    _x setVariable ['bis_disabled_Door_1',1,true];
    _x setVariable ['bis_disabled_Door_2',1,true];
    _x setVariable ['bis_disabled_Door_3',1,true];
  } forEach nearestObjects [player,
    [
      "Land_Cargo_Tower_V1_F", 		// add
	  "Land_Offices_01_V1_F",
      "Land_i_Shop_02_V3_F",
      "Land_i_Shop_02_V2_F",
      "Land_Dome_Big_F",
      "Land_Cargo_Tower_V1_No1_F",
      "Land_Cargo_Tower_V1_No2_F",
      "Land_Cargo_Tower_V1_No3_F",
      "Land_Cargo_Tower_V1_No4_F",
      "Land_Cargo_Tower_V1_No5_F",
      "Land_Cargo_Tower_V1_No6_F",
      "Land_Cargo_Tower_V1_No7_F",
      "Land_Cargo_Tower_V3_F",
      "Land_Cargo_Tower_V3_F",
      "Land_Cargo_Tower_V2_F",
      "Land_MilOffices_V1_F",
      "Land_CarService_F"
    ], 100];
  {
    if (!local _x) then
    {
      private ["_setOwner_time"];
      _setOwner_time = time;
      [_x, "setOwnerTo", player] call R3F_LOG_FNCT_exec_commande_MP; // Requires R3F 3.1
      waitUntil {local _x || time > _setOwner_time + 1.5};
    };
    _x setVariable ['bis_disabled_Door_1',1,true];
    _x setVariable ['bis_disabled_Door_2',1,true];
    _x setVariable ['bis_disabled_Door_3',1,true];
    _x setVariable ['bis_disabled_Door_4',1,true];
  } forEach nearestObjects [player,
    [
	  "Land_i_House_Big_02_V3_F",
      "Land_i_House_Big_02_V1_F",
      "Land_i_House_Big_02_V2_F",
      "Land_i_Shop_01_V3_F",
      "Land_i_Shop_01_V1_F",
      "Land_i_Shop_01_V2_F"
    ], 100];
    {
      if (!local _x) then
      {
        private ["_setOwner_time"];
        _setOwner_time = time;
        [_x, "setOwnerTo", player] call R3F_LOG_FNCT_exec_commande_MP; // Requires R3F 3.1
        waitUntil {local _x || time > _setOwner_time + 1.5};
      };
      _x setVariable ['bis_disabled_Door_1',1,true];
      _x setVariable ['bis_disabled_Door_2',1,true];
      _x setVariable ['bis_disabled_Door_3',1,true];
      _x setVariable ['bis_disabled_Door_4',1,true];
      _x setVariable ['bis_disabled_Door_5',1,true];
      _x setVariable ['bis_disabled_Door_6',1,true];
      _x setVariable ['bis_disabled_Door_7',1,true];
      _x setVariable ['bis_disabled_Door_8',1,true];

    } forEach nearestObjects [player,
      [
        "Land_i_Barracks_V1_F",
        "Land_i_Barracks_V2_F",
        "Land_u_Barracks_V2_F"
      ], 100];

hint "Doors Locked";
