class life_hitmanContract_menu {
	idd = 60000;
	name= "life_hitmanContract_menu";
	movingEnable = false;
	enableSimulation = true;
	
	class controlsBackground {
		class Life_RscTitleBackground:Life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0.1;
			y = 0.2;
			w = 0.7;
			h = (1 / 25);
		};
		
		class MainBackground:Life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0.1;
			y = 0.2 + (11 / 250);
			w = 0.7;
			h = 0.6 - (22 / 250);
		};
	};
	
	class controls {

		
		class Title : Life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "Take Hitman contract";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class WantedConnection : Title {
			idc = 60001;
			style = 1;
			text = "";
		};
		
		class WantedList : Life_RscListBox 
		{
			idc = 60002;
			text = "";
			sizeEx = 0.035;
			onLBSelChanged = "[] call life_fnc_hitmanContractInfo";
			
			x = 0.12; y = 0.26;
			w = 0.3; h = 0.485;
		};
		
		class WantedDetails : Life_RscListBox
		{
			idc = 60003;
			text = "test";
			sizeEx = 0.035;
			colorBackground[] = {0, 0, 0, 0};
			
			x = 0.34;
			y = 0.35;
			w = 0.36;
			h = 0.32;
		};
		
		class ActualBountyPrice : Life_RscText
		{
			idc = 60006;
			size = 0.04;
			text = "";
			x = 0.42;
			y = 0;
			w = 0.6;
			h = 0.6;
		};
		
		class BountyPrice : Life_RscStructuredText
		{
			idc = 60004;
			size = 0.03;
			text = "Accepting a contract does not mean you are<br/>forced to complete it but try to do so<br/>anyway. If you've accepted a contract and<br/>killed the guy you will be paid the bounty<br/>on the player shown above. Good luck.";
			x = 0.42;
			y = 0.35;
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
		
		class TakeContractButtonKey : Life_RscButtonMenu {
			idc = 60005;
			text = "Accept";
			onButtonClick = "[] call life_fnc_hitmanContract; closeDialog 0;";
			x = 0.1 + (6.25 / 40) + (1 / 250 / (safezoneW / safezoneH));
			y = 0.8 - (1 / 25);
			w = (6.25 / 40);
			h = (1 / 25);
		};
	};
};