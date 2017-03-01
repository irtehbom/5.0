waitUntil {!isNull player && player == player};
if(player diarySubjectExists "rules")exitwith{};


player createDiarySubject ["serverrules","General Rules"];
player createDiarySubject ["website","Our Website"];
player createDiarySubject ["teamspeak","Teamspeak"];
player createDiarySubject ["illegalitems","Illegal Activity"];


player createDiarySubject ["controls","Controls"];


	player createDiaryRecord ["serverrules",
		[
			"Server Rules", 
				"
			    For the list of server rules please visit<br/><br/> http://www.gamepointeu.co.uk/index.php?/topic/12-server-rules/
				"
		]
	];
	
	player createDiaryRecord ["website",
		[
			"Website", 
				"
			    http://www.gamepointeu.co.uk/
				"
		]
	];
	
	player createDiaryRecord ["teamspeak",
		[
			"Teamspeak", 
				"
			    Join on ts.gamepointeu.co.uk
				"
		]
	];
	
	
// Illegal Items Section
	player createDiaryRecord ["illegalitems",
		[
			"Rebel Rules",
				"
				A rebel is one who rises in armed resistance against a government. In this case it would be the police. However, due to the small amount of police compared to the possible amount of rebels, do not attack the police without a reason, please be civil and use common sense, and don't take the word rebel literally, but instead how it will make this server fun for all.<br/><br/>
				1. A rebel must first form a gang, and then declare intentions.<br/>
				2. Resistance does not excuse RDMing (See RDMing in General Rules)<br/>
				3. Resistance roleplay should be conducted in more ways than constantly robbing the bank or shooting police officers.<br/>
				4. Resistance must be coordinated.<br/>
				5. A PROPER reason must be behind each and every attack.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Gang Rules",
				"
				1. Being in a gang is not illegal. Only when illegal crimes are committed.<br/>
				2. Being in a gang area is not illegal. Only when partaking in illegal activities.<br/>
				3. Gangs may hold and control gang areas. Other gangs may attack a controlling gang to compete for control of a gang area.<br/>
				4. To declare war on another gang, the leader must announce it in global and all gang members of both gangs must be notified. For a more long term gang war, a declaration should be made on the forums.<br/>
				5. Gangs may not kill unarmed civilians, unless said civilian is part of a rival gang and in your gangs controlled area.<br/>
				6. Gangs may not kill civilians, unless they are under threat. Killing unarmed civilians because they do not comply is considered RDM, but you can injure/damage.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Vehicles",
				"
				A civilian in control of the following prohibited vehicles is subject to the consequences defined in the unauthorized control of a prohibited vehicle law.<br/><br/>

				1. Ifrits<br/>
				2. Speedboats<br/>
				3. Hunters<br/>
				4. Police Vehicles<br/>
				5. Striders<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Weapons",
				"
				A civilian in possession of the following is subject to the consequences as defined in the illegal possession of a firearm law.<br/><br/>

				1. MX Series<br/>
				2. Katiba Series<br/>
				3. TRG Series<br/>
				4. Mk.20 Series<br/>
				5. Mk.18 ABR<br/>
				6. SDAR Rifle<br/>
				7. Sting SMG<br/>
				8. Silenced P07 (Taser)<br/>
				9. All Explosives and Launchers<br/>
				Rebel Shop firearms are generally classed as illegal.<br/><br/>
				"
		]
	];
	player createDiaryRecord ["illegalitems",
		[
			"Illegal Items",
				"
				The following items are illegal to posses:<br/><br/>
				1. Turtle<br/>
				2. Cocaine<br/>
				3. Heroin<br/>
				4. Cannabis<br/>
				5. Marijuana<br/>
				6. Opium<br/>
				7. Firearm Parts<br/>
				8. Gold Bars<br/>
				9. Bonds<br/><br/>
				"
		]
	];

	
// Controls Section

	player createDiaryRecord ["controls",
		[
			"",
				"
				Shift + V: Surrender<br/>
				X: Gather key with pickaxe<br/>
				Y: Open Player Menu<br/>
				U: Lock and unlock cars<br/>
				F: Cop Siren (if cop)<br/>
				T: Vehicle Trunk<br/>
				Left Shift + R: Restrain (Cop Only)<br/>
				Left Shift + G: Knock out / stun (Civ Only, used for robbing them)<br/>
				Left Windows: Main Interaction key which is used for picking up items/money, gathering, interacting with cars (repair,etc) and for cops to interact with civilians. Can be rebound to a single key like H by pressing ESC->Configure->Controls->Custom->Use Action 10<br/>
				Left Shift + L: Activates cop siren lights (as a cop).<br/>
				Left Shift + H: Holster's your pistol<br/>
				"
		]
	];