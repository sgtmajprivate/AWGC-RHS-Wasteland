// ******************************************************************************************
// * This project is licensed under the GNU Affero GPL v3. Copyright © 2014 A3Wasteland.com *
// ******************************************************************************************
//	@file Version: 1.0
//	@file Name: getDefaultClothing.sqf
//	@file Author: AgentRev
//	@file Created: 22/12/2013 22:04

private ["_unit", "_item", "_side", "_isSniper", "_isPilot", "_defaultVest", "_result"];

_unit = _this select 0;
_item = _this select 1;

if (typeName _unit == "OBJECT") then
{
	_side = if (_unit == player) then { playerSide } else { side _unit };
	_unit = typeOf _unit;
}
else
{
	_side = _this select 2;
};

_isSniper = (["_sniper_", _unit] call fn_findString != -1);
_isPilot = (["_pilot_", _unit] call fn_findString != -1);
_isEngineer = (["_engineer_", _unit] call fn_findString != -1);

_defaultVest = "rhsgref_alice_webbing";

_result = "";

switch (_side) do
{
	case BLUFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_B_Ghilliesuit" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "rhssaf_bandana_smb" };
			};
			case (_isPilot):
			{
				if (_item == "uniform") then { _result = "U_B_HeliPilotCoveralls" };
				if (_item == "vest") then { _result = "V_TacVest_blk" };
				if (_item == "headgear") then { _result = "rhsusf_hgu56p_visor_mask_green" };
			};
			case (_isEngineer):
			{
				if (_item == "uniform") then { _result = "rhs_uniform_cu_ocp" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "H_Watchcap_cbr" };
			};
			default
			{
				if (_item == "uniform") then { _result = "rhs_uniform_cu_ocp" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "rhs_Booniehat_ocp" };
			};
		};
	};
	case OPFOR:
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_O_Ghilliesuit" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "rhssaf_bandana_smb" };
			};
			case (_isPilot):
			{
				if (_item == "uniform") then { _result = "rhs_uniform_df15_tan" };
				if (_item == "vest") then { _result = "V_TacVest_brn" };
				if (_item == "headgear") then { _result = "rhs_zsh7a_mike_green_alt" };

			};
			case (_isEngineer):
			{
				if (_item == "uniform") then { _result = "rhs_uniform_flora_patchless_alt" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "H_Watchcap_camo" };
			};
			default
			{
				if (_item == "uniform") then { _result = "rhs_uniform_flora_patchless_alt" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "rhs_beanie_green" };
			};
		};
	};
	default
	{
		switch (true) do
		{
			case (_isSniper):
			{
				if (_item == "uniform") then { _result = "U_I_Ghilliesuit" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "rhssaf_bandana_smb" };
			};
			case (_isPilot):
			{
				if (_item == "uniform") then { _result = "rhssaf_uniform_mig29_pilot" };
				if (_item == "vest") then { _result = "V_TacVest_blk" };
				if (_item == "headgear") then { _result = "rhs_zsh7a_mike_alt" };
			};
			case (_isEngineer):
			{
				if (_item == "uniform") then { _result = "rhsgref_uniform_para_ttsko_urban" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "H_Watchcap_camo" };
			};
			default
			{
				if (_item == "uniform") then { _result = "rhsgref_uniform_specter" };
				if (_item == "vest") then { _result = _defaultVest };
				if (_item == "headgear") then { _result = "rhsgref_patrolcap_specter" };
			};
		};
	};
};

_result
