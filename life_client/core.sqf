CB_Function = {
	private ["_name","_Content","_Private"];
	_Name = [_this, 0] call BIS_fnc_param;
	_Content = [_this, 1] call BIS_fnc_param;
	_Private = [_this, 2, false] call BIS_fnc_param;

	call compile format ["%1 = %2;", _Name, _Content];

	if(!_Private) then { publicVariable _Name; };
};
publicVariable "CB_Function";

["CB_MessageSystem", {
	private ["_msg","_title","_color","_new", "_i", "_final"];

	_msg = _this select 0;
	_color = _this select 1;
	_i = 0;

	_title = "<t align = 'center' shadow = '1' size='1.3' font='PuristaBold'>Frostbite RP<br />NOTIFICATION SYSTEM</t>";
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

publicVariable "CB_fnc_player";
publicVariable "CB_fnc_notification";
