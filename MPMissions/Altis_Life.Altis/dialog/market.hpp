class life_market {
	idd = 43000;
	name= "life_market";
	movingEnable = false;
	enableSimulation = true;
	onLoad = "[] spawn {[] call life_fnc_loadMarketData;};";
	
	class controlsBackground {};
	
	
	class controls {
		
		class RscText_1003: Life_RscText
		{
			idc = 43100;

			x = 0.389268 * safezoneW + safezoneX;
			y = 0.269 * safezoneH + safezoneY;
			w = 0.226807 * safezoneW;
			h = 0.341 * safezoneH;
			colorBackground[] = {0,0,0,0.8};
		};
		class Title: Life_RscText
		{
			idc = 43200;

			text = "A3 Gaming Market";
			x = 0.396906 * safezoneW + safezoneX;
			y = 0.28 * safezoneH + safezoneY;
			w = 0.108249 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			sizeEx = 0.04;
		};
		class Exit: Life_RscButtonMenu
		{
			idc = 43300;

			text = "Exit";
			x = 0.572166 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.0369748 * safezoneW;
			h = 0.022 * safezoneH;
			colorBackground[] = {0,255,0,0.3};
			onButtonClick = "closeDialog 0;";
		};
		class Website: Life_RscText
		{
			idc = 43400;

			text = "www.a3gaming.co.uk"; 
			x = 0.396906 * safezoneW + safezoneX;
			y = 0.577 * safezoneH + safezoneY;
			w = 0.108249 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			sizeEx = 0.03;
		};
		class Current_Price: Life_RscText
		{
			idc = 43500;
			
			text = "Sell Price";
			x = 0.520619 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.0670112 * safezoneW;
			h = 0.022 * safezoneH;
			font = "PuristaMedium";
			sizeEx = 0.04;
		};
		class Current_Price_Change: Life_RscText
		{
			idc = 43600;

			x = 0.525774 * safezoneW + safezoneX;
			y = 0.379 * safezoneH + safezoneY;
			w = 0.0824753 * safezoneW;
			h = 0.033 * safezoneH;
			font = "PuristaMedium";
			sizeEx = 0.04;
		};
		class List_Box_Left: Life_RscListbox
		{
			idc = 43700;
			
			onLBSelChanged = "[] spawn {[] call life_fnc_marketSelection;};";
			x = 0.396906 * safezoneW + safezoneX;
			y = 0.335 * safezoneH + safezoneY;
			w = 0.118558 * safezoneW;
			h = 0.22 * safezoneH;
			font = "PuristaMedium";
			sizeEx = 0.03;
		};

	};
};