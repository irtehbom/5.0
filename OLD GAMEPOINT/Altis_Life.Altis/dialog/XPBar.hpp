class XPBar
{    
	idd = -1;
	duration = 999999999999999999999;
	fadein = 0;
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['XPBar', _this select 0]";
	
	class controls
	{		
		class ProgressBar : Life_RscXPProgress
		{
			idc = 1;
			x = safeZoneX;
			y = safeZoneY + safeZoneH - 0.01;
			w = safeZoneW;
			h = 0.01;
		};
	};	
};