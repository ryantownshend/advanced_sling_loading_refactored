class CfgPatches
{
	class AdvancedSlingLoadingRefactored
	{
		name="Advanced Sling Loading Refactored";
		author = "[SA] Duda (original), {9GU}Unclebob (keybindings), dent (updates)";
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

class CfgNetworkMessages
{
	class AdvancedSlingLoadingRemoteExecClient
	{
		module="AdvancedSlingLoading";
		parameters[]=
		{
			"ARRAY",
			"STRING",
			"OBJECT",
			"BOOL"
		};
	};
	class AdvancedSlingLoadingRemoteExecServer
	{
		module="AdvancedSlingLoading";
		parameters[]=
		{
			"ARRAY",
			"STRING",
			"BOOL"
		};
	};
};

class CfgFunctions 
{
	class aslr
	{
		class functions
		{
			file = "AdvancedSlingLoadingRefactored\functions";
			class advancedSlingLoadingRefactoredInit {postInit=1;};
			class keybinding {postInit=1;};
		};
	};
};