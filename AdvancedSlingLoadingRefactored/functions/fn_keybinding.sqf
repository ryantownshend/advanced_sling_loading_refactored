/*
	Key Binding for @Advanced Sling Loading MOD by Duda
	Mod Link: https://steamcommunity.com/sharedfiles/filedetails/?id=615007497
	
	Created by {9GU}EditingTeam
	Website: https://www.9thgenericunit.com/
*/

#include "\a3\editor_f\Data\Scripts\dikCodes.h"

/*

	Author: Belbo

	Shows a timed hint for a set duration.
	 
	Arguments:
	1: Text of the hint to show - <STRING>
	2: Duration for the hint to be shown (optional) - <NUMBER>
	3: Should the hint be silent? (optional) - <BOOLEAN>

	Return Value:
	nil

	Example:
	["this is visible for 6 seconds", 6] call adv_fnc_timedHint;

	Public: No
	
 
 */

adv_fnc_timedHint = { 
	_this spawn {
	params [["_hint", "", [""]],["_duration",5, [0]],["_isSilent",false,[true]]];
	
	if (_isSilent) then {
		hintSilent format ["%1",_hint];
	} else {
		hint format ["%1",_hint];
	};
	sleep _duration;
	hintSilent "";
	};
};


//define Default Key Binding

/////////////////////////////////////DEPLOY

[	"Advanced Sling Loading",	//SINGLE ROPE
	"KB_SingleDeploy", 
	"Deploy Single Rope",
	{[(vehicle player) ,player, 1] call ASL_Deploy_Ropes}, {["Single Rope Deployed", 5] call adv_fnc_timedHint}, [DIK_DOWNARROW, [false, false, false]]] call CBA_fnc_addKeybind;
	
[	"Advanced Sling Loading",	//DOUBLE ROPES
	"KB_DoubleDeploy", 
	"Deploy Double Rope", 
	{[(vehicle player) ,player, 2] call ASL_Deploy_Ropes}, {["Double Ropes Deployed", 5] call adv_fnc_timedHint}, [DIK_DOWNARROW, [true, false, false]]] call CBA_fnc_addKeybind;
	
[	"Advanced Sling Loading",	//TRIPLE ROPES
	"KB_TripleDeploy", 
	"Deploy Triple Rope", 
	{[(vehicle player) ,player, 3] call ASL_Deploy_Ropes}, {["Triple Ropes Deployed", 5] call adv_fnc_timedHint}, [DIK_DOWNARROW, [false, true, false]]] call CBA_fnc_addKeybind;
	
/////////////////////////////////////RETRACT (ALL)

[	"Advanced Sling Loading",
	"KB_retract",
	"Retract Rope (ALL)", 
	{
		[(vehicle player), player, 0] call ASL_Retract_Ropes;
		[(vehicle player), player, 1] call ASL_Retract_Ropes;
		[(vehicle player), player, 2] call ASL_Retract_Ropes;
	}, {["All ropes retracted", 5] call adv_fnc_timedHint}, [DIK_UPARROW, [false, false, false]]] call CBA_fnc_addKeybind;
		
////////////////////////////////////EXTEND (ALL)

[	"Advanced Sling Loading",
	"KB_extend", 
	"Extend Rope (ALL)",
	{
		[(vehicle player), player, 0] call ASL_Extend_Ropes;
		[(vehicle player), player, 1] call ASL_Extend_Ropes;
		[(vehicle player), player, 2] call ASL_Extend_Ropes;
	}, {["All ropes extended", 5] call adv_fnc_timedHint}, [DIK_RIGHTARROW, [false, false, false]]] call CBA_fnc_addKeybind;
		
///////////////////////////////////SHORTEN (ALL)

[	"Advanced Sling Loading",
	"KB_Shorten", 
	"Shorten Rope (ALL)",
	{
		[(vehicle player), player, 0] call ASL_Shorten_Ropes;
		[(vehicle player), player, 1] call ASL_Shorten_Ropes;
		[(vehicle player), player, 2] call ASL_Shorten_Ropes;
	}, {["All ropes shortened", 5] call adv_fnc_timedHint}, [DIK_LEFTARROW, [false, false, false]]] call CBA_fnc_addKeybind;

/////////////////////////////////////RELEASE CARGO

[	"Advanced Sling Loading",
	"KB_Release", 
	"Release Cargo (ALL)",
	{
		[(vehicle player), player, 0] call ASL_Release_Cargo;
		[(vehicle player), player, 1] call ASL_Release_Cargo;
		[(vehicle player), player, 2] call ASL_Release_Cargo;
	}, {["Cargo released", 5] call adv_fnc_timedHint}, [DIK_LEFTARROW, [true, true, false]]] call CBA_fnc_addKeybind;
