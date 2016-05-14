CB_addToBank = {
  private ["_toAdd"];
  _toAdd = param[0];
  player_cash = player_cash - _toAdd;
  player_bank = player_bank + _toAdd;
};

CB_addToCash = {
  private ["_toAdd"];
  _toAdd = param[0];
  player_bank = player_bank - _toAdd;
  player_cash = player_cash + _toAdd;
};

CB_giveCash = {
  _toAdd = param[0];
  _target = param[1];
};

CB_checkFunds = {
  params ["_amount","_type"];

  _return = false;
  if (_type == 0) then {
    _funds = player_bank;
    _check = _funds - _amount;
    if (_check >= 0) then {_return = true;};
  } else {
    _funds = player_cash;
    _check = _funds - _amount;
    if (_check >= 0) then {_return = true;};
  };

  _return;
};
