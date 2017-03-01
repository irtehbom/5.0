class GP_Welcome
{
	idd = 19000;
	onLoad = "[] spawn life_fnc_welcomeText;";

	class ControlsBackground
	{

		class Vignette: Life_RscVignette
		{
			idc = 114998;
		};

		class Tiles: Life_RscTiles {};
		
	};

	class Controls 
	{

		class Title: Life_RscTitle
		{
			idc = -1;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 *	 				( ( ( safezoneW / safezoneH ) min 1.2) / 40 )";
			h = "1 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "WELCOME";
		};

		class Background: Life_RscTitle
		{
			idc = -1;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 * 					( ( ( safezoneW / safezoneH ) min 1.2) / 40 )";
			h = "20.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			colorBackground[] = { 0, 0, 0, 0.7 };
		};

		class GroupMessage: Life_RscControlsGroupNoHScrollbars
		{
			idc = -1;
			x = "1 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "2.1 * 					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "38 * 					( ( ( safezoneW / safezoneH ) min 1.2) / 40 )";
			h = "20.8 * 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			class Controls
			{

				class TextMessage: Life_RscStructuredText
				{
					idc = 19001;
					x = "0.5 * 					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					y = "0 * 					( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
					w = "37 *	 				( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 )";
					h = "20.8 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";
				};

			};

		};

		class ButtonContinue: Life_RscButtonMenuOK
		{
			x = "33 *					( ( ( safezoneW / safezoneH ) min 1.2 ) / 40 ) + ( safezoneX + ( safezoneW - ( ( safezoneW / safezoneH ) min 1.2 ) ) / 2 )";
			y = "23 *					( (	( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 ) + ( safezoneY + ( safezoneH - ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) ) / 2 )";
			w = "6 * 					( ( ( safezoneW / safezoneH ) min 1.2) / 40 )";
			h = "1 *	 				( ( ( ( safezoneW / safezoneH ) min 1.2 ) / 1.2 ) / 25 )";

			text = "Continue";
		};

	};

};