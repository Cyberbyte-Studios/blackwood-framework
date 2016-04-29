private["_queryResult","_query"];
params [
	"_uid",
	"_name",
	["_money",-1,[0]],
	["_bank",-1,[0]],
	["_returnToSender",objNull,[objNull]]
];

//Error checks
if((_uid == "") OR (_name == "")) exitWith {systemChat "Bad UID or name";}; //Let the client be 'lost' in 'transaction'
if(isNull _returnToSender) exitWith {systemChat "ReturnToSender is Null!";}; //No one to send this to!

_query = format["SELECT pid, name FROM players WHERE pid='%1'",_uid];

_tickTime = diag_tickTime;
_queryResult = [_query,2] call DB_fnc_asyncCall;

diag_log "------------- Check Before Insert -------------";
diag_log format["QUERY: %1",_query];
diag_log format["Time to complete: %1 (in seconds)",(diag_tickTime - _tickTime)];
diag_log format["Result: %1",_queryResult];
diag_log "------------------------------------------------";

//Double check to make sure the client isn't in the database...
if(_queryResult isEqualType "") exitWith {[] remoteExecCall ["CB_fetchPlayer",(owner _returnToSender)];}; //There was an entry!
if(count _queryResult != 0) exitWith {[] remoteExecCall ["CB_fetchPlayer",(owner _returnToSender)];};

//Clense and prepare some information.
_name = [_name] call DB_fnc_mresString; //Clense the name of bad chars.
_alias = [[_name]] call DB_fnc_mresArray;
_money = [_money] call DB_fnc_numberSafe;
_bank = [_bank] call DB_fnc_numberSafe;

//Prepare the query statement..
_query = format["INSERT INTO players (pid, name, cash, bank, gear, licenses) VALUES('%1', '%2', '%3', '%4', '""[]""','""[]""')", _uid, _name, _money, _bank];

[_query,1] call DB_fnc_asyncCall;
[] remoteExecCall ["CB_fetchPlayer",(owner _returnToSender)];
