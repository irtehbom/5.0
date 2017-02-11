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
        fileName = "ai_hc.pbo";
        author[] = {"Rob"};
    };
};

class CfgFunctions
{
    class AI_Headless_Client
    {
        tag = "AI_HC";
        class Functions
        {
            file = "\ai_hc\Functions";
            class spawn_ai {};
        };

    };

};
