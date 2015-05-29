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
	_idx = COMBO lbAdd "Medic"; COMBO lbSetData [_idx, "m"];
    COMBO lbAdd "----";
	
    _idx = COMBO lbAdd "Dowódca odziału"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Mechanik"; COMBO lbSetData [_idx, "eng"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Dowódca drużyny"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Strzelec RKM"; COMBO lbSetData [_idx, "ar"];
    _idx = COMBO lbAdd "Amunicyjny RKM"; COMBO lbSetData [_idx, "aar"];
    _idx = COMBO lbAdd "Strzelec AT"; COMBO lbSetData [_idx, "rat"];
    _idx = COMBO lbAdd "Medyk"; COMBO lbSetData [_idx, "m"];
    COMBO lbAdd "----";

    _idx = COMBO lbAdd "Dowódca pojazdu"; COMBO lbSetData [_idx, "vc"];
    _idx = COMBO lbAdd "Strzelec"; COMBO lbSetData [_idx, "vg"];
	_idx = COMBO lbAdd "Kierowca"; COMBO lbSetData [_idx, "vd"];
	COMBO lbAdd "----";

    _idx = COMBO lbAdd "Pilot"; COMBO lbSetData [_idx, "pp"];
    _idx = COMBO lbAdd "Strzelec"; COMBO lbSetData [_idx, "pcc"];
	COMBO lbAdd "----";

    _idx = COMBO lbAdd "Dowódca sekcji"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Strzelec MMG"; COMBO lbSetData [_idx, "mmgg"];
	_idx = COMBO lbAdd "Amunicyjny MMG"; COMBO lbSetData [_idx, "mmgag"];
	COMBO lbAdd "----";

    _idx = COMBO lbAdd "Dowódca sekcji"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Strzelec MAT"; COMBO lbSetData [_idx, "matg"];
	_idx = COMBO lbAdd "Amunicyjny MAT"; COMBO lbSetData [_idx, "matag"];
	COMBO lbAdd "----";

    _idx = COMBO lbAdd "Dowódca sekcji"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Strzelec HMG"; COMBO lbSetData [_idx, "hmgg"];
	_idx = COMBO lbAdd "Amunicyjny HMG"; COMBO lbSetData [_idx, "hmgag"];
	COMBO lbAdd "----";

    _idx = COMBO lbAdd "Dowódca sekcji"; COMBO lbSetData [_idx, "ftl"];
    _idx = COMBO lbAdd "Strzelec AA"; COMBO lbSetData [_idx, "msamg"];
	_idx = COMBO lbAdd "Amunicyjny AA"; COMBO lbSetData [_idx, "msamag"];
	COMBO lbAdd "----";

    _idx = COMBO lbAdd "Jendostki specjalne"; COMBO lbSetData [_idx, "div"];
	
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
