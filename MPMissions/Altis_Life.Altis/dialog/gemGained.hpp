class A3_gemGained
{    
	idd = -1;
	duration = 5;
	onLoad = "uiNamespace setVariable ['gemGained', _this select 0]";
	fadein = 0.5;
	fadeout = 0.5;
	
	class controls
	{
		class TitleMain 
		{    
			idc = 1;
			type = 0;
			style = 0x30 + 0x800;
			x = safeZoneX + safeZoneW - (safeZoneW / 2);
			y = safeZoneY + 0.4;
			h = 0.1;
			w = 0.1;
			sizeEx = 0.01;
			colorBackground[] = {0,0,0,0}; //white background
			colorText[] = {1,1,1,1}; //grey foreground
			font = "puristaMedium";
			text = "";
			shadow = 2;
		};
		
		class TitleText
		{    
			idc = 2;
			type = 0;
			style = 2;
			x = safeZoneX + safeZoneW - (safeZoneW / 2) - 0.95;
			y = safeZoneY + 0.1;
			h = 0.4;
			w = 2;
			sizeEx = 0.06;
			colorBackground[] = {0,0,0,0}; //white background
			colorText[] = {1,1,1,1}; //grey foreground
			font = "puristaMedium";
			text = "Testing";
			shadow = 2;
		};
	};	
};