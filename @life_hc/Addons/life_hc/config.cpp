#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class life_headless_client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "life_hc.pbo";
        author[] = {"Nanou"};
    };
};

class CfgFunctions
{
    class Headless_Client
    {
        tag = "HC";
        class General
        {
            file = "\life_hc\MySQL\General";
            class asyncCall {};
            class bool {};
            class insertRequest {};
            class insertVehicle {};
            class mresArray {};
            class mresString {};
            class mresToArray {};
            class numberSafe {};
            class queryRequest {};
            class updatePartial {};
            class updateRequest {};
            class cleanup {};
            class huntingZone {};
            class receivekeyofServer {};
        };
		
		class AI
        {
            file = "\life_hc\AI";
            class static_ai {};
			class missions_handler {};
        };
		
		class AIMissions
        {
            file = "\life_hc\AI\AIMissions";
            class CrashedHeli {};
			class drugsHouse {};
			class crashedMilitaryTruck {};
			class assassinationMission {};
        };
		
		class AIFunctions
        {
            file = "\life_hc\AI\Functions";
            class clean_up_ai {};
			class end_mission {};
			class spawn_mission_marker {};
			class spawn_soldiers {};
			class spawn_weapons_crate {};
			class spawn_yinv_crate {};
			class spawn_unit {};
        };
		
		class Kartel
        {
            file = "\life_hc\MySQL\Kartel";
            class updateGangArea {};
			class getGangAreaOwner {};
			class neutraliseArea {};
			class getGangFundsDB {};
        };

        class PlayTime
        {
            file = "\life_hc\MySQL\PlayTime";
            class getPlayTime {};
            class setPlayTime {};
        };

        class Housing
        {
            file = "\life_hc\MySQL\Housing";
            class addContainer {};
            class addHouse {};
            class deleteDBContainer {};
            class fetchPlayerHouses {};
            class houseCleanup {};
            class sellHouse {};
            class sellHouseContainer {};
            class updateHouseContainers {};
            class updateHouseTrunk {};
            class houseGarage {};
        };
		
		class RealEstate
		{
			file = "\life_hc\MySQL\RealEstate";
			class insertRealEstate {};
			class fetchRealEstate {};
			class initRealEstate {};
			class saveInventoryRealEstate {};
			class updateYinv {};
			class sellEstate {};
			class payRentRealEstate {};
		};
		
		class VehicleTuning
		{
			file = "\life_hc\MySQL\VehicleTuning";
			class saveVehicleTuningData {};
			class getVehicleTuningData {};
		};

        class Gangs
        {
            file = "\life_hc\MySQL\Gangs";
            class insertGang {};
            class queryPlayerGang {};
            class removeGang {};
            class updateGang {};
			class gangFunds {};
        };

        class Vehicles
        {
            file = "\life_hc\MySQL\Vehicles";
            class chopShopSell {};
            class getVehicles {};
            class spawnVehicle {};
            class keyManagement {};
            class vehicleStore {};
            class vehicleCreate {};
            class vehicleDelete {};
            class vehicleUpdate {};
        };

        class Wanted_Sys
        {
            file = "\life_hc\MySQL\WantedSystem";
            class wantedFetch {};
            class wantedPerson {};
            class wantedBounty {};
            class wantedRemove {};
            class wantedAdd {};
            class wantedCrimes {};
            class wantedProfUpdate {};
        };

        class Jail
        {
            file = "\life_hc\MySQL\Jail";
            class jailSys;
        };

        class Items
        {
            file = "\life_hc\MySQL\Items";
            class spikeStrip {};
        };

    };

};
