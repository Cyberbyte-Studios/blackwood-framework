private ["_uid", "_query", "_result", "_curTime", "_tmp"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_ownerID = [_this,1,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _ownerID) exitWith {diag_log "DUCKS ARE NULL";};
_ownerID = owner _ownerID;

										//    0,    1,    2,    3,    4,     5,        6,        7,     8,        9,        10,       11
_query = format["SELECT pid, name, cash, bank, gear, vgear, licenses, arrested, coplevel, mediclevel, adminlevel, donorlevel FROM players WHERE pid='%1'", _uid];

_curTime = diag_tickTime;
_result = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Fetch Player Request -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_result];
diag_log "------------------------------------------------";

if(_result isEqualType "") exitWith {
	[] remoteExecCall ["CB_insertPlayer",_ownerID];
};

if(count _result == 0) exitWith {
	[] remoteExecCall ["CB_insertPlayer",_ownerID];
};

_tmp = _result select 2;
_result set[2,[_tmp] call DB_fnc_numberSafe]; //Fix Cash VAR
_tmp = _result select 3;
_result set[3,[_tmp] call DB_fnc_numberSafe]; //Fix Bank VAR

//gear
_new = [(_result select 4)] call DB_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_result set[4,_new];

_new = [(_result select 5)] call DB_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_result set[5,_new];

//licenses
_new = [(_result select 6)] call DB_fnc_mresToArray;
if(_new isEqualType "") then {_new = call compile format["%1", _new];};
_result set[6,_new];

_old = _result select 6;
for "_i" from 0 to (count _old)-1 do {
	_data = _old select _i;
	_old set[_i,[_data select 0, ([_data select 1,1] call DB_fnc_bool)]];
};
_result set[6,_old];

//Arrested?
_result set[7,([_result select 7,1] call DB_fnc_bool)];

_result remoteExec ["CB_loadPlayer",_ownerID];
