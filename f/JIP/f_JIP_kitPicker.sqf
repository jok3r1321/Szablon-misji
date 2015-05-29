#define DLG (uiNamespace getVariable "KitPick_Dlg")
#define COMBO (uiNamespace getVariable "KitPick_Combo")
#define USEBUTTON (uiNamespace getVariable "KitPick_UseBtn")

KitPickInit =
{
    uiNamespace setVariable ["KitPick_Dlg", _this select 0];
    uiNamespace setVariable ["KitPick_Combo", (_this select 0) displayCtrl 1];
    uiNamespace setVariable ["KitPick_UseBtn", (_this select 0) displayCtrl 3];

    USEBUTTON ctrlEnable false;

    private "_idx";

    _idx = COMBO lbAdd "Squad Leader"; COMBO lbSetData [_idx, "ftl"];
	_idx = COMBO lbAdd "Mechanic"; COMBO lbSetData [_idx, "eng"];
    COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Fire Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Automatic Rifleman"; COMBO lbSetData [_idx, "ar"];
    _idx = COMBO lbAdd "Asst. Automatic Rifleman"; COMBO lbSetData [_idx, "aar"];
    _idx = COMBO lbAdd "Rifleman (AT)"; COMBO lbSetData [_idx, "rat"];
    _idx = COMBO lbAdd "Medic"; COMBO lbSetData [_idx, "m"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Pilot"; COMBO lbSetData [_idx, "pp"];
	_idx = COMBO lbAdd "Co-Pilot (repair)"; COMBO lbSetData [_idx, "pcc"];
    COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Vehicle Commander"; COMBO lbSetData [_idx, "vc"];
    _idx = COMBO lbAdd "Vehicle Gunner"; COMBO lbSetData [_idx, "vg"];
	_idx = COMBO lbAdd "Vehicle Driver (repair)"; COMBO lbSetData [_idx, "vd"];
	COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Medium MG Gunner"; COMBO lbSetData [_idx, "mmgg"];
	_idx = COMBO lbAdd "Medium MG Assistant"; COMBO lbSetData [_idx, "mmgag"];
	COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Medium AT Gunner"; COMBO lbSetData [_idx, "matg"];
	_idx = COMBO lbAdd "Medium AT Assistant"; COMBO lbSetData [_idx, "matag"];
	COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Mortar Gunner"; COMBO lbSetData [_idx, "mtrg"];
	_idx = COMBO lbAdd "Mortar Assistant"; COMBO lbSetData [_idx, "mtrag"];
	COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Medium AA Gunner"; COMBO lbSetData [_idx, "msamg"];
	_idx = COMBO lbAdd "Medium AA Assistant"; COMBO lbSetData [_idx, "msamag"];
	COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Team Leader"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Heavy MG Gunner"; COMBO lbSetData [_idx, "hmgg"];
	_idx = COMBO lbAdd "Heavy MG Assistant"; COMBO lbSetData [_idx, "hmgag"];
	
    _sel = player getVariable "KitPicker_Selection";
    if (!isNil '_sel') then
    {
        COMBO lbSetCurSel _sel;
    };
};

KitPicker_Pick =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith {};

    _data = COMBO lbData _idx;
    if (_data == "") exitWith {};

    closeDialog 0;
    player setVariable ["f_var_JIP_loadout", _data];
    player setVariable ["KitPicker_Selection", _idx];
    f_var_JIP_state = 3;
};

KitPicker_OnSelChanged =
{
    private "_idx";
    _idx = lbCurSel COMBO;
    if (_idx < 0) exitWith
    {
        USEBUTTON ctrlEnable false;
    };

    _data = COMBO lbData _idx;
    if (_data == "") exitWith
    {
        USEBUTTON ctrlEnable false;
    };
    USEBUTTON ctrlEnable true;
};
