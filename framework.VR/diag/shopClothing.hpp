#define CB_dlg_shopClothingX (0 - ((safezoneW / 100) * 20))
#define CB_dlg_shopClothingY (0 - ((safezoneH / 100) * 20))
#define CB_dlg_shopClothingW 0.4
#define CB_dlg_shopClothingH 0.6

class CB_dlg_shopClothing
{
	idd = 100300;
	name= "CB_dlg_shopClothing";
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
			colorBackground[] = {0.227, 0.227, 0.227, 0.25};
		};

		class banner: CB_RscPicture
		{
			idc = -1;
			x = safezoneX;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2);
			w = safezoneW;
			h = 0.08;
			colorText[] = { 1, 1, 1, 0.25 };
			text = "gfx\misc\largeLineNB.jpg";
		};

		class bannerL: CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2);
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2);
			w = 0.025;
			h = 0.08;
			text = "gfx\misc\largeLineL.jpg";
		};

		class bannerM: bannerL
		{
			idc = -1;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.025;
			w = CB_dlg_shopClothingW - 0.05;
			h = 0.08;
			text = "gfx\misc\largeLineM.jpg";
		};

		class bannerR: bannerL
		{
			idc = -1;
			x = CB_dlg_shopClothingX + CB_dlg_shopClothingW + ((1 - CB_dlg_shopClothingW) / 2) - 0.025;
			text = "gfx\misc\largeLineR.jpg";
		};

		class bannerText: CB_RscStructuredText
		{
			idc = -1;
			x = CB_dlg_shopClothingX + safezoneX;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + 0.01;
			w = safezoneW;
			h = 0.08;
			text = "Clothing Store";

			class Attributes
			{
				color = "#000000";
				align = "center";
			};
		};

		class bodyBackdrop: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2);
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + 0.08;
			w = CB_dlg_shopClothingW;
			h = CB_dlg_shopClothingH - 0.08;
			colorBackground[] = {0.227, 0.227, 0.227, 1};
		};

		class bodyHDiv: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + 0.13;
			w = CB_dlg_shopClothingW - 0.02;
			h = 0.002;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class shopHeader: CB_RscStructuredText
		{
			idc = 100301;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + 0.085;
			w = CB_dlg_shopClothingW - 0.02;
			h = 0.04;
			text = "Items";
			sizeEx = 0.025;

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "left";
			};
		};

		class buyButtonBD : CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + CB_dlg_shopClothingH - 0.05;
			w = CB_dlg_shopClothingW - 0.02;
			h = 0.04;
			text = "gfx\misc\smallLine.jpg";
		};
	};

	class controls
	{
		class shopItems: CB_RscListNBox
		{
			idc = 100302;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + 0.14;
			w = CB_dlg_shopClothingW - 0.02;
			h = CB_dlg_shopClothingH - 0.30;
			rowHeight = 0.050;
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			sizeEx = 0.030;
			text = "";
		};

		class filter: CB_RscCombo
		{
			idc = 100303;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + CB_dlg_shopClothingH - 0.15;
			w = CB_dlg_shopClothingW - 0.02;
			h = 0.04;
		};

		class price: CB_RscStructuredText
		{
			idc = 100304;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + CB_dlg_shopClothingH - 0.1;
			w = CB_dlg_shopClothingW / 2 - 0.015;
			h = 0.04;
			sizeEx = 0.035;
			text = "Price: £0";

			class Attributes
			{
				align = "center";
			};
		};

		class total: price
		{
			idc = 100305;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.005 + (CB_dlg_shopClothingW / 2);
			text = "Total: £0";
		};

		class buyButton: CB_RscButtonMenu
		{
			idc = 100306;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + CB_dlg_shopClothingH - 0.05;
			w = CB_dlg_shopClothingW - 0.02;
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			color[] = {0.157, 0.157, 0.157, 1};
			colorFocused[] = {0.157, 0.157, 0.157, 1};
			text = "Buy Clothing";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};

		class noItems: CB_RscStructuredText
		{
			idc = 100307;
			x = CB_dlg_shopClothingX + ((1 - CB_dlg_shopClothingW) / 2) + 0.01;
			y = CB_dlg_shopClothingY + ((1 - CB_dlg_shopClothingH) / 2) + 0.14 + ((CB_dlg_shopClothingH - 0.30) / 2) - 0.04;
			w = CB_dlg_shopClothingW - 0.02;
			h = 0.04;
			text = "No Available Items";

			class Attributes
			{
				color = "#FFFFFF";
				align = "center";
			};
		};
	};
};
