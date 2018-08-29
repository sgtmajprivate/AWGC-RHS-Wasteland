// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Name: setupMissionArrays.sqf
//	@file Author: AgentRev

if (!isServer) exitWith {};

myMissions =
[
	["mission_InfantryPatrol", 1]
];

MainMissions =
[
	// Mission filename, weight
	// ["mission_Hackers", 0.5],
	["mission_ArmedDiversquad", 1],
	["mission_Coastal_Convoy", 1],
	["mission_Convoy", 1],
	["mission_HostileHeliFormation", 0.5],
	["mission_APC", 1],
	["mission_MBT", 1],
	["mission_LightArmVeh", 1],
	["mission_ArmedHeli", 1],
	["mission_CivHeli", 1],
	["mission_HostileJetFormation", 1]
];

SideMissions =
[
	["mission_Smugglers", 1],
	["mission_roadblock", 1],
	["mission_sniper", 1],
	["mission_HostileHelicopter", 0.75],
	["mission_MiniConvoy", 1.25],
	["mission_SunkenSupplies", 1],
	["mission_TownInvasion", 1.5],
	["mission_TownInvasionUSAF", 1.75],
	["mission_Outpost", 1.25],
	["mission_Truck", 1],
	["mission_HostageRescue", 1.5]
];

MoneyMissions =
[
	["mission_MoneyShipment", 1],
	["mission_SunkenTreasure", 1],
	["mission_altisPatrol", 1],
	["mission_militaryPatrol", 1]
];

MissionSpawnMarkers = (allMapMarkers select {["Mission_", _x] call fn_startsWith}) apply {[_x, false]};
ForestMissionMarkers = (allMapMarkers select {["ForestMission_", _x] call fn_startsWith}) apply {[_x, false]};
SunkenMissionMarkers = (allMapMarkers select {["SunkenMission_", _x] call fn_startsWith}) apply {[_x, false]};

if !(ForestMissionMarkers isEqualTo []) then
{
	SideMissions append
	[
		["mission_AirWreck", 3],
		["mission_WepCache", 3]
	];
};

LandConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\landConvoysList.sqf") apply {[_x, false]};
CoastalConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\coastalConvoysList.sqf") apply {[_x, false]};
PatrolConvoyPaths = (call compile preprocessFileLineNumbers "mapConfig\convoys\patrolConvoysList.sqf") apply {[_x, false]};

MainMissions = [MainMissions, [["A3W_heliPatrolMissions", ["mission_Coastal_Convoy", "mission_HostileHeliFormation"]], ["A3W_underWaterMissions", ["mission_ArmedDiversquad"]]]] call removeDisabledMissions;
SideMissions = [SideMissions, [["A3W_heliPatrolMissions", ["mission_HostileHelicopter"]], ["A3W_underWaterMissions", ["mission_SunkenSupplies"]]]] call removeDisabledMissions;
MoneyMissions = [MoneyMissions, [["A3W_underWaterMissions", ["mission_SunkenTreasure"]]]] call removeDisabledMissions;

{ _x set [2, false] } forEach MainMissions;
{ _x set [2, false] } forEach SideMissions;
{ _x set [2, false] } forEach MoneyMissions;

MissionSpawnMarkers = [];
SniperMissionMarkers =[];
RoadblockMissionMarkers =[];
PatrolMissionsMarkers = [];
{
	switch (true) do
	{
		case (["Mission_", _x] call fn_startsWith):
		{
			MissionSpawnMarkers pushBack [_x, false];
		};
		case (["Sniper_", _x] call fn_startsWith):
		{
			SniperMissionMarkers pushBack [_x, false];
		};
		case (["RoadBlock_", _x] call fn_startsWith):
		{
			RoadblockMissionMarkers pushBack [_x, false];
		};
		case (["Patrol_", _x] call fn_startsWith):
		{
			PatrolMissionsMarkers pushBack [_x, false];
		};
	};
} forEach allMapMarkers;

