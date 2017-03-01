class life_court_menu {
	idd = 9400;
	name= "life_court_menu";
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
			text = "Judge Menu";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class CourtTitle : Title {
			idc = 9404;
			style = 1;
			text = "";
		};
		
		class LeftListBox : Life_RscListBox 
		{
			idc = 9401;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_courtWantedInfo;";
			
			x = 0.12; y = 0.26;
			w = 0.2; h = 0.4;
		};
		
		class RightListBox : Life_RscListBox
		{
			idc = 9402;
			text = "";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.35;
			w = 0.36;
			h = 0.32;
		};
		
		class BountyPrice : Life_RscText
		{
			idc = 9403;
			text = "";
			x = 0.34;
			y = 0.03;
			w = 0.6;
			h = 0.6;
		};
		
		class CourtRelease : Life_RscButtonMenu {
			idc = -1;
			text = "Not Guilty";
			onButtonClick = "[] call life_fnc_courtRelease; closeDialog 0;";
			x = -0.06 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class CourtJail : Life_RscButtonMenu {
			idc = 9405;
			text = "Guilty";
			onButtonClick = "[] call life_fnc_courtJail; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		class Hammer : Life_RscButtonMenu {
			idc = 9405;
			text = "Hammer";
			onButtonClick = "[] call life_fnc_hammerSound;";
			x = 0.26 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};