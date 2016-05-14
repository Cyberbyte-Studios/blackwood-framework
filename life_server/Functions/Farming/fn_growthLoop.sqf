while {count CB_plants >= 1} {
  sleep 120;
  {
    _growth = _x getVariable "growth";
    if (_growth < 0) then {
      _rand = floor random 2;
      if (_rand == 1) then {
        _new = _growth + 0.2;
        _curPos = getPos _x;
        _x setVariable ["growth", _new, true];
        _x setPos [_curPos select 0, _curPos select 1, _new];
      };
    };
  } forEach CB_plants;
};
