#define true 1
#define false 0

class DefaultEventHandler;

class CfgPatches
{
    class AI_Headless_Client
    {
        units[] = {};
        weapons[] = {};
        requiredAddons[] = {"A3_Data_F"};
        fileName = "dummy_hc.pbo";
        author[] = {"Rob"};
    };
};

class CfgFunctions
{
    class AI_Headless_Client
    {
        tag = "dummy_hc";
        class Functions
        {
            file = "\dummy_hc\Functions";
        };

    };

};
