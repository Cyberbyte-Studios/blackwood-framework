#define ADD(var1,var2) var1 = var1 + var2

CB_tmpGear = [];

CB_updateWeaponList = {
  private["_display", "_ctrl", "_itemName"];
  _weapons = [] call CB_weapons;
	_display = findDisplay 100200;
	_ctrl = _display displayCtrl 100207;
	lbClear _ctrl;

	{
		_itemName = _x select 0;
		if (_itemName == "CONF") then { _itemName = getText(configFile >> "CfgWeapons" >> (_x select 1) >> "DisplayName"); };
		_ctrl lbAdd format["%1", _itemName];
	} forEach _weapons;

	_ctrl lbSetCurSel -1;
};

CB_onWeaponSelect = {
  private["_display", "_ctrl", "_itemName", "_weapon", "_weaponType", "_weaponPrice", "_weaponCPrice"];
	_display = findDisplay 100200;
	_ctrl = _display displayCtrl 100207;
  _weapons = [] call CB_weapons;

	if ((lbCurSel _ctrl) < 0) exitWith {
		(_display displayCtrl 100210) ctrlEnable false;
		(_display displayCtrl 100211) ctrlEnable false;
		(_display displayCtrl 100213) ctrlShow true;
	};

	_weapon = _weapons select (lbCurSel _ctrl);
	_weaponType = getNumber(configFile >> "CfgWeapons" >> (_weapon select 1) >> "type");
	_weaponPrice = 10;

	_ctrl = _display displayCtrl 100202;
	_text = getText(configFile >> "cfgWeapons" >> (_weapon select 1) >> "picture");
	_ctrl ctrlSetText _text;
	_ctrl ctrlCommit 0;

	_ctrl = _display displayCtrl 100203;
	_text = getText(configFile >> "cfgWeapons" >> (_weapon select 1) >> "Library" >> "libtextdesc");
	if (isLocalized _text) then { _ctrl ctrlSetText localize _text; }
	else { _ctrl ctrlSetText _text; };
	_ctrl ctrlCommit 0;

	_ctrl = _display displayCtrl 100214;
	_ctrl ctrlSetText format["Price $%1", _weaponPrice];
	_ctrl ctrlCommit 0;

	_hasExtras = false;
	_ctrl = _display displayCtrl 100209;
	lbClear _ctrl;
	if (count (_weapon select 2) > 0) then {
		if (count (_weapon select 2) > 0) then { _hasExtras = true; };
		{
			_itemPrice = [_x select 1] call CB_weaponItems;
			if (_itemPrice > 0 && !((_x select 1) in CB_bannedItems)) then
			{
				_ctrl lbAdd format["%1", (_x select 0)];
				_ctrl lbSetData [(lbSize _ctrl) - 1, (_x select 1)];
			};
		} forEach (_weapon select 2);
	} else {
		_mags = getArray(configFile >> "CfgWeapons" >> (_weapon select 1) >> "Magazines");
		if (count (_mags) > 0) then { _hasExtras = true; };
		{
			_itemPrice = [_x] call CB_weaponItems;
			if (_itemPrice > 0 && !(_x in CB_bannedItems)) then
			{
				_itemName = getText(configFile >> "CfgMagazines" >> _x >> "DisplayName");
				_ctrl lbAdd format["%1", _itemName];
				_ctrl lbSetData [(lbSize _ctrl) - 1, _x];
			};
		} forEach _mags;
	};

	_muzzles = getArray(configFile >> "CfgWeapons" >> (_weapon select 1) >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "CompatibleItems");
	if (count (_muzzles) > 0) then { _hasExtras = true; };
	{
		_itemPrice = [_x] call CB_weaponItems;
		if (_itemPrice > 0 && !(_x in CB_bannedItems)) then
		{
			_itemName = getText(configFile >> "CfgWeapons" >> _x >> "DisplayName");
			_ctrl lbAdd format["%1)", _itemName];
			_ctrl lbSetData [(lbSize _ctrl) - 1, _x];
		};
	} forEach _muzzles;

	_sights = getArray(configFile >> "CfgWeapons" >> (_weapon select 1) >> "WeaponSlotsInfo" >> "CowsSlot" >> "CompatibleItems");
	if (count (_sights) > 0) then { _hasExtras = true; };
	{
		_itemPrice = [_x] call CB_weaponItems;
		if (_itemPrice > 0 && !(_x in CB_bannedItems)) then
		{
			_itemName = getText(configFile >> "CfgWeapons" >> _x >> "DisplayName");
			_ctrl lbAdd format["%1", _itemName];
			_ctrl lbSetData [(lbSize _ctrl) - 1, _x];
		};
	} forEach _sights;

	_extras = getArray(configFile >> "CfgWeapons" >> (_weapon select 1) >> "WeaponSlotsInfo" >> "PointerSlot" >> "CompatibleItems");
	if (count (_extras) > 0) then { _hasExtras = true; };
	{
		_itemPrice = [_x] call CB_weaponItems;
		if (_itemPrice > 0 && !(_x in [])) then {
			_itemName = getText(configFile >> "CfgWeapons" >> _x >> "DisplayName");
			_ctrl lbAdd format["%1", _itemName];
			_ctrl lbSetData [(lbSize _ctrl) - 1, _x];
		};
	} forEach _extras;

	if (_hasExtras) then {
		(_display displayCtrl 100210) ctrlEnable true;
		(_display displayCtrl 100211) ctrlEnable true;
		(_display displayCtrl 100213) ctrlShow false;
	} else {
		(_display displayCtrl 100210) ctrlEnable false;
		(_display displayCtrl 100211) ctrlEnable false;
		(_display displayCtrl 100213) ctrlShow true;
	};

	_ctrl lbSetCurSel -1;
};

