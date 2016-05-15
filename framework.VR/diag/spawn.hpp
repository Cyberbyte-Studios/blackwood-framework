#define CB_dlg_spawnX 0
#define CB_dlg_spawnY 0
#define CB_dlg_spawnW 0.8
#define CB_dlg_spawnH 0.65

class CB_dlg_spawn
{
	idd = 100000;
	name= "CB_dlg_spawn";
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
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2);
			w = safezoneW;
			h = 0.08;
			colorText[] = { 1, 1, 1, 0.5 };
			text = "gfx\misc\largeLineNB.jpg";
		};

		class bannerL: CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2);
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2);
			w = 0.025;
			h = 0.08;
			text = "gfx\misc\largeLineL.jpg";
		};

		class bannerM: bannerL
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.025;
			w = CB_dlg_spawnY + CB_dlg_spawnW - 0.05;
			h = 0.08;
			text = "gfx\misc\largeLineM.jpg";
		};

		class bannerR: bannerL
		{
			idc = -1;
			x = CB_dlg_spawnX + CB_dlg_spawnW + ((1 - CB_dlg_spawnW) / 2) - 0.025;
			text = "gfx\misc\largeLineR.jpg";
		};

		class bannerText: CB_RscStructuredText
		{
			idc = -1;
			x = safezoneX;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.01;
			w = safezoneW;
			h = 0.08;
			text = "Spawn Location Selection";

			class Attributes
			{
				color = "#000000";
				align = "center";
			};
		};

		class bodyBackdrop: CB_RscText
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2);
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.08;
			w = CB_dlg_spawnW;
			h = CB_dlg_spawnH - 0.08;
			colorBackground[] = {0.227, 0.227, 0.227, 1};
		};

		class bodyHDiv: CB_RscText
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.01;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.13;
			w = 0.21;
			h = 0.002;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class bodyVDiv: CB_RscText
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.22;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.08;
			w = 0.001;
			h = CB_dlg_spawnH - 0.09;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class headerText: CB_RscStructuredText
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.01;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.085;
			w = 0.21;
			h = 0.04;
			text = "Location";
			sizeEx = 0.025;

			class Attributes
			{
				font = "PuristaSemiBold";
				color = "#FFFFFF";
				align = "center";
			};
		};

		class spawnButtonBD : CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.01;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + CB_dlg_spawnH - 0.05;
			w = (CB_dlg_spawnW / 2) - 0.2;
			h = 0.04;
			text = "gfx\misc\smallLine.jpg";
		};

		class mapView: CB_RscMapControl
		{
			idc = 100001;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.23;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.08;
			w = CB_dlg_spawnW - 0.24;
			h = CB_dlg_spawnH - 0.09;
			maxSatelliteAlpha = 0.75;
			alphaFadeStartScale = 1.15;
			alphaFadeEndScale = 1.29;
		};
	};

	class controls
	{
		class spawnLocationList: CB_RscListNBox
		{
			idc = 100002;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.01;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + 0.14;
			w = 0.205;
			h = CB_dlg_spawnH - 0.20;
			rowHeight = 0.050;
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			sizeEx = 0.030;
			text = "";
		};

		class spawnButton : CB_RscButtonMenu
		{
			idc = 100003;
			x = CB_dlg_spawnX + ((1 - CB_dlg_spawnW) / 2) + 0.01;
			y = CB_dlg_spawnY + ((1 - CB_dlg_spawnH) / 2) + CB_dlg_spawnH - 0.05;
			w = (CB_dlg_spawnW / 2) - 0.2;
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			color[] = {0.157, 0.157, 0.157, 1};
			colorFocused[] = {0.157, 0.157, 0.157, 1};
			text = "Spawn";
			onButtonClick = "closeDialog 0;";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};
	};
};
