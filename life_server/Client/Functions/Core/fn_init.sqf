#define UIctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)

//LOAD FUNCTIONS HERE
[] call CB_fnc_Player;
[] call CB_fnc_initVar;
[] call CB_fnc_loops;
[] call CB_fnc_econ;

["Called Functions", CB_Green] call CB_MessageSystem;

diag_log "===================================================";
diag_log "========== CyberByte Studios Client Init ==========";
diag_log "===================================================";

diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "server_isReady"};
waitUntil{(server_isReady OR !isNil "server_extDB_Error")};
["Server is Initialised", CB_Green] call CB_MessageSystem;
session_done = false;

[] call CB_fetchPlayer;
waitUntil {session_done};
["Session Done", CB_Green] call CB_MessageSystem;

[] call CB_initHud;
["Hud Setup", CB_Green] call CB_MessageSystem;

[] spawn CB_survivalLoop;
[] spawn CB_saveLoop;

diag_log "====================================================";
diag_log "=============== CLIENT INIT COMPLETE ===============";
diag_log "====================================================";
