#define WORP_dlg_shopX 0
#define WORP_dlg_shopY 0
#define WORP_dlg_shopW 0.7
#define WORP_dlg_shopH 0.6

class WORP_dlg_shop
{
	idd = 100100;
	name= "WORP_dlg_shop";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground
	{
		class backdrop: WORP_RscText
		{
			idc = -1;
			x = safezoneX;
			y = safezoneY;
			w = safezoneW;
			h = safezoneH;
			colorBackground[] = {0.227, 0.227, 0.227, 0.5};
		};
		
		class banner: WORP_RscPicture
		{
			idc = -1;
			x = safezoneX;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2);
			w = safezoneW;
			h = 0.08;
			colorText[] = { 1, 1, 1, 0.5 };
			text = "gfx\misc\largeLineNB.jpg";
		};
		
		class bannerL: WORP_RscPicture
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2);
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2);
			w = 0.025;
			h = 0.08;
			text = "gfx\misc\largeLineL.jpg";
		};
		
		class bannerM: bannerL
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.025;
			w = WORP_dlg_shopY + WORP_dlg_shopW - 0.05;
			h = 0.08;
			text = "gfx\misc\largeLineM.jpg";
		};
		
		class bannerR: bannerL
		{
			idc = -1;
			x = WORP_dlg_shopX + WORP_dlg_shopW + ((1 - WORP_dlg_shopW) / 2) - 0.025;
			text = "gfx\misc\largeLineR.jpg";
		};
		
		class bannerText: WORP_RscStructuredText
		{
			idc = 100101;
			x = safezoneX;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + 0.01;
			w = safezoneW;
			h = 0.08;
			text = "Tropic Life Shop";
			
			class Attributes
			{
				color = "#000000";
				align = "center";
			};
		};
		
		class bodyBackdrop: WORP_RscText
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2);
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + 0.08;
			w = WORP_dlg_shopW;
			h = WORP_dlg_shopH - 0.08;
			colorBackground[] = {0.227, 0.227, 0.227, 1};
		};
		
		class bodyHDiv: WORP_RscText
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.01;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + 0.13;
			w = WORP_dlg_shopW - 0.02;
			h = 0.002;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};
		
		class bodyVDiv: WORP_RscText
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) - 0.0005;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + 0.08;
			w = 0.001;
			h = WORP_dlg_shopH - 0.09;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};
		
		class shopHeader: WORP_RscStructuredText
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.01;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + 0.085;
			w = WORP_dlg_shopW / 2 - 0.015;
			h = 0.04;
			text = "Shop Items";
			sizeEx = 0.025;
			
			class Attributes
			{
				font = "PuristaSemiBold";
				color = "#FFFFFF";
				align = "center";
			};
		};
		
		class playerHeader: shopHeader
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) + 0.01;
			text = "Player Items";
		};
		
		class shopAmountText: WORP_RscStructuredText
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.01;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + WORP_dlg_shopH - 0.05;
			w = 0.1;
			h = 0.04;
			text = "Amount:";
			sizeEx = 0.23;
			
			class Attributes
			{
				color = "#FFFFFF";
				align = "left";
			};
		};
		
		class playerAmountText: shopAmountText
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) + 0.005;
		};
		
		class shopButtonBD : WORP_RscPicture
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.18;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + WORP_dlg_shopH - 0.05;
			w = (WORP_dlg_shopW / 2) - 0.185;
			h = 0.04;
			text = "gfx\misc\smallLine.jpg";
		};
		
		class playerButtonBD : shopButtonBD
		{
			idc = -1;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) + 0.175;
		};
	};
	
	class controls
	{
		class shopItems: WORP_RscListNBox
		{
			idc = 100102;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.01;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + 0.14;
			w = WORP_dlg_shopW / 2 - 0.015;
			h = WORP_dlg_shopH - 0.20;
			rowHeight = 0.050;
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			sizeEx = 0.030;
			text = "";
		};
		
		class playerItems: shopItems
		{
			idc = 100103;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) + 0.005;
		};
		
		class shopAmount: WORP_RscEdit 
		{
			idc = 100104;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.11;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + WORP_dlg_shopH - 0.05;
			w = 0.06;
			h = 0.04;
			sizeEx = 0.030;
			text = "1";
		};
		
		class playerAmount: shopAmount 
		{
			idc = 100105;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) + 0.105;
		};
		
		class shopButton : WORP_RscButtonMenu
		{
			idc = 100106;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + 0.18;
			y = WORP_dlg_shopY + ((1 - WORP_dlg_shopH) / 2) + WORP_dlg_shopH - 0.05;
			w = (WORP_dlg_shopW / 2) - 0.185;
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			color[] = {0.157, 0.157, 0.157, 1};
			colorFocused[] = {0.157, 0.157, 0.157, 1};
			text = "Buy";
			
			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};
		
		class playerButton : shopButton
		{
			idc = 100107;
			x = WORP_dlg_shopX + ((1 - WORP_dlg_shopW) / 2) + (WORP_dlg_shopW / 2) + 0.175;
			text = "Sell";
		};
	};
};
