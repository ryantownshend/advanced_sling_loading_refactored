# wrd

- <https://github.com/sethduda/AdvancedSlingLoading/pull/29>
- <https://github.com/michaudm/AdvancedSlingLoading_Fork/tree/fix_multiple_cargo>
- <https://community.bistudio.com/wiki/DIK_KeyCodes>

## building

- <https://community.bistudio.com/wiki/Arma_3:_Creating_an_Addon>
- <https://community.bistudio.com/wiki/Arma_3:_Functions_Library>

Built using  Arma 3 Tools - AddonBuilder

Source dir
: advanced_sling_loading_refactored\AdvancedSlingLoadingRefactored

Destination dir
: advanced_sling_loading_refactored\build\@AdvancedSlingLoadingRefactored\addons

DO NOT Binarize

Options

Use my private key.

## publishing to workshop

Using Arma 3 Tools - Publisher

Select "Advanced Sling Loading Refactored" in the "published items" list.

Adding meaningful "Change Notes".

check agree and click update.

## Advanced Sling Loading Refactored, default keybindings

--------------------------------------------------------------------------------
key                     action
----------------------- --------------------------------------------------------
DOWN                    Deploy single rope

Shift + DOWN            Deploy double rope

Ctrl + DOWN             Deploy triple rope

UP                      Retract rope (all)

RIGHT                   Extend rope (all)

LEFT                    Shorten rope (all)

Shift + Ctrl + LEFT     Release cargo (all)

--------------------------------------------------------------------------------

## links

- [Advanced Sling Loading](https://steamcommunity.com/sharedfiles/filedetails/?id=615007497)
- [Key Binding for Advanced Sling Loading](https://steamcommunity.com/sharedfiles/filedetails/?id=2380054988)
- [Advanced Sling Loading Refactored](https://steamcommunity.com/sharedfiles/filedetails/?id=2800112936)

CBA stuff

- <https://www.reddit.com/r/armadev/comments/hzcnb3/tutorial_creating_a_simple_mod_following_the_cba/>
- <https://forums.bohemia.net/forums/topic/168277-cba-community-base-addons-arma-3/>
- <https://github.com/CBATeam/CBA_A3/wiki/Extended-Event-Handlers-(new)>

## multiplayer refactor notes

client and server prefix

One can limit the Extended Event Handlers to just clients or just servers by
placing it in a server*** or client*** entry.

- Events with the client prefix will be executed on every machine, except on
  dedicated servers. (!isDedicated)
- Events with the server prefix will be executed on only the server machine.
  (isServer)

```SQF
clientInit = "diag_log 'You are a client'";
serverInit = "diag_log 'You are a server'";
```

Note about remote execution, this provides a hint about what functions need to
be on the server.

The sling actions appear when looking at a vehicle, but do nothing when I select
them. How do I fix that?

Most likely your server is setup with a white list for remote executions. In
order to fix this, you need to modify your mission's description.ext file,
adding the following CfgRemoteExec rules. If using InfiStar you should edit your
cfgremoteexec.hpp instead of the description.ext file.
See `wiki/Arma_3_Remote_Execution` for more
details on CfgRemoteExec.

- <https://community.bistudio.com/wiki/Arma_3_Remote_Execution>
- <https://community.bistudio.com/wiki/Arma_3:_CfgRemoteExec>

```SQF
/*
Allowed targets:
  0 - can target all machines (default)
  1 - can only target clients, execution on the server is denied
  2 - can only target the server, execution on clients is denied
  Any other value will be treated as 0.
*/

class CfgRemoteExec
{
  class Functions
  {
    class ASL_Pickup_Ropes        { allowedTargets=0; };
    class ASL_Deploy_Ropes_Index  { allowedTargets=0; };
    class ASL_Rope_Set_Mass       { allowedTargets=0; };
    class ASL_Extend_Ropes        { allowedTargets=0; };
    class ASL_Shorten_Ropes       { allowedTargets=0; };
    class ASL_Release_Cargo       { allowedTargets=0; };
    class ASL_Retract_Ropes       { allowedTargets=0; };
    class ASL_Deploy_Ropes        { allowedTargets=0; };
    class ASL_Attach_Ropes        { allowedTargets=0; };
    class ASL_Drop_Ropes          { allowedTargets=0; };
    class ASL_Hint                { allowedTargets=1; };
    class ASL_Hide_Object_Global  { allowedTargets=2; };
  };
};
```

From Arma 3 discord #arma3_scripting channel

```text
Taro — 10/15/2018 6:43 AM

class CfgPatches
    {
    class no_animals
        {
        requiredAddons[] = {"CBA_Extended_EventHandlers"};
        units[] = {};
        weapons[] = {};
        requiredVersion = 0.1;
        version = 1;
        };
    };

class Extended_PostInit_EventHandlers 
    {
    class no_animals 
        {
        clientInit = "call compile preprocessFileLineNumbers '\no_animals\init.sqf'";
        };
    };

better?

Dedmen (ง •̀_•́)ง — 10/15/2018 6:45 AM
Yep. Don't see anything wrong

Dedmen (ง •̀_•́)ง — 10/15/2018 7:06 AM
If it's just one line of code you could also place it directly in the config
```

Another showing a serverInit line

```text
class CfgPatches {
  class FEZOPS {
    units[] = {};
    weapons[] = {};
    requiredVersion = 1.83;
    requiredAddons[] = {
      "ace_medical"
      ,"cba_common"
      ,"ace_common"
      
    };
    author[] = {"Fetzen"};
    authorUrl = "";
    version = "1.0";
    versionStr = "1.0";
    license = "https://www.bohemia.net/community/licenses/arma-public-license-share-alike";
  };
};


class Extended_PreInit_EventHandlers {
  class FEZOPS {
    serverinit = "call compile preprocessFileLineNumbers 'FEZOPS\Fezops_Init.sqf'";
  };
};
```

## list of things to change

word

Essential

- ✓ refactor functions into client and server scripts using the CBA extended
  event handlers. Mod will need to be plugged in to both the server and the
  clients, but this should be cleaner for network activity and eliminate that
  odd caching glitch
- ✓ Apply the multiple ropes fix
- ✓ Add the CBA keybindings to the client context

Nice to have

- Add some debug hint output for weight limits and target weight
- Add some information about the rope length
