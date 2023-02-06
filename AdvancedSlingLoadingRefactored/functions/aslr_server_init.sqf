
if(isServer) then {
	
	// Adds support for exile network calls (Only used when running exile) //
	
	ASL_SUPPORTED_REMOTEEXECSERVER_FUNCTIONS = ["ASL_Hide_Object_Global"];

	ExileServer_AdvancedSlingLoading_network_AdvancedSlingLoadingRemoteExecServer = {
		params ["_sessionId", "_messageParameters",["_isCall",false]];
		_messageParameters params ["_params","_functionName"];
		if(_functionName in ASL_SUPPORTED_REMOTEEXECSERVER_FUNCTIONS) then {
			if(_isCall) then {
				_params call (missionNamespace getVariable [_functionName,{}]);
			} else {
				_params spawn (missionNamespace getVariable [_functionName,{}]);
			};
		};
	};
	
	ASL_SUPPORTED_REMOTEEXECCLIENT_FUNCTIONS = ["ASL_Pickup_Ropes","ASL_Deploy_Ropes_Index","ASL_Rope_Set_Mass","ASL_Extend_Ropes","ASL_Shorten_Ropes","ASL_Release_Cargo","ASL_Retract_Ropes","ASL_Deploy_Ropes","ASL_Hint","ASL_Attach_Ropes","ASL_Drop_Ropes"];
	
	ExileServer_AdvancedSlingLoading_network_AdvancedSlingLoadingRemoteExecClient = {
		params ["_sessionId", "_messageParameters"];
		_messageParameters params ["_params","_functionName","_target",["_isCall",false]];
		if(_functionName in ASL_SUPPORTED_REMOTEEXECCLIENT_FUNCTIONS) then {
			if(_isCall) then {
				_params remoteExecCall [_functionName, _target];
			} else {
				_params remoteExec [_functionName, _target];
			};
		};
	};

	diag_log "aslr server loaded";	
};