CB_onItemSelect = {
	_display = findDisplay 100200;
	_ctrl = _display displayCtrl 100207;

	if ((lbCurSel _ctrl) < 0) exitWith { hint "You have not selected an weapon"; };

  _tmp = [] call CB_weapons;
	_weapon = _tmp select (lbCurSel _ctrl);
	_weaponType = getNumber(configFile >> "CfgWeapons" >> (_weapon select 1) >> "type");
	_weaponOwned = false;
	_cattachments = [];

	switch (_weaponType) do {
		case 1: { _weapon = primaryWeapon player; if (_weapon != "") then { _cattachments = primaryWeaponItems player; }; };
		case 2: { _weapon = handgunWeapon player; if (_weapon != "") then { _cattachments = handgunItems player; }; };
		case 4: { _weapon = secondaryWeapon player; if (_weapon != "") then { _cattachments = secondaryWeaponItems player; }; };
	};

	_ctrl = _display displayCtrl 100209;
	if ((lbCurSel _ctrl) < 0) exitWith {
		_ctrl = _display displayCtrl 100215;
		_ctrl ctrlSetText "Price $0";
		_ctrl ctrlCommit 0;
	};

	_attachment = _ctrl lbData (lbCurSel _ctrl);
	_attachmentPrice = [_attachment] call CB_weaponItems;
	_attachmentType = getNumber(configFile >> "CfgWeapons" >> _attachment >> "ItemInfo" >> "Type");
	_discount = 0;
	{
		if (_x == _attachment) then {
			_discount = _attachmentPrice;
		} else {
		};
	} forEach _cattachments;
	_attachmentPrice = _attachmentPrice - _discount;

	_ctrl = _display displayCtrl 100215;
	_ctrl ctrlSetText format["Price $%1", _attachmentPrice];
	_ctrl ctrlCommit 0;
};

CB_sellList = {
  if (primaryWeapon player != "") then {
    CB_tmpGear pushBack (primaryWeapon player);
    if (((primaryWeaponMagazine player) select 0) != "") then {
      CB_tmpGear pushBack ((primaryWeaponMagazine player) select 0);
    };
    {
      CB_tmpGear pushBack _x;
    } forEach (primaryWeaponItems player);
  };

  if (secondaryWeapon player != "") then {
    CB_tmpGear pushBack (secondaryWeapon player);
    if (((secondaryWeaponMagazine player) select 0) != "") then {
      CB_tmpGear pushBack ((secondaryWeaponMagazine player) select 0);
    };
    {
      CB_tmpGear pushBack _x;
    } forEach (secondaryWeaponItems player);
  };

  if (handgunWeapon player != "") then {
    CB_tmpGear pushBack (handgunWeapon player);
    if (((handgunMagazine player) select 0) != "") then {
      CB_tmpGear pushBack ((handgunMagazine player) select 0);
    };
    {
      CB_tmpGear pushBack _x;
    } forEach (handgunItems player);
  };

  if (uniform  player != "") then {
    {
      CB_tmpGear pushBack _x;
    } forEach (magazineCargo player);
    {
      CB_tmpGear pushBack _x;
    } forEach (weaponCargo player);
  };

  if (vest  player != "") then {
    {
      CB_tmpGear pushBack _x;
    } forEach (magazineCargo player);
    {
      CB_tmpGear pushBack _x;
    } forEach (weaponCargo player);
  };

  if (backpack  player != "") then {
    {
      CB_tmpGear pushBack _x;
    } forEach (magazineCargo player);
    {
      CB_tmpGear pushBack _x;
    } forEach (weaponCargo player);
  };

  _display = findDisplay 100200;
  _ctrl = _display displayCtrl 100204;
  lbClear _ctrl;

  {
    _itemName = getText(configFile >> "CfgWeapons" >> _x >> "DisplayName");
		if (_itemName == "") then { _itemName = getText(configFile >> "CfgMagazines" >> _x >> "DisplayName"); };
    _price = [_x] call CB_weaponItems;
    if (_itemName != "") then {
      _ctrl lbAdd format["%1 ($%2)", _itemName, _price];
			_ctrl lbSetData[(lbSize _ctrl) -1, _x];
    };
  } forEach CB_tmpGear;

  if (count CB_tmpGear > 0) then {
    (_display displayCtrl 100205) ctrlEnable true;
		(_display displayCtrl 100206) ctrlEnable true;
		(_display displayCtrl 100212) ctrlShow false;
  } else {
    (_display displayCtrl 100205) ctrlEnable false;
		(_display displayCtrl 100206) ctrlEnable false;
		(_display displayCtrl 100212) ctrlShow true;
  };
};

