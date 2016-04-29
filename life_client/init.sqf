[] call compile PreProcessFileLineNumbers "\life_client\core.sqf";

diag_log "===================================================";
diag_log "========== CyberByte Studios Client Init ==========";
diag_log "===================================================";

diag_log "::Life Client:: Waiting for the server to be ready..";
waitUntil{!isNil "server_isReady"};
waitUntil{(life_server_isReady OR !isNil "server_extDB_Error")};
["Server is Initialised", CB_Red] call CB_MessageSystem;

[] call CB_fnc_Player;

["Called CB_fnc_Player", CB_Red] call CB_MessageSystem;
sleep 2;

[] call CB_fetchPlayer;
waitUntil {session_done};
["Session Done", CB_Red] call CB_MessageSystem;


diag_log "====================================================";
diag_log "=============== CLIENT INIT COMPLETE ===============";
diag_log "====================================================";
