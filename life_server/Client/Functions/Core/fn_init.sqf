//LOAD FUNCTIONS HERE
[] call CB_fnc_Player;
[] call CB_fnc_initVar;

["Called Functions", CB_Red] call CB_MessageSystem;

diag_log "===================================================";
diag_log "========== CyberByte Studios Client Init ==========";
diag_log "===================================================";

diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "server_isReady"};
waitUntil{(server_isReady OR !isNil "server_extDB_Error")};
["Server is Initialised", CB_Red] call CB_MessageSystem;
session_done = false;

[] call CB_fetchPlayer;
waitUntil {session_done};
["Session Done", CB_Red] call CB_MessageSystem;

diag_log "====================================================";
diag_log "=============== CLIENT INIT COMPLETE ===============";
diag_log "====================================================";
