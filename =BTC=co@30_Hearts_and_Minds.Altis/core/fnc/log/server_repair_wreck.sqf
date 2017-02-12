
private ["_veh","_type","_pos","_dir","_marker","_textures"];

_veh = _this select 0;
_type = typeOf _veh;
_pos = getPos _veh;
_dir = getDir _veh;
_textures = getObjectTextures _veh;
_marker = _veh getVariable ["marker",""];

btc_vehicles = btc_vehicles - [_veh];

if (_marker != "") then {deleteMarker _marker;};
deleteVehicle _veh;
sleep 1;
_veh  = createVehicle [_type, [_pos select 0, _pos select 1, 0], [], 0, "CAN_COLLIDE"];
_veh setDir _dir;
{_veh setObjectTexture [ _foreachindex, _x ];} forEach _textures;
_veh setVariable ["btc_dont_delete",true];

if ((isNumber (configfile >> "CfgVehicles" >> typeof _veh >> "ace_fastroping_enabled")) && !(typeof _veh isEqualTo "RHS_UH1Y_d")) then {[_veh] call ace_fastroping_fnc_equipFRIES};
if(getNumber(configFile >> "CfgVehicles" >> typeof _veh >> "isUav")==1) then {
	createVehicleCrew _veh;
};

btc_vehicles pushBack _veh;