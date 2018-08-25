params [
    ["_wreck", objNull, [objNull]],
    ["_ied", objNull, [objNull]]
];

if (btc_debug_log) then {
    [format ["%1 - POS %2", [_wreck, _ied], getPos _wreck], __FILE__, [false]] call btc_fnc_debug_message;
};

private _pos = getPos _ied;
deleteVehicle _ied;
"Bo_GBU12_LGB_MI10" createVehicle _pos;
deleteVehicle _wreck;

[_pos] call btc_fnc_deaf_earringing;
[_pos] remoteExec ["btc_fnc_ied_effects", [0, -2] select isDedicated];
