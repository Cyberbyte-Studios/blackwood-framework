private["_uid"];
_uid = [_this,1,"",[""]] call BIS_fnc_param;
_gear = [_this,0,[],[[]]] call BIS_fnc_param;
_gear = [_gear] call DB_fnc_mresArray;

_query = format["UPDATE players SET gear='%1' WHERE pid='%2'", _gear, _uid];

if(_query == "") exitWith {};

[_query,1] call DB_fnc_asyncCall;
