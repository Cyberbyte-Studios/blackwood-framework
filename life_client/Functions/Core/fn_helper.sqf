#define EQUAL(condition1,condition2) condition1 isEqualTo condition2
#define SEL(ARRAY,INDEX) (ARRAY select INDEX)

[] call CB_fnc_KRON;

[] call CB_fnc_Player;
[] call CB_fnc_initVar;
[] call CB_fnc_loops;
[] call CB_fnc_econ;
[] call CB_fnc_weaponShopConfig;
[] call CB_fnc_vehicleShopConfig;

CB_fetchCFG = {
  private["_className","_section","_type","_accPointer","_accMuzzle","_accOptic","_classes","_itemInfo","_magazines","_scope","_config","_displayName"];
  _className = [_this,0,"",[""]] call BIS_fnc_param;
  _section = [_this,1,"",[""]] call BIS_fnc_param;
  if((EQUAL(_className,""))) exitWith {[]};

  _type = -1;
  _accPointer = [];
  _accOptic = [];
  _accMuzzle = [];
  _classes = [];
  _scope = 0;
  _itemInfo = -1;
  _muzzles = [];
  _magazines = [];
  _return = [];

  if(EQUAL(_section,"")) then {
  	_section = switch(true) do {
  		case (isClass(configFile >> "CfgMagazines" >> _className)): {"CfgMagazines"};
  		case (isClass(configFile >> "CfgWeapons" >> _className)): {"CfgWeapons"};
  		case (isClass(configFile >> "CfgVehicles" >> _className)): {"CfgVehicles"};
  		case (isClass(configFile >> "CfgGlasses" >> _className)): {"CfgGlasses"};
  	};
  };

  if(!(EQUAL(typeName _section,typeName "STRING")) OR {!isClass(configFile >> _section >> _className)} OR {EQUAL(_section,"")}) exitWith {[]};
  _config = configFile >> _section >> _className;
  _displayName = getText(_config >> "displayName");
  _picture = getText(_config >> "picture");
  _desc = getText(_config >> "descriptionshort");
  _base = inheritsFrom _config;

  switch (_section) do
  {
  	case "CfgVehicles": {
  		_type = getText(_config >> "vehicleClass");
  		_scope = getNumber(_config >> "scope");
  	};

  	case "CfgWeapons": {
  		_scope = getNumber(_config >> "scope");
  		_type = getNumber(_config >> "type");
  		_desc = getText(_config >> "descriptionshort");

  		//Compatible attachments
  		if(isClass (_config >> "WeaponSlotsInfo")) then {
  			_accPointer = getArray(_config >> "WeaponSlotsInfo" >> "PointerSlot" >> "compatibleItems");
  			_accOptic = getArray(_config >> "WeaponSlotsInfo" >> "CowsSlot" >> "compatibleItems");
  			_accMuzzle = getArray(_config >> "WeaponSlotsInfo" >> "MuzzleSlot" >> "compatibleItems");

  			{	private "_thiscfgitem";
  				for "_i" from 0 to (count(_x) - 1) do {
  					_thiscfgitem = _x select _i;
  					if (isClass _thiscfgitem) then {
  						if !((configName _thiscfgitem) in _classes) then {
  							_classes pushBack configName _thiscfgitem;
  						};
  					};
  				};
  			} forEach ([_config>>"WeaponSlotsInfo"] call bis_fnc_returnParents);
  		};

  		if(isClass (_config >> "ItemInfo")) then {
  			_itemInfo = getNumber(_config >> "ItemInfo" >> "Type");
  		};

  		_muzzles = getArray(_config >> "muzzles");
  		_magazines = getArray(_config >> "magazines");
  		if(!isNil {_muzzles}) then {
  			private["_tmp"];
  			{
  				if(_x != "this") then {
  					_tmp = getArray(_base >> _x >> "magazines"); {
  						_magazines pushBack _x;
  					} forEach (_tmp);
  				};
  			} forEach _muzzles;
  		};
  	};

  	case "CfgMagazines": {
  		_scope = getNumber(_config >> "scope");
  	};
  };

  if(!isNil "_classes") then {
  	_classes = _classes - ["MuzzleSlot"];
  	_classes = _classes - ["CowsSlot"];
  	_classes = _classes - ["PointerSlot"];
  };
  _return = [_className,_displayName,_picture,_scope,_type,_itemInfo,_section,_magazines,_muzzles,_desc,_accPointer,_accOptic,_accMuzzle,_base,_classes];
  _return;
};