CB_sellSelected = {
  private["_display", "_ctrl", "_item", "_sellCount", "_price", "_itemWeight", "_itemName", "_count"];
	_display = findDisplay 100200;
	_ctrl = _display displayCtrl 100204;

	if (lbCurSel _ctrl < 0) exitWith { hint "You have not selected an item to sell"; };
	_item = _ctrl lbData (lbCurSel _ctrl);


	_ctrl = _display displayCtrl 100205;
	_sellCount = ctrlText _ctrl;
	if !([_sellCount] call CB_isNumber) exitWith {["You must enter a valid number to sell", CB_Red] call CB_MessageSystem;};
	_sellCount = parseNumber(_sellCount);

	_count = 0;
  {
      if (_x == _item) then {
        _count = _count + 1;
      };
  } forEach CB_tmpGear;

	_itemName = getText(configFile >> "CfgWeapons" >> _item >> "DisplayName");
	if (_itemName == "") then { _itemName = getText(configFile >> "CfgMagazines" >> _item >> "DisplayName"); };

  systemChat format["I WANT TO SELL: %1", _count];
	if (_count < _sellCount) exitWith { [format["You do not have that amount of %1's", _itemName], CB_Red] call CB_MessageSystem;};

  _price = ([_item] call CB_weaponItems) * _sellCount;

	hint format["You have sold %1 %2(s) for $%3", _sellCount, _itemName, ([_price] call CB_numberText)];

  _sellCount = _sellCount -1;
	for "_i" from 0 to _sellCount do {
    [_item] call CB_removeGear;
  };

	ADD(player_cash, _price);

  [] call CB_sellList;
  [] call CB_saveGear;
  [getPlayerUID player, 2, [player_cash, player_bank]] remoteExec ["DB_fnc_partialSync", 2];
};

CB_buySelected = {
	private["_display", "_ctrl", "_itemName", "_weapon", "_weaponType", "_weaponPrice", "_weaponCPrice", "_weaponOwned", "_weaponName", "_muzzles", "_sights", "_extras", "_discount", "_cattachments", "_tmp", "_attachments", "_itemType"];
	_display = findDisplay 100200;
	_ctrl = _display displayCtrl 100207;

	if ((lbCurSel _ctrl) < 0) exitWith {
		(_display displayCtrl 100210) ctrlEnable false;
		(_display displayCtrl 100211) ctrlEnable false;
		(_display displayCtrl 100213) ctrlShow true;

    ["You have not selected an item", CB_Red] call CB_MessageSystem;
	};

  _tmp = [] call CB_weapons;
	_weapon = _tmp select (lbCurSel _ctrl);
	_weaponType = getNumber(configFile >> "CfgWeapons" >> (_weapon select 1) >> "type");
	_weaponPrice = _weapon select 3;

	if (player_cash - _weaponPrice <= 0) exitWith { ["You can not afford this.", CB_Red] call CB_MessageSystem };
	player_cash = player_cash - _weaponPrice;

  [_weapon select 1, "WEP"] spawn CB_boxThread;

	_weaponName = getText(configFile >> "CfgWeapons" >> (_weapon select 1) >> "DisplayName");
	[format["You have bought %1 for $%2", _weaponName, _weaponPrice], CB_Green] call CB_MessageSystem;

  [] call CB_sellList;
  [] call CB_saveGear;
  [getPlayerUID player, 2, [player_cash, player_bank]] remoteExec ["DB_fnc_partialSync", 2];
};

