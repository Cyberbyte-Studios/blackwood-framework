private ["_query", "_uid", "_mode", "_value"];
params [
  ["_pid", "", [""]],
  ["_mode", 0, [0]],
  "_data"
];

if (_pid == "") exitWith {systemChat "NO PLAYER ID";};

switch (_mode) do {
  case 0: {
    _value = [_data] call DB_fnc_numberSafe;
    _query = format["UPDATE players SET cash='%1' WHERE pid='%2'", _value, _pid];
  };
  case 1: {
    _value = [_data] call DB_fnc_numberSafe;
    _query = format["UPDATE players SET bank='%1' WHERE pid='%2'", _value, _pid];
  };
  case 2: {
    private ["_tmp1", "_tmp2"];
    _tmp1 = [(_data select 0)] call DB_fnc_numberSafe;
    _tmp2 = [(_data select 1)] call DB_fnc_numberSafe;
    _query = format["UPDATE players SET cash='%1', bank='%2' WHERE pid='%3'", _tmp1, _tmp2, _pid];
  };
  case 3: {
    _value = [_data] call DB_fnc_mresArray;
    _query = format["UPDATE players SET gear='%1' WHERE pid='%2'", _value, _pid];
  };
};

if(_query == "") exitWith {};

[_query,1] call DB_fnc_asyncCall;