CB_removeGear = {
  private["_item","_details","_bool","_ispack","_items","_isgun","_ongun","_override","_toUniform","_toVest","_preview"];
  _item = [_this,0,"",[""]] call BIS_fnc_param;
  _bool = [_this,1,false,[false]] call BIS_fnc_param;
  _ispack = [_this,2,false,[false]] call BIS_fnc_param;
  _ongun = [_this,3,false,[false]] call BIS_fnc_param;
  _override = [_this,4,false,[false]] call BIS_fnc_param;
  _toUniform = [_this,5,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a uniform.
  _toVest = [_this,6,false,[false]] call BIS_fnc_param; //Manual override to send items specifically to a vest
  _preview = [_this,7,false,[false]] call BIS_fnc_param;

  //Some checks
  if(EQUAL(_item,"")) exitWith {};
  _isgun = false;

  _details = [_item] call CB_fetchCFG;
  if(EQUAL(count _details,0)) exitWith {};

	switch(SEL(_details,6)) do {
		case "CfgVehicles": {
			removeBackpack player;
		};

		case "CfgMagazines": {
			player removeMagazine _item;
		};

		case "CfgGlasses": {
			if(EQUAL(_item,goggles player)) then {
				removeGoggles player;
			} else {
				player removeItem _item;
			};
		};

		case "CfgWeapons": {
			if(SEL(_details,4) in [1,2,4,5,4096]) then {
				if(EQUAL(SEL(_details,4),4096)) then {
					if(EQUAL(SEL(_details,5),1)) then {
						_isgun = true;
					};
				} else {
					_isgun = true;
				};
			};

			if(_isgun) then {
				switch(true) do {
					case (EQUAL(primaryWeapon player,_item)) : {_ispack = false;};
					case (EQUAL(secondaryWeapon player,_item)) : {_ispack = false;};
					case (EQUAL(handgunWeapon player,_item)) : {_ispack = false;};
					case (_item in assignedItems player) : {_ispack = false;};
					default {_ispack = true;};
				};

				if(_item == "MineDetector") then {
					player removeItem _item;
				} else {
					//Lovely code provided by [OCB]Dash
					private "_tmpfunction";
					_tmpfunction = {
						private["_tWeapons","_tWeaponCount"];
						switch(true) do {
							case (_this in (uniformItems player)): {
								_tWeapons = (getWeaponCargo (uniformContainer player)) select 0;
								_tWeaponCount = (getWeaponCargo (uniformContainer  player)) select 1;

								clearWeaponCargo (uniformContainer player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;
									};
									(uniformContainer player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};

							case (_this in (vestItems player)): {
								_tWeapons = (getWeaponCargo (vestContainer player)) select 0;
								_tWeaponCount = (getWeaponCargo (vestContainer  player)) select 1;

								clearWeaponCargo (vestContainer player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;
									};
									(vestContainer player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};

							case (_this in (backpackItems player)): {
								_tWeapons = (getWeaponCargo (backpackContainer player)) select 0;
								_tWeaponCount = (getWeaponCargo (backpackContainer  player)) select 1;

								clearWeaponCargo (backpackContainer player);
								{
									_numVestWeps = _tWeaponCount select _forEachIndex;
									if(_x == _this) then
									{
										_numVestWeps = _numVestWeps - 1;
									};
									(backpackContainer player) addWeaponCargo [ _x,_numVestWeps];
								}forEach _tWeapons;
							};
						};
					};

					if(_ispack) then {
						_item call _tmpfunction;
					} else {
						switch(true) do {
							case (_item in (uniformItems player)): {_item call _tmpfunction;};
							case (_item in (vestItems player)) : {_item call _tmpfunction;};
							case (_item in (backpackItems player)) : {_item call _tmpfunction;};
							default {player removeWeapon _item;};
						};
					};
				};
			} else {
				switch(SEL(_details,5)) do {
					case 0: {player unassignItem _item; player removeItem _item;};
					case 605: {if(EQUAL(headGear player,_item)) then {removeHeadgear player} else {player removeItem _item};};
					case 801: {if(EQUAL(uniform player,_item)) then {removeUniform player} else {player removeItem _item};};
					case 701: {if(EQUAL(vest player,_item)) then {removeVest player} else {player removeItem _item};};
					case 621: {player unassignItem _item; player removeItem _item;};
					case 616: {player unassignItem _item; player removeItem _item;};
					default {
						switch (true) do {
							case (_item in primaryWeaponItems player) : {player removePrimaryWeaponItem _item;};
							case (_item in handgunItems player) : {player removeHandgunItem _item;};
							default {player removeItem _item;};
						};
					};
				};
			};
		};
	};
};

CB_numberText = {
  private ["_number","_mod","_digots","_digitsCount","_modBase","_numberText"];

  _number = [_this,0,0,[0]] call bis_fnc_param;
  _mod = [_this,1,3,[0]] call bis_fnc_param;

  _digits = _number call bis_fnc_numberDigits;
  _digitsCount = count _digits - 1;

  _modBase = _digitsCount % _mod;
  _numberText = "";
  {
      _numberText = _numberText + str _x;
      if ((_foreachindex - _modBase) % (_mod) == 0 && _foreachindex != _digitsCount) then {_numberText = _numberText + ",";};
  } forEach _digits;
  _numberText;
};
