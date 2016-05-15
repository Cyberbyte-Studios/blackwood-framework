#define CB_dlg_shopVehicleX 0
#define CB_dlg_shopVehicleY 0
#define CB_dlg_shopVehicleW 0.7
#define CB_dlg_shopVehicleH 0.6

class CB_dlg_shopVehicle
{
	idd = 100700;
	name= "CB_dlg_shopVehicle";
	movingEnable = false;
	enableSimulation = true;

	class controlsBackground
	{
		class backdrop: CB_RscText
		{
			idc = -1;
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			colorBackground[] = {0.227, 0.227, 0.227, 0.5};
		};

		class banner: CB_RscPicture
		{
			idc = -1;
			x = safezoneX;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2);
			w = safezoneW;
			h = 0.08;
			colorText[] = { 1, 1, 1, 0.5 };
			text = "gfx\misc\largeLineNB.jpg";
		};

		class bannerL: CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2);
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2);
			w = 0.025;
			h = 0.08;
			text = "gfx\misc\largeLineL.jpg";
		};

		class bannerM: bannerL
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.025;
			w = CB_dlg_shopVehicleY + CB_dlg_shopVehicleW - 0.05;
			h = 0.08;
			text = "gfx\misc\largeLineM.jpg";
		};

		class bannerR: bannerL
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + CB_dlg_shopVehicleW + ((1 - CB_dlg_shopVehicleW) / 2) - 0.025;
			text = "gfx\misc\largeLineR.jpg";
		};

		class bannerText: CB_RscStructuredText
		{
			idc = 100701;
			x = safezoneX;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.01;
			w = safezoneW;
			h = 0.08;
			text = "Vehicle Store";

			class Attributes
			{
				color = "#000000";
				align = "center";
			};
		};

		class bodyBackdrop: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2);
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.08;
			w = CB_dlg_shopVehicleW;
			h = CB_dlg_shopVehicleH - 0.08;
			colorBackground[] = {0.227, 0.227, 0.227, 1};
		};

		class bodyHDiv: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.01;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.13;
			w = CB_dlg_shopVehicleW - 0.02;
			h = 0.002;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class bodyVDiv: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.27;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.08;
			w = 0.001;
			h = CB_dlg_shopVehicleH - 0.09;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class vehiclesHeader: CB_RscStructuredText
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.01;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.085;
			w = 0.25;
			h = 0.04;
			text = "Vehicles";
			sizeEx = 0.025;

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};

		class infoHeader: vehiclesHeader
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.28;
			w = CB_dlg_shopVehicleW - 0.28;
			text = "Vehicle Information";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "left";
			};
		};

		class retrieveButtonBD : CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.01;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + CB_dlg_shopVehicleH - 0.05;
			w = 0.1225;
			h = 0.04;
			text = "gfx\misc\smallLine.jpg";
		};

		class sellButtonBD : retrieveButtonBD
		{
			idc = -1;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.1375;
		};
	};

	class controls
	{
		class vehicles: CB_RscListNBox
		{
			idc = 100702;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.01;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.14;
			w = 0.255;
			h = CB_dlg_shopVehicleH - 0.25;
			rowHeight = 0.050;
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			sizeEx = 0.030;
			text = "";
		};

		class skins: CB_RscCombo
		{
			idc = 100703;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.01;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + CB_dlg_shopVehicleH - 0.1;
			w = 0.255;
			h = 0.04;
		};

		class vehicleInfo: CB_RscStructuredText
		{
			idc = 100704;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.28;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.14;
			w = CB_dlg_shopVehicleW - 0.29;
			h = CB_dlg_shopVehicleH - 0.15;
			sizeEx = 0.035;
			text = "";
		};

		class rentButton: CB_RscButtonMenu
		{
			idc = 100705;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.01;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + CB_dlg_shopVehicleH - 0.05;
			w = 0.1225;
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			color[] = {0.157, 0.157, 0.157, 1};
			colorFocused[] = {0.157, 0.157, 0.157, 1};
			text = "Rent";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};

		class BuyButton: rentButton
		{
			idc = 100706;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.1375;
			text = "Buy";
		};

		class noVehicles: CB_RscStructuredText
		{
			idc = 100707;
			x = CB_dlg_shopVehicleX + ((1 - CB_dlg_shopVehicleW) / 2) + 0.28;
			y = CB_dlg_shopVehicleY + ((1 - CB_dlg_shopVehicleH) / 2) + 0.14 + ((CB_dlg_shopVehicleH - 0.14) / 2) - 0.04;
			w = CB_dlg_shopVehicleW - 0.29;
			h = 0.04;
			text = "No Vehicles Available";

			class Attributes
			{
				color = "#FFFFFF";
				align = "center";
			};
		};
	};
};