CB_buySelectedItem = {
  private["_display", "_ctrl", "_itemName", "_weapon", "_weaponType", "_weaponPrice", "_weaponCPrice", "_weaponOwned", "_weaponName", "_muzzles", "_sights", "_extras", "_discount", "_cattachments", "_tmp", "_attachments", "_itemType"];
  _display = findDisplay 100200;
	_ctrl = _display displayCtrl 100207;

	if ((lbCurSel _ctrl) < 0) exitWith { ["You have not selected an item", CB_Red] call CB_MessageSystem; };

  _tmp = [] call CB_weapons;
	_weapon = _tmp select (lbCurSel _ctrl);
	_weaponType = getNumber(configFile >> "CfgWeapons" >> (_weapon select 1) >> "type");
	_cattachments = [];

	_ctrl = _display displayCtrl 100209;
	if ((lbCurSel _ctrl) < 0) exitWith { ["You have not selected an item", CB_Red] call CB_MessageSystem; };

	_attachment = _ctrl lbData (lbCurSel _ctrl);

	if (getText(configFile >> "CfgMagazines" >> _attachment >> "DisplayName") != "") exitWith {
		_ctrl = _display displayCtrl 100210;
		_buyCount = ctrlText _ctrl;
		if !([_buyCount] call CB_isNumber) exitWith { ["You must enter a valid number to buy", CB_Red] call CB_MessageSystem; };
		_buyCount = parseNumber(_buyCount);

    if (_buyCount > 1) then {
      _buyCount = _buyCount -1;
    };

		_attachmentPrice = ([_attachment] call CB_weaponItems) * _buyCount;
		if (player_cash - _attachmentPrice < 0) exitWith { hint "You can not afford this amount of magazines"; };
		player_cash = player_cash - _attachmentPrice;

		_attachmentName = getText(configFile >> "CfgMagazines" >> _attachment >> "DisplayName");
		[format["You have bought %1 %2's for £%3", _buyCount, _attachmentName, _attachmentPrice], CB_Green] call CB_MessageSystem;

    [_attachment, "ITE", _buyCount] spawn CB_boxThread;

	};

	_attachmentPrice = [_attachment] call CB_weaponItems;
	_attachmentType = getNumber(configFile >> "CfgWeapons" >> _attachment >> "ItemInfo" >> "Type");
	if (player_cash - _attachmentPrice < 0) exitWith {["You can not afford this attachment", CB_Red] call CB_MessageSystem; };
	player_cash = player_cash - _attachmentPrice;

	_attachmentName = getText(configFile >> "CfgWeapons" >> _attachment >> "DisplayName");
 [format["You have bought %1 for £%2", _attachmentName, _attachmentPrice], CB_Green] call CB_MessageSystem;
 [_attachment, "ITE"] spawn CB_boxThread;

 [] call CB_sellList;
 [] call CB_saveGear;
 [getPlayerUID player, 2, [player_cash, player_bank]] remoteExec ["DB_fnc_partialSync", 2];
};

CB_boxThread = {
  private ["_box", "_weapon", "_weaponType", "_attachments", "_count"];
  params [
    ["_weapon", "", [""]],
    ["_type", "", [""]],
    ["_count", 0, [0]]
  ];

  _box = "Box_NATO_Wps_F" createVehicleLocal (position player);
  clearWeaponCargo _box;
  clearMagazineCargo _box;
  clearItemCargo _box;
  clearBackpackCargo _box;

  switch (_type) do {
    case "WEP": {
      _box addWeaponCargo [_weapon, 1];
    };
    case "ITE": {
      for "_i" from 0 to _count do {
      _box addItemCargo [_weapon, 1];
      };
    };
  };

  ["Your purchase has been delivered. The box will be removed in 1 minute", CB_Green] call CB_MessageSystem;
  sleep 30;
  ["30 Seconds till the box is removed.", CB_Green] call CB_MessageSystem;
  sleep 30;
  systemChat "Cleanup:";
  deleteVehicle _box;
};

disableSerialization;
createDialog "CB_dlg_shopWeapons";

_display = findDisplay 100200;
_ctrl = _display displayCtrl 100201;
_ctrl ctrlSetText "Gun Store";

_ctrl ctrlCommit 0;

[] call CB_updateWeaponList;
[] call CB_onWeaponSelect;
[] call CB_sellList;

(_display displayCtrl 100207) ctrlSetEventHandler ["LBSelChanged", "[] call CB_onWeaponSelect"];
(_display displayCtrl 100209) ctrlSetEventHandler ["LBSelChanged", "[] call CB_onItemSelect"];
(_display displayCtrl 100206) ctrlAddEventHandler["ButtonDown", "[] call CB_sellSelected"];
(_display displayCtrl 100208) ctrlAddEventHandler["ButtonDown", "[] call CB_buySelected"];
(_display displayCtrl 100211) ctrlAddEventHandler["ButtonDown", "[] call CB_buySelectedItem"];
