#define ST_CENTER         0x02

/*
    Author: Metehan S.

    File: hud_stats.hpp
*/

class playerHUD {
    idd = -1;
    style = ST_VERTICAL;
    duration = 10e10;
    movingEnable = 0;
    fadein = 0;
    fadeout = 0;
    name = "playerHUD";
    onLoad = "uiNamespace setVariable ['playerHUD',_this select 0]";
    objects[] = {};
    controls[] = {
        Life_RscBackground_HUD,
        Life_RscBackground_HUD1,
        Life_RscBackground_HUD2,
        Life_RscProgress_HUDFood,
        Life_RscProgress_HUDHealth,
        Life_RscProgress_HUDWater,
        Life_RscPicture_HUDHealth,
        Life_RscPicture_HUDFood,
        Life_RscPicture_HUDWater
    };

    /* Background */
    class Life_RscBackground_HUD : Life_RscBackground {
        colorBackground[] = {0,0,0,0.35};
        x = 0.938281 * safezoneW + safezoneX;
        y = 0.852 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.121 * safezoneH;
    };

    class Life_RscBackground_HUD1 : Life_RscBackground {
        colorBackground[] = {0,0,0,0.35};
        x = 0.9125 * safezoneW + safezoneX;
        y = 0.852 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.121 * safezoneH;
    };

    class Life_RscBackground_HUD2 : Life_RscBackground {
        colorBackground[] = {0,0,0,0.35};
        x = 0.964063 * safezoneW + safezoneX;
        y = 0.852 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.121 * safezoneH;
    };

    /* Progress Bars */
    class LIFE_RscProgress_HUDCommon : Life_RscProgressbar {
        colorFrame[] = {0, 0, 0, 0.8};
        colorBackground[] = {0,0,0,0.7};
        y = 0.972223 * safezoneH + safezoneY;
        w = 0.0462964 * safezoneW;
        h = 0.0222222 * safezoneH;
    };

    class Life_RscProgress_HUDFood : LIFE_RscProgress_HUDCommon {
        idc = 2200;
        colorBar[] = {0,0.84,0.14,0.7};
        x = 0.938281 * safezoneW + safezoneX;
        y = 0.852 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.121 * safezoneH;
    };

    class Life_RscProgress_HUDHealth : LIFE_RscProgress_HUDCommon {
        idc = 2201;
        colorBar[] = {0.78,0.07,0.22,0.9};
        x = 0.9125 * safezoneW + safezoneX;
        y = 0.852 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.121 * safezoneH;
    };


    class Life_RscProgress_HUDWater : LIFE_RscProgress_HUDCommon {
        idc = 2202;
        colorBar[] = {0.07,0.43,0.95,0.9};
        x = 0.964063 * safezoneW + safezoneX;
        y = 0.852 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.121 * safezoneH;
        };

    /* Picture */
    class Life_RscPicture_HUDCommon : Life_RscPicture {
        SizeEx = 0.023;
        style = 48;
        colorBackground[] = {0,0,0,0.8};
        y = 0.918 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.033 * safezoneH;
    };

    class Life_RscPicture_HUDHealth : Life_RscPicture_HUDCommon {
        idc = 1200;
        text = "icons\health.paa";
        x = 0.9125 * safezoneW + safezoneX;
        y = 0.918 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.033 * safezoneH;
    };

    /* Picture 2 */
    class Life_RscPicture_HUD1Common : Life_RscPicture {
        SizeEx = 0.023;
        style = 48;
        colorBackground[] = {0,0,0,0.8};
        y = 0.918 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.033 * safezoneH;
    };

    class Life_RscPicture_HUDFood : Life_RscPicture_HUD1Common {
        idc = 1201;
        text = "icons\food.paa";
        x = 0.938281 * safezoneW + safezoneX;
    };

    /* Picture 3 */
    class Life_RscPicture_HUD2Common : Life_RscPicture {
        SizeEx = 0.023;
        style = 48;
        colorBackground[] = {0,0,0,0.8};
        y = 0.918 * safezoneH + safezoneY;
        w = 0.020625 * safezoneW;
        h = 0.033 * safezoneH;
    };

    class Life_RscPicture_HUDWater : Life_RscPicture_HUD2Common {
        idc = 1202;
        text = "icons\water.paa";
        x = 0.964063 * safezoneW + safezoneX;
    };
};
