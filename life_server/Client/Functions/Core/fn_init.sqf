#define UIctrl(ctrl) ((GVAR_UINS ["playerHUD",displayNull]) displayCtrl ctrl)

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

2 cutRsc ["playerHUD","PLAIN"];
_display = uiNamespace getVariable ["playerHUD",displayNull];

_display displayCtrl 2200 progressSetPosition (1 / (100 / player_hunger));
_display displayCtrl 2201 progressSetPosition (1 - (damage player));
_display displayCtrl 2202 progressSetPosition (1 / (100 / player_thirst));

diag_log "====================================================";
diag_log "=============== CLIENT INIT COMPLETE ===============";
diag_log "====================================================";
