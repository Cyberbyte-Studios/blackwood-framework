CB_insertPlayer = {
  [getPlayerUID player, profileName, 0, 60000, player] remoteExecCall ["DB_fnc_insertPlayer", 2];
};

CB_fetchPlayer = {
  [getPlayerUID player,owner player] remoteExec ["DB_fnc_fetchPlayer", 2];
};

CB_loadGear = {

};
