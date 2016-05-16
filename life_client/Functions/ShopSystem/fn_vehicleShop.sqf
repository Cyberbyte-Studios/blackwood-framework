private ["_type", "_spawnPoint", "_stock"];
params [
  ["_type", "", [""]],
  "_spawnPoint"
];

CB_vehStock = [];
CB_spawnPoint = _spawnPoint;

switch (_type) do {
  case "police": {

  };
  case "policeAir": {

  };
  case "car": {
    CB_vehStock = [] call CB_VEH_CIV;
  };
  case "boat": {

  };
  case "air": {

  };
};

CB_vehicleSelected = {
  private["_display", "_ctrl", "_buyPrice", "_rentPrice", "_item", "_skins"];
  	_display = findDisplay 100700;
  	_ctrl = _display displayCtrl 100702;
  	_item = CB_vehStock select (lbCurSel _ctrl);

  	_ctrl = _display displayCtrl 100703;
  	_skins = [];

  	lbClear _ctrl;
  	if (count _skins <= 0) then { _ctrl lbAdd "Default Skin"; };
  	_ctrl lbSetCurSel 0;

    _buyPrice = _item select 2;
    _rentPrice =  _item select 3;

  	_ctrl = _display displayCtrl 100704;
  	_ctrl ctrlSetStructuredText parseText format[
  		"Rental Price: <t color='#8cff9b'>$%1</t><br/>Buy Price: <t color='#8cff9b'>$%2</t><br/>Max Speed: %3 km/h<br/>Horse Power: %4<br/>Passengers: %5<br/>Fuel: %6<br/>Armour: %7",
  		[_rentPrice] call CB_numberText,
  		[_buyPrice] call CB_numberText,
  		getNumber(configFile >> "CfgVehicles" >> _item select 1 >> "maxSpeed"),
  		getNumber(configFile >> "CfgVehicles" >> _item select 1 >> "enginePower"),
  		getNumber(configFile >> "CfgVehicles" >> _item select 1 >> "transportSoldier"),
  		getNumber(configFile >> "CfgVehicles" >> _item select 1 >> "fuelCapacity"),
  		getNumber(configFile >> "CfgVehicles" >> _item select 1 >> "armor")
  	];
};

CB_buySelected = {
  private["_display", "_ctrl", "_item", "_price", "_skin", "_requiredLicence", "_vehicle", "_class"];
  params[
    ["_save", true, [true]]
  ];
  _display = findDisplay 100700;
	_ctrl = _display displayCtrl 100702;
	if (lbCurSel _ctrl < 0) exitWith { hint "You have not selected a vehicle to buy"; };
	_item = CB_vehStock select (lbCurSel _ctrl);
  _class = _item select 1;

	_price = 0;
	if (_save) then {
    _price = _item select 2;
  } else {
    _price = _item select 3;
  };
	if (player_cash - _price < 0) exitWith { hint format["You can not afford this\nLacking $%1", (player_cash - _price) * -1]; };

	_ctrl = _display displayCtrl 100703;
	_skin = lbCurSel _ctrl;
	if (_skin < 0) then { _skin = 0; };

	player_cash = player_cash - _price;
  [] call CB_saveGear;
  [getPlayerUID player, 2, [player_cash, player_bank]] remoteExec ["DB_fnc_partialSync", 2];

  _vehicle = createVehicle [_class, (getMarkerPos CB_spawnPoint), [], 0, "NONE"];
  clearWeaponCargoGlobal _vehicle;
  clearMagazineCargoGlobal _vehicle;
  clearItemCargoGlobal _vehicle;

  _vehicle setPos (getMarkerPos CB_spawnPoint);
  _vehicle setVectorUp (surfaceNormal (getMarkerPos CB_spawnPoint));
  _vehicle setDir (markerDir _spawnPoint);
  _owners = [];
  _owners pushBack (getPlayerUID player);
  _vehicle setVariable ["veh_Owner", _owners, true]
  _vehicle lock 2;

  [_vehicle] call CB_addToKeys;

	if (_save) then {
      [_class, getPlayerUID player] remoteExec ["SRV_fnc_vehicleBuy", 2];
  };
	closeDialog 0;
};

disableSerialization;
createDialog "CB_dlg_shopVehicle";
_display = findDisplay 100700;
_ctrl = _display displayCtrl 100701;

_ctrl ctrlSetText "Vehicle Shop";
_ctrl ctrlCommit 0;

_ctrl = _display displayCtrl 100705;
_ctrl ctrlAddEventHandler["ButtonDown", "[false] call CB_buySelected"];
_ctrl = _display displayCtrl 100706;
_ctrl ctrlAddEventHandler["ButtonDown", "[true] call CB_buySelected"];
_ctrl = _display displayCtrl 100702;
_ctrl ctrlSetEventHandler ["LBSelChanged", "[] call CB_vehicleSelected"];

{
	_item = _x select 0;
	if (_item == "CONF") then { _item = format["%1", (getText(configFile >> "CfgVehicles" >> (_x select 1) >> "DisplayName"))]; };
	_ctrl lbAdd format["%1", _item];
} forEach CB_vehStock;

if (count CB_vehStock > 0) then {
  _ctrl lbSetCurSel 0;
	_ctrl = _display displayCtrl 100707;
	_ctrl ctrlShow false;
};
