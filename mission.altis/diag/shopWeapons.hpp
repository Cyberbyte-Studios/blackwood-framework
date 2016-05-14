#define CB_dlg_shopWeaponsX 0
#define CB_dlg_shopWeaponsY 0
#define CB_dlg_shopWeaponsW 0.88
#define CB_dlg_shopWeaponsH 0.9

class CB_dlg_shopWeapons
{
	idd = 100200;
	name= "CB_dlg_shopWeapons";
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
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2);
			w = safezoneW;
			h = 0.08;
			colorText[] = { 1, 1, 1, 0.25 };
			text = "gfx\misc\largeLineNB.jpg";
		};

		class bannerL: CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2);
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2);
			w = 0.025;
			h = 0.08;
			text = "gfx\misc\largeLineL.jpg";
		};

		class bannerM: bannerL
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.025;
			w = CB_dlg_shopWeaponsW - 0.05;
			h = 0.08;
			text = "gfx\misc\largeLineM.jpg";
		};

		class bannerR: bannerL
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + CB_dlg_shopWeaponsW + ((1 - CB_dlg_shopWeaponsW) / 2) - 0.025;
			text = "gfx\misc\largeLineR.jpg";
		};

		class bannerText: CB_RscStructuredText
		{
			idc = 100201;
			x = CB_dlg_shopWeaponsX + safezoneX;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.01;
			w = safezoneW;
			h = 0.08;
			text = "Cyberbyte Studios Weapon Shop";

			class Attributes
			{
				color = "#000000";
				align = "center";
			};
		};

		class bodyBackdrop: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2);
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.08;
			w = CB_dlg_shopWeaponsW;
			h = CB_dlg_shopWeaponsH - 0.08;
			colorBackground[] = {0.227, 0.227, 0.227, 1};
		};

		class bodyHDiv: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.13;
			w = CB_dlg_shopWeaponsW - 0.02;
			h = 0.002;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class bodyHDiv2: bodyHDiv
		{
			idc = -1;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) + 0.04;
		};

		class bodyHDiv3: bodyHDiv
		{
			idc = -1;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) + 0.09;
		};

		class bodyVDiv1: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) - 0.001;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.08;
			w = 0.001;
			h = CB_dlg_shopWeaponsH - 0.09;
			colorBackground[] = {0.321, 0.321, 0.321, 1};
		};

		class infoHeader: CB_RscStructuredText
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.085;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = 0.04;
			sizeEx = 0.025;
			text = "Information";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};

		class sellHeader: infoHeader
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			text = "Players Items";
		};

		class weaponHeader: infoHeader
		{
			idc = -1;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) + 0.045;
			text = "Weapons";
		};

		class extrasHeader: weaponHeader
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			text = "Mags | Attachments";
		};

		class sellAmount: infoHeader
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) - 0.01;
			w = 0.1;
			h = 0.04;
			text = "Amount:";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "left";
			};
		};

		class extraAmount: sellAmount
		{
			idc = -1;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + CB_dlg_shopWeaponsH - 0.1;
		};

		class weaponPrice: infoHeader
		{
			idc = 100214;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + CB_dlg_shopWeaponsH - 0.05;
			w = CB_dlg_shopWeaponsW / 2 - 0.14;
			text = "Price: £0";
		};

		class extraPrice: weaponPrice
		{
			idc = 100215;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
		};

		class sellButtonBD : CB_RscPicture
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + CB_dlg_shopWeaponsW - 0.13;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) - 0.01;
			w = 0.12;
			h = 0.04;
			text = "gfx\misc\smallLine.jpg";
		};

		class weaponButtonBD : sellButtonBD
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) - 0.13;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + CB_dlg_shopWeaponsH - 0.05;
		};

		class extraButtonBD : weaponButtonBD
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + CB_dlg_shopWeaponsW - 0.13;
		};

		class infoImage : CB_RscPicture
		{
			idc = 100202;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.14;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = CB_dlg_shopWeaponsH / 2 - 0.26;
			text = "";
		};

		class infoTextholder : CB_RscControlsGroup
		{
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2 - 0.26) + 0.15;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = 0.14;

			class controls
			{
				class infoText: CB_RscStructuredText
				{
					idc = 100203;
					w = CB_dlg_shopWeaponsW / 2 - 0.02;
					h = 0.14 * 3.2;
					size = 0.03;
					text = "No Item Selected";

					class Attributes
					{
						font = "PuristaSemiBold";
						align = "center";
					};
				};
			};

			class HScrollbar : HScrollbar
			{
				height = 0;
			};

			class VScrollbar : VScrollbar
			{
				autoScrollEnabled = 1;
			};
		};

		class sellNoItemsText: CB_RscStructuredText
		{
			idc = 100212;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + ((CB_dlg_shopWeaponsH / 2 - 0.16) / 2) + 0.12;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = 0.04;
			size = 0.03;
			text = "No Items Found";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};

		class extraNoItemsText: sellNoItemsText
		{
			idc = 100213;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) + ((CB_dlg_shopWeaponsH / 2 - 0.16) / 2) + 0.08;
		};
	};

	class controls
	{
		class sellItems: CB_RscListNBox
		{
			idc = 100204;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.14;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = CB_dlg_shopWeaponsH / 2 - 0.16;
			rowHeight = 0.050;
			drawSideArrows = false;
			idcLeft = -1;
			idcRight = -1;
			sizeEx = 0.030;
			text = "";
		};

		class weaponItems: sellItems
		{
			idc = 100207;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) + 0.1;
		};

		class extraItems: weaponItems
		{
			idc = 100209;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			h = CB_dlg_shopWeaponsH / 2 - 0.21;
		};

		class sellAmount: CB_RscEdit
		{
			idc = 100205;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.12;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) - 0.01;
			w = (CB_dlg_shopWeaponsW / 2) - 0.26;
			h = 0.04;
			sizeEx = 0.030;
			text = "1";
		};

		class extraAmount: sellAmount
		{
			idc = 100210;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + CB_dlg_shopWeaponsH - 0.1;
			w = (CB_dlg_shopWeaponsW / 2) - 0.13;
			text = "1";
		};

		class sellButton : CB_RscButtonMenu
		{
			idc = 100206;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + CB_dlg_shopWeaponsW - 0.13;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) - 0.01;
			w = 0.12;
			colorBackground[] = {0, 0, 0, 0};
			colorBackgroundFocused[] = {0, 0, 0, 0};
			color[] = {0.157, 0.157, 0.157, 1};
			colorFocused[] = {0.157, 0.157, 0.157, 1};
			size = 0.035;
			text = "Sell";

			class Attributes
			{
				font = "PuristaSemiBold";
				align = "center";
			};
		};

		class weaponButton : sellButton
		{
			idc = 100208;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) - 0.13;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + CB_dlg_shopWeaponsH - 0.05;
			text = "Buy";
		};

		class extraButton : weaponButton
		{
			idc = 100211;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + CB_dlg_shopWeaponsW - 0.13;
		};

		/*class infoTemp: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.14;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = CB_dlg_shopWeaponsH / 2 - 0.26;
			colorBackground[] = {0, 0, 1, 1};
		};

		class infoTemp2: CB_RscText
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2 - 0.26) + 0.15;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = 0.14;
			colorBackground[] = {0, 0, 1, 1};
		};

		class sellTemp: infoTemp
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + 0.14;
			w = CB_dlg_shopWeaponsW / 2 - 0.02;
			h = CB_dlg_shopWeaponsH / 2 - 0.16;
		};

		class weaponsTemp: sellTemp
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + 0.01;
			y = CB_dlg_shopWeaponsY + ((1 - CB_dlg_shopWeaponsH) / 2) + (CB_dlg_shopWeaponsH / 2) + 0.1;
			h = CB_dlg_shopWeaponsH / 2 - 0.16;
		};

		class extrasTemp: weaponsTemp
		{
			idc = -1;
			x = CB_dlg_shopWeaponsX + ((1 - CB_dlg_shopWeaponsW) / 2) + (CB_dlg_shopWeaponsW / 2) + 0.01;
			h = CB_dlg_shopWeaponsH / 2 - 0.21;
		};*/
	};
};
