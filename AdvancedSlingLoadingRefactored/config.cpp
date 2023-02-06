class CfgPatches
{
	class AdvancedSlingLoadingRefactored
	{
		name="Advanced Sling Loading Refactored";
		author = "[SA] Duda (original), {9GU}Unclebob (keybindings), dent (updates and refactoring)";
		units[] = {};
		weapons[] = {};
		requiredVersion = 0.1;
		requiredAddons[] = 
		{
			"CBA_Extended_EventHandlers",
			"CBA_MAIN"
		};
	};
};



class Extended_PreInit_EventHandlers {
  class AdvancedSlingLoadingRefactored {
    clientInit = "call compile preprocessFileLineNumbers 'AdvancedSlingLoadingRefactored\functions\aslr_client_init.sqf'";
    serverinit = "call compile preprocessFileLineNumbers 'AdvancedSlingLoadingRefactored\functions\aslr_server_init.sqf'";
  };
};