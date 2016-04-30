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

CB_stripPlayer = {
  removeAllWeapons player;
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

CB_loadGear = {
  _playerGear = param[0];
  waitUntil {!(isNull (findDisplay 46))};

  _handle = [] spawn CB_stripPlayer;
  waitUntil {scriptDone _handle};

  if(count _playerGear isEqualTo 0) then {
    _clothings = ["U_C_Poloshirt_blue","U_C_Poloshirt_burgundy","U_C_Poloshirt_stripped","U_C_Poloshirt_tricolour","U_C_Poloshirt_salmon","U_C_Poloshirt_redwhite","U_C_Commoner1_1"];
    player addUniform (_clothings select (floor(random (count _clothings))));

    /* ITEMS */
    player addItem "ItemMap";
    player assignItem "ItemMap";
    player addItem "ItemCompass";
    player assignItem "ItemCompass";
    player addItem "ItemWatch";
    player assignItem "ItemWatch";
  } else {
    _gear = _playerGear select 4;
    _uniform = _gear select 0;
    _vest = _gear select 1;
    _backpack = _gear select 2;
    _goggles = _gear select 3;
    _headgear = _gear select 4;
    _uniformItems = _gear select 8;
    _uniformMags = _gear select 9;
    _bagItems = _gear select 10;
    _bagMags = _gear select 11;
    _vestItems = _gear select 12;
    _vestMags = _gear select 13;
    _pItems = _gear select 14;
    _hItems = _gear select 15;

    player forceAddUniform _uniform;

    if (!(_vest isEqualTo "")) then {
      player addVest _vest;
    } else {
      removeVest player;
    };

    if (!(_backpack isEqualTo "")) then {
      player addBackpack _backpack;
    } else {
      removeBackpack player;
    };

    if (!(_goggles isEqualTo "")) then {
      player addGoggles _goggles;
    } else {
      removeGoggles player;
    };

    if (!(_headgear isEqualTo "")) then {
      player addHeadgear _headgear;
    } else {
      removeHeadgear player;
    };

    {player addItemToUniform _x;} forEach (_uniformItems);
    {(uniformContainer player) addItemCargoGlobal [_x,1];} forEach (_uniformMags);
    {player addItemToVest _x;} forEach (_vestItems);
    {(vestContainer player) addItemCargoGlobal [_x,1];} forEach (_vestMags);
    {player addItemToBackpack _x;} forEach (_bagItems);
    {(backpackContainer player) addItemCargoGlobal [_x,1];} forEach (_bagMags);

    {
        if (!(_x isEqualTo "")) then {
            player addPrimaryWeaponItem _x;
        };
    } forEach (_pItems);

    {
        if (!(_x isEqualTo "")) then {
            player addHandgunItem _x;
        };
    } forEach (_hItems);

  };
};


CB_saveGear = {
  private["_playerGear","_uniformItems","_uniformMags","_bagItems","_bagMags","_vestItems","_vestMags"];
  _playerGear = [];
  _playerGear pushBack uniform player;
  _playerGear pushBack vest player;
  _playerGear pushBack backpack player;
  _playerGear pushBack goggles player;
  _playerGear pushBack headgear player;
  _playerGear pushBack assignedITems player;
  _playerGear pushBack primaryWeapon player;
  _playerGear pushBack handgunWeapon player;

  _uniformItems = [];
  _uniformMags = [];
  _bagItems = [];
  _bagMags = [];
  _vestItems = [];
  _vestMags = [];
  _pItems = [];
  _hItems = [];

  if (!(uniform player isEqualTo "")) then {
    {
        if (_x in (magazines player)) then {
          _uniformMags = _uniformMags + [_x];
        } else {
          _uniformItems = _uniformItems + [_x];
        };
    } forEach (uniformItems player);
  };

  if (!(backpack player isEqualTo "")) then {
    {
        if (_x in (magazines player)) then {
          _bagMags = _bagMags + [_x];
        } else {
          _bagItems = _bagItems + [_x];
        };
    } forEach (backpackItems player);
  };

  if (!(vest player isEqualTo "")) then {
    {
        if (_x in (magazines player)) then {
          _vestMags = _vestMags + [_x];
        } else {
          _vestItems = _vestItems + [_x];
        };
    } forEach (vestItems player);
  };

  if(count (primaryWeaponMagazine player) > 0 && alive player) then {
      _pMag = (primaryWeaponMagazine player) select 0;

      if(!(_pMag isEqualTo "")) then {
          _uni = player canAddItemToUniform _pMag;
          _ves = player canAddItemToVest _pMag;
          _bag = player canAddItemToBackpack _pMag;
          _handled = false;

          if(_ves) then {
              _vestMags = _vestMags + [_pMag];
              _handled = true;
          };

          if(_uni && !_handled) then {
              _uniformMags = _uniformMags + [_pMag];
              _handled = true;
          };

          if(_bag && !_handled) then {
              _bagMags = _bagMags + [_pMag];
              _handled = true;
          };
      };
  };

  if(count (handgunMagazine player) > 0 && alive player) then {
      _hMag = ((handgunMagazine player) select 0);

      if(!(_hMag isEqualTo "")) then {
          _uni = player canAddItemToUniform _hMag;
          _ves = player canAddItemToVest _hMag;
          _bag = player canAddItemToBackpack _hMag;
          _handled = false;

          if(_ves) then {
              _vestMags = _vestMags + [_hMag];
              _handled = true;
          };

          if(_uni && !_handled) then {
              _uniformMags = _uniformMags + [_hMag];
              _handled = true;
          };

          if(_bag && !_handled) then {
              _bagMags = _bagMags + [_hMag];
              _handled = true;
          };
      };
  };

  if(count (primaryWeaponItems player) > 0) then {
      {
  		  _pItems = _pItems + [_x]
      } forEach (primaryWeaponItems player);
  };

  if(count (handgunItems player) > 0) then {
      {
  		  _hItems = _hItems + [_x]
      } forEach (handGunItems player);
  };

  _playerGear pushBack _uniformItems;
  _playerGear pushBack _uniformMags;
  _playerGear pushBack _bagItems;
  _playerGear pushBack _bagMags;
  _playerGear pushBack _vestItems;
  _playerGear pushBack _vestMags;
  _playerGear pushBack _pItems;
  _playerGear pushBack _hItems;

  [_playerGear, getPlayerUID player] remoteExec ["DB_fnc_updateGear", 2];
};
