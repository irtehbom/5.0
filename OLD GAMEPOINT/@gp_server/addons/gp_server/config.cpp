class DefaultEventhandlers;
class CfgPatches 
{
	class life_server
	{
		units[] = {"C_man_1"};
		weapons[] = {};
		requiredAddons[] = {"A3_Data_F","A3_Soft_F","A3_Soft_F_Offroad_01","A3_Characters_F"};
		fileName = "gp_server.pbo";
		author[]= {"TAW_Tonic"}; 
	};
};

class CfgFunctions
{
	class BIS_Overwrite
	{
		tag = "BIS";
		class MP
		{
			file = "\gp_server\Functions\MP";
			class initMultiplayer{};
			class call{};
			class spawn{};
			class execFSM{};
			class execVM{};
			class execRemote{};
			class addScore{};
			class setRespawnDelay{};
			class onPlayerConnected{};
			class initPlayable{};
			class missionTimeLeft{};
		};
	};
	
	class MySQL_Database
	{
		tag = "DB";
		class MySQL
		{
			file = "\gp_server\Functions\MySQL";
			class numberSafe {};
			class mresArray {};
			class queryRequest{};
			class asyncCall{};
			class insertRequest{};
			class updateRequest{};
			class mresToArray {};
			class insertVehicle {};
			class bool{};
			class mresString {};
			class updatePartial {};
		};
	};

	class HC
	{
		tag = "HC";
		class Execution
		{
			file = "\gp_server\Functions\HC";
			
			class spawn {};
			class call {};
		};	
	};
	
	class Life_System
	{
		tag = "life";
		class Wanted_Sys
		{
			file = "\gp_server\Functions\WantedSystem";
			class wantedFetch {};
			class wantedPerson {};
			class wantedBounty {};
			class wantedTicket {};
			class wantedPardon {};
			class wantedRemove {};
			class wantedAdd {};
			class wantedPunish {};
		};
		
		class Jail_Sys
		{
			file = "\gp_server\Functions\Jail";
			class jailSys {};
		};
		
		class Court_Sys
		{
			file = "\gp_server\Functions\Court";
			class courtAddPlayer {};
			class courtRemovePlayer {};
		};
		
		class Hitman_Sys
		{
			file = "\gp_server\Functions\HitmanSystem";
			class hitmanHire {};
			class hitlistFetch {};
			class checkTarget {};
		};
		
		class Build
		{
			file = "\gp_server\Functions\Build";
			class buildObject {};
			class buildInit {};
			class buildRemoveRequest {};
			class buildRemovePlotRequest {};
			class buildSaveInventory {};
			class buildGetActionObjects {};
			class buildMaintained {};
		};
		
		class AI
		{
			file = "\gp_server\Functions\AI";
			class respawnManager {};
			class respawnAdd {};
		};
		
		class Intro
		{
			file = "\gp_server\Functions\intro";
			class introRanServer {};
			class getPlotPole {};
		};

		class XP
		{
			file = "\gp_server\Functions\XP";
			class xpCalculateDestroyXPGain {};
			class xpCalculateKillXPGain {};
			class xpHandleXPGain {};
			class xpKilledUnit {};
			class xpGetLevelConfig {};
			class xpLevelConfig {};
			class xpHasSkill {};
			class xpSkillRank {};
			class xpGenericXPGain {};
		};
		
		class Client_Code
		{
			file = "\gp_server\Functions\Client";
		};

		class Gang
		{
			file = "\gp_server\Functions\Gang";
			class getGang {};
			class gangUpdate {};
			class gangLeaveRequest {};
			class gangKickRequest {};
			class gangCreateRequest {};
			class gangInviteRequest {};
			class gangJoin {};
			class gangNewLeaderRequest {};
			class gangDisbandRequest {};
			class gangRankPlayerRequest {};
			
		};
		
		class HATO
		{
			file = "\gp_server\Functions\HATO";
			class eastGetRequests {};
			class eastInit {};
			class eastRequested {};
			class eastCompleted {};
		};

		class Paintball
		{
			file = "\gp_server\Functions\Paintball";
			
			class paintballJoinRequest {};
			class paintballInit {};
			class paintballCreateGame {};
			class paintballKill {};
		};
	};
	
	class TON_System
	{
		tag = "TON";
		class Systems
		{
			file = "\gp_server\Functions\Systems";
			class managesc {};
			class cleanup {};
			class huntingZone {};
			class getID {};
			class vehicleCreate {};
			class vehicleDead {};
			class spawnVehicle {};
			class getVehicles {};
			class vehicleStore {};
			class vehicleStoreTow {};
			class vehicleDelete {};
			class spikeStrip {};
			class logIt {};
			class federalUpdate {};
			class chopShopSell {};
			class clientDisconnect {};
			class cleanupRequest {};
			class setObjVar {};
			class keyManagement {};
			class getPrices {};
            class adjustPrices {};
			class fixVehicleSkins {};
		};
		
		class Housing
		{
			file = "\gp_server\Functions\Housing";
			class addHouse {};
			class fetchPlayerHouses {};
			class initHouses {};
			class sellHouse {};
			class updateHouseContainers {};
			class updateHouseTrunk {};
			class houseCleanup {};
			class payRentHousing {};
		};
		
		class RealEstate
		{
			file = "\gp_server\Functions\RealEstate";
			class insertRealEstate {};
			class fetchRealEstate {};
			class initRealEstate {};
			class saveInventoryRealEstate {};
			class updateYinv {};
			class sellEstate {};
			class payRentRealEstate {};
		};
	};
};

class CfgVehicles
{
	class Car_F;
	class CAManBase;
	class Civilian;
	class Civilian_F : Civilian
	{
		class EventHandlers;
	};
	
	class C_man_1 : Civilian_F
	{
		class EventHandlers: EventHandlers
		{
			init = "(_this select 0) execVM ""\gp_server\fix_headgear.sqf""";
		};
	};
};