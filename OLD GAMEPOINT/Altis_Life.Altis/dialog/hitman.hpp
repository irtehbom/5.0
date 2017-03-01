class life_hitman_menu {
	idd = 50000;
	name= "life_hitman_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.6;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Hire Hitman";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class WantedConnection : Title {
			idc = 50001;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 50002;
			text = "";
			sizeEx = 0.035;
			
			x = 0.12; y = 0.26;
			w = 0.3; h = 0.485;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 50003;
			text = "test";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.35;
			w = 0.36;
			h = 0.32;
		};
		
		class moneyEdit : Life_RscEdit 
		{
			idc = 50005;
			
			text = "500000";
			sizeEx = 0.030;
			x = 0.44; y = 0.26;
			w = 0.25; h = 0.03;
		};
		
		class BountyPrice : Life_RscStructuredText
		{
			idc = 50004;
			size = 0.03;
			text = "Enter the bounty above.<br/><br/>No guarantees can be made<br/>for a successful kill. Anyone can<br/>pick up these contracts but your<br/>money will only be taken when<br/>the target was killed by a<br/>person that picked up the<br/>contract. If the player<br/>disconnects, bad luck.<br/>You were warned.";
			x = 0.42;
			y = 0.3;
			w = 0.6;
			h = 0.6;
		};
		
		class CloseButtonKey : Life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class HireButtonKey : Life_RscButtonMenu {
			idc = 50005;
			text = "Hire";
			onButtonClick = "[] call life_fnc_hireHitman; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};