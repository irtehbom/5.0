
class XPMenu {

	idd = 909090;
	movingEnable = true;
	enableSimulation = true;
	
	class controlsBackground {
	
		class life_RscTitleBackground:life_RscText {
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", "(profilenamespace getvariable ['GUI_BCG_RGB_A',0.7])"};
			idc = -1;
			x = 0;
			y = 0;
			w = 1.2;
			h = (1 / 25);
		};
		
		class MainBackground:life_RscText {
			colorBackground[] = {0, 0, 0, 0.7};
			idc = -1;
			x = 0;
			y = 0 + (11 / 250);
			w = 1.2;
			h = 1;
		};
		
		class Title : life_RscTitle {
			colorBackground[] = {0, 0, 0, 0};
			idc = -1;
			text = "XP, levels and skills";
			x = 0;
			y = 0;
			w = 1.2;
			h = (1 / 25);
		};
		
	
	};
	
	class controls {
		
		// Short explanation of skills
		class skillExplanation : Life_RscText
		{
			idc = -1;
			text = "You can select skills from all trees below.";
			sizeEx = 0.04;
			
			x = 0.01;
			y = 0.2;
			w = 0.6;
			h = 0.04;
		};
		// End
		
		
		class treeOneHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Common";
			sizeEx = 0.04;
			
			x = 0.01; y = 0.26;
			w = 0.27; h = 0.04;
		};
		
