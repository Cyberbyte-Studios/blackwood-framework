private ["_uid", "_query", "_result", "_curTime"];
_uid = [_this,0,"",[""]] call BIS_fnc_param;
_ownerID = [_this,1,"",[""]] call BIS_fnc_param;

_query = format["SELECT pid, name, cash, bank, gear, licenses, arrested, copLvl, medicLvl, adminLvl, donorLvl"];

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
