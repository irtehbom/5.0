class real_estate_menu {
	idd = 13000;
	name= "real_estate_menu";
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
			text = "Real Estate Menu";
			x = 0.1;
			y = 0.2;
			w = 0.6;
			h = (1 / 25);
		};
		
		class ButtonOne : life_RscButtonMenu
		{
			idc = 13001;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Purchase Estate";
			sizeEx = 0.025;
			x = 0.12;
			y = 0.27;
			w = 0.24;
			h = 0.038;
		};
		
		
		class ButtonTwo : life_RscButtonMenu
		{
			idc = 13002;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.12;
			y = 0.33;
			w = 0.24;
			h = 0.038;
		};
		
		class ButtonThree : life_RscButtonMenu
		{
			idc = 13003;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.025;
			x = 0.12;
			y = 0.39;
			w = 0.24;
			h = 0.038;
		};
		
		
		class rentText : Life_RscText
		{
			idc = 13010;
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.033;
			x = 0.37;
			y = 0.26;
			w = 0.6;
			h = 0.038;
		};
		
		class alreadyBought : Life_RscText
		{
			idc = 13009;
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.040;
			x = 0.22;
			y = 0.33;
			w = 0.6;
			h = 0.038;
		};
		
		class marketDueDate : Life_RscText
		{
			idc = 13008;
			//colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "";
			sizeEx = 0.030;
			x = 0.115;
			y = 0.40;
			w = 0.6;
			h = 0.038;
		};
		

		
		
	};
};