		class treeOneBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.9};
			idc = -1;
			x = 0.01;
			y = 0.26 + 0.04 + 0.007; // a bit of extra space maybe.
			w = 0.27;
			h = 0.7;
		};
		
		class treeTwoHeader : Life_RscText
		{
			idc = -1;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Utility";
			sizeEx = 0.04;
			
			x = 0.01 + 0.27 + 0.007;
			y = 0.26;
			w = 0.27;
			h = 0.04;
		};
		
		class treeTwoBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.9};
			idc = -1;
			x = 0.01 + 0.27 + 0.007;
			y = 0.26 + 0.04 + 0.007; // a bit of extra space maybe.
			w = 0.27;
			h = 0.7;
		};
		
		class treeThreeHeader : Life_RscText
		{
			idc = 3;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.3843])", "(profilenamespace getvariable ['GUI_BCG_RGB_G',0.7019])", "(profilenamespace getvariable ['GUI_BCG_RGB_B',0.8862])", 0.5};
			text = "Specific";
			sizeEx = 0.04;
			
			x = 0.01 + 0.27 + 0.27 + 0.007 + 0.007; // omg lawdy
			y = 0.26;
			w = 0.27;
			h = 0.04;
		};
		
		class treeThreeBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.9};
			idc = -1;
			x = 0.01 + 0.27 + 0.27 + 0.007 + 0.007;
			y = 0.26 + 0.04 + 0.007;
			w = 0.27;
			h = 0.7;
		};
		// + 0.007 between headers
		
		class panelBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.9};
			idc = -1;
			x = 0.01 + 0.27 + 0.27 + + 0.27 + 0.007 + 0.007 + 0.007;
			y = 0.26;
			w = 0.35;
			h = 0.44 + 0.007;
		};
		
		class panelSPBackground : life_RscText {
			colorBackground[] = {0, 0, 0, 0.9};
			idc = -1;
			x = 0.01 + 0.27 + 0.27 + + 0.27 + 0.007 + 0.007 + 0.007;
			y = 0.716;
			w = 0.35;
			h = 0.32;
		};
		
		// Curent rank title at the top
		class TitleText : life_RscText
		{    
			idc = 2;
			text = "Your current rank is scrublord";
			x = 0.006;
			y = 0.05;
			w = 0.5;
			h = 0.05;
			shadow = 2;
		};
		
		// XP Progress bar at the top
		class ProgressBar : Life_RscProgress
		{
			idc = 1;
			x = 0.01;
			y = 0.1;
			w = 0.83;
			h = 0.05;
		};
		
		// XP out of XP
		class XPText : Life_RscText
		{
			idc = 4;
			text = "XP Placeholder";
			x = 0.006;
			y = 0.14;
			w = 0.5;
			h = 0.05;
			sizeEx = 0.03;
			shadow = 2;
		};
		
		class NextRankIcon : Life_RscPictureKeepAspect
		{
			idc = 5;
			text = "";
			x = 0.91;
			y = 0.02;
			w = 0.2;
			h = 0.2;
		};
		
		class NextRankText : Life_RscText
		{
			idc = 6;
			text = "Next rank";
			x = 0.83;
			y = 0.21;
			w = 0.5;
			h = 0.05;
			sizeEx = 0.04;
			shadow = 2;
		};
		
		// End
		
		// Start first row
		class experiencedIcon : life_RscPictureKeepAspect
		{
			idc = 102;
			text = "xp\textures\skills\102.paa";
			x = 0.02;
			y = 0.33;
			w = 0.1;
			h = 0.1;
		};
		class experiencedButton : Life_SkillSelectButton {
			idc = 1020;
			onButtonClick = "[102] call life_fnc_xpSkillClicked;";
			x = 0.02;
			y = 0.33;
			w = 0.1;
			h = 0.1;
		};
		
		
		class skillfulIcon : life_RscPictureKeepAspect
		{
			
			idc = 106;
			text = "xp\textures\skills\106.paa";
			x = 0.16;
			y = 0.33;
			w = 0.1;
			h = 0.1;
		};
		class skillfulButton : Life_SkillSelectButton {
			idc = 1060;
			onButtonClick = "[106] call life_fnc_xpSkillClicked;";
			x = 0.16;
			y = 0.33;
			w = 0.1;
			h = 0.1;
		};
		
		// End first row
		
		
		// Start second row
		class luckyManIcon : life_RscPictureKeepAspect
		{
			idc = 103;
			text = "xp\textures\skills\103.paa";
			x = 0.02;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		class luckyManButton : Life_SkillSelectButton {
			idc = 1030;
			onButtonClick = "[103] call life_fnc_xpSkillClicked;";
			x = 0.02;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		
		class luckyManArrow : life_RscPictureKeepAspect
		{
			idc = 10300;
			text = "xp\textures\arrow-down.paa";
			x = 0.011; // -0.009
			y = 0.385; // -0.105
			w = 0.12;
			h = 0.12;
		};
		
		// Between buttons 0.16
		
		class healthyLivingIcon : life_RscPictureKeepAspect
		{
			
			idc = 100;
			text = "xp\textures\skills\100.paa";
			x = 0.16;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		class healthyLivingButton : Life_SkillSelectButton {
			idc = 1000;
			onButtonClick = "[100] call life_fnc_xpSkillClicked;";
			x = 0.16;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		
		// End second row
		
		// Start third row
		class toughCookieIcon : life_RscPictureKeepAspect
		{
			idc = 104;
			text = "xp\textures\skills\104.paa";
			x = 0.16;
			y = 0.69;
			w = 0.1;
			h = 0.1;
		};
		class toughCookieButton : Life_SkillSelectButton {
			idc = 1040;
			onButtonClick = "[104] call life_fnc_xpSkillClicked;";
			x = 0.16;
			y = 0.69;
			w = 0.1;
			h = 0.1;
		};
		
		class toughCookieArrow : life_RscPictureKeepAspect
		{
			idc = 10400;
			text = "xp\textures\arrow-down-alt.paa";
			x = 0.16 - 0.009;
			y = 0.69 - 0.105 - 0.003; // Up 3, as alt is just about outside the texture.
			w = 0.12;
			h = 0.12;
		};
		
		// End third row
		
		// Start fourth row
		class moneybagsIcon : life_RscPictureKeepAspect
		{
			idc = 105;
			text = "xp\textures\skills\105.paa";
			x = 0.02;
			y = 0.87;
			w = 0.1;
			h = 0.1;
		};
		class moneybagsButton : Life_SkillSelectButton {
			idc = 1050;
			onButtonClick = "[105] call life_fnc_xpSkillClicked;";
			x = 0.02;
			y = 0.87;
			w = 0.1;
			h = 0.1;
		};
		
		// End fourth row
		
		
		// UTILITY
		
		class greasemonkeyIcon : life_RscPictureKeepAspect
		{
			
			idc = 501;
			text = "xp\textures\skills\501.paa";
			x = 0.16 + 0.28;
			y = 0.33;
			w = 0.1;
			h = 0.1;
		};
		class greasemonkeyButton : Life_SkillSelectButton {
			idc = 5010;
			onButtonClick = "[501] call life_fnc_xpSkillClicked;";
			x = 0.16 + 0.28;
			y = 0.33;
			w = 0.1;
			h = 0.1;
		};
		
		//////
		
		class overseerIcon : life_RscPictureKeepAspect
		{
			idc = 109;
			text = "xp\textures\skills\109.paa";
			x = 0.02 + 0.28;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		class overseerButton : Life_SkillSelectButton {
			idc = 1090;
			onButtonClick = "[109] call life_fnc_xpSkillClicked;";
			x = 0.02 + 0.28;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		
		class actQuickIcon : life_RscPictureKeepAspect
		{
			
			idc = 107;
			text = "xp\textures\skills\107.paa";
			x = 0.16 + 0.28;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		class actQuickButton : Life_SkillSelectButton {
			idc = 1070;
			onButtonClick = "[107] call life_fnc_xpSkillClicked;";
			x = 0.16 + 0.28;
			y = 0.49;
			w = 0.1;
			h = 0.1;
		};
		class actQuickArrow : life_RscPictureKeepAspect
		{
			idc = 10700;
			text = "xp\textures\arrow-down.paa";
			x = 0.16 + 0.27; // -0.009
			y = 0.385; // -0.105
			w = 0.12;
			h = 0.12;
		};
		
		
		////////
		
		class planningPermissionIcon : life_RscPictureKeepAspect
		{
			idc = 110;
			text = "xp\textures\skills\110.paa";
			x = 0.02 + 0.28;
			y = 0.69;
			w = 0.1;
			h = 0.1;
		};
		class planningPermissionButton : Life_SkillSelectButton {
			idc = 1100;
			onButtonClick = "[110] call life_fnc_xpSkillClicked;";
			x = 0.02 + 0.28;
			y = 0.69;
			w = 0.1;
			h = 0.1;
		};
		class planningPermissionArrow : life_RscPictureKeepAspect
		{
			idc = 11000;
			text = "xp\textures\arrow-down-alt.paa";
			x = 0.011 + 0.28;
			y = 0.69 - 0.105 - 0.003; // Up 3, as alt is just about outside the texture.
			w = 0.12;
			h = 0.12;
		};
		
		class jumpingJackIcon : life_RscPictureKeepAspect
		{
			idc = 108;
			text = "xp\textures\skills\108.paa";
			x = 0.16 + 0.28;
			y = 0.69;
			w = 0.1;
			h = 0.1;
		};
		class jumpingJackButton : Life_SkillSelectButton {
			idc = 1080;
			onButtonClick = "[108] call life_fnc_xpSkillClicked;";
			x = 0.16 + 0.28;
			y = 0.69;
			w = 0.1;
			h = 0.1;
		};
		class jumpingJackArrow : life_RscPictureKeepAspect
		{
			idc = 10800;
			text = "xp\textures\arrow-down-alt.paa";
			x = 0.16 + 0.28 - 0.01;
			y = 0.69 - 0.105 - 0.003; // Up 3, as alt is just about outside the texture.
			w = 0.12;
			h = 0.12;
		};
		
		
		
		///////////
		
		
		class scavengerIcon : life_RscPictureKeepAspect
		{
			idc = 111;
			text = "xp\textures\skills\111.paa";
			x = 0.16 + 0.28;
			y = 0.87;
			w = 0.1;
			h = 0.1;
		};
		class scavengerButton : Life_SkillSelectButton {
			idc = 1110;
			onButtonClick = "[111] call life_fnc_xpSkillClicked;";
			x = 0.16 + 0.28;
			y = 0.87;
			w = 0.1;
			h = 0.1;
		};
		
		/////////////////////////////////////////////////////////////
		
		// Panel to view skill
		
		class skillIcon: life_RscPictureKeepAspect
		{
			idc = 200;
			text = "xp\textures\skills\default.paa";
			
			x = 0.82 + 0.009;
			y = 0.26 + 0.002;
			w = 0.11;
			h = 0.11;
		};
		
		class skillName : Life_RscText
		{
			idc = 201;
			text = "Select a skill to view";
			sizeEx = 0.04;
			
			x = 0.92;
			y = 0.22;
			w = 0.4;
			h = 0.2;
		};
		
		class skillDescription : Life_RscStructuredText
		{
			idc = 202;
			text = "Click a skill on the left to view details about it here.";
			//sizeEx = 0.02;
			size = "(((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 0.8)";
			
			x = 0.82 + 0.02;
			y = 0.26 + 0.002 + 0.11 + 0.002;
			w = 0.35;
			h = 0.5;
		};
		
		class skillMaxRank : Life_RscText
		{
			idc = 203;
			text = "Max rank:";
			colorText[] = {1, 1, 1, 0.8};
			sizeEx = 0.03;
			
			x = 0.82 + 0.02;
			y = 0.374 + 0.05;
			w = 0.35;
			h = 0.2;
		};
		
		class skillLevelReq : Life_RscText
		{
			idc = 204;
			text = "Level required:";
			colorText[] = {1, 1, 1, 0.8};
			sizeEx = 0.03;
			
			x = 0.82 + 0.02;
			y = 0.374 + 0.05 + 0.03;
			w = 0.35;
			h = 0.2;
		};
		
		class skillCurrentText : Life_RscText
		{
			idc = 207;
			text = "Current skill rank:";
			colorText[] = {1, 1, 1, 0.8};
			sizeEx = 0.03;
			
			x = 0.82 + 0.02;
			y = 0.374 + 0.05 + 0.03 + 0.03;
			w = 0.35;
			h = 0.2;
		};
		
		class skillCurrent : Life_RscText
		{
			idc = 205;
			text = "";
			colorText[] = {1, 1, 1, 0.8};
			sizeEx = 0.07;
			
			x = 0.82 + 0.02 + 0.05;
			y = 0.55;
			w = 0.35;
			h = 0.2;
		};
		
		class skillUpButton : Life_RscButtonMenu
		{
			idc = 206;
			text = "Increase";
			
			onButtonClick = "systemChat ""LOL""";
			colorBackground[] = {0,1,0,0.5};
			x = 0.99;
			y = 0.633;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		// End panel
		
		class skillPointsText : Life_RscText
		{
			idc = -1;
			text = "Your rank and skill points:";
			colorText[] = {1, 1, 1, 0.8};
			sizeEx = 0.04;
			
			x = 0.82 + 0.03;
			y = 0.66;
			w = 0.35;
			h = 0.2;
		};
		
		class skillPoints : Life_RscText
		{
			idc = 300;
			text = "12";
			colorText[] = {1, 1, 1, 0.8};
			sizeEx = 0.18;
			
			x = 1.05;
			y = 0.8;
			w = 0.2;
			h = 0.2;
		};
		
		class CurrentRankIcon : Life_RscPictureKeepAspect
		{
			idc = 7;
			text = "";
			x = 0.85;
			y = 0.8;
			w = 0.2;
			h = 0.2;
		};
		
		// Level markers
		
		
		class levelFiveMarker : Life_RscText
		{
			idc = -1;
			text = "Level 5";
			sizeEx = 0.03;
			
			x = 0.77;
			y = 0.418;
			w = 0.6;
			h = 0.04;
			colorText[] = {1, 1, 1, 0.5};
		};
		
		class levelFiveLine : Life_RscText
		{
			idc = -1;
			x = 0.01;
			y = 0.44;
			w = 0.825;
			h = 0.005;
			colorBackground[] = {1, 1, 1, 0.1};
		};
		
		class levelTenMarker : Life_RscText
		{
			idc = -1;
			text = "Level 10";
			sizeEx = 0.03;
			
			x = 0.765;
			y = 0.618;
			w = 0.6;
			h = 0.04;
			colorText[] = {1, 1, 1, 0.5};
		};
		
		class levelTenLine : Life_RscText
		{
			idc = -1;
			x = 0.01;
			y = 0.64;
			w = 0.825;
			h = 0.005;
			colorBackground[] = {1, 1, 1, 0.1};
		};
		
		class levelFifteenMarker : Life_RscText
		{
			idc = -1;
			text = "Level 15";
			sizeEx = 0.03;
			
			x = 0.765;
			y = 0.818;
			w = 0.6;
			h = 0.04;
			colorText[] = {1, 1, 1, 0.5};
		};
		
		class levelFifteenLine : Life_RscText
		{
			idc = -1;
			x = 0.01;
			y = 0.84;
			w = 0.825;
			h = 0.005;
			colorBackground[] = {1, 1, 1, 0.1};
		};
		
		//
		
	
		class ButtonClose : life_RscButtonMenu {
			idc = -1;
			text = "$STR_Global_Close";
			onButtonClick = "closeDialog 0;";
			x = 0;
			y = 1.05;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		// Respec button
		class ButtonRespec : life_RscButtonMenu {
			idc = -1;
			text = "Respec";
			onButtonClick = "closeDialog 0;";
			x = 0 + (6.25 / 40) + 0.007;
			y = 1.05;
			w = (6.25 / 40);
			h = (1 / 25);
		};
		
		
	};
};