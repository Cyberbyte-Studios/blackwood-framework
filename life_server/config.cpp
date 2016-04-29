class DefaultEventhandlers;
class CfgPatches {
  class life_server {
    units[] = {"C_man_1"};
    weapons[] = {};
    requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
    fileName = "life_server.pbo";
    author[]= {"CyberByte Studios"};
  };
};

class CfgFunctions {
	class Database {
		tag = "DB";
		class MySQL {
			file = "\life_server\Server\Functions\DB\Core";
			class numberSafe {};
		  class mresArray {};
			class asyncCall{};
			class mresToArray {};
			class bool {};
			class mresString {};
		};

    class Requests {
			file = "\life_server\Server\Functions\DB\Requests";
      class fetchPlayer {};
      class insertPlayer {};
    };
	};

  class CyberByte {
    tag = "CB";
    class Core {
      file = "\life_server\Client\Functions\Core";
      class init {};
      class initVar {};
    };

    class Player {
      file = "\life_server\Client\Functions\Player";
      class player {};
    };

    class UI {
      file = "\life_server\Client\Functions\UI";
      class notification {};
    };
  };
};
