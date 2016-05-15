class DefaultEventhandlers;
class CfgPatches {
  class life_server {
    units[] = {"C_man_1"};
    weapons[] = {};
    requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
    fileName = "life_client.pbo";
    author[]= {"CyberByte Studios"};
  };
};

class CfgFunctions {
  class CyberByte {
    tag = "CB";
    class Core {
      file = "\life_client\Functions\Core";
      class init {};
      class initVar {};
      class loops {};
      class econ {};
      class helper {};
      class KRON {};                
    };

    class Player {
      file = "\life_client\Functions\Player";
      class player {};
    };

    class UI {
      file = "\life_client\Functions\UI";
      class notification {};
    };

    class Eventhandlers {
      file = "\life_client\Functions\Eventhandlers";
      class killed {};
      class handleDamage {};
      class respawn {};
      class fired {};
      class keyHandler {};
    };

    class Config {
      file = "\life_client\Functions\Config";
      class weaponShopConfig {};
    };

    class Shop {
      file = "\life_client\Functions\ShopSystem";
      class shopFunc {};
      class weaponShop {};
    };
  };
};
