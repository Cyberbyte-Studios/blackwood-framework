#define CONST(var1,var2) var1 = compileFinal (if(var2 isEqualType "") then {var2} else {str(var2)})

CB_insertPlayer = {
  [getPlayerUID player, profileName, 0, 60000, player] remoteExecCall ["DB_fnc_insertPlayer", 2];
};

CB_fetchPlayer = {
  [getPlayerUID player, player] remoteExec ["DB_fnc_fetchPlayer", 2];
};

CB_loadPlayer = {
  session_done = false;
  0 cutText ["GOT DATA............","BLACK FADED"];
  0 cutFadeOut 9999999;

  player_cash = parseNumber (_this select 2);
  player_bank = parseNumber (_this select 3);

  CONST(player_coplevel,parseNumber (_this select 8));
  CONST(player_mediclevel,parseNumber (_this select 9));
  CONST(player_adminlevel,parseNumber (_this select 10));
  CONST(player_donorlevel,parseNumber (_this select 11));

  session_done = true;
};

CB_loadGear = {
  _playerGear = param[0];
  waitUntil {!(isNull (findDisplay 46))};

  _handle = [] spawn CB_stripPlayer;
  waitUntil {scriptDone _handle};

  if(count _playerGear isEqualTo 0) then {

  } else {

  };
};

CB_stripPlayer = {
  RemoveAllWeapons player;
  {player removeMagazine _x;} forEach (magazines player);
  removeUniform player;
  removeVest player;
  removeBackpack player;
  removeGoggles player;
  removeHeadGear player;

  {
  	player unassignItem _x;
  	player removeItem _x;
  } forEach (assignedItems player);

  if(hmd player != "") then {
  	player unlinkItem (hmd player);
  };
};
