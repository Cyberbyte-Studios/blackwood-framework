params ["_plant", "_player"];

_growth = _plant getVariable ["growth",-1.3];

if (_growth >= 0) then {

} else {
  ["This plant isnt ready to harvest yet!",CB_Red] remoteExec ["CB_MessageSystem", _pid];
};
