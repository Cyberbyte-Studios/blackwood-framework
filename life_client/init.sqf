CB_Function = {
	private ["_name","_Content","_Private"];
	_Name = [_this, 0] call BIS_fnc_param;
	_Content = [_this, 1] call BIS_fnc_param;
	_Private = [_this, 2, false] call BIS_fnc_param;

	call compile format ["%1 = %2;", _Name, _Content];

	if(!_Private) then { publicVariable _Name; };
};
publicVariable "CB_Function";

CB_isNumber = compileFinal "
	private[""_valid"",""_value"",""_compare""];
	_value = _this select 0;
	_valid = [""0"",""1"",""2"",""3"",""4"",""5"",""6"",""7"",""8"",""9""];
	_array = [_value] call KRON_StrToArray;
	_return = true;
	{
		if(_x in _valid) then
		{}
		else
		{
			_return = false;
		};
	} forEach _array;
	_return;
";
publicVariable "CB_isNumber";

["CB_MessageSystem", {
	private ["_msg","_title","_color","_new", "_i", "_final"];

	_msg = _this select 0;
	_color = _this select 1;
	_i = 0;

	_title = "<t align = 'center' shadow = '1' size='1.3' font='PuristaBold'>BLACKWOOD STUDIOS<br />NOTIFICATION SYSTEM</t>";
	_new = "<br /><br /><t align = 'center' shadow = '1' size='1' font='PuristaBold'>LATEST NOTIFICATIONS</t>";

	_final = "";

	CB_Messages = [[_msg,_color]] + CB_Messages;

	{
		if(_i < 5) then {
			_final = format["<br /><br /><t align='center' color='%2'>%1</t>",_x select 0,_x select 1] + _final;

			if(_i == 0) then {
				_final = _new + _final;
			};

			_i = _i + 1;
		};
	} forEach CB_Messages;

	hint parseText (_title + _final);

	if(count(CB_Messages) > 5) then { CB_Messages = []; };
}] call CB_Function;
publicVariable "CB_MessageSystem";

publicVariable "CB_fnc_init";
publicVariable "CB_fnc_initVar";
publicVariable "CB_fnc_player";
publicVariable "CB_fnc_notification";
publicVariable "CB_fnc_loops";
publicVariable "CB_fnc_econ";
publicVariable "CB_fnc_helper";
publicVariable "CB_fnc_KRON";

// Shop System
publicVariable "CB_fnc_shopFunc";
publicVariable "CB_fnc_weaponShop";
publicVariable "CB_fnc_weaponShopConfig";
publicVariable "CB_fnc_vehicleShopConfig";
publicVariable "CB_fnc_vehicleShop";

publicVariable "CB_fnc_handleDamage";
publicVariable "CB_fnc_killed";
publicVariable "CB_fnc_respawn";
publicVariable "CB_fnc_fired";
publicVariable "CB_fnc_keyHandler";
