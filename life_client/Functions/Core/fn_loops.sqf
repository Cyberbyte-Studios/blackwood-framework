CB_survivalLoop = {
	while {true} do {
		sleep 240;
		player_hunger = player_hunger - 1;
		player_thirst = player_thirst - 2;
		switch (true) do {
			case (player_hunger <= 3): {
	      [parseText "<t color='#fff95b' size='1.3' align='center'>Survival:<br /></t><t color='#750016' size='1.2'>Starvation imminent!!</t>", CB_Red] call CB_MessageSystem;
				_newdmg = (damage player) + 0.2;
				if (_newdmg >= 1) then {
					player_hunger = 0;
					player_thirst = 0;
					player setDamage 1;
				} else {
					player setDamage _newdmg;
				};
			};
			case (player_hunger <= 10): {
	      [parseText "<t color='#fff95b' size='1.3' align='center'>Survival:<br /></t><t color='#B80000'>You are starving!</t>", CB_Red] call CB_MessageSystem;
			};
		};
		switch (true) do {
			case (player_thirst <= 3): {
	      [parseText "<t color='#fff95b' size='1.3' align='center'>Survival:<br /></t><t color='#0F0094' size='1.2'>You are dying of thirst!!</t>", CB_Red] call CB_MessageSystem;
				_newdmg = (damage player) + 0.2;
				if (_newdmg >= 1) then {
					player_hunger = 0;
					player_thirst = 0;
					player setDamage 1;
				} else {
					player setDamage _newdmg;
				};
			};
			case (player_thirst <= 10): {
	      [parseText "<t color='#fff95b' size='1.3' align='center'>Survival:<br /></t><t color='#1700E6'>You really need a drink!</t>", CB_Red] call CB_MessageSystem;
			};
		};
	};
};

CB_saveLoop = {
	while {true} do {
		sleep 300;
		[] call CB_saveGear;
		["Gear Saved", CB_Green] call CB_MessageSystem;
	}
};
