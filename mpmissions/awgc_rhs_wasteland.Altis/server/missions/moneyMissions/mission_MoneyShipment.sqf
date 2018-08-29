// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 2.1
//	@file Name: mission_MoneyShipment.sqf
//	@file Author: JoSchaap / routes by Del1te - (original idea by Sanjo), AgentRev
//	@file Created: 31/08/2013 18:19

if (!isServer) exitwith {};
#include "moneyMissionDefines.sqf";

private ["_MoneyShipment", "_moneyAmount", "_convoys", "_vehChoices", "_moneyText", "_vehClasses", "_createVehicle", "_vehicles", "_veh2", "_leader", "_speedMode", "_waypoint", "_vehicleName", "_numWaypoints", "_cash"];

_setupVars =
{
	_locationsArray = LandConvoyPaths;

	// Money Shipments settings
	// Difficulties : Min = 1, Max = infinite
	// Convoys per difficulty : Min = 1, Max = infinite
	// Vehicles per convoy : Min = 1, Max = infinite
	// Choices per vehicle : Min = 1, Max = infinite
	_MoneyShipment = selectRandom
	[
		// Easy
		[
			"Small Money Shipment", // Marker text
			50000, // Money
			[
				[ //  USAF convoy
					["rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19"], // Veh 1
					["rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19"] // Veh 2
				],
				[ // USAF convoy
					["rhsusf_M1232_M2_usarmy_d", "rhsusf_M1232_MK19_usarmy_d"], // Veh 1
					["rhsusf_M1232_M2_usarmy_d", "rhsusf_M1232_MK19_usarmy_d"] // Veh 2
				],
				[ //  AFRF convoy
					["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags", "rhs_btr70_vmf"], // Veh 1
					["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags", "rhs_btr80_msv"] // Veh 2
				]
			]
		],
		// Medium
		[
			"Medium Money Shipment", // Marker text
			100000, // Money
			[
				[ // AFRF convoy
					["rhs_tigr_sts_vdv", "rhs_tigr_sts_vdv"], // Veh 1
					["rhs_btr70_vmf", "rhs_btr80_msv", "rhs_bmd1pk"], // Veh 2
					["rhs_tigr_sts_vdv", "rhs_tigr_sts_vdv"] // Veh 3
				],
				[ // USAF convoy
					["rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19"], // Veh 1
					["rhsusf_M1117_D", "rhsusf_M1078A1P2_B_M2_WD_fmtv_usarmy", "rhsusf_M1117_D"], // Veh 2
					["rhsusf_m1025_w_m2", "rhsusf_m1025_w_mk19"] // Veh 3
				],
				[ // AFRF convoy
					["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags", "rhs_btr70_vmf"], // Veh 1
					["rhs_btr70_vmf", "rhs_btr80_msv"], // Veh 2
					["rhsgref_cdf_reg_uaz_dshkm", "rhsgref_cdf_reg_uaz_ags", "rhs_bmd1pk"] // Veh 3
				]
			]
		],
		// Hard
		[
			"Large Money Shipment", // Marker text
			150000, // Money
			[
				[ // AFRF convoy
					["rhs_btr70_vmf", "rhs_bmd1pk", "rhs_bmd1", "rhs_btr80_msv"], // Veh 1
					["rhs_btr80_msv", "rhs_t80um"], // Veh 2
					["rhs_btr70_vmf", "rhs_bmd1pk", "rhs_bmd1"] // Veh 3
				],
				[ // USAF convoy
					["rhsusf_M1117_D", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_MK19"], // Veh 1
					["rhsusf_m1a1aimwd_usarmy", "rhsusf_m1a1aimwd_usarmy"], // Veh 2
					["rhsusf_M1117_D", "rhsusf_m113_usarmy", "rhsusf_m113_usarmy_MK19"] // Veh 3
				]
			]
		],
		// Extreme
		[
			"Heavy Money Shipment", // Marker text
			200000, // Money
			[
				[ // USAF convoy
					["rhsusf_M1117_D", "RHS_M2A2", "rhsusf_m113_usarmy_MK19", "rhsusf_M1117_D", "rhsusf_m1a1aimwd_usarmy"], // Veh 1
					["B_APC_Tracked_01_AA_F", "rhsusf_M1117_D", "rhsusf_m1a1aimwd_usarmy"], // Veh 2
					["rhsusf_M1117_D", "RHS_M2A2", "rhsusf_m113_usarmy_MK19", "rhsusf_M1117_D", "rhsusf_m1a1aimwd_usarmy"], // Veh 3
					["rhsusf_M1117_D", "RHS_M2A2", "rhsusf_m113_usarmy_MK19", "rhsusf_M1117_D", "rhsusf_m1a1aimwd_usarmy"] // Veh 4
				],
				[ // AFRF convoy
					["rhs_btr70_vmf", "rhs_bmd1p", "rhs_bmd2m", "rhs_t80um"], // Veh 1
					["rhs_bmd2m", "rhs_t80um", "rhs_t72bd_tv"], // Veh 2
					["rhs_btr70_vmf", "rhs_bmd1p", "rhs_bmd2m", "rhs_t80um"], // Veh 3
					["rhs_btr70_vmf", "rhs_bmd1p", "rhs_bmd2m", "rhs_t80um"] // Veh 4
				]
			]
		]
	];

	_missionType = _MoneyShipment select 0;
	_moneyAmount = _MoneyShipment select 1;
	_convoys = _MoneyShipment select 2;
	_vehChoices = selectRandom _convoys;

	_moneyText = format ["$%1", [_moneyAmount] call fn_numbersText];

	_vehClasses = [];
	{ _vehClasses pushBack selectRandom _x } forEach _vehChoices;
};

_setupObjects =
{
	private ["_starts", "_startDirs", "_waypoints"];
	call compile preprocessFileLineNumbers format ["mapConfig\convoys\%1.sqf", _missionLocation];

	_createVehicle =
	{
		private ["_type", "_position", "_direction", "_vehicle", "_soldier"];

		_type = _this select 0;
		_position = _this select 1;
		_direction = _this select 2;

		_vehicle = createVehicle [_type, _position, [], 0, "None"];
		_vehicle setVariable ["R3F_LOG_disabled", true, true];
		[_vehicle] call vehicleSetup;

		// apply tropical textures to vehicles on Tanoa
		if (worldName == "Tanoa" && _type select [1,3] != "_T_") then
		{
			switch (toUpper (_type select [0,2])) do
			{
				case "B_": { [_vehicle, ["Olive"]] call applyVehicleTexture };
				case "O_": { [_vehicle, ["GreenHex"]] call applyVehicleTexture };
			};
		};

		_vehicle setDir _direction;
		_aiGroup addVehicle _vehicle;

		_soldier = [_aiGroup, _position] call createRandomSoldier;
		_soldier moveInDriver _vehicle;

		if !(_type isKindOf "LT_01_base_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInCargo [_vehicle, 0];
		};

		if !(_type isKindOf "Truck_F") then
		{
			_soldier = [_aiGroup, _position] call createRandomSoldier;
			_soldier moveInGunner _vehicle;
			if (_type isKindOf "LT_01_base_F") exitWith {};

			_soldier = [_aiGroup, _position] call createRandomSoldier;

			if (_vehicle emptyPositions "commander" > 0) then
			{
				_soldier moveInCommander _vehicle;
			}
			else
			{
				_soldier moveInCargo [_vehicle, 1];
			};
		};

		[_vehicle, _aiGroup] spawn checkMissionVehicleLock;

		_vehicle
	};

	_aiGroup = createGroup CIVILIAN;

	_vehicles = [];
	{
		_vehicles pushBack ([_x, _starts select 0, _startdirs select 0, _aiGroup] call _createVehicle);
	} forEach _vehClasses;

	_veh2 = _vehClasses select (1 min (count _vehClasses - 1));

	_leader = effectiveCommander (_vehicles select 0);
	_aiGroup selectLeader _leader;

	_aiGroup setCombatMode "YELLOW"; // units will defend themselves
	_aiGroup setBehaviour "SAFE"; // units feel safe until they spot an enemy or get into contact
	_aiGroup setFormation "STAG COLUMN";

	_speedMode = if (missionDifficultyHard) then { "NORMAL" } else { "LIMITED" };

	_aiGroup setSpeedMode _speedMode;

	{
		_waypoint = _aiGroup addWaypoint [_x, 0];
		_waypoint setWaypointType "MOVE";
		_waypoint setWaypointCompletionRadius 25;
		_waypoint setWaypointCombatMode "YELLOW";
		_waypoint setWaypointBehaviour "SAFE"; // safe is the best behaviour to make AI follow roads, as soon as they spot an enemy or go into combat they WILL leave the road for cover though!
		_waypoint setWaypointFormation "STAG COLUMN";
		_waypoint setWaypointSpeed _speedMode;
	} forEach _waypoints;

	_missionPos = getPosATL leader _aiGroup;

	_missionPicture = getText (configFile >> "CfgVehicles" >> _veh2 >> "picture");
	_vehicleName = getText (configFile >> "cfgVehicles" >> _veh2 >> "displayName");

	_missionHintText = format ["A convoy transporting <t color='%1'>%2</t> escorted by a <t color='%1'>%3</t> is en route to an unknown location.<br/>Stop them!", moneyMissionColor, _moneyText, _vehicleName];

	_numWaypoints = count waypoints _aiGroup;
};

_waitUntilMarkerPos = {getPosATL _leader};
_waitUntilExec = nil;
_waitUntilCondition = {currentWaypoint _aiGroup >= _numWaypoints};

_failedExec = nil;

// _vehicles are automatically deleted or unlocked in missionProcessor depending on the outcome

_successExec =
{
	// Mission completed

	for "_i" from 1 to 10 do
	{
		_cash = createVehicle ["Land_Money_F", _lastPos, [], 5, "None"];
		_cash setPos ([_lastPos, [[2 + random 3,0,0], random 360] call BIS_fnc_rotateVector2D] call BIS_fnc_vectorAdd);
		_cash setDir random 360;
		_cash setVariable ["cmoney", _moneyAmount / 10, true];
		_cash setVariable ["owner", "world", true];
	};

	_successHintMessage = "The convoy has been stopped, the money and vehicles are now yours to take.";
};

_this call moneyMissionProcessor;
