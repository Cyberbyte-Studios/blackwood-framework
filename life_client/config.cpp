class DefaultEventhandlers;
class CfgPatches {
  class life_client {
    units[] = {"C_man_1"};
    weapons[] = {};
    requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
    fileName = "life_server.pbo";
    author[]= {"CyberByte Studios"};
  };
};

class CfgFunctions {
	class CyberByte {
		tag = "CB";
		class Player {
			file = "\life_client\Functions\Player";
			class player {};
		};
    class UI {
			file = "\life_client\Functions\UI";
			class notification {};
		};
	};
};
