#define CONSTVAR(var) var = compileFinal (if(var isEqualType "") then {var} else {str(var)})
#define EXTDB "extDB2" callExtension
#define EQUAL(condition1,condition2) condition1 isEqualTo condition2


server_isReady = false;
server_extDB_Error = "";
publicVariable "server_isReady";

if(isNil {uiNamespace getVariable "server_sql_id"}) then {
	server_sql_id = round(random(9999));
	CONSTVAR(server_sql_id);
	uiNamespace setVariable ["server_sql_id",server_sql_id];
	try {
		_result = EXTDB format["9:ADD_DATABASE:%1",'ArmaLife'];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Connection"};
		_result = EXTDB format["9:ADD_DATABASE_PROTOCOL:%2:SQL_RAW_V2:%1:ADD_QUOTES",call server_sql_id,'ArmaLife'];
		if(!(EQUAL(_result,"[1]"))) then {throw "extDB2: Error with Database Connection"};
	} catch {
		diag_log _exception;
		server_extDB_Error = [true, _exception];
	};
	publicVariable "server_extDB_Error";
	if(server_extDB_Error isEqualType []) exitWith {};
	EXTDB "9:LOCK";
	diag_log "extDB2: Connected to Database";
} else {
	server_sql_id = uiNamespace getVariable "server_sql_id";
	CONSTVAR(server_sql_id);
	diag_log "extDB2: Still Connected to Database";
};

if(server_extDB_Error isEqualType []) exitWith {};

[] call compile PreProcessFileLineNumbers "\life_server\functions.sqf";

server_isReady = true;
publicVariable "server_isReady";
