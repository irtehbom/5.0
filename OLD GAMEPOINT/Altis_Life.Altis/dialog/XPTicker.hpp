class Transcend_XPTicker
{    
	idd = -1;
	duration = 999999999999;
	onLoad = "uiNamespace setVariable ['XPTicker', _this select 0]";
	fadein = 0;
	fadeout = 0;
	
	class controls
	{
		class TitleMain
		{    
			idc = 1;
			type = 0;
			style = 2; //centre text
			x = 0;
			y = safeZoneY + safeZoneH - 0.2;
			h = 0.2;
			w = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0}; //white background
			colorText[] = {1,1,1,1}; //grey foreground
			font = "puristaMedium";
			text = "";
			shadow = 2;
		};
		
		class TitleOne
		{    
			idc = 2;
			type = 0;
			style = 2; //centre text
			x = 0;
			y = safeZoneY + safeZoneH - 0.25;
			h = 0.2;
			w = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0}; //white background
			colorText[] = {1,1,1,1}; //grey foreground
			font = "puristaMedium";
			text = "";
			shadow = 2;
		};
		
		class TitleTwo
		{    
			idc = 3;
			type = 0;
			style = 2; //centre text
			x = 0;
			y = safeZoneY + safeZoneH - 0.3;
			h = 0.2;
			w = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0}; //white background
			colorText[] = {1,1,1,1}; //grey foreground
			font = "puristaMedium";
			text = "";
			shadow = 2;
		};
		
		class TitleThree
		{    
			idc = 4;
			type = 0;
			style = 2; //centre text
			x = 0;
			y = safeZoneY + safeZoneH - 0.35;
			h = 0.2;
			w = 1;
			sizeEx = 0.04;
			colorBackground[] = {0,0,0,0}; //white background
			colorText[] = {1,1,1,1}; //grey foreground
			font = "puristaMedium";
			text = "";
			shadow = 2;
		};
	};	
};