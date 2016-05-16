private ["_class", "_owner", "_spawnPos", "_vehicle", "_query", "_save"];
params [
  ["_class", "", [""]],
  ["_owner", 0, [0]]
];

if (_class) exitWith {};
if (_owner == 0) exitWith {};

_query = format["INSERT INTO vehicles(pid, classname, type, plate, color, gear) VALUES('%1', '%2', '%3', '%4', '%5', '%6')", _owner, _class, 058080, 0, '"[]"'];
[_query,1] call DB_fnc_asyncCall;
