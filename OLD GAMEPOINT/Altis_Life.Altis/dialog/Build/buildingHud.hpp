	class buildingHUD
   	{
		idd=-1;
		movingEnable=0;
	  	fadein=1;
	  	fadeout=1;
		duration = 99999999999999999999999999999999999999999999;
		name="buildingHUD";
		onLoad="uiNamespace setVariable ['buildingHUD',_this select 0]";
		objects[]={};
		
		class controlsBackground 
		{
			class MainBackground:Life_RscText {
				colorBackground[] = {0, 0, 0, 0.5};
				idc = -1;
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.65;
				w = 0.4;
				h = 0.6;
			};
		};
		
		class controls
		{
			class TitleHeader : Life_RscStructuredText
			{
				idc = -1;
				size = 0.06;
				align = "center";
				text = "<t color='#00ff00' align='center'>Gamepoint</t><br/><t align='center'>Gang base building</t>";
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.65;
				w = 0.4;
				h = 0.6;
			};
			
			class RotateControl : Life_RscStructuredText
			{
				idc = -1;
				size = 0.04;
				text = "<t color='#ff0000' align='left'>Q/E</t><t align='right'>Rotate object left/right</t>";
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.5;
				w = 0.4;
				h = 0.45;
			};
			
			class AltitudeControl : Life_RscStructuredText
			{
				idc = -1;
				size = 0.04;
				text = "<t color='#ff0000' align='left'>Page up/down</t><t align='right'>Rise/lower object</t><br/><t size='0.8' color='#ff0000' align='left'>+ Ctrl</t><t size='0.8' align='right'>Smaller steps</t><br/><t size='0.8' color='#ff0000' align='left'>+ Alt</t><t size='0.8' align='right'>Bigger steps</t>";
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.45;
				w = 0.4;
				h = 0.4;
			};
			
			class SpaceControl : Life_RscStructuredText
			{
				idc = -1;
				size = 0.04;
				text = "<t color='#ff0000' align='left'>Space</t><t align='right'>Build object</t>";
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.29;
				w = 0.4;
				h = 0.24;
			};
			
			class FreezeControl : Life_RscStructuredText
			{
				idc = -1;
				size = 0.04;
				text = "<t color='#ff0000' align='left'>F</t><t align='right'>Freeze/Unfreeze object</t>";
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.34;
				w = 0.4;
				h = 0.29;
			};
			
			class BuildGround : Life_RscStructuredText
			{
				idc = 80000;
				size = 0.04;
				text = "<t color='#ffffff' align='left'>[G] Build on ground level</t><t align='right' color='#ff0000'>No</t>";
				x = safeZoneX + safeZoneW - 0.44;
				y = safeZoneY + safeZoneH - 0.2;
				w = 0.4;
				h = 0.15;
			};
		};   
 	};