class Medic
{    
	idd = -1;
	duration = 999999999999999999999;
	fadein = 0;
	fadeout = 0;
	onLoad = "uiNamespace setVariable ['Medic', _this select 0]";
	
	class controls
	{
		class DeadBox : Life_RscListBox
		{
			idc = 1;
			text = "";
			sizeEx = 0.030;
			
			x = safeZoneX + safeZoneW - 0.3;
			y = 0.2;
			w = 0.185;
			h = 0.55;
		};
		
		class DistanceBox : Life_RscListBox
		{
			idc = 2;
			text = "";
			sizeEx = 0.030;
			
			x = safeZoneX + safeZoneW - 0.115;
			y = 0.2;
			w = 0.115;
			h = 0.55;
		};
	};	
};