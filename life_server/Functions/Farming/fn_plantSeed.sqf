params["_seed", "_marker", "_player"];
_near = nearestObjects [_player , CB_plantTypes, 2];
_pid = owner _player;

if (count _near == 0) then {
  switch (_seed) do {
    case "CB_Seed_Poppy": {
        _plant = "CB_Poppy" createVehicle [0,0,0];
        _plant setPos [(getPos _player) select 0, (getPos _player) select 1, -1.3];
        _plant setVariable ["growth", -1.3, true];
        CB_plants pushBack _plant;
    };
  };
  _player removeItem _seed;
  ["You have planted the seed!",CB_Green] remoteExec ["CB_MessageSystem", _pid];
} else {
  ["You cant plant this seed so close to another plant!",CB_Red] remoteExec ["CB_MessageSystem", _pid];
};
