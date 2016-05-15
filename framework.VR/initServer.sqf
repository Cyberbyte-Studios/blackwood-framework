if(!(_this select 0)) exitWith {}; //Not server
[] call compile PreProcessFileLineNumbers "\life_client\init.sqf";
[] call compile PreprocessFileLineNumbers "\life_server\init.sqf";
