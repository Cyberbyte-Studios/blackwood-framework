class CfgPatches {
	class Farming {
		units[] = {"CB_Plants"};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = {"CB_Core"};
	};
};
class cfgVehicleClasses {
	class CB_Plants {
		displayName = "CB Plants";
	};
};
class CfgVehicles {
	class Fence;

	class CB_Plant: Fence {
		class DestructionEffects;
	};

	class CB_Olive: CB_Plant {
		scope = 2;
		model = "A3\plants_f\Bush\b_FicusC1s_F.p3d";
		icon = "CB_Core\data\placeholder.paa";
		displayName = "Olive Plant";
		accuracy = 0.300000;
		vehicleclass = "CB_Plants";
	};
	class CB_Poppy: CB_Plant {
		scope = 2;
		model = "A3\plants_f\Bush\b_NeriumO2s_F.p3d";
		icon = "CB_Core\data\placeholder.paa";
		displayName = "Poppy Plant";
		accuracy = 0.300000;
		vehicleclass = "CB_Plants";
	};
};
