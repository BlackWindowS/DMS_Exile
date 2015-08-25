private ["_crate","_pos","_missname","_aiAmmount","_misText","_missEnd","_group"];
 
/*
_playerClose = false;
_mainTimer = true;
//_missStartTime = floor(time);
*/

// associate pos with find safe pos
_pos = call DMS_findSafePos; 
 

_missname = "Main Mission 6";
diag_log format["DMS :: Main Mission 6 started at [%1]",_pos];

_misText = "<t size='1.75' align='center' color='#27612F'>Main Mission 10.
</t>
<br/>
<t align='center' color='#FF0000'>------------------------------</t>
<br/>
<t size='1.25' color='#FFFFFF'> Mission now starting! Check your map!</t>";

GlobalHint = [0,_misText];
publicVariable "GlobalHint";

// Spawn Marker
[_pos,_missname] execVM "scripts\DMS_CreateMarker.sqf";

// Spawn Box
_crate = createVehicle ["Box_NATO_AmmoOrd_F",[(_pos select 0) - 10, _pos select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] call DMS_Box1;

sleep 2;
//_crate = [_pos,40,4,2,2] execVM "mission\crates\MM_Box1.sqf";

// spawn AI
//[(_pos),(5),(4)] call DMS_SpawnAI;
[(_pos),(5),(4)] call DMS_SpawnAI;



waitUntil{{isPlayer _x && _x distance _pos < 30  } count playableUnits > 0}; 


_missEnd = "<t size='1.75' align='center' color='#27612F'>Main Mission 1.
</t>
<br/>
<t align='center' color='#FF0000'>------------------------------</t>
<br/>
<t size='1.25' color='#FFFFFF'> Mission has ended, good job!</t>";

GlobalHint = [0,_missEnd];
publicVariable "GlobalHint";

//  Run Cleanup
["Ended","Clean"] call DMS_CleanUp;

 

 

sleep 150;

CALL DMS_selectMission.sqf;
