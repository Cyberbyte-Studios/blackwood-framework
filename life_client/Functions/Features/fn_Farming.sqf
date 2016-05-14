CB_initFarming = {

};

CB_platSeed = {
  params["_seed", "_marker"];
  [_seed, _marker, player] remoteExec ["SRV_fnc_plantSeed", 2];
};

CB_harvestPlant = {
  params ["_plant"];
  [_plant, player] remoteExec ["SRV_fnc_harvestPlant", 2];
};
