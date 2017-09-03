local _i, _f, _v, _r, _ri, _rf, _s, _rv, _in, _ii, _fi =
	Citizen.PointerValueInt(), Citizen.PointerValueFloat(), Citizen.PointerValueVector(),
	Citizen.ReturnResultAnyway(), Citizen.ResultAsInteger(), Citizen.ResultAsFloat(), Citizen.ResultAsString(), Citizen.ResultAsVector(),
	Citizen.InvokeNative, Citizen.PointerValueIntInitialized, Citizen.PointerValueFloatInitialized

local g = _G
local rs = rawset
local _tostring = tostring
local function _ts(num)
	if num == 0 or not num then -- workaround for users calling string parameters with '0', also nil being translated
		return nil
	end
	return _tostring(num)
end
local function _ch(hash)
	if g.type(hash) == 'string' then
		return g.GetHashKey(hash)
	end

	return hash
end

local function _mfr(fn)
	return g.Citizen.GetFunctionReference(fn)
end

local Global = setmetatable({}, { __newindex = function(_, n, v)
	g[n] = v

	rs(_, n, v)
end})

_ENV = nil

--- Aborts the current message in the text chat.
function Global.AbortTextChat()
	return _in(0x1AC8F4AD40E22127)
end

function Global.Absf(value)
	return _in(0x73D57CFFDD12C355, value, _r, _rf)
end

function Global.Absi(value)
	return _in(0xF0D31AD191A74F87, value, _r, _ri)
end

function Global.Acos(p0)
	return _in(0x1D08B970013C34B6, p0, _r, _rf)
end

function Global.ActivateDamageTrackerOnNetworkId(netID, p1)
	return _in(0xD45B1FFCCD52FF19, netID, p1)
end

--- Does stuff like this:
-- gyazo.com/7fcb78ea3520e3dbc5b2c0c0f3712617
-- Example:
-- int GetHash = GET_HASH_KEY("fe_menu_version_corona_lobby");
-- ACTIVATE_FRONTEND_MENU(GetHash, 0, -1);
-- BOOL p1 is a toggle to define the game in pause.
-- int p2 is unknown but -1 always works, not sure why though.
-- [30/03/2017] ins1de :
-- the int p2 is actually a component variable. When the pause menu is visible, it opens the tab related to it.
-- Example : Function.Call(Hash.ACTIVATE_FRONTEND_MENU,-1171018317, 0, 42);
-- Result : Opens the "Online" tab without pausing the menu, with -1 it opens the map.
function Global.ActivateFrontendMenu(menuhash, Toggle_Pause, component)
	return _in(0xEF01D36B9C9D0C7B, _ch(menuhash), Toggle_Pause, component)
end

--- seems to be frequently used with the NETWORK::NET_TO_x natives, particularly with vehicles. It is often the only ROPE:: native in a script.
function Global.ActivatePhysics(entity)
	return _in(0x710311ADF0E20730, entity)
end

--- Show Rockstar Editor Menu
-- by I'm Not MentaL
-- ----------
-- "new_editor" menu
function Global.ActivateRockstarEditor()
	return _in(0x49DA8145672B2725)
end
Global.N_0x49da8145672b2725 = Global.ActivateRockstarEditor

function Global.AddAmmoToPed(ped, weaponHash, ammo)
	return _in(0x78F0424C34306220, ped, _ch(weaponHash), ammo)
end

--- Same as SET_PED_ARMOUR, but ADDS 'amount' to the armor the Ped already has.
function Global.AddArmourToPed(ped, amount)
	return _in(0x5BA652A0CD14DF2F, ped, amount)
end

--- Creates an orange ( default ) Blip-object. Returns a Blip-object which can then be modified.
function Global.AddBlipForCoord(x, y, z)
	return _in(0x5A039BB0BCA604B6, x, y, z, _r, _ri)
end

--- Returns red ( default ) blip attached to entity.
-- Example:
-- Blip blip; //Put this outside your case or option
-- blip = UI::ADD_BLIP_FOR_ENTITY(YourPedOrBodyguardName);
-- UI::SET_BLIP_AS_FRIENDLY(blip, true);
function Global.AddBlipForEntity(entity)
	return _in(0x5CDE92C702A8FCE7, entity, _r, _ri)
end

function Global.AddBlipForPickup(pickup)
	return _in(0xBE339365C863BD36, pickup, _r, _ri)
end

function Global.AddBlipForRadius(posX, posY, posZ, radius)
	return _in(0x46818D79B1F7499A, posX, posY, posZ, radius, _r, _ri)
end

--- I filled p1-p6 (the floats) as they are as other natives with 6 floats in a row are similar and I see no other method. So if a test from anyone proves them wrong please correct.
-- p7 (length) determines the length of the spline, affects camera path and duration of transition between previous node and this one
-- p8 big values ~100 will slow down the camera movement before reaching this node
-- p9 != 0 seems to override the rotation/pitch (bool?)
function Global.AddCamSplineNode(camera, x, y, z, xRot, yRot, zRot, length, p8, p9)
	return _in(0x8609C75EC438FB3B, camera, x, y, z, xRot, yRot, zRot, length, p8, p9)
end

--- Now has 15 parameters, previous declaration:
-- BOOL _0x428BDCB9DA58DA53(Any p0, Any p1, Any p2, float p3, float p4, float p5, float p6, float p7, float p8, float p9, float p10, float p11, float p12, Any p13)
-- boneIndex is always chassis_dummy in the scripts. The x/y/z params are location relative to the chassis bone. They are usually rotations and measurements. Haven't reversed which are what yet.
-- Scale is how big the decal will be.
-- p13 is always 0.
-- For alpha, 200 seems to match what the game is doing, I think. I don't have access to the new scripts to see what this parameter is, but based on guessing this seems (kind of) accurate.
function Global.AddClanDecalToVehicle(vehicle, ped, boneIndex, x1, x2, x3, y1, y2, y3, z1, z2, z3, scale, p13, alpha)
	return _in(0x428BDCB9DA58DA53, vehicle, ped, boneIndex, x1, x2, x3, y1, y2, y3, z1, z2, z3, scale, p13, alpha, _r)
end

function Global.AddCoverBlockingArea(playerX, playerY, playerZ, radiusX, radiusY, radiusZ, p6, p7, p8, p9)
	return _in(0x45C597097DD7CB81, playerX, playerY, playerZ, radiusX, radiusY, radiusZ, p6, p7, p8, p9)
end

function Global.AddCoverPoint(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0xD5C12A75C7B9497F, p0, p1, p2, p3, p4, p5, p6, p7, _r, _ri)
end

--- decal types:
-- public enum DecalTypes
-- {
-- splatters_blood = 1010,
-- splatters_blood_dir = 1015,
-- splatters_blood_mist = 1017,
-- splatters_mud = 1020,
-- splatters_paint = 1030,
-- splatters_water = 1040,
-- splatters_water_hydrant = 1050,
-- splatters_blood2 = 1110,
-- weapImpact_metal = 4010,
-- weapImpact_concrete = 4020,
-- weapImpact_mattress = 4030,
-- weapImpact_mud = 4032,
-- weapImpact_wood = 4050,
-- weapImpact_sand = 4053,
-- weapImpact_cardboard = 4040,
-- weapImpact_melee_glass = 4100,
-- weapImpact_glass_blood = 4102,
-- weapImpact_glass_blood2 = 4104,
-- weapImpact_shotgun_paper = 4200,
-- weapImpact_shotgun_mattress,
-- weapImpact_shotgun_metal,
-- weapImpact_shotgun_wood,
-- weapImpact_shotgun_dirt,
-- weapImpact_shotgun_tvscreen,
-- weapImpact_shotgun_tvscreen2,
-- weapImpact_shotgun_tvscreen3,
-- weapImpact_melee_concrete = 4310,
-- weapImpact_melee_wood = 4312,
-- weapImpact_melee_metal = 4314,
-- burn1 = 4421,
-- burn2,
-- burn3,
-- burn4,
-- burn5,
-- bang_concrete_bang = 5000,
-- bang_concrete_bang2,
-- bang_bullet_bang,
-- bang_bullet_bang2 = 5004,
-- bang_glass = 5031,
-- bang_glass2,
-- solidPool_water = 9000,
-- solidPool_blood,
-- solidPool_oil,
-- solidPool_petrol,
-- solidPool_mud,
-- porousPool_water,
-- porousPool_blood,
-- porousPool_oil,
-- porousPool_petrol,
-- porousPool_mud,
-- porousPool_water_ped_drip,
-- liquidTrail_water = 9050
-- }
function Global.AddDecal(decalType, posX, posY, posZ, p4, p5, p6, p7, p8, p9, width, height, rCoef, gCoef, bCoef, opacity, timeout, p17, p18, p19)
	return _in(0xB302244A1839BDAD, decalType, posX, posY, posZ, p4, p5, p6, p7, p8, p9, width, height, rCoef, gCoef, bCoef, opacity, timeout, p17, p18, p19, _r, _ri)
end

function Global.AddDoorToSystem(doorHash, modelHash, x, y, z, p5, p6, p7)
	return _in(0x6F8838D03D1DC226, _ch(doorHash), _ch(modelHash), x, y, z, p5, p6, p7)
end

--- Example:
-- GRAPHICS::ADD_ENTITY_ICON(a_0, "MP_Arrow");
-- I tried this and nothing happened...
function Global.AddEntityIcon(entity, icon)
	return _in(0x9CD43EEE12BF4DD0, entity, _ts(icon), _r, _ri)
end

--- BOOL isAudible = If explosion makes a sound.
-- BOOL isInvisible = If the explosion is invisible or not.
-- this native is missing a new argument: noDamage
-- nodamage = false: damage || nodamage = true: no damage
-- enum ExplosionTypes
-- {
-- EXPLOSION_GRENADE,
-- EXPLOSION_GRENADELAUNCHER,
-- EXPLOSION_STICKYBOMB,
-- EXPLOSION_MOLOTOV,
-- EXPLOSION_ROCKET,
-- EXPLOSION_TANKSHELL,
-- EXPLOSION_HI_OCTANE,
-- EXPLOSION_CAR,
-- EXPLOSION_PLANE,
-- EXPLOSION_PETROL_PUMP,
-- EXPLOSION_BIKE,
-- EXPLOSION_DIR_STEAM,
-- EXPLOSION_DIR_FLAME,
-- EXPLOSION_DIR_WATER_HYDRANT,
-- EXPLOSION_DIR_GAS_CANISTER,
-- EXPLOSION_BOAT,
-- EXPLOSION_SHIP_DESTROY,
-- EXPLOSION_TRUCK,
-- EXPLOSION_BULLET,
-- EXPLOSION_SMOKEGRENADELAUNCHER,
-- EXPLOSION_SMOKEGRENADE,
-- EXPLOSION_BZGAS,
-- EXPLOSION_FLARE,
-- EXPLOSION_GAS_CANISTER,
-- EXPLOSION_EXTINGUISHER,
-- EXPLOSION_PROGRAMMABLEAR,
-- EXPLOSION_TRAIN,
-- EXPLOSION_BARREL,
-- EXPLOSION_PROPANE,
-- EXPLOSION_BLIMP,
-- EXPLOSION_DIR_FLAME_EXPLODE,
-- EXPLOSION_TANKER,
-- EXPLOSION_PLANE_ROCKET,
-- EXPLOSION_VEHICLE_BULLET,
-- EXPLOSION_GAS_TANK,
-- EXPLOSION_BIRD_CRAP
-- };
function Global.AddExplosion(x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
	return _in(0xE3AD2BDBAEE269AC, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
end

function Global.AddExplosionWithUserVfx(x, y, z, explosionType, explosionFx, damageScale, isAudible, isInvisible, cameraShake)
	return _in(0x36DD3FE58B5E5212, x, y, z, explosionType, _ch(explosionFx), damageScale, isAudible, isInvisible, cameraShake)
end
Global.AddSpecfxExplosion = Global.AddExplosionWithUserVfx

--- Seems to add/set the current menu context (to show/hide buttons?)
-- Pausemenu.xml:
-- &lt;Contexts&gt;*ALL*, DISPLAY_CORONA_BUTTONS, *NONE*, BET_LOCKED, BET_AVAILABLE, SCROLL_OPTION&lt;/Contexts&gt;
-- Code:
-- if (...) {
-- sub_bbd34(a_0, 0, "FM_BET_HELP");
-- UI::_DD564BDD0472C936(${bet_available}); // This native
-- UI::OBJECT_DECAL_TOGGLE(${bet_locked});
-- } else {
-- sub_bbd34(a_0, 0, "");
-- UI::OBJECT_DECAL_TOGGLE(${bet_available});
-- UI::_DD564BDD0472C936(${bet_locked}); // This native
-- }
-- OBJECT_DECAL_TOGGLE seems to remove a context, It also has a hash collision
-- // Old
-- Scripts do not make this native's purpose clear. However, this native most likely has something to do with decals since in nearly every instance, "OBJECT_DECAL_TOGGLE" is called prior.
function Global.AddFrontendMenuContext(hash)
	return _in(0xDD564BDD0472C936, _ch(hash))
end
Global.N_0xdd564bdd0472c936 = Global.AddFrontendMenuContext

--- Returns the index of the newly created hospital spawn point.
-- p3 might be radius?
function Global.AddHospitalRestart(x, y, z, p3, p4)
	return _in(0x1F464EF988465A81, x, y, z, p3, p4, _r, _ri)
end

--- NOTE: ones that are -1, 0 - 35 are determined by a function where it gets a TextLabel from a global then runs,
-- _GET_TEXT_SUBSTRING and depending on what the result is it goes in check order of 0 - 9 then A - Z then z (lowercase). So it will then return 0 - 35 or -1 if it's 'z'. The func to handle that ^^ is func_67 in dialog_handler.c atleast in TU27 Xbox360 scripts.
-- p0 is -1, 0
-- p1 is a char or string (whatever you wanna call it)
-- p2 is Global 10597 + i * 6. 'i' is a while(i &lt; 70) loop
-- p3 is again -1, 0 - 35
-- p4 is again -1, 0 - 35
-- p5 is either 0 or 1 (bool ?)
-- p6 is either 0 or 1 (The func to determine this is bool)
-- p7 is either 0 or 1 (The func to determine this is bool)
-- p8 is either 0 or 1 (The func to determine this is bool)
-- p9 is 0 - 3 (Determined by func_60 in dialogue_handler.c)
-- p10 is either 0 or 1 (The func to determine this is bool)
-- p11 is either 0 or 1 (The func to determine this is bool)
-- p12 is unknown as in TU27 X360 scripts it only goes to p11.
function Global.AddLineToConversation(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	return _in(0xC5EF963405593646, p0, _ts(p1), _ts(p2), p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
end

function Global.AddNavmeshBlockingObject(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0xFCD5C8E06E502F5A, p0, p1, p2, p3, p4, p5, p6, p7, p8, _r, _ri)
end

function Global.AddNavmeshRequiredRegion(x, y, radius)
	return _in(0x387EAD7EE42F6685, x, y, radius)
end

--- hash collision?
function Global.AddNextMessageToPreviousBriefs(p0)
	return _in(0x60296AF4BA14ABC5, p0)
end

--- enum ExplosionTypes
-- {
-- EXPLOSION_GRENADE,
-- EXPLOSION_GRENADELAUNCHER,
-- EXPLOSION_STICKYBOMB,
-- EXPLOSION_MOLOTOV,
-- EXPLOSION_ROCKET,
-- EXPLOSION_TANKSHELL,
-- EXPLOSION_HI_OCTANE,
-- EXPLOSION_CAR,
-- EXPLOSION_PLANE,
-- EXPLOSION_PETROL_PUMP,
-- EXPLOSION_BIKE,
-- EXPLOSION_DIR_STEAM,
-- EXPLOSION_DIR_FLAME,
-- EXPLOSION_DIR_WATER_HYDRANT,
-- EXPLOSION_DIR_GAS_CANISTER,
-- EXPLOSION_BOAT,
-- EXPLOSION_SHIP_DESTROY,
-- EXPLOSION_TRUCK,
-- EXPLOSION_BULLET,
-- EXPLOSION_SMOKEGRENADELAUNCHER,
-- EXPLOSION_SMOKEGRENADE,
-- EXPLOSION_BZGAS,
-- EXPLOSION_FLARE,
-- EXPLOSION_GAS_CANISTER,
-- EXPLOSION_EXTINGUISHER,
-- EXPLOSION_PROGRAMMABLEAR,
-- EXPLOSION_TRAIN,
-- EXPLOSION_BARREL,
-- EXPLOSION_PROPANE,
-- EXPLOSION_BLIMP,
-- EXPLOSION_DIR_FLAME_EXPLODE,
-- EXPLOSION_TANKER,
-- EXPLOSION_PLANE_ROCKET,
-- EXPLOSION_VEHICLE_BULLET,
-- EXPLOSION_GAS_TANK,
-- EXPLOSION_BIRD_CRAP
-- };
-- BOOL isAudible = If explosion makes a sound.
-- BOOL isInvisible = If the explosion is invisible or not.
function Global.AddOwnedExplosion(ped, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
	return _in(0x172AA1B624FA1013, ped, x, y, z, explosionType, damageScale, isAudible, isInvisible, cameraShake)
end

function Global.AddPatrolRouteLink(p0, p1)
	return _in(0x23083260DEC3A551, p0, p1)
end

--- Example:
-- AI::ADD_PATROL_ROUTE_NODE(2, "WORLD_HUMAN_GUARD_STAND", -193.4915, -2378.864990234375, 10.9719, -193.4915, -2378.864990234375, 10.9719, 3000);
-- p0 is between 0 and 4 in the scripts.
-- p1 is "WORLD_HUMAN_GUARD_STAND" or "StandGuard".
-- p2, p3 and p4 is only one parameter sometimes in the scripts. Most likely a Vector3 hence p2, p3 and p4 are coordinates.
-- Examples:
-- AI::ADD_PATROL_ROUTE_NODE(1, "WORLD_HUMAN_GUARD_STAND", l_739[7/*3*/], 0.0, 0.0, 0.0, 0);
-- AI::ADD_PATROL_ROUTE_NODE(1, "WORLD_HUMAN_GUARD_STAND", l_B0[17/*44*/]._f3, l_B0[17/*44*/]._f3, 2000);
-- p5, p6 and p7 are for example set to: 1599.0406494140625, 2713.392578125, 44.4309.
-- p8 is an int, often random set to for example: GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000).
function Global.AddPatrolRouteNode(p0, p1, x1, y1, z1, x2, y2, z2, p8)
	return _in(0x8EDF950167586B7C, p0, _ts(p1), x1, y1, z1, x2, y2, z2, p8)
end

--- 4 calls in the b617d scripts. The only one with p0 and p2 in clear text:
-- AUDIO::ADD_PED_TO_CONVERSATION(5, l_AF, "DINAPOLI");
-- =================================================
-- One of the 2 calls in dialogue_handler.c p0 is in a while-loop, and so is determined to also possibly be 0 - 15.
-- Based on it asking if does_entity_exist for the global I have determined that p1 is, in fact, the ped, but could be wrong.
function Global.AddPedToConversation(p0, ped, p2)
	return _in(0x95D9F4BC443956E7, p0, ped, _ts(p2))
end

function Global.AddPetrolDecal(x, y, z, groundLvl, width, transparency)
	return _in(0x4F5212C7AD880DF8, x, y, z, groundLvl, width, transparency, _r, _ri)
end

function Global.AddPickupToInteriorRoomByName(pickup, roomName)
	return _in(0x3F6167F351168730, pickup, _ts(roomName))
end

function Global.AddPoliceRestart(p0, p1, p2, p3, p4)
	return _in(0x452736765B31FC4B, p0, p1, p2, p3, p4, _r, _ri)
end

--- Can't select void. This function returns nothing. The hash of the created relationship group is output in the second parameter.
function Global.AddRelationshipGroup(name, groupHash)
	return _in(0xF372BC22FCB88606, _ts(name), _ii(groupHash) --[[ may be optional ]], _r, _ri)
end

--- Creates a rope at the specific position, that extends in the specified direction when not attached to any entities.
-- __
-- Add_Rope(pos.x,pos.y,pos.z,0.0,0.0,0.0,20.0,4,20.0,1.0,0.0,false,false,false,5.0,false,NULL)
-- When attached, Position&lt;vector&gt; does not matter
-- When attached, Angle&lt;vector&gt; does not matter
-- Rope Type:
-- 4 and bellow is a thick rope
-- 5 and up are small metal wires
-- 0 crashes the game
-- Max_length - Rope is forced to this length, generally best to keep this the same as your rope length.
-- Rigid - If max length is zero, and this is set to false the rope will become rigid (it will force a specific distance, what ever length is, between the objects).
-- breakable - Whether or not shooting the rope will break it.
-- unkPtr - unknown ptr, always 0 in orig scripts
-- __
-- Lengths can be calculated like so:
-- float distance = abs(x1 - x2) + abs(y1 - y2) + abs(z1 - z2); // Rope length
-- NOTES:
-- Rope does NOT interact with anything you attach it to, in some cases it make interact with the world AFTER it breaks (seems to occur if you set the type to -1).
-- Rope will sometimes contract and fall to the ground like you'd expect it to, but since it doesn't interact with the world the effect is just jaring.
function Global.AddRope(x, y, z, rotX, rotY, rotZ, length, ropeType, maxLength, minLength, p10, p11, p12, rigid, p14, breakWhenShot, unkPtr)
	return _in(0xE832D760399EB220, x, y, z, rotX, rotY, rotZ, length, ropeType, maxLength, minLength, p10, p11, p12, rigid, p14, breakWhenShot, _ii(unkPtr) --[[ may be optional ]], _r, _ri)
end

function Global.AddScenarioBlockingArea(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x1B5C85C612E5256E, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, _r, _ri)
end

--- BRAIN::ADD_SCRIPT_TO_RANDOM_PED("pb_prostitute", ${s_f_y_hooker_01}, 100, 0);
-- -----
-- Hardcoded to not work in Multiplayer.
function Global.AddScriptToRandomPed(name, model, p2, p3)
	return _in(0x4EE5367468A65CCC, _ts(name), _ch(model), p2, p3)
end

--- duration is float here
-- Event types- camx.me/gtav/tasks/shockingevents.txt
function Global.AddShockingEventAtPosition(type, x, y, z, duration)
	return _in(0xD9F8455409B525E9, type, x, y, z, duration, _r, _ri)
end

--- duration is float here
-- Event types - camx.me/gtav/tasks/shockingevents.txt
function Global.AddShockingEventForEntity(type, entity, duration)
	return _in(0x7FD8F3BE76F89422, type, entity, duration, _r, _ri)
end

function Global.AddStuntJump(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
	return _in(0x1A992DA297A4630C, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, _r, _ri)
end

function Global.AddStuntJumpAngled(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18)
	return _in(0xBBE5D803A5360CBF, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, p17, p18, _r, _ri)
end

--- p1 was always -1.
-- used for phone applications; scaleform
function Global.AddTextComponentAppTitle(p0, p1)
	return _in(0x761B77454205A61D, _ts(p0), p1)
end
Global.N_0x761b77454205a61d = Global.AddTextComponentAppTitle

function Global.AddTextComponentFloat(value, decimalPlaces)
	return _in(0xE7DCB5B874BCD96E, value, decimalPlaces)
end

function Global.AddTextComponentFormattedInteger(value, commaSeparated)
	return _in(0x0E4C749FF9DE9CC4, value, commaSeparated)
end
Global.N_0x0e4c749ff9de9cc4 = Global.AddTextComponentFormattedInteger

function Global.AddTextComponentInteger(value)
	return _in(0x03B504CF259931BC, value)
end

--- This native (along with 0x6C188BE134E074AA and 0x94CF4AC034C9C986) do not actually filter anything. They simply add the provided text (as of 944)
-- did you even check the disassembly?
function Global.AddTextComponentScaleform(p0)
	return _in(0x5F68520888E69014, _ts(p0))
end
Global.AddTextComponentString3 = Global.AddTextComponentScaleform

function Global.AddTextComponentSubstringBlipName(blip)
	return _in(0x80EAD8E2E1D5D52E, blip)
end
Global.N_0x80ead8e2e1d5d52e = Global.AddTextComponentSubstringBlipName

--- ??? Description :
-- Processes a string and removes the player name(max len 99)
-- You can use this function to create notifications/subtitles
-- --------------------------------------------------------------------
-- ??? Usage(Colors) :
-- ~r~ = red
-- ~y~ = yellow
-- ~g~ = green
-- ~b~ = light blue
-- ~w~ = white
-- ~p~ = purple
-- ~n~ = new line
-- --------------------------------------------------------------------
-- ??? Usage(Input) :
-- ~INPUT_CONTEXT~ will show button symbol (regarding last input device -&gt; keyboard/gamepad)
-- example:
-- string info = "Context action is assigned to ~INPUT_CONTEXT~!";
-- --------------------------------------------------------------------
-- ??? Example (C++):
-- void ShowNotification(char *text)
-- {
-- UI::_SET_NOTIFICATION_TEXT_ENTRY("STRING");
-- UI::ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- UI::_DRAW_NOTIFICATION(FALSE, FALSE); // if first param = 1, the message flashes 1 or 2 times
-- }
-- ??? Colors example :
-- string red = "~r~Red test";
-- string white_and_yellow = "~w~White and ~y~yellow";
-- string text_with_double_line = "First line.~n~Second line";
-- This native (along with 0x5F68520888E69014 and 0x94CF4AC034C9C986) do not actually filter anything. They simply add the provided text (as of 944)
-- Used to be known as _ADD_TEXT_COMPONENT_STRING
function Global.AddTextComponentSubstringPlayerName(text)
	return _in(0x6C188BE134E074AA, _ts(text))
end
Global.AddTextComponentString = Global.AddTextComponentSubstringPlayerName

function Global.AddTextComponentSubstringTextLabel(labelName)
	return _in(0xC63CD5D2920ACBE7, _ts(labelName))
end
Global.AddTextComponentItemString = Global.AddTextComponentSubstringTextLabel

--- It adds the localized text of the specified GXT entry name. Eg. if the argument is GET_HASH_KEY("ES_HELP"), adds "Continue". Just uses a text labels hash key
function Global.AddTextComponentSubstringTextLabelHashKey(gxtEntryHash)
	return _in(0x17299B63C7683A2B, _ch(gxtEntryHash))
end
Global.N_0x17299b63c7683a2b = Global.AddTextComponentSubstringTextLabelHashKey

--- Adds a timer (e.g. "00:00:00:000"). The appearance of the timer depends on the flags, which needs more research.
function Global.AddTextComponentSubstringTime(timestamp, flags)
	return _in(0x1115F16B8AB9E8BF, timestamp, flags)
end

--- This native (along with 0x5F68520888E69014 and 0x6C188BE134E074AA) do not actually filter anything. They simply add the provided text (as of 944)
function Global.AddTextComponentSubstringWebsite(website)
	return _in(0x94CF4AC034C9C986, _ts(website))
end
Global.AddTextComponentString2 = Global.AddTextComponentSubstringWebsite

function Global.AddTextEntry(entryKey, entryText)
	return _in(0x32ca01c3, _ts(entryKey), _ts(entryText))
end

function Global.AddTextEntryByHash(entryKey, entryText)
	return _in(0x289da860, _ch(entryKey), _ts(entryText))
end

function Global.AddToClockTime(hours, minutes, seconds)
	return _in(0xD716F30D8C8980E2, hours, minutes, seconds)
end

function Global.AddToItemset(p0, p1)
	return _in(0xE3945201F14637DD, p0, p1, _r)
end

--- Hash collision!
-- _IS_MP_GAMER_TAG_ACTIVE_2
function Global.AddTrevorRandomModifier(gamerTagId)
	return _in(0x595B5178E412E199, gamerTagId, _r)
end

function Global.AddVehicleStuckCheckWithWarp(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x2FA9923062DD396C, p0, p1, p2, p3, p4, p5, p6)
end

--- x, y, z: offset in world coords from some entity.
function Global.AddVehicleSubtaskAttackCoord(ped, x, y, z)
	return _in(0x5CF0D8F9BBA0DD75, ped, x, y, z)
end

function Global.AddVehicleSubtaskAttackPed(ped, ped2)
	return _in(0x85F462BADC7DA47F, ped, ped2)
end

function Global.AddVehicleUpsidedownCheck(vehicle)
	return _in(0xB72E26D81006005B, vehicle)
end

function Global.AdvanceClockTimeTo(hour, minute, second)
	return _in(0xC8CA9670B9D83B3B, hour, minute, second)
end

--- Seems to animate the gameplay camera zoom.
-- Eg. _ANIMATE_GAMEPLAY_CAM_ZOOM(1f, 1000f);
-- will animate the camera zooming in from 1000 meters away.
-- Game scripts use it like this:
-- // Setting this to 1 prevents V key from changing zoom
-- PLAYER::SET_PLAYER_FORCED_ZOOM(PLAYER::PLAYER_ID(), 1);
-- // These restrict how far you can move cam up/down left/right
-- CAM::_CLAMP_GAMEPLAY_CAM_YAW(-20f, 50f);
-- CAM::_CLAMP_GAMEPLAY_CAM_PITCH(-60f, 0f);
-- CAM::_ANIMATE_GAMEPLAY_CAM_ZOOM(1f, 1f);
function Global.AnimateGameplayCamZoom(p0, distance)
	return _in(0xDF2E1F7742402E81, p0, distance)
end

--- Example from michael2 script.
-- CAM::ANIMATED_SHAKE_CAM(l_5069, "shake_cam_all@", "light", "", 1f);
function Global.AnimatedShakeCam(cam, p1, p2, p3, amplitude)
	return _in(0xA2746EEAE3E577CD, cam, _ts(p1), _ts(p2), _ts(p3), amplitude)
end

function Global.AnyPassengersRappeling(vehicle)
	return _in(0x291E373D483E7EE7, vehicle, _r)
end
Global.N_0x291e373d483e7ee7 = Global.AnyPassengersRappeling

function Global.AppClearBlock()
	return _in(0x5FE1DF3342DB7DBA)
end

function Global.AppCloseApp()
	return _in(0xE41C65E07A5F05FC)
end

function Global.AppCloseBlock()
	return _in(0xE8E3FCF72EAC0EF8)
end

function Global.AppDataValid()
	return _in(0x846AA8E7D55EE5B6, _r)
end

function Global.AppDeleteAppData(appName)
	return _in(0x44151AEA95C8A003, _ts(appName), _r)
end

function Global.AppGetDeletedFileStatus()
	return _in(0xC9853A2BE3DED1A6, _r, _ri)
end

function Global.AppGetFloat(property)
	return _in(0x1514FB24C02C2322, _ts(property), _r, _rf)
end

function Global.AppGetInt(property)
	return _in(0xD3A58A12C77D9D4B, _ts(property), _r, _ri)
end

function Global.AppGetString(property)
	return _in(0x749B023950D2311C, _ts(property), _r, _s)
end

function Global.AppHasLinkedSocialClubAccount()
	return _in(0x71EEE69745088DA0, _r)
end

function Global.AppHasSyncedData(appName)
	return _in(0xCA52279A7271517F, _ts(appName), _r)
end

function Global.AppSaveData()
	return _in(0x95C5D356CDA6E85F)
end

--- Called in the gamescripts like:
-- APP::APP_SET_APP("car");
-- APP::APP_SET_APP("dog");
function Global.AppSetApp(appName)
	return _in(0xCFD0406ADAF90D2B, _ts(appName))
end

function Global.AppSetBlock(blockName)
	return _in(0x262AB456A3D21F93, _ts(blockName))
end

function Global.AppSetFloat(property, value)
	return _in(0x25D7687C68E0DAA4, _ts(property), value)
end

function Global.AppSetInt(property, value)
	return _in(0x607E8E3D3E4F9611, _ts(property), value)
end

function Global.AppSetString(property, value)
	return _in(0x3FF2FCEC4B7721B4, _ts(property), _ts(value))
end

function Global.ApplyDamageToPed(ped, damageAmount, p2)
	return _in(0x697157CED63F18D4, ped, damageAmount, p2)
end

--- forceType - 0 to 5 (any number greater then 5 force does nothing)
-- p8 - no effect (a quick disassembly will tell us what it does)
-- isRel - specifies if the force direction is relative to direction entity is facing (true), or static world direction (false).
-- p11/highForce - setting false will make the force really low
-- enum ForceTypes
-- {
-- MIN_FORCE = 0,
-- MAX_FORCE_ROT = 1,
-- MIN_FORCE_2 = 2,
-- MAX_FORCE_ROT_2 = 3, //stable, good for custom handling
-- FORCE_NO_ROT = 4,
-- FORCE_ROT_PLUS_FORCE = 5
-- };
-- gtaforums.com/topic/885669-precisely-define-object-physics/
-- gtaforums.com/topic/887362-apply-forces-and-momentums-to-entityobject/
function Global.ApplyForceToEntity(entity, forceType, x, y, z, xRot, yRot, zRot, p8, isRel, p10, highForce, p12, p13)
	return _in(0xC5F68BE9613E2D18, entity, forceType, x, y, z, xRot, yRot, zRot, p8, isRel, p10, highForce, p12, p13)
end

--- p6/relative - makes the xyz force not relative to world coords, but to something else
-- p7/highForce - setting false will make the force really low
function Global.ApplyForceToEntityCenterOfMass(entity, forceType, x, y, z, p5, isRel, highForce, p8)
	return _in(0x18FF00FC7EFF559E, entity, forceType, x, y, z, p5, isRel, highForce, p8)
end

function Global.ApplyImpulseToCloth(posX, posY, posZ, vecX, vecY, vecZ, impulse)
	return _in(0xE37F721824571784, posX, posY, posZ, vecX, vecY, vecZ, impulse)
end

--- Found one occurence in re_crashrescue.c4
-- PED::APPLY_PED_BLOOD(l_4B, 3, 0.0, 0.0, 0.0, "wound_sheet");
function Global.ApplyPedBlood(ped, boneIndex, xRot, yRot, zRot, woundType)
	return _in(0x83F7E01C7B769A26, ped, boneIndex, xRot, yRot, zRot, _ts(woundType))
end

function Global.ApplyPedBloodByZone(ped, p1, p2, p3, p4)
	return _in(0x3311E47B91EDCBBC, ped, p1, p2, p3, _ii(p4) --[[ may be optional ]])
end
Global.N_0x3311e47b91edcbbc = Global.ApplyPedBloodByZone

function Global.ApplyPedBloodDamageByZone(ped, p1, p2, p3, p4)
	return _in(0x816F6981C60BF53B, ped, p1, p2, p3, p4)
end
Global.N_0x816f6981c60bf53b = Global.ApplyPedBloodDamageByZone

function Global.ApplyPedBloodSpecific(ped, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0xEF0D582CBF2D9B0F, ped, p1, p2, p3, p4, p5, p6, p7, _ii(p8) --[[ may be optional ]])
end
Global.N_0xef0d582cbf2d9b0f = Global.ApplyPedBloodSpecific

--- APPLY_PED_DAMAGE_DECAL(ped, 1, 0.5f, 0.513f, 0f, 1f, unk, 0, 0, "blushing");
function Global.ApplyPedDamageDecal(ped, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x397C38AA7B4A5F83, ped, p1, p2, p3, p4, p5, p6, p7, p8, _ts(p9))
end

--- Damage Packs:
-- "SCR_TrevorTreeBang"
-- "HOSPITAL_0"
-- "HOSPITAL_1"
-- "HOSPITAL_2"
-- "HOSPITAL_3"
-- "HOSPITAL_4"
-- "HOSPITAL_5"
-- "HOSPITAL_6"
-- "HOSPITAL_7"
-- "HOSPITAL_8"
-- "HOSPITAL_9"
-- "SCR_Dumpster"
-- "BigHitByVehicle"
-- "SCR_Finale_Michael_Face"
-- "SCR_Franklin_finb"
-- "SCR_Finale_Michael"
-- "SCR_Franklin_finb2"
-- "Explosion_Med"
-- "SCR_Torture"
-- "SCR_TracySplash"
-- "Skin_Melee_0"
-- Additional damage packs:
-- gist.github.com/alexguirre/f3f47f75ddcf617f416f3c8a55ae2227
function Global.ApplyPedDamagePack(ped, damagePack, damage, mult)
	return _in(0x46DF918788CB093F, ped, _ts(damagePack), damage, mult)
end

function Global.AreAllNavmeshRegionsLoaded()
	return _in(0x8415D95B194A3AEA, _r)
end

--- Appears to return false if any window is broken.
function Global.AreAllVehicleWindowsIntact(vehicle)
	return _in(0x11D862A3E977A9EF, vehicle, _r)
end
Global.AreAllVehicleWindowsIntact = Global.AreAllVehicleWindowsIntact

--- Returns false if every seat is occupied.
function Global.AreAnyVehicleSeatsFree(vehicle)
	return _in(0x2D34FC3BC4ADB780, vehicle, _r)
end
Global.IsAnyVehicleSeatEmpty = Global.AreAnyVehicleSeatsFree

--- Returns true if the coords are colliding with the outdoors, and false if they collide with an interior.
function Global.AreCoordsCollidingWithExterior(x, y, z)
	return _in(0xEEA5AC2EDA7C33E8, x, y, z, _r)
end
Global.N_0xeea5ac2eda7c33e8 = Global.AreCoordsCollidingWithExterior

function Global.ArePlayerFlashingStarsAboutToDrop(player)
	return _in(0xAFAF86043E5874E9, player, _r)
end

function Global.ArePlayerStarsGreyedOut(player)
	return _in(0x0A6EB355EE14A2DB, player, _r)
end

--- Found this in the decompiled scripts, I'd do more research before changing the name --
-- if (!ENTITY::IS_ENTITY_DEAD(l_1911)) {
-- if (!VEHICLE::_755D6D5267CBBD7E(l_1911)) {
-- sub_1ba80("TRAFFICKING AIR: FAILING - PROPELLERS ARE DAMAGED");
-- l_12CE = 9;
-- }
-- }
function Global.ArePropellersUndamaged(vehicle)
	return _in(0x755D6D5267CBBD7E, vehicle, _r)
end
Global.N_0x755d6d5267cbbd7e = Global.ArePropellersUndamaged

--- is this like strcmp??
function Global.AreStringsEqual(string1, string2)
	return _in(0x0C515FAB3FF9EA92, _ts(string1), _ts(string2), _r)
end

--- ADD_A_MARKER_OVER_VEHICLE was a hash collision!!!
-- Can be used for planes only!
function Global.AreVehicleWingsIntact(vehicle)
	return _in(0x5991A01434CE9677, vehicle, _r)
end
Global.N_0x5991a01434ce9677 = Global.AreVehicleWingsIntact
Global.AddAMarkerOverVehicle = Global.AreVehicleWingsIntact

function Global.ArrayValueAddBoolean(value)
	return _in(0xF8B0F5A43E928C76, _i, value)
end

function Global.ArrayValueAddFloat(value)
	return _in(0x57A995FD75D37F56, _i, value)
end

function Global.ArrayValueAddInteger(value)
	return _in(0xCABDB751D86FE93B, _i, value)
end

function Global.ArrayValueAddObject(arrayData)
	return _in(0x6889498B3E19C797, _ii(arrayData) --[[ may be optional ]], _r, _ri)
end

function Global.ArrayValueAddString(value)
	return _in(0x2F0661C155AEEEAA, _i, _ts(value))
end

function Global.ArrayValueAddVector3(valueX, valueY, valueZ)
	return _in(0x407F8D034F70F0C2, _i, valueX, valueY, valueZ)
end

function Global.ArrayValueGetBoolean(arrayIndex)
	return _in(0x50C1B2874E50C114, _i, arrayIndex, _r)
end

function Global.ArrayValueGetFloat(arrayIndex)
	return _in(0xC0C527B525D7CFB5, _i, arrayIndex, _r, _rf)
end

function Global.ArrayValueGetInteger(arrayIndex)
	return _in(0x3E5AE19425CD74BE, _i, arrayIndex, _r, _ri)
end

function Global.ArrayValueGetObject(arrayIndex)
	return _in(0x8B5FADCC4E3A145F, _i, arrayIndex, _r, _ri)
end

function Global.ArrayValueGetSize(arrayData)
	return _in(0x065DB281590CEA2D, _ii(arrayData) --[[ may be optional ]], _r, _ri)
end

function Global.ArrayValueGetString(arrayIndex)
	return _in(0xD3F2FFEB8D836F52, _i, arrayIndex, _r, _s)
end

--- Types:
-- 1 = Boolean
-- 2 = Integer
-- 3 = Float
-- 4 = String
-- 5 = Vector3
-- 6 = Object
-- 7 = Array
function Global.ArrayValueGetType(arrayIndex)
	return _in(0x3A0014ADB172A3C5, _i, arrayIndex, _r, _ri)
end

function Global.ArrayValueGetVector3(arrayIndex)
	return _in(0x8D2064E5B64A628A, _i, arrayIndex, _r, _rv)
end

function Global.Asin(p0)
	return _in(0xC843060B5765DCE7, p0, _r, _rf)
end

function Global.AssistedMovementCloseRoute()
	return _in(0xAEBF081FFC0A0E5E)
end

function Global.AssistedMovementFlushRoute()
	return _in(0x8621390F0CDCFE1F)
end

function Global.AssistedMovementIsRouteLoaded(route)
	return _in(0x60F9A4393A21F741, _ts(route), _r)
end

function Global.AssistedMovementOverrideLoadDistanceThisFrame(dist)
	return _in(0x13945951E16EF912, dist)
end

function Global.AssistedMovementRemoveRoute(route)
	return _in(0x3548536485DD792B, _ts(route))
end

--- Routes: "1_FIBStairs", "2_FIBStairs", "3_FIBStairs", "4_FIBStairs", "5_FIBStairs", "5_TowardsFire", "6a_FIBStairs", "7_FIBStairs", "8_FIBStairs", "Aprtmnt_1", "AssAfterLift", "ATM_1", "coroner2", "coroner_stairs", "f5_jimmy1", "fame1", "family5b", "family5c", "Family5d", "family5d", "FIB_Glass1", "FIB_Glass2", "FIB_Glass3", "finaBroute1A", "finalb1st", "finalB1sta", "finalbround", "finalbroute2", "Hairdresser1", "jan_foyet_ft_door", "Jo_3", "Lemar1", "Lemar2", "mansion_1", "Mansion_1", "pols_1", "pols_2", "pols_3", "pols_4", "pols_5", "pols_6", "pols_7", "pols_8", "Pro_S1", "Pro_S1a", "Pro_S2", "Towards_case", "trev_steps", "tunrs1", "tunrs2", "tunrs3", "Wave01457s"
function Global.AssistedMovementRequestRoute(route)
	return _in(0x817268968605947A, _ts(route))
end

function Global.AssistedMovementSetRouteProperties(route, props)
	return _in(0xD5002D78B7162E1B, _ts(route), props)
end

function Global.Atan(p0)
	return _in(0xA9D1795CD5043663, p0, _r, _rf)
end

function Global.Atan2(p0, p1)
	return _in(0x8927CBF9D22261A4, p0, p1, _r, _rf)
end

--- Last param determines if its relative to the Entity
function Global.AttachCamToEntity(cam, entity, xOffset, yOffset, zOffset, isRelative)
	return _in(0xFEDB7D269E8C60E3, cam, entity, xOffset, yOffset, zOffset, isRelative)
end

function Global.AttachCamToPedBone(cam, ped, boneIndex, x, y, z, heading)
	return _in(0x61A3DBA14AB7F411, cam, ped, boneIndex, x, y, z, heading)
end

--- Attaches entity 1 to entity 2.
function Global.AttachEntitiesToRope(rope, ent1, ent2, ent1_x, ent1_y, ent1_z, ent2_x, ent2_y, ent2_z, length, p10, p11)
	return _in(0x3D95EC8B6D940AC3, rope, ent1, ent2, ent1_x, ent1_y, ent1_z, ent2_x, ent2_y, ent2_z, length, p10, p11, _i, _i)
end

--- Attaches entity1 to bone (boneIndex) of entity2.
-- boneIndex - this is different to boneID, use GET_PED_BONE_INDEX to get the index from the ID. use the index for attaching to specific bones. entity1 will be attached to entity2's centre if bone index given doesn't correspond to bone indexes for that entity type.
-- useSoftPinning - if set to false attached entity will not detach when fixed
-- collision - controls collision between the two entities (FALSE disables collision).
-- isPed - pitch doesnt work when false and roll will only work on negative numbers (only peds)
-- vertexIndex - position of vertex
-- fixedRot - if false it ignores entity vector
function Global.AttachEntityToEntity(entity1, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p9, useSoftPinning, collision, isPed, vertexIndex, fixedRot)
	return _in(0x6B9BBD38AB0796DF, entity1, entity2, boneIndex, xPos, yPos, zPos, xRot, yRot, zRot, p9, useSoftPinning, collision, isPed, vertexIndex, fixedRot)
end

--- breakForce is the amount of force required to break the bond.
-- p14 - is always 1 in scripts
-- p15 - is 1 or 0 in scripts - unknoun what it does
-- p16 - controls collision between the two entities (FALSE disables collision).
-- p17 - do not teleport entity to be attached to the position of the bone Index of the target entity (if 1, entity will not be teleported to target bone)
-- p18 - is always 2 in scripts.
function Global.AttachEntityToEntityPhysically(entity1, entity2, boneIndex1, boneIndex2, xPos1, yPos1, zPos1, xPos2, yPos2, zPos2, xRot, yRot, zRot, breakForce, fixedRot, p15, collision, p17, p18)
	return _in(0xC3675780C92F90F9, entity1, entity2, boneIndex1, boneIndex2, xPos1, yPos1, zPos1, xPos2, yPos2, zPos2, xRot, yRot, zRot, breakForce, fixedRot, p15, collision, p17, p18)
end

function Global.AttachPortablePickupToPed(ped, p1)
	return _in(0x8DC39368BDD57755, ped, p1)
end

--- The position supplied can be anywhere, and the entity should anchor relative to that point from it's origin.
function Global.AttachRopeToEntity(rope, entity, x, y, z, p5)
	return _in(0x4B490A6832559A65, rope, entity, x, y, z, p5)
end

function Global.AttachSynchronizedSceneToEntity(sceneID, entity, boneIndex)
	return _in(0x272E4723B56A3B96, sceneID, entity, boneIndex)
end

--- Might be more appropriate in AUDIO?
function Global.AttachTvAudioToEntity(entity)
	return _in(0x845BAD77CC770633, entity)
end

function Global.AttachVehicleToCargobob(vehicle, cargobob, p2, x, y, z)
	return _in(0x4127F1D84E347769, vehicle, cargobob, p2, x, y, z)
end

--- HookOffset defines where the hook is attached. leave at 0 for default attachment.
function Global.AttachVehicleToTowTruck(towTruck, vehicle, rear, hookOffsetX, hookOffsetY, hookOffsetZ)
	return _in(0x29A16F8D621C4508, towTruck, vehicle, rear, hookOffsetX, hookOffsetY, hookOffsetZ)
end

function Global.AttachVehicleToTrailer(vehicle, trailer, radius)
	return _in(0x3C7D42D58F770B54, vehicle, trailer, radius)
end

function Global.AudioIsScriptedMusicPlaying()
	return _in(0x845FFC3A4FEEFA3E, _r, _ri)
end

function Global.BadSportPlayerLeftDetected(event, amountReceived)
	return _in(0xEC5E3AF5289DCA81, _i, event, amountReceived, _r)
end
Global.N_0xec5e3af5289dca81 = Global.BadSportPlayerLeftDetected

--- MulleDK19: Starts a new enumeration of the current threads.
-- Call this first, then _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION (0x30B4FA1C82DD4B9F)
-- -----------------------------------------------------------------------
-- Some other guy: See _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION (0x30B4FA1C82DD4B9F) for an example
function Global.BeginEnumeratingThreads()
	return _in(0xDADFADA5A20143A8)
end
Global.N_0xdadfada5a20143a8 = Global.BeginEnumeratingThreads

function Global.BeginReplayStats(p0, p1)
	return _in(0xE0E500246FF73D66, p0, p1)
end

function Global.BeginSrl()
	return _in(0x9BADDC94EF83B823)
end

--- clears a print text command with this text
function Global.BeginTextCommandClearPrint(text)
	return _in(0xE124FA80A759019C, _ts(text))
end
Global.N_0xe124fa80a759019c = Global.BeginTextCommandClearPrint

--- Used to be known as _SET_TEXT_COMPONENT_FORMAT
function Global.BeginTextCommandDisplayHelp(inputType)
	return _in(0x8509B634FBE7DA11, _ts(inputType))
end
Global.SetTextComponentFormat = Global.BeginTextCommandDisplayHelp

--- The following were found in the decompiled script files:
-- STRING, TWOSTRINGS, NUMBER, PERCENTAGE, FO_TWO_NUM, ESMINDOLLA, ESDOLLA, MTPHPER_XPNO, AHD_DIST, CMOD_STAT_0, CMOD_STAT_1, CMOD_STAT_2, CMOD_STAT_3, DFLT_MNU_OPT, F3A_TRAFDEST, ES_HELP_SOC3
-- ESDOLLA
-- ESMINDOLLA - cash (negative)
-- Used to be known as _SET_TEXT_ENTRY
function Global.BeginTextCommandDisplayText(text)
	return _in(0x25FBB336DF1804CB, _ts(text))
end
Global.SetTextEntry = Global.BeginTextCommandDisplayText

--- nothin doin.
-- BOOL Message(char* text)
-- {
-- BEGIN_TEXT_COMMAND_IS_MESSAGE_DISPLAYED("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- return END_TEXT_COMMAND_IS_MESSAGE_DISPLAYED();
-- }
function Global.BeginTextCommandIsMessageDisplayed(text)
	return _in(0x853648FD1063A213, _ts(text))
end
Global.N_0x853648fd1063a213 = Global.BeginTextCommandIsMessageDisplayed

--- BOOL IsContextActive(char *ctx)
-- {
-- BEGIN_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(ctx);
-- return END_TEXT_COMMAND_IS_THIS_HELP_MESSAGE_BEING_DISPLAYED(0);
-- }
function Global.BeginTextCommandIsThisHelpMessageBeingDisplayed(labelName)
	return _in(0x0A24DA3A41B718F5, _ts(labelName))
end
Global.N_0x0a24da3a41b718f5 = Global.BeginTextCommandIsThisHelpMessageBeingDisplayed

--- get's line count
-- int GetLineCount(char *text, float x, float y)
-- {
-- _BEGIN_TEXT_COMMAND_LINE_COUNT("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- return _END_TEXT_COMMAND_GET_LINE_COUNT(x, y);
-- }
function Global.BeginTextCommandLineCount(entry)
	return _in(0x521FB041D93DD0E4, _ts(entry))
end
Global.SetTextGxtEntry = Global.BeginTextCommandLineCount

--- nothin doin.
-- void message()
-- {
-- _BEGIN_TEXT_COMMAND_OBJECTIVE("AHT_RTIT");
-- _END_TEXT_COMMAND_OBJECTIVE(0);
-- }
function Global.BeginTextCommandObjective(p0)
	return _in(0x23D69E0465570028, _ts(p0))
end
Global.N_0x23d69e0465570028 = Global.BeginTextCommandObjective

--- Used to be known as _SET_TEXT_ENTRY_2
-- void ShowSubtitle(char *text)
-- {
-- BEGIN_TEXT_COMMAND_PRINT("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- END_TEXT_COMMAND_PRINT(2000, 1);
-- }
function Global.BeginTextCommandPrint(GxtEntry)
	return _in(0xB87A37EEB7FAA67D, _ts(GxtEntry))
end
Global.SetTextEntry_2 = Global.BeginTextCommandPrint

--- Called prior to adding a text component to the UI. After doing so, GRAPHICS::END_TEXT_COMMAND_SCALEFORM_STRING is called.
-- Examples:
-- GRAPHICS::BEGIN_TEXT_COMMAND_SCALEFORM_STRING("NUMBER");
-- UI::ADD_TEXT_COMPONENT_INTEGER(GAMEPLAY::ABSI(a_1));
-- GRAPHICS::END_TEXT_COMMAND_SCALEFORM_STRING();
-- GRAPHICS::BEGIN_TEXT_COMMAND_SCALEFORM_STRING("STRING");
-- UI::_ADD_TEXT_COMPONENT_STRING(a_2);
-- GRAPHICS::END_TEXT_COMMAND_SCALEFORM_STRING();
-- GRAPHICS::BEGIN_TEXT_COMMAND_SCALEFORM_STRING("STRTNM2");
-- UI::_0x17299B63C7683A2B(v_3);
-- UI::_0x17299B63C7683A2B(v_4);
-- GRAPHICS::END_TEXT_COMMAND_SCALEFORM_STRING();
-- GRAPHICS::BEGIN_TEXT_COMMAND_SCALEFORM_STRING("STRTNM1");
-- UI::_0x17299B63C7683A2B(v_3);
-- GRAPHICS::END_TEXT_COMMAND_SCALEFORM_STRING();
function Global.BeginTextCommandScaleformString(componentType)
	return _in(0x80338406F3475E55, _ts(componentType))
end
Global.BeginTextComponent = Global.BeginTextCommandScaleformString

--- example:
-- UI::BEGIN_TEXT_COMMAND_SET_BLIP_NAME("STRING");
-- UI::_ADD_TEXT_COMPONENT_STRING("Name");
-- UI::END_TEXT_COMMAND_SET_BLIP_NAME(blip);
function Global.BeginTextCommandSetBlipName(gxtentry)
	return _in(0xF9113A30DE5C6670, _ts(gxtentry))
end

--- void message(char *text)
-- {
-- _BEGIN_TEXT_COMMAND_TIMER("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- _END_TEXT_COMMAND_TIMER(0);
-- }
function Global.BeginTextCommandTimer(p0)
	return _in(0x8F9EE5687F8EECCD, _ts(p0))
end
Global.N_0x8f9ee5687f8eeccd = Global.BeginTextCommandTimer

--- Example:
-- _BEGIN_TEXT_COMMAND_WIDTH("NUMBER");
-- ADD_TEXT_COMPONENT_FLOAT(69.420f, 2);
-- float width = _END_TEXT_COMMAND_GET_WIDTH(1);
function Global.BeginTextCommandWidth(text)
	return _in(0x54CE8AC98E120CAB, _ts(text))
end
Global.SetTextEntryForWidth = Global.BeginTextCommandWidth

--- Plays the siren sound of a vehicle which is otherwise activated when fastly double-pressing the horn key.
-- Only works on vehicles with a police siren.
function Global.BlipSiren(vehicle)
	return _in(0x1B9025BDA76822B6, vehicle)
end

function Global.BlockDecisionMakerEvent(name, type)
	return _in(0xE42FCDFD0E4196F7, _ch(name), type)
end

function Global.BreakEntityGlass(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return _in(0x2E648D16F6E308F3, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
end

--- Calculates the travel distance between a set of points.
-- Doesn't seem to correlate with distance on gps sometimes.
function Global.CalculateTravelDistanceBetweenPoints(x1, y1, z1, x2, y2, z2)
	return _in(0xADD95C7005C4A197, x1, y1, z1, x2, y2, z2, _r, _rf)
end

--- Calls the Scaleform function and passes the parameters as floats.
-- The number of parameters passed to the function varies, so the end of the parameter list is represented by -1.0.
function Global.CallScaleformMovieFunctionFloatParams(scaleform, functionName, param1, param2, param3, param4, param5)
	return _in(0xD0837058AE2E4BEE, scaleform, _ts(functionName), param1, param2, param3, param4, param5)
end

--- Calls the Scaleform function and passes both float and string parameters (in their respective order).
-- The number of parameters passed to the function varies, so the end of the float parameters is represented by -1.0, and the end of the string parameters is represented by 0 (NULL).
-- NOTE: The order of parameters in the function prototype is important! All float parameters must come first, followed by the string parameters.
-- Examples:
-- // function MY_FUNCTION(floatParam1, floatParam2, stringParam)
-- GRAPHICS::_CALL_SCALEFORM_MOVIE_FUNCTION_MIXED_PARAMS(scaleform, "MY_FUNCTION", 10.0, 20.0, -1.0, -1.0, -1.0, "String param", 0, 0, 0, 0);
-- // function MY_FUNCTION_2(floatParam, stringParam1, stringParam2)
-- GRAPHICS::_CALL_SCALEFORM_MOVIE_FUNCTION_MIXED_PARAMS(scaleform, "MY_FUNCTION_2", 10.0, -1.0, -1.0, -1.0, -1.0, "String param #1", "String param #2", 0, 0, 0);
function Global.CallScaleformMovieFunctionMixedParams(scaleform, functionName, floatParam1, floatParam2, floatParam3, floatParam4, floatParam5, stringParam1, stringParam2, stringParam3, stringParam4, stringParam5)
	return _in(0xEF662D8D57E290B1, scaleform, _ts(functionName), floatParam1, floatParam2, floatParam3, floatParam4, floatParam5, _ts(stringParam1), _ts(stringParam2), _ts(stringParam3), _ts(stringParam4), _ts(stringParam5))
end

--- Calls the Scaleform function and passes the parameters as strings.
-- The number of parameters passed to the function varies, so the end of the parameter list is represented by 0 (NULL).
function Global.CallScaleformMovieFunctionStringParams(scaleform, functionName, param1, param2, param3, param4, param5)
	return _in(0x51BC1ED3CC44E8F7, scaleform, _ts(functionName), _ts(param1), _ts(param2), _ts(param3), _ts(param4), _ts(param5))
end

--- Calls the Scaleform function.
function Global.CallScaleformMovieMethod(scaleform, method)
	return _in(0xFBD96D87AC96D533, scaleform, _ts(method))
end
Global.CallScaleformMovieFunctionVoid = Global.CallScaleformMovieMethod

function Global.CanCreateRandomBikeRider()
	return _in(0xEACEEDA81751915C, _r)
end

function Global.CanCreateRandomCops()
	return _in(0x5EE2CAFF7F17770D, _r)
end

function Global.CanCreateRandomDriver()
	return _in(0xB8EB95E5B4E56978, _r)
end

function Global.CanCreateRandomPed(unk)
	return _in(0x3E8349C08E4B82E4, unk, _r)
end

function Global.CanKnockPedOffVehicle(ped)
	return _in(0x51AC07A44D4F5B8A, ped, _r)
end

function Global.CanPedHearPlayer(player, ped)
	return _in(0xF297383AA91DCA29, player, ped, _r)
end

function Global.CanPedInCombatSeeTarget(ped, target)
	return _in(0xEAD42DE3610D0721, ped, target, _r)
end

--- Prevents the ped from going limp.
-- [Example: Can prevent peds from falling when standing on moving vehicles.]
function Global.CanPedRagdoll(ped)
	return _in(0x128F79EDCECE4FD5, ped, _r)
end

--- Checks if the ped can play the speech or has the speech file, last parameter is usually 0
function Global.CanPedSpeak(ped, speechName, unk)
	return _in(0x49B99BF3FDA89A7A, ped, _ts(speechName), unk, _r)
end
Global.N_0x49b99bf3fda89a7a = Global.CanPedSpeak

--- This one is weird and seems to return a TRUE state regardless of whether the phone is visible on screen or tucked away.
-- I can confirm the above. This function is hard-coded to always return 1.
function Global.CanPhoneBeSeenOnScreen()
	return _in(0xC4E2813898C97A4B, _r)
end

--- if(_CAN_PLAY_ONLINE() == 0) means the player is banned(Social Club or Rockstar)
function Global.CanPlayOnline()
	return _in(0x5F91D5D0B36AA310, _r)
end
Global.IsPlayerBanned = Global.CanPlayOnline

function Global.CanPlayerStartMission(player)
	return _in(0xDE7465A27D403C06, player, _r)
end

function Global.CanRegisterMissionEntities(p0, p1, p2, p3)
	return _in(0x69778E7564BADE6D, p0, p1, p2, p3, _r)
end

function Global.CanRegisterMissionObjects(p0)
	return _in(0x800DD4721A8B008B, p0, _r)
end

function Global.CanRegisterMissionPeds(p0)
	return _in(0xBCBF4FEF9FA5D781, p0, _r)
end

function Global.CanRegisterMissionVehicles(p0)
	return _in(0x7277F1F2E085EE74, p0, _r)
end

--- modelHash (p1) was always 0 in R* scripts
function Global.CanSetEnterStateForRegisteredEntity(cutsceneEntName, modelHash)
	return _in(0x645D0B458D8E17B5, _ts(cutsceneEntName), _ch(modelHash), _r)
end

function Global.CanSetExitStateForCamera(p0)
	return _in(0xB2CBCD0930DFB420, p0, _r)
end

function Global.CanSetExitStateForRegisteredEntity(cutsceneEntName, modelHash)
	return _in(0x4C6A6451C79E4662, _ts(cutsceneEntName), _ch(modelHash), _r)
end

function Global.CanShuffleSeat(vehicle, p1)
	return _in(0x30785D90C956BF35, vehicle, p1, _r)
end

function Global.CanUseWeaponOnParachute(weaponHash)
	return _in(0xBC7BE5ABC0879F74, _ch(weaponHash), _r)
end

--- Cancels the currently executing event. See https://wiki.fivem.net/wiki/CancelEvent
function Global.CancelEvent()
	return _in(0xfa29d35d)
end

--- All music event names found in the b617d scripts: pastebin.com/GnYt0R3P
function Global.CancelMusicEvent(eventName)
	return _in(0x5B17A90291133DA5, _ts(eventName), _r)
end

function Global.CancelStuntJump()
	return _in(0xE6B7B0ACD4E4B75E)
end

--- Does something similar to INTERIOR::DISABLE_INTERIOR
function Global.CapInterior(interiorID, toggle)
	return _in(0xD9175F941610DB54, interiorID, toggle)
end

--- I'm guessing this rounds a float value up to the next whole number, and FLOOR rounds it down
function Global.Ceil(value)
	return _in(0x11E019C8F43ACC8A, value, _r, _ri)
end

function Global.CellCamActivate(p0, p1)
	return _in(0xFDE8F069C542D126, p0, p1)
end

function Global.CellCamIsCharVisibleNoFaceCheck(entity)
	return _in(0x439E9BC95B7E7FBE, entity, _r)
end

--- When calling this, the current frame will have the players "arrow icon" be focused on the dead center of the radar.
function Global.CenterPlayerOnRadarThisFrame()
	return _in(0x6D14BFDC33B34F55)
end

--- b2 and/or b3 maybe got something to do with keeping values from the last ped. Both of them set to 1 works great. <br/><br/>Examples from the decompiled scripts:<br/><br/>PLAYER::CHANGE_PLAYER_PED(PLAYER::PLAYER_ID(), l_5C0[4/*14*/], 0, 1);<br/>PLAYER::CHANGE_PLAYER_PED(PLAYER::PLAYER_ID(), a_0[a_0._f7/*1*/], a_2, 0);<br/><br/><br/>===========================================================<br/>The only way I ever got this to work in GTA Online once is by setting both to 0, 0. However, when you switch from your online character to whomever, your character will start walking away 'as if you left the game.' If from there you attempt to call this native once more to switch back to you online ped. You will freeze or if you try changing to another ped. I've tried all posibilities so far.<br/>1, 1 (Freeze), 0, 0(Works Once), 1, 0 &amp; 0, 1 (Freeze). Note of course trying to call this on another online player will crash. Anyone have any idea if implementing a blr within the xex itself on a possible check if it would prevent this freezing?<br/>===========================================================
function Global.ChangePlayerPed(player, ped, b2, b3)
	return _in(0x048189FAC643DEEE, player, ped, b2, b3)
end

--- minimum: Degrees between -90f and 90f.
-- maximum: Degrees between -90f and 90f.
-- Clamps the gameplay camera's current pitch.
-- Eg. _CLAMP_GAMEPLAY_CAM_PITCH(0.0f, 0.0f) will set the vertical angle directly behind the player.
function Global.ClampGameplayCamPitch(minimum, maximum)
	return _in(0xA516C198B7DCA1E1, minimum, maximum, _r, _ri)
end

--- minimum: Degrees between -180f and 180f.
-- maximum: Degrees between -180f and 180f.
-- Clamps the gameplay camera's current yaw.
-- Eg. _CLAMP_GAMEPLAY_CAM_YAW(0.0f, 0.0f) will set the horizontal angle directly behind the player.
function Global.ClampGameplayCamYaw(minimum, maximum)
	return _in(0x8F993D26E0CA5E8E, minimum, maximum, _r, _ri)
end

function Global.CleanItemset(p0)
	return _in(0x41BC0D722FC04221, p0)
end

function Global.ClearAdditionalText(p0, p1)
	return _in(0x2A179DF17CCF04CD, p0, p1)
end

function Global.ClearAllBrokenGlass()
	return _in(0xB32209EFFDC04913, _r, _ri)
end

function Global.ClearAllHelpMessages()
	return _in(0x6178F68A87A4D3A0)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.ClearAllPedProps(ped)
	return _in(0xCD8A7537A9B52F06, ped)
end

function Global.ClearAmbientZoneListState(p1)
	return _in(0x120C48C614909FA4, _i, p1)
end

--- This function also has a p2, unknown. Signature AUDIO::CLEAR_AMBIENT_ZONE_STATE(char* zoneName, bool p1, Any p2);
-- Still needs more research.
-- Here are the names I've found: pastebin.com/AfA0Qjyv
function Global.ClearAmbientZoneState(zoneName, p1)
	return _in(0x218DD44AAAC964FF, _ts(zoneName), p1)
end

function Global.ClearAngledAreaOfVehicles(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	return _in(0x11DB3500F042A8AA, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
end

--- Example: CLEAR_AREA(0, 0, 0, 30, true, false, false, false);
function Global.ClearArea(X, Y, Z, radius, p4, ignoreCopCars, ignoreObjects, p7)
	return _in(0xA56F01F3765B93A0, X, Y, Z, radius, p4, ignoreCopCars, ignoreObjects, p7)
end

--- flags appears to always be 0
function Global.ClearAreaOfCops(x, y, z, radius, flags)
	return _in(0x04F8FC8FCF58F88D, x, y, z, radius, flags)
end

--- GAMEPLAY::_0x957838AAF91BD12D(x, y, z, radius, false, false, false, false); seem to make all objects go away, peds, vehicles etc. All booleans set to true doesn't seem to change anything.
function Global.ClearAreaOfEverything(x, y, z, radius, p4, p5, p6, p7)
	return _in(0x957838AAF91BD12D, x, y, z, radius, p4, p5, p6, p7)
end
Global.N_0x957838aaf91bd12d = Global.ClearAreaOfEverything

--- I looked through the PC scripts that this site provides you with a link to find. It shows the last param mainly uses, (0, 2, 6, 16, and 17) so I am going to assume it is a type of flag.
function Global.ClearAreaOfObjects(x, y, z, radius, flags)
	return _in(0xDD9B9B385AAC7F5B, x, y, z, radius, flags)
end

--- Example: 		CLEAR_AREA_OF_PEDS(0, 0, 0, 10000, 1);
function Global.ClearAreaOfPeds(x, y, z, radius, flags)
	return _in(0xBE31FD6CE464AC59, x, y, z, radius, flags)
end

--- flags is usually 0 in the scripts.
function Global.ClearAreaOfProjectiles(x, y, z, radius, flags)
	return _in(0x0A1CB9094635D1A6, x, y, z, radius, flags)
end

--- Example: 		CLEAR_AREA_OF_VEHICLES(0, 0, 0, 10000, false, false, false, false, false);
function Global.ClearAreaOfVehicles(x, y, z, radius, p4, p5, p6, p7, p8)
	return _in(0x01C7B9B38428AEB6, x, y, z, radius, p4, p5, p6, p7, p8)
end

--- This sets bit [offset] of [address] to off.
-- Example:
-- GAMEPLAY::CLEAR_BIT(&amp;bitAddress, 1);
-- To check if this bit has been enabled:
-- GAMEPLAY::IS_BIT_SET(bitAddress, 1); // will return 0 afterwards
function Global.ClearBit(offset)
	return _in(0xE80492A9AC099A93, _i, offset)
end

function Global.ClearBrief()
	return _in(0x9D292F73ADBD9313)
end

function Global.ClearCloudHat()
	return _in(0x957E790EA1727B64)
end

function Global.ClearDecisionMakerEventResponse(name, type)
	return _in(0x4FC9381A7AEE8968, _ch(name), type)
end

--- Resets the screen's draw-origin which was changed by the function GRAPHICS::SET_DRAW_ORIGIN(...) back to x=0,y=0.
-- See GRAPHICS::SET_DRAW_ORIGIN(...) for further information.
function Global.ClearDrawOrigin()
	return _in(0xFF0B610F6BE0D7AF)
end

function Global.ClearDrivebyTaskUnderneathDrivingTask(ped)
	return _in(0xC35B5CDB2824CF69, ped)
end

function Global.ClearEntityLastDamageEntity(entity)
	return _in(0xA72CD9CA74A5ECBA, entity, _r, _ri)
end

function Global.ClearEntityLastWeaponDamage(entity)
	return _in(0xAC678E40BE7C74D2, entity)
end

function Global.ClearFacialIdleAnimOverride(ped)
	return _in(0x726256CC1EEB182F, ped)
end

--- p0 looks like int in script
function Global.ClearFloatingHelp(p0, p1)
	return _in(0x50085246ABD3FEFA, p0, p1)
end

function Global.ClearFocus()
	return _in(0x31B73D1EA9F01DA2)
end

--- Clears the GPS flags. Only the script that originally called SET_GPS_FLAGS can clear them.
-- Doesn't seem like the flags are actually read by the game at all.
function Global.ClearGpsFlags()
	return _in(0x21986729D6A3A830)
end

function Global.ClearGpsPlayerWaypoint()
	return _in(0xFF4FB7C8CDFA3DA7)
end

function Global.ClearGpsRaceTrack()
	return _in(0x7AA5B4CE533C858B)
end

function Global.ClearHdArea()
	return _in(0xCE58B1CFB9290813)
end

function Global.ClearHelp(toggle)
	return _in(0x8DFCED7A656F8802, toggle)
end

--- _CLEAR_NOTIFICATIONS_POS(0.5f);
function Global.ClearNotificationsPos(pos)
	return _in(0x55598D21339CB998, pos)
end
Global.N_0x55598d21339cb998 = Global.ClearNotificationsPos

function Global.ClearOverrideWeather()
	return _in(0x338D2E3477711050)
end

function Global.ClearPedAlternateMovementAnim(ped, stance, p2)
	return _in(0xD8D19675ED5FBDCE, ped, stance, p2)
end

function Global.ClearPedAlternateWalkAnim(ped, p1)
	return _in(0x8844BBFCE30AA9E9, ped, p1)
end

function Global.ClearPedBloodDamage(ped)
	return _in(0x8FE22675A5A45817, ped)
end

--- Somehow related to changing ped's clothes.
function Global.ClearPedBloodDamageByZone(ped, p1)
	return _in(0x56E3B78C5408D9F4, ped, p1)
end
Global.N_0x56e3b78c5408d9f4 = Global.ClearPedBloodDamageByZone

--- p1: from 0 to 5 in the b617d scripts.
-- p2: "blushing" and "ALL" found in the b617d scripts.
function Global.ClearPedDamageDecalByZone(ped, p1, p2)
	return _in(0x523C79AEEFCC4A2A, ped, p1, _ts(p2))
end
Global.N_0x523c79aeefcc4a2a = Global.ClearPedDamageDecalByZone

function Global.ClearPedDecorations(ped)
	return _in(0x0E5173C163976E38, ped)
end

function Global.ClearPedDriveByClipsetOverride(ped)
	return _in(0x4AFE3690D7E0B5AC, ped)
end

function Global.ClearPedFacialDecorations(ped)
	return _in(0xE3B27E70CEAB9F0C, ped)
end
Global.N_0xe3b27e70ceab9f0c = Global.ClearPedFacialDecorations

function Global.ClearPedInPauseMenu()
	return _in(0x5E62BE5DC58E9E06)
end

function Global.ClearPedLastDamageBone(ped)
	return _in(0x8EF6B7AC68E2F01B, ped)
end

function Global.ClearPedLastWeaponDamage(ped)
	return _in(0x0E98F88A24C5F4B8, ped)
end

function Global.ClearPedNonCreationArea()
	return _in(0x2E05208086BA0651)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.ClearPedProp(ped, propId)
	return _in(0x0943E5B8E078E76E, ped, propId)
end

function Global.ClearPedSecondaryTask(ped)
	return _in(0x176CECF6F920D707, ped)
end

function Global.ClearPedTasks(ped)
	return _in(0xE1EF3C1216AFF2CD, ped)
end

--- Immediately stops the pedestrian from whatever it's doing. They stop fighting, animations, etc. they forget what they were doing.
function Global.ClearPedTasksImmediately(ped)
	return _in(0xAAA34F8A7CB32098, ped)
end

--- It clears the wetness of the selected Ped/Player. Clothes have to be wet to notice the difference.
function Global.ClearPedWetness(ped)
	return _in(0x9C720776DAA43E7E, ped)
end

function Global.ClearPlayerHasDamagedAtLeastOneNonAnimalPed(player)
	return _in(0x4AACB96203D11A31, player)
end

function Global.ClearPlayerHasDamagedAtLeastOnePed(player)
	return _in(0xF0B67A4DE6AB5F98, player)
end

function Global.ClearPlayerParachuteModelOverride(player)
	return _in(0x8753997EB5F6EE3F, player)
end

function Global.ClearPlayerParachutePackModelOverride(player)
	return _in(0x10C54E4389C12B42, player)
end

function Global.ClearPlayerParachuteVariationOverride(player)
	return _in(0x0F4CC924CF8C7B21, player)
end

--- This executes at the same as speed as PLAYER::SET_PLAYER_WANTED_LEVEL(player, 0, false);
-- PLAYER::GET_PLAYER_WANTED_LEVEL(player); executes in less than half the time. Which means that it's worth first checking if the wanted level needs to be cleared before clearing. However, this is mostly about good code practice and can important in other situations. The difference in time in this example is negligible.
function Global.ClearPlayerWantedLevel(player)
	return _in(0xB302540597885499, player)
end

--- Only used once in the decompiled scripts. Seems to be related to scripted vehicle generators.
-- Modified example from "am_imp_exp.c4", line 6418:
-- /* popSchedules[0] = ZONE::GET_ZONE_POPSCHEDULE(ZONE::GET_ZONE_AT_COORDS(891.3, 807.9, 188.1));
-- etc.
-- */
-- STREAMING::SET_MODEL_AS_NO_LONGER_NEEDED(vehicleHash);
-- ZONE::CLEAR_POPSCHEDULE_OVERRIDE_VEHICLE_MODEL(popSchedules[index]);
function Global.ClearPopscheduleOverrideVehicleModel(scheduleId)
	return _in(0x5C0DE367AA0D911C, scheduleId)
end

function Global.ClearPrints()
	return _in(0xCC33FA791322B9D9)
end

--- Clears the relationship between two groups. This should be called twice (once for each group).
-- Relationship types:
-- 0 = Companion
-- 1 = Respect
-- 2 = Like
-- 3 = Neutral
-- 4 = Dislike
-- 5 = Hate
-- 255 = Pedestrians
-- (Credits: Inco)
-- Example:
-- PED::CLEAR_RELATIONSHIP_BETWEEN_GROUPS(2, l_1017, 0xA49E591C);
-- PED::CLEAR_RELATIONSHIP_BETWEEN_GROUPS(2, 0xA49E591C, l_1017);
function Global.ClearRelationshipBetweenGroups(relationship, group1, group2)
	return _in(0x5E29243FB56FC6D4, relationship, _ch(group1), _ch(group2))
end

function Global.ClearReminderMessage()
	return _in(0xB57D8DD645CFA2CF)
end
Global.N_0xb57d8dd645cfa2cf = Global.ClearReminderMessage

function Global.ClearReplayStats()
	return _in(0x1B1AB132A16FDA55)
end

function Global.ClearRoomForEntity(entity)
	return _in(0xB365FC0C4E27FFA7, entity)
end

function Global.ClearSequenceTask(taskSequence)
	return _in(0x3841422E9C488D8C, _ii(taskSequence) --[[ may be optional ]], _r, _ri)
end

function Global.ClearSmallPrints()
	return _in(0x2CEA2839313C09AC)
end

--- p0: found arguments in the b617d scripts: pastebin.com/X5akCN7z
function Global.ClearThisPrint(p0)
	return _in(0xCF708001E1E536DD, _ts(p0))
end

function Global.ClearTimecycleModifier()
	return _in(0x0F07E7745A236711)
end

function Global.ClearVehicleCustomPrimaryColour(vehicle)
	return _in(0x55E1D2758F34E437, vehicle, _r, _ri)
end

function Global.ClearVehicleCustomSecondaryColour(vehicle)
	return _in(0x5FFBDEEC3E8E2009, vehicle, _r, _ri)
end

function Global.ClearWeatherTypePersist()
	return _in(0xCCC39339BEF76CF5)
end

--- p3 - last parameter does not mean ped handle is returned
-- maybe a quick view in disassembly will tell us what is actually does
-- Example of Cloning Your Player:
-- CLONE_PED(PLAYER_PED_ID(), GET_ENTITY_HEADING(PLAYER_PED_ID()), 0, 1);
function Global.ClonePed(ped, heading, isNetwork, p3)
	return _in(0xEF29A16337FACADB, ped, heading, isNetwork, p3, _r, _ri)
end

--- What exactly is the difference? What does this exactly do by chance?
function Global.ClonePedToTarget(ped, targetPed)
	return _in(0xE952D6431689AD9A, ped, targetPed)
end
Global.AssignPlayerToPed = Global.ClonePedToTarget

function Global.CloseBombBayDoors(vehicle)
	return _in(0x3556041742A0DC74, vehicle)
end
Global.N_0x3556041742a0dc74 = Global.CloseBombBayDoors

function Global.ClosePatrolRoute()
	return _in(0xB043ECA801B8CBC1)
end

function Global.CloseSequenceTask(taskSequence)
	return _in(0x39E72BC99E6360CB, taskSequence, _r, _ri)
end

--- Compares two strings up to a specified number of characters.
-- Parameters:
-- str1 - String to be compared.
-- str2 - String to be compared.
-- matchCase - Comparison will be case-sensitive.
-- maxLength - Maximum number of characters to compare. A value of -1 indicates an infinite length.
-- Returns:
-- A value indicating the relationship between the strings:
-- &lt;0 - The first non-matching character in 'str1' is less than the one in 'str2'. (e.g. 'A' &lt; 'B', so result = -1)
-- 0 - The contents of both strings are equal.
-- &gt;0 - The first non-matching character in 'str1' is less than the one in 'str2'. (e.g. 'B' &gt; 'A', so result = 1)
-- Examples:
-- GAMEPLAY::COMPARE_STRINGS("STRING", "string", false, -1); // 0; equal
-- GAMEPLAY::COMPARE_STRINGS("TESTING", "test", false, 4); // 0; equal
-- GAMEPLAY::COMPARE_STRINGS("R2D2", "R2xx", false, 2); // 0; equal
-- GAMEPLAY::COMPARE_STRINGS("foo", "bar", false, -1); // 4; 'f' &gt; 'b'
-- GAMEPLAY::COMPARE_STRINGS("A", "A", true, 1); // 0; equal
-- When comparing case-sensitive strings, lower-case characters are greater than upper-case characters:
-- GAMEPLAY::COMPARE_STRINGS("A", "a", true, 1); // -1; 'A' &lt; 'a'
-- GAMEPLAY::COMPARE_STRINGS("a", "A", true, 1); // 1; 'a' &gt; 'A'
function Global.CompareStrings(str1, str2, matchCase, maxLength)
	return _in(0x1E34710ECD4AB0EB, _ts(str1), _ts(str2), matchCase, maxLength, _r, _ri)
end

--- Works for vehicles with a retractable landing gear
-- landing gear states:
-- 0: Deployed
-- 1: Closing
-- 2: Opening
-- 3: Retracted
function Global.ControlLandingGear(vehicle, state)
	return _in(0xCFC8BE9A5E1FE575, vehicle, state)
end
Global.SetVehicleLandingGear = Global.ControlLandingGear

--- Forces the ped to use the mounted weapon.
-- Returns false if task is not possible.
function Global.ControlMountedWeapon(ped)
	return _in(0xDCFE42068FE0135A, ped, _r)
end

function Global.Cos(value)
	return _in(0xD0FFB162F40A139C, value, _r, _rf)
end

--- Used for doing money drop
-- Pickup hashes: pastebin.com/8EuSv2r1
function Global.CreateAmbientPickup(pickupHash, posX, posY, posZ, p4, value, modelHash, p7, p8)
	return _in(0x673966A0C0FD7171, _ch(pickupHash), posX, posY, posZ, p4, value, _ch(modelHash), p7, p8, _r, _ri)
end

--- "DEFAULT_SCRIPTED_CAMERA"
-- "DEFAULT_ANIMATED_CAMERA"
-- "DEFAULT_SPLINE_CAMERA"
-- "DEFAULT_SCRIPTED_FLY_CAMERA"
-- "TIMED_SPLINE_CAMERA"
function Global.CreateCam(camName, p1)
	return _in(0xC3981DCE61D9E13F, _ts(camName), p1, _r, _ri)
end

--- camName is always set to "DEFAULT_SCRIPTED_CAMERA" in Rockstar's scripts.
-- ------------
-- Camera names found in the b617d scripts:
-- "DEFAULT_ANIMATED_CAMERA"
-- "DEFAULT_SCRIPTED_CAMERA"
-- "DEFAULT_SCRIPTED_FLY_CAMERA"
-- "DEFAULT_SPLINE_CAMERA"
-- ------------
-- Side Note: It seems p8 is basically to represent what would be the bool p1 within CREATE_CAM native. As well as the p9 since it's always 2 in scripts seems to represent what would be the last param within SET_CAM_ROT native which normally would be 2.
function Global.CreateCamWithParams(camName, posX, posY, posZ, rotX, rotY, rotZ, fov, p8, p9)
	return _in(0xB51194800B257161, _ts(camName), posX, posY, posZ, rotX, rotY, rotZ, fov, p8, p9, _r, _ri)
end

function Global.CreateCamera(camHash, p1)
	return _in(0x5E3CF89C6BCCA67D, _ch(camHash), p1, _r, _ri)
end

--- CAM::_GET_GAMEPLAY_CAM_COORDS can be used instead of posX,Y,Z
-- CAM::_GET_GAMEPLAY_CAM_ROT can be used instead of rotX,Y,Z
-- CAM::_80EC114669DAEFF4() can be used instead of p7 (Possible p7 is FOV parameter. )
-- p8 ???
-- p9 uses 2 by default
function Global.CreateCameraWithParams(camHash, posX, posY, posZ, rotX, rotY, rotZ, fov, p8, p9)
	return _in(0x6ABFA3E16460F22D, _ch(camHash), posX, posY, posZ, rotX, rotY, rotZ, fov, p8, p9, _r, _ri)
end

--- Creates a checkpoint. Returns the handle of the checkpoint.
-- 20/03/17 : Attention, checkpoints are already handled by the game itself, so you must not loop it like markers.
-- Parameters:
-- * type - The type of checkpoint to create. See below for a list of checkpoint types.
-- * pos1 - The position of the checkpoint.
-- * pos2 - The position of the next checkpoint to point to.
-- * radius - The radius of the checkpoint.
-- * color - The color of the checkpoint.
-- * reserved - Special parameter, see below for details. Usually set to 0 in the scripts.
-- Checkpoint types:
-- 0-4---------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 5-9---------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 10-14-------Ring: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 15-19-------1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 20-24-------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 25-29-------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 30-34-------Cylinder: 1 arrow, 2 arrow, 3 arrows, CycleArrow, Checker
-- 35-38-------Ring: Airplane Up, Left, Right, UpsideDown
-- 39----------?
-- 40----------Ring: just a ring
-- 41----------?
-- 42-44-------Cylinder w/ number (uses 'reserved' parameter)
-- 45-47-------Cylinder no arrow or number
-- If using type 42-44, reserved sets number / number and shape to display
-- 0-99------------Just numbers (0-99)
-- 100-109-----------------Arrow (0-9)
-- 110-119------------Two arrows (0-9)
-- 120-129----------Three arrows (0-9)
-- 130-139----------------Circle (0-9)
-- 140-149------------CycleArrow (0-9)
-- 150-159----------------Circle (0-9)
-- 160-169----Circle  w/ pointer (0-9)
-- 170-179-------Perforated ring (0-9)
-- 180-189----------------Sphere (0-9)
function Global.CreateCheckpoint(type, posX1, posY1, posZ1, posX2, posY2, posZ2, radius, red, green, blue, alpha, reserved)
	return _in(0x0134F0835AB6BFCB, type, posX1, posY1, posZ1, posX2, posY2, posZ2, radius, red, green, blue, alpha, reserved, _r, _ri)
end

function Global.CreateCinematicShot(p0, p1, p2, entity)
	return _in(0x741B0129D4560F31, p0, p1, p2, entity)
end

function Global.CreateForcedObject(x, y, z, p3, modelHash, p5)
	return _in(0x150E808B375A385A, x, y, z, p3, _ch(modelHash), p5)
end

--- Creates a new ped group.
-- Groups can contain up to 8 peds.
-- The parameter is unused.
-- Returns a handle to the created group, or 0 if a group couldn't be created.
function Global.CreateGroup(unused)
	return _in(0x90370EBE0FEE1A3D, unused, _r, _ri)
end

--- p0 could be type
-- =====================================================
-- enum IncidentTypes{
-- FireDepartment = 3,
-- Paramedics = 5,
-- Police = 7,
-- PedsInCavalcades = 11,
-- Merryweather = 14
-- };
-- As for the 'police' incident, it will call police cars to you, but unlike PedsInCavalcades &amp; Merryweather they won't start shooting at you unless you shoot first or shoot at them. The top 2 however seem to cancel theirselves if there is noone dead around you or a fire. I only figured them out as I found out the 3rd param is definately the amountOfPeople and they called incident 3 in scripts with 4 people (which the firetruck has) and incident 5 with 2 people (which the ambulence has). The 4 param I cant say is radius, but for the pedsInCavalcades and Merryweather R* uses 0.0f and for the top 3 (Emergency Services) they use 3.0f.
-- Side Note: It seems calling the pedsInCavalcades or Merryweather then removing it seems to break you from calling the EmergencyEvents and I also believe pedsInCavalcades. (The V cavalcades of course not IV).
-- Side Note 2: I say it breaks as if you call this proper,
-- if(CREATE_INCIDENT) etc it will return false if you do as I said above.
-- =====================================================
function Global.CreateIncident(incidentType, x, y, z, p5, radius, outIncidentID)
	return _in(0x3F892CAF67444AE7, incidentType, x, y, z, p5, radius, _ii(outIncidentID) --[[ may be optional ]], _r)
end

--- p0 could be type (valueused in scripts: 14, 7, 5, 3, 11)
-- p1 is a return from get_player_ped() in am_gang_call.c, but player_ped_id() in other (non am) scripts.
-- p3 is usually 0f or 3f
-- =====================================================
-- enum IncidentTypes{
-- FireDepartment = 3,
-- Paramedics = 5,
-- Police = 7,
-- PedsInCavalcades = 11,
-- Merryweather = 14
-- };
-- As for the 'police' incident, it will call police cars to you, but unlike PedsInCavalcades &amp; Merryweather they won't start shooting at you unless you shoot first or shoot at them. The top 2 however seem to cancel theirselves if there is noone dead around you or a fire. I only figured them out as I found out the 3rd param is definately the amountOfPeople and they called incident 3 in scripts with 4 people (which the firetruck has) and incident 5 with 2 people (which the ambulence has). The 4 param I cant say is radius, but for the pedsInCavalcades and Merryweather R* uses 0.0f and for the top 3 (Emergency Services) they use 3.0f.
-- Side Note: It seems calling the pedsInCavalcades or Merryweather then removing it seems to break you from calling the EmergencyEvents and I also believe pedsInCavalcades. (The V cavalcades of course not IV).
-- Side Note 2: I say it breaks as if you call this proper,
-- if(CREATE_INCIDENT) etc it will return false if you do as I said above.
-- =====================================================
function Global.CreateIncidentWithEntity(incidentType, ped, amountOfPeople, radius, outIncidentID)
	return _in(0x05983472F0494E60, incidentType, ped, amountOfPeople, radius, _ii(outIncidentID) --[[ may be optional ]], _r)
end

function Global.CreateItemset(distri)
	return _in(0x35AD299F50D91B24, _v, _r, _ri)
end

--- creates single lightning+thunder at random position
function Global.CreateLightningThunder()
	return _in(0xF6062E089251C898)
end

--- Train models HAVE TO be loaded (requested) before you use this.
-- For variation 15 - request:
-- freight
-- freightcar
-- freightgrain
-- freightcont1
-- freightcont2
-- freighttrailer
function Global.CreateMissionTrain(variation, x, y, z, direction)
	return _in(0x63C6CCA8E68AE8C8, variation, x, y, z, direction, _r, _ri)
end

--- Creates a mobile phone of the specified type.
-- Possible phone types:
-- 0 - Default phone / Michael's phone
-- 1 - Trevor's phone
-- 2 - Franklin's phone
-- 4 - Prologue phone
-- These values represent bit flags, so a value of '3' would toggle Trevor and Franklin's phones together, causing unexpected behavior and most likely crash the game.
function Global.CreateMobilePhone(phoneType)
	return _in(0xA4E8E696C532FBC7, phoneType)
end

--- p5 = sets as true in scripts
-- Same as the comment for CREATE_MODEL_SWAP unless for some reason p5 affects it this only works with objects as well.
-- Network players do not see changes done with this.
function Global.CreateModelHide(x, y, z, radius, model, p5)
	return _in(0x8A97BCA30A0CE478, x, y, z, radius, _ch(model), p5)
end

function Global.CreateModelHideExcludingScriptObjects(x, y, z, radius, model, p5)
	return _in(0x3A52AE588830BF7F, x, y, z, radius, _ch(model), p5)
end

--- Only works with objects!
-- Network players do not see changes done with this.
function Global.CreateModelSwap(x, y, z, radius, originalModel, newModel, p6)
	return _in(0x92C47782FDA8B2A3, x, y, z, radius, _ch(originalModel), _ch(newModel), p6)
end

--- Spawns one or more money pickups.
-- x: The X-component of the world position to spawn the money pickups at.
-- y: The Y-component of the world position to spawn the money pickups at.
-- z: The Z-component of the world position to spawn the money pickups at.
-- value: The combined value of the pickups (in dollars).
-- amount: The number of pickups to spawn.
-- model: The model to use, or 0 for default money model.
-- Example:
-- CREATE_MONEY_PICKUPS(x, y, z, 1000, 3, 0x684a97ae);
-- Spawns 3 spray cans that'll collectively give $1000 when picked up. (Three spray cans, each giving $334, $334, $332 = $1000).
-- ==============================================
-- Max is 2000 in MP. So if you put the amount to 20, but the value to $400,000 eg. They will only be able to pickup 20 - $2,000 bags. So, $40,000
function Global.CreateMoneyPickups(x, y, z, value, amount, model)
	return _in(0x0589B5E791CE9B2B, x, y, z, value, amount, _ch(model))
end

--- p0 was the return of NET_TO_PED in fm_mission_controler.
-- p4 was always "".
-- returns headDisplayId
function Global.CreateMpGamerTag(ped, username, pointedClanTag, isRockstarClan, clanTag, p5)
	return _in(0xBFEFE3321A3F5015, ped, _ts(username), pointedClanTag, isRockstarClan, _ts(clanTag), p5, _r, _ri)
end
Global.N_0xbfefe3321a3f5015 = Global.CreateMpGamerTag

--- shouldn't this return an int?
function Global.CreateMpGamerTagColor(headDisplayId, username, pointedClanTag, isRockstarClan, clanTag, p5, r, g, b)
	return _in(0x6DD05E9D83EFA4C9, headDisplayId, _ts(username), pointedClanTag, isRockstarClan, _ts(clanTag), p5, r, g, b)
end
Global.N_0x6dd05e9d83efa4c9 = Global.CreateMpGamerTagColor

function Global.CreateNewScriptedConversation()
	return _in(0xD2C91A0B572AAE56)
end

--- Creates a new NaturalMotion message.
-- startImmediately: If set to true, the character will perform the message the moment it receives it by GIVE_PED_NM_MESSAGE. If false, the Ped will get the message but won't perform it yet. While it's a boolean value, if negative, the message will not be initialized.
-- messageId: The ID of the NaturalMotion message.
-- If a message already exists, this function does nothing. A message exists until the point it has been successfully dispatched by GIVE_PED_NM_MESSAGE.
function Global.CreateNmMessage(startImmediately, messageId)
	return _in(0x418EF2A1BCE56685, startImmediately, messageId)
end

--- p5 - last parameter does not mean object handle is returned
-- maybe a quick view in disassembly will tell us what is actually does
-- ----------
-- prop_tt_screenstatic (0xE2E039BC) is handled different. Not sure how yet but it I know it is.
-- thx fr Xenus.oida
function Global.CreateObject(modelHash, x, y, z, isNetwork, p5, dynamic)
	return _in(0x509D5878EB39E842, modelHash, x, y, z, isNetwork, p5, dynamic, _r, _ri)
end

--- p5 - does not mean object handle is returned
-- maybe a quick view in disassembly will tell us what is actually does
function Global.CreateObjectNoOffset(modelHash, x, y, z, isNetwork, p5, dynamic)
	return _in(0x9A294B2138ABB884, _ch(modelHash), x, y, z, isNetwork, p5, dynamic, _r, _ri)
end

function Global.CreatePatrolRoute()
	return _in(0xAF8A443CCC8018DC)
end

--- p7 - last parameter does not mean ped handle is returned
-- maybe a quick view in disassembly will tell us what is actually does
-- *Heading*: 0.0
-- *Heading* is the Z axis spawn rotation of the ped 0-&gt;5th parameter.
-- Ped Types:
-- [Player,1|Male,4|Female,5|Cop,6|Human,26|SWAT,27|Animal,28|Army,29]
-- You can also use GET_PED_TYPE
function Global.CreatePed(pedType, modelHash, x, y, z, heading, isNetwork, p7)
	return _in(0xD49F9B0955C367DE, pedType, _ch(modelHash), x, y, z, heading, isNetwork, p7, _r, _ri)
end

--- p5 - last parameter does not mean ped handle is returned
-- maybe a quick view in disassembly will tell us what is actually does
-- Ped Types:
-- Player = 1
-- Male = 4
-- Female = 5
-- Cop = 6
-- Taxi Driver = 25 (sfink)
-- Human = 26
-- SWAT = 27
-- Animal = 28
-- Army = 29
function Global.CreatePedInsideVehicle(vehicle, pedType, modelHash, seat, isNetwork, p5)
	return _in(0x7DD959874C1FD534, vehicle, pedType, _ch(modelHash), seat, isNetwork, p5, _r, _ri)
end

--- Drops the Hook/Magnet on a cargobob
-- state
-- enum eCargobobHook
-- {
-- CARGOBOB_HOOK = 0,
-- CARGOBOB_MAGNET = 1,
-- };
function Global.CreatePickUpRopeForCargobob(cargobob, state)
	return _in(0x7BEB0C7A235F6F3B, cargobob, state)
end
Global.EnableCargobobHook = Global.CreatePickUpRopeForCargobob

--- Pickup hashes: pastebin.com/8EuSv2r1
function Global.CreatePickup(pickupHash, posX, posY, posZ, p4, value, p6, modelHash)
	return _in(0xFBA08C503DD5FA58, _ch(pickupHash), posX, posY, posZ, p4, value, p6, _ch(modelHash), _r, _ri)
end

--- Pickup hashes: pastebin.com/8EuSv2r1
-- flags:
-- 8 (1 &lt;&lt; 3): place on ground
-- 512 (1 &lt;&lt; 9): spin around
function Global.CreatePickupRotate(pickupHash, posX, posY, posZ, rotX, rotY, rotZ, flag, amount, p9, p10, modelHash)
	return _in(0x891804727E0A98B7, _ch(pickupHash), posX, posY, posZ, rotX, rotY, rotZ, flag, amount, p9, p10, _ch(modelHash), _r, _ri)
end

--- Pickup hashes: pastebin.com/8EuSv2r1
function Global.CreatePortablePickup(pickupHash, x, y, z, placeOnGround, modelHash)
	return _in(0x2EAF1FDB2FB55698, _ch(pickupHash), x, y, z, placeOnGround, _ch(modelHash), _r, _ri)
end

function Global.CreatePortablePickup_2(pickupHash, x, y, z, placeOnGround, modelHash)
	return _in(0x125494B98A21AAF7, _ch(pickupHash), x, y, z, placeOnGround, _ch(modelHash), _r, _ri)
end
Global.N_0x125494b98a21aaf7 = Global.CreatePortablePickup_2

--- vb.net
-- Dim ped_handle As Integer
-- With Game.Player.Character
-- Dim pos As Vector3 = .Position + .ForwardVector * 3
-- ped_handle = Native.Function.Call(Of Integer)(Hash.CREATE_RANDOM_PED, pos.X, pos.Y, pos.Z)
-- End With
-- Creates a Ped at the specified location, returns the Ped Handle.
-- Ped will not act until SET_PED_AS_NO_LONGER_NEEDED is called.
function Global.CreateRandomPed(posX, posY, posZ)
	return _in(0xB4AC7D0CF06BFE8F, posX, posY, posZ, _r, _ri)
end

function Global.CreateRandomPedAsDriver(vehicle, returnHandle)
	return _in(0x9B62392B474F44A0, vehicle, returnHandle, _r, _ri)
end

--- Creates a script vehicle generator at the given coordinates. Most parameters after the model hash are unknown.
-- Parameters:
-- x/y/z - Generator position
-- heading - Generator heading
-- p4 - Unknown (always 5.0)
-- p5 - Unknown (always 3.0)
-- modelHash - Vehicle model hash
-- p7/8/9/10 - Unknown (always -1)
-- p11 - Unknown (usually TRUE, only one instance of FALSE)
-- p12/13 - Unknown (always FALSE)
-- p14 - Unknown (usally FALSE, only two instances of TRUE)
-- p15 - Unknown (always TRUE)
-- p16 - Unknown (always -1)
-- Vector3 coords = GET_ENTITY_COORDS(PLAYER_PED_ID(), 0);	CREATE_SCRIPT_VEHICLE_GENERATOR(coords.x, coords.y, coords.z, 1.0f, 5.0f, 3.0f, GET_HASH_KEY("adder"), -1. -1, -1, -1, -1, true, false, false, false, true, -1);
function Global.CreateScriptVehicleGenerator(x, y, z, heading, p4, p5, modelHash, p7, p8, p9, p10, p11, p12, p13, p14, p15, p16)
	return _in(0x9DEF883114668116, x, y, z, heading, p4, p5, _ch(modelHash), p7, p8, p9, p10, p11, p12, p13, p14, p15, p16, _r, _ri)
end

--- p6 always 2 (but it doesnt seem to matter...)
-- roll and pitch 0
-- yaw to Ped.rotation
function Global.CreateSynchronizedScene(x, y, z, roll, pitch, yaw, p6)
	return _in(0x8C18E0F9080ADD73, x, y, z, roll, pitch, yaw, p6, _r, _ri)
end

--- Creates a tracked point, useful for checking the visibility of a 3D point on screen.
function Global.CreateTrackedPoint()
	return _in(0xE2C9439ED45DEA60, _r, _ri)
end

--- p6 - last parameter does not mean vehicle handle is returned
-- maybe a quick view in disassembly will tell us what is actually does
-- p6 seems to check for something with the script in the disassembly
function Global.CreateVehicle(modelHash, x, y, z, heading, isNetwork, p6)
	return _in(0xAF35D0D2583051B0, _ch(modelHash), x, y, z, heading, isNetwork, p6, _r, _ri)
end

--- Now has 8 params.
function Global.CreateWeaponObject(weaponHash, ammoCount, x, y, z, showWorldModel, heading, p7)
	return _in(0x9541D3CF0D398F36, _ch(weaponHash), ammoCount, x, y, z, showWorldModel, heading, p7, _r, _ri)
end

--- some camera effect that is used in the drunk-cheat, and turned off (by setting it to 0.0) along with the shaking effects once the drunk cheat is disabled.
function Global.CustomMenuCoordinates(p0)
	return _in(0x487A82C650EB7799, p0)
end
Global.N_0x487a82c650eb7799 = Global.CustomMenuCoordinates

function Global.DatafileCreate()
	return _in(0xD27058A1CA2B13EE)
end

function Global.DatafileDelete()
	return _in(0x9AB9C1CFC8862DFB)
end

function Global.DatafileGetFileDict()
	return _in(0x906B778CA1DC72B6, _r, _s)
end
Global.N_0x906b778ca1dc72b6 = Global.DatafileGetFileDict

--- Example:
-- if (!DATAFILE::_BEDB96A7584AA8CF())
-- {
-- if (!g_109E3)
-- {
-- if (((sub_d4f() == 2) == 0) &amp;&amp; (!NETWORK::NETWORK_IS_GAME_IN_PROGRESS()))
-- {
-- if (NETWORK::NETWORK_IS_CLOUD_AVAILABLE())
-- {
-- g_17A8B = 0;
-- }
-- if (!g_D52C)
-- {
-- sub_730();
-- }
-- }
-- }
-- }
function Global.DatafileIsSavePending()
	return _in(0xBEDB96A7584AA8CF, _r)
end
Global.N_0xbedb96a7584aa8cf = Global.DatafileIsSavePending

--- Returns whether or not the specified property is set for the entity.
function Global.DecorExistOn(entity, propertyName)
	return _in(0x05661B80A8C9165F, entity, _ts(propertyName), _r)
end

function Global.DecorGetBool(entity, propertyName)
	return _in(0xDACE671663F2F5DB, entity, _ts(propertyName), _r)
end

--- Console Hash: 0x8DE5382F
-- The native name is correct but the db automatically prefixes "_" to unknown natives when changed.
function Global.DecorGetFloat(entity, propertyName)
	return _in(0x6524A2F114706F43, entity, _ts(propertyName), _r, _rf)
end

function Global.DecorGetInt(entity, propertyName)
	return _in(0xA06C969B02A97298, entity, _ts(propertyName), _r, _ri)
end

--- Is property of that type.
-- 1
-- 2
-- 3
-- 5
function Global.DecorIsRegisteredAsType(propertyName, type)
	return _in(0x4F14F9F870D6FBC8, _ts(propertyName), type, _r)
end

--- Found this in standard_global_init.c4 line 1898
-- void sub_523a() {
-- DECORATOR::DECOR_REGISTER("Player_Vehicle", 3);
-- DECORATOR::DECOR_REGISTER("PV_Slot", 3);
-- DECORATOR::DECOR_REGISTER("Previous_Owner", 3);
-- DECORATOR::DECOR_REGISTER("Sprayed_Vehicle_Decorator", 2);
-- DECORATOR::DECOR_REGISTER("Sprayed_Vehicle_Timer_Dec", 5);
-- DECORATOR::DECOR_REGISTER("Vehicle_Reward", 3);
-- DECORATOR::DECOR_REGISTER("Vehicle_Reward_Teams", 3);
-- DECORATOR::DECOR_REGISTER("Skill_Blocker", 2);
-- DECORATOR::DECOR_REGISTER("TargetPlayerForTeam", 3);
-- DECORATOR::DECOR_REGISTER("XP_Blocker", 2);
-- DECORATOR::DECOR_REGISTER("CrowdControlSetUp", 3);
-- DECORATOR::DECOR_REGISTER("Bought_Drugs", 2);
-- DECORATOR::DECOR_REGISTER("HeroinInPossession", 1);
-- DECORATOR::DECOR_REGISTER("CokeInPossession", 1);
-- DECORATOR::DECOR_REGISTER("WeedInPossession", 1);
-- DECORATOR::DECOR_REGISTER("MethInPossession", 1);
-- DECORATOR::DECOR_REGISTER("bombdec", 3);
-- DECORATOR::DECOR_REGISTER("bombdec1", 3);
-- DECORATOR::DECOR_REGISTER("bombowner", 3);
-- DECORATOR::DECOR_REGISTER("noPlateScan", 2);
-- DECORATOR::DECOR_REGISTER("prisonBreakBoss", 2);
-- DECORATOR::DECOR_REGISTER("cashondeadbody", 3);
-- DECORATOR::DECOR_REGISTER("MissionType", 3);
-- DECORATOR::DECOR_REGISTER("MatchId", 3);
-- DECORATOR::DECOR_REGISTER("TeamId", 3);
-- DECORATOR::DECOR_REGISTER("Not_Allow_As_Saved_Veh", 3);
-- DECORATOR::DECOR_REGISTER("Veh_Modded_By_Player", 3);
-- DECORATOR::DECOR_REGISTER("MPBitset", 3);
-- DECORATOR::DECOR_REGISTER("MC_EntityID", 3);
-- DECORATOR::DECOR_REGISTER("MC_ChasePedID", 3);
-- DECORATOR::DECOR_REGISTER("MC_Team0_VehDeliveredRules", 3);
-- DECORATOR::DECOR_REGISTER("MC_Team1_VehDeliveredRules", 3);
-- DECORATOR::DECOR_REGISTER("MC_Team2_VehDeliveredRules", 3);
-- DECORATOR::DECOR_REGISTER("MC_Team3_VehDeliveredRules", 3);
-- DECORATOR::DECOR_REGISTER("AttributeDamage", 3);
-- DECORATOR::DECOR_REGISTER("GangBackup", 3);
-- DECORATOR::DECOR_REGISTER("CreatedByPegasus", 2);
-- DECORATOR::DECOR_REGISTER("BeforeCorona_0", 2);
-- }
-- -----------------------------------------------------------------------
-- Defines type of property for property name.
-- 1 - float,
-- 2 - bool,
-- 3
-- 5
function Global.DecorRegister(propertyName, type)
	return _in(0x9FD90732F56403CE, _ts(propertyName), type)
end

--- Called after all decorator type initializations.
function Global.DecorRegisterLock()
	return _in(0xA9D14EEA259F9248)
end

function Global.DecorRemove(entity, propertyName)
	return _in(0x00EE9F297C738720, entity, _ts(propertyName), _r)
end

--- This function sets metadata of type bool to specified entity.
function Global.DecorSetBool(entity, propertyName, value)
	return _in(0x6B1E8E2ED1335B71, entity, _ts(propertyName), value, _r)
end

--- Console Hash: 0xBC7BD5CB
-- The native name is correct but the db automatically prefixes "_" to unknown natives when changed.
function Global.DecorSetFloat(entity, propertyName, value)
	return _in(0x211AB1DD8D0F363A, entity, _ts(propertyName), value, _r)
end

--- Sets property to int.
function Global.DecorSetInt(entity, propertyName, value)
	return _in(0x0CE3AA5E1CA19E10, entity, _ts(propertyName), value, _r)
end

function Global.DecorSetTime(entity, propertyName, timestamp)
	return _in(0x95AED7B8E39ECAA4, entity, _ts(propertyName), timestamp, _r)
end

function Global.DeleteAllTrains()
	return _in(0x736A718577F39C7D)
end

function Global.DeleteCheckpoint(checkpoint)
	return _in(0xF5ED37F54CD4D52E, checkpoint)
end

function Global.DeleteChildRope(rope)
	return _in(0xAA5D6B1888E4DB20, rope, _r, _ri)
end

--- Deletes the specified entity, then sets the handle pointed to by the pointer to NULL.
function Global.DeleteEntity(entity)
	return _in(0xAE3CBE5BF394C9C9, _ii(entity) --[[ may be optional ]])
end

function Global.DeleteFunctionReference(referenceIdentity)
	return _in(0x1e86f206, _ts(referenceIdentity))
end

--- Delete an incident with a given id.
-- =======================================================
-- Correction, I have change this to int, instead of int*
-- as it doesn't use a pointer to the createdIncident.
-- If you try it you will crash (or) freeze.
-- =======================================================
function Global.DeleteIncident(incidentId)
	return _in(0x556C1AA270D5A207, incidentId)
end

function Global.DeleteMissionTrain(train)
	return _in(0x5B76B14AE875C795, _ii(train) --[[ may be optional ]])
end

--- Deletes the specified object, then sets the handle pointed to by the pointer to NULL.
function Global.DeleteObject(object)
	return _in(0x539E0AE3E6634B9F, _ii(object) --[[ may be optional ]])
end

--- From the b617d scripts:
-- AI::DELETE_PATROL_ROUTE("miss_merc0");
-- AI::DELETE_PATROL_ROUTE("miss_merc1");
-- AI::DELETE_PATROL_ROUTE("miss_merc2");
-- AI::DELETE_PATROL_ROUTE("miss_dock");
function Global.DeletePatrolRoute(patrolRoute)
	return _in(0x7767DD9D65E91319, _ts(patrolRoute))
end

--- Deletes the specified ped, then sets the handle pointed to by the pointer to NULL.
function Global.DeletePed(ped)
	return _in(0x9614299DCB53E54B, _ii(ped) --[[ may be optional ]])
end

function Global.DeleteResourceKvp(key)
	return _in(0x7389b5df, _ts(key))
end

function Global.DeleteRope(rope)
	return _in(0x52B4829281364649, _ii(rope) --[[ may be optional ]])
end

function Global.DeleteScriptVehicleGenerator(vehicleGenerator)
	return _in(0x22102C9ABFCF125D, vehicleGenerator)
end

function Global.DeleteStuntJump(p0)
	return _in(0xDC518000E39DAE1F, p0)
end

--- Deletes a vehicle.
-- The vehicle must be a mission entity to delete, so call this before deleting: SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true);
-- eg how to use:
-- SET_ENTITY_AS_MISSION_ENTITY(vehicle, true, true);
-- DELETE_VEHICLE(&amp;vehicle);
-- Deletes the specified vehicle, then sets the handle pointed to by the pointer to NULL.
function Global.DeleteVehicle(vehicle)
	return _in(0xEA386986E786A54F, _ii(vehicle) --[[ may be optional ]])
end

--- BOOL param indicates whether the cam should be destroyed if it belongs to the calling script.
function Global.DestroyAllCams(thisScriptCheck)
	return _in(0x8E5FB15663F79120, thisScriptCheck)
end

--- BOOL param indicates whether the cam should be destroyed if it belongs to the calling script.
function Global.DestroyCam(cam, thisScriptCheck)
	return _in(0x865908C81A2C22E9, cam, thisScriptCheck)
end

function Global.DestroyItemset(p0)
	return _in(0xDE18220B1C183EDA, p0)
end

--- Destroys the currently active mobile phone.
function Global.DestroyMobilePhone()
	return _in(0x3BC861DF703E5097)
end

--- Hash collision
function Global.DestroyPlayerInPauseMenu()
	return _in(0x5B74EA8CFD5E3E7E, _r, _ri)
end

function Global.DestroyTrackedPoint(point)
	return _in(0xB25DC90BAD56CA42, point)
end

function Global.DetachCam(cam)
	return _in(0xA2FABBE87F4BAD82, cam)
end

--- p1 and p2 have no effect
-- maybe a quick disassembly will tell us what they do
-- if p2 is set to true, the both entities won't collide with the other until the distance between them is above 4 meters.
-- p1?
function Global.DetachEntity(entity, p1, collision)
	return _in(0x961AC54BF0613F5D, entity, p1, collision)
end

function Global.DetachPortablePickupFromPed(ped)
	return _in(0xCF463D1E9A0AECB1, ped)
end

function Global.DetachRopeFromEntity(rope, entity)
	return _in(0xBCF3026912A8647D, rope, entity)
end

function Global.DetachSynchronizedScene(sceneID)
	return _in(0x6D38F1F04CBB37EA, sceneID)
end

function Global.DetachVehicleFromAnyCargobob(vehicle)
	return _in(0xADF7BE450512C12F, vehicle, _r)
end

function Global.DetachVehicleFromAnyTowTruck(vehicle)
	return _in(0xD0E9CE05A1E68CD8, vehicle, _r)
end

function Global.DetachVehicleFromCargobob(vehicle, cargobob)
	return _in(0x0E21D3DF1051399D, vehicle, cargobob)
end

--- First two parameters swapped. Scripts verify that towTruck is the first parameter, not the second.
function Global.DetachVehicleFromTowTruck(towTruck, vehicle)
	return _in(0xC2DB6B6708350ED8, towTruck, vehicle)
end

--- Public Sub detatchTrailer(vh1 As Vehicle)
-- Native.Function.Call(Hash.DETACH_VEHICLE_FROM_TRAILER, vh1)
-- End Sub
function Global.DetachVehicleFromTrailer(vehicle)
	return _in(0x90532EDF0D2BDD86, vehicle)
end

--- Detaches the vehicle's windscreen.
-- For further information, see : gtaforums.com/topic/859570-glass/#entry1068894566
function Global.DetachVehicleWindscreen(vehicle)
	return _in(0x6D645D59FB5F5AD3, vehicle)
end

function Global.DisableAimCamThisUpdate()
	return _in(0x1A31FE0049E542F6)
end
Global.N_0x1a31fe0049e542f6 = Global.DisableAimCamThisUpdate

function Global.DisableAllControlActions(inputGroup)
	return _in(0x5F4B6931816E599B, inputGroup)
end

function Global.DisableAutomaticRespawn(disableRespawn)
	return _in(0x2C2B3493FBF51C71, disableRespawn)
end

--- Hash collision!!!
-- Returns a blip handle.
function Global.DisableBlipNameForVar()
	return _in(0x5C90988E7C8E1AF4, _r, _ri)
end

--- control values and meaning: github.com/crosire/scripthookvdotnet/blob/dev_v3/source/scripting/Controls.cs
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
-- Control values from the decompiled scripts: 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,
-- 28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,53,5
-- 4,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,
-- 79,80,81,82,85,86,87,88,89,90,91,92,93,95,96,97,98,99,100,101,102,103,105,
-- 107,108,109,110,111,112,113,114,115,116,117,118,119,123,126,129,130,131,132,
-- 133,134,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,
-- 153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,171,172
-- ,177,187,188,189,190,195,196,199,200,201,202,203,205,207,208,209,211,212,213, 217,219,220,221,225,226,230,234,235,236,237,238,239,240,241,242,243,244,257,
-- 261,262,263,264,265,270,271,272,273,274,278,279,280,281,282,283,284,285,286,
-- 287,288,289,337.
-- Example: CONTROLS::DISABLE_CONTROL_ACTION(2, 19, true) disables the switching UI from appearing both when using a keyboard and Xbox 360 controller. Needs to be executed each frame.
-- Control group 1 and 0 gives the same results as 2. Same results for all players.
function Global.DisableControlAction(inputGroup, control, disable)
	return _in(0xFE99B66D079CF6BC, inputGroup, control, disable)
end

--- Disables first person camera for the current frame.
-- Found in decompiled scripts:
-- GRAPHICS::DRAW_DEBUG_TEXT_2D("Disabling First Person Cam", 0.5, 0.8, 0.0, 0, 0, 255, 255);
-- CAM::_DE2EF5DA284CC8DF();
function Global.DisableFirstPersonCamThisFrame()
	return _in(0xDE2EF5DA284CC8DF)
end

function Global.DisableFrontendThisFrame()
	return _in(0x6D3465A73092F0E6)
end

--- The game by default has 5 hospital respawn points. Disabling them all will cause the player to respawn at the last position they were.
-- Doesn't work....
function Global.DisableHospitalRestart(hospitalIndex, toggle)
	return _in(0xC8535819C450EBA8, hospitalIndex, toggle)
end

function Global.DisableInputGroup(inputGroup)
	return _in(0x7F4724035FDCA1DD, inputGroup)
end
Global.N_0x7f4724035fdca1dd = Global.DisableInputGroup

--- Example:
-- This removes the interior from the strip club and when trying to walk inside the player just falls:
-- INTERIOR::DISABLE_INTERIOR(118018, true);
function Global.DisableInterior(interiorID, toggle)
	return _in(0x6170941419D7D8EC, interiorID, toggle)
end

function Global.DisableInteriorProp(interiorID, propName)
	return _in(0x420BD37289EEE162, interiorID, _ts(propName))
end
Global.N_0x420bd37289eee162 = Global.DisableInteriorProp

function Global.DisableNavmeshInArea(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x4C8872D8CDBE1B8B, p0, p1, p2, p3, p4, p5, p6)
end

function Global.DisablePedPainAudio(ped, toggle)
	return _in(0xA9A41C1E940FB0E8, ped, toggle)
end

--- Disables the phone up-button, oddly enough.
-- i.e.: When the phone is out, and this method is called with false as it's parameter, the phone will not be able to scroll up. However, when you use the down arrow key, it's functionality still, works on the phone.
-- When the phone is not out, and this method is called with false as it's parameter, you will not be able to bring up the phone. Although the up arrow key still works for whatever functionality it's used for, just not for the phone.
-- This can be used for creating menu's when trying to disable the phone from being used.
-- You do not have to call the function again with false as a parameter, as soon as the function stops being called, the phone will again be usable.
function Global.DisablePhoneThisFrame(toggle)
	return _in(0x015C49A93E3E086E, toggle)
end
Global.N_0x015c49a93e3e086e = Global.DisablePhoneThisFrame

--- hash collision??? - Don't think so. I fits alphabetically and it used with a plane in the scripts
function Global.DisablePlaneAileron(vehicle, p1, p2)
	return _in(0x23428FC53C60919C, vehicle, p1, p2)
end

--- Inhibits the player from using any method of combat including melee and firearms.
-- NOTE: Only disables the firing for one frame
function Global.DisablePlayerFiring(player, toggle)
	return _in(0x5E6CC07646BBEAB8, player, toggle)
end

function Global.DisablePlayerVehicleRewards(player)
	return _in(0xC142BE3BB9CE125F, player)
end

function Global.DisablePoliceReports()
	return _in(0xB4F90FAF7670B16F)
end
Global.N_0xb4f90faf7670b16f = Global.DisablePoliceReports

--- Disables the spawn point at the police house on the specified index.
-- policeIndex: The police house index.
-- toggle: true to enable the spawn point, false to disable.
function Global.DisablePoliceRestart(policeIndex, toggle)
	return _in(0x23285DED6EBD7EA3, policeIndex, toggle)
end

--- confirmed working
function Global.DisableRadarThisFrame()
	return _in(0x5FBAE526203990C9)
end

function Global.DisableScriptBrainSet(brainSet)
	return _in(0x14D8518E9760F08F, brainSet)
end

function Global.DisableStuntJumpSet(p0)
	return _in(0xA5272EBEDD4747F6, p0)
end

function Global.DisableVehicleDistantlights(toggle)
	return _in(0xC9F98AC1884E73A2, toggle)
end

function Global.DisableVehicleFirstPersonCamThisFrame()
	return _in(0xADFF1B2A555F5FBA)
end

--- if set to true, prevents vehicle sirens from having sound, leaving only the lights.
-- HASH COLLISION !!! Please change to _SET_VEHICLE_SIREN_SOUND
function Global.DisableVehicleImpactExplosionActivation(vehicle, toggle)
	return _in(0xD8050E0EB60CF274, vehicle, toggle)
end

function Global.DisableVehicleWeapon(disabled, weaponHash, vehicle, owner)
	return _in(0xF4FC6A6F67D8D856, disabled, _ch(weaponHash), vehicle, owner)
end

function Global.DisplayAmmoThisFrame(display)
	return _in(0xA5E78BA2B1331C55, display)
end

function Global.DisplayAreaName(toggle)
	return _in(0x276B6CE369C33678, toggle)
end

--- "DISPLAY_CASH(false);" makes the cash amount render on the screen when appropriate
-- "DISPLAY_CASH(true);" disables cash amount rendering
function Global.DisplayCash(toggle)
	return _in(0x96DEC8D5430208B7, toggle)
end

--- Toggles to render distant vehicles. They may not be vehicles but images to look like vehicles.
function Global.DisplayDistantVehicles(toggle)
	return _in(0xF796359A959DF65D, toggle)
end
Global.N_0xf796359a959df65d = Global.DisplayDistantVehicles

--- The messages are localized strings.
-- Examples:
-- "No_bus_money"
-- "Enter_bus"
-- "Tour_help"
-- "LETTERS_HELP2"
-- "Dummy"
-- **The bool appears to always be false (if it even is a bool, as it's represented by a zero)**
-- --------
-- p1 doesn't seem to make a difference, regardless of the state it's in.
-- picture of where this is displayed?
function Global.DisplayHelpTextThisFrame(message, p1)
	return _in(0x960C9FF8F616E41C, _ts(message), p1)
end

--- If Hud should be displayed
function Global.DisplayHud(toggle)
	return _in(0xA6294919E56FF02A, toggle)
end

--- sfink: note, p0 is set to 6 for PC platform in at least 1 script, or to `unk::_get_ui_language_id() == 0` otherwise.
-- NOTE: windowTitle uses text labels, and an invalid value will display nothing.
-- www.gtaforums.com/topic/788343-vrel-script-hook-v/?p=1067380474
-- windowTitle's
-- -----------------
-- CELL_EMAIL_BOD	=	"Enter your Eyefind message"
-- CELL_EMAIL_BODE	=	"Message too long. Try again"
-- CELL_EMAIL_BODF	=	"Forbidden message. Try again"
-- CELL_EMAIL_SOD	=	"Enter your Eyefind subject"
-- CELL_EMAIL_SODE	=	"Subject too long. Try again"
-- CELL_EMAIL_SODF	=	"Forbidden text. Try again"
-- CELL_EMASH_BOD	=	"Enter your Eyefind message"
-- CELL_EMASH_BODE	=	"Message too long. Try again"
-- CELL_EMASH_BODF	=	"Forbidden message. Try again"
-- CELL_EMASH_SOD	=	"Enter your Eyefind subject"
-- CELL_EMASH_SODE	=	"Subject too long. Try again"
-- CELL_EMASH_SODF	=	"Forbidden Text. Try again"
-- FMMC_KEY_TIP10	=	"Enter Synopsis"
-- FMMC_KEY_TIP12	=	"Enter Custom Team Name"
-- FMMC_KEY_TIP12F	=	"Forbidden Text. Try again"
-- FMMC_KEY_TIP12N	=	"Custom Team Name"
-- FMMC_KEY_TIP8	=	"Enter Message"
-- FMMC_KEY_TIP8F	=	"Forbidden Text. Try again"
-- FMMC_KEY_TIP8FS	=	"Invalid Message. Try again"
-- FMMC_KEY_TIP8S	=	"Enter Message"
-- FMMC_KEY_TIP9	=	"Enter Outfit Name"
-- FMMC_KEY_TIP9F	=	"Invalid Outfit Name. Try again"
-- FMMC_KEY_TIP9N	=	"Outfit Name"
-- PM_NAME_CHALL	=	"Enter Challenge Name"
function Global.DisplayOnscreenKeyboard(p0, windowTitle, p2, defaultText, defaultConcat1, defaultConcat2, defaultConcat3, maxInputLength)
	return _in(0x00DC833F2568DBF6, p0, _ts(windowTitle), _ts(p2), _ts(defaultText), _ts(defaultConcat1), _ts(defaultConcat2), _ts(defaultConcat3), maxInputLength)
end

--- only documented to be continued...
function Global.DisplayOnscreenKeyboard_2(p0, windowTitle, defaultText, defaultConcat1, defaultConcat2, defaultConcat3, defaultConcat4, defaultConcat5, defaultConcat6, defaultConcat7, maxInputLength)
	return _in(0xCA78CFA0366592FE, p0, _ts(windowTitle), _i, _ts(defaultText), _ts(defaultConcat1), _ts(defaultConcat2), _ts(defaultConcat3), _ts(defaultConcat4), _ts(defaultConcat5), _ts(defaultConcat6), _ts(defaultConcat7), maxInputLength)
end
Global.N_0xca78cfa0366592fe = Global.DisplayOnscreenKeyboard_2

--- If Minimap / Radar should be displayed.
function Global.DisplayRadar(Toggle)
	return _in(0xA0EBB943C300E693, Toggle, _r, _ri)
end

--- Displays the crosshair for this frame.
function Global.DisplaySniperScopeThisFrame()
	return _in(0x73115226F4814E62)
end

--- Purpose of the BOOL currently unknown.
-- Both, true and false, work
function Global.DisplaySystemSigninUi(unk)
	return _in(0x94DD7888C10A979E, unk)
end

function Global.DisposeSynchronizedScene(scene)
	return _in(0xCD9CC7E200A52A6F, scene)
end
Global.N_0xcd9cc7e200a52a6f = Global.DisposeSynchronizedScene

function Global.DoAutoSave()
	return _in(0x50EEAAD86232EE55)
end

--- Fades the screen in.
-- duration: The time the fade should take, in milliseconds.
function Global.DoScreenFadeIn(duration)
	return _in(0xD4E8E24955024033, duration)
end

--- Fades the screen out.
-- duration: The time the fade should take, in milliseconds.
function Global.DoScreenFadeOut(duration)
	return _in(0x891B5B39AC6302AF, duration)
end

function Global.DoesAnimDictExist(animDict)
	return _in(0x2DA49C3B79856961, _ts(animDict), _r)
end

function Global.DoesBlipExist(blip)
	return _in(0xA6DB27D19ECBB7DA, blip, _r)
end

--- Returns whether or not the passed camera handle exists.
function Global.DoesCamExist(cam)
	return _in(0xA7A932170592B50E, cam, _r)
end

--- Returns true only when the hook is active, will return false if the magnet is active
function Global.DoesCargobobHavePickUpRope(cargobob)
	return _in(0x1821D91AD4B56108, cargobob, _r)
end
Global.IsCargobobHookActive = Global.DoesCargobobHavePickUpRope

--- Returns true only when the magnet is active, will return false if the hook is active
-- console hash 0x4778CA0A
function Global.DoesCargobobHavePickupMagnet(cargobob)
	return _in(0x6E08BF5B3722BAC9, cargobob, _r)
end
Global.IsCargobobMagnetActive = Global.DoesCargobobHavePickupMagnet

function Global.DoesCutsceneEntityExist(cutsceneEntName, modelHash)
	return _in(0x499EF20C5DB25C59, _ts(cutsceneEntName), _ch(modelHash), _r)
end

--- Returns true if a destructible object with this handle exists, false otherwise.
function Global.DoesDesObjectExist(handle)
	return _in(0x52AF537A0C5B8AAD, handle, _r)
end
Global.N_0x52af537a0c5b8aad = Global.DoesDesObjectExist

--- Always used prior a door functions Example
-- if (OBJECT::_DOES_DOOR_EXIST(doorHash))
-- {
-- OBJECT::REMOVE_DOOR_FROM_SYSTEM(doorHash);
-- }
function Global.DoesDoorExist(doorHash)
	return _in(0xC153C43EA202C8C1, _ch(doorHash), _r)
end
Global.N_0xc153c43ea202c8c1 = Global.DoesDoorExist

function Global.DoesEntityBelongToThisScript(entity, p1)
	return _in(0xDDE6DF5AE89981D2, entity, p1, _r)
end

--- Checks if the Entity exists
function Global.DoesEntityExist(entity)
	return _in(0x7239B21A38F536BA, entity, _r)
end

function Global.DoesEntityHaveDrawable(entity)
	return _in(0x060D6E96F8B8E48D, entity, _r)
end

function Global.DoesEntityHavePhysics(entity)
	return _in(0xDA95EA3317CC5064, entity, _r)
end

--- Checks via CVehicleModelInfo
function Global.DoesExtraExist(vehicle, extraId)
	return _in(0x1262D55792428154, vehicle, extraId, _r)
end

function Global.DoesGroupExist(groupId)
	return _in(0x7C6B0C22F9F40BBE, groupId, _r)
end

function Global.DoesNavmeshBlockingObjectExist(p0)
	return _in(0x0EAEB0DB4B132399, p0, _r)
end
Global.N_0x0eaeb0db4b132399 = Global.DoesNavmeshBlockingObjectExist

--- p5 is usually 0.
function Global.DoesObjectOfTypeExistAtCoords(x, y, z, radius, hash, p5)
	return _in(0xBFA48E2FF417213F, x, y, z, radius, _ch(hash), p5, _r)
end

function Global.DoesParticleFxLoopedExist(ptfxHandle)
	return _in(0x74AFEF0D2E1E409B, ptfxHandle, _r)
end

--- Returns whether the ped's blip is controlled by the game.
-- It's the default blip you can see on enemies during freeroam in singleplayer (the one that fades out quickly).
function Global.DoesPedHaveAiBlip(ped)
	return _in(0x15B8ECF844EE67ED, ped, _r)
end

function Global.DoesPickupExist(pickup)
	return _in(0xAFC1CA75AD4074D1, pickup, _r)
end

function Global.DoesPickupObjectExist(pickupObject)
	return _in(0xD9EFB6DBF7DAAEA3, pickupObject, _r)
end

--- Ptr is correct
function Global.DoesRopeExist(rope)
	return _in(0xFD5448BE3111ED96, _ii(rope) --[[ may be optional ]], _r)
end

function Global.DoesScenarioExistInArea(x, y, z, radius, b)
	return _in(0x5A59271FFADD33C1, x, y, z, radius, b, _r)
end

--- Occurrences in the b617d scripts:
-- "ARMY_GUARD",
-- "ARMY_HELI",
-- "Cinema_Downtown",
-- "Cinema_Morningwood",
-- "Cinema_Textile",
-- "City_Banks",
-- "Countryside_Banks",
-- "DEALERSHIP",
-- "GRAPESEED_PLANES",
-- "KORTZ_SECURITY",
-- "LOST_BIKERS",
-- "LSA_Planes",
-- "LSA_Planes",
-- "MP_POLICE",
-- "Observatory_Bikers",
-- "POLICE_POUND1",
-- "POLICE_POUND2",
-- "POLICE_POUND3",
-- "POLICE_POUND4",
-- "POLICE_POUND5"
-- "QUARRY",
-- "SANDY_PLANES",
-- "SCRAP_SECURITY",
-- "SEW_MACHINE",
-- "SOLOMON_GATE",
-- "Triathlon_1_Start",
-- "Triathlon_2_Start",
-- "Triathlon_3_Start"
-- Sometimes used with IS_SCENARIO_GROUP_ENABLED:
-- if (AI::DOES_SCENARIO_GROUP_EXIST("Observatory_Bikers") &amp;&amp; (!AI::IS_SCENARIO_GROUP_ENABLED("Observatory_Bikers"))) {
-- else if (AI::IS_SCENARIO_GROUP_ENABLED("BLIMP")) {
function Global.DoesScenarioGroupExist(scenarioGroup)
	return _in(0xF9034C136C9E00D3, _ts(scenarioGroup), _r)
end

function Global.DoesScenarioOfTypeExistInArea(p0, p1, p2, p4, p5)
	return _in(0x0A9D0C2A3BBC86C1, p0, p1, p2, _i, p4, p5, _r)
end

--- For a full list, see here: pastebin.com/yLNWicUi
function Global.DoesScriptExist(scriptName)
	return _in(0xFC04745FBE67C19A, _ts(scriptName), _r)
end

function Global.DoesScriptVehicleGeneratorExist(vehicleGenerator)
	return _in(0xF6086BC836400876, vehicleGenerator, _r)
end

--- formerly _IS_STREAMED_SCRIPT_RUNNING
-- Jenkins hash: 0x19EAE282
function Global.DoesScriptWithNameHashExist(scriptHash)
	return _in(0xF86AA3C56BA31381, _ch(scriptHash), _r)
end
Global.N_0xf86aa3c56ba31381 = Global.DoesScriptWithNameHashExist

--- Checks if there is a cover point at position
function Global.DoesScriptedCoverPointExistAtCoords(x, y, z)
	return _in(0xA98B8E3C088E5A31, x, y, z, _r)
end

function Global.DoesTextBlockExist(gxt)
	return _in(0x1C7302E725259789, _ts(gxt), _r)
end

--- Checks if the passed gxt name exists in the game files.
function Global.DoesTextLabelExist(gxt)
	return _in(0xAC09CA973C564252, _ts(gxt), _r)
end

function Global.DoesVehicleExistWithDecorator(decorator)
	return _in(0x956B409B984D9BF7, _ts(decorator), _r)
end

--- This function is called before ADD_CLAN_DECAL_TO_VEHICLE to see if it needs to run. IDK if it's for clan decal or not, but the 2nd parameter might be decal index? It's always passed 0. Not sure what this function really does. But it does return 0 if the clan tag is not on, and 1 if it is.
function Global.DoesVehicleHaveDecal(vehicle, p1)
	return _in(0x060D935D3981A275, vehicle, p1, _r)
end
Global.HasVehicleGotDecal = Global.DoesVehicleHaveDecal

function Global.DoesVehicleHaveRoof(vehicle)
	return _in(0x8AC862B0B32C5B80, vehicle, _r)
end

--- Maximum amount of vehicles with vehicle stuck check appears to be 16.
function Global.DoesVehicleHaveStuckVehicleCheck(vehicle)
	return _in(0x57E4C39DE5EE8470, vehicle, _r)
end

function Global.DoesVehicleHaveWeapons(vehicle)
	return _in(0x25ECB9F8017D98E0, vehicle, _r)
end

function Global.DoesWeaponTakeWeaponComponent(weaponHash, componentHash)
	return _in(0x5CEE3DF569CECAB0, _ch(weaponHash), _ch(componentHash), _r)
end

--- when you set locked to 0 the door open and to 1 the door close
-- OBJECT::_9B12F9A24FABEDB0(${prop_gate_prison_01}, 1845.0, 2605.0, 45.0, 0, 0.0, 50.0, 0);  //door open
-- OBJECT::_9B12F9A24FABEDB0(${prop_gate_prison_01}, 1845.0, 2605.0, 45.0, 1, 0.0, 50.0, 0);  //door close
-- p5-7 - Rot?
function Global.DoorControl(doorHash, x, y, z, locked, p5, p6, p7)
	return _in(0x9B12F9A24FABEDB0, _ch(doorHash), x, y, z, locked, p5, p6, p7)
end

--- Downloads prod.cloud.rockstargames.com/titles/gta5/&lt;platform&gt;/check.json in the same manner that NETWORK_REQUEST_CLOUD_TUNABLES downloads the tunables.
function Global.DownloadCheck()
	return _in(0x4F18196C8D38768D)
end
Global.N_0x4f18196c8d38768d = Global.DownloadCheck

--- x,y,z = start pos
-- x2,y2,z2 = end pos
-- Draw's a 3D Box between the two x,y,z coords.
-- --------------
-- Keep in mind that the edges of the box do only align to the worlds base-vectors. Therefore something like rotation cannot be applied. That means this function is pretty much useless, unless you want a static unicolor box somewhere.
-- I recommend using a predefined function to call this.
-- [VB.NET]
-- Public Sub DrawBox(a As Vector3, b As Vector3, col As Color)
-- [Function].Call(Hash.DRAW_BOX,a.X, a.Y, a.Z,b.X, b.Y, b.Z,col.R, col.G, col.B, col.A)
-- End Sub
-- [C#]
-- public void DrawBox(Vector3 a, Vector3 b, Color col)
-- {
-- Function.Call(Hash.DRAW_BOX,a.X, a.Y, a.Z,b.X, b.Y, b.Z,col.R, col.G, col.B, col.A);
-- }
function Global.DrawBox(x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
	return _in(0xD3A9971CADAC7252, x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugBox(x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
	return _in(0x083A2CA4F2E573BD, x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugCross(x, y, z, size, red, green, blue, alpha)
	return _in(0x73B1189623049839, x, y, z, size, red, green, blue, alpha)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugLine(x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
	return _in(0x7FDFADE676AA3CB0, x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugLineWithTwoColours(x1, y1, z1, x2, y2, z2, r1, g1, b1, r2, g2, b2, alpha1, alpha2)
	return _in(0xD8B9A8AC5608FF94, x1, y1, z1, x2, y2, z2, r1, g1, b1, r2, g2, b2, alpha1, alpha2)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugSphere(x, y, z, radius, red, green, blue, alpha)
	return _in(0xAAD68E1AB39DA632, x, y, z, radius, red, green, blue, alpha)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugText(text, x, y, z, red, green, blue, alpha)
	return _in(0x3903E216620488E8, _ts(text), x, y, z, red, green, blue, alpha)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.DrawDebugText_2d(text, x, y, z, red, green, blue, alpha)
	return _in(0xA3BB2E9555C05A8F, _ts(text), x, y, z, red, green, blue, alpha)
end

function Global.DrawLightWithRange(posX, posY, posZ, colorR, colorG, colorB, range, intensity)
	return _in(0xF2A1B2771A01DBD4, posX, posY, posZ, colorR, colorG, colorB, range, intensity)
end

function Global.DrawLightWithRangeAndShadow(x, y, z, r, g, b, range, intensity, shadow)
	return _in(0xF49E9A9716A04595, x, y, z, r, g, b, range, intensity, shadow)
end
Global.DrawLightWithRangeWithShadow = Global.DrawLightWithRangeAndShadow

--- Draws a depth-tested line from one point to another.
-- ----------------
-- x1, y1, z1 : Coordinates for the first point
-- x2, y2, z2 : Coordinates for the second point
-- r, g, b, alpha : Color with RGBA-Values
-- I recommend using a predefined function to call this.
-- [VB.NET]
-- Public Sub DrawLine(from As Vector3, [to] As Vector3, col As Color)
-- [Function].Call(Hash.DRAW_LINE, from.X, from.Y, from.Z, [to].X, [to].Y, [to].Z, col.R, col.G, col.B, col.A)
-- End Sub
-- [C#]
-- public void DrawLine(Vector3 from, Vector3 to, Color col)
-- {
-- Function.Call(Hash.DRAW_LINE, from.X, from.Y, from.Z, to.X, to.Y, to.Z, col.R, col.G, col.B, col.A);
-- }
function Global.DrawLine(x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
	return _in(0x6B7256074AE34680, x1, y1, z1, x2, y2, z2, red, green, blue, alpha)
end

--- enum MarkerTypes
-- {
-- MarkerTypeUpsideDownCone = 0,
-- MarkerTypeVerticalCylinder = 1,
-- MarkerTypeThickChevronUp = 2,
-- MarkerTypeThinChevronUp = 3,
-- MarkerTypeCheckeredFlagRect = 4,
-- MarkerTypeCheckeredFlagCircle = 5,
-- MarkerTypeVerticleCircle = 6,
-- MarkerTypePlaneModel = 7,
-- MarkerTypeLostMCDark = 8,
-- MarkerTypeLostMCLight = 9,
-- MarkerTypeNumber0 = 10,
-- MarkerTypeNumber1 = 11,
-- MarkerTypeNumber2 = 12,
-- MarkerTypeNumber3 = 13,
-- MarkerTypeNumber4 = 14,
-- MarkerTypeNumber5 = 15,
-- MarkerTypeNumber6 = 16,
-- MarkerTypeNumber7 = 17,
-- MarkerTypeNumber8 = 18,
-- MarkerTypeNumber9 = 19,
-- MarkerTypeChevronUpx1 = 20,
-- MarkerTypeChevronUpx2 = 21,
-- MarkerTypeChevronUpx3 = 22,
-- MarkerTypeHorizontalCircleFat = 23,
-- MarkerTypeReplayIcon = 24,
-- MarkerTypeHorizontalCircleSkinny = 25,
-- MarkerTypeHorizontalCircleSkinny_Arrow = 26,
-- MarkerTypeHorizontalSplitArrowCircle = 27,
-- MarkerTypeDebugSphere = 28,
-- MarkerTypeDallorSign = 29,
-- MarkerTypeHorizontalBars = 30,
-- MarkerTypeWolfHead = 31
-- };
-- dirX/Y/Z represent a heading on each axis in which the marker should face, alternatively you can rotate each axis independently with rotX/Y/Z (and set dirX/Y/Z all to 0).
-- faceCamera - Rotates only the y-axis (the heading) towards the camera
-- p19 - no effect, default value in script is 2
-- rotate - Rotates only on the y-axis (the heading)
-- textureDict - Name of texture dictionary to load texture from (e.g. "GolfPutting")
-- textureName - Name of texture inside dictionary to load (e.g. "PuttingMarker")
-- drawOnEnts - Draws the marker onto any entities that intersect it
-- basically what he said, except textureDict and textureName are totally not char*, or if so, then they are always set to 0/NULL/nullptr in every script I checked, eg:
-- bj.c: graphics::draw_marker(6, vParam0, 0f, 0f, 1f, 0f, 0f, 0f, 4f, 4f, 4f, 240, 200, 80, iVar1, 0, 0, 2, 0, 0, 0, false);
-- his is what I used to draw an amber downward pointing chevron "V", has to be redrawn every frame.  The 180 is for 180 degrees rotation around the Y axis, the 50 is alpha, assuming max is 100, but it will accept 255.
-- GRAPHICS::DRAW_MARKER(2, v.x, v.y, v.z + 2, 0, 0, 0, 0, 180, 0, 2, 2, 2, 255, 128, 0, 50, 0, 1, 1, 0, 0, 0, 0);
function Global.DrawMarker(type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, textureDict, textureName, drawOnEnts)
	return _in(0x28477EC23D892089, type, posX, posY, posZ, dirX, dirY, dirZ, rotX, rotY, rotZ, scaleX, scaleY, scaleZ, red, green, blue, alpha, bobUpAndDown, faceCamera, p19, rotate, _ts(textureDict), _ts(textureName), drawOnEnts)
end

--- Draws a notification above the map and returns the notifications handle
-- Color syntax:
-- ~r~ = Red
-- ~b~ = Blue
-- ~g~ = Green
-- ~y~ = Yellow
-- ~p~ = Purple
-- ~o~ = Orange
-- ~c~ = Grey
-- ~m~ = Darker Grey
-- ~u~ = Black
-- ~n~ = New Line
-- ~s~ = Default White
-- ~w~ = White
-- ~h~ = Bold Text
-- ~nrt~ = ???
-- Special characters:
-- ?? = Rockstar Verified Icon (U+00A6:Broken Bar - Alt+0166)
-- ?? = Rockstar Icon (U+00F7:Division Sign - Alt+0247)
-- ??? = Rockstar Icon 2 (U+2211:N-Ary Summation)
-- Example C#:
-- Function.Call(Hash._ADD_TEXT_COMPONENT_STRING3, "Now I need you to bring the ~b~vehicle~w~ back to me!");
function Global.DrawNotification(blink, p1)
	return _in(0x2ED7843F8F801023, blink, p1, _r, _ri)
end

--- Example:
-- UI::_SET_NOTIFICATION_TEXT_ENTRY("HUNT");
-- UI::_0xAA295B6F28BD587D("Hunting", "Hunting_Gold_128", 0, 109, "HUD_MED_UNLKED");
function Global.DrawNotificationIcon(p0, p1, p2, p3, p4)
	return _in(0xAA295B6F28BD587D, _ts(p0), _ts(p1), p2, p3, _ts(p4), _r, _ri)
end
Global.N_0xaa295b6f28bd587d = Global.DrawNotificationIcon

function Global.DrawNotification_2(blink, p1)
	return _in(0x44FA03975424A0EE, blink, p1, _r, _ri)
end

function Global.DrawNotification_3(blink, p1)
	return _in(0x378E809BF61EC840, blink, p1, _r, _ri)
end

function Global.DrawNotification_4(blink, p1)
	return _in(0xF020C96915705B3A, blink, p1, _r, _ri)
end

--- x/y/z - Location of a vertex (in world coords), presumably.
-- ----------------
-- x1, y1, z1     : Coordinates for the first point
-- x2, y2, z2     : Coordinates for the second point
-- x3, y3, z3     : Coordinates for the third point
-- r, g, b, alpha : Color with RGBA-Values
-- Keep in mind that only one side of the drawn triangle is visible: It's the side, in which the vector-product of the vectors heads to: (b-a)x(c-a) Or (b-a)x(c-b).
-- But be aware: The function seems to work somehow differently. I have trouble having them drawn in rotated orientation. Try it yourself and if you somehow succeed, please edit this and post your solution.
-- I recommend using a predefined function to call this.
-- [VB.NET]
-- Public Sub DrawPoly(a As Vector3, b As Vector3, c As Vector3, col As Color)
-- [Function].Call(Hash.DRAW_POLY, a.X, a.Y, a.Z, b.X, b.Y, b.Z, c.X, c.Y, c.Z, col.R, col.G, col.B, col.A)
-- End Sub
-- [C#]
-- public void DrawPoly(Vector3 a, Vector3 b, Vector3 c, Color col)
-- {
-- Function.Call(Hash.DRAW_POLY, a.X, a.Y, a.Z, b.X, b.Y, b.Z, c.X, c.Y, c.Z, col.R, col.G, col.B, col.A);
-- }
-- BTW: Intersecting triangles are not supported: They overlap in the order they were called.
function Global.DrawPoly(x1, y1, z1, x2, y2, z2, x3, y3, z3, red, green, blue, alpha)
	return _in(0xAC26716048436851, x1, y1, z1, x2, y2, z2, x3, y3, z3, red, green, blue, alpha)
end

--- Draws a rectangle on the screen.
-- -x: The relative X point of the center of the rectangle. (0.0-1.0, 0.0 is the left edge of the screen, 1.0 is the right edge of the screen)
-- -y: The relative Y point of the center of the rectangle. (0.0-1.0, 0.0 is the top edge of the screen, 1.0 is the bottom edge of the screen)
-- -width: The relative width of the rectangle. (0.0-1.0, 1.0 means the whole screen width)
-- -height: The relative height of the rectangle. (0.0-1.0, 1.0 means the whole screen height)
-- -R: Red part of the color. (0-255)
-- -G: Green part of the color. (0-255)
-- -B: Blue part of the color. (0-255)
-- -A: Alpha part of the color. (0-255, 0 means totally transparent, 255 means totally opaque)
-- The total number of rectangles to be drawn in one frame is apparently limited to 399.
function Global.DrawRect(x, y, width, height, r, g, b, a)
	return _in(0x3A618A217E5154F0, x, y, width, height, r, g, b, a)
end

function Global.DrawScaleformMovie(scaleformHandle, x, y, width, height, red, green, blue, alpha, unk)
	return _in(0x54972ADAF0294A93, scaleformHandle, x, y, width, height, red, green, blue, alpha, unk)
end

--- unk is not used so no need
function Global.DrawScaleformMovieFullscreen(scaleform, red, green, blue, alpha, unk)
	return _in(0x0DF606929C105BE1, scaleform, red, green, blue, alpha, unk)
end

function Global.DrawScaleformMovieFullscreenMasked(scaleform1, scaleform2, red, green, blue, alpha)
	return _in(0xCF537FDE4FBD4CE5, scaleform1, scaleform2, red, green, blue, alpha)
end

function Global.DrawScaleformMovie_3d(scaleform, posX, posY, posZ, rotX, rotY, rotZ, p7, p8, p9, scaleX, scaleY, scaleZ, p13)
	return _in(0x87D51D72255D4E78, scaleform, posX, posY, posZ, rotX, rotY, rotZ, p7, p8, p9, scaleX, scaleY, scaleZ, p13)
end
Global.N_0x87d51d72255d4e78 = Global.DrawScaleformMovie_3d

--- what the heck does this one do differently from the one above?
function Global.DrawScaleformMovie_3dNonAdditive(scaleform, posX, posY, posZ, rotX, rotY, rotZ, p7, p8, p9, scaleX, scaleY, scaleZ, p13)
	return _in(0x1CE592FDC749D6F5, scaleform, posX, posY, posZ, rotX, rotY, rotZ, p7, p8, p9, scaleX, scaleY, scaleZ, p13)
end
Global.N_0x1ce592fdc749d6f5 = Global.DrawScaleformMovie_3dNonAdditive

--- Parameters:
-- * pos - coordinate where the spotlight is located
-- * dir - the direction vector the spotlight should aim at from its current position
-- * r,g,b - color of the spotlight
-- * distance - the maximum distance the light can reach
-- * brightness - the brightness of the light
-- * roundness - "smoothness" of the circle edge
-- * radius - the radius size of the spotlight
-- * falloff - the falloff size of the light's edge (example: www.i.imgur.com/DemAWeO.jpg)
-- Example in C# (spotlight aims at the closest vehicle):
-- Vector3 myPos = Game.Player.Character.Position;
-- Vehicle nearest = World.GetClosestVehicle(myPos , 1000f);
-- Vector3 destinationCoords = nearest.Position;
-- Vector3 dirVector = destinationCoords - myPos;
-- dirVector.Normalize();
-- Function.Call(Hash.DRAW_SPOT_LIGHT, pos.X, pos.Y, pos.Z, dirVector.X, dirVector.Y, dirVector.Z, 255, 255, 255, 100.0f, 1f, 0.0f, 13.0f, 1f);
function Global.DrawSpotLight(posX, posY, posZ, dirX, dirY, dirZ, colorR, colorG, colorB, distance, brightness, roundness, radius, falloff)
	return _in(0xD0F64B265C8C8B33, posX, posY, posZ, dirX, dirY, dirZ, colorR, colorG, colorB, distance, brightness, roundness, radius, falloff)
end

function Global.DrawSpotLightWithShadow(posX, posY, posZ, dirX, dirY, dirZ, colorR, colorG, colorB, distance, brightness, roundness, radius, falloff, shadow)
	return _in(0x5BCA583A583194DB, posX, posY, posZ, dirX, dirY, dirZ, colorR, colorG, colorB, distance, brightness, roundness, radius, falloff, shadow)
end

--- Draws a 2D sprite on the screen.
-- Parameters:
-- textureDict - Name of texture dictionary to load texture from (e.g. "CommonMenu", "MPWeaponsCommon", etc.)
-- textureName - Name of texture to load from texture dictionary (e.g. "last_team_standing_icon", "tennis_icon", etc.)
-- screenX/Y - Screen offset (0.5 = center)
-- scaleX/Y - Texture scaling. Negative values can be used to flip the texture on that axis. (0.5 = half)
-- heading - Texture rotation in degrees (default = 0.0) positive is clockwise, measured in degrees
-- red,green,blue - Sprite color (default = 255/255/255)
-- alpha - if set to '2' it will grab all entitys in the game on call
-- alpha - why would it do that and where would it output the entites. And shouldn't it the alpha color for this param?
function Global.DrawSprite(textureDict, textureName, screenX, screenY, width, height, heading, red, green, blue, alpha)
	return _in(0xE7FFAE5EBF23D890, _ts(textureDict), _ts(textureName), screenX, screenY, width, height, heading, red, green, blue, alpha)
end

--- All calls to this native are preceded by calls to GRAPHICS::_0x61BB1D9B3A95D802 and GRAPHICS::_0xC6372ECD45D73BCD, respectively.
-- "act_cinema.ysc", line 1483:
-- UI::SET_HUD_COMPONENT_POSITION(15, 0.0, -0.0375);
-- UI::SET_TEXT_RENDER_ID(l_AE);
-- GRAPHICS::_0x61BB1D9B3A95D802(4);
-- GRAPHICS::_0xC6372ECD45D73BCD(1);
-- if (GRAPHICS::_0x0AD973CA1E077B60(${movie_arthouse})) {
-- GRAPHICS::DRAW_TV_CHANNEL(0.5, 0.5, 0.7375, 1.0, 0.0, 255, 255, 255, 255);
-- } else {
-- GRAPHICS::DRAW_TV_CHANNEL(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255);
-- }
-- "am_mp_property_int.ysc", line 102545:
-- if (ENTITY::DOES_ENTITY_EXIST(a_2._f3)) {
-- if (UI::IS_NAMED_RENDERTARGET_LINKED(ENTITY::GET_ENTITY_MODEL(a_2._f3))) {
-- UI::SET_TEXT_RENDER_ID(a_2._f1);
-- GRAPHICS::_0x61BB1D9B3A95D802(4);
-- GRAPHICS::_0xC6372ECD45D73BCD(1);
-- GRAPHICS::DRAW_TV_CHANNEL(0.5, 0.5, 1.0, 1.0, 0.0, 255, 255, 255, 255);
-- if (GRAPHICS::GET_TV_CHANNEL() == -1) {
-- sub_a8fa5(a_2, 1);
-- } else {
-- sub_a8fa5(a_2, 1);
-- GRAPHICS::ATTACH_TV_AUDIO_TO_ENTITY(a_2._f3);
-- }
-- UI::SET_TEXT_RENDER_ID(UI::GET_DEFAULT_SCRIPT_RENDERTARGET_RENDER_ID());
-- }
-- }
function Global.DrawTvChannel(xPos, yPos, xScale, yScale, rotation, red, green, blue, alpha)
	return _in(0xFDDC2B4ED3C69DF0, xPos, yPos, xScale, yScale, rotation, red, green, blue, alpha)
end

function Global.DuplicateFunctionReference(referenceIdentity)
	return _in(0xf4e2079d, _ts(referenceIdentity), _r, _s)
end

--- All found occurrences in b678d:
-- pastebin.com/ceu67jz8
-- Still not sure on the functionality of this native but it has something to do with dynamic mixer groups defined in dynamix.dat15
function Global.DynamicMixerRelatedFn(p0, p1, p2)
	return _in(0x153973AB99FE8980, p0, _ts(p1), p2)
end
Global.N_0x153973ab99fe8980 = Global.DynamicMixerRelatedFn

function Global.EjectJb700Roof(vehicle, x, y, z)
	return _in(0xE38CB9D7D39FDBCC, vehicle, x, y, z)
end
Global.N_0xe38cb9d7d39fdbcc = Global.EjectJb700Roof

function Global.EnableAlienBloodVfx(Toggle)
	return _in(0x9DCE1F0F78260875, Toggle)
end
Global.N_0x9dce1f0f78260875 = Global.EnableAlienBloodVfx

function Global.EnableAllControlActions(inputGroup)
	return _in(0xA5FFE9B05F199DE7, inputGroup)
end

--- Creates cartoon effect when Michel smokes the weed
function Global.EnableClownBloodVfx(toggle)
	return _in(0xD821490579791273, toggle)
end
Global.SetCameraEndtime = Global.EnableClownBloodVfx

--- control values and meaning: github.com/crosire/scripthookvdotnet/blob/dev/source/scripting/Controls.hpp
-- 0, 1 and 2 used in the scripts.
-- Control values from the decompiled scripts:
-- 0,1,2,3,4,5,6,8,9,10,11,14,15,16,17,19,21,22,24,25,26,30,31,32,33,34,35,36,
-- 37,44,46,47,59,60,65,68,69,70,71,72,73,74,75,76,79,80,81,82,86,95,98,99,100
-- ,101,114,140,141,143,172,173,174,175,176,177,178,179,180,181,187,188,189,19
-- 0,195,196,197,198,199,201,202,203,204,205,206,207,208,209,210,217,218,219,2
-- 20,221,225,228,229,230,231,234,235,236,237,238,239,240,241,242,245,246,257,
-- 261,262,263,264,286,287,288,289,337,338,339,340,341,342,343
-- INPUTGROUP_MOVE
-- INPUTGROUP_LOOK
-- INPUTGROUP_WHEEL
-- INPUTGROUP_CELLPHONE_NAVIGATE
-- INPUTGROUP_CELLPHONE_NAVIGATE_UD
-- INPUTGROUP_CELLPHONE_NAVIGATE_LR
-- INPUTGROUP_FRONTEND_DPAD_ALL
-- INPUTGROUP_FRONTEND_DPAD_UD
-- INPUTGROUP_FRONTEND_DPAD_LR
-- INPUTGROUP_FRONTEND_LSTICK_ALL
-- INPUTGROUP_FRONTEND_RSTICK_ALL
-- INPUTGROUP_FRONTEND_GENERIC_UD
-- INPUTGROUP_FRONTEND_GENERIC_LR
-- INPUTGROUP_FRONTEND_GENERIC_ALL
-- INPUTGROUP_FRONTEND_BUMPERS
-- INPUTGROUP_FRONTEND_TRIGGERS
-- INPUTGROUP_FRONTEND_STICKS
-- INPUTGROUP_SCRIPT_DPAD_ALL
-- INPUTGROUP_SCRIPT_DPAD_UD
-- INPUTGROUP_SCRIPT_DPAD_LR
-- INPUTGROUP_SCRIPT_LSTICK_ALL
-- INPUTGROUP_SCRIPT_RSTICK_ALL
-- INPUTGROUP_SCRIPT_BUMPERS
-- INPUTGROUP_SCRIPT_TRIGGERS
-- INPUTGROUP_WEAPON_WHEEL_CYCLE
-- INPUTGROUP_FLY
-- INPUTGROUP_SUB
-- INPUTGROUP_VEH_MOVE_ALL
-- INPUTGROUP_CURSOR
-- INPUTGROUP_CURSOR_SCROLL
-- INPUTGROUP_SNIPER_ZOOM_SECONDARY
-- INPUTGROUP_VEH_HYDRAULICS_CONTROL
-- Took those in IDA Pro.Not sure in which order they go
function Global.EnableControlAction(inputGroup, control, enable)
	return _in(0x351220255D64C155, inputGroup, control, enable)
end

--- Shows the crosshair even if it wouldn't show normally. Only works for one frame, so make sure to call it repeatedly.
function Global.EnableCrosshairThisFrame()
	return _in(0xEA7F0AD7E9BA676F)
end

--- Please change back to _0x4895BDEA16E7C080 (hash collision)
function Global.EnableDeathbloodSeethrough(p0)
	return _in(0x4895BDEA16E7C080, p0)
end

--- Found dispatch service types in the exe:
-- enum eDispatchServiceType
-- {
-- PoliceAutomobileDispatch = 1,
-- PoliceHelicopterDispatch = 2,
-- FireDepartmentDispatch = 3,
-- SwatAutomobileDispatch = 4,
-- AmbulanceDepartmentDispatch = 5,
-- PoliceRidersDispatch = 6,
-- PoliceVehicleRequest = 7,
-- PoliceRoadBlockDispatch = 8,
-- GangDispatch = 11,
-- SwatHelicopterDispatch = 12,
-- PoliceBoatDispatch = 13,
-- ArmyVehicleDispatch = 14,
-- BikerBackupDispatch = 15
-- };
-- By making toggle false it disables the dispatch.
-- curious if this is what they used when you toggled on and off cops in a GTA IV freemode you hosted. Sad they got rid of the option to make a private session without cops.
-- Also on x360 seems with or without neverWanted on, setting these to all false in SP of course doesn't seem to work. I would understand getting stars, but cops are still dispatched and combat you.
function Global.EnableDispatchService(dispatchService, toggle)
	return _in(0xDC0F817884CDD856, dispatchService, toggle)
end
Global.N_0xdc0f817884cdd856 = Global.EnableDispatchService

--- More info: http://gtaforums.com/topic/836367-adding-props-to-interiors/
function Global.EnableInteriorProp(interiorID, propName)
	return _in(0x55E86AF2712B36A1, interiorID, _ts(propName))
end
Global.N_0x55e86af2712b36a1 = Global.EnableInteriorProp

--- Enables laser sight on any weapon.
-- It doesn't work. Neither on tick nor OnKeyDown
function Global.EnableLaserSightRendering(toggle)
	return _in(0xC8B46D7727D864AA, toggle)
end

function Global.EnableMovieSubtitles(toggle)
	return _in(0x873FA65C778AD970, toggle)
end

function Global.EnableScriptBrainSet(brainSet)
	return _in(0x67AA4D73F0CFA86B, brainSet)
end

function Global.EnableSpecialAbility(player, toggle)
	return _in(0x181EC197DAEFE121, player, toggle)
end

function Global.EnableStuntJumpSet(p0)
	return _in(0xE369A5783B866016, p0)
end

--- Makes the ped jump around like they're in a tennis match
function Global.EnableTennisMode(ped, toggle, p2)
	return _in(0x28A04B411933F8A6, ped, toggle, p2)
end

function Global.EndFindKvp(handle)
	return _in(0xb3210203, handle)
end

function Global.EndFindObject(findHandle)
	return _in(0xdeda4e50, findHandle)
end

function Global.EndFindPed(findHandle)
	return _in(0x9615c2ad, findHandle)
end

function Global.EndFindPickup(findHandle)
	return _in(0x3c407d53, findHandle)
end

function Global.EndFindVehicle(findHandle)
	return _in(0x9227415a, findHandle)
end

function Global.EndReplayStats()
	return _in(0xA23E821FBDF8A5F2)
end

function Global.EndSrl()
	return _in(0x0A41540E63C9EE17)
end

function Global.EndTextCommandClearPrint()
	return _in(0xFCC75460ABA29378)
end
Global.N_0xfcc75460aba29378 = Global.EndTextCommandClearPrint

--- shape goes from -1 to 50 (may be more).
-- p0 is always 0.
-- Example:
-- void FloatingHelpText(char* text)
-- {
-- BEGIN_TEXT_COMMAND_DISPLAY_HELP("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- END_TEXT_COMMAND_DISPLAY_HELP (0, 0, 1, -1);
-- }
-- Image:
-- - imgbin.org/images/26209.jpg
-- more inputs/icons:
-- - pastebin.com/nqNYWMSB
-- Used to be known as _DISPLAY_HELP_TEXT_FROM_STRING_LABEL
function Global.EndTextCommandDisplayHelp(p0, loop, beep, shape)
	return _in(0x238FFE5C7B0498A6, p0, loop, beep, shape)
end
Global.DisplayHelpTextFromStringLabel = Global.EndTextCommandDisplayHelp

--- After applying the properties to the text (See UI::SET_TEXT_), this will draw the text in the applied position. Also 0.0f &lt; x, y &lt; 1.0f, percentage of the axis.
-- Used to be known as _DRAW_TEXT
function Global.EndTextCommandDisplayText(x, y)
	return _in(0xCD015E5BB0D96A57, x, y)
end
Global.DrawText = Global.EndTextCommandDisplayText

--- Determines how many lines the text string will use when drawn on screen.
-- Must use 0x521FB041D93DD0E4 for setting up
function Global.EndTextCommandGetLineCount(x, y)
	return _in(0x9040DFB09BE75706, x, y, _r, _ri)
end
Global.N_0x9040dfb09be75706 = Global.EndTextCommandGetLineCount

--- In scripts font most of the time is passed as 1.
-- Use _BEGIN_TEXT_COMMAND_WIDTH
-- param is not font from what i've tested
function Global.EndTextCommandGetWidth(font)
	return _in(0x85F061DA64ED2F67, font, _r, _rf)
end
Global.GetTextScreenWidth = Global.EndTextCommandGetWidth

function Global.EndTextCommandIsMessageDisplayed()
	return _in(0x8A9BA1AB3E237613, _r)
end
Global.N_0x8a9ba1ab3e237613 = Global.EndTextCommandIsMessageDisplayed

function Global.EndTextCommandIsThisHelpMessageBeingDisplayed(p0)
	return _in(0x10BDDBFC529428DD, p0, _r)
end
Global.N_0x10bddbfc529428dd = Global.EndTextCommandIsThisHelpMessageBeingDisplayed

function Global.EndTextCommandObjective(p0)
	return _in(0xCFDBDF5AE59BA0F4, p0)
end
Global.N_0xcfdbdf5ae59ba0f4 = Global.EndTextCommandObjective

--- Draws the subtitle at middle center of the screen.
-- int duration = time in milliseconds to show text on screen before disappearing
-- drawImmediately = If true, the text will be drawn immediately, if false, the text will be drawn after the previous subtitle has finished
-- Used to be known as _DRAW_SUBTITLE_TIMED
function Global.EndTextCommandPrint(duration, drawImmediately)
	return _in(0x9D77056A530643F6, duration, drawImmediately)
end
Global.DrawSubtitleTimed = Global.EndTextCommandPrint

function Global.EndTextCommandScaleformString()
	return _in(0x362E2D3FE93A9959)
end
Global.EndTextComponent = Global.EndTextCommandScaleformString

function Global.EndTextCommandScaleformString_2()
	return _in(0xAE4E8157D9ECF087)
end
Global.N_0xae4e8157d9ecf087 = Global.EndTextCommandScaleformString_2

function Global.EndTextCommandSetBlipName(blip)
	return _in(0xBC38B49BCB83BC9B, blip)
end

function Global.EndTextCommandTimer(p0)
	return _in(0xA86911979638106F, p0)
end
Global.N_0xa86911979638106f = Global.EndTextCommandTimer

function Global.ExecuteCommand(commandString)
	return _in(0x561c060b, _ts(commandString))
end

--- Appears only 3 times in the scripts, more specifically in michael1.ysc
-- Console hash: 0x64ddb07d
function Global.ExpandWorldLimits(x, y, z)
	return _in(0x5006D96C995A5827, x, y, z)
end
Global.N_0x5006d96c995a5827 = Global.ExpandWorldLimits

--- Forces the ped to fall back and kills it.
function Global.ExplodePedHead(ped, weaponHash)
	return _in(0x2D05CED3A38D0F3A, ped, _ch(weaponHash))
end

function Global.ExplodeProjectiles(ped, weaponHash, p2)
	return _in(0xFC4BD125DE7611E4, ped, _ch(weaponHash), p2)
end

--- Explodes a selected vehicle.
-- Vehicle vehicle = Vehicle you want to explode.
-- BOOL isAudible = If explosion makes a sound.
-- BOOL isInvisible = If the explosion is invisible or not.
-- First BOOL does not give any visual explosion, the vehicle just falls apart completely but slowly and starts to burn.
function Global.ExplodeVehicle(vehicle, isAudible, isInvisible)
	return _in(0xBA71116ADF5B514C, vehicle, isAudible, isInvisible)
end

function Global.ExplodeVehicleInCutscene(vehicle, p1)
	return _in(0x786A4EB67B01BF0B, vehicle, p1)
end

--- Fades nearby decals within the range specified
function Global.FadeDecalsInRange(p0, p1, p2, p3, p4)
	return _in(0xD77EDADB0420E6E0, p0, p1, p2, p3, p4)
end

--- Hardcoded to not work in SP.
function Global.FadeOutLocalPlayer(p0)
	return _in(0x416DBD4CD6ED8DD2, p0)
end

function Global.FilloutPmPlayerList(p1, p2)
	return _in(0xCBBD7C4991B64809, _i, p1, p2, _r)
end

function Global.FilloutPmPlayerListWithNames(p2, p3)
	return _in(0x716B6DB9D1886106, _i, _i, p2, p3, _r)
end

--- In the script "player_scene_t_bbfight.c4":
-- "if (ENTITY::FIND_ANIM_EVENT_PHASE(&amp;l_16E, &amp;l_19F[v_4/*16*/], v_9, &amp;v_A, &amp;v_B))"
-- -- &amp;l_16E (p0) is requested as an anim dictionary earlier in the script.
-- -- &amp;l_19F[v_4/*16*/] (p1) is used in other natives in the script as the "animation" param.
-- -- v_9 (p2) is instantiated as "victim_fall"; I'm guessing that's another anim
-- --v_A and v_B (p3 &amp; p4) are both set as -1.0, but v_A is used immediately after this native for:
-- "if (v_A &lt; ENTITY::GET_ENTITY_ANIM_CURRENT_TIME(...))"
-- Both v_A and v_B are seemingly used to contain both Vector3's and floats, so I can't say what either really is other than that they are both output parameters. p4 looks more like a *Vector3 though
-- -alphazolam
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.FindAnimEventPhase(animDictionary, animName, p2)
	return _in(0x07F1BE2BCCAA27A7, _ts(animDictionary), _ts(animName), _ts(p2), _i, _i, _r)
end

function Global.FindFirstObject(outEntity)
	return _in(0xfaa6cb5d, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindFirstPed(outEntity)
	return _in(0xfb012961, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindFirstPickup(outEntity)
	return _in(0x3ff9d340, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindFirstVehicle(outEntity)
	return _in(0x15e55694, _ii(outEntity) --[[ may be optional ]], _r, _ri)
end

function Global.FindKvp(handle)
	return _in(0xbd7bebc5, handle, _r, _s)
end

function Global.FindNextObject(findHandle, outEntity)
	return _in(0x4e129dbf, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindNextPed(findHandle, outEntity)
	return _in(0xab09b548, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindNextPickup(findHandle, outEntity)
	return _in(0x4107ef0f, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindNextVehicle(findHandle, outEntity)
	return _in(0x8839120d, findHandle, _ii(outEntity) --[[ may be optional ]], _r)
end

function Global.FindRadioStationIndex(station)
	return _in(0x8D67489793FF428B, station, _r, _ri)
end

--- Finds a position ahead of the player by predicting the players next actions.
-- The positions match path finding node positions.
-- When roads diverge, the position may rapidly change between two or more positions. This is due to the engine not being certain of which path the player will take.
-- =======================================================
-- I may sort this with alter research, but if someone
-- already knows please tell what the difference in
-- X2, Y2, Z2 is. I doubt it's rotation. Is it like
-- checkpoints where X1, Y1, Z1 is your/a position and
-- X2, Y2, Z2 is a given position ahead of that position?
-- =======================================================
function Global.FindSpawnPointInDirection(x1, y1, z1, x2, y2, z2, distance, spawnPoint)
	return _in(0x6874E2190B0C1972, x1, y1, z1, x2, y2, z2, distance, _v, _r)
end

function Global.FixVehicleWindow(vehicle, index)
	return _in(0x772282EBEB95E682, vehicle, index, _r, _ri)
end

--- If set to true ability bar will flash
function Global.FlashAbilityBar(toggle)
	return _in(0x02CFBA0C9E9275CE, toggle)
end

--- adds a short flash to the Radar/Minimap
-- Usage: UI.FLASH_MINIMAP_DISPLAY
function Global.FlashMinimapDisplay()
	return _in(0xF2DD778C22B15BDA)
end

function Global.FlashWantedDisplay(p0)
	return _in(0xA18AFB39081B6A1F, p0, _r, _ri)
end

function Global.Floor(value)
	return _in(0xF34EE736CF047844, value, _r, _ri)
end

--- if value is set to true, and ambient siren sound will be played.
-- -------------------------------------------------------------------------
-- Appears to enable/disable an audio flag.
function Global.ForceAmbientSiren(value)
	return _in(0x552369F549563AD5, value)
end
Global.N_0x552369f549563ad5 = Global.ForceAmbientSiren

--- used with 1,2,8,64,128 in the scripts
function Global.ForceCleanup(cleanupFlags)
	return _in(0xBC8983F38F78ED51, cleanupFlags)
end

--- PLAYER::FORCE_CLEANUP_FOR_ALL_THREADS_WITH_THIS_NAME("pb_prostitute", 1); // Found in decompilation
function Global.ForceCleanupForAllThreadsWithThisName(name, cleanupFlags)
	return _in(0x4C68DDDDF0097317, _ts(name), cleanupFlags)
end

function Global.ForceCleanupForThreadWithThisId(id, cleanupFlags)
	return _in(0xF745B37630DF176B, id, cleanupFlags)
end

--- Based on carmod_shop script decompile this takes a vehicle parameter. It is called when repair is done on initial enter.
function Global.ForceEntityAiAndAnimationUpdate(entity)
	return _in(0x40FDEDB72F8293B2, entity)
end

--- Some motionstate hashes are
-- 0xec17e58 (standing idle), 0xbac0f10b (nothing?), 0x3f67c6af (aiming with pistol 2-h), 0x422d7a25 (stealth), 0xbd8817db, 0x916e828c
-- and those for the strings
-- "motionstate_idle", "motionstate_walk", "motionstate_run", "motionstate_actionmode_idle", and "motionstate_actionmode_walk".
-- Regarding p2, p3 and p4: Most common is 0, 0, 0); followed by 0, 1, 0); and 1, 1, 0); in the scripts. p4 is very rarely something other than 0.
-- [31/03/2017] ins1de :
-- enum MotionState
-- {
-- StopRunning = -530524,
-- StopWalking = -668482597,
-- Idle = 247561816, // 1, 1, 0
-- Idl2 = -1871534317,
-- SkyDive =-1161760501, // 0, 1, 0
-- Stealth = 1110276645,
-- Sprint = -1115154469,
-- Swim = -1855028596,
-- Unknown1 = 1063765679,
-- Unknown2 = -633298724,
-- }
function Global.ForcePedMotionState(ped, motionStateHash, p2, p3, p4)
	return _in(0xF28965D04F570DCA, ped, _ch(motionStateHash), p2, p3, p4, _r)
end

function Global.ForcePedToOpenParachute(ped)
	return _in(0x16E42E800B472221, ped)
end

--- Does anyone know what this does? I know online modding isn't generally supported especially by the owner of this db, but I first thought this could be used to force ourselves into someones apartment, but I see now that isn't possible.
function Global.ForceRoomForEntity(entity, interiorID, roomHashKey)
	return _in(0x52923C4710DD9907, entity, interiorID, _ch(roomHashKey))
end

--- Exits the game and downloads a fresh social club update on next restart.
function Global.ForceSocialClubUpdate()
	return _in(0xEB6891F03362FB12)
end

function Global.FormatFocusHeading(x, y, z, rad, p4, p5)
	return _in(0x219C7B8D53E429FD, x, y, z, rad, p4, p5, _r, _ri)
end
Global.N_0x219c7b8d53e429fd = Global.FormatFocusHeading

function Global.FreezeEntityPosition(entity, toggle)
	return _in(0x428CA6DBD1094446, entity, toggle)
end

function Global.FreezePedCameraRotation(ped)
	return _in(0xFF287323B0E2C69A, ped)
end
Global.N_0xff287323b0e2c69a = Global.FreezePedCameraRotation

function Global.FreezeRadioStation(radioStation)
	return _in(0x344F393B027E38C3, _ts(radioStation))
end

--- Usage example:
-- Public Function GenerateDirectionsToCoord(Pos As Vector3) As Tuple(Of String, Single, Single)
-- Dim f4, f5, f6 As New OutputArgument()
-- Native.Function.Call(Hash.GENERATE_DIRECTIONS_TO_COORD, Pos.X, Pos.Y, Pos.Z, True, f4, f5, f6)
-- Dim direction As String = f4.GetResult(Of Single)()
-- Return New Tuple(Of String, Single, Single)(direction.Substring(0, 1), f5.GetResult(Of Single)(), f6.GetResult(Of Single)())
-- End Function
-- p3 I use 1
-- direction:
-- 0 = You Have Arrive
-- 1 = Recalculating Route, Please make a u-turn where safe
-- 2 = Please Proceed the Highlighted Route
-- 3 = Keep Left (unsure)
-- 4 = In (distToNxJunction) Turn Left
-- 5 = In (distToNxJunction) Turn Right
-- 6 = Keep Right (unsure)
-- 7 = In (distToNxJunction) Go Straight Ahead
-- 8 = In (distToNxJunction) Join the freeway
-- 9 = In (distToNxJunction) Exit Freeway
-- return value set to 0 always
function Global.GenerateDirectionsToCoord(x, y, z, p3)
	return _in(0xF90125F1F79ECDF8, x, y, z, p3, _f, _f, _f, _r, _ri)
end

--- Returns current screen resolution.
function Global.GetActiveScreenResolution()
	return _in(0x873C9F3104101DD3, _i, _i)
end
Global.GetScreenActiveResolution = Global.GetActiveScreenResolution

function Global.GetActiveVehicleMissionType(veh)
	return _in(0x534AEBA6E5ED4CAB, veh, _r, _ri)
end

function Global.GetAllocatedStackSize()
	return _in(0x8B3CA62B1EF19B62, _r, _ri)
end

function Global.GetAmmoInClip(ped, weaponHash, ammo)
	return _in(0x2E1202248937775C, ped, _ch(weaponHash), _ii(ammo) --[[ may be optional ]], _r)
end

--- WEAPON::GET_AMMO_IN_PED_WEAPON(PLAYER::PLAYER_PED_ID(), a_0)
-- From decompiled scripts
-- Returns total ammo in weapon
-- GTALua Example :
-- natives.WEAPON.GET_AMMO_IN_PED_WEAPON(plyPed, WeaponHash)
function Global.GetAmmoInPedWeapon(ped, weaponhash)
	return _in(0x015A522136D7F951, ped, _ch(weaponhash), _r, _ri)
end

function Global.GetAngleBetween_2dVectors(x1, y1, x2, y2)
	return _in(0x186FC4BE848E1C92, x1, y1, x2, y2, _r, _rf)
end

--- Console Hash: 0x8B5E3E3D = GET_ANIM_DURATION
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.GetAnimDuration(animDict, animName)
	return _in(0xFEDDF04D62B8D790, _ts(animDict), _ts(animName), _r, _rf)
end

function Global.GetAnimInitialOffsetPosition(animDict, animName, x, y, z, xRot, yRot, zRot, p8, p9)
	return _in(0xBE22B26DD764C040, _ts(animDict), _ts(animName), x, y, z, xRot, yRot, zRot, p8, p9, _r, _rv)
end

function Global.GetAnimInitialOffsetRotation(animDict, animName, x, y, z, xRot, yRot, zRot, p8, p9)
	return _in(0x4B805E6046EE9E47, _ts(animDict), _ts(animName), x, y, z, xRot, yRot, zRot, p8, p9, _r, _rv)
end

function Global.GetAspectRatio(b)
	return _in(0xF1307EF624A80D87, b, _r, _rf)
end
Global.GetScreenAspectRatio = Global.GetAspectRatio

function Global.GetAudibleMusicTrackTextId()
	return _in(0x50B196FC9ED6545B, _r, _ri)
end

--- p1 is always 0 in the scripts.
function Global.GetBestPedWeapon(ped, p1)
	return _in(0x8483E98E8B888AE2, ped, p1, _r, _ri)
end

function Global.GetBitsInRange(var, rangeStart, rangeEnd)
	return _in(0x53158863FCC0893A, var, rangeStart, rangeEnd, _r, _ri)
end

function Global.GetBlipAlpha(blip)
	return _in(0x970F608F0EE6C885, blip, _r, _ri)
end

function Global.GetBlipColour(blip)
	return _in(0xDF729E8D20CF7327, blip, _r, _ri)
end

function Global.GetBlipCoords(blip)
	return _in(0x586AFE3FF72D996E, blip, _r, _rv)
end

--- Returns the Blip handle of given Entity.
function Global.GetBlipFromEntity(entity)
	return _in(0xBC8DBDCA2436F7E8, entity, _r, _ri)
end

function Global.GetBlipHudColour(blip)
	return _in(0x729B5F1EFBC0AAEE, blip, _r, _ri)
end

function Global.GetBlipInfoIdCoord(blip)
	return _in(0xFA7C7F0AADF25D09, blip, _r, _rv)
end

function Global.GetBlipInfoIdDisplay(blip)
	return _in(0x1E314167F701DC3B, blip, _r, _ri)
end

function Global.GetBlipInfoIdEntityIndex(blip)
	return _in(0x4BA4E2553AFEDC2C, blip, _r, _ri)
end

function Global.GetBlipInfoIdIterator()
	return _in(0x186E5D252FA50E7D, _r, _ri)
end

--- This function is hard-coded to always return 0.
function Global.GetBlipInfoIdPickupIndex(blip)
	return _in(0x9B6786E4C03DD382, blip, _r, _ri)
end

--- Returns a value based on what the blip is attached to
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
function Global.GetBlipInfoIdType(blip)
	return _in(0xBE9B0959FFD0779B, blip, _r, _ri)
end

--- Blips Images + IDs:
-- gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
function Global.GetBlipSprite(blip)
	return _in(0x1FC877464A04FC4F, blip, _r, _ri)
end

--- Console Hash: 0xE97A4F5E
function Global.GetBoatAnchor(vehicle)
	return _in(0x26C10ECBDA5D043B, vehicle, _r)
end

function Global.GetCamAnimCurrentPhase(cam)
	return _in(0xA10B2DB49E92A6B0, cam, _r, _rf)
end

function Global.GetCamCoord(cam)
	return _in(0xBAC038F7459AE5AE, cam, _r, _rv)
end

function Global.GetCamFarClip(cam)
	return _in(0xB60A9CFEB21CA6AA, cam, _r, _rf)
end

function Global.GetCamFarDof(cam)
	return _in(0x255F8DAFD540D397, cam, _r, _rf)
end

function Global.GetCamFov(cam)
	return _in(0xC3330A45CCCDB26A, cam, _r, _rf)
end

--- Returns the world matrix of the specified camera. To turn this into a view matrix, calculate the inverse.
function Global.GetCamMatrix(camera)
	return _in(0x8f57a89d, camera, _v, _v, _v, _v)
end

function Global.GetCamNearClip(cam)
	return _in(0xC520A34DAFBF24B1, cam, _r, _rf)
end

--- The last parameter, as in other "ROT" methods, is usually 2.
function Global.GetCamRot(cam, rotationOrder)
	return _in(0x7D304C1C955E3E12, cam, rotationOrder, _r, _rv)
end

--- I named the beginning from Any to BOOL as this native is used in an if statement as well.
function Global.GetCamSplineNodeIndex(cam)
	return _in(0xB22B17DF858716A6, cam, _r)
end

--- I'm pretty sure the parameter is the camera as usual, but I am not certain so I'm going to leave it as is.
function Global.GetCamSplineNodePhase(cam)
	return _in(0xD9D0E694C8282C96, cam, _r, _rf)
end

--- Can use this with SET_CAM_SPLINE_PHASE to set the float it this native returns.
-- (returns 1.0f when no nodes has been added, reached end of non existing spline)
function Global.GetCamSplinePhase(cam)
	return _in(0xB5349E36C546509A, cam, _r, _rf)
end

--- Gets the position of the cargobob hook, in world coords.
function Global.GetCargobobHookPosition(cargobob)
	return _in(0xCBDB9B923CACC92D, cargobob, _r, _rv)
end
Global.N_0xcbdb9b923cacc92d = Global.GetCargobobHookPosition

function Global.GetCauseOfMostRecentForceCleanup()
	return _in(0x9A41CF4674A12272, _r, _ri)
end

function Global.GetCgoffset(rope)
	return _in(0x8214A4B5A7A33612, rope, _r, _rv)
end

function Global.GetClipSetForScriptedGunTask(p0)
	return _in(0x3A8CADC7D37AACC5, p0, _r, _s)
end

function Global.GetClockDayOfMonth()
	return _in(0x3D10BC92A4DB1D35, _r, _ri)
end

--- Gets the current day of the week.
-- 0: Sunday
-- 1: Monday
-- 2: Tuesday
-- 3: Wednesday
-- 4: Thursday
-- 5: Friday
-- 6: Saturday
function Global.GetClockDayOfWeek()
	return _in(0xD972E4BD7AEB235F, _r, _ri)
end

--- Gets the current ingame hour, expressed without zeros. (09:34 will be represented as 9)
function Global.GetClockHours()
	return _in(0x25223CA6B4D20B7F, _r, _ri)
end

--- Gets the current ingame clock minute.
function Global.GetClockMinutes()
	return _in(0x13D2B8ADD79640F2, _r, _ri)
end

function Global.GetClockMonth()
	return _in(0xBBC72712E80257A1, _r, _ri)
end

--- Gets the current ingame clock second. Note that ingame clock seconds change really fast since a day in GTA is only 48 minutes in real life.
function Global.GetClockSeconds()
	return _in(0x494E97C2EF27C470, _r, _ri)
end

function Global.GetClockYear()
	return _in(0x961777E64BDAF717, _r, _ri)
end

--- Returns TRUE if it found something. FALSE if not.
function Global.GetClosestFirePos(x, y, z)
	return _in(0x352A9F6BCF90081F, _v, x, y, z, _r)
end

--- Get the closest vehicle node to a given position, unknown1 = 3.0, unknown2 = 0
function Global.GetClosestMajorVehicleNode(x, y, z, unknown1, unknown2)
	return _in(0x2EABE3B06F58C1BE, x, y, z, _v, unknown1, unknown2, _r)
end

--- Has 8 params in the latest patches.
-- isMission - if true doesn't return mission objects
function Global.GetClosestObjectOfType(x, y, z, radius, modelHash, isMission, p6, p7)
	return _in(0xE143FA2249364369, x, y, z, radius, _ch(modelHash), isMission, p6, p7, _r, _ri)
end

--- Gets the closest ped in a radius.
-- Ped Types:
-- Any ped = -1
-- Player = 1
-- Male = 4
-- Female = 5
-- Cop = 6
-- Human = 26
-- SWAT = 27
-- Animal = 28
-- Army = 29
-- ------------------
-- P4 P5 P7 P8
-- 1  0  x  x  = return nearest walking Ped
-- 1  x  0  x  = return nearest walking Ped
-- x  1  1  x  = return Ped you are using
-- 0  0  x  x  = no effect
-- 0  x  0  x  = no effect
-- x = can be 1 or 0. Does not have any obvious changes.
-- This function does not return ped who is:
-- 1. Standing still
-- 2. Driving
-- 3. Fleeing
-- 4. Attacking
-- This function only work if the ped is:
-- 1. walking normally.
-- 2. waiting to cross a road.
-- Note: PED::GET_PED_NEARBY_PEDS works for more peds.
function Global.GetClosestPed(x, y, z, radius, p4, p5, p7, p8, pedType)
	return _in(0xC33AB876A77F8164, x, y, z, radius, p4, p5, _i, p7, p8, pedType, _r)
end

--- p1 seems to be always 1.0f in the scripts
function Global.GetClosestRoad(x, y, z, p3, p4, p10)
	return _in(0x132F52BBA570FE92, x, y, z, p3, p4, _v, _v, _i, _i, _f, p10, _r, _ri)
end

--- Example usage
-- VEHICLE::GET_CLOSEST_VEHICLE(x, y, z, radius, hash, unknown leave at 70)
-- x, y, z: Position to get closest vehicle to.
-- radius: Max radius to get a vehicle.
-- modelHash: Limit to vehicles with this model. 0 for any.
-- flags: The bitwise flags altering the function's behaviour.
-- Does not return police cars or helicopters.
-- It seems to return police cars for me, does not seem to return helicopters, planes or boats for some reason
-- Only returns non police cars and motorbikes with the flag set to 70 and modelHash to 0. ModelHash seems to always be 0 when not a modelHash in the scripts, as stated above.
-- These flags were found in the b617d scripts: 0,2,4,6,7,23,127,260,2146,2175,12294,16384,16386,20503,32768,67590,67711,98309,100359.
-- Converted to binary, each bit probably represents a flag as explained regarding another native here: gtaforums.com/topic/822314-guide-driving-styles
-- Conversion of found flags to binary: pastebin.com/kghNFkRi
-- At exactly 16384 which is 0100000000000000 in binary and 4000 in hexadecimal only planes are returned.
-- It's probably more convenient to use worldGetAllVehicles(int *arr, int arrSize) and check the shortest distance yourself and sort if you want by checking the vehicle type with for example VEHICLE::IS_THIS_MODEL_A_BOAT
-- -------------------------------------------------------------------------
-- Conclusion: This native is not worth trying to use. Use something like this instead: pastebin.com/xiFdXa7h
function Global.GetClosestVehicle(x, y, z, radius, modelHash, flags)
	return _in(0xF73EB622C4F1689B, x, y, z, radius, _ch(modelHash), flags, _r, _ri)
end

--- FYI: When falling through the map (or however you got under it) you will respawn when your player ped's height is &lt;= -200.0 meters (I think you all know this) and when in a vehicle you will actually respawn at the closest vehicle node.
-- ----------
-- Vector3 nodePos;
-- GET_CLOSEST_VEHICLE_NODE(x,y,z,&amp;nodePos,...)
-- p4 is either 0, 1 or 8. 1 means any path/road. 0 means node in the middle of the closest main (asphalt) road.
-- p5, p6 are always the same:
-- 0x40400000 (3.0), 0
-- p5 can also be 100.0 and p6 can be 2.5:
-- PATHFIND::GET_CLOSEST_VEHICLE_NODE(a_0, &amp;v_5, v_9, 100.0, 2.5)
-- Known node types: simple path/asphalt road, only asphalt road, water, under the map at always the same coords.
-- The node types follows a pattern. For example, every fourth node is of the type water i.e. 3, 7, 11, 15, 19, 23, 27, 31, 35, 39... 239. Could not see any difference between nodes within certain types.
-- Starting at 2, every fourth node is under the map, always same coords.
-- Same with only asphalt road (0, 4, 8, etc) and simple path/asphalt road (1, 5, 9, etc).
-- gtaforums.com/topic/843561-pathfind-node-types
function Global.GetClosestVehicleNode(x, y, z, nodeType, p5, p6)
	return _in(0x240A18690AE96513, x, y, z, _v, nodeType, p5, p6, _r)
end

--- p5, p6 and p7 seems to be about the same as p4, p5 and p6 for GET_CLOSEST_VEHICLE_NODE. p6 and/or p7 has something to do with finding a node on the same path/road and same direction(at least for this native, something to do with the heading maybe). Edit this when you find out more.
-- p5 is either 1 or 12. 1 means any path/road. 12, 8, 0 means node in the middle of the closest main (asphalt) road.
-- p6 is always 3.0
-- p7 is always 0.
-- Known node types: simple path/asphalt road, only asphalt road, water, under the map at always the same coords.
-- The node types follows a pattern. For example, every fourth node is of the type water i.e. 3, 7, 11, 15, 19, 23, 27, 31, 35, 39... 239. Could not see any difference between nodes within certain types.
-- Starting at 2, every fourth node is under the map, always same coords.
-- Same with only asphalt road (0, 4, 8, etc) and simple path/asphalt road (1, 5, 9, etc).
-- gtaforums.com/topic/843561-pathfind-node-types
-- Example of usage, moving vehicle to closest path/road:
-- Vector3 coords = ENTITY::GET_ENTITY_COORDS(playerVeh, true);
-- Vector3 closestVehicleNodeCoords;
-- float roadHeading;
-- PATHFIND::GET_CLOSEST_VEHICLE_NODE_WITH_HEADING(coords.x, coords.y, coords.z, &amp;closestVehicleNodeCoords, &amp;roadHeading, 1, 3, 0);
-- ENTITY::SET_ENTITY_HEADING(playerVeh, roadHeading);
-- ENTITY::SET_ENTITY_COORDS(playerVeh, closestVehicleNodeCoords.x, closestVehicleNodeCoords.y, closestVehicleNodeCoords.z, 1, 0, 0, 1);
-- VEHICLE::SET_VEHICLE_ON_GROUND_PROPERLY(playerVeh);
-- ------------------------------------------------------------------
-- C# Example (ins1de) : pastebin.com/fxtMWAHD
function Global.GetClosestVehicleNodeWithHeading(x, y, z, nodeType, p6, p7)
	return _in(0xFF071FB798B803B0, x, y, z, _v, _f, nodeType, p6, p7, _r)
end

function Global.GetCloudHatOpacity()
	return _in(0x20AC25E781AE4A84, _r, _rf)
end
Global.N_0x20ac25e781ae4a84 = Global.GetCloudHatOpacity

function Global.GetCollisionNormalOfLastHitForEntity(entity)
	return _in(0xE465D4AB7CA6AE72, entity, _r, _rv)
end

--- p0: Ped Handle
-- p1: int i | 0 &lt;= i &lt;= 27
-- p1 probably refers to the attributes configured in combatbehavior.meta. There are 13. Example:
-- &lt;BlindFireChance value="0.1"/&gt;
-- &lt;WeaponShootRateModifier value="1.0"/&gt;
-- &lt;TimeBetweenBurstsInCover value="1.25"/&gt;
-- &lt;BurstDurationInCover value="2.0"/&gt;
-- &lt;TimeBetweenPeeks value="10.0"/&gt;
-- &lt;WeaponAccuracy value="0.18"/&gt;
-- &lt;FightProficiency value="0.8"/&gt;
-- &lt;StrafeWhenMovingChance value="1.0"/&gt;
-- &lt;WalkWhenStrafingChance value="0.0"/&gt;
-- &lt;AttackWindowDistanceForCover value="55.0"/&gt;
-- &lt;TimeToInvalidateInjuredTarget value="9.0"/&gt;
-- &lt;TriggerChargeTime_Near value="4.0"/&gt;
-- &lt;TriggerChargeTime_Far value="10.0"/&gt;
-- -------------Confirmed by editing combatbehavior.meta:
-- p1:
-- 0=BlindFireChance
-- 1=BurstDurationInCover
-- 3=TimeBetweenBurstsInCover
-- 4=TimeBetweenPeeks
-- 5=StrafeWhenMovingChance
-- 8=WalkWhenStrafingChance
-- 11=AttackWindowDistanceForCover
-- 12=TimeToInvalidateInjuredTarget
-- 16=OptimalCoverDistance
function Global.GetCombatFloat(ped, p1)
	return _in(0x52DFF8A10508090A, ped, p1, _r, _rf)
end

function Global.GetContentCategory(p0)
	return _in(0xA7BAB11E7C9C6C5A, p0, _r, _ri)
end
Global.N_0xa7bab11e7c9c6c5a = Global.GetContentCategory

function Global.GetContentDescriptionHash(p0)
	return _in(0x7CF0448787B23758, p0, _r, _ri)
end
Global.N_0x7cf0448787b23758 = Global.GetContentDescriptionHash

function Global.GetContentFileVersion(p0, p1)
	return _in(0x37025B27D9B658B1, p0, p1, _r, _ri)
end
Global.N_0x37025b27d9b658b1 = Global.GetContentFileVersion

--- Return the mission id of a job.
function Global.GetContentId(p0)
	return _in(0x55AA95F481D694D2, p0, _r, _s)
end
Global.N_0x55aa95f481d694d2 = Global.GetContentId

function Global.GetContentUserId(p0)
	return _in(0xCD67AD041A394C9C, p0, _r, _s)
end
Global.N_0xcd67ad041a394c9c = Global.GetContentUserId

--- formerly called _GET_CONTROL_ACTION_NAME incorrectly
-- p2 appears to always be true.
-- p2 is unused variable in function.
-- EG:
-- GET_CONTROL_INSTRUCTIONAL_BUTTON (2, 201, 1) /*INPUT_FRONTEND_ACCEPT (e.g. Enter button)*/
-- GET_CONTROL_INSTRUCTIONAL_BUTTON (2, 202, 1) /*INPUT_FRONTEND_CANCEL (e.g. ESC button)*/
-- GET_CONTROL_INSTRUCTIONAL_BUTTON (2, 51, 1) /*INPUT_CONTEXT (e.g. E button)*/
-- gtaforums.com/topic/819070-c-draw-instructional-buttons-scaleform-movie/#entry1068197378
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.GetControlInstructionalButton(inputGroup, control, p2)
	return _in(0x0499D7B09FC9B407, inputGroup, control, p2, _r, _s)
end
Global.N_0x0499d7b09fc9b407 = Global.GetControlInstructionalButton

--- Returns the value of CONTROLS::GET_CONTROL_VALUE Normalized (ie a real number value between -1 and 1)
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.GetControlNormal(inputGroup, control)
	return _in(0xEC3C9B8D5327B563, inputGroup, control, _r, _rf)
end

--- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.GetControlValue(inputGroup, control)
	return _in(0xD95E79E8686D2C27, inputGroup, control, _r, _ri)
end

--- 0 -&gt; up
-- 1 -&gt; lowering down
-- 2 -&gt; down
-- 3 -&gt; raising up
function Global.GetConvertibleRoofState(vehicle)
	return _in(0xF8C397922FC03F41, vehicle, _r, _ri)
end

--- if (UI::_2309595AD6145265() == ${fe_menu_version_empty_no_background})
-- Seems to get the current frontend menu
function Global.GetCurrentFrontendMenu()
	return _in(0x2309595AD6145265, _r, _ri)
end
Global.N_0x2309595ad6145265 = Global.GetCurrentFrontendMenu

--- american = 0
-- french = 1
-- german = 2
-- italian =3
-- spanish = 4
-- portuguese = 5
-- polish = 6
-- russian = 7
-- korean = 8
-- chinese = 9
-- japanese = 10
-- mexican = 11
function Global.GetCurrentLanguageId()
	return _in(0x2BDD44CC428A7EAE, _r, _ri)
end
Global.GetUiLanguageId = Global.GetCurrentLanguageId

--- Returns the handle for the notification currently displayed on the screen.
function Global.GetCurrentNotification()
	return _in(0x82352748437638CA, _r, _ri)
end
Global.N_0x82352748437638ca = Global.GetCurrentNotification

--- Example in VB
-- Public Shared Function GetVehicleCurrentWeapon(Ped As Ped) As Integer
-- Dim arg As New OutputArgument()
-- Native.Function.Call(Hash.GET_CURRENT_PED_VEHICLE_WEAPON, Ped, arg)
-- Return arg.GetResult(Of Integer)()
-- End Function
-- Usage:
-- If GetVehicleCurrentWeapon(Game.Player.Character) = -821520672 Then ...Do something
-- Note: -821520672 = VEHICLE_WEAPON_PLANE_ROCKET
function Global.GetCurrentPedVehicleWeapon(ped, weaponHash)
	return _in(0x1017582BCD3832DC, ped, _ii(weaponHash) --[[ may be optional ]], _r)
end

--- The return value seems to indicate returns true if the hash of the weapon object weapon equals the weapon hash.
-- p2 seems to be 1 most of the time.
-- p2 is not implemented
-- disassembly said that?
function Global.GetCurrentPedWeapon(ped, p2)
	return _in(0x3A87E44BB9A01D54, ped, _i, p2, _r)
end

function Global.GetCurrentPedWeaponEntityIndex(ped)
	return _in(0x3B390A939AF0B5FC, ped, _r, _ri)
end

function Global.GetCurrentPlaybackForVehicle(p0)
	return _in(0x42BC05C27A946054, p0, _r, _ri)
end

--- Returns the name of the currently executing resource.
-- @return The name of the resource.
function Global.GetCurrentResourceName()
	return _in(0xe5e9ebbb, _r, _s)
end

function Global.GetCurrentScriptedConversationLine()
	return _in(0x480357EE890C295A, _r, _ri)
end

function Global.GetCurrentWebsiteId()
	return _in(0x97D47996FC48CBAD, _r, _ri)
end

function Global.GetCutsceneSectionPlaying()
	return _in(0x49010A6A396553D8, _r, _ri)
end

function Global.GetCutsceneTime()
	return _in(0xE625BEABBAFFDAB9, _r, _ri)
end

function Global.GetCutsceneTotalDuration()
	return _in(0xEE53B14A19E480D4, _r, _ri)
end

--- Takes the specified time and writes it to the structure specified in the second argument.
-- struct date_time
-- {
-- int year;
-- int PADDING1;
-- int month;
-- int PADDING2;
-- int day;
-- int PADDING3;
-- int hour;
-- int PADDING4;
-- int minute;
-- int PADDING5;
-- int second;
-- int PADDING6;
-- };
function Global.GetDateAndTimeFromUnixEpoch(unixEpoch, timeStructure)
	return _in(0xAC97AF97FA68E5D5, unixEpoch, _ii(timeStructure) --[[ may be optional ]])
end

function Global.GetDeadPedPickupCoords(ped, p1, p2)
	return _in(0xCD5003B097200F36, ped, p1, p2, _r, _rv)
end

function Global.GetDecalWashLevel(decal)
	return _in(0x323F647679A09103, decal, _r, _rf)
end

--- This function is hard-coded to always return 1.
function Global.GetDefaultScriptRendertargetRenderId()
	return _in(0x52F0982D7FD156B6, _r, _ri)
end

--- Gets a destructible object's handle
-- Example:
-- OBJECT::_B48FCED898292E52(-809.9619750976562, 170.919, 75.7406997680664, 3.0, "des_tvsmash");
-- All found arguments for p4 starts with "des_" like "DES_FIB_Floor" and "des_shipsink".
function Global.GetDesObject(x, y, z, rotation, name)
	return _in(0xB48FCED898292E52, x, y, z, rotation, _ts(name), _r, _ri)
end
Global.N_0xb48fced898292e52 = Global.GetDesObject

--- Get a destrictible object's state.
-- Substract 1 to get the real state.
-- See _SET_DES_OBJECT_STATE to see the different states
-- For example, if the object just spawned (state 2), the native will return 3.
function Global.GetDesObjectState(handle)
	return _in(0x899BA936634A322E, handle, _r, _ri)
end
Global.N_0x899ba936634a322e = Global.GetDesObjectState

--- control - c# works with (int)GTA.Control.CursorY / (int)GTA.Control.CursorX and returns the mouse movement (additive).
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.GetDisabledControlNormal(inputGroup, control)
	return _in(0x11E65974A982637C, inputGroup, control, _r, _rf)
end

--- Returns model name of vehicle in all caps. Needs to be displayed through localizing text natives to get proper display name.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- While often the case, this does not simply return the model name of the vehicle (which could be hashed to return the model hash). Variations of the same vehicle may also use the same display name.
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Returns "CARNOTFOUND" if the hash doesn't match a vehicle hash.
-- Using UI::_GET_LABEL_TEXT, you can get the localized name.
-- For a full list, see here: pastebin.com/wvpyS4kS (pastebin.com/dA3TbkZw)
function Global.GetDisplayNameFromVehicleModel(modelHash)
	return _in(0xB215AAC32D25D019, _ch(modelHash), _r, _s)
end

--- If useZ is false, only the 2D plane (X-Y) will be considered for calculating the distance.
-- Consider using this faster native instead: SYSTEM::VDIST - DVIST always takes in consideration the 3D coordinates.
function Global.GetDistanceBetweenCoords(x1, y1, z1, x2, y2, z2, useZ)
	return _in(0xF1B760881820C952, x1, y1, z1, x2, y2, z2, useZ, _r, _rf)
end

--- dlcVehicleIndex takes a number from 0 - GET_NUM_DLC_VEHICLES() - 1.
-- outData is a struct of 3 8-byte items.
-- The Second item in the struct *(Hash *)(outData + 1) is the vehicle hash.
function Global.GetDlcVehicleData(dlcVehicleIndex, outData)
	return _in(0x33468EDC08E371F6, dlcVehicleIndex, _ii(outData) --[[ may be optional ]], _r)
end

function Global.GetDlcVehicleFlags(dlcVehicleIndex)
	return _in(0x5549EE11FA22FCF2, dlcVehicleIndex, _r, _ri)
end

--- dlcVehicleIndex is 0 to GET_NUM_DLC_VEHICLS()
function Global.GetDlcVehicleModel(dlcVehicleIndex)
	return _in(0xECC01B7C5763333C, dlcVehicleIndex, _r, _ri)
end

--- p0 seems to be the weapon index
-- p1 seems to be the weapon component index
-- struct DlcComponentData{
-- int attachBone;
-- int padding1;
-- int bActiveByDefault;
-- int padding2;
-- int unk;
-- int padding3;
-- int componentHash;
-- int padding4;
-- int unk2;
-- int padding5;
-- int componentCost;
-- int padding6;
-- char nameLabel[64];
-- char descLabel[64];
-- };
function Global.GetDlcWeaponComponentData(dlcWeaponIndex, dlcWeapCompIndex, ComponentDataPtr)
	return _in(0x6CF598A2957C2BF8, dlcWeaponIndex, dlcWeapCompIndex, _ii(ComponentDataPtr) --[[ may be optional ]], _r)
end

--- dlcWeaponIndex takes a number from 0 - GET_NUM_DLC_WEAPONS() - 1.
-- struct DlcWeaponData
-- {
-- int emptyCheck; //use DLC1::_IS_DLC_DATA_EMPTY on this
-- int padding1;
-- int weaponHash;
-- int padding2;
-- int unk;
-- int padding3;
-- int weaponCost;
-- int padding4;
-- int ammoCost;
-- int padding5;
-- int ammoType;
-- int padding6;
-- int defaultClipSize;
-- int padding7;
-- char nameLabel[64];
-- char descLabel[64];
-- char desc2Label[64]; // usually "the" + name
-- char upperCaseNameLabel[64];
-- };
function Global.GetDlcWeaponData(dlcWeaponIndex, outData)
	return _in(0x79923CD21BECE14E, dlcWeaponIndex, _ii(outData) --[[ may be optional ]], _r)
end

function Global.GetEntityAlpha(entity)
	return _in(0x5A47B3B5E63E94C6, entity, _r, _ri)
end

--- Returns a float value representing animation's current playtime with respect to its total playtime. This value increasing in a range from [0 to 1] and wrap back to 0 when it reach 1.
-- Example:
-- 0.000000 - mark the starting of animation.
-- 0.500000 - mark the midpoint of the animation.
-- 1.000000 - mark the end of animation.
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.GetEntityAnimCurrentTime(entity, animDict, animName)
	return _in(0x346D81500D088F42, entity, _ts(animDict), _ts(animName), _r, _rf)
end

--- Returns a float value representing animation's total playtime in milliseconds.
-- Example:
-- GET_ENTITY_ANIM_TOTAL_TIME(PLAYER_ID(),"amb@world_human_yoga@female@base","base_b")
-- return 20800.000000
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.GetEntityAnimTotalTime(entity, animDict, animName)
	return _in(0x50BD2730B191E360, entity, _ts(animDict), _ts(animName), _r, _rf)
end

function Global.GetEntityAttachedTo(entity)
	return _in(0x48C2BED9180FE123, entity, _r, _ri)
end

function Global.GetEntityAttachedToTowTruck(towTruck)
	return _in(0xEFEA18DCF10F8F75, towTruck, _r, _ri)
end

--- Returns the index of the bone. If the bone was not found, -1 will be returned.
-- list:
-- pastebin.com/D7JMnX1g
-- BoneNames:
-- chassis,
-- windscreen,
-- seat_pside_r,
-- seat_dside_r,
-- bodyshell,
-- suspension_lm,
-- suspension_lr,
-- platelight,
-- attach_female,
-- attach_male,
-- bonnet,
-- boot,
-- chassis_dummy,	//Center of the dummy
-- chassis_Control,	//Not found yet
-- door_dside_f,	//Door left, front
-- door_dside_r,	//Door left, back
-- door_pside_f,	//Door right, front
-- door_pside_r,	//Door right, back
-- Gun_GripR,
-- windscreen_f,
-- platelight,	//Position where the light above the numberplate is located
-- VFX_Emitter,
-- window_lf,	//Window left, front
-- window_lr,	//Window left, back
-- window_rf,	//Window right, front
-- window_rr,	//Window right, back
-- engine,	//Position of the engine
-- gun_ammo,
-- ROPE_ATTATCH,	//Not misspelled. In script "finale_heist2b.c4".
-- wheel_lf,	//Wheel left, front
-- wheel_lr,	//Wheel left, back
-- wheel_rf,	//Wheel right, front
-- wheel_rr,	//Wheel right, back
-- exhaust,	//Exhaust. shows only the position of the stock-exhaust
-- overheat,	//A position on the engine(not exactly sure, how to name it)
-- misc_e,	//Not a car-bone.
-- seat_dside_f,	//Driver-seat
-- seat_pside_f,	//Seat next to driver
-- Gun_Nuzzle,
-- seat_r
-- I doubt that the function is case-sensitive, since I found a "Chassis" and a "chassis". - Just tested: Definitely not case-sensitive.
function Global.GetEntityBoneIndexByName(entity, boneName)
	return _in(0xFB71170B7E76ACBA, entity, _ts(boneName), _r, _ri)
end

--- console hash: 0xE8C0C629
function Global.GetEntityCollisonDisabled(entity)
	return _in(0xCCF1E97BEFDAE480, entity, _r)
end
Global.N_0xccf1e97befdae480 = Global.GetEntityCollisonDisabled

--- p1 = !IS_ENTITY_DEAD
function Global.GetEntityCoords(entity, alive)
	return _in(0x3FEF770D40960D5A, entity, alive, _r, _rv)
end

--- Gets the entity's forward vector.
function Global.GetEntityForwardVector(entity)
	return _in(0x0A794A5A57F8DF91, entity, _r, _rv)
end

--- Gets the X-component of the entity's forward vector.
function Global.GetEntityForwardX(entity)
	return _in(0x8BB4EF4214E0E6D5, entity, _r, _rf)
end

--- Gets the Y-component of the entity's forward vector.
function Global.GetEntityForwardY(entity)
	return _in(0x866A4A5FAE349510, entity, _r, _rf)
end

--- Returns the heading of the entity in degrees. Also know as the "Yaw" of an entity.
function Global.GetEntityHeading(entity)
	return _in(0xE83D4F9BA2A38914, entity, _r, _rf)
end

--- Returns an integer value of entity's current health.
-- Example of range for ped:
-- - Player [0 to 200]
-- - Ped [100 to 200]
-- - Vehicle [0 to 1000]
-- - Object [0 to 1000]
-- Health is actually a float value but this native casts it to int.
-- In order to get the actual value, do:
-- float health = *(float *)(entityAddress + 0x280);
function Global.GetEntityHealth(entity)
	return _in(0xEEF059FAD016D209, entity, _r, _ri)
end

function Global.GetEntityHeight(entity, X, Y, Z, atTop, inWorldCoords)
	return _in(0x5A504562485944DD, entity, X, Y, Z, atTop, inWorldCoords, _r, _rf)
end

--- Return height (z-dimension) above ground.
-- Example: The pilot in a titan plane is 1.844176 above ground.
-- How can i convert it to meters?
-- Everything seems to be in meters, probably this too.
function Global.GetEntityHeightAboveGround(entity)
	return _in(0x1DD55701034110E5, entity, _r, _rf)
end

function Global.GetEntityIndexOfCutsceneEntity(cutsceneEntName, modelHash)
	return _in(0x0A2E9FDB9A8C62F6, _ts(cutsceneEntName), _ch(modelHash), _r, _ri)
end

function Global.GetEntityIndexOfRegisteredEntity(cutsceneEntName, modelHash)
	return _in(0xC0741A26499654CD, _ts(cutsceneEntName), _ch(modelHash), _r, _ri)
end

--- Returns the LOD distance of an entity.
function Global.GetEntityLodDist(entity)
	return _in(0x4159C2762B5791D6, entity, _r, _ri)
end

function Global.GetEntityMatrix(entity)
	return _in(0xECB2FC7235A7D137, entity, _v, _v, _v, _v)
end

--- Return an integer value of entity's maximum health.
-- Example:
-- - Player = 200
function Global.GetEntityMaxHealth(entity)
	return _in(0x15D757606D170C3C, entity, _r, _ri)
end

--- Returns the model hash from the entity
function Global.GetEntityModel(entity)
	return _in(0x9F47B058362C84B5, entity, _r, _ri)
end

--- Gets the heading of the entity physics in degrees, which tends to be more accurate than just "GET_ENTITY_HEADING". This can be clearly seen while, for example, ragdolling a ped/player.
-- NOTE: The name and description of this native are based on independent research. If you find this native to be more suitable under a different name and/or described differently, please feel free to do so.
function Global.GetEntityPhysicsHeading(entity)
	return _in(0x846BF6291198A71E, entity, _r, _rf)
end
Global.N_0x846bf6291198a71e = Global.GetEntityPhysicsHeading

function Global.GetEntityPitch(entity)
	return _in(0xD45DC2893621E1FE, entity, _r, _rf)
end

--- Returns TRUE if it found an entity in your crosshair within range of your weapon. Assigns the handle of the target to the *entity that you pass it.
-- Returns false if no entity found.
function Global.GetEntityPlayerIsFreeAimingAt(player, entity)
	return _in(0x2975C866E6713290, player, _ii(entity) --[[ may be optional ]], _r)
end

--- Console Hash: 0xFC30DDFF
-- Returns range from 0-10
-- --------------------------------------------------------------
-- The type name can be retrieved by using this:
-- typedef LPSTR(__fastcall *GetEntityPopulationTypeName_t)(unsigned __int16 entityPopulationType, bool scriptName);
-- GetEntityPopulationTypeName_t GetEntityPopulationTypeName = (GetEntityPopulationTypeName_t)FindPattern("44 0F B7 C1 4C 8D 0D ?? ?? ?? ?? 41 83 F8 07");
function Global.GetEntityPopulationType(entity)
	return _in(0xF6F5161F4534EDFF, entity, _r, _ri)
end

--- w is the correct parameter name!
function Global.GetEntityQuaternion(entity)
	return _in(0x7B3703D2D32DFA18, entity, _f, _f, _f, _f)
end

--- Displays the current ROLL axis of the entity [-180.0000/180.0000+]
-- (Sideways Roll) such as a vehicle tipped on its side
function Global.GetEntityRoll(entity)
	return _in(0x831E0242595560DF, entity, _r, _rf)
end

--- rotationOrder refers to the order yaw pitch roll is applied
-- value ranges from 0 to 5. What you use for rotationOrder when getting must be the same as rotationOrder when setting the rotation.
-- Unsure what value corresponds to what rotation order, more testing will be needed for that.
-- ------
-- rotationOrder is usually 2 in scripts
-- ------
-- ENTITY::GET_ENTITY_ROTATION(Any p0, false or true);
-- if false than return from -180 to 180
-- if true than return from -90 to 90
-- ---
-- As said above, the value of p1 affects the outcome. R* uses 1 and 2 instead of 0 and 1, so I marked it as an int.
-- What it returns is the yaw on the z part of the vector, which makes sense considering R* considers z as vertical. Here's a picture for those of you who don't understand pitch, yaw, and roll:
-- www.allstar.fiu.edu/aero/images/pic5-1.gif
-- I don't know why it returns a Vec3, but sometimes the values x and y go negative, yet they're always zero. Just use GET_ENTITY_PITCH and GET_ENTITY_ROLL for pitch and roll.
function Global.GetEntityRotation(entity, rotationOrder)
	return _in(0xAFBD61CC738D9EB9, entity, rotationOrder, _r, _rv)
end

function Global.GetEntityRotationVelocity(entity)
	return _in(0x213B91045D09B983, entity, _r, _rv)
end

--- All ambient entities in-world seem to have the same value for the second argument (Any *script), depending on when the scripthook was activated/re-activated. I've seen numbers from ~5 to almost 70 when the value was translated with to_string. The function return value seems to always be 0.
function Global.GetEntityScript(entity, script)
	return _in(0xA6E9C38DB51D7748, entity, _ii(script) --[[ may be optional ]], _r, _s)
end

--- result is in meters per second
-- ------------------------------------------------------------
-- So would the conversion to mph and km/h, be along the lines of this.
-- float speed = GET_ENTITY_SPEED(veh);
-- float kmh = (speed * 3.6);
-- float mph = (speed * 2.236936);
function Global.GetEntitySpeed(entity)
	return _in(0xD5037BA82E12416F, entity, _r, _rf)
end

--- Relative can be used for getting speed relative to the frame of the vehicle, to determine for example, if you are going in reverse (-y speed) or not (+y speed).
function Global.GetEntitySpeedVector(entity, relative)
	return _in(0x9A8D700A51CB7B0D, entity, relative, _r, _rv)
end

--- Get how much of the entity is submerged.  1.0f is whole entity.
function Global.GetEntitySubmergedLevel(entity)
	return _in(0xE81AFC1BC4CC41CE, entity, _r, _rf)
end

--- Returns:
-- 0 = no entity
-- 1 = ped
-- 2 = vehicle
-- 3 = object
function Global.GetEntityType(entity)
	return _in(0x8ACD366038D14505, entity, _r, _ri)
end

function Global.GetEntityUprightValue(entity)
	return _in(0x95EED5A694951F9F, entity, _r, _rf)
end

function Global.GetEntityVelocity(entity)
	return _in(0x4805D2B1D8CF94A9, entity, _r, _rv)
end

function Global.GetEventAtIndex(p0, eventNum)
	return _in(0xD8F66A3A60C62153, p0, eventNum, _r, _ri)
end

function Global.GetEventData(p0, eventNum, argStructSize)
	return _in(0x2902843FCD2B2D79, p0, eventNum, _i, argStructSize, _r)
end

function Global.GetEventExists(p0, p1)
	return _in(0x936E6168A9BCEDB5, p0, p1, _r)
end

function Global.GetFakeWantedLevel()
	return _in(0x4C9296CBCD1B971E, _r, _ri)
end
Global.N_0x4c9296cbcd1b971e = Global.GetFakeWantedLevel

function Global.GetFirstBlipInfoId(blipSprite)
	return _in(0x1BEDE233E6CD2A1F, blipSprite, _r, _ri)
end

--- Type equals 0 for male non-dlc, 1 for female non-dlc, 2 for male dlc, and 3 for female dlc.
-- Used when calling SET_PED_HEAD_BLEND_DATA.
function Global.GetFirstParentIdForPedType(type)
	return _in(0x68D353AB88B97E0C, type, _r, _ri)
end

--- Returns
-- 0 - Third Person Close
-- 1 - Third Person Mid
-- 2 - Third Person Far
-- 4 - First Person
function Global.GetFollowPedCamViewMode()
	return _in(0x8D4D46230B2C353A, _r, _ri)
end

function Global.GetFollowPedCamZoomLevel()
	return _in(0x33E6C8EFD0CD93E9, _r, _ri)
end

--- Returns the type of camera:
-- 0 - Third Person Close
-- 1 - Third Person Mid
-- 2 - Third Person Far
-- 4 - First Person
function Global.GetFollowVehicleCamViewMode()
	return _in(0xA4FF579AC0E3AAAE, _r, _ri)
end

function Global.GetFollowVehicleCamZoomLevel()
	return _in(0xEE82280AB767B690, _r, _ri)
end

function Global.GetForcedComponent(componentHash, componentId)
	return _in(0x6C93ED8C2F74859B, _ch(componentHash), componentId, _i, _i, _i)
end

function Global.GetFrameCount()
	return _in(0xFC8202EFC642E6F2, _r, _ri)
end

function Global.GetFrameTime()
	return _in(0x15C40837039FFAF7, _r, _rf)
end

function Global.GetFreeStackSlotsCount(stackSize)
	return _in(0xFEAD16FC8F9DFC0F, stackSize, _r, _ri)
end

function Global.GetGameTimer()
	return _in(0x9CD27B0045628463, _r, _ri)
end

function Global.GetGameplayCamCoord()
	return _in(0x14D6F5678D8F1B37, _r, _rv)
end

function Global.GetGameplayCamCoords()
	return _in(0xA200EB1EE790F448, _r, _rv)
end

function Global.GetGameplayCamFov()
	return _in(0x65019750A0324133, _r, _rf)
end

function Global.GetGameplayCamRelativeHeading()
	return _in(0x743607648ADD4587, _r, _rf)
end

function Global.GetGameplayCamRelativePitch()
	return _in(0x3A6867B4845BEDA2, _r, _rf)
end

--- p0 dosen't seem to change much, I tried it with 0, 1, 2:
-- 0-Pitch(X): -70.000092
-- 0-Roll(Y): -0.000001
-- 0-Yaw(Z): -43.886459
-- 1-Pitch(X): -70.000092
-- 1-Roll(Y): -0.000001
-- 1-Yaw(Z): -43.886463
-- 2-Pitch(X): -70.000092
-- 2-Roll(Y): -0.000002
-- 2-Yaw(Z): -43.886467
function Global.GetGameplayCamRot(rotationOrder)
	return _in(0x837765A25378F0BB, rotationOrder, _r, _rv)
end

--- p0 seems to consistently be 2 across scripts
-- Function is called faily often by CAM::CREATE_CAM_WITH_PARAMS
function Global.GetGameplayCamRot(rotationOrder)
	return _in(0x5B4E4C817FCC2DFB, rotationOrder, _r, _rv)
end

function Global.GetGameplayCamZoom()
	return _in(0x7EC52CC40597D170, _r, _rf)
end

--- Returns a global c-style string buffer that is used internally by the game
-- nope, it returns a reference to an empty string, the same empty string that's used by 1687 internal gta functions.   if it was used in a script (and i cannot find an instance of it being used), it would be as the source for a StringCopy or somesuch.
function Global.GetGlobalCharBuffer()
	return _in(0x24DA7D7667FD7B09, _r, _s)
end
Global.N_0x24da7d7667fd7b09 = Global.GetGlobalCharBuffer

--- Gets the ground elevation at the specified position. Note that if the specified position is below ground level, the function will output zero!
-- x: Position on the X-axis to get ground elevation at.
-- y: Position on the Y-axis to get ground elevation at.
-- z: Position on the Z-axis to get ground elevation at.
-- groundZ: The ground elevation at the specified position.
-- unk: Nearly always 0, very rarely 1 in the scripts.
function Global.GetGroundZFor_3dCoord(x, y, z, unk)
	return _in(0xC906A7DAB05C8D2B, x, y, z, _f, unk, _r)
end

--- p1 may be a BOOL representing whether or not the group even exists
function Global.GetGroupSize(groupID)
	return _in(0x8DE69FE35CA09A45, groupID, _i, _i)
end

--- This native converts its past string to hash. It is hashed using jenkins one at a time method.
function Global.GetHashKey(model)
	return _in(0xD24D37CC275948CC, _ts(model), _r, _ri)
end

function Global.GetHashNameForComponent(entity, componentId, drawableVariant, textureVariant)
	return _in(0x0368B3A838070348, entity, componentId, drawableVariant, textureVariant, _r, _ri)
end

function Global.GetHashNameForProp(entity, componentId, propIndex, propTextureIndex)
	return _in(0x5D6160275CAEC8DD, entity, componentId, propIndex, propTextureIndex, _r, _ri)
end

--- Returns a hash representing which part of the map the given coords are located.
-- Possible return values:
-- (Hash of) city -&gt; -289320599
-- (Hash of) countryside -&gt; 2072609373
-- C# Example :
-- Ped player = Game.Player.Character;
-- Hash h = Function.Call&lt;Hash&gt;(Hash.GET_HASH_OF_MAP_AREA_AT_COORDS, player.Position.X, player.Position.Y, player.Position.Z);
function Global.GetHashOfMapAreaAtCoords(x, y, z)
	return _in(0x7EE64D51E8498728, x, y, z, _r, _ri)
end

function Global.GetHashOfThisScriptName()
	return _in(0x8A1C8B1738FFE87E, _r, _ri)
end
Global.GetThisScriptHash = Global.GetHashOfThisScriptName

--- dx = x1
-- dy = y1
function Global.GetHeadingFromVector_2d(dx, dy)
	return _in(0x2FFB6B224F4B2926, dx, dy, _r, _rf)
end

--- Max 1000.
-- At -100 both helicopter rotors will stall.
function Global.GetHeliEngineHealth(vehicle)
	return _in(0xAC51915D27E4A5F7, vehicle, _r, _rf)
end

--- Max 1000.
-- At 0 the main rotor will stall.
function Global.GetHeliMainRotorHealth(vehicle)
	return _in(0xE4CB7541F413D2C5, vehicle, _r, _rf)
end

--- Max 1000.
-- At 0 the tail rotor will stall.
function Global.GetHeliTailRotorHealth(vehicle)
	return _in(0xAE8CE82A4219AC8C, vehicle, _r, _rf)
end

--- HUD colors and their values: pastebin.com/d9aHPbXN
function Global.GetHudColour(hudColorIndex)
	return _in(0x7C9C91AB74A0360F, hudColorIndex, _i, _i, _i, _i)
end

function Global.GetHudComponentPosition(id)
	return _in(0x223CA69A8C4417FD, id, _r, _rv)
end

--- MulleDK19: Gets the ID of the next active thread.
-- First call _BEGIN_ENUMERATE_THREADS (0xDADFADA5A20143A8).
-- Any subsequent call to this function will then return the ID of the next active thread.
-- If the function returns 0, the end of the enumeration has been reached.
-- -----------------------------------------------------------------------
-- Some other guy: Here's an example:
-- std::vector&lt;int&gt; vecCurrentThreads;
-- void update_current_threads_list()
-- {
-- vecCurrentThreads.clear();
-- _BEGIN_ENUMERATING_THREADS();
-- int id = _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION();
-- while (id != 0)
-- {
-- id = _GET_ID_OF_NEXT_THREAD_IN_ENUMERATION();
-- vecCurrentThreads.push_back(id);
-- }
-- }
function Global.GetIdOfNextThreadInEnumeration()
	return _in(0x30B4FA1C82DD4B9F, _r, _ri)
end
Global.N_0x30b4fa1c82dd4b9f = Global.GetIdOfNextThreadInEnumeration

function Global.GetIdOfThisThread()
	return _in(0xC30338E8088E2E21, _r, _ri)
end

--- x1, y1, z1 -- Coords of your ped model
-- x2, y2, z2 -- Coords of the ped you want to switch to
function Global.GetIdealPlayerSwitchType(x1, y1, z1, x2, y2, z2)
	return _in(0xB5D7B26B45720E05, x1, y1, z1, x2, y2, z2, _r, _ri)
end

function Global.GetIndexOfCurrentLevel()
	return _in(0xCBAD6729F7B1F4FC, _r, _ri)
end

function Global.GetIndexedItemInItemset(p0, p1)
	return _in(0x7A197E2521EE2BAB, p0, p1, _r, _ri)
end

function Global.GetInstanceId()
	return _in(0x9f1c4383, _r, _ri)
end

--- Returns interior ID from specified coordinates. If coordinates are outside, then it returns 0.
-- Example for VB.NET
-- Dim interiorID As Integer = Native.Function.Call(Of Integer)(Hash.GET_INTERIOR_AT_COORDS, X, Y, Z)
function Global.GetInteriorAtCoords(x, y, z)
	return _in(0xB0F7F8663821D9C3, x, y, z, _r, _ri)
end

--- Returns the interior ID representing the requested interior at that location (if found?). The supplied interior string is not the same as the one used to load the interior.
-- Use: INTERIOR::UNPIN_INTERIOR(INTERIOR::GET_INTERIOR_AT_COORDS_WITH_TYPE(x, y, z, interior))
-- Interior types include: "V_Michael", "V_Franklins", "V_Franklinshouse", etc.. you can find them in the scripts.
-- Not a very useful native as you could just use GET_INTERIOR_AT_COORDS instead and get the same result, without even having to specify the interior type.
function Global.GetInteriorAtCoordsWithType(x, y, z, interiorType)
	return _in(0x05B7A89BD78797FC, x, y, z, _ts(interiorType), _r, _ri)
end
Global.N_0x05b7a89bd78797fc = Global.GetInteriorAtCoordsWithType

function Global.GetInteriorFromCollision(x, y, z)
	return _in(0xEC4CF9FCB29A4424, x, y, z, _r, _ri)
end

--- Returns the handle of the interior that the entity is in. Returns 0 if outside.
function Global.GetInteriorFromEntity(entity)
	return _in(0x2107BA504071A6BB, entity, _r, _ri)
end

--- Returns the group ID of the specified interior. For example, regular interiors have group 0, subway interiors have group 1. There are a few other groups too.
function Global.GetInteriorGroupId(interiorID)
	return _in(0xE4A84ABF135EF91A, interiorID, _r, _ri)
end

--- false = Any resolution &lt; 1280x720
-- true = Any resolution &gt;= 1280x720
function Global.GetIsHidef()
	return _in(0x84ED31191CC5D2C9, _r)
end

--- From the driver's perspective, is the left headlight broken.
function Global.GetIsLeftVehicleHeadlightDamaged(vehicle)
	return _in(0x5EF77C9ADD3B11A3, vehicle, _r)
end
Global.IsHeadlightLBroken = Global.GetIsLeftVehicleHeadlightDamaged

function Global.GetIsLoadingScreenActive()
	return _in(0x10D0A8F259E93EC9, _r)
end

--- Hash collision
function Global.GetIsMultiplayerBrief(p0)
	return _in(0xE3433EADAAF7EE40, p0)
end

--- gadgetHash - was always 0xFBAB5776 ("GADGET_PARACHUTE").
function Global.GetIsPedGadgetEquipped(ped, gadgetHash)
	return _in(0xF731332072F5156C, ped, _ch(gadgetHash), _r)
end

--- From the driver's perspective, is the right headlight broken.
function Global.GetIsRightVehicleHeadlightDamaged(vehicle)
	return _in(0xA7ECB73355EB2F20, vehicle, _r)
end
Global.IsHeadlightRBroken = Global.GetIsRightVehicleHeadlightDamaged

--- p0 = VEHICLE_NODE_ID
-- Returns true when the node is Offroad. Alleys, some dirt roads, and carparks return true.
-- Normal roads where plenty of Peds spawn will return false
function Global.GetIsSlowRoadFlag(nodeID)
	return _in(0x4F5070AA58F69279, nodeID, _r)
end
Global.N_0x4f5070aa58f69279 = Global.GetIsSlowRoadFlag

--- from docks_heistb.c4:
-- AI::GET_IS_TASK_ACTIVE(PLAYER::PLAYER_PED_ID(), 2))
-- Known Tasks: pastebin.com/2gFqJ3Px
function Global.GetIsTaskActive(ped, taskNumber)
	return _in(0xB0760331C7AA4155, ped, taskNumber, _r)
end

--- Returns true when in a vehicle, false whilst entering/exiting.
function Global.GetIsVehicleEngineRunning(vehicle)
	return _in(0xAE31E7DF9B5B132E, vehicle, _r)
end
Global.IsVehicleEngineOn = Global.GetIsVehicleEngineRunning

function Global.GetIsVehiclePrimaryColourCustom(vehicle)
	return _in(0xF095C0405307B21B, vehicle, _r)
end

--- Check if Vehicle Secondary is avaliable for customize
function Global.GetIsVehicleSecondaryColourCustom(vehicle)
	return _in(0x910A32E7AAD2656C, vehicle, _r)
end

--- For a full list, see here: pastebin.com/Tp0XpBMN
function Global.GetIsWaypointRecordingLoaded(name)
	return _in(0xCB4E8BE8A0063C5D, _ts(name), _r)
end

--- Setting Aspect Ratio Manually in game will return:
-- false - for Narrow format Aspect Ratios (3:2, 4:3, 5:4, etc. )
-- true - for Wide format Aspect Ratios (5:3, 16:9, 16:10, etc. )
-- Setting Aspect Ratio to "Auto" in game will return "false" or "true" based on the actual set Resolution Ratio.
function Global.GetIsWidescreen()
	return _in(0x30CF4BDA4FCB1905, _r)
end

function Global.GetItemsetSize(p0)
	return _in(0xD9127E83ABF7C631, p0, _r, _ri)
end

function Global.GetJackTarget(ped)
	return _in(0x5486A79D9FBD342D, ped, _r, _ri)
end

--- Seems to do the exact same as INTERIOR::GET_ROOM_KEY_FROM_ENTITY
function Global.GetKeyForEntityInRoom(entity)
	return _in(0x399685DB942336BC, entity, _r, _ri)
end

--- Gets a string literal from a label name.
function Global.GetLabelText(labelName)
	return _in(0x7B5280EBA9840C72, _ts(labelName), _r, _s)
end

--- landing gear states:
-- 0: Deployed
-- 1: Closing
-- 2: Opening
-- 3: Retracted
function Global.GetLandingGearState(vehicle)
	return _in(0x9B0F3DCA3DB0F4CD, vehicle, _r, _ri)
end
Global.GetVehicleLandingGear = Global.GetLandingGearState

--- Not exactly sure on this one, but here's a snippet of code:
-- if (PED::IS_PED_IN_ANY_VEHICLE(PLAYER::PLAYER_PED_ID(), 0)) {
-- v_2 = PED::GET_VEHICLE_PED_IS_IN(PLAYER::PLAYER_PED_ID(), 0);
-- } else {
-- v_2 = VEHICLE::_B2D06FAEDE65B577();
-- }
function Global.GetLastDrivenVehicle()
	return _in(0xB2D06FAEDE65B577, _r, _ri)
end
Global.N_0xb2d06faede65b577 = Global.GetLastDrivenVehicle

function Global.GetLastMaterialHitByEntity(entity)
	return _in(0x5C3D0A935F535C4C, entity, _r, _ri)
end

function Global.GetLastPedInVehicleSeat(vehicle, seatIndex)
	return _in(0x83F969AA1EE2A664, vehicle, seatIndex, _r, _ri)
end

--- Returns the length of the string passed (much like strlen).
function Global.GetLengthOfLiteralString(string)
	return _in(0xF030907CCBB8A9FD, _ts(string), _r, _ri)
end

--- gets the length of a null terminated string, without checking unicode encodings
function Global.GetLengthOfString(p0)
	return _in(0x43E4111189E54F0E, _ts(p0), _r, _ri)
end
Global.N_0x43e4111189e54f0e = Global.GetLengthOfString

--- Returns the string length of the string from the gxt string .
function Global.GetLengthOfStringWithThisTextLabel(gxt)
	return _in(0x801BD273D3A23F74, _ts(gxt), _r, _ri)
end

--- Second Param = LiveryIndex
-- example
-- int count = VEHICLE::GET_VEHICLE_LIVERY_COUNT(veh);
-- for (int i = 0; i &lt; count; i++)
-- {
-- char* LiveryName = VEHICLE::GET_LIVERY_NAME(veh, i);
-- }
-- this example will work fine to fetch all names
-- for example for Sanchez we get
-- SANC_LV1
-- SANC_LV2
-- SANC_LV3
-- SANC_LV4
-- SANC_LV5
-- Use _GET_LABEL_TEXT, to get the localized livery name.
function Global.GetLiveryName(vehicle, liveryIndex)
	return _in(0xB4C7A93837C91A1F, vehicle, liveryIndex, _r, _s)
end

function Global.GetLocalPlayerAimState()
	return _in(0xBB41AFBBBC0A0287, _r, _ri)
end

--- Gets local system time as year, month, day, hour, minute and second.
-- Example usage:
-- int year;
-- int month;
-- int day;
-- int hour;
-- int minute;
-- int second;
-- or use std::tm struct
-- TIME::GET_LOCAL_TIME(&amp;year, &amp;month, &amp;day, &amp;hour, &amp;minute, &amp;second);
function Global.GetLocalTime()
	return _in(0x50C7A99057A69748, _i, _i, _i, _i, _i, _i)
end

function Global.GetLockonRangeOfCurrentPedWeapon(ped)
	return _in(0x840F03E9041E2C9C, ped, _r, _rf)
end
Global.N_0x840f03e9041e2c9c = Global.GetLockonRangeOfCurrentPedWeapon

function Global.GetMainPlayerBlipId()
	return _in(0xDCD4EC3F419D02FA, _r, _ri)
end

function Global.GetMaxAmmo(ped, weaponHash, ammo)
	return _in(0xDC16122C7A20C933, ped, _ch(weaponHash), _ii(ammo) --[[ may be optional ]], _r)
end

--- p2 is mostly 1 in the scripts.
function Global.GetMaxAmmoInClip(ped, weaponHash, p2)
	return _in(0xA38DCFFCEA8962FA, ped, _ch(weaponHash), p2, _r, _ri)
end

function Global.GetMaxRangeOfCurrentPedWeapon(ped)
	return _in(0x814C9D19DFD69679, ped, _r, _rf)
end

--- Gets the maximum wanted level the player can get.
-- Ranges from 0 to 5.
function Global.GetMaxWantedLevel()
	return _in(0x462E0DB9B137DC5F, _r, _ri)
end

--- This function is hard-coded to always return 0.
function Global.GetMaximumNumberOfPhotos()
	return _in(0x34D23450F028B0BF, _r, _ri)
end

function Global.GetMeleeTargetForPed(ped)
	return _in(0x18A3E9EE1297FD39, ped, _r, _ri)
end

function Global.GetMillisecondsPerGameMinute()
	return _in(0x2F8B4D1C595B11DB, _r, _ri)
end

function Global.GetMissionFlag()
	return _in(0xA33CDCCDA663159E, _r)
end

function Global.GetMobilePhonePosition(position)
	return _in(0x584FDFDA48805B86, _v)
end

function Global.GetMobilePhoneRenderId(renderId)
	return _in(0xB4A53E05F68B6FA1, _ii(renderId) --[[ may be optional ]])
end

function Global.GetMobilePhoneRotation(p1)
	return _in(0x1CEFB61F193070AE, _v, p1)
end

--- Returns the name for the type of vehicle mod(Armour, engine etc)
function Global.GetModSlotName(vehicle, modType)
	return _in(0x51F0FEB9F6AE98C0, vehicle, modType, _r, _s)
end

--- Returns the text label of a mod type for a given vehicle
-- Use _GET_LABEL_TEXT to get the part name in the game's language
function Global.GetModTextLabel(vehicle, modType, modValue)
	return _in(0x8935624F8C5592CC, vehicle, modType, modValue, _r, _s)
end

--- Gets the dimensions of a model.
-- Calculate (maximum - minimum) to get the size, in which case, Y will be how long the model is.
-- Example from the scripts: GAMEPLAY::GET_MODEL_DIMENSIONS(ENTITY::GET_ENTITY_MODEL(PLAYER::PLAYER_PED_ID()), &amp;v_1A, &amp;v_17);
function Global.GetModelDimensions(modelHash)
	return _in(0x03E8D3D5F549087A, _ch(modelHash), _v, _v)
end

--- Function just returns 0
-- void __fastcall ped__get_mount(NativeContext *a1)
-- {
-- NativeContext *v1; // rbx@1
-- v1 = a1;
-- GetAddressOfPedFromScriptHandle(a1-&gt;Args-&gt;Arg1);
-- v1-&gt;Returns-&gt;Item1= 0;
-- }
function Global.GetMount(ped)
	return _in(0xE7E11B8DCBED1058, ped, _r, _ri)
end

function Global.GetMusicPlaytime()
	return _in(0xE7A0D23DC414507B, _r, _ri)
end

--- The reversed code looks like this (Sasuke78200)
-- //
-- char g_szScriptName[64];
-- char* _0xBE7ACD89(int a_iThreadID)
-- {
-- scrThread* l_pThread;
-- // Get the script thread
-- l_pThread = GetThreadByID(a_iThreadID);
-- if(l_pThread == 0 || l_pThread-&gt;m_iThreadState == 2)
-- {
-- strncpy(g_szScriptName, "", 64);
-- }
-- else
-- {
-- strncpy(g_szScriptName, l_pThread-&gt;m_szScriptName, 64);
-- }
-- return g_szScriptName;
-- }
function Global.GetNameOfThread(threadId)
	return _in(0x05A42BA9FC8DA96B, threadId, _r, _s)
end
Global.GetThreadName = Global.GetNameOfThread

--- AIRP = Los Santos International Airport
-- ALAMO = Alamo Sea
-- ALTA = Alta
-- ARMYB = Fort Zancudo
-- BANHAMC = Banham Canyon Dr
-- BANNING = Banning
-- BEACH = Vespucci Beach
-- BHAMCA = Banham Canyon
-- BRADP = Braddock Pass
-- BRADT = Braddock Tunnel
-- BURTON = Burton
-- CALAFB = Calafia Bridge
-- CANNY = Raton Canyon
-- CCREAK = Cassidy Creek
-- CHAMH = Chamberlain Hills
-- CHIL = Vinewood Hills
-- CHU = Chumash
-- CMSW = Chiliad Mountain State Wilderness
-- CYPRE = Cypress Flats
-- DAVIS = Davis
-- DELBE = Del Perro Beach
-- DELPE = Del Perro
-- DELSOL = La Puerta
-- DESRT = Grand Senora Desert
-- DOWNT = Downtown
-- DTVINE = Downtown Vinewood
-- EAST_V = East Vinewood
-- EBURO = El Burro Heights
-- ELGORL = El Gordo Lighthouse
-- ELYSIAN = Elysian Island
-- GALFISH = Galilee
-- GOLF = GWC and Golfing Society
-- GRAPES = Grapeseed
-- GREATC = Great Chaparral
-- HARMO = Harmony
-- HAWICK = Hawick
-- HORS = Vinewood Racetrack
-- HUMLAB = Humane Labs and Research
-- JAIL = Bolingbroke Penitentiary
-- KOREAT = Little Seoul
-- LACT = Land Act Reservoir
-- LAGO = Lago Zancudo
-- LDAM = Land Act Dam
-- LEGSQU = Legion Square
-- LMESA = La Mesa
-- LOSPUER = La Puerta
-- MIRR = Mirror Park
-- MORN = Morningwood
-- MOVIE = Richards Majestic
-- MTCHIL = Mount Chiliad
-- MTGORDO = Mount Gordo
-- MTJOSE = Mount Josiah
-- MURRI = Murrieta Heights
-- NCHU = North Chumash
-- NOOSE = N.O.O.S.E
-- OCEANA = Pacific Ocean
-- PALCOV = Paleto Cove
-- PALETO = Paleto Bay
-- PALFOR = Paleto Forest
-- PALHIGH = Palomino Highlands
-- PALMPOW = Palmer-Taylor Power Station
-- PBLUFF = Pacific Bluffs
-- PBOX = Pillbox Hill
-- PROCOB = Procopio Beach
-- RANCHO = Rancho
-- RGLEN = Richman Glen
-- RICHM = Richman
-- ROCKF = Rockford Hills
-- RTRAK = Redwood Lights Track
-- SANAND = San Andreas
-- SANCHIA = San Chianski Mountain Range
-- SANDY = Sandy Shores
-- SKID = Mission Row
-- SLAB = Stab City
-- STAD = Maze Bank Arena
-- STRAW = Strawberry
-- TATAMO = Tataviam Mountains
-- TERMINA = Terminal
-- TEXTI = Textile City
-- TONGVAH = Tongva Hills
-- TONGVAV = Tongva Valley
-- VCANA = Vespucci Canals
-- VESP = Vespucci
-- VINE = Vinewood
-- WINDF = Ron Alternates Wind Farm
-- WVINE = West Vinewood
-- ZANCUDO = Zancudo River
-- ZP_ORT = Port of South Los Santos
-- ZQ_UAR = Davis Quartz
function Global.GetNameOfZone(x, y, z)
	return _in(0xCD90657D4C30E1CA, x, y, z, _r, _s)
end

function Global.GetNamedRendertargetRenderId(p0)
	return _in(0x1A6478B61C6BDC3B, _ts(p0), _r, _ri)
end

function Global.GetNavmeshRouteDistanceRemaining(ped)
	return _in(0xC6F5C0BCDC74D62D, ped, _i, _i, _r, _ri)
end

function Global.GetNavmeshRouteResult(ped)
	return _in(0x632E831F382A0FA8, ped, _r, _ri)
end

function Global.GetNearestPlayerToEntity(entity)
	return _in(0x7196842CB375CDB3, entity, _r, _ri)
end

function Global.GetNearestPlayerToEntityOnTeam(entity, team)
	return _in(0x4DC9A62F844D9337, entity, team, _r, _ri)
end

--- Could this be used alongside either,
-- SET_NETWORK_ID_EXISTS_ON_ALL_MACHINES or _SET_NETWORK_ID_SYNC_TO_PLAYER to make it so other players can hear the sound while online? It'd be a bit troll-fun to be able to play the Zancudo UFO creepy sounds globally.
function Global.GetNetworkIdFromSoundId(soundId)
	return _in(0x2DE3F0A134FFBC0D, soundId, _r, _ri)
end

function Global.GetNetworkTime()
	return _in(0x7A5487FE9FAA6B48, _r, _ri)
end

function Global.GetNextBlipInfoId(blipSprite)
	return _in(0x14F96AA50D6FBEA7, blipSprite, _r, _ri)
end

--- Returns weather name hash
function Global.GetNextWeatherTypeHashName()
	return _in(0x711327CD09C8F162, _r, _ri)
end
Global.GetNextWeatherType = Global.GetNextWeatherTypeHashName

--- Needs more research. Gets the stat name of a masked bool?
-- p4 - Usually "_NGPSTAT_BOOL" or "_NGTATPSTAT_BOOL". There may be more that I missed.
function Global.GetNgstatBoolHash(index, spStat, charStat, character, section)
	return _in(0xBA52FF538ED2BC71, index, spStat, charStat, character, _ts(section), _r, _ri)
end
Global.N_0xba52ff538ed2bc71 = Global.GetNgstatBoolHash

--- Needs more research. Gets the stat name of a masked int?
-- p4 - Usually one of the following (there may be more that I missed):
-- -----&gt; "_APAPSTAT_INT"
-- -----&gt; "_LRPSTAT_INT"
-- -----&gt; "_NGPSTAT_INT"
-- -----&gt; "_MP_APAPSTAT_INT"
-- -----&gt; "_MP_LRPSTAT_INT"
function Global.GetNgstatIntHash(index, spStat, charStat, character, section)
	return _in(0x2B4CDCA6F07FF3DA, index, spStat, charStat, character, _ts(section), _r, _ri)
end
Global.N_0x2b4cdca6f07ff3da = Global.GetNgstatIntHash

function Global.GetNoLoadingScreen()
	return _in(0x18C1270EA7F199BC, _r)
end

function Global.GetNthClosestVehicleNode(x, y, z, nthClosest, unknown1, unknown2, unknown3)
	return _in(0xE50E52416CCF948B, x, y, z, nthClosest, _v, unknown1, unknown2, unknown3, _r)
end

--- See gtaforums.com/topic/843561-pathfind-node-types for node type info. 0 = paved road only, 1 = any road, 3 = water
-- p10 always equal 0x40400000
-- p11 always equal 0
function Global.GetNthClosestVehicleNodeFavourDirection(x, y, z, desiredX, desiredY, desiredZ, nthClosest, nodetype, p10, p11)
	return _in(0x45905BE8654AE067, x, y, z, desiredX, desiredY, desiredZ, nthClosest, _v, _f, nodetype, p10, p11, _r)
end

--- Returns the id.
function Global.GetNthClosestVehicleNodeId(x, y, z, nth, nodetype, p5, p6)
	return _in(0x22D7275A79FE8215, x, y, z, nth, nodetype, p5, p6, _r, _ri)
end

function Global.GetNthClosestVehicleNodeIdWithHeading(x, y, z, nthClosest, outHeading, p6, p7, p8)
	return _in(0x6448050E9C2A7207, x, y, z, nthClosest, _v, outHeading, p6, p7, p8, _r, _ri)
end

--- Get the nth closest vehicle node and its heading. (unknown2 = 9, unknown3 = 3.0, unknown4 = 2.5)
function Global.GetNthClosestVehicleNodeWithHeading(x, y, z, nthClosest, unknown2, unknown3, unknown4)
	return _in(0x80CA6A8B6C094CC4, x, y, z, nthClosest, _v, _f, _i, unknown2, unknown3, unknown4, _r)
end

--- _GET_NUM_DECORATIONS
-- only documented to be continued...
function Global.GetNumDecorations(character)
	return _in(0x278F76C3B0A8F109, character, _r, _ri)
end
Global.N_0x278f76c3b0a8f109 = Global.GetNumDecorations

function Global.GetNumDlcVehicles()
	return _in(0xA7A866D21CD2329B, _r, _ri)
end

--- Allowed Values from 0 - DLC1::GET_NUM_DLC_WEAPONS()
function Global.GetNumDlcWeaponComponents(dlcWeaponIndex)
	return _in(0x405425358A7D61FE, dlcWeaponIndex, _r, _ri)
end

--- Gets the total number of DLC weapons.
function Global.GetNumDlcWeapons()
	return _in(0xEE47635F352DA367, _r, _ri)
end

--- Returns number of possible values of the componentId argument of GET_FORCED_COMPONENT.
function Global.GetNumForcedComponents(componentHash)
	return _in(0xC6B9DB42C04DD8C3, _ch(componentHash), _r, _ri)
end

--- Used for freemode (online) characters.
function Global.GetNumHairColors()
	return _in(0xE5C0CF872C2AD150, _r, _ri)
end

--- Used with freemode (online) characters.
function Global.GetNumHeadOverlayValues(overlayID)
	return _in(0xCF1CE768BB43480E, overlayID, _r, _ri)
end

function Global.GetNumMakeupColors()
	return _in(0xD1F7CA1535D22818, _r, _ri)
end
Global.N_0xd1f7ca1535d22818 = Global.GetNumMakeupColors

function Global.GetNumMembershipDesc()
	return _in(0x1F471B79ACC90BEF, _r, _ri)
end
Global.N_0x1f471b79acc90bef = Global.GetNumMembershipDesc

function Global.GetNumModColors(p0, p1)
	return _in(0xA551BE18C11A476D, p0, p1, _r, _ri)
end

function Global.GetNumModKits(vehicle)
	return _in(0x33F2E3FE70EAAE1D, vehicle, _r, _ri)
end

--- Type equals 0 for male non-dlc, 1 for female non-dlc, 2 for male dlc, and 3 for female dlc.
function Global.GetNumParentPedsOfType(type)
	return _in(0x5EF37013A6539C9D, type, _r, _ri)
end

--- character is 0 for Michael, 1 for Franklin, 2 for Trevor, 3 for freemode male, and 4 for freemode female.
-- componentId is between 0 and 11 and corresponds to the usual component slots.
-- p1 could be the outfit number; unsure.
-- p2 is usually -1; unknown function.
-- p3 appears to be a boolean flag; unknown function.
-- p4 is usually -1; unknown function.
function Global.GetNumPropsFromOutfit(character, p1, p2, p3, p4, componentId)
	return _in(0x9BDF59818B1E38C1, character, p1, p2, p3, p4, componentId, _r, _ri)
end

--- p0 appears to be for MP
function Global.GetNumReservedMissionObjects(p0)
	return _in(0xAA81B5F10BC43AC2, p0, _r, _ri)
end

--- p0 appears to be for MP
function Global.GetNumReservedMissionPeds(p0)
	return _in(0x1F13D5AE5CB17E17, p0, _r, _ri)
end

--- p0 appears to be for MP
function Global.GetNumReservedMissionVehicles(p0)
	return _in(0xCF3A965906452031, p0, _r, _ri)
end

--- Gets the amount of metadata values with the specified key existing in the specified resource's manifest.
-- See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
-- @param resourceName The resource name.
-- @param metadataKey The key to look up in the resource manifest.
function Global.GetNumResourceMetadata(resourceName, metadataKey)
	return _in(0x776e864, _ts(resourceName), _ts(metadataKey), _r, _ri)
end

function Global.GetNumResources()
	return _in(0x863f27b, _r, _ri)
end

--- Returns how many possible mods a vehicle has for a given mod type
function Global.GetNumVehicleMods(vehicle, modType)
	return _in(0xE38E9162A2500646, vehicle, modType, _r, _ri)
end

function Global.GetNumVehicleWindowTints()
	return _in(0x9D1224004B3A6707, _r, _ri)
end

function Global.GetNumberOfActiveBlips()
	return _in(0x9A3FF3DE163034E8, _r, _ri)
end

function Global.GetNumberOfDispatchedUnitsForPlayer(dispatchService)
	return _in(0xEB4A0C2D56441717, dispatchService, _r, _ri)
end
Global.N_0xeb4a0c2d56441717 = Global.GetNumberOfDispatchedUnitsForPlayer

function Global.GetNumberOfEvents(p0)
	return _in(0x5F92A689A06620AA, p0, _r, _ri)
end

function Global.GetNumberOfFiresInRange(x, y, z, radius)
	return _in(0x50CAD495A460B305, x, y, z, radius, _r, _ri)
end

--- Gets the number of instances of the specified script is currently running.
-- Actually returns numInstances - 1.
-- if (scriptPtr)
-- v3 = GetNumberOfInstancesOfScript(scriptPtr) - 1;
-- return v3;
function Global.GetNumberOfInstancesOfScriptWithNameHash(scriptHash)
	return _in(0x2C83A9DA6BFFC4F9, _ch(scriptHash), _r, _ri)
end
Global.GetNumberOfInstancesOfStreamedScript = Global.GetNumberOfInstancesOfScriptWithNameHash

function Global.GetNumberOfPassengerVoiceVariations(p0)
	return _in(0x66E49BF55B4B1874, p0, _r, _ri)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetNumberOfPedDrawableVariations(ped, componentId)
	return _in(0x27561561732A7842, ped, componentId, _r, _ri)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetNumberOfPedPropDrawableVariations(ped, propId)
	return _in(0x5FAF9754E789FB47, ped, propId, _r, _ri)
end

--- Need to check behavior when drawableId = -1
-- - Doofy.Ass
-- Why this function doesn't work and return nill value?
-- GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS(PLAYER.PLAYER_PED_ID(), 0, 5)
-- tick: scripts/addins/menu_execute.lua:51: attempt to call field 'GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS' (a nil value)
-- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetNumberOfPedPropTextureVariations(ped, propId, drawableId)
	return _in(0xA6E7F1CEB523E171, ped, propId, drawableId, _r, _ri)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetNumberOfPedTextureVariations(ped, componentId, drawableId)
	return _in(0x8F7156A3142A6BAD, ped, componentId, drawableId, _r, _ri)
end

--- Gets the number of players in the current session.<br/>If not multiplayer, always returns 1.
function Global.GetNumberOfPlayers()
	return _in(0x407C7F91DDB46C16, _r, _ri)
end

function Global.GetNumberOfStreamingRequests()
	return _in(0x4060057271CEBC89, _r, _ri)
end

--- Actually number of color combinations
function Global.GetNumberOfVehicleColours(vehicle)
	return _in(0x3B963160CD65D41E, vehicle, _r, _ri)
end

--- Returns the number of *types* of licence plates, enumerated below in SET_VEHICLE_NUMBER_PLATE_TEXT_INDEX.
function Global.GetNumberOfVehicleNumberPlates()
	return _in(0x4C4D6B2644F458CB, _r, _ri)
end

function Global.GetObjectFragmentDamageHealth(p0, p1)
	return _in(0xB6FBFD079B8D0596, p0, p1, _r, _rf)
end

--- Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
function Global.GetObjectIndexFromEntityIndex(entity)
	return _in(0xD7E3B9735C0F89D6, entity, _r, _ri)
end

function Global.GetObjectOffsetFromCoords(xPos, yPos, zPos, heading, xOffset, yOffset, zOffset)
	return _in(0x163E252DE035A133, xPos, yPos, zPos, heading, xOffset, yOffset, zOffset, _r, _rv)
end

--- Converts world coords (posX - Z) to coords relative to the entity
-- Example:
-- posX is given as 50
-- entity's x coord is 40
-- the returned x coord will then be 10 or -10, not sure haven't used this in a while (think it is 10 though).
function Global.GetOffsetFromEntityGivenWorldCoords(entity, posX, posY, posZ)
	return _in(0x2274BC1C4885E333, entity, posX, posY, posZ, _r, _rv)
end

--- Offset values are relative to the entity.
-- x = left/right
-- y = forward/backward
-- z = up/down
function Global.GetOffsetFromEntityInWorldCoords(entity, offsetX, offsetY, offsetZ)
	return _in(0x1899F328B0E12848, entity, offsetX, offsetY, offsetZ, _r, _rv)
end

function Global.GetOffsetFromInteriorInWorldCoords(interiorID, x, y, z)
	return _in(0x9E3B3E6D66F6E22F, interiorID, x, y, z, _r, _rv)
end

--- Online version is defined here: update\update.rpf\common\data\version.txt
-- Example:
-- [ONLINE_VERSION_NUMBER]
-- 1.33
-- _GET_ONLINE_VERSION() will return "1.33"
-- Belongs in NETWORK
function Global.GetOnlineVersion()
	return _in(0xFCA9373EF340AC0A, _r, _s)
end
Global.GetGameVersion = Global.GetOnlineVersion

--- Returns NULL unless UPDATE_ONSCREEN_KEYBOARD() returns 1 in the same tick.
function Global.GetOnscreenKeyboardResult()
	return _in(0x8362B09B91893647, _r, _s)
end

--- Returns:
-- 5
-- 10
-- 15
-- 20
-- 25
-- 30
-- 35
function Global.GetPauseMenuState()
	return _in(0x272ACD84970869C5, _r, _ri)
end

function Global.GetPedAccuracy(ped)
	return _in(0x37F4AD56ECBC0CD6, ped, _r, _ri)
end

--- Returns the ped's alertness (0-3).
-- Values :
-- 0 : Neutral
-- 1 : Heard something (gun shot, hit, etc)
-- 2 : Knows (the origin of the event)
-- 3 : Fully alerted (is facing the event?)
-- If the Ped does not exist, returns -1.
function Global.GetPedAlertness(ped)
	return _in(0xF6AA118530443FD2, ped, _r, _ri)
end

function Global.GetPedAmmoByType(ped, ammoType)
	return _in(0x39D22031557946C1, ped, ammoType, _r, _ri)
end

function Global.GetPedAmmoTypeFromWeapon(ped, weaponHash)
	return _in(0x7FEAD38B326B9F74, ped, _ch(weaponHash), _r, _ri)
end
Global.GetPedAmmoType = Global.GetPedAmmoTypeFromWeapon

function Global.GetPedArmour(ped)
	return _in(0x9483AF821605B1D8, ped, _r, _ri)
end

function Global.GetPedAsGroupLeader(groupID)
	return _in(0x5CCE68DBD5FE93EC, groupID, _r, _ri)
end

--- from fm_mission_controller.c4 (variable names changed for clarity):
-- int groupID = PLAYER::GET_PLAYER_GROUP(PLAYER::PLAYER_ID());
-- PED::GET_GROUP_SIZE(group, &amp;unused, &amp;groupSize);
-- if (groupSize &gt;= 1) {
-- . . . . for (int memberNumber = 0; memberNumber &lt; groupSize; memberNumber++) {
-- . . . . . . . . Ped ped1 = PED::GET_PED_AS_GROUP_MEMBER(groupID, memberNumber);
-- . . . . . . . . //and so on
function Global.GetPedAsGroupMember(groupID, memberNumber)
	return _in(0x51455483CF23ED97, groupID, memberNumber, _r, _ri)
end

--- Gets the position of the specified bone of the specified ped.
-- ped: The ped to get the position of a bone from.
-- boneId: The ID of the bone to get the position from. This is NOT the index.
-- offsetX: The X-component of the offset to add to the position relative to the bone's rotation.
-- offsetY: The Y-component of the offset to add to the position relative to the bone's rotation.
-- offsetZ: The Z-component of the offset to add to the position relative to the bone's rotation.
function Global.GetPedBoneCoords(ped, boneId, offsetX, offsetY, offsetZ)
	return _in(0x17C07FC640E86B4E, ped, boneId, offsetX, offsetY, offsetZ, _r, _rv)
end

--- no bone= -1
function Global.GetPedBoneIndex(ped, boneId)
	return _in(0x3F428D08BE5AAE31, ped, boneId, _r, _ri)
end

--- Returns the hash of the weapon/model/object that killed the ped.
function Global.GetPedCauseOfDeath(ped)
	return _in(0x16FFE42AB2D2DC59, ped, _r, _ri)
end

function Global.GetPedCombatMovement(ped)
	return _in(0xDEA92412FCAEB3F5, ped, _r, _ri)
end

function Global.GetPedCombatRange(ped)
	return _in(0xF9D9F7F2DB8E2FA0, ped, _r, _ri)
end

--- p2 is always 1 in the scripts.
-- if (GET_PED_CONFIG_FLAG(ped, 78, 1))
-- = returns true if ped is aiming/shooting a gun
function Global.GetPedConfigFlag(ped, flagId, p2)
	return _in(0x7EE53118C892B513, ped, flagId, p2, _r)
end

function Global.GetPedDecorationsState(ped)
	return _in(0x71EAB450D86954A1, ped, _r, _ri)
end
Global.N_0x71eab450d86954a1 = Global.GetPedDecorationsState

function Global.GetPedDefensiveAreaPosition(ped, p1)
	return _in(0x3C06B8786DD94CD1, ped, p1, _r, _rv)
end

function Global.GetPedDesiredMoveBlendRatio(ped)
	return _in(0x8517D4A6CA8513ED, ped, _r, _rf)
end

--- Ids
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7 - ------
-- 8 - Accessories 1
-- 9 - Accessories 2
-- 10
-- 11 - Auxiliary parts for torso
function Global.GetPedDrawableVariation(ped, componentId)
	return _in(0x67F3780DD425D4FC, ped, componentId, _r, _ri)
end

function Global.GetPedEnveffScale(ped)
	return _in(0x9C14D30395A51A3C, ped, _r, _rf)
end

--- Gets the offset the specified ped has moved since the previous tick.
-- If worldSpace is false, the returned offset is relative to the ped. That is, if the ped has moved 1 meter right and 5 meters forward, it'll return 1,5,0.
-- If worldSpace is true, the returned offset is relative to the world. That is, if the ped has moved 1 meter on the X axis and 5 meters on the Y axis, it'll return 1,5,0.
function Global.GetPedExtractedDisplacement(ped, worldSpace)
	return _in(0xE0AF41401ADF87E3, ped, worldSpace, _r, _rv)
end

--- hash collision???
function Global.GetPedFloodInvincibility(ped, p1)
	return _in(0x2BC338A7B21F4608, ped, p1)
end

--- Returns the group id of which the specified ped is a member of.
function Global.GetPedGroupIndex(ped)
	return _in(0xF162E133B4E7A675, ped, _r, _ri)
end

--- The pointer is to a padded struct that matches the arguments to SET_PED_HEAD_BLEND_DATA(...). There are 4 bytes of padding after each field.
-- (Edit) Console Hash: 0x44E1680C
-- pass this struct in the second parameter
-- typedef struct
-- {
-- int shapeFirst, shapeSecond, shapeThird;
-- int skinFirst, skinSecond, skinThird;
-- float shapeMix, skinMix, thirdMix;
-- } headBlendData;
function Global.GetPedHeadBlendData(ped, headBlendData)
	return _in(0x2746BD9D88C5C5D0, ped, _ii(headBlendData) --[[ may be optional ]], _r)
end

--- Likely a char, if that overlay is not set, e.i. "None" option, returns 255;
function Global.GetPedHeadOverlayValue(ped, overlayID)
	return _in(0xA60EF3B6461A4D43, ped, overlayID, _r, _ri)
end

--- -1 (driver) &lt;= index &lt; GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle)
function Global.GetPedInVehicleSeat(vehicle, index)
	return _in(0xBB40DD2270B65366, vehicle, index, _r, _ri)
end

--- Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
function Global.GetPedIndexFromEntityIndex(entity)
	return _in(0x04A2A40C73395041, entity, _r, _ri)
end

--- Returns a handle to the first entity within the a circle spawned inside the 2 points from a radius. It could return a ped or an entity, but the scripts expect a ped, but still check if it's a ped.
function Global.GetPedInsideExplosionArea(explosionType, x1, y1, z1, x2, y2, z2, radius)
	return _in(0x14BA4BA137AF6CEC, explosionType, x1, y1, z1, x2, y2, z2, radius, _r, _ri)
end

function Global.GetPedLastDamageBone(ped, outBone)
	return _in(0xD75960F6BD9EA49C, ped, _ii(outBone) --[[ may be optional ]], _r)
end

--- Pass ped. Pass address of Vector3.
-- The coord will be put into the Vector3.
-- The return will determine whether there was a coord found or not.
function Global.GetPedLastWeaponImpactCoord(ped, coords)
	return _in(0x6C4D0409BA1A2BC2, ped, _v, _r)
end

function Global.GetPedMaxHealth(ped)
	return _in(0x4700A416E8324EF3, ped, _r, _ri)
end

function Global.GetPedMoney(ped)
	return _in(0x3F69145BBA87BAE7, ped, _r, _ri)
end

--- sizeAndPeds - is a pointer to an array. The array is filled with peds found nearby the ped supplied to the first argument.
-- ignore - ped type to ignore
-- Return value is the number of peds found and added to the array passed.
-- -----------------------------------
-- To make this work in most menu bases at least in C++ do it like so,
-- Formatted Example: pastebin.com/D8an9wwp
-- -----------------------------------
-- Example: gtaforums.com/topic/789788-function-args-to-pedget-ped-nearby-peds/?p=1067386687
function Global.GetPedNearbyPeds(ped, ignore)
	return _in(0x23F8F5FC7E8C4A6B, ped, _i, ignore, _r, _ri)
end

--- Returns size of array, passed into the second variable.
-- See below for usage information.
-- This function actually requires a struct, where the first value is the maximum number of elements to return.  Here is a sample of how I was able to get it to work correctly, without yet knowing the struct format.
-- //Setup the array
-- const int numElements = 10;
-- const int arrSize = numElements * 2 + 2;
-- Any veh[arrSize];
-- //0 index is the size of the array
-- veh[0] = numElements;
-- int count = PED::GET_PED_NEARBY_VEHICLES(PLAYER::PLAYER_PED_ID(), veh);
-- if (veh != NULL)
-- {
-- //Simple loop to go through results
-- for (int i = 0; i &lt; count; i++)
-- {
-- int offsettedID = i * 2 + 2;
-- //Make sure it exists
-- if (veh[offsettedID] != NULL &amp;&amp; ENTITY::DOES_ENTITY_EXIST(veh[offsettedID]))
-- {
-- //Do something
-- }
-- }
-- }
function Global.GetPedNearbyVehicles(ped, sizeAndVehs)
	return _in(0xCFF869CBFA210D82, ped, _ii(sizeAndVehs) --[[ may be optional ]], _r, _ri)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetPedPaletteVariation(ped, componentId)
	return _in(0xE3DD5F2A84B42281, ped, componentId, _r, _ri)
end

--- -1: no landing
-- 0: landing on both feet
-- 1: stumbling
-- 2: rolling
-- 3: ragdoll
function Global.GetPedParachuteLandingType(ped)
	return _in(0x8B9F1FC6AE8166C0, ped, _r, _ri)
end

--- Returns:
-- -1: Normal
-- 0: Wearing parachute on back
-- 1: Parachute opening
-- 2: Parachute open
-- 3: Falling to doom (e.g. after exiting parachute)
-- Normal means no parachute?
function Global.GetPedParachuteState(ped)
	return _in(0x79CFD9827CC979B6, ped, _r, _ri)
end

function Global.GetPedParachuteTintIndex(ped, outTintIndex)
	return _in(0xEAF5F7E5AE7C6C9D, ped, _ii(outTintIndex) --[[ may be optional ]])
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetPedPropIndex(ped, componentId)
	return _in(0x898CC20EA75BACD8, ped, componentId, _r, _ri)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetPedPropTextureIndex(ped, componentId)
	return _in(0xE131A28626F81AB2, ped, componentId, _r, _ri)
end

function Global.GetPedRagdollBoneIndex(ped, bone)
	return _in(0x2057EF813397A772, ped, bone, _r, _ri)
end

function Global.GetPedRelationshipGroupDefaultHash(ped)
	return _in(0x42FDD0F017B1E38E, ped, _r, _ri)
end

function Global.GetPedRelationshipGroupHash(ped)
	return _in(0x7DBDD04862D95F04, ped, _r, _ri)
end

function Global.GetPedResetFlag(ped, flagId)
	return _in(0xAF9E59B1B1FBF2A0, ped, flagId, _r)
end

--- Returns the Entity (Ped, Vehicle, or ?Object?) that killed the 'ped'
-- Is best to check if the Ped is dead before asking for its killer.
function Global.GetPedSourceOfDeath(ped)
	return _in(0x93C8B64DEB84728C, ped, _r, _ri)
end
Global.GetPedKiller = Global.GetPedSourceOfDeath

--- Returns whether the entity is in stealth mode
function Global.GetPedStealthMovement(ped)
	return _in(0x7C2AC9CA66575FBF, ped, _r)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.GetPedTextureVariation(ped, componentId)
	return _in(0x04A355E041E004E6, ped, componentId, _r, _ri)
end

--- Console Hash: 0xDF6D5D54
-- There is no way this is the correct name. The only time this is called it's compared with the game timer and I used this to test something and noticed when I was killed by no matter what it was my 'Time Of Death' via this native was always 0, but my friends was some random big number like so, 147591.
-- Retreives [CPed + 15CC] (as of 944)
function Global.GetPedTimeOfDeath(ped)
	return _in(0x1E98817B311AE98A, ped, _r, _ri)
end

--- Ped Types: (ordered by return priority)
-- Michael = 0
-- Franklin = 1
-- Trevor = 2
-- Army = 29
-- Animal = 28
-- SWAT = 27
-- LSFD = 21
-- Paramedic = 20
-- Cop = 6
-- Male = 4
-- Female = 5
-- Human = 26
-- Note/Exception
-- hc_gunman : 4 // Mix male and female
-- hc_hacker : 4 // Mix male and female
-- mp_f_misty_01 : 4 // Female character
-- s_f_y_ranger_01 : 5 // Ranger
-- s_m_y_ranger_01 : 4 // Ranger
-- s_m_y_uscg_01 : 6 // US Coast Guard
function Global.GetPedType(ped)
	return _in(0xFF059E1E4C01E63C, ped, _r, _ri)
end

--- Quick disassembly and test seems to indicate that this native gets the Ped currently using the specified door.
function Global.GetPedUsingVehicleDoor(vehicle, doorIndex)
	return _in(0x218297BF0CFD853B, vehicle, doorIndex, _r, _ri)
end
Global.N_0x218297bf0cfd853b = Global.GetPedUsingVehicleDoor

function Global.GetPedWaypointDistance(p0)
	return _in(0xE6A877C64CAF1BC5, p0, _r, _rf)
end

function Global.GetPedWaypointProgress(p0)
	return _in(0x2720AAA75001E094, p0, _r, _ri)
end

function Global.GetPedWeaponTintIndex(ped, weaponHash)
	return _in(0x2B9EEDC07BD06B9F, ped, _ch(weaponHash), _r, _ri)
end

function Global.GetPedWeapontypeInSlot(ped, weaponSlot)
	return _in(0xEFFED78E9011134D, ped, _ch(weaponSlot), _r, _ri)
end

--- gtaforums.com/topic/885580-ped-headshotmugshot-txd/
function Global.GetPedheadshotTxdString(handle)
	return _in(0xDB4EACD4AD0A5D6B, handle, _r, _s)
end

function Global.GetPedsJacker(ped)
	return _in(0x9B128DC36C1E04CF, ped, _r, _ri)
end

function Global.GetPhoneGestureAnimCurrentTime(ped)
	return _in(0x47619ABE8B268C60, ped, _r, _rf)
end

function Global.GetPhoneGestureAnimTotalTime(ped)
	return _in(0x1EE0F68A7C25DEC6, ped, _r, _rf)
end

function Global.GetPickupCoords(pickup)
	return _in(0x225B8B35C88029B3, pickup, _r, _rv)
end

function Global.GetPickupObject(pickup)
	return _in(0x5099BC55630B25AE, pickup, _r, _ri)
end
Global.N_0x5099bc55630b25ae = Global.GetPickupObject

function Global.GetPlayerCurrentStealthNoise(player)
	return _in(0x2F395D61F3A1F877, player, _r, _rf)
end

function Global.GetPlayerFromServerId(serverId)
	return _in(0x344ea166, serverId, _r, _ri)
end

--- Returns the group ID the player is member of.
function Global.GetPlayerGroup(player)
	return _in(0x0D127585F77030AF, player, _r, _ri)
end

function Global.GetPlayerHasReserveParachute(player)
	return _in(0x5DDFE2FF727F3CA3, player, _r)
end

--- Called 5 times in the scripts. All occurrences found in b617d, sorted alphabetically and identical lines removed:
-- AUDIO::GET_PLAYER_HEADSET_SOUND_ALTERNATE("INOUT", 0.0);
-- AUDIO::GET_PLAYER_HEADSET_SOUND_ALTERNATE("INOUT", 1.0);
function Global.GetPlayerHeadsetSoundAlternate(p0, p1)
	return _in(0xBCC29F935ED07688, _ts(p0), p1)
end

--- Returns the same as PLAYER_ID and NETWORK_PLAYER_ID_TO_INT
function Global.GetPlayerIndex()
	return _in(0xA5EDC40EF369B48D, _r, _ri)
end

--- Returns the Player's Invincible status.
-- This function will always return false if 0x733A643B5B0C53C1 is used to set the invincibility status. To always get the correct result, use this:
-- bool IsPlayerInvincible(Player player)
-- {
-- auto addr = getScriptHandleBaseAddress(GET_PLAYER_PED(player));
-- if (addr)
-- {
-- DWORD flag = *(DWORD *)(addr + 0x188);
-- return ((flag &amp; (1 &lt;&lt; 8)) != 0) || ((flag &amp; (1 &lt;&lt; 9)) != 0);
-- }
-- return false;
-- }
function Global.GetPlayerInvincible(player)
	return _in(0xB721981B2B939E07, player, _r)
end

function Global.GetPlayerMaxArmour(player)
	return _in(0x92659B4CE1863CB3, player, _r, _ri)
end

function Global.GetPlayerName(player)
	return _in(0x6D0DE6A7B5DA71F8, player, _r, _s)
end

function Global.GetPlayerParachutePackTintIndex(player, tintIndex)
	return _in(0x6E9C742F340CE5A2, player, _ii(tintIndex) --[[ may be optional ]])
end

function Global.GetPlayerParachuteSmokeTrailColor(player)
	return _in(0xEF56DBABD3CD4887, player, _i, _i, _i)
end

--- Tints:
-- None = -1,
-- Rainbow = 0,
-- Red = 1,
-- SeasideStripes = 2,
-- WidowMaker = 3,
-- Patriot = 4,
-- Blue = 5,
-- Black = 6,
-- Hornet = 7,
-- AirFocce = 8,
-- Desert = 9,
-- Shadow = 10,
-- HighAltitude = 11,
-- Airbone = 12,
-- Sunrise = 13,
function Global.GetPlayerParachuteTintIndex(player, tintIndex)
	return _in(0x75D3F7A1B0D9B145, player, _ii(tintIndex) --[[ may be optional ]])
end

--- Gets the local player ped
function Global.GetPlayerPed(player)
	return _in(0x43A66C31C68491C0, player, _r, _ri)
end

function Global.GetPlayerPedIsFollowing(ped)
	return _in(0x6A3975DEA89F9A17, ped, _r, _ri)
end

--- Same as GET_PLAYER_PED.
function Global.GetPlayerPedScriptIndex(player)
	return _in(0x50FAC3A3E030A6E1, player, _r, _ri)
end

function Global.GetPlayerRadioStationGenre()
	return _in(0xA571991A7FE6CCEB, _r, _ri)
end

--- Returns 255 (radio off index) if the function fails.
function Global.GetPlayerRadioStationIndex()
	return _in(0xE8AF77C4C06ADC93, _r, _ri)
end

--- Returns active radio station name
function Global.GetPlayerRadioStationName()
	return _in(0xF6D733C32076AD03, _r, _s)
end

--- Tints:
-- None = -1,
-- Rainbow = 0,
-- Red = 1,
-- SeasideStripes = 2,
-- WidowMaker = 3,
-- Patriot = 4,
-- Blue = 5,
-- Black = 6,
-- Hornet = 7,
-- AirFocce = 8,
-- Desert = 9,
-- Shadow = 10,
-- HighAltitude = 11,
-- Airbone = 12,
-- Sunrise = 13,
function Global.GetPlayerReserveParachuteTintIndex(player, index)
	return _in(0xD5A016BC3C09CF40, player, _ii(index) --[[ may be optional ]])
end

--- Returns RGB color of the player (duh)
function Global.GetPlayerRgbColour(player)
	return _in(0xE902EF951DCE178F, player, _i, _i, _i)
end

function Global.GetPlayerServerId(player)
	return _in(0x4d97bcc7, player, _r, _ri)
end

function Global.GetPlayerShortSwitchState()
	return _in(0x20F898A5D9782800, _r, _ri)
end

function Global.GetPlayerSprintStaminaRemaining(player)
	return _in(0x3F9F16F8E65A7ED7, player, _r, _rf)
end

function Global.GetPlayerSprintTimeRemaining(player)
	return _in(0x1885BC9B108B4C99, player, _r, _rf)
end

function Global.GetPlayerSwitchState()
	return _in(0x470555300D10B2A5, _r, _ri)
end

function Global.GetPlayerSwitchType()
	return _in(0xB3C94A90D9FC9E62, _r, _ri)
end

--- Assigns the handle of locked-on melee target to *entity that you pass it.
-- Returns false if no entity found.
function Global.GetPlayerTargetEntity(player, entity)
	return _in(0x13EDE1A5DBF797C9, player, _ii(entity) --[[ may be optional ]], _r)
end

--- Gets the player's team.<br/>Does nothing in singleplayer.
function Global.GetPlayerTeam(player)
	return _in(0x37039302F4E0A008, player, _r, _ri)
end

function Global.GetPlayerUnderwaterTimeRemaining(player)
	return _in(0xA1FCF8E6AF40B731, player, _r, _rf)
end

function Global.GetPlayerWantedCentrePosition(player)
	return _in(0x0C92BA89F1AF26F8, player, _r, _rv)
end

function Global.GetPlayerWantedLevel(player)
	return _in(0xE28E54788CE8F12D, player, _r, _ri)
end

--- Alternative: GET_VEHICLE_PED_IS_IN(PLAYER_PED_ID(), 1);
function Global.GetPlayersLastVehicle()
	return _in(0xB6997A7EB3F5C8C0, _r, _ri)
end

function Global.GetPositionInRecording(p0)
	return _in(0x2DACD605FC681475, p0, _r, _rf)
end

--- p1 is some kind of tolerance
function Global.GetPositionOfVehicleRecordingAtTime(p0, p1, p2)
	return _in(0xD242728AA6F0FBA2, p0, p1, _ts(p2), _r, _rv)
end

--- Return POSIX timestamp.
function Global.GetPosixTime()
	return _in(0x9A73240B49945C76, _r, _ri)
end
Global.N_0x9a73240b49945c76 = Global.GetPosixTime

--- Gets system time as year, month, day, hour, minute and second.
-- Example usage:
-- int year;
-- int month;
-- int day;
-- int hour;
-- int minute;
-- int second;
-- TIME::GET_POSIX_TIME(&amp;year, &amp;month, &amp;day, &amp;hour, &amp;minute, &amp;second);
function Global.GetPosixTime()
	return _in(0xDA488F299A5B164E, _i, _i, _i, _i, _i, _i)
end

--- Returns current weather name hash
function Global.GetPrevWeatherTypeHashName()
	return _in(0x564B884A05EC45A3, _r, _ri)
end
Global.GetPrevWeatherType = Global.GetPrevWeatherTypeHashName

--- anyone have a settingid dump?
function Global.GetProfileSetting(profileSetting)
	return _in(0xC488FF2356EA7791, profileSetting, _r, _ri)
end

--- outfit = a structure passing though it - see GET_SHOP_PED_QUERY_OUTFIT
-- slot - outfit slot
-- item - hold 3 ints in a struct, you can use Vector3 structure
-- GET_SHOP_PED_???
function Global.GetPropFromOutfit(outfit, slot, item)
	return _in(0x19F2A026EDF0013F, outfit, slot, _ii(item) --[[ may be optional ]], _r)
end

function Global.GetPstatBoolHash(index, spStat, charStat, character)
	return _in(0x80C75307B1C42837, index, spStat, charStat, character, _r, _ri)
end
Global.N_0x80c75307b1c42837 = Global.GetPstatBoolHash

function Global.GetPstatIntHash(index, spStat, charStat, character)
	return _in(0x61E111E323419E07, index, spStat, charStat, character, _r, _ri)
end
Global.N_0x61e111e323419e07 = Global.GetPstatIntHash

--- Returns String with radio station name.
function Global.GetRadioStationName(radioStation)
	return _in(0xB28ECA15046CA8B9, radioStation, _r, _s)
end

function Global.GetRainLevel()
	return _in(0x96695E368AD855F3, _r, _ri)
end

function Global.GetRandomEventFlag()
	return _in(0xD2D57F1D764117B1, _r, _ri)
end

function Global.GetRandomFloatInRange(startRange, endRange)
	return _in(0x313CE5879CEB6FCD, startRange, endRange, _r, _rf)
end

--- Another extremely useful native.
-- You can use it simply like:
-- if (GAMEPLAY::GET_RANDOM_INT_IN_RANGE(0, 2))
-- and the if-statement will count it as false only if the random int is 0. That means there is a one in three chance of it being false. Put a "!" in front and it means there is a one in three chance of it being true.
function Global.GetRandomIntInRange(startRange, endRange)
	return _in(0xD53343AA4FB7DD28, startRange, endRange, _r, _ri)
end

--- Gets a random ped in the x/y/zRadius near the x/y/z coordinates passed.
-- Ped Types:
-- Any = -1
-- Player = 1
-- Male = 4
-- Female = 5
-- Cop = 6
-- Human = 26
-- SWAT = 27
-- Animal = 28
-- Army = 29
function Global.GetRandomPedAtCoord(x, y, z, xRadius, yRadius, zRadius, pedType)
	return _in(0x876046A8E3A4B71C, x, y, z, xRadius, yRadius, zRadius, pedType, _r, _ri)
end

function Global.GetRandomVehicleBackBumperInSphere(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xB50807EABE20A8DC, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.GetRandomVehicleFrontBumperInSphere(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xC5574E0AEB86BA68, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

--- Gets a random vehicle in a sphere at the specified position, of the specified radius.
-- x: The X-component of the position of the sphere.
-- y: The Y-component of the position of the sphere.
-- z: The Z-component of the position of the sphere.
-- radius: The radius of the sphere. Max is 9999.9004.
-- modelHash: The vehicle model to limit the selection to. Pass 0 for any model.
-- flags: The bitwise flags that modifies the behaviour of this function.
function Global.GetRandomVehicleInSphere(x, y, z, radius, modelHash, flags)
	return _in(0x386F6CE5BAF6091C, x, y, z, radius, _ch(modelHash), flags, _r, _ri)
end

--- Not present in the retail version! It's just a nullsub.
-- p0 always true (except in one case)
-- p1 returns a random vehicle hash loaded in memory
-- p2 unsure, maybe returns a different model
function Global.GetRandomVehicleModelInMemory(p0)
	return _in(0x055BF0AC0C34F4FD, p0, _i, _i)
end

function Global.GetRandomVehicleNode(x, y, z, radius, p4, p5, p6)
	return _in(0x93E0DB8440B73A7D, x, y, z, radius, p4, p5, p6, _v, _i, _r)
end

--- Gets the relationship between two groups. This should be called twice (once for each group).
-- Relationship types:
-- 0 = Companion
-- 1 = Respect
-- 2 = Like
-- 3 = Neutral
-- 4 = Dislike
-- 5 = Hate
-- 255 = Pedestrians
-- Example:
-- PED::GET_RELATIONSHIP_BETWEEN_GROUPS(l_1017, 0xA49E591C);
-- PED::GET_RELATIONSHIP_BETWEEN_GROUPS(0xA49E591C, l_1017);
function Global.GetRelationshipBetweenGroups(group1, group2)
	return _in(0x9E6B70061662AE5C, _ch(group1), _ch(group2), _r, _ri)
end

--- Gets the relationship between two peds. This should be called twice (once for each ped).
-- Relationship types:
-- 0 = Companion
-- 1 = Respect
-- 2 = Like
-- 3 = Neutral
-- 4 = Dislike
-- 5 = Hate
-- 255 = Pedestrians
-- (Credits: Inco)
-- Example:
-- PED::GET_RELATIONSHIP_BETWEEN_PEDS(2, l_1017, 0xA49E591C);
-- PED::GET_RELATIONSHIP_BETWEEN_PEDS(2, 0xA49E591C, l_1017);
function Global.GetRelationshipBetweenPeds(ped1, ped2)
	return _in(0xEBA5AD3A0EAF7121, ped1, ped2, _r, _ri)
end

function Global.GetRenderingCam()
	return _in(0x5234F9F10919EABA, _r, _ri)
end

function Global.GetResourceByFindIndex(findIndex)
	return _in(0x387246b7, findIndex, _r, _s)
end

function Global.GetResourceKvpFloat(key)
	return _in(0x35bdceea, _ts(key), _r, _rf)
end

function Global.GetResourceKvpInt(key)
	return _in(0x557b586a, _ts(key), _r, _ri)
end

function Global.GetResourceKvpString(key)
	return _in(0x5240da5a, _ts(key), _r, _s)
end

--- Gets the metadata value at a specified key/index from a resource's manifest.
-- See also: [Resource manifest](https://wiki.fivem.net/wiki/Resource_manifest)
-- @param resourceName The resource name.
-- @param metadataKey The key in the resource manifest.
-- @param index The value index, in a range from [0..GET_NUM_RESOURCE_METDATA-1].
function Global.GetResourceMetadata(resourceName, metadataKey, index)
	return _in(0x964bab1d, _ts(resourceName), _ts(metadataKey), index, _r, _s)
end

--- Gets the room hash key from the room that the specified entity is in. Each room in every interior has a unique key. Returns 0 if the entity is outside.
function Global.GetRoomKeyFromEntity(entity)
	return _in(0x47C2A06D4F5F424B, entity, _r, _ri)
end

--- Returns the room hash key from the current gameplay cam.
function Global.GetRoomKeyFromGameplayCam()
	return _in(0xA6575914D2A0B450, _r, _ri)
end
Global.N_0xa6575914d2a0b450 = Global.GetRoomKeyFromGameplayCam

--- Return the root content id of a job.
function Global.GetRootContentId(p0)
	return _in(0xC0173D6BFF4E0348, p0, _r, _s)
end
Global.N_0xc0173d6bff4e0348 = Global.GetRootContentId

function Global.GetRopeLastVertexCoord(rope)
	return _in(0x21BB0FBD3E217C2D, rope, _r, _ri)
end

--- Get a rope's length.  Can be modified with ROPE_FORCE_LENGTH
function Global.GetRopeLength(rope)
	return _in(0x73040398DFF9A4A6, rope, _r, _rf)
end

function Global.GetRopeVertexCoord(rope, vertex)
	return _in(0xEA61CA8E80F09E4D, rope, vertex, _r, _ri)
end

function Global.GetRopeVertexCount(rope)
	return _in(0x3655F544CD30F0B5, rope, _r, _ri)
end

function Global.GetRotationOfVehicleRecordingAtTime(p0, p1, p2)
	return _in(0x2058206FBE79A8AD, p0, p1, _ii(p2) --[[ may be optional ]], _r, _ri)
end

--- When onGround == true outPosition is a position located on the nearest pavement.
-- When a safe coord could not be found the result of a function is false and outPosition == Vector3.Zero.
-- In the scripts these flags are used: 0, 14, 12, 16, 20, 21, 28. 0 is most commonly used, then 16.
-- 16 works for me, 0 crashed the script.
function Global.GetSafeCoordForPed(x, y, z, onGround, flags)
	return _in(0xB61C8E878A4199CA, x, y, z, onGround, _v, flags, _r)
end

function Global.GetSafePickupCoords(x, y, z, p3, p4)
	return _in(0x6E16BC2503FF1FF0, x, y, z, p3, p4, _r, _rv)
end

--- Gets the scale of safe zone. if the safe zone size scale is max, it will return 1.0.
function Global.GetSafeZoneSize()
	return _in(0xBAF107B6BB2C97F0, _r, _rf)
end

--- Convert a world coordinate into its relative screen coordinate.  (WorldToScreen)
-- Returns a boolean; whether or not the operation was successful. It will return false if the coordinates given are not visible to the rendering camera.
-- For .NET users...
-- VB:
-- Public Shared Function World3DToScreen2d(pos as vector3) As Vector2
-- Dim x2dp, y2dp As New Native.OutputArgument
-- Native.Function.Call(Of Boolean)(Native.Hash.GET_SCREEN_COORD_FROM_WORLD_COORD , pos.x, pos.y, pos.z, x2dp, y2dp)
-- Return New Vector2(x2dp.GetResult(Of Single), y2dp.GetResult(Of Single))
-- End Function
-- C#:
-- Vector2 World3DToScreen2d(Vector3 pos)
-- {
-- var x2dp = new OutputArgument();
-- var y2dp = new OutputArgument();
-- Function.Call&lt;bool&gt;(Hash.GET_SCREEN_COORD_FROM_WORLD_COORD , pos.X, pos.Y, pos.Z, x2dp, y2dp);
-- return new Vector2(x2dp.GetResult&lt;float&gt;(), y2dp.GetResult&lt;float&gt;());
-- }
-- //USE VERY SMALL VALUES FOR THE SCALE OF RECTS/TEXT because it is dramatically larger on screen than in 3D, e.g '0.05' small.
-- Used to be called _WORLD3D_TO_SCREEN2D
-- I thought we lost you from the scene forever. It does seem however that calling SET_DRAW_ORIGIN then your natives, then ending it. Seems to work better for certain things such as keeping boxes around people for a predator missile e.g.
function Global.GetScreenCoordFromWorldCoord(worldX, worldY, worldZ)
	return _in(0x34E82F05DF2974F5, worldX, worldY, worldZ, _f, _f, _r)
end
Global.World3dToScreen2d = Global.GetScreenCoordFromWorldCoord

--- World to relative screen coords
-- this world to screen will keep the text on screen. it will keep it in the screen pos
function Global.GetScreenCoordFromWorldCoord(worldX, worldY, worldZ)
	return _in(0xF9904D11F1ACBEC3, worldX, worldY, worldZ, _f, _f, _r)
end
Global.N_0xf9904d11f1acbec3 = Global.GetScreenCoordFromWorldCoord

--- Returns whether the specified screen effect is active.
-- See the effects list in _START_SCREEN_EFFECT
function Global.GetScreenEffectIsActive(effectName)
	return _in(0x36AD3E690DA5ACEB, _ts(effectName), _r)
end

--- int screenresx,screenresy;
-- GET_SCREEN_RESOLUTION(&amp;screenresx,&amp;screenresy);
function Global.GetScreenResolution()
	return _in(0x888D57E407E63624, _i, _i)
end

--- Gets the status of a script-assigned task. The hash does not seem to match the actual native name, but is assigned hardcoded from the executable during task creation.
-- Statuses are specific to tasks, in addition '7' means the specified task is not assigned to the ped.
-- A few hashes found in the executable (although not a complete list) can be found at pastebin.com/R9iK6M9W as it was too long for this wiki.
function Global.GetScriptTaskStatus(targetPed, taskHash)
	return _in(0x77F1BEB8863288D5, targetPed, _ch(taskHash), _r, _ri)
end

function Global.GetScriptedCoverPointCoords(coverpoint)
	return _in(0x594A1028FC2A3E85, coverpoint, _r, _rv)
end

function Global.GetSeatPedIsTryingToEnter(ped)
	return _in(0x6F4C85ACD641BCD2, ped, _r, _ri)
end

--- Returns the hash of the weapon.
-- var num7 = WEAPON::GET_SELECTED_PED_WEAPON(num4);
-- sub_27D3(num7);
-- switch (num7)
-- {
-- case 0x24B17070:
-- Also see WEAPON::GET_CURRENT_PED_WEAPON. Difference?
-- -------------------------------------------------------------------------
-- The difference is that GET_SELECTED_PED_WEAPON simply returns the ped's current weapon hash but GET_CURRENT_PED_WEAPON also checks the weapon object and returns true if the hash of the weapon object equals the weapon hash
function Global.GetSelectedPedWeapon(ped)
	return _in(0x0A6DB4965674D243, ped, _r, _ri)
end

--- returned values:
-- 0 to 7 = task that's currently in progress, 0 meaning the first one.
function Global.GetSequenceProgress(ped)
	return _in(0x00A9010CFE1E3533, ped, _r, _ri)
end

--- Parameters:
-- rayHandle - Ray Handle from a casted ray, as returned by CAST_RAY_POINT_TO_POINT
-- hit - Where to store whether or not it hit anything. False is when the ray reached its destination.
-- endCoords - Where to store the world-coords of where the ray was stopped (by hitting its desired max range or by colliding with an entity/the map)
-- surfaceNormal - Where to store the surface-normal coords (NOT relative to the game world) of where the entity was hit by the ray
-- entityHit - Where to store the handle of the entity hit by the ray
-- Returns:
-- Result? Some type of enum.
-- NOTE: To get the offset-coords of where the ray hit relative to the entity that it hit (which is NOT the same as surfaceNormal), you can use these two natives:
-- Vector3 offset = ENTITY::GET_OFFSET_FROM_ENTITY_GIVEN_WORLD_COORDS(entityHit, endCoords.x, endCoords.y, endCoords.z);
-- Vector3 entitySpotCoords = ENTITY::GET_OFFSET_FROM_ENTITY_IN_WORLD_COORDS(entityHit, offset.x, offset.y, offset.z);
-- Use ENTITY::GET_ENTITY_TYPE(entityHit) to quickly distinguish what type of entity you hit (ped/vehicle/object - 1/2/3)
function Global.GetShapeTestResult(rayHandle)
	return _in(0x3D87450E15D98694, rayHandle, _i --[[ actually bool ]], _v, _v, _i, _r, _ri)
end
Global.GetRaycastResult = Global.GetShapeTestResult

--- behaves exactly the same way as GET_SHAPE_TEST_RESULT except it has one extra parameter (_materialHash).
-- Quick disassembly seems to indicate that the unknown is a hash. EDIT: Seems to be the hash of the hit material or surface type.
-- found a materialFX.dat list of them but not sure if it has to do with this native yet.
function Global.GetShapeTestResultEx(rayHandle)
	return _in(0x65287525D951F6BE, rayHandle, _i --[[ actually bool ]], _v, _v, _i, _i, _r, _ri)
end
Global.N_0x65287525d951f6be = Global.GetShapeTestResultEx

function Global.GetShopPedComponent(p0, p1)
	return _in(0x74C0E2A57EC66760, _ch(p0), _ii(p1) --[[ may be optional ]])
end

function Global.GetShopPedOutfit(p0, p1)
	return _in(0xB7952076E444979D, p0, _ii(p1) --[[ may be optional ]])
end

function Global.GetShopPedOutfitLocate(p0)
	return _in(0x073CA26B079F956E, p0, _r, _ri)
end
Global.N_0x073ca26b079f956e = Global.GetShopPedOutfitLocate

function Global.GetShopPedQueryComponent(componentId, outComponent)
	return _in(0x249E310B2D920699, componentId, _ii(outComponent) --[[ may be optional ]])
end

--- struct Outfit_s
-- {
-- int mask, torso, pants, parachute, shoes, misc1, tops1, armour, crew, tops2, hat, glasses, earpiece;
-- int maskTexture, torsoTexture, pantsTexture, parachuteTexture, shoesTexture, misc1Texture, tops1Texture,
-- armourTexture, crewTexture, tops2Texture, hatTexture, glassesTexture, earpieceTexture;
-- };
function Global.GetShopPedQueryOutfit(p0, outfit)
	return _in(0x6D793F03A631FE56, p0, _ii(outfit) --[[ may be optional ]])
end

function Global.GetShopPedQueryProp(p0, p1)
	return _in(0xDE44A00999B2837D, p0, _ii(p1) --[[ may be optional ]])
end

function Global.GetSnowLevel()
	return _in(0xC5868A966E5BE3AE, _r, _ri)
end

function Global.GetSoundId()
	return _in(0x430386FE9BF80B45, _r, _ri)
end

function Global.GetSoundIdFromNetworkId(netId)
	return _in(0x75262FD12D0A1C84, netId, _r, _ri)
end
Global.N_0x75262fd12d0a1c84 = Global.GetSoundIdFromNetworkId

--- locked is 0 if no door is found
-- locked is 0 if door is unlocked
-- locked is 1 if door is found and unlocked.
-- -------------
-- the locked bool is either 0(unlocked)(false) or 1(locked)(true)
function Global.GetStateOfClosestDoorOfType(type, x, y, z)
	return _in(0xEDC1A5B84AEF33FF, _ch(type), x, y, z, _i --[[ actually bool ]], _f)
end

function Global.GetStreamPlayTime()
	return _in(0x4E72BBDBCA58A3DB, _r, _ri)
end

--- Determines the name of the street which is the closest to the given coordinates.
-- x,y,z - the coordinates of the street
-- streetName - returns a hash to the name of the street the coords are on
-- crossingRoad - if the coordinates are on an intersection, a hash to the name of the crossing road
-- Note: the names are returned as hashes, the strings can be returned using the function UI::GET_STREET_NAME_FROM_HASH_KEY.
function Global.GetStreetNameAtCoord(x, y, z)
	return _in(0x2EB41072B4C1E4C0, x, y, z, _i, _i)
end

--- This functions converts the hash of a street name into a readable string.
-- For how to get the hashes, see PATHFIND::GET_STREET_NAME_AT_COORD.
function Global.GetStreetNameFromHashKey(hash)
	return _in(0xD0EF8A959B8A4CB9, _ch(hash), _r, _s)
end

--- p0 = VEHICLE_NODE_ID
-- Returns false for nodes that aren't used for GPS routes.
-- Example:
-- Nodes in Fort Zancudo and LSIA are false
function Global.GetSupportsGpsRouteFlag(nodeID)
	return _in(0xA2AE5C478B96E3B6, nodeID, _r)
end
Global.N_0xa2ae5c478b96e3b6 = Global.GetSupportsGpsRouteFlag

function Global.GetSynchronizedScenePhase(sceneID)
	return _in(0xE4A310B1D7FA73CC, sceneID, _r, _rf)
end

function Global.GetSynchronizedSceneRate(sceneID)
	return _in(0xD80932D577274D40, sceneID, _r, _rf)
end

--- Returns the zoneID for the overlay if it is a member of collection.
-- enum TattooZoneData
-- {
-- ZONE_TORSO = 0,
-- ZONE_HEAD = 1,
-- ZONE_LEFT_ARM = 2,
-- ZONE_RIGHT_ARM = 3,
-- ZONE_LEFT_LEG = 4,
-- ZONE_RIGHT_LEG = 5,
-- ZONE_UNKNOWN = 6,
-- ZONE_NONE = 7,
-- };
function Global.GetTattooZone(collection, overlay)
	return _in(0x9FD452BFBE7A7A8B, _ch(collection), _ch(overlay), _r, _ri)
end

--- This get's the height of the FONT and not the total text. You need to get the number of lines your text uses, and get the height of a newline (I'm using a smaller value) to get the total text height.
function Global.GetTextScaleHeight(size, font)
	return _in(0xDB88A37483346780, size, font, _r, _rf)
end
Global.N_0xdb88a37483346780 = Global.GetTextScaleHeight

--- Returns a substring of a specified length starting at a specified position.
-- Example:
-- // Get "STRING" text from "MY_STRING"
-- subStr = UI::_GET_TEXT_SUBSTRING("MY_STRING", 3, 6);
function Global.GetTextSubstring(text, position, length)
	return _in(0x169BD9382084C8C0, _ts(text), position, length, _r, _s)
end

--- Returns a substring of a specified length starting at a specified position. The result is guaranteed not to exceed the specified max length.
-- NOTE: The 'maxLength' parameter might actually be the size of the buffer that is returned. More research is needed. -CL69
-- Example:
-- // Condensed example of how Rockstar uses this function
-- strLen = UI::GET_LENGTH_OF_LITERAL_STRING(GAMEPLAY::GET_ONSCREEN_KEYBOARD_RESULT());
-- subStr = UI::_GET_TEXT_SUBSTRING_SAFE(GAMEPLAY::GET_ONSCREEN_KEYBOARD_RESULT(), 0, strLen, 63);
-- --
-- "fm_race_creator.ysc", line 85115:
-- // parameters modified for clarity
-- BOOL sub_8e5aa(char *text, int length) {
-- for (i = 0; i &lt;= (length - 2); i += 1) {
-- if (!GAMEPLAY::ARE_STRINGS_EQUAL(UI::_GET_TEXT_SUBSTRING_SAFE(text, i, i + 1, 1), " ")) {
-- return FALSE;
-- }
-- }
-- return TRUE;
-- }
function Global.GetTextSubstringSafe(text, position, length, maxLength)
	return _in(0xB2798643312205C5, _ts(text), position, length, maxLength, _r, _s)
end

--- Returns a substring that is between two specified positions. The length of the string will be calculated using (endPosition - startPosition).
-- Example:
-- // Get "STRING" text from "MY_STRING"
-- subStr = UI::_GET_TEXT_SUBSTRING_SLICE("MY_STRING", 3, 9);
-- // Overflows are possibly replaced with underscores (needs verification)
-- subStr = UI::_GET_TEXT_SUBSTRING_SLICE("MY_STRING", 3, 10); // "STRING_"?
function Global.GetTextSubstringSlice(text, startPosition, endPosition)
	return _in(0xCE94AEBA5D82908A, _ts(text), startPosition, endPosition, _r, _s)
end

--- Returns the texture resolution of the passed texture dict+name.
-- Note: Most texture resolutions are doubled compared to the console version of the game.
function Global.GetTextureResolution(textureDict, textureName)
	return _in(0x35736EE65BD00C11, _ts(textureDict), _ts(textureName), _r, _rv)
end

function Global.GetThisScriptName()
	return _in(0x442E0A7EDE4A738A, _r, _s)
end

function Global.GetTimeAsString(time)
	return _in(0x9E23B1777A927DAD, time, _r, _s)
end
Global.FormatTime = Global.GetTimeAsString

--- Subtracts the second argument from the first.
function Global.GetTimeDifference(timeA, timeB)
	return _in(0xA2C6FC031D46FFF0, timeA, timeB, _r, _ri)
end

--- Adds the first argument to the second.
function Global.GetTimeOffset(timeA, timeB)
	return _in(0x017008CCDAD48503, timeA, timeB, _r, _ri)
end

function Global.GetTimePositionInRecording(p0)
	return _in(0x5746F3A7AB7FE544, p0, _r, _rf)
end

--- Returns the time since the character was arrested in (ms) milliseconds.
-- example
-- var time = Function.call&lt;int&gt;(Hash.GET_TIME_SINCE_LAST_ARREST();
-- UI.DrawSubtitle(time.ToString());
-- if player has not been arrested, the int returned will be -1.
function Global.GetTimeSinceLastArrest()
	return _in(0x5063F92F07C2A316, _r, _ri)
end

--- Returns the time since the character died in (ms) milliseconds.
-- example
-- var time = Function.call&lt;int&gt;(Hash.GET_TIME_SINCE_LAST_DEATH();
-- UI.DrawSubtitle(time.ToString());
-- if player has not died, the int returned will be -1.
function Global.GetTimeSinceLastDeath()
	return _in(0xC7034807558DDFCA, _r, _ri)
end

function Global.GetTimeSincePlayerDroveAgainstTraffic(player)
	return _in(0xDB89591E290D9182, player, _r, _ri)
end

function Global.GetTimeSincePlayerDroveOnPavement(player)
	return _in(0xD559D2BE9E37853B, player, _r, _ri)
end

function Global.GetTimeSincePlayerHitPed(player)
	return _in(0xE36A25322DC35F42, player, _r, _ri)
end

function Global.GetTimeSincePlayerHitVehicle(player)
	return _in(0x5D35ECF3A81A0EE0, player, _r, _ri)
end

--- Only use for this in the PC scripts is:
-- if (GRAPHICS::GET_TIMECYCLE_MODIFIER_INDEX() != -1)
-- For a full list, see here: pastebin.com/cnk7FTF2
function Global.GetTimecycleModifierIndex()
	return _in(0xFDF3D97C674AFB66, _r, _ri)
end

function Global.GetTotalDurationOfVehicleRecording(p0, p1)
	return _in(0x0E48D1C262390950, p0, p1, _r, _ri)
end

function Global.GetTotalDurationOfVehicleRecordingId(p0)
	return _in(0x102D125411A7B6E6, p0, _r, _rf)
end

function Global.GetTotalScInboxIds()
	return _in(0x03A93FF1A2CA0864, _r, _ri)
end
Global.N_0x03a93ff1a2ca0864 = Global.GetTotalScInboxIds

--- Corrected p1. it's basically the 'carriage/trailer number'. So if the train has 3 trailers you'd call the native once with a var or 3 times with 1, 2, 3.
function Global.GetTrainCarriage(train, trailerNumber)
	return _in(0x08AAFD0814722BC3, train, trailerNumber, _r, _ri)
end

--- Return the content modifier id (the tunables context if you want) of a specific content.
-- It takes the content hash (which is the mission id hash), and return the content modifier id, used as the tunables context.
-- The mission id can be found on the Social club, for example, 'socialclub.rockstargames.com/games/gtav/jobs/job/A8M6Bz8MLEC5xngvDCzGwA'
-- 'A8M6Bz8MLEC5xngvDCzGwA' is the mission id, so the game hash this and use it as the parameter for this native.
function Global.GetTunablesContentModifierId(contentHash)
	return _in(0x187382F8A3E0A6C3, _ch(contentHash), _r, _ri)
end
Global.N_0x187382f8a3e0a6c3 = Global.GetTunablesContentModifierId

function Global.GetTupstatBoolHash(index, spStat, charStat, character)
	return _in(0xC4BB08EE7907471E, index, spStat, charStat, character, _r, _ri)
end
Global.N_0xc4bb08ee7907471e = Global.GetTupstatBoolHash

function Global.GetTupstatIntHash(index, spStat, charStat, character)
	return _in(0xD16C2AD6B8E32854, index, spStat, charStat, character, _r, _ri)
end
Global.N_0xd16c2ad6b8e32854 = Global.GetTupstatIntHash

function Global.GetTvChannel()
	return _in(0xFC1E275A90D39995, _r, _ri)
end

function Global.GetTvVolume()
	return _in(0x2170813D3DD8661B, _r, _rf)
end

--- Returns the user's defined langauge as ID
-- english: 12
-- french = 7
-- german = 22
-- italian = 21
-- japanese = 9
-- korean = 17
-- portuguese = 16
-- spanish = 10
-- russian = 25
function Global.GetUserLanguageId()
	return _in(0xA8AE43AEC1A61314, _r, _ri)
end

--- console hash: 0xC589CD7D = GET_UTC_TIME
-- gets current UTC time
function Global.GetUtcTime()
	return _in(0x8117E09A19EEF4D3, _i, _i, _i, _i, _i, _i)
end
Global.GetLocalTime = Global.GetUtcTime

function Global.GetVariantComponent(componentHash, componentId)
	return _in(0x6E11F282F11863B6, _ch(componentHash), componentId, _i, _i, _i)
end

function Global.GetVehicleAcceleration(vehicle)
	return _in(0x478321, vehicle, _r, _rf)
end

--- static - max acceleration
function Global.GetVehicleAcceleration(vehicle)
	return _in(0x5DD35C8D074E57AE, vehicle, _r, _rf)
end

function Global.GetVehicleAlarmTimeLeft(vehicle)
	return _in(0xc62aac98, vehicle, _r, _ri)
end

--- Returns attached vehicle (Vehicle in parameter must be cargobob)
function Global.GetVehicleAttachedToCargobob(cargobob)
	return _in(0x873B82D42AC2B9E5, cargobob, _r, _ri)
end

--- Get the vehicle attached to the object/entity? May also just convert it to a vehicle, but I'm not sure.
function Global.GetVehicleAttachedToEntity(object)
	return _in(0x375E7FC44F21C8AB, object, _r, _ri)
end
Global.N_0x375e7fc44f21c8ab = Global.GetVehicleAttachedToEntity

--- Seems related to vehicle health, like the one in IV.
-- Max 1000, min 0.
-- Vehicle does not necessarily explode or become undrivable at 0.
function Global.GetVehicleBodyHealth(vehicle)
	return _in(0xF271147EB7B40F12, vehicle, _r, _rf)
end

--- 0 min 100 max
-- starts at 100
-- Seams to have health zones
-- Front of vehicle when damaged goes from 100-50 and stops at 50.
-- Rear can be damaged from 100-0
-- Only tested with two cars.
-- any idea how this differs from the first one?
-- --
-- May return the vehicle health on a scale of 0.0 - 100.0 (needs to be confirmed)
-- example:
-- v_F = ENTITY::GET_ENTITY_MODEL(v_3);
-- if (((v_F == ${tanker}) || (v_F == ${armytanker})) || (v_F == ${tanker2})) {
-- if (VEHICLE::_GET_VEHICLE_BODY_HEALTH_2(v_3) &lt;= 1.0) {
-- NETWORK::NETWORK_EXPLODE_VEHICLE(v_3, 1, 1, -1);
-- }
-- }
function Global.GetVehicleBodyHealth_2(vehicle)
	return _in(0xB8EF61207C2393A9, vehicle, _r, _rf)
end

--- iVar3 = get_vehicle_cause_of_destruction(uLocal_248[iVar2]);
-- if (iVar3 == joaat("weapon_stickybomb"))
-- {
-- func_171(726);
-- iLocal_260 = 1;
-- }
function Global.GetVehicleCauseOfDestruction(vehicle)
	return _in(0xE495D1EF4C91FD20, vehicle, _r, _ri)
end

--- Returns an int
-- Vehicle Classes:
-- 0: Compacts
-- 1: Sedans
-- 2: SUVs
-- 3: Coupes
-- 4: Muscle
-- 5: Sports Classics
-- 6: Sports
-- 7: Super
-- 8: Motorcycles
-- 9: Off-road
-- 10: Industrial
-- 11: Utility
-- 12: Vans
-- 13: Cycles
-- 14: Boats
-- 15: Helicopters
-- 16: Planes
-- 17: Service
-- 18: Emergency
-- 19: Military
-- 20: Commercial
-- 21: Trains
-- char buffer[128];
-- std::sprintf(buffer, "VEH_CLASS_%i", VEHICLE::GET_VEHICLE_CLASS(vehicle));
-- char* className = UI::_GET_LABEL_TEXT(buffer);
function Global.GetVehicleClass(vehicle)
	return _in(0x29439776AAA00A62, vehicle, _r, _ri)
end

--- For a full enum, see here : pastebin.com/i2GGAjY0
-- char buffer[128];
-- std::sprintf(buffer, "VEH_CLASS_%i", VEHICLE::GET_VEHICLE_CLASS_FROM_NAME (hash));
-- char* className = UI::_GET_LABEL_TEXT(buffer);
function Global.GetVehicleClassFromName(modelHash)
	return _in(0xDEDF1C8BD47C2200, _ch(modelHash), _r, _ri)
end

function Global.GetVehicleClassMaxAcceleration(vehicleClass)
	return _in(0x2F83E7E45D9EA7AE, vehicleClass, _r, _rf)
end

function Global.GetVehicleClassMaxAgility(vehicleClass)
	return _in(0x4F930AD022D6DE3B, vehicleClass, _r, _rf)
end

function Global.GetVehicleClassMaxBraking(vehicleClass)
	return _in(0x4BF54C16EC8FEC03, vehicleClass, _r, _rf)
end

function Global.GetVehicleClassMaxTraction(vehicleClass)
	return _in(0xDBC86D85C5059461, vehicleClass, _r, _rf)
end

function Global.GetVehicleClutch(vehicle)
	return _in(0x1dad4583, vehicle, _r, _rf)
end

--- What's this for? Primary and Secondary RGB have their own natives and this one doesn't seem specific.
function Global.GetVehicleColor(vehicle)
	return _in(0xF3CC740D36221548, vehicle, _i, _i, _i)
end

function Global.GetVehicleColourCombination(vehicle)
	return _in(0x6A842D197F845D56, vehicle, _r, _ri)
end

function Global.GetVehicleColours(vehicle)
	return _in(0xA19435F193E081AC, vehicle, _i, _i)
end

function Global.GetVehicleCurrentGear(vehicle)
	return _in(0xb4f4e566, vehicle, _r, _ri)
end

function Global.GetVehicleCurrentRpm(vehicle)
	return _in(0xe7b12b54, vehicle, _r, _rf)
end

function Global.GetVehicleCustomPrimaryColour(vehicle)
	return _in(0xB64CF2CCA9D95F52, vehicle, _i, _i, _i)
end

function Global.GetVehicleCustomSecondaryColour(vehicle)
	return _in(0x8389CD56CA8072DC, vehicle, _i, _i, _i)
end

function Global.GetVehicleDashboardSpeed(vehicle)
	return _in(0x9aad420e, vehicle, _r, _rf)
end

--- Returns hash of default vehicle horn
-- Hash is stored in audVehicleAudioEntity
function Global.GetVehicleDefaultHorn(vehicle)
	return _in(0x02165D55000219AC, vehicle, _r, _ri)
end

--- The only example I can find of this function in the scripts, is this:
-- struct _s = VEHICLE::GET_VEHICLE_DEFORMATION_AT_POS(rPtr((A_0) + 4), 1.21f, 6.15f, 0.3f);
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- PC scripts:
-- v_5/*{3}*/ = VEHICLE::GET_VEHICLE_DEFORMATION_AT_POS(a_0._f1, 1.21, 6.15, 0.3);
function Global.GetVehicleDeformationAtPos(vehicle, offsetX, offsetY, offsetZ)
	return _in(0x4EC6CFBC7B2E9536, vehicle, offsetX, offsetY, offsetZ, _r, _rv)
end

--- Dirt level 0..15
function Global.GetVehicleDirtLevel(vehicle)
	return _in(0x8F17BC8BA08DA62B, vehicle, _r, _rf)
end

--- example in vb:
-- Public Shared Function Get_Vehicle_Door_Angle(Vehicle As Vehicle, Door As VehicleDoor) As Single
-- Return Native.Function.Call(Of Single)(Hash.GET_VEHICLE_DOOR_ANGLE_RATIO, Vehicle.Handle, Door)
-- End Function
-- I'm Not MentaL
function Global.GetVehicleDoorAngleRatio(vehicle, door)
	return _in(0xFE3F9C29F7B32BD5, vehicle, door, _r, _rf)
end

--- 2 seems to disable getting vehicle in modshop
function Global.GetVehicleDoorLockStatus(vehicle)
	return _in(0x25BC98A59C2EA962, vehicle, _r, _ri)
end

function Global.GetVehicleDoorsLockedForPlayer(vehicle, player)
	return _in(0xF6AF6CB341349015, vehicle, player, _r)
end

--- Returns 1000.0 if the function is unable to get the address of the specified vehicle or if it's not a vehicle.
-- Minimum: -4000
-- Maximum: 1000
-- -4000: Engine is destroyed
-- 0 and below: Engine catches fire and health rapidly declines
-- 300: Engine is smoking and losing functionality
-- 1000: Engine is perfect
function Global.GetVehicleEngineHealth(vehicle)
	return _in(0xC45D23BAF168AAB8, vehicle, _r, _rf)
end

function Global.GetVehicleEngineTemperature(vehicle)
	return _in(0xf4f495cb, vehicle, _r, _rf)
end

--- formerly known as _GET_VEHICLE_PAINT_FADE
-- The result is a value from 0-1, where 0 is fresh paint.
-- -----------------------------------------------------------------------
-- The actual value isn't stored as a float but as an unsigned char (BYTE).
function Global.GetVehicleEnveffScale(vehicle)
	return _in(0xA82819CAC9C4C403, vehicle, _r, _rf)
end
Global.GetVehiclePaintFade = Global.GetVehicleEnveffScale

function Global.GetVehicleExtraColours(vehicle)
	return _in(0x3BC4245933A166F7, vehicle, _i, _i)
end

function Global.GetVehicleFuelLevel(vehicle)
	return _in(0x5f739bb8, vehicle, _r, _rf)
end

function Global.GetVehicleGravityAmount(vehicle)
	return _in(0xb48a1292, vehicle, _r, _rf)
end

function Global.GetVehicleHandbrake(vehicle)
	return _in(0x483b013c, vehicle, _r)
end

function Global.GetVehicleHighGear(vehicle)
	return _in(0xf1d1d689, vehicle, _r, _rf)
end

--- Seems to get the hash of the vehicle's currently installed horn?
function Global.GetVehicleHornHash(vehicle)
	return _in(0xACB5DCCA1EC76840, vehicle, _r, _ri)
end
Global.N_0xacb5dcca1ec76840 = Global.GetVehicleHornHash

--- Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
function Global.GetVehicleIndexFromEntityIndex(entity)
	return _in(0x4B53F92932ADFAC0, entity, _r, _ri)
end

--- Gets the vehicle indicator light state. 0 = off, 1 = left, 2 = right, 3 = both
-- @return An integer.
function Global.GetVehicleIndicatorLights(vehicle)
	return _in(0x83070354, vehicle, _r, _ri)
end

function Global.GetVehicleLayoutHash(vehicle)
	return _in(0x28D37D4F71AC5C58, vehicle, _r, _ri)
end

function Global.GetVehicleLightsState(vehicle)
	return _in(0xB91B4C20085BD12F, vehicle, _i --[[ actually bool ]], _i --[[ actually bool ]], _r)
end

--- -1 = no livery
function Global.GetVehicleLivery(vehicle)
	return _in(0x2BB9230590DA5E8A, vehicle, _r, _ri)
end

--- Returns -1 if the vehicle has no livery
function Global.GetVehicleLiveryCount(vehicle)
	return _in(0x87B63E25A529D526, vehicle, _r, _ri)
end

function Global.GetVehicleMaxBraking(vehicle)
	return _in(0xAD7E85FC227197C4, vehicle, _r, _rf)
end

function Global.GetVehicleMaxNumberOfPassengers(vehicle)
	return _in(0xA7C4F2C6E744A550, vehicle, _r, _ri)
end

function Global.GetVehicleMaxTraction(vehicle)
	return _in(0xA132FB5370554DB0, vehicle, _r, _rf)
end

--- In b944, there are 50 (0 - 49) mod types.
-- Returns -1 if the vehicle mod is stock
function Global.GetVehicleMod(vehicle, modType)
	return _in(0x772960298DA26FDB, vehicle, modType, _r, _ri)
end

function Global.GetVehicleModColor_1(vehicle)
	return _in(0xE8D65CA700C9A693, vehicle, _i, _i, _i)
end

--- returns a string which is the codename of the vehicle's currently selected primary color
-- p1 is always 0
function Global.GetVehicleModColor_1Name(vehicle, p1)
	return _in(0xB45085B721EFD38C, vehicle, p1, _r, _s)
end
Global.N_0xb45085b721efd38c = Global.GetVehicleModColor_1Name

function Global.GetVehicleModColor_2(vehicle)
	return _in(0x81592BE4E3878728, vehicle, _i, _i)
end

--- returns a string which is the codename of the vehicle's currently selected secondary color
function Global.GetVehicleModColor_2Name(vehicle)
	return _in(0x4967A516ED23A5A1, vehicle, _r, _s)
end
Global.N_0x4967a516ed23a5a1 = Global.GetVehicleModColor_2Name

--- Can be used for IS_DLC_VEHICLE_MOD and _0xC098810437312FFF
function Global.GetVehicleModData(vehicle, modType, modIndex)
	return _in(0x4593CF82AA179706, vehicle, modType, modIndex, _r, _ri)
end
Global.N_0x4593cf82aa179706 = Global.GetVehicleModData

function Global.GetVehicleModKit(vehicle)
	return _in(0x6325D1A044AE510D, vehicle, _r, _ri)
end

function Global.GetVehicleModKitType(vehicle)
	return _in(0xFC058F5121E54C32, vehicle, _r, _ri)
end

function Global.GetVehicleModModifierValue(vehicle, modType, modIndex)
	return _in(0x90A38E9838E0A8C1, vehicle, modType, modIndex, _r, _ri)
end

--- Only used for wheels(ModType = 23/24) Returns true if the wheels are custom wheels
function Global.GetVehicleModVariation(vehicle, modType)
	return _in(0xB3924ECD70E095DC, vehicle, modType, _r)
end

--- Returns the acceleration of the specified model.
-- For a full list, see here: pastebin.com/GaN6vT4R
function Global.GetVehicleModelAcceleration(modelHash)
	return _in(0x8C044C5C84505B6A, _ch(modelHash), _r, _rf)
end

--- Returns max braking of the specified vehicle model.
-- For a full list, see here: pastebin.com/3N8DVbpG
function Global.GetVehicleModelMaxBraking(modelHash)
	return _in(0xDC53FD41B4ED944C, _ch(modelHash), _r, _rf)
end

--- Returns max speed (without mods) of the specified vehicle model in m/s.
-- For a full list, see here: pastebin.com/AUuHHK06
-- GET_VEHICLE_MODEL_*
function Global.GetVehicleModelMaxSpeed(modelHash)
	return _in(0xF417C2502FFFED43, _ch(modelHash), _r, _rf)
end
Global.GetVehicleMaxSpeed = Global.GetVehicleModelMaxSpeed

--- Returns max traction of the specified vehicle model.
-- For a full list, see here: pastebin.com/ERnntVjK
function Global.GetVehicleModelMaxTraction(modelHash)
	return _in(0x539DE94D44FDFD0D, _ch(modelHash), _r, _rf)
end

--- Returns max number of passengers (including the driver) for the specified vehicle model.
-- For a full list, see here: pastebin.com/MdETCS1j
function Global.GetVehicleModelNumberOfSeats(modelHash)
	return _in(0x2AD93716F184EDA4, _ch(modelHash), _r, _ri)
end
Global.GetVehicleModelMaxNumberOfPassengers = Global.GetVehicleModelNumberOfSeats

--- Gets the color of the neon lights of the specified vehicle.
-- See _SET_VEHICLE_NEON_LIGHTS_COLOUR (0x8E0A582209A62695) for more information
function Global.GetVehicleNeonLightsColour(vehicle)
	return _in(0x7619EEE8C886757F, vehicle, _i, _i, _i)
end

function Global.GetVehicleNextGear(vehicle)
	return _in(0xddb298ae, vehicle, _r, _ri)
end

--- Calling this with an invalid node id, will crash the game.
-- Note that IS_VEHICLE_NODE_ID_VALID simply checks if nodeId is not zero. It does not actually ensure that the id is valid.
-- Eg. IS_VEHICLE_NODE_ID_VALID(1) will return true, but will crash when calling GET_VEHICLE_NODE_POSITION().
-- sfink: This native returns a pointer to a packed Vector3 struct in the RAX register, as do the following natives:
-- AI::WAYPOINT_RECORDING_GET_COORD
-- ENTITY::GET_ENTITY_MATRIX
-- FIRE::GET_CLOSEST_FIRE_POS
-- GAMEPLAY::FIND_SPAWN_POINT_IN_DIRECTION
-- GAMEPLAY::GET_MODEL_DIMENSIONS
-- GAMEPLAY::OVERRIDE_SAVE_HOUSE
-- GAMEPLAY::_0x82FDE6A57EE4EE44
-- GAMEPLAY::_0x8BDC7BFC57A81E76
-- GAMEPLAY::_0x8D7A43EC6A5FEA45
-- GAMEPLAY::_0xA4A0065E39C9F25C
-- GAMEPLAY::_0xDFB4138EEFED7B81
-- MOBILE::GET_MOBILE_PHONE_POSITION
-- MOBILE::GET_MOBILE_PHONE_ROTATION
-- NETWORK::NETWORK_GET_RESPAWN_RESULT
-- OBJECT::_0x163F8B586BC95F2A
-- PATHFIND::GET_CLOSEST_MAJOR_VEHICLE_NODE
-- PATHFIND::GET_CLOSEST_ROAD
-- PATHFIND::GET_CLOSEST_VEHICLE_NODE
-- PATHFIND::GET_CLOSEST_VEHICLE_NODE_WITH_HEADING
-- PATHFIND::GET_NTH_CLOSEST_VEHICLE_NODE
-- PATHFIND::GET_NTH_CLOSEST_VEHICLE_NODE_FAVOUR_DIRECTION
-- PATHFIND::GET_NTH_CLOSEST_VEHICLE_NODE_WITH_HEADING
-- PATHFIND::GET_RANDOM_VEHICLE_NODE
-- PATHFIND::GET_SAFE_COORD_FOR_PED
-- PATHFIND::GET_VEHICLE_NODE_POSITION
-- PATHFIND::_0x16F46FB18C8009E4
-- VEHICLE::_0xA4822F1CF23F4810
-- VEHICLE::_0xDF7E3EEB29642C38
-- WATER::TEST_PROBE_AGAINST_ALL_WATER
-- WATER::TEST_PROBE_AGAINST_WATER
-- WEAPON::GET_PED_LAST_WEAPON_IMPACT_COORD
-- WORLDPROBE::_0xFF6BE494C7987F34
-- WORLDPROBE::_GET_RAYCAST_RESULT
function Global.GetVehicleNodePosition(nodeId, outPosition)
	return _in(0x703123E5E7D429C2, nodeId, _v)
end

--- MulleDK19: Gets the density and flags of the closest node to the specified position.
-- Density is a value between 0 and 15, indicating how busy the road is.
-- Flags is a bit field.
function Global.GetVehicleNodeProperties(x, y, z)
	return _in(0x0568566ACBB5DEDC, x, y, z, _i, _i, _r)
end

--- Gets the number of passengers, NOT including the driver. Use IS_VEHICLE_SEAT_FREE(Vehicle, -1) to also check for the driver
function Global.GetVehicleNumberOfPassengers(vehicle)
	return _in(0x24CB2137731FFE89, vehicle, _r, _ri)
end

function Global.GetVehicleNumberOfWheels(vehicle)
	return _in(0xedf4b0fc, vehicle, _r, _ri)
end

--- Returns the license plate text from a vehicle.  8 chars maximum.
function Global.GetVehicleNumberPlateText(vehicle)
	return _in(0x7CE1CCB9B293020E, vehicle, _r, _s)
end

--- Returns the PlateType of a vehicle
-- Blue_on_White_1 = 3,
-- Blue_on_White_2 = 0,
-- Blue_on_White_3 = 4,
-- Yellow_on_Blue = 2,
-- Yellow_on_Black = 1,
-- North_Yankton = 5,
function Global.GetVehicleNumberPlateTextIndex(vehicle)
	return _in(0xF11BC2DD9A3E7195, vehicle, _r, _ri)
end

function Global.GetVehicleOilLevel(vehicle)
	return _in(0xfc7f8ef4, vehicle, _r, _rf)
end

--- The resulting entity can be a Vehicle or Ped.
-- The native is stored between GET_VEHICLE_LIVERY_COUNT and GET_VEHICLE_MAX_BRAKING so the actual name is either GET_VEHICLE_L* or GET_VEHICLE_M*
function Global.GetVehicleOwner(vehicle, entity)
	return _in(0x8F5EBAB1F260CFCE, vehicle, _ii(entity) --[[ may be optional ]], _r)
end

--- Gets the vehicle the specified Ped is/was in depending on bool value.
-- [False = CurrentVehicle, True = LastVehicle]
function Global.GetVehiclePedIsIn(ped, lastVehicle)
	return _in(0x9A9112A0FE9A4713, ped, lastVehicle, _r, _ri)
end

function Global.GetVehiclePedIsTryingToEnter(ped)
	return _in(0x814FA8BE5449445D, ped, _r, _ri)
end

--- Gets ID of vehicle player using. It means it can get ID at any interaction with vehicle. Enter\exit for example. And that means it is faster than GET_VEHICLE_PED_IS_IN but less safe.
function Global.GetVehiclePedIsUsing(ped)
	return _in(0x6094AD011A2EA87D, ped, _r, _ri)
end

--- 1000 is max health
-- Begins leaking gas at around 650 health
function Global.GetVehiclePetrolTankHealth(vehicle)
	return _in(0x7D5DABE888D2D074, vehicle, _r, _rf)
end

function Global.GetVehiclePlateType(vehicle)
	return _in(0x9CCC9525BF2408E0, vehicle, _r, _ri)
end

function Global.GetVehicleRecordingId(p0, p1)
	return _in(0x21543C612379DB3C, p0, _ts(p1), _r, _ri)
end

function Global.GetVehicleSteeringAngle(vehicle)
	return _in(0x1382fcea, vehicle, _r, _rf)
end

function Global.GetVehicleSteeringScale(vehicle)
	return _in(0x954465de, vehicle, _r, _rf)
end

--- Gets the height of the vehicle's suspension.
-- The higher the value the lower the suspension. Each 0.002 corresponds with one more level lowered.
-- 0.000 is the stock suspension.
-- 0.008 is Ultra Suspension.
function Global.GetVehicleSuspensionHeight(vehicle)
	return _in(0x53952FD2BAA19F17, vehicle, _r, _rf)
end

--- Gets the trailer of a vehicle and puts it into the trailer parameter.
function Global.GetVehicleTrailerVehicle(vehicle, trailer)
	return _in(0x1CDD6BADC297830D, vehicle, _ii(trailer) --[[ may be optional ]], _r)
end

function Global.GetVehicleTurboPressure(vehicle)
	return _in(0xe02b51d7, vehicle, _r, _rf)
end

function Global.GetVehicleTyreSmokeColor(vehicle)
	return _in(0xB635392A4938B3C3, vehicle, _i, _i, _i)
end

function Global.GetVehicleTyresCanBurst(vehicle)
	return _in(0x678B9BB8C3F58FEB, vehicle, _r)
end

function Global.GetVehicleWaypointProgress(p0)
	return _in(0x9824CFF8FC66E159, p0, _r, _ri)
end

function Global.GetVehicleWaypointTargetPoint(p0)
	return _in(0x416B62AC8B9E5BBD, p0, _r, _ri)
end

function Global.GetVehicleWheelHealth(vehicle, wheelIndex)
	return _in(0x54a677f5, vehicle, wheelIndex, _r, _rf)
end

--- Gets speed of a wheel at the tyre.
-- Max number of wheels can be retrieved with the native GET_VEHICLE_NUMBER_OF_WHEELS.
-- @return An integer.
function Global.GetVehicleWheelSpeed(vehicle, wheelIndex)
	return _in(0x149c9da0, vehicle, wheelIndex, _r, _rf)
end

--- Returns an int
-- Wheel Types:
-- 0: Sport
-- 1: Muscle
-- 2: Lowrider
-- 3: SUV
-- 4: Offroad
-- 5: Tuner
-- 6: Bike Wheels
-- 7: High End
-- Tested in Los Santos Customs
function Global.GetVehicleWheelType(vehicle)
	return _in(0xB3ED1BFB4BE636DC, vehicle, _r, _ri)
end

function Global.GetVehicleWindowTint(vehicle)
	return _in(0x0EE21293DAD47C95, vehicle, _r, _ri)
end

--- Remnant from GTA IV. Does nothing in GTA V.
function Global.GetWantedLevelRadius(player)
	return _in(0x085DEB493BE80812, player, _r, _rf)
end

--- Drft
function Global.GetWantedLevelThreshold(wantedLevel)
	return _in(0xFDD179EAF45B556C, wantedLevel, _r, _ri)
end

--- This function set height to the value of z-axis of the water surface.
-- This function works with sea and lake. However it does not work with shallow rivers (e.g. raton canyon will return -100000.0f)
-- note: seems to return true when you are in water
function Global.GetWaterHeight(x, y, z, height)
	return _in(0xF6829842C06AE524, x, y, z, _fi(height) --[[ may be optional ]], _r)
end

function Global.GetWaterHeightNoWaves(x, y, z, height)
	return _in(0x8EE6B53CE13A9794, x, y, z, _fi(height) --[[ may be optional ]], _r)
end

--- Gets the aggressiveness factor of the ocean waves.
-- console hash: 0xBD0A67FB
-- Most likely GET_CURRENT_*
function Global.GetWavesIntensity()
	return _in(0x2B2A2CC86778B619, _r, _rf)
end
Global.N_0x2b2a2cc86778b619 = Global.GetWavesIntensity

function Global.GetWaypointDistanceAlongRoute(p0, p1)
	return _in(0xA5B769058763E497, _ts(p0), p1, _r, _rf)
end

--- // Returns the size of the default weapon component clip.
-- Use it like this:
-- char cClipSize[32];
-- Hash cur;
-- if (WEAPON::GET_CURRENT_PED_WEAPON(playerPed, &amp;cur, 1))
-- {
-- if (WEAPON::IS_WEAPON_VALID(cur))
-- {
-- int iClipSize = WEAPON::GET_WEAPON_CLIP_SIZE(cur);
-- sprintf_s(cClipSize, "ClipSize: %.d", iClipSize);
-- vDrawString(cClipSize, 0.5f, 0.5f);
-- }
-- }
function Global.GetWeaponClipSize(weaponHash)
	return _in(0x583BE370B1EC6EB4, _ch(weaponHash), _r, _ri)
end

function Global.GetWeaponComponentHudStats(componentHash, outData)
	return _in(0xB3CAF387AE12E9F8, _ch(componentHash), _ii(outData) --[[ may be optional ]], _r)
end

function Global.GetWeaponComponentTypeModel(componentHash)
	return _in(0x0DB57B41EC1DB083, _ch(componentHash), _r, _ri)
end

--- 0=unknown (or incorrect weaponHash)
-- 1= no damage (flare,snowball, petrolcan)
-- 2=melee
-- 3=bullet
-- 4=force ragdoll fall
-- 5=explosive (RPG, Railgun, grenade)
-- 6=fire(molotov)
-- 8=fall(WEAPON_HELI_CRASH)
-- 10=electric
-- 11=barbed wire
-- 12=extinguisher
-- 13=gas
-- 14=water cannon(WEAPON_HIT_BY_WATER_CANNON)
function Global.GetWeaponDamageType(weaponHash)
	return _in(0x3BE0BB12D25FB305, _ch(weaponHash), _r, _ri)
end

--- returns the weapon hash of pickup
function Global.GetWeaponHashFromPickup(pickupHash)
	return _in(0x08F96CA6C551AD51, pickupHash, _r, _ri)
end
Global.N_0x08f96ca6c551ad51 = Global.GetWeaponHashFromPickup

--- struct WeaponHudStatsData
-- {
-- BYTE hudDamage; // 0x0000
-- char _0x0001[0x7]; // 0x0001
-- BYTE hudSpeed; // 0x0008
-- char _0x0009[0x7]; // 0x0009
-- BYTE hudCapacity; // 0x0010
-- char _0x0011[0x7]; // 0x0011
-- BYTE hudAccuracy; // 0x0018
-- char _0x0019[0x7]; // 0x0019
-- BYTE hudRange; // 0x0020
-- };
-- Usage:
-- WeaponHudStatsData data;
-- if (GET_WEAPON_HUD_STATS(weaponHash, (int *)&amp;data))
-- {
-- // BYTE damagePercentage = data.hudDamage and so on
-- }
function Global.GetWeaponHudStats(weaponHash, outData)
	return _in(0xD92C739EE34C9EBA, _ch(weaponHash), _ii(outData) --[[ may be optional ]], _r)
end

--- Drops the current weapon and returns the object
-- Unknown behavior when unarmed.
function Global.GetWeaponObjectFromPed(ped, p1)
	return _in(0xCAE1DC9A0E22A16D, ped, p1, _r, _ri)
end

function Global.GetWeaponObjectTintIndex(weapon)
	return _in(0xCD183314F7CD2E57, weapon, _r, _ri)
end

function Global.GetWeaponTintCount(weaponHash)
	return _in(0x5DCF6C5CAB2E9BF7, _ch(weaponHash), _r, _ri)
end

function Global.GetWeapontypeGroup(weaponHash)
	return _in(0xC3287EE3050FB74C, _ch(weaponHash), _r, _ri)
end

--- Returns the model of any weapon.
-- Can also take an ammo hash?
-- sub_6663a(&amp;l_115B, WEAPON::GET_WEAPONTYPE_MODEL(${ammo_rpg}));
function Global.GetWeapontypeModel(weaponHash)
	return _in(0xF46CDC33180FDA94, _ch(weaponHash), _r, _ri)
end

function Global.GetWeapontypeSlot(weaponHash)
	return _in(0x4215460B9B8B7FA0, _ch(weaponHash), _r, _ri)
end

function Global.GetWeatherTypeTransition()
	return _in(0xF3BBE884A14BB413, _i, _i, _f)
end

function Global.GetWindDirection()
	return _in(0x1F400FEF721170DA, _r, _rv)
end

function Global.GetWindSpeed()
	return _in(0xA8CF1CC0AFCD3F12, _r, _rf)
end

--- Returns the coordinates of an entity-bone.
function Global.GetWorldPositionOfEntityBone(entity, boneIndex)
	return _in(0x44A8FCB8ED227738, entity, boneIndex, _r, _rv)
end

function Global.GetZoneAtCoords(x, y, z)
	return _in(0x27040C25DE6CB2F4, x, y, z, _r, _ri)
end

--- 'zoneName' corresponds to an entry in 'popzone.ipl'.
-- AIRP = Los Santos International Airport
-- ALAMO = Alamo Sea
-- ALTA = Alta
-- ARMYB = Fort Zancudo
-- BANHAMC = Banham Canyon Dr
-- BANNING = Banning
-- BEACH = Vespucci Beach
-- BHAMCA = Banham Canyon
-- BRADP = Braddock Pass
-- BRADT = Braddock Tunnel
-- BURTON = Burton
-- CALAFB = Calafia Bridge
-- CANNY = Raton Canyon
-- CCREAK = Cassidy Creek
-- CHAMH = Chamberlain Hills
-- CHIL = Vinewood Hills
-- CHU = Chumash
-- CMSW = Chiliad Mountain State Wilderness
-- CYPRE = Cypress Flats
-- DAVIS = Davis
-- DELBE = Del Perro Beach
-- DELPE = Del Perro
-- DELSOL = La Puerta
-- DESRT = Grand Senora Desert
-- DOWNT = Downtown
-- DTVINE = Downtown Vinewood
-- EAST_V = East Vinewood
-- EBURO = El Burro Heights
-- ELGORL = El Gordo Lighthouse
-- ELYSIAN = Elysian Island
-- GALFISH = Galilee
-- GOLF = GWC and Golfing Society
-- GRAPES = Grapeseed
-- GREATC = Great Chaparral
-- HARMO = Harmony
-- HAWICK = Hawick
-- HORS = Vinewood Racetrack
-- HUMLAB = Humane Labs and Research
-- JAIL = Bolingbroke Penitentiary
-- KOREAT = Little Seoul
-- LACT = Land Act Reservoir
-- LAGO = Lago Zancudo
-- LDAM = Land Act Dam
-- LEGSQU = Legion Square
-- LMESA = La Mesa
-- LOSPUER = La Puerta
-- MIRR = Mirror Park
-- MORN = Morningwood
-- MOVIE = Richards Majestic
-- MTCHIL = Mount Chiliad
-- MTGORDO = Mount Gordo
-- MTJOSE = Mount Josiah
-- MURRI = Murrieta Heights
-- NCHU = North Chumash
-- NOOSE = N.O.O.S.E
-- OCEANA = Pacific Ocean
-- PALCOV = Paleto Cove
-- PALETO = Paleto Bay
-- PALFOR = Paleto Forest
-- PALHIGH = Palomino Highlands
-- PALMPOW = Palmer-Taylor Power Station
-- PBLUFF = Pacific Bluffs
-- PBOX = Pillbox Hill
-- PROCOB = Procopio Beach
-- RANCHO = Rancho
-- RGLEN = Richman Glen
-- RICHM = Richman
-- ROCKF = Rockford Hills
-- RTRAK = Redwood Lights Track
-- SANAND = San Andreas
-- SANCHIA = San Chianski Mountain Range
-- SANDY = Sandy Shores
-- SKID = Mission Row
-- SLAB = Stab City
-- STAD = Maze Bank Arena
-- STRAW = Strawberry
-- TATAMO = Tataviam Mountains
-- TERMINA = Terminal
-- TEXTI = Textile City
-- TONGVAH = Tongva Hills
-- TONGVAV = Tongva Valley
-- VCANA = Vespucci Canals
-- VESP = Vespucci
-- VINE = Vinewood
-- WINDF = Ron Alternates Wind Farm
-- WVINE = West Vinewood
-- ZANCUDO = Zancudo River
-- ZP_ORT = Port of South Los Santos
-- ZQ_UAR = Davis Quartz
function Global.GetZoneFromNameId(zoneName)
	return _in(0x98CD1D2934B76CC1, _ts(zoneName), _r, _ri)
end

function Global.GetZonePopschedule(zoneId)
	return _in(0x4334BC40AA0CB4BB, zoneId, _r, _ri)
end

--- cellphone range 1- 5 used for signal bar in iFruit phone
function Global.GetZoneScumminess(zoneId)
	return _in(0x5F7B268D15BA0739, zoneId, _r, _ri)
end

--- Achievements from 0-57
-- more achievements came with update 1.29 (freemode events update), I'd say that they now go to 60, but I'll need to check.
function Global.GiveAchievementToPlayer(achievement)
	return _in(0xBEC7076D64130195, achievement, _r)
end

--- Gives a weapon to PED with a delay, example:
-- WEAPON::GIVE_DELAYED_WEAPON_TO_PED(PED::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("WEAPON_PISTOL"), 1000, false)
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Translation table:
-- pastebin.com/a39K8Nz8
function Global.GiveDelayedWeaponToPed(ped, weaponHash, time, equipNow)
	return _in(0xB282DC6EBD803C75, ped, _ch(weaponHash), time, equipNow)
end

--- PoliceMotorcycleHelmet	1024
-- RegularMotorcycleHelmet	4096
-- FiremanHelmet	16384
-- PilotHeadset	32768
-- PilotHelmet	65536
-- --
-- p2 is generally 4096 or 16384 in the scripts. p1 varies between 1 and 0.
function Global.GivePedHelmet(ped, cannotRemove, helmetFlag, textureIndex)
	return _in(0x54C7C4A94367717E, ped, cannotRemove, helmetFlag, textureIndex)
end

--- Sends the message that was created by a call to CREATE_NM_MESSAGE to the specified Ped.
-- If a message hasn't been created already, this function does nothing.
-- If the Ped is not ragdolled with Euphoria enabled, this function does nothing.
-- The following call can be used to ragdoll the Ped with Euphoria enabled: SET_PED_TO_RAGDOLL(ped, 4000, 5000, 1, 1, 1, 0);
-- Call order:
-- SET_PED_TO_RAGDOLL
-- CREATE_NM_MESSAGE
-- GIVE_PED_NM_MESSAGE
-- Multiple messages can be chained. Eg. to make the ped stagger and swing his arms around, the following calls can be made:
-- SET_PED_TO_RAGDOLL(ped, 4000, 5000, 1, 1, 1, 0);
-- CREATE_NM_MESSAGE(true, 0); // stopAllBehaviours - Stop all other behaviours, in case the Ped is already doing some Euphoria stuff.
-- GIVE_PED_NM_MESSAGE(ped); // Dispatch message to Ped.
-- CREATE_NM_MESSAGE(true, 1151); // staggerFall - Attempt to walk while falling.
-- GIVE_PED_NM_MESSAGE(ped); // Dispatch message to Ped.
-- CREATE_NM_MESSAGE(true, 372); // armsWindmill - Swing arms around.
-- GIVE_PED_NM_MESSAGE(ped); // Dispatch message to Ped.
function Global.GivePedNmMessage(ped)
	return _in(0xB158DFCCC56E5C5B, ped)
end

--- p1 is either 1 or 2 in the PC scripts.
function Global.GivePedToPauseMenu(ped, p1)
	return _in(0xAC0BFBDC3BE00E14, ped, p1)
end

function Global.GivePlayerRagdollControl(player, toggle)
	return _in(0x3C49C870E66F0A28, player, toggle)
end

function Global.GiveWeaponComponentToPed(ped, weaponHash, componentHash)
	return _in(0xD966D51AA5B28BB9, ped, _ch(weaponHash), _ch(componentHash))
end

--- addonHash:
-- (use WEAPON::GET_WEAPON_COMPONENT_TYPE_MODEL() to get hash value)
-- ${component_at_ar_flsh}, ${component_at_ar_supp}, ${component_at_pi_flsh}, ${component_at_scope_large}, ${component_at_ar_supp_02}
function Global.GiveWeaponComponentToWeaponObject(weaponObject, addonHash)
	return _in(0x33E179436C0B31DB, weaponObject, _ch(addonHash))
end

function Global.GiveWeaponObjectToPed(weaponObject, ped)
	return _in(0xB1FA61371AF7C4B7, weaponObject, ped)
end

--- isHidden - ????
-- All weapon names (add to the list if something is missing), use GAMEPLAY::GET_HASH_KEY((char *)weaponNames[i]) to get get the hash:
-- static LPCSTR weaponNames[] = {
-- "WEAPON_KNIFE", "WEAPON_NIGHTSTICK", "WEAPON_HAMMER", "WEAPON_BAT", "WEAPON_GOLFCLUB",
-- "WEAPON_CROWBAR", "WEAPON_PISTOL", "WEAPON_COMBATPISTOL", "WEAPON_APPISTOL", "WEAPON_PISTOL50",
-- "WEAPON_MICROSMG", "WEAPON_SMG", "WEAPON_ASSAULTSMG", "WEAPON_ASSAULTRIFLE",
-- "WEAPON_CARBINERIFLE", "WEAPON_ADVANCEDRIFLE", "WEAPON_MG", "WEAPON_COMBATMG", "WEAPON_PUMPSHOTGUN",
-- "WEAPON_SAWNOFFSHOTGUN", "WEAPON_ASSAULTSHOTGUN", "WEAPON_BULLPUPSHOTGUN", "WEAPON_STUNGUN", "WEAPON_SNIPERRIFLE",
-- "WEAPON_HEAVYSNIPER", "WEAPON_GRENADELAUNCHER", "WEAPON_GRENADELAUNCHER_SMOKE", "WEAPON_RPG", "WEAPON_MINIGUN",
-- "WEAPON_GRENADE", "WEAPON_STICKYBOMB", "WEAPON_SMOKEGRENADE", "WEAPON_BZGAS", "WEAPON_MOLOTOV",
-- "WEAPON_FIREEXTINGUISHER", "WEAPON_PETROLCAN", "WEAPON_FLARE", "WEAPON_SNSPISTOL", "WEAPON_SPECIALCARBINE",
-- "WEAPON_HEAVYPISTOL", "WEAPON_BULLPUPRIFLE", "WEAPON_HOMINGLAUNCHER", "WEAPON_PROXMINE", "WEAPON_SNOWBALL",
-- "WEAPON_VINTAGEPISTOL", "WEAPON_DAGGER", "WEAPON_FIREWORK", "WEAPON_MUSKET", "WEAPON_MARKSMANRIFLE",
-- "WEAPON_HEAVYSHOTGUN", "WEAPON_GUSENBERG", "WEAPON_HATCHET", "WEAPON_RAILGUN", "WEAPON_COMBATPDW",
-- "WEAPON_KNUCKLE", "WEAPON_MARKSMANPISTOL", "WEAPON_FLASHLIGHT", "WEAPON_MACHETE", "WEAPON_MACHINEPISTOL",
-- "WEAPON_SWITCHBLADE", "WEAPON_REVOLVER", "WEAPON_COMPACTRIFLE", "WEAPON_DBSHOTGUN", "WEAPON_FLAREGUN",
-- "WEAPON_AUTOSHOTGUN", "WEAPON_BATTLEAXE", "WEAPON_COMPACTLAUNCHER", "WEAPON_MINISMG", "WEAPON_PIPEBOMB",
-- "WEAPON_POOLCUE", "WEAPON_SWEEPER", "WEAPON_WRENCH"
-- };
-- ----------------------------------------------------------------------------------------------------------------------------------------
-- Translation table:
-- pastebin.com/a39K8Nz8
function Global.GiveWeaponToPed(ped, weaponHash, ammoCount, isHidden, equipNow)
	return _in(0xBF0FD6E56C964FCB, ped, _ch(weaponHash), ammoCount, isHidden, equipNow)
end

function Global.HasAchievementBeenPassed(achievement)
	return _in(0x867365E111A3B6EB, achievement, _r)
end

function Global.HasActionModeAssetLoaded(asset)
	return _in(0xE4B5F4BF2CB24E65, _ts(asset), _r)
end

function Global.HasAdditionalTextLoaded(slot)
	return _in(0x02245FE4BED318B8, slot, _r)
end

function Global.HasAnimDictLoaded(animDict)
	return _in(0xD031A9162D01088C, _ts(animDict), _r)
end

--- if (ENTITY::HAS_ANIM_EVENT_FIRED(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("CreateObject")))
function Global.HasAnimEventFired(entity, actionHash)
	return _in(0xEAF4CD9EA3E7E922, entity, _ch(actionHash), _r)
end

--- Gets whether the specified animation set has finished loading. An animation set provides movement animations for a ped. See SET_PED_MOVEMENT_CLIPSET.
-- Animation set and clip set are synonymous.
function Global.HasAnimSetLoaded(animSet)
	return _in(0xC4EA073D86FB29B0, _ts(animSet), _r)
end

--- Console Hash
function Global.HasBgScriptBeenDownloaded()
	return _in(0x8132C0EB8B2B3293, _r)
end
Global.N_0x8132c0eb8b2b3293 = Global.HasBgScriptBeenDownloaded

--- p3 - possibly radius?
function Global.HasBulletImpactedInArea(x, y, z, p3, p4, p5)
	return _in(0x9870ACFB89A90995, x, y, z, p3, p4, p5, _r)
end

function Global.HasBulletImpactedInBox(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0xDC8C5D7CFEAB8394, p0, p1, p2, p3, p4, p5, p6, p7, _r)
end

--- This native appears on the cheat_controller script and tracks a combination of buttons, which may be used to toggle cheats in-game. Credits to ThreeSocks for the info. The hash contains the combination, while the "amount" represents the amount of buttons used in a combination. The following page can be used to make a button combination: gta5offset.com/ts/hash/
-- INT_SCORES_SCORTED was a hash collision
function Global.HasButtonCombinationJustBeenEntered(hash, amount)
	return _in(0x071E2A839DE82D90, _ch(hash), amount, _r)
end
Global.N_0x071e2a839de82d90 = Global.HasButtonCombinationJustBeenEntered

--- Get inputted "Cheat code", for example:
-- while (TRUE)
-- {
-- if (GAMEPLAY::_557E43C447E700A8(${fugitive}))
-- {
-- // Do something.
-- }
-- SYSTEM::WAIT(0);
-- }
-- Calling this will also set the last saved string hash to zero.
function Global.HasCheatStringJustBeenEntered(hash)
	return _in(0x557E43C447E700A8, _ch(hash), _r)
end
Global.N_0x557e43c447e700a8 = Global.HasCheatStringJustBeenEntered

--- Alias for HAS_ANIM_SET_LOADED.
function Global.HasClipSetLoaded(clipSet)
	return _in(0x318234F4F3738AF3, _ts(clipSet), _r)
end

function Global.HasClosestObjectOfTypeBeenBroken(p0, p1, p2, p3, modelHash, p5)
	return _in(0x761B0E69AC4D007E, p0, p1, p2, p3, _ch(modelHash), p5, _r)
end

function Global.HasCollisionForModelLoaded(model)
	return _in(0x22CCA434E368F03A, _ch(model), _r)
end

function Global.HasCollisionLoadedAroundEntity(entity)
	return _in(0xE9676F61BC0B3321, entity, _r)
end

function Global.HasCutsceneFinished()
	return _in(0x7C0A893088881D57, _r)
end

function Global.HasCutsceneLoaded()
	return _in(0xC59F528E9AB9F339, _r)
end

--- P3 is always 3 as far as i cant tell
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.HasEntityAnimFinished(entity, animDict, animName, p3)
	return _in(0x20B711662962B472, entity, _ts(animDict), _ts(animName), p3, _r)
end

function Global.HasEntityBeenDamagedByAnyObject(entity)
	return _in(0x95EB9964FF5C5C65, entity, _r)
end

function Global.HasEntityBeenDamagedByAnyPed(entity)
	return _in(0x605F5A140F202491, entity, _r)
end

function Global.HasEntityBeenDamagedByAnyVehicle(entity)
	return _in(0xDFD5033FDBA0A9C8, entity, _r)
end

--- Entity 1 = Victim
-- Entity 2 = Attacker
-- p2 seems to always be 1
function Global.HasEntityBeenDamagedByEntity(entity1, entity2, p2)
	return _in(0xC86D67D52A707CF8, entity1, entity2, p2, _r)
end

--- It determines what weapons caused damage:
-- If youu want to define only a specific weapon, second parameter=weapon hash code, third parameter=0
-- If you want to define any melee weapon, second parameter=0, third parameter=1.
-- If you want to identify any weapon (firearms, melee, rockets, etc.), second parameter=0, third parameter=2.
function Global.HasEntityBeenDamagedByWeapon(entity, weaponHash, weaponType)
	return _in(0x131D401334815E94, entity, _ch(weaponHash), weaponType, _r)
end

--- traceType is always 17 in the scripts.
-- There is other codes used for traceType:
-- 19 - in jewelry_prep1a
-- 126 - in am_hunt_the_beast
-- 256 &amp; 287 - in fm_mission_controller
function Global.HasEntityClearLosToEntity(entity1, entity2, traceType)
	return _in(0xFCDFF7B72D23A1AC, entity1, entity2, traceType, _r)
end

--- Has the entity1 got a clear line of sight to the other entity2 from the direction entity1 is facing.
-- This is one of the most CPU demanding BOOL natives in the game; avoid calling this in things like nested for-loops
function Global.HasEntityClearLosToEntityInFront(entity1, entity2)
	return _in(0x0267D00AF114F17A, entity1, entity2, _r)
end

--- Called on tick.
-- Tested with vehicles, returns true whenever the vehicle is touching any entity.
-- Note: for vehicles, the wheels can touch the ground and it will still return false, but if the body of the vehicle touches the ground, it will return true.
function Global.HasEntityCollidedWithAnything(entity)
	return _in(0x8BAD02F0368D9E14, entity, _r)
end

function Global.HasForceCleanupOccurred(cleanupFlags)
	return _in(0xC968670BFACE42D9, cleanupFlags, _r)
end

--- Check to see if hud component Scaleform has loaded?
function Global.HasHudScaleformLoaded(hudComponent)
	return _in(0xDF6E5987D2B4D140, hudComponent, _r)
end

--- Checks if the specified model has loaded into memory.
function Global.HasModelLoaded(model)
	return _in(0x98A4EB5D89A0C952, _ch(model), _r)
end

function Global.HasNamedPtfxAssetLoaded(fxName)
	return _in(0x8702416E512EC454, _ts(fxName), _r)
end

--- Pretty sure it's the real name (not 100% sure so I added the _ prefix); can someone else confirm it?
-- Only values used in the scripts are:
-- "heist_mp"
-- "heistmap_mp"
-- "instructional_buttons"
-- "heist_pre"
function Global.HasNamedScaleformMovieLoaded(scaleformName)
	return _in(0x0C1C5D756FB5F337, _ts(scaleformName), _r)
end
Global.N_0x0c1c5d756fb5f337 = Global.HasNamedScaleformMovieLoaded

function Global.HasNetworkTimeStarted()
	return _in(0x46718ACEEDEAFC84, _r)
end
Global.N_0x46718aceedeafc84 = Global.HasNetworkTimeStarted

function Global.HasObjectBeenBroken(object)
	return _in(0x8ABFB70C49CC43E2, object, _r)
end

--- It determines what weapons caused damage:
-- If you want to define only a specific weapon, second parameter=weapon hash code, third parameter=0
-- If you want to define any melee weapon, second parameter=0, third parameter=1.
-- If you want to identify any weapon (firearms, melee, rockets, etc.), second parameter=0, third parameter=2.
function Global.HasPedBeenDamagedByWeapon(ped, weaponHash, weaponType)
	return _in(0x2D343D2219CD027A, ped, _ch(weaponHash), weaponType, _r)
end

--- p2 should be FALSE, otherwise it seems to always return FALSE
-- Bool does not check if the weapon is current equipped, unfortunately.
function Global.HasPedGotWeapon(ped, weaponHash, p2)
	return _in(0x8DECB02F88F428BC, ped, _ch(weaponHash), p2, _r)
end

function Global.HasPedGotWeaponComponent(ped, weaponHash, componentHash)
	return _in(0xC593212475FAE340, ped, _ch(weaponHash), _ch(componentHash), _r)
end

function Global.HasPedHeadBlendFinished(ped)
	return _in(0x654CD0A825161131, ped, _r)
end

function Global.HasPedReceivedEvent(p0, p1)
	return _in(0x8507BCB710FA6DC0, p0, p1, _r)
end

function Global.HasPickupBeenCollected(pickup)
	return _in(0x80EC48E6679313F9, pickup, _r)
end

function Global.HasPlayerBeenSpottedInStolenVehicle(player)
	return _in(0xD705740BB0A1CF4C, player, _r)
end

function Global.HasPlayerDamagedAtLeastOneNonAnimalPed(player)
	return _in(0xE4B90F367BD81752, player, _r)
end

function Global.HasPlayerDamagedAtLeastOnePed(player)
	return _in(0x20CE80B0C2BF4ACC, player, _r)
end

--- Gets the player's info and calls a function that checks the player's ped position.
-- Here's the decompiled function that checks the position: pastebin.com/ZdHG2E7n
function Global.HasPlayerLeftTheWorld(player)
	return _in(0xD55DDFB47991A294, player, _r)
end

function Global.HasPlayerTeleportFinished(player)
	return _in(0xE23D5873C2394C61, player, _r)
end
Global.N_0xe23d5873c2394c61 = Global.HasPlayerTeleportFinished

function Global.HasPreloadModsFinished(p0)
	return _in(0x06F43E5175EB6D96, p0, _r)
end

function Global.HasPtfxAssetLoaded()
	return _in(0xCA7D9B86ECA7481B, _r)
end

function Global.HasScaleformContainerMovieLoadedIntoParent(scaleformHandle)
	return _in(0x8217150E1217EBFD, scaleformHandle, _r)
end

function Global.HasScaleformMovieLoaded(scaleformHandle)
	return _in(0x85F01B8D5B90570E, scaleformHandle, _r)
end

--- Returns if a script has been loaded into the game. Used to see if a script was loaded after requesting.
-- For a full list, see here: pastebin.com/yLNWicUi
function Global.HasScriptLoaded(scriptName)
	return _in(0xE6CC9F3BA0FB9EF1, _ts(scriptName), _r)
end

function Global.HasScriptWithNameHashLoaded(scriptHash)
	return _in(0x5F0F0C783EB16C04, _ch(scriptHash), _r)
end
Global.HasStreamedScriptLoaded = Global.HasScriptWithNameHashLoaded

function Global.HasSoundFinished(soundId)
	return _in(0xFCBDCE714A7C88E5, soundId, _r)
end

function Global.HasStealthModeAssetLoaded(asset)
	return _in(0xE977FC5B08AF3441, _ts(asset), _r)
end

function Global.HasStreamedTextureDictLoaded(textureDict)
	return _in(0x0145F696AAAAD2E4, _ts(textureDict), _r)
end

--- Checks if the specified gxt has loaded into the passed slot.
function Global.HasThisAdditionalTextLoaded(gxt, slot)
	return _in(0xADBF060E2B30C5BC, _ts(gxt), slot, _r)
end

function Global.HasThisCutsceneLoaded(cutsceneName)
	return _in(0x228D3D94F8A11C3C, _ts(cutsceneName), _r)
end

--- Console Hash
function Global.HasTunablesBeenDownloaded()
	return _in(0x0467C11ED88B7D28, _r)
end
Global.N_0x0467c11ed88b7d28 = Global.HasTunablesBeenDownloaded

function Global.HasVehicleAssetLoaded(vehicleAsset)
	return _in(0x1BBE0523B8DB9A21, vehicleAsset, _r)
end

--- Third Parameter = unsure, but pretty sure it is weapon hash
-- --&gt; get_hash_key("weapon_stickybomb")
-- Fourth Parameter = unsure, almost always -1
function Global.HasVehicleGotProjectileAttached(driver, vehicle, weaponHash, p3)
	return _in(0x717C8481234E3B88, driver, vehicle, _ch(weaponHash), p3, _r)
end

function Global.HasVehicleRecordingBeenLoaded(p0, p1)
	return _in(0x300D614A4C785FC4, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.HasWeaponAssetLoaded(weaponHash)
	return _in(0x36E353271F0E90EE, _ch(weaponHash), _r)
end

function Global.HasWeaponGotWeaponComponent(weapon, addonHash)
	return _in(0x76A18844E743BF91, weapon, _ch(addonHash), _r)
end

function Global.HideHelpTextThisFrame()
	return _in(0xD46923FC481CA285)
end

--- I think this works, but seems to prohibit switching to other weapons (or accessing the weapon wheel)
function Global.HideHudAndRadarThisFrame()
	return _in(0x719FF505F097FD20)
end

function Global.HideHudComponentThisFrame(id)
	return _in(0x6806C51AD12B83B8, id)
end

function Global.HideLoadingOnFadeThisFrame()
	return _in(0x4B0311D3CDC4648F)
end

--- This is the native that is used to hide the exterior of GTA Online apartment buildings when you are inside an apartment.
-- More info: http://gtaforums.com/topic/836301-hiding-gta-online-apartment-exteriors/
function Global.HideMapObjectThisFrame(mapObjectHash)
	return _in(0xA97F257D0151A6AB, _ch(mapObjectHash))
end
Global.N_0xa97f257d0151a6ab = Global.HideMapObjectThisFrame

function Global.HideNumberOnBlip(blip)
	return _in(0x532CFF637EF80148, blip)
end

function Global.HidePedBloodDamageByZone(ped, p1, p2)
	return _in(0x62AB793144DE75DC, ped, p1, p2)
end
Global.N_0x62ab793144de75dc = Global.HidePedBloodDamageByZone

--- Hides the players weapon during a cutscene.
function Global.HidePedWeaponForScriptedCutscene(ped, toggle)
	return _in(0x6F6981D2253C208F, ped, toggle)
end

function Global.HideScriptedHudComponentThisFrame(id)
	return _in(0xE374C498D8BADC14, id)
end

--- Hash collision
function Global.HideSpecialAbilityLockonOperation(p0, p1)
	return _in(0x3EED80DFF7325CAA, p0, p1)
end

--- draws circular marker at pos
-- -1 = none
-- 0 = red
-- 1 = green
-- 2 = blue
-- 3 = green larger
-- 4 = nothing
-- 5 = green small
function Global.HighlightPlacementCoords(x, y, z, colorIndex)
	return _in(0x3430676B11CDF21D, x, y, z, colorIndex)
end
Global.N_0x3430676b11cdf21d = Global.HighlightPlacementCoords

function Global.HintAmbientAudioBank(p0, p1)
	return _in(0x8F8C0E370AE62F5C, p0, p1, _r, _ri)
end

function Global.HintScriptAudioBank(p0, p1)
	return _in(0xFB380A29641EC31A, p0, p1, _r, _ri)
end

function Global.IgnoreNextRestart(toggle)
	return _in(0x21FFB63D8C615361, toggle)
end

function Global.InitShopPedComponent(outComponent)
	return _in(0x1E8C308FD312C036, _ii(outComponent) --[[ may be optional ]])
end

function Global.InitShopPedProp(outProp)
	return _in(0xEB0A2B758F7B850F, _ii(outProp) --[[ may be optional ]])
end

--- Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
-- --------------------------------------------------------
-- if (NETWORK::NETWORK_IS_PARTICIPANT_ACTIVE(PLAYER::INT_TO_PARTICIPANTINDEX(i)))
function Global.IntToParticipantindex(value)
	return _in(0x9EC6603812C24710, value, _r, _ri)
end

--- Simply returns whatever is passed to it (Regardless of whether the handle is valid or not).
function Global.IntToPlayerindex(value)
	return _in(0x41BD2A6B006AF756, value, _r, _ri)
end

function Global.InterruptConversation(p0)
	return _in(0xA018A12E5C5C2FA6, p0, _i, _i)
end

function Global.InvokeFunctionReference(referenceIdentity, argsSerialized, argsLength, retvalLength)
	return _in(0xe3551879, _ts(referenceIdentity), _ts(argsSerialized), argsLength, _ii(retvalLength) --[[ may be optional ]], _r, _s)
end

function Global.IsAimCamActive()
	return _in(0x68EDDA28A5976D07, _r)
end

--- Example:
-- bool playing = AUDIO::IS_ALARM_PLAYING("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS");
function Global.IsAlarmPlaying(alarmName)
	return _in(0x226435CB96CCFC8C, _ts(alarmName), _r)
end

--- Common in the scripts:
-- AUDIO::IS_AMBIENT_SPEECH_DISABLED(PLAYER::PLAYER_PED_ID());
function Global.IsAmbientSpeechDisabled(ped)
	return _in(0x932C2D096A2C3FFF, ped, _r)
end

function Global.IsAmbientSpeechPlaying(p0)
	return _in(0x9072C8B49907BFAD, p0, _r)
end

function Global.IsAmbientZoneEnabled(ambientZone)
	return _in(0x01E2817A479A7F9B, _ts(ambientZone), _r)
end

function Global.IsAnEntity(handle)
	return _in(0x731EC8A916BD11A1, handle, _r)
end

function Global.IsAnyObjectNearPoint(x, y, z, range, p4)
	return _in(0x397DC58FF00298D1, x, y, z, range, p4, _r)
end

function Global.IsAnyPedNearPoint(x, y, z, radius)
	return _in(0x083961498679DC9F, x, y, z, radius, _r)
end

function Global.IsAnyPedShootingInArea(x1, y1, z1, x2, y2, z2, p6, p7)
	return _in(0xA0D3D71EA1086C55, x1, y1, z1, x2, y2, z2, p6, p7, _r)
end

function Global.IsAnySpeechPlaying(ped)
	return _in(0x729072355FA39EC9, ped, _r)
end

function Global.IsAnyVehicleNearPoint(x, y, z, radius)
	return _in(0x61E1DD6125A3EEE6, x, y, z, radius, _r)
end

function Global.IsAreaOccupied(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	return _in(0xA61B4DF533DCB56E, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, _r)
end

function Global.IsAudioSceneActive(scene)
	return _in(0xB65B60556E2A9225, _ts(scene), _r)
end

--- if (GAMEPLAY::IS_AUSSIE_VERSION()) {
-- sub_127a9(&amp;l_31, 1024); // l_31 |= 1024
-- l_129 = 3;
-- sub_129d2("AUSSIE VERSION IS TRUE!?!?!"); // DEBUG
-- }
-- Used to block some of the prostitute stuff due to laws in Australia.
function Global.IsAussieVersion()
	return _in(0x9F1935CA1F724008, _r)
end

function Global.IsAutoSaveInProgress()
	return _in(0x69240733738C19A0, _r)
end

function Global.IsBigVehicle(vehicle)
	return _in(0x9F243D3919F442FE, vehicle, _r)
end

--- Returns bit's boolean state from [offset] of [address].
-- Example:
-- GAMEPLAY::IS_BIT_SET(bitAddress, 1);
-- To enable and disable bits, see:
-- GAMEPLAY::SET_BIT(&amp;bitAddress, 1);   // enable
-- GAMEPLAY::CLEAR_BIT(&amp;bitAddress, 1); // disable
function Global.IsBitSet(address, offset)
	return _in(0xA921AA820C25702F, address, offset, _r)
end

function Global.IsBlipFlashing(blip)
	return _in(0xA5E41FD83AD6CEF0, blip, _r)
end

function Global.IsBlipOnMinimap(blip)
	return _in(0xE41CA53051197A27, blip, _r)
end

function Global.IsBlipShortRange(blip)
	return _in(0xDA5F8727EB75B926, blip, _r)
end

function Global.IsBulletInAngledArea(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x1A8B5F3C01E2B477, p0, p1, p2, p3, p4, p5, p6, p7, _r)
end

function Global.IsBulletInArea(p0, p1, p2, p3, p4)
	return _in(0x3F2023999AD51C1F, p0, p1, p2, p3, p4, _r)
end

function Global.IsBulletInBox(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xDE0F6D7450D37351, p0, p1, p2, p3, p4, p5, p6, _r)
end

--- Returns whether or not the passed camera handle is active.
function Global.IsCamActive(cam)
	return _in(0xDFB2B516207D3534, cam, _r)
end

function Global.IsCamInterpolating(cam)
	return _in(0x036F97C908C2B52C, cam, _r)
end

function Global.IsCamPlayingAnim(cam, animName, animDictionary)
	return _in(0xC90621D8A0CEECF2, cam, _ts(animName), _ts(animDictionary), _r)
end

function Global.IsCamRendering(cam)
	return _in(0x02EC0AF5C5A49B7A, cam, _r)
end

function Global.IsCamShaking(cam)
	return _in(0x6B24BFE83A2BE47B, cam, _r)
end

function Global.IsCamSplinePaused(p0)
	return _in(0x0290F35C0AD97864, p0, _r)
end

function Global.IsCinematicCamRendering()
	return _in(0xB15162CB5826E9E8, _r)
end

function Global.IsCinematicCamShaking()
	return _in(0xBBC08F6B4CB8FF0A, _r)
end

function Global.IsCinematicShotActive(p0)
	return _in(0xCC9F3371A7C28BC9, p0, _r)
end

--- Control Groups:
-- enum InputGroups
-- {
-- INPUTGROUP_MOVE = 0,
-- INPUTGROUP_LOOK = 1,
-- INPUTGROUP_WHEEL = 2,
-- INPUTGROUP_CELLPHONE_NAVIGATE = 3,
-- INPUTGROUP_CELLPHONE_NAVIGATE_UD = 4,
-- INPUTGROUP_CELLPHONE_NAVIGATE_LR = 5,
-- INPUTGROUP_FRONTEND_DPAD_ALL = 6,
-- INPUTGROUP_FRONTEND_DPAD_UD = 7,
-- INPUTGROUP_FRONTEND_DPAD_LR = 8,
-- INPUTGROUP_FRONTEND_LSTICK_ALL = 9,
-- INPUTGROUP_FRONTEND_RSTICK_ALL = 10,
-- INPUTGROUP_FRONTEND_GENERIC_UD = 11,
-- INPUTGROUP_FRONTEND_GENERIC_LR = 12,
-- INPUTGROUP_FRONTEND_GENERIC_ALL = 13,
-- INPUTGROUP_FRONTEND_BUMPERS = 14,
-- INPUTGROUP_FRONTEND_TRIGGERS = 15,
-- INPUTGROUP_FRONTEND_STICKS = 16,
-- INPUTGROUP_SCRIPT_DPAD_ALL = 17,
-- INPUTGROUP_SCRIPT_DPAD_UD = 18,
-- INPUTGROUP_SCRIPT_DPAD_LR = 19,
-- INPUTGROUP_SCRIPT_LSTICK_ALL = 20,
-- INPUTGROUP_SCRIPT_RSTICK_ALL = 21,
-- INPUTGROUP_SCRIPT_BUMPERS = 22,
-- INPUTGROUP_SCRIPT_TRIGGERS = 23,
-- INPUTGROUP_WEAPON_WHEEL_CYCLE = 24,
-- INPUTGROUP_FLY = 25,
-- INPUTGROUP_SUB = 26,
-- INPUTGROUP_VEH_MOVE_ALL = 27,
-- INPUTGROUP_CURSOR = 28,
-- INPUTGROUP_CURSOR_SCROLL = 29,
-- INPUTGROUP_SNIPER_ZOOM_SECONDARY = 30,
-- INPUTGROUP_VEH_HYDRAULICS_CONTROL = 31,
-- MAX_INPUTGROUPS = 32,
-- INPUTGROUP_INVALID = 33
-- };
-- 0, 1 and 2 used in the scripts.
function Global.IsControlEnabled(inputGroup, control)
	return _in(0x1CEA6BFDF248E5D9, inputGroup, control, _r)
end

function Global.IsControlJustPressed(inputGroup, control)
	return _in(0x580417101DDB492F, inputGroup, control, _r)
end

function Global.IsControlJustReleased(inputGroup, control)
	return _in(0x50F940259D3841E6, inputGroup, control, _r)
end

--- index always is 2 for xbox 360 controller and razerblade
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsControlPressed(inputGroup, control)
	return _in(0xF3A21BCD95725A4A, inputGroup, control, _r)
end

--- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsControlReleased(inputGroup, control)
	return _in(0x648EE3E7F38877DD, inputGroup, control, _r)
end

function Global.IsConversationPedDead(ped)
	return _in(0xE0A0AEC214B1FABA, ped, _r)
end

--- xyz - relative to the world origin.
function Global.IsCopPedInArea_3d(x1, y1, z1, x2, y2, z2)
	return _in(0x16EC4839969F9F5E, x1, y1, z1, x2, y2, z2, _r)
end

--- Usage:
-- public bool isCopInRange(Vector3 Location, float Range)
-- {
-- return Function.Call&lt;bool&gt;(Hash.IS_COP_PED_IN_AREA_3D, Location.X - Range, Location.Y - Range, Location.Z - Range, Location.X + Range, Location.Y + Range, Location.Z + Range);
-- }
function Global.IsCopVehicleInArea_3d(x1, x2, y1, y2, z1, z2)
	return _in(0x7EEF65D5F153E26A, x1, x2, y1, y2, z1, z2, _r)
end

function Global.IsCutsceneActive()
	return _in(0x991251AFC3981F84, _r)
end

function Global.IsCutscenePlaying()
	return _in(0xD3C2E180A40F031E, _r)
end

function Global.IsDamageTrackerActiveOnNetworkId(netID)
	return _in(0x6E192E33AD436366, netID, _r)
end

function Global.IsDecalAlive(decal)
	return _in(0xC694D74949CAFD0C, decal, _r)
end

--- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsDisabledControlJustPressed(inputGroup, control)
	return _in(0x91AEF906BCA88877, inputGroup, control, _r)
end

--- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsDisabledControlJustReleased(inputGroup, control)
	return _in(0x305C8DCD79DA8B0F, inputGroup, control, _r)
end

--- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsDisabledControlPressed(inputGroup, control)
	return _in(0xE2587F8CBBD87B1D, inputGroup, control, _r)
end

function Global.IsDlcDataEmpty(dlcData)
	return _in(0xD4D7B033C3AA243C, dlcData, _r)
end
Global.IsOutfitEmpty = Global.IsDlcDataEmpty

--- Example:
-- DLC2::IS_DLC_PRESENT($\mpbusiness2\);
-- ($ = gethashkey)
-- bruteforce these:
-- 0xB119F6D
-- 0x96F02EE6
function Global.IsDlcPresent(dlcHash)
	return _in(0x812595A0644CE1DE, _ch(dlcHash), _r)
end

--- Use _GET_VEHICLE_MOD_DATA for modData
function Global.IsDlcVehicleMod(modData)
	return _in(0x0564B9FF9631B82C, modData, _r)
end
Global.N_0x0564b9ff9631b82c = Global.IsDlcVehicleMod

function Global.IsDoorClosed(door)
	return _in(0xC531EE8A1145A149, _ch(door), _r)
end

function Global.IsDrivebyTaskUnderneathDrivingTask(ped)
	return _in(0x8785E6E40C7A8818, ped, _r)
end

--- Gets whether or not this is the CitizenFX server.
-- @return A boolean value.
function Global.IsDuplicityVersion()
	return _in(0xcf24c52e, _r)
end

--- XBOX ONE
-- MulleDK19: This function is hard-coded to always return 0.
function Global.IsDurangoVersion()
	return _in(0x4D982ADB1978442D, _r)
end

function Global.IsEntityAMissionEntity(entity)
	return _in(0x0A7B270912999B3C, entity, _r)
end

function Global.IsEntityAPed(entity)
	return _in(0x524AC5ECEA15343E, entity, _r)
end

function Global.IsEntityAVehicle(entity)
	return _in(0x6AC7003FA6E5575E, entity, _r)
end

function Global.IsEntityAnObject(entity)
	return _in(0x8D68C8FD0FACA94E, entity, _r)
end

--- Checks if entity is within x/y/zSize distance of x/y/z.
-- Last three are unknown ints, almost always p7 = 0, p8 = 1, p9 = 0
function Global.IsEntityAtCoord(entity, xPos, yPos, zPos, xSize, ySize, zSize, p7, p8, p9)
	return _in(0x20B60995556D004F, entity, xPos, yPos, zPos, xSize, ySize, zSize, p7, p8, p9, _r)
end

--- Checks if entity1 is within the box defined by x/y/zSize of entity2.
-- Last three parameters are almost alwasy p5 = 0, p6 = 1, p7 = 0
function Global.IsEntityAtEntity(entity1, entity2, xSize, ySize, zSize, p5, p6, p7)
	return _in(0x751B70C3D034E187, entity1, entity2, xSize, ySize, zSize, p5, p6, p7, _r)
end

function Global.IsEntityAttached(entity)
	return _in(0xB346476EF1A64897, entity, _r)
end

function Global.IsEntityAttachedToAnyObject(entity)
	return _in(0xCF511840CEEDE0CC, entity, _r)
end

function Global.IsEntityAttachedToAnyPed(entity)
	return _in(0xB1632E9A5F988D11, entity, _r)
end

function Global.IsEntityAttachedToAnyVehicle(entity)
	return _in(0x26AA915AD89BFB4B, entity, _r)
end

function Global.IsEntityAttachedToEntity(from, to)
	return _in(0xEFBE71898A993728, from, to, _r)
end

function Global.IsEntityDead(entity)
	return _in(0x5F9532F3B5CC2551, entity, _r)
end

function Global.IsEntityFocus(entity)
	return _in(0x2DDFF3FB9075D747, entity, _r)
end

function Global.IsEntityInAir(entity)
	return _in(0x886E37EC497200B6, entity, _r)
end

--- Creates a spherical cone at origin that extends to surface with the angle specified. Then returns true if the entity is inside the spherical cone
-- Angle is measured in degrees.
-- These values are constant, most likely bogus:
-- p8 = 0, p9 = 1, p10 = 0
-- This method can also take two float&lt;3&gt; instead of 6 floats.
function Global.IsEntityInAngledArea(entity, originX, originY, originZ, edgeX, edgeY, edgeZ, angle, p8, p9, p10)
	return _in(0x51210CED3DA1C78A, entity, originX, originY, originZ, edgeX, edgeY, edgeZ, angle, p8, p9, p10, _r)
end

function Global.IsEntityInArea(entity, x1, y1, z1, x2, y2, z2, p7, p8, p9)
	return _in(0x54736AA40E271165, entity, x1, y1, z1, x2, y2, z2, p7, p8, p9, _r)
end

function Global.IsEntityInWater(entity)
	return _in(0xCFB0A0D8EDD145A3, entity, _r)
end

function Global.IsEntityInZone(entity, zone)
	return _in(0xB6463CF6AF527071, entity, _ts(zone), _r)
end

function Global.IsEntityOccluded(entity)
	return _in(0xE31C2C72B8692B64, entity, _r)
end

function Global.IsEntityOnFire(entity)
	return _in(0x28D3FED7190D3A0B, entity, _r)
end

--- Returns true if the entity is in between the minimum and maximum values for the 2d screen coords.
-- This means that it will return true even if the entity is behind a wall for example, as long as you're looking at their location.
-- Chipping
function Global.IsEntityOnScreen(entity)
	return _in(0xE659E47AF827484B, entity, _r)
end

--- See also PED::IS_SCRIPTED_SCENARIO_PED_USING_CONDITIONAL_ANIM 0x6EC47A344923E1ED 0x3C30B447
-- Taken from ENTITY::IS_ENTITY_PLAYING_ANIM(PLAYER::PLAYER_PED_ID(), "creatures@shark@move", "attack_player", 3)
-- p4 is always 3 in the scripts.
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.IsEntityPlayingAnim(entity, animDict, animName, p4)
	return _in(0x1F0B79228E461EC9, entity, _ts(animDict), _ts(animName), p4, _r)
end

--- a static ped will not react to natives like "APPLY_FORCE_TO_ENTITY" or "SET_ENTITY_VELOCITY" and oftentimes will not react to task-natives like "AI::TASK_COMBAT_PED". The only way I know of to make one of these peds react is to ragdoll them (or sometimes to use CLEAR_PED_TASKS_IMMEDIATELY(). Static peds include almost all far-away peds, beach-combers, peds in certain scenarios, peds crossing a crosswalk, peds walking to get back into their cars, and others. If anyone knows how to make a ped non-static without ragdolling them, please edit this with the solution.
-- how can I make an entity static???
function Global.IsEntityStatic(entity)
	return _in(0x1218E6886D3D8327, entity, _r)
end

function Global.IsEntityTouchingEntity(entity, targetEntity)
	return _in(0x17FFC1B2BA35A494, entity, targetEntity, _r)
end

function Global.IsEntityTouchingModel(entity, modelHash)
	return _in(0x0F42323798A58C8C, entity, _ch(modelHash), _r)
end

function Global.IsEntityUpright(entity, angle)
	return _in(0x5333F526F6AB19AA, entity, angle, _r)
end

function Global.IsEntityUpsidedown(entity)
	return _in(0x1DBD58820FA61D71, entity, _r)
end

function Global.IsEntityVisible(entity)
	return _in(0x47D6F43D77935C75, entity, _r)
end

function Global.IsEntityVisibleToScript(entity)
	return _in(0xD796CB5BA8F20E32, entity, _r)
end

function Global.IsEntityWaitingForWorldCollision(entity)
	return _in(0xD05BFF0C0A12C68F, entity, _r)
end

function Global.IsExplosionInAngledArea(explosionType, x1, y1, z1, x2, y2, z2, angle)
	return _in(0xA079A6C51525DC4B, explosionType, x1, y1, z1, x2, y2, z2, angle, _r)
end

function Global.IsExplosionInArea(explosionType, x1, y1, z1, x2, y2, z2)
	return _in(0x2E2EBA0EE7CED0E0, explosionType, x1, y1, z1, x2, y2, z2, _r)
end

function Global.IsExplosionInSphere(explosionType, x, y, z, radius)
	return _in(0xAB0F816885B0E483, explosionType, x, y, z, radius, _r)
end

function Global.IsFirstPersonAimCamActive()
	return _in(0x5E346D934122613F, _r)
end

function Global.IsFollowPedCamActive()
	return _in(0xC6D3D26810C8E0F9, _r)
end

function Global.IsFollowVehicleCamActive()
	return _in(0xCBBDE6D335D6D496, _r)
end

--- This function is hard-coded to always return 0.
function Global.IsFrontendFading()
	return _in(0x7EA2B6AF97ECA6ED, _r)
end

--- Hardcoded to return 1
function Global.IsGameInControlOfMusic()
	return _in(0x6D28DC1671E334FD, _r)
end

function Global.IsGameplayCamLookingBehind()
	return _in(0x70FDA869F3317EA9, _r)
end

--- Examples when this function will return 0 are:
-- - During busted screen.
-- - When player is coming out from a hospital.
-- - When player is coming out from a police station.
function Global.IsGameplayCamRendering()
	return _in(0x39B5D1B10383F0C8, _r)
end

function Global.IsGameplayCamShaking()
	return _in(0x016C090630DF1F89, _r)
end

function Global.IsGameplayHintActive()
	return _in(0xE520FF1AD2785B40, _r)
end

function Global.IsGarageEmpty(garage, p1, p2)
	return _in(0x90E47239EA1980B8, garage, p1, p2, _r)
end

function Global.IsHeliPartBroken(vehicle, p1, p2, p3)
	return _in(0xBC74B4BE25EB6C8A, vehicle, p1, p2, p3, _r)
end

function Global.IsHelpMessageBeingDisplayed()
	return _in(0x4D79439A6B55AC67, _r)
end

function Global.IsHelpMessageFadingOut()
	return _in(0x327EDEEEAC55C369, _r)
end

function Global.IsHelpMessageOnScreen()
	return _in(0xDAD37F45428801AE, _r)
end

--- Checks whether the horn of a vehicle is currently played.
function Global.IsHornActive(vehicle)
	return _in(0x9D6BFC12B05C6121, vehicle, _r)
end

--- Full list of components below
-- HUD = 0;
-- HUD_WANTED_STARS = 1;
-- HUD_WEAPON_ICON = 2;
-- HUD_CASH = 3;
-- HUD_MP_CASH = 4;
-- HUD_MP_MESSAGE = 5;
-- HUD_VEHICLE_NAME = 6;
-- HUD_AREA_NAME = 7;
-- HUD_VEHICLE_CLASS = 8;
-- HUD_STREET_NAME = 9;
-- HUD_HELP_TEXT = 10;
-- HUD_FLOATING_HELP_TEXT_1 = 11;
-- HUD_FLOATING_HELP_TEXT_2 = 12;
-- HUD_CASH_CHANGE = 13;
-- HUD_RETICLE = 14;
-- HUD_SUBTITLE_TEXT = 15;
-- HUD_RADIO_STATIONS = 16;
-- HUD_SAVING_GAME = 17;
-- HUD_GAME_STREAM = 18;
-- HUD_WEAPON_WHEEL = 19;
-- HUD_WEAPON_WHEEL_STATS = 20;
-- MAX_HUD_COMPONENTS = 21;
-- MAX_HUD_WEAPONS = 22;
-- MAX_SCRIPTED_HUD_COMPONENTS = 141;
function Global.IsHudComponentActive(id)
	return _in(0xBC4C9EA5391ECC0D, id, _r)
end

function Global.IsHudHidden()
	return _in(0xA86478C6958735C5, _r)
end

function Global.IsHudPreferenceSwitchedOn()
	return _in(0x1930DFA731813EC4, _r)
end

function Global.IsInItemset(p0, p1)
	return _in(0x2D0FC594D1E9C107, p0, p1, _r)
end

--- Only occurrence was false, in maintransition.
function Global.IsInLoadingScreen(p0)
	return _in(0xFC309E94546FCDB5, p0)
end
Global.N_0xfc309e94546fcdb5 = Global.IsInLoadingScreen

function Global.IsInVehicleCamDisabled()
	return _in(0x4F32C0D5A90A9B40, _r)
end
Global.N_0x4f32c0d5a90a9b40 = Global.IsInVehicleCamDisabled

--- =======================================================
-- Correction, I have change this to int, instead of int*
-- as it doesn't use a pointer to the createdIncident.
-- If you try it you will crash (or) freeze.
-- =======================================================
function Global.IsIncidentValid(incidentId)
	return _in(0xC8BC6461E629BEAA, incidentId, _r)
end

--- Seems to return true if the input is currently disabled. "_GET_LAST_INPUT_METHOD" didn't seem very accurate, but I've left the original description below.
-- --
-- index usually 2
-- returns true if the last input method was made with mouse + keyboard, false if it was made with a gamepad
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsInputDisabled(inputGroup)
	return _in(0xA571D46727E2B718, inputGroup, _r)
end
Global.GetLastInputMethod = Global.IsInputDisabled

--- I may be wrong with this one, but from the looks of the scripts, it sets keyboard related stuff as soon as this returns true.
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.IsInputJustDisabled(inputGroup)
	return _in(0x13337B38DB572509, inputGroup, _r)
end
Global.N_0x13337b38db572509 = Global.IsInputJustDisabled

function Global.IsInteriorCapped(interiorID)
	return _in(0x92BAC8ACF88CEC26, interiorID, _r)
end

function Global.IsInteriorDisabled(interiorID)
	return _in(0xBC5115A5A939DD15, interiorID, _r)
end

function Global.IsInteriorPropEnabled(interiorID, propName)
	return _in(0x35F7DD45E8C0A16D, interiorID, _ts(propName), _r)
end
Global.N_0x35f7dd45e8c0a16d = Global.IsInteriorPropEnabled

function Global.IsInteriorReady(interiorID)
	return _in(0x6726BDCCC1932F0E, interiorID, _r)
end

--- Returns a bool if interior rendering is disabled, if yes, all "normal" rendered interiors are invisible
function Global.IsInteriorRenderingDisabled()
	return _in(0x95AB8B5C992C7B58, _r)
end

function Global.IsInteriorScene()
	return _in(0xBC72B5D7A1CBD54D, _r)
end

function Global.IsIplActive(iplName)
	return _in(0x88A741E44A2B3495, _ts(iplName), _r)
end

function Global.IsItemsetValid(p0)
	return _in(0xB1B1EA596344DFAB, p0, _r)
end

function Global.IsLoadingPromptBeingDisplayed()
	return _in(0xD422FCC5F239A915, _r)
end
Global.N_0xd422fcc5f239a915 = Global.IsLoadingPromptBeingDisplayed

function Global.IsLookInverted()
	return _in(0x77B612531280010D, _r)
end

function Global.IsMemoryCardInUse()
	return _in(0x8A75CE2956274ADD, _r)
end

function Global.IsMessageBeingDisplayed()
	return _in(0x7984C03AA5CC2F41, _r)
end

function Global.IsMinigameInProgress()
	return _in(0x2B4A15E44DE0F478, _r)
end

function Global.IsMinimapAreaRevealed(x, y, radius)
	return _in(0x6E31B91145873922, x, y, radius, _r)
end
Global.N_0x6e31b91145873922 = Global.IsMinimapAreaRevealed

function Global.IsMissionCompletePlaying()
	return _in(0x19A30C23F5827F8A, _r)
end

function Global.IsMissionCreatorBlip(blip)
	return _in(0x26F49BF3381D933D, blip, _r)
end

function Global.IsMobilePhoneCallOngoing()
	return _in(0x7497D2CE2C30D24C, _r)
end

function Global.IsMobilePhoneRadioActive()
	return _in(0xB35CE999E8EF317E, _r)
end

--- Returns whether the specified model represents a vehicle.
function Global.IsModelAVehicle(model)
	return _in(0x19AAC8F07BFEC53E, _ch(model), _r)
end

--- Check if model is in cdimage(rpf)
function Global.IsModelInCdimage(model)
	return _in(0x35B9E0803292B641, _ch(model), _r)
end

--- Returns whether the specified model exists in the game.
function Global.IsModelValid(model)
	return _in(0xC0296A2EDF545E92, _ch(model), _r)
end

function Global.IsMountedWeaponTaskUnderneathDrivingTask(ped)
	return _in(0xA320EF046186FA3B, ped, _r)
end

function Global.IsMoveBlendRatioRunning(ped)
	return _in(0xD4D8636C0199A939, ped, _r)
end

function Global.IsMoveBlendRatioSprinting(ped)
	return _in(0x24A2AD74FA9814E2, ped, _r)
end

function Global.IsMoveBlendRatioStill(ped)
	return _in(0x349CE7B56DAFD95C, ped, _r)
end

function Global.IsMoveBlendRatioWalking(ped)
	return _in(0xF133BBBE91E1691F, ped, _r)
end

function Global.IsMpGamerTagActive(gamerTagId)
	return _in(0x4E929E7A5796FD26, gamerTagId, _r)
end
Global.N_0x4e929e7a5796fd26 = Global.IsMpGamerTagActive

function Global.IsNamedRendertargetLinked(hash)
	return _in(0x113750538FA31298, _ch(hash), _r)
end

function Global.IsNamedRendertargetRegistered(p0)
	return _in(0x78DCDC15C9F116B4, _ts(p0), _r)
end

--- Returns whether navmesh for the region is loaded. The region is a rectangular prism defined by it's top left deepest corner to it's bottom right shallowest corner.
-- If you can re-word this so it makes more sense, please do. I'm horrible with words sometimes...
function Global.IsNavmeshLoadedInArea(x1, y1, z1, x2, y2, z2)
	return _in(0xF813C7E63F9062A5, x1, y1, z1, x2, y2, z2, _r)
end

function Global.IsNetworkLoadingScene()
	return _in(0x41CA5A33160EA4AB, _r)
end

--- hash collision.
-- Definitely a hash collision, has something do to with your local player, not a vehicle
function Global.IsNetworkVehicleBeenDamagedByAnyObject(x, y, z)
	return _in(0xDBD2056652689917, x, y, z, _r)
end

function Global.IsNewLoadSceneActive()
	return _in(0xA41A05B6CB741B85, _r)
end

function Global.IsNewLoadSceneLoaded()
	return _in(0x01B8247A7A8B9AD1, _r)
end

function Global.IsNextWeatherType(weatherType)
	return _in(0x2FAA3A30BEC0F25D, _ts(weatherType), _r)
end

--- Gets whether or not NIGHTVISION is Active.
-- Note:  When nightvision is actually active, this native will return TRUE!
function Global.IsNightvisionActive()
	return _in(0x2202A3F42C8E5F79, _r)
end
Global.IsNightvisionInactive = Global.IsNightvisionActive

function Global.IsObjectNearPoint(objectHash, x, y, z, range)
	return _in(0x8C90FE4B381BA60A, _ch(objectHash), x, y, z, range, _r)
end

function Global.IsObjectVisible(object)
	return _in(0x8B32ACE6326A7546, object, _r)
end

function Global.IsObjectWithinBrainActivationRange(object)
	return _in(0xCCBA154209823057, object, _r)
end

--- PS4
-- MulleDK19: This function is hard-coded to always return 0.
-- Force67: I patched return result and got this : i.imgur.com/hUn7zSj.jpg
-- translate please?
function Global.IsOrbisVersion()
	return _in(0xA72BC0B675B1519E, _r)
end

function Global.IsParticleFxDelayedBlink()
	return _in(0x5CCABFFCA31DDE33, _r, _rf)
end

function Global.IsPauseMenuActive()
	return _in(0xB0034A223497FFCB, _r)
end

function Global.IsPauseMenuRestarting()
	return _in(0x1C491717107431C7, _r)
end

--- PC
-- MulleDK19: This function is hard-coded to always return 1.
function Global.IsPcVersion()
	return _in(0x48AF36444B965238, _r)
end

--- Returns true if the given ped has a valid pointer to CPlayerInfo in its CPed class. That's all.
function Global.IsPedAPlayer(ped)
	return _in(0x12534C348C6CB68B, ped, _r)
end

function Global.IsPedActiveInScenario(ped)
	return _in(0xAA135F9482C82CC3, ped, _r)
end

function Global.IsPedAimingFromCover(ped)
	return _in(0x3998B1276A3300E5, ped, _r)
end

--- p1 is anywhere from 4 to 7 in the scripts. Might be a weapon wheel group?
-- ^It's kinda like that.
-- 7 returns true if you are equipped with any weapon except your fists.
-- 6 returns true if you are equipped with any weapon except melee weapons.
-- 5 returns true if you are equipped with any weapon except the Explosives weapon group.
-- 4 returns true if you are equipped with any weapon except Explosives weapon group AND melee weapons.
-- 3 returns true if you are equipped with either Explosives or Melee weapons (the exact opposite of 4).
-- 2 returns true only if you are equipped with any weapon from the Explosives weapon group.
-- 1 returns true only if you are equipped with any Melee weapon.
-- 0 never returns true.
-- Note: When I say "Explosives weapon group", it does not include the Jerry can and Fire Extinguisher.
function Global.IsPedArmed(ped, p1)
	return _in(0x475768A975D5AD17, ped, p1, _r)
end

--- This function is hard-coded to always return 0.
function Global.IsPedBeingArrested(ped)
	return _in(0x90A09F3A45FED688, ped, _r)
end

function Global.IsPedBeingJacked(ped)
	return _in(0x9A497FE2DF198913, ped, _r)
end

function Global.IsPedBeingStealthKilled(ped)
	return _in(0x863B23EFDE9C5DF2, ped, _r)
end

--- p1 is always 0
function Global.IsPedBeingStunned(ped, p1)
	return _in(0x4FBACCE3B4138EE8, ped, p1, _r)
end

function Global.IsPedBlushColorValid(colorID)
	return _in(0x604E810189EE3A59, colorID, _r)
end
Global.N_0x604e810189ee3a59 = Global.IsPedBlushColorValid

function Global.IsPedClimbing(ped)
	return _in(0x53E8CB4F48BFE623, ped, _r)
end

--- Checks if the component variation is valid, this works great for randomizing components using loops.
-- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.IsPedComponentVariationValid(ped, componentId, drawableId, textureId)
	return _in(0xE825F6B6CEA7671D, ped, componentId, drawableId, textureId, _r)
end

--- l
function Global.IsPedCuffed(ped)
	return _in(0x74E559B3BC910685, ped, _r)
end

--- This native returns a true or false value.
-- Ped ped = The ped whose weapon you want to check.
function Global.IsPedCurrentWeaponSilenced(ped)
	return _in(0x65F0C5AE05943EC7, ped, _r)
end

--- Seems to consistently return true if the ped is dead.
-- p1 is always passed 1 in the scripts.
-- I suggest to remove "OR_DYING" part, because it does not detect dying phase.
-- That's what the devs call it, cry about it.
-- lol
function Global.IsPedDeadOrDying(ped, p1)
	return _in(0x3317DEDB88C95038, ped, p1, _r)
end

function Global.IsPedDiving(ped)
	return _in(0x5527B8246FEF9B11, ped, _r)
end

function Global.IsPedDoingDriveby(ped)
	return _in(0xB2C086CC1BF8F2BF, ped, _r)
end

function Global.IsPedDucking(ped)
	return _in(0xD125AE748725C6BC, ped, _r)
end

--- Presumably returns the Entity that the Ped is currently diving out of the way of.
-- var num3;
-- if (PED::IS_PED_EVASIVE_DIVING(A_0, &amp;num3) != 0)
-- if (ENTITY::IS_ENTITY_A_VEHICLE(num3) != 0)
function Global.IsPedEvasiveDiving(ped, evadingEntity)
	return _in(0x414641C26E105898, ped, _ii(evadingEntity) --[[ may be optional ]], _r)
end

--- angle is ped's view cone
function Global.IsPedFacingPed(ped, otherPed, angle)
	return _in(0xD71649DB0A545AA3, ped, otherPed, angle, _r)
end

function Global.IsPedFalling(ped)
	return _in(0xFB92A102F1C4DFA3, ped, _r)
end

--- Gets a value indicating whether this ped's health is below its fatally injured threshold. The default threshold is 100.
-- If the handle is invalid, the function returns true.
function Global.IsPedFatallyInjured(ped)
	return _in(0xD839450756ED5A80, ped, _r)
end

function Global.IsPedFleeing(ped)
	return _in(0xBBCCE00B381F8482, ped, _r)
end

function Global.IsPedGettingIntoAVehicle(ped)
	return _in(0xBB062B2B5722478E, ped, _r)
end

function Global.IsPedGettingUp(ped)
	return _in(0x2A74E1D5F2F00EEC, ped, _r)
end

function Global.IsPedGoingIntoCover(ped)
	return _in(0x9F65DBC537E59AD5, ped, _r)
end

function Global.IsPedGroupMember(ped, groupId)
	return _in(0x9BB01E3834671191, ped, groupId, _r)
end

function Global.IsPedHairColorValid(colorID)
	return _in(0xE0D36E5D9E99CC21, colorID, _r)
end
Global.N_0xe0d36e5d9e99cc21 = Global.IsPedHairColorValid

function Global.IsPedHangingOnToVehicle(ped)
	return _in(0x1C86D8AEF8254B78, ped, _r)
end

function Global.IsPedHeadtrackingEntity(ped, entity)
	return _in(0x813A0A7C9D2E831F, ped, entity, _r)
end

function Global.IsPedHeadtrackingPed(ped1, ped2)
	return _in(0x5CD3CB88A7F8850D, ped1, ped2, _r)
end

--- Returns true/false if the ped is/isn't humanoid.
function Global.IsPedHuman(ped)
	return _in(0xB980061DA992779D, ped, _r)
end

--- Returns whether the specified ped is hurt.
function Global.IsPedHurt(ped)
	return _in(0x5983BB449D7FDB12, ped, _r)
end

function Global.IsPedInAnyBoat(ped)
	return _in(0x2E0E1C2B4F6CB339, ped, _r)
end

function Global.IsPedInAnyHeli(ped)
	return _in(0x298B91AE825E5705, ped, _r)
end

function Global.IsPedInAnyPlane(ped)
	return _in(0x5FFF4CFC74D8FB80, ped, _r)
end

function Global.IsPedInAnyPoliceVehicle(ped)
	return _in(0x0BD04E29640C9C12, ped, _r)
end

function Global.IsPedInAnySub(ped)
	return _in(0xFBFC01CCFB35D99E, ped, _r)
end

function Global.IsPedInAnyTaxi(ped)
	return _in(0x6E575D6A898AB852, ped, _r)
end

function Global.IsPedInAnyTrain(ped)
	return _in(0x6F972C1AB75A1ED0, ped, _r)
end

--- Gets a value indicating whether the specified ped is in any vehicle.
-- If 'atGetIn' is false, the function will not return true until the ped is sitting in the vehicle and is about to close the door. If it's true, the function returns true the moment the ped starts to get onto the seat (after opening the door). Eg. if false, and the ped is getting into a submersible, the function will not return true until the ped has descended down into the submersible and gotten into the seat, while if it's true, it'll return true the moment the hatch has been opened and the ped is about to descend into the submersible.
function Global.IsPedInAnyVehicle(ped, atGetIn)
	return _in(0x997ABD671D25CA0B, ped, atGetIn, _r)
end

--- Checks to see if ped and target are in combat with eachother. Only goes one-way: if target is engaged in combat with ped but ped has not yet reacted, the function will return false until ped starts fighting back.
-- p1 is usually 0 in the scripts because it gets the ped id during the task sequence. For instance: PED::IS_PED_IN_COMBAT(l_42E[4/*14*/], PLAYER::PLAYER_PED_ID()) // armenian2.ct4: 43794
function Global.IsPedInCombat(ped, target)
	return _in(0x4859F1FC66A6278E, ped, target, _r)
end

--- p1 is nearly always 0 in the scripts.
function Global.IsPedInCover(ped, p1)
	return _in(0x60DFD0691A170B88, ped, p1, _r)
end

function Global.IsPedInCoverFacingLeft(ped)
	return _in(0x845333B3150583AB, ped, _r)
end

function Global.IsPedInCurrentConversation(ped)
	return _in(0x049E937F18F4020C, ped, _r)
end

function Global.IsPedInFlyingVehicle(ped)
	return _in(0x9134873537FA419C, ped, _r)
end

function Global.IsPedInGroup(ped)
	return _in(0x5891CAC5D4ACFF74, ped, _r)
end

--- Notes: The function only returns true while the ped is:
-- A.) Swinging a random melee attack (including pistol-whipping)
-- B.) Reacting to being hit by a melee attack (including pistol-whipping)
-- C.) Is locked-on to an enemy (arms up, strafing/skipping in the default fighting-stance, ready to dodge+counter).
-- You don't have to be holding the melee-targetting button to be in this stance; you stay in it by default for a few seconds after swinging at someone. If you do a sprinting punch, it returns true for the duration of the punch animation and then returns false again, even if you've punched and made-angry many peds
function Global.IsPedInMeleeCombat(ped)
	return _in(0x4E209B2C1EAD5159, ped, _r)
end

function Global.IsPedInModel(ped, modelHash)
	return _in(0x796D90EFB19AA332, ped, _ch(modelHash), _r)
end

function Global.IsPedInParachuteFreeFall(ped)
	return _in(0x7DCE8BDA0F1C1200, ped, _r)
end

--- Gets a value indicating whether the specified ped is in the specified vehicle.
-- If 'atGetIn' is false, the function will not return true until the ped is sitting in the vehicle and is about to close the door. If it's true, the function returns true the moment the ped starts to get onto the seat (after opening the door). Eg. if false, and the ped is getting into a submersible, the function will not return true until the ped has descended down into the submersible and gotten into the seat, while if it's true, it'll return true the moment the hatch has been opened and the ped is about to descend into the submersible.
function Global.IsPedInVehicle(ped, vehicle, atGetIn)
	return _in(0xA3EE4A07279BB9DB, ped, vehicle, atGetIn, _r)
end

--- returns true is the ped is on the ground whining like a little female dog from a gunshot wound
function Global.IsPedInWrithe(ped)
	return _in(0xDEB6D52126E7D640, ped, _r)
end

--- Gets a value indicating whether this ped's health is below its injured threshold.
-- The default threshold is 100.
function Global.IsPedInjured(ped)
	return _in(0x84A2DD9AC37C35C1, ped, _r)
end

function Global.IsPedJacking(ped)
	return _in(0x4AE4FF911DFB61DA, ped, _r)
end

function Global.IsPedJumping(ped)
	return _in(0xCEDABC5900A0BF97, ped, _r)
end

function Global.IsPedJumpingOutOfVehicle(ped)
	return _in(0x433DDFFE2044B636, ped, _r)
end

function Global.IsPedLipstickColorValid(colorID)
	return _in(0x0525A2C2562F3CD4, colorID, _r)
end
Global.N_0x0525a2c2562f3cd4 = Global.IsPedLipstickColorValid

--- Returns true/false if the ped is/isn't male.
function Global.IsPedMale(ped)
	return _in(0x6D9F5FAA7488BA46, ped, _r)
end

function Global.IsPedModel(ped, modelHash)
	return _in(0xC9D55B1A358A5BF7, ped, _ch(modelHash), _r)
end

function Global.IsPedOnAnyBike(ped)
	return _in(0x94495889E22C6479, ped, _r)
end

function Global.IsPedOnFoot(ped)
	return _in(0x01FEE67DB37F59B2, ped, _r)
end

--- Same function call as PED::GET_MOUNT, aka just returns 0
function Global.IsPedOnMount(ped)
	return _in(0x460BC76A0E10655E, ped, _r)
end

function Global.IsPedOnSpecificVehicle(ped, vehicle)
	return _in(0xEC5F66E459AF3BB2, ped, vehicle, _r)
end

--- Gets a value indicating whether the specified ped is on top of any vehicle.
-- Return 1 when ped is on vehicle.
-- Return 0 when ped is not on a vehicle.
function Global.IsPedOnVehicle(ped)
	return _in(0x67722AEB798E5FAB, ped, _r)
end

function Global.IsPedPerformingStealthKill(ped)
	return _in(0xFD4CCDBCC59941B7, ped, _r)
end

function Global.IsPedPlantingBomb(ped)
	return _in(0xC70B5FAE151982D8, ped, _r)
end

function Global.IsPedProne(ped)
	return _in(0xD6A86331A537A7B9, ped, _r)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.IsPedPropValid(ped, componentId, drawableId, TextureId)
	return _in(0x2B16A3BFF1FBCE49, ped, componentId, drawableId, TextureId, _r)
end
Global.N_0x2b16a3bff1fbce49 = Global.IsPedPropValid

--- If the ped handle passed through the parenthesis is in a ragdoll state this will return true.
function Global.IsPedRagdoll(ped)
	return _in(0x47E4E977581C5B55, ped, _r)
end

--- Returns whether the specified ped is reloading.
function Global.IsPedReloading(ped)
	return _in(0x24B100C68C645951, ped, _r)
end

function Global.IsPedRespondingToEvent(ped, event)
	return _in(0x625B774D75C87068, ped, event, _r)
end

function Global.IsPedRingtonePlaying(ped)
	return _in(0x1E8E5E20937E3137, ped, _r)
end

function Global.IsPedRunning(ped)
	return _in(0xC5286FFC176F28A2, ped, _r)
end

function Global.IsPedRunningArrestTask(ped)
	return _in(0x3DC52677769B4AE0, ped, _r)
end

function Global.IsPedRunningMobilePhoneTask(ped)
	return _in(0x2AFE52F782F25775, ped, _r)
end

function Global.IsPedRunningRagdollTask(ped)
	return _in(0xE3B6097CC25AA69E, ped, _r)
end

--- Returns whether the specified ped is shooting.
function Global.IsPedShooting(ped)
	return _in(0x34616828CD07F1A1, ped, _r)
end

function Global.IsPedShootingInArea(ped, x1, y1, z1, x2, y2, z2, p7, p8)
	return _in(0x7E9DFE24AC1E58EF, ped, x1, y1, z1, x2, y2, z2, p7, p8, _r)
end

--- Detect if ped is in any vehicle
-- [True/False]
function Global.IsPedSittingInAnyVehicle(ped)
	return _in(0x826AA586EDB9FEF8, ped, _r)
end

--- Detect if ped is sitting in the specified vehicle
-- [True/False]
function Global.IsPedSittingInVehicle(ped, vehicle)
	return _in(0xA808AA1D79230FC2, ped, vehicle, _r)
end

function Global.IsPedSprinting(ped)
	return _in(0x57E457CD2C0FC168, ped, _r)
end

--- Console Hash: 0xDD5D08A7
function Global.IsPedStandingInCover(ped)
	return _in(0x6A03BF943D767C93, ped, _r)
end
Global.N_0x6a03bf943d767c93 = Global.IsPedStandingInCover

function Global.IsPedStill(ped)
	return _in(0xAC29253EEF8F0180, ped, _r)
end

--- Returns true if the ped doesn't do any movement. If the ped is being pushed forwards by using APPLY_FORCE_TO_ENTITY for example, the function returns false.
function Global.IsPedStopped(ped)
	return _in(0x530944F6F4B8A214, ped, _r)
end

--- What's strafing?
function Global.IsPedStrafing(ped)
	return _in(0xE45B7F222DE47E09, ped, _r)
end

function Global.IsPedSwimming(ped)
	return _in(0x9DE327631295B4C2, ped, _r)
end

function Global.IsPedSwimmingUnderWater(ped)
	return _in(0xC024869A53992F34, ped, _r)
end

function Global.IsPedTracked(ped)
	return _in(0x4C5E1F087CD10BB7, ped, _r)
end

function Global.IsPedTryingToEnterALockedVehicle(ped)
	return _in(0x44D28D5DDFE5F68C, ped, _r)
end

function Global.IsPedUsingActionMode(ped)
	return _in(0x00E73468D085F745, ped, _r)
end

function Global.IsPedUsingAnyScenario(ped)
	return _in(0x57AB4A3080F85143, ped, _r)
end

function Global.IsPedUsingScenario(ped, scenario)
	return _in(0x1BF094736DD62C2E, ped, _ts(scenario), _r)
end

function Global.IsPedVaulting(ped)
	return _in(0x117C70D1F5730B5E, ped, _r)
end

function Global.IsPedWalking(ped)
	return _in(0xDE4C184B2B9B071A, ped, _r)
end

function Global.IsPedWeaponComponentActive(ped, weaponHash, componentHash)
	return _in(0x0D78DE0572D3969E, ped, _ch(weaponHash), _ch(componentHash), _r)
end

function Global.IsPedWeaponReadyToShoot(ped)
	return _in(0xB80CA294F2F26749, ped, _r)
end

--- Returns true if the ped passed through the parenthesis is wearing a helmet.
function Global.IsPedWearingHelmet(ped)
	return _in(0xF33BDFE19B309B19, ped, _r)
end

--- gtaforums.com/topic/885580-ped-headshotmugshot-txd/
function Global.IsPedheadshotReady(handle)
	return _in(0x7085228842B13A67, handle, _r)
end

--- gtaforums.com/topic/885580-ped-headshotmugshot-txd/
function Global.IsPedheadshotValid(handle)
	return _in(0xA0A9668F158129A2, handle, _r)
end

--- Pickup hashes: pastebin.com/8EuSv2r1
function Global.IsPickupWithinRadius(pickupHash, x, y, z, radius)
	return _in(0xF9C36251F6E48E33, _ch(pickupHash), x, y, z, radius, _r)
end

function Global.IsPlaybackGoingOnForVehicle(p0)
	return _in(0x1C8A4C2C19E68EEC, p0, _r)
end

function Global.IsPlaybackUsingAiGoingOnForVehicle(p0)
	return _in(0xAEA8FD591FAD4106, p0, _r)
end

--- Return true while player is being arrested / busted.
-- If atArresting is set to 1, this function will return 1 when player is being arrested (while player is putting his hand up, but still have control)
-- If atArresting is set to 0, this function will return 1 only when the busted screen is shown.
function Global.IsPlayerBeingArrested(player, atArresting)
	return _in(0x388A47C51ABDAC8E, player, atArresting, _r)
end

--- Returns true when the player is not able to control the cam i.e. when running a benchmark test, switching the player or viewing a cutscene.
-- Note: I am not 100% sure if the native actually checks if the cam control is disabled but it seems promising.
function Global.IsPlayerCamControlDisabled()
	return _in(0x7C814D2FB49F40C0, _r)
end
Global.N_0x7c814d2fb49f40c0 = Global.IsPlayerCamControlDisabled

--- Returns TRUE if the player ('s ped) is climbing at the moment.
function Global.IsPlayerClimbing(player)
	return _in(0x95E8F73DC65EFB9C, player, _r)
end

--- Can the player control himself, used to disable controls for player for things like a cutscene.
-- ---
-- You can't disable controls with this, use SET_PLAYER_CONTROL(...) for this.
function Global.IsPlayerControlOn(player)
	return _in(0x49C32D60007AFA47, player, _r)
end

function Global.IsPlayerDead(player)
	return _in(0x424D4687FA1E5652, player, _r)
end

--- Gets a value indicating whether the specified player is currently aiming freely.
function Global.IsPlayerFreeAiming(player)
	return _in(0x2E397FD2ECD37C87, player, _r)
end

--- Gets a value indicating whether the specified player is currently aiming freely at the specified entity.
function Global.IsPlayerFreeAimingAtEntity(player, entity)
	return _in(0x3C06B5C839B38F7B, player, entity, _r)
end

function Global.IsPlayerFreeForAmbientTask(player)
	return _in(0xDCCFD3F106C36AB4, player, _r)
end

function Global.IsPlayerInCutscene(player)
	return _in(0xE73092F4157CD126, player, _r)
end

--- this function is hard-coded to always return 0.
function Global.IsPlayerLoggingInNp()
	return _in(0x74556E1420867ECA, _r)
end

--- Returns TRUE if the game is in online mode and FALSE if in offline mode.
-- This is an alias for NETWORK_IS_SIGNED_ONLINE.
function Global.IsPlayerOnline()
	return _in(0xF25D331DC2627BBC, _r)
end

--- Checks whether the specified player has a Ped, the Ped is not dead, is not injured and is not arrested.
function Global.IsPlayerPlaying(player)
	return _in(0x5E9564D8246B909A, player, _r)
end

function Global.IsPlayerPressingHorn(player)
	return _in(0xFA1E2BF8B10598F9, player, _r)
end

function Global.IsPlayerReadyForCutscene(player)
	return _in(0x908CBECC2CAA3690, player, _r)
end

--- Returns true if the player is riding a train.
function Global.IsPlayerRidingTrain(player)
	return _in(0x4EC12697209F2196, player, _r)
end

function Global.IsPlayerScriptControlOn(player)
	return _in(0x8A876A65283DD7D7, player, _r)
end

--- Returns true if the player is currently switching, false otherwise.
-- (When the camera is in the sky moving from Trevor to Franklin for example)
function Global.IsPlayerSwitchInProgress()
	return _in(0xD9D2CFFF49FAB35F, _r)
end
Global.N_0xd9d2cfff49fab35f = Global.IsPlayerSwitchInProgress

function Global.IsPlayerTargettingAnything(player)
	return _in(0x78CFE51896B6B8A4, player, _r)
end

function Global.IsPlayerTargettingEntity(player, entity)
	return _in(0x7912F7FC4F6264B6, player, entity, _r)
end

function Global.IsPlayerTeleportActive()
	return _in(0x02B15662D7F8886F, _r)
end

function Global.IsPlayerVehicleRadioEnabled()
	return _in(0x5F43D83FD6738741, _r)
end
Global.N_0x5f43d83fd6738741 = Global.IsPlayerVehicleRadioEnabled

function Global.IsPlayerWantedLevelGreater(player, wantedLevel)
	return _in(0x238DB2A2C23EE9EF, player, wantedLevel, _r)
end

function Global.IsPlayingPhoneGestureAnim(ped)
	return _in(0xB8EBB1E9D3588C10, ped, _r)
end

function Global.IsPointInAngledArea(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	return _in(0x2A70BAE8883E4C81, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, _r)
end

function Global.IsPointObscuredByAMissionEntity(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xE54E209C35FFA18D, p0, p1, p2, p3, p4, p5, p6, _r)
end

--- Gets a value indicating whether the specified position is on a road.
-- The vehicle parameter is not implemented (ignored).
function Global.IsPointOnRoad(x, y, z, vehicle)
	return _in(0x125BF4ABFC536B09, x, y, z, vehicle, _r)
end

function Global.IsPositionOccupied(x, y, z, range, p4, p5, p6, p7, p8, p9, p10)
	return _in(0xADCDE75E1C60F32D, x, y, z, range, p4, p5, p6, p7, p8, p9, p10, _r)
end

function Global.IsPrevWeatherType(weatherType)
	return _in(0x44F28F86433B10A9, _ts(weatherType), _r)
end

--- Determines whether there is a projectile within the specified coordinates. The coordinates form a rectangle.
-- ownedByPlayer = only projectiles fired by the player will be detected.
function Global.IsProjectileInArea(x1, y1, z1, x2, y2, z2, ownedByPlayer)
	return _in(0x5270A8FBC098C3F8, x1, y1, z1, x2, y2, z2, ownedByPlayer, _r)
end

function Global.IsProjectileTypeInAngledArea(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0xF0BC12401061DEA0, p0, p1, p2, p3, p4, p5, p6, p7, p8, _r)
end

--- Determines whether there is a projectile of a specific type within the specified coordinates. The coordinates form a rectangle.
-- Note: This native hasn't been tested yet.
function Global.IsProjectileTypeInArea(x1, y1, z1, x2, y2, z2, type, p7)
	return _in(0x2E0DC353342C4A6D, x1, y1, z1, x2, y2, z2, type, p7, _r)
end

--- PS3
-- MulleDK19: This function is hard-coded to always return 0.
function Global.IsPs3Version()
	return _in(0xCCA1072C29D096C2, _r)
end

function Global.IsRadarEnabled()
	return _in(0xAF754F20EB5CD51A, _r)
end
Global.N_0xaf754f20eb5cd51a = Global.IsRadarEnabled

function Global.IsRadarHidden()
	return _in(0x157F93B036700462, _r)
end

function Global.IsRadarPreferenceSwitchedOn()
	return _in(0x9EB6522EA68F22FE, _r)
end

function Global.IsRadioRetuning()
	return _in(0xA151A7394A214E65, _r)
end

--- Checks if you're recording, returns TRUE when you start recording (F1) or turn on action replay (F2)
-- mov al, cs:g_bIsRecordingGameplay // byte_141DD0CD0 in b944
-- retn
function Global.IsRecording()
	return _in(0x1897CA71995A90B4, _r)
end

--- if(NETWORK::_IS_ROCKSTAR_BANNED() == 0) means the player is rockstar banned
function Global.IsRockstarBanned()
	return _in(0x8020A73847E0CA7D, _r)
end

function Global.IsScInboxValid(p0)
	return _in(0x93028F1DB42BFD08, p0, _r)
end
Global.N_0x93028f1db42bfd08 = Global.IsScInboxValid

--- Occurrences in the b617d scripts:
-- "ARMY_GUARD",
-- "ARMY_HELI",
-- "BLIMP",
-- "Cinema_Downtown",
-- "Cinema_Morningwood",
-- "Cinema_Textile",
-- "City_Banks",
-- "Countryside_Banks",
-- "DEALERSHIP",
-- "KORTZ_SECURITY",
-- "LSA_Planes",
-- "MP_POLICE",
-- "Observatory_Bikers",
-- "POLICE_POUND1",
-- "POLICE_POUND2",
-- "POLICE_POUND3",
-- "POLICE_POUND4",
-- "POLICE_POUND5",
-- "Rampage1",
-- "SANDY_PLANES",
-- "SCRAP_SECURITY",
-- "SEW_MACHINE",
-- "SOLOMON_GATE"
-- Sometimes used with DOES_SCENARIO_GROUP_EXIST:
-- if (AI::DOES_SCENARIO_GROUP_EXIST("Observatory_Bikers") &amp;&amp;   (!AI::IS_SCENARIO_GROUP_ENABLED("Observatory_Bikers"))) {
-- else if (AI::IS_SCENARIO_GROUP_ENABLED("BLIMP")) {
function Global.IsScenarioGroupEnabled(scenarioGroup)
	return _in(0x367A09DED4E05B99, _ts(scenarioGroup), _r)
end

function Global.IsScenarioOccupied(p0, p1, p2, p3, p4)
	return _in(0x788756D73AC2E07C, p0, p1, p2, p3, p4, _r)
end

--- Occurrences in the b617d scripts:
-- "PROP_HUMAN_SEAT_CHAIR",
-- "WORLD_HUMAN_DRINKING",
-- "WORLD_HUMAN_HANG_OUT_STREET",
-- "WORLD_HUMAN_SMOKING",
-- "WORLD_MOUNTAIN_LION_WANDER",
-- "WORLD_HUMAN_DRINKING"
-- Sometimes used together with GAMEPLAY::IS_STRING_NULL_OR_EMPTY in the scripts.
-- scenarioType could be the same as scenarioName, used in for example AI::TASK_START_SCENARIO_AT_POSITION.
function Global.IsScenarioTypeEnabled(scenarioType)
	return _in(0x3A815DB3EA088722, _ts(scenarioType), _r)
end

function Global.IsScreenFadedIn()
	return _in(0x5A859503B0C08678, _r)
end

function Global.IsScreenFadedOut()
	return _in(0xB16FCE9DDC7BA182, _r)
end

function Global.IsScreenFadingIn()
	return _in(0x5C544BC6C57AC575, _r)
end

function Global.IsScreenFadingOut()
	return _in(0x797AC7CB535BA28F, _r)
end

--- In drunk_controller.c4, sub_309
-- if (CAM::_C912AF078AF19212()) {
-- CAM::_1C9D7949FA533490(0);
-- }
-- What does "IS_SCRIPT_GLOBAL_SHAKING" mean..? :/ Is this a hash collision?
function Global.IsScriptGlobalShaking()
	return _in(0xC912AF078AF19212, _r)
end
Global.N_0xc912af078af19212 = Global.IsScriptGlobalShaking

function Global.IsScriptedConversationLoaded()
	return _in(0xDF0D54BE7A776737, _r)
end

function Global.IsScriptedConversationOngoing()
	return _in(0x16754C556D2EDE3D, _r)
end

function Global.IsScriptedHudComponentActive(id)
	return _in(0xDD100EB17A94FF65, id, _r)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.IsScriptedScenarioPedUsingConditionalAnim(ped, animDict, anim)
	return _in(0x6EC47A344923E1ED, ped, _ts(animDict), _ts(anim), _r)
end

function Global.IsScriptedSpeechPlaying(p0)
	return _in(0xCC9AA18DCC7084F4, p0, _r)
end

--- Returns whether or not SEETHROUGH is active.
function Global.IsSeethroughActive()
	return _in(0x44B80ABAB9D80BD3, _r)
end

--- Some events that i found, not sure about them, but seems to have logic based on my tests:
-- '82 - dead body
-- '86
-- '87
-- '88 - shooting, fire extinguisher in use
-- '89
-- '93 - ped using horn
-- '95 - ped receiving melee attack
-- '102 - living ped receiving shot
-- '104 - player thrown grenade, tear gas, smoke grenade, jerry can dropping gasoline
-- '105 - melee attack against veh
-- '106 - player running
-- '108 - vehicle theft
-- '112 - melee attack
-- '113 - veh rollover ped
-- '114 - dead ped receiving shot
-- '116 - aiming at ped
-- '121
-- Here is full dump of shocking event types from the exe camx.me/gtav/tasks/shockingevents.txt
function Global.IsShockingEventInSphere(type, x, y, z, radius)
	return _in(0x1374ABB7C15BAB92, type, x, y, z, radius, _r)
end

--- Determines whether there is a sniper bullet within the specified coordinates. The coordinates form a rectangle.
function Global.IsSniperBulletInArea(x1, y1, z1, x2, y2, z2)
	return _in(0xFEFCF11B01287125, x1, y1, z1, x2, y2, z2, _r)
end

--- This function is hard-coded to always return 0.
function Global.IsSniperInverted()
	return _in(0x61A23B7EDA9BDA24, _r)
end

function Global.IsSocialClubActive()
	return _in(0xC406BE343FC4B9AF, _r)
end
Global.N_0xc406be343fc4b9af = Global.IsSocialClubActive

--- if(_IS_SOCIALCLUB_BANNED() == 0) means the player is social club banned
function Global.IsSocialclubBanned()
	return _in(0xA0AD7E2AF5349F61, _r)
end

function Global.IsSpecialAbilityActive(player)
	return _in(0x3E5F7FC85D854E15, player, _r)
end

function Global.IsSpecialAbilityEnabled(player)
	return _in(0xB1D200FE26AEF3CB, player, _r)
end

function Global.IsSpecialAbilityMeterFull(player)
	return _in(0x05A1FE504B7F2587, player, _r)
end

function Global.IsSpecialAbilityUnlocked(playerModel)
	return _in(0xC6017F6A6CDFA694, _ch(playerModel), _r)
end

function Global.IsSphereVisible(x, y, z, radius)
	return _in(0xE33D59DA70B58FDF, x, y, z, radius, _r)
end

function Global.IsSphereVisibleToAnotherMachine(p0, p1, p2, p3)
	return _in(0xD82CF8E64C8729D8, p0, p1, p2, p3, _r)
end

function Global.IsSphereVisibleToPlayer(p0, p1, p2, p3, p4)
	return _in(0xDC3A310219E5DA62, p0, p1, p2, p3, p4, _r)
end

function Global.IsSrlLoaded()
	return _in(0xD0263801A4C5B0BB, _r)
end

function Global.IsStreamPlaying()
	return _in(0xD11FA52EB849D978, _r)
end

function Global.IsStreamingAdditionalText(p0)
	return _in(0x8B6817B71B85EBF0, p0, _r)
end

function Global.IsStringNull(string)
	return _in(0xF22B6C47C6EAB066, _ts(string), _r)
end

function Global.IsStringNullOrEmpty(string)
	return _in(0xCA042B6957743895, _ts(string), _r)
end

function Global.IsStuntJumpInProgress()
	return _in(0x7A3F19700A4D0525, _r)
end

function Global.IsStuntJumpMessageShowing()
	return _in(0x2272B0A1343129F4, _r)
end
Global.N_0x2272b0a1343129f4 = Global.IsStuntJumpMessageShowing

function Global.IsSubtitlePreferenceSwitchedOn()
	return _in(0xAD6DACA4BA53E0A4, _r)
end

function Global.IsSynchronizedSceneLooped(sceneID)
	return _in(0x62522002E0C391BA, sceneID, _r)
end

--- Returns true if a synchronized scene is running
function Global.IsSynchronizedSceneRunning(sceneId)
	return _in(0x25D39B935A038A26, sceneId, _r)
end

function Global.IsSystemUiBeingDisplayed()
	return _in(0x5D511E3867C87139, _r)
end

function Global.IsTaxiLightOn(vehicle)
	return _in(0x7504C0F113AB50FC, vehicle, _r)
end

--- Return whether tennis mode is active or not.
function Global.IsTennisMode(ped)
	return _in(0x5D5479D115290C3F, ped, _r)
end

--- Returns whether or not the text chat (MULTIPLAYER_CHAT Scaleform component) is active.
function Global.IsTextChatActive()
	return _in(0xB118AF58B5F332A1, _r)
end

function Global.IsThisAMinigameScript()
	return _in(0x7B30F65D7B710098, _r)
end

function Global.IsThisModelABicycle(model)
	return _in(0xBF94DD42F63BDED2, _ch(model), _r)
end

function Global.IsThisModelABike(model)
	return _in(0xB50C0B0CEDC6CE84, _ch(model), _r)
end

function Global.IsThisModelABoat(model)
	return _in(0x45A9187928F4B9E3, _ch(model), _r)
end

--- To check if the model is an amphibious car, see gtaforums.com/topic/717612-v-scriptnative-documentation-and-research/page-33#entry1069317363 (for build 944 and above only!)
function Global.IsThisModelACar(model)
	return _in(0x7F6DB52EEFC96DF8, _ch(model), _r)
end

function Global.IsThisModelAHeli(model)
	return _in(0xDCE4334788AF94EA, _ch(model), _r)
end

function Global.IsThisModelAPlane(model)
	return _in(0xA0948AB42D7BA0DE, _ch(model), _r)
end

function Global.IsThisModelAQuadbike(model)
	return _in(0x39DAC362EE65FA28, _ch(model), _r)
end

function Global.IsThisModelATrain(model)
	return _in(0xAB935175B22E822B, _ch(model), _r)
end

--- Checks if model is a boat, then checks an additional flag.
-- Returns true for these models:
-- PREDATOR
-- SEASHARK2
-- SPEEDER
function Global.IsThisModelAnEmergencyBoat(model)
	return _in(0x9537097412CF75FE, _ch(model), _r)
end
Global.IsThisModelASubmersible = Global.IsThisModelAnEmergencyBoat

function Global.IsThreadActive(threadId)
	return _in(0x46E9AE36D8FA6417, threadId, _r)
end

--- Returns true if the two times are equal; otherwise returns false.
function Global.IsTimeEqualTo(timeA, timeB)
	return _in(0xF5BC95857BD6D512, timeA, timeB, _r)
end
Global.AreIntegersEqual = Global.IsTimeEqualTo

--- Subtracts the second argument from the first, then returns whether the result is negative.
function Global.IsTimeLessThan(timeA, timeB)
	return _in(0xCB2CF5148012C8D0, timeA, timeB, _r)
end
Global.SubtractBFromAAndCheckIfNegative = Global.IsTimeLessThan

--- Subtracts the first argument from the second, then returns whether the result is negative.
function Global.IsTimeMoreThan(timeA, timeB)
	return _in(0xDE350F8651E4346C, timeA, timeB, _r)
end
Global.SubtractAFromBAndCheckIfNegative = Global.IsTimeMoreThan

function Global.IsToggleModOn(vehicle, modType)
	return _in(0x84B233A8C8FC8AE7, vehicle, modType, _r)
end

--- returns whether or not a ped is visible within your FOV, not this check auto's to false after a certain distance.
-- Target needs to be tracked.. won't work otherwise.
function Global.IsTrackedPedVisible(ped)
	return _in(0x91C8E617F64188AC, ped, _r)
end

function Global.IsTrackedPointVisible(point)
	return _in(0xC45CCDAAC9221CA8, point, _r)
end

function Global.IsUiLoadingMultiplayer()
	return _in(0xC6DC823253FBB366, _r)
end
Global.N_0xc6dc823253fbb366 = Global.IsUiLoadingMultiplayer

--- Return if interior is valid.
function Global.IsValidInterior(interiorID)
	return _in(0x26B0E73D7EAAF4D3, interiorID, _r)
end

--- p1 is false almost always.
-- However, in launcher_carwash/carwash1/carwash2 scripts, p1 is true and is accompanied by DOES_VEHICLE_HAVE_ROOF
function Global.IsVehicleAConvertible(vehicle, p1)
	return _in(0x52F357A30698BCCE, vehicle, p1, _r)
end

function Global.IsVehicleAlarmActivated(vehicle)
	return _in(0x4319E335B71FFF34, vehicle, _r)
end

function Global.IsVehicleAlarmSet(vehicle)
	return _in(0xdc921211, vehicle, _r)
end

function Global.IsVehicleAttachedToCargobob(cargobob, vehicleAttached)
	return _in(0xD40148F22E81A1D9, cargobob, vehicleAttached, _r)
end

--- Scripts verify that towTruck is the first parameter, not the second.
function Global.IsVehicleAttachedToTowTruck(towTruck, vehicle)
	return _in(0x146DF9EC4C4B9FD4, towTruck, vehicle, _r)
end

--- Public Function isVehicleAttachedToTrailer(vh As Vehicle) As Boolean
-- Return Native.Function.Call(Of Boolean)(Hash.IS_VEHICLE_ATTACHED_TO_TRAILER, vh)
-- End Function
function Global.IsVehicleAttachedToTrailer(vehicle)
	return _in(0xE7CF3C4F9F489F0C, vehicle, _r)
end

function Global.IsVehicleBumperBrokenOff(vehicle, front)
	return _in(0x468056A6BB6F3846, vehicle, front, _r)
end

--- Appears to return true if the vehicle has any damage, including cosmetically.
function Global.IsVehicleDamaged(vehicle)
	return _in(0xBCDC5017D3CE1E9E, vehicle, _r)
end

--- doorID starts at 0, not seeming to skip any numbers. Four door vehicles intuitively range from 0 to 3.
function Global.IsVehicleDoorDamaged(veh, doorID)
	return _in(0xB8E181E559464527, veh, doorID, _r)
end

--- doorIndex:
-- 0 = Front Left Door
-- 1 = Front Right Door
-- 2 = Back Left Door
-- 3 = Back Right Door
-- 4 = Hood
-- 5 = Trunk
-- 6 = Trunk2
function Global.IsVehicleDoorFullyOpen(vehicle, doorIndex)
	return _in(0x3E933CFF7B111C22, vehicle, doorIndex, _r)
end

--- p1 is always 0 in the scripts.
-- p1 = check if vehicle is on fire
function Global.IsVehicleDriveable(vehicle, isOnFireCheck)
	return _in(0x4C241E39B23DF959, vehicle, isOnFireCheck, _r)
end

function Global.IsVehicleEngineStarting(vehicle)
	return _in(0xbb340d04, vehicle, _r)
end

function Global.IsVehicleExtraTurnedOn(vehicle, extraId)
	return _in(0xD2E6822DBFD6C8BD, vehicle, extraId, _r)
end

function Global.IsVehicleHighDetail(vehicle)
	return _in(0x1F25887F3C104278, vehicle, _r)
end

--- Returns whether the specified vehicle is currently in a burnout.
-- vb.net
-- Public Function isVehicleInBurnout(vh As Vehicle) As Boolean
-- Return Native.Function.Call(Of Boolean)(Hash.IS_VEHICLE_IN_BURNOUT, vh)
-- End Function
function Global.IsVehicleInBurnout(vehicle)
	return _in(0x1297A88E081430EB, vehicle, _r)
end

--- garageName example "Michael - Beverly Hills"
-- For a full list, see here: pastebin.com/73VfwsmS
function Global.IsVehicleInGarageArea(garageName, vehicle)
	return _in(0xCEE4490CD57BB3C2, _ts(garageName), vehicle, _r)
end

function Global.IsVehicleInteriorLightOn(vehicle)
	return _in(0xa411f72c, vehicle, _r)
end

--- Returns whether or not the vehicle has a CVehicleStreamRequestGfx that's trying to load mods.
-- True if it isn't loading mods, false if it is.
function Global.IsVehicleModLoadDone(vehicle)
	return _in(0x9A83F5F9963775EF, vehicle, _r)
end
Global.N_0x9a83f5f9963775ef = Global.IsVehicleModLoadDone

function Global.IsVehicleModel(vehicle, model)
	return _in(0x423E8DE37D934D89, vehicle, _ch(model), _r)
end

function Global.IsVehicleNeedsToBeHotwired(vehicle)
	return _in(0xf9933bf4, vehicle, _r)
end

--- indices:
-- 0 = Left
-- 1 = Right
-- 2 = Front
-- 3 = Back
function Global.IsVehicleNeonLightEnabled(vehicle, index)
	return _in(0x8C4B92553E4766A5, vehicle, index, _r)
end

--- Returns true if the id is non zero.
function Global.IsVehicleNodeIdValid(vehicleNodeId)
	return _in(0x1EAF30FCFBF5AF74, vehicleNodeId, _r)
end

--- Public Function isVehicleOnAllWheels(vh As Vehicle) As Boolean
-- Return Native.Function.Call(Of Boolean)(Hash.IS_VEHICLE_ON_ALL_WHEELS, vh)
-- End Function
function Global.IsVehicleOnAllWheels(vehicle)
	return _in(0xB104CD1BABF302E2, vehicle, _r)
end

function Global.IsVehiclePreviouslyOwnedByPlayer(vehicle)
	return _in(0xf849ed67, vehicle, _r)
end

function Global.IsVehicleRadioLoud(vehicle)
	return _in(0x032A116663A4D5AC, vehicle, _r)
end

--- Possibly: Returns whether the searchlight (found on police vehicles) is toggled on.
function Global.IsVehicleSearchlightOn(vehicle)
	return _in(0xC0F97FCE55094987, vehicle, _r)
end

--- Has an additional BOOL parameter since version [???].
-- Check if a vehicle seat is free.
-- -1 being the driver seat.
-- Use GET_VEHICLE_MAX_NUMBER_OF_PASSENGERS(vehicle) - 1 for last seat index.
function Global.IsVehicleSeatFree(vehicle, seatIndex)
	return _in(0x22AC59A870E6A669, vehicle, seatIndex, _r)
end

--- Checks some flag in the vehicle's model. If this function returns false, mod shops will not allow respray. it checks for FLAG_NO_RESPRAY
function Global.IsVehicleShopResprayAllowed(vehicle)
	return _in(0x8D474C8FAEFF6CDE, vehicle, _r)
end
Global.N_0x8d474c8faeff6cde = Global.IsVehicleShopResprayAllowed

function Global.IsVehicleSirenOn(vehicle)
	return _in(0x4C9BF537BE2634B2, vehicle, _r)
end

function Global.IsVehicleSirenSoundOn(vehicle)
	return _in(0xB5CC40FBCB586380, vehicle, _r)
end
Global.N_0xb5cc40fbcb586380 = Global.IsVehicleSirenSoundOn

function Global.IsVehicleStolen(vehicle)
	return _in(0x4AF9BD80EEBEB453, vehicle, _r)
end

--- Returns true if the vehicle's current speed is less than, or equal to 0.0025f.
-- For some vehicles it returns true if the current speed is &lt;= 0.00039999999.
function Global.IsVehicleStopped(vehicle)
	return _in(0x5721B434AD84D57A, vehicle, _r)
end

--- is this for red lights only?  more testing required.
function Global.IsVehicleStoppedAtTrafficLights(vehicle)
	return _in(0x2959F696AE390A99, vehicle, _r)
end

function Global.IsVehicleStuckOnRoof(vehicle)
	return _in(0xB497F06B288DCFDF, vehicle, _r)
end

--- p1 can be anywhere from 0 to 3 in the scripts. p2 is generally somewhere in the 1000 to 10000 range.
function Global.IsVehicleStuckTimerUp(vehicle, p1, p2)
	return _in(0x679BE1DAF71DA874, vehicle, p1, p2, _r)
end

--- wheelID used for 4 wheelers seem to be (0, 1, 4, 5)
-- completely - is to check if tire completely gone from rim.
-- '0 = wheel_lf / bike, plane or jet front
-- '1 = wheel_rf
-- '2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left
-- '3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right
-- '4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left
-- '5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right
-- '45 = 6 wheels trailer mid wheel left
-- '47 = 6 wheels trailer mid wheel right
function Global.IsVehicleTyreBurst(vehicle, wheelID, completely)
	return _in(0xBA291848A0815CA9, vehicle, wheelID, completely, _r)
end

--- must be called after TRACK_VEHICLE_VISIBILITY
-- it's not instant so probabilly must pass an 'update' to see correct result.
function Global.IsVehicleVisible(vehicle)
	return _in(0xAA0A52D24FB98293, vehicle, _r)
end

function Global.IsVehicleWanted(vehicle)
	return _in(0xa7daf7c, vehicle, _r)
end

function Global.IsVehicleWindowIntact(vehicle, windowIndex)
	return _in(0x46E571A0E20D01F1, vehicle, windowIndex, _r)
end

function Global.IsWarningMessageActive()
	return _in(0xE18B138FABC53103, _r)
end
Global.IsMedicalDisabled = Global.IsWarningMessageActive

function Global.IsWaypointActive()
	return _in(0x1DD1F58F493F1DA5, _r)
end

function Global.IsWaypointPlaybackGoingOnForPed(p0)
	return _in(0xE03B3F2D3DC59B64, p0, _r)
end

function Global.IsWaypointPlaybackGoingOnForVehicle(p0)
	return _in(0xF5134943EA29868C, p0, _r)
end

function Global.IsWeaponValid(weaponHash)
	return _in(0x937C71165CF334B3, _ch(weaponHash), _r)
end

--- Gets whether the world point the calling script is registered to is within desired range of the player.
function Global.IsWorldPointWithinBrainActivationRange()
	return _in(0xC5042CC6F5E3D450, _r)
end

--- XBOX 360
-- MulleDK19: This function is hard-coded to always return 0.
function Global.IsXbox360Version()
	return _in(0xF6201B4DAF662A9D, _r)
end

--- When I called this with what the script was doing, which was -190f for yaw pitch and roll, all my car did was jitter a little. I also tried 0 and 190f. I altered the p1 variable between TRUE and FALSE and didn't see a difference.
-- This might have something to do with the physbox of the vehicle, but I'm not sure.
function Global.JitterVehicle(vehicle, p1, yaw, pitch, roll)
	return _in(0xC59872A5134879C7, vehicle, p1, yaw, pitch, roll)
end

--- hash collision
function Global.KeyHudColour(p0, p1)
	return _in(0x1A5CD7752DD28CD3, p0, p1)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.KnockOffPedProp(ped, p1, p2, p3, p4)
	return _in(0x6FD7816A36615F48, ped, p1, p2, p3, p4)
end

function Global.KnockPedOffVehicle(ped)
	return _in(0x45BBCBA77C29A841, ped)
end

function Global.Leaderboards2ReadByHandle()
	return _in(0xC30713A383BFBF0E, _i, _i, _r)
end

function Global.Leaderboards2ReadByRadius(p1)
	return _in(0x5CE587FB5A42C8C4, _i, p1, _i, _r)
end

function Global.Leaderboards2ReadByRank(p1, p2)
	return _in(0xBA2C7DB0C129449A, _i, p1, p2, _r)
end

function Global.Leaderboards2ReadByRow(p2, p4, p6)
	return _in(0xA9CDB1E3F0A49883, _i, _i, p2, _i, p4, _i, p6, _r)
end

function Global.Leaderboards2ReadByScoreFloat(p1, p2)
	return _in(0xE662C8B759D08F3C, _i, p1, p2, _r)
end

function Global.Leaderboards2ReadByScoreInt(p1, p2)
	return _in(0x7EEC7E4F6984A16A, _i, p1, p2, _r)
end

function Global.Leaderboards2ReadFriendsByRow(p2, p3, p4, p5)
	return _in(0x918B101666F9CB83, _i, _i, p2, p3, p4, p5, _r)
end

function Global.Leaderboards2WriteData(p0)
	return _in(0xAE2206545888AE49, _ii(p0) --[[ may be optional ]], _r)
end

function Global.LeaderboardsCacheDataRow(p0)
	return _in(0xB9BB18E2C40142ED, _ii(p0) --[[ may be optional ]], _r)
end

function Global.LeaderboardsClearCacheData()
	return _in(0xD4B02A6B476E1FDC)
end

function Global.LeaderboardsGetCacheDataRow(p0, p1, p2)
	return _in(0x9120E8DBA3D69273, p0, p1, _ii(p2) --[[ may be optional ]], _r)
end

function Global.LeaderboardsGetCacheExists(p0)
	return _in(0x9C51349BE6CDFE2C, p0, _r)
end

function Global.LeaderboardsGetCacheTime(p0)
	return _in(0xF04C1C27DA35F6C8, p0, _r, _ri)
end

function Global.LeaderboardsGetColumnId(p0, p1, p2)
	return _in(0xC4B5467A1886EA7E, p0, p1, p2, _r, _ri)
end

function Global.LeaderboardsGetColumnType(p0, p1, p2)
	return _in(0xBF4FEF46DB7894D3, p0, p1, p2, _r, _ri)
end

function Global.LeaderboardsGetNumberOfColumns(p0, p1)
	return _in(0x117B45156D7EFF2E, p0, p1, _r, _ri)
end

function Global.LeaderboardsReadClear(p0, p1, p2)
	return _in(0x7CCE5C737A665701, p0, p1, p2, _r, _ri)
end

function Global.LeaderboardsReadClearAll()
	return _in(0xA34CB6E6F0DF4A0B, _r, _ri)
end

function Global.LeaderboardsReadPending(p0, p1, p2)
	return _in(0xAC392C8483342AC2, p0, p1, p2, _r)
end

function Global.LeaderboardsReadSuccessful(p0, p1, p2)
	return _in(0x2FB19228983E832C, p0, p1, p2, _r)
end

function Global.LinkNamedRendertarget(hash)
	return _in(0xF6C09E276AEB3F2D, _ch(hash))
end

function Global.LoadAllObjectsNow()
	return _in(0xBD6E84632DD4CB3F)
end

--- Loads all path nodes.
-- If keepInMemory is true, all path nodes will be loaded and be kept in memory; otherwise, all path nodes will be loaded, but unloaded as the game sees fit.
function Global.LoadAllPathNodes(keepInMemory)
	return _in(0x80E4A6EDDB0BE8D9, keepInMemory, _r)
end

--- Load interior
function Global.LoadInterior(interiorID)
	return _in(0x2CA429C029CCF247, interiorID)
end
Global.N_0x2ca429c029ccf247 = Global.LoadInterior

function Global.LoadMovieMeshSet(movieMeshSetName)
	return _in(0xB66064452270E8F1, _ts(movieMeshSetName), _r, _ri)
end

--- This loads the GTA:O dlc map parts (high end garages, apartments).
-- Works in singleplayer.
-- In order to use GTA:O heist IPL's you have to call this native with the following params: _9BAE5AD2508DF078(1);
-- console hash: 0xC65586A9
function Global.LoadMpDlcMaps()
	return _in(0x0888C3502DBBEEF5)
end

--- Reads the contents of a text file in a specified resource.
-- If executed on the client, this file has to be included in `files` in the resource manifest.
-- Example: `local data = LoadResourceFile("devtools", "data.json")`
-- @param resourceName The resource name.
-- @param fileName The file in the resource.
-- @return The file contents
function Global.LoadResourceFile(resourceName, fileName)
	return _in(0x76a9ee1f, _ts(resourceName), _ts(fileName), _r, _s)
end

--- Rope presets can be found in the gamefiles. One example is "ropeFamily3", it is NOT a hash but rather a string.
function Global.LoadRopeData(rope, rope_preset)
	return _in(0xCBB203C04D1ABD27, rope, _ts(rope_preset), _r, _ri)
end

function Global.LoadScene(x, y, z)
	return _in(0x4448EB75B4904BDB, x, y, z)
end

--- Unloads GROUP_MAP (GTAO/MP) DLC data and loads GROUP_MAP_SP DLC. Neither are loaded by default, 0888C3502DBBEEF5 is a cognate to this function and loads MP DLC (and unloads SP DLC by extension).
-- The original (and wrong) definition is below:
-- This unload the GTA:O DLC map parts (like high end garages/apartments).
-- Works in singleplayer.
-- console hash: 0x8BF60FC3
function Global.LoadSpDlcMaps()
	return _in(0xD7C10C4A637992C9)
end

--- Example:
-- AUDIO::LOAD_STREAM("CAR_STEAL_1_PASSBY", "CAR_STEAL_1_SOUNDSET");
-- All found occurrences in the b678d decompiled scripts: pastebin.com/3rma6w5w
-- Stream names often ends with "_MASTER", "_SMALL" or "_STREAM". Also "_IN", "_OUT" and numbers.
-- soundSet is often set to 0 in the scripts. These are common to end the soundSets: "_SOUNDS", "_SOUNDSET" and numbers.
function Global.LoadStream(streamName, soundSet)
	return _in(0x1F1F957154EC51DF, _ts(streamName), _ts(soundSet), _r)
end

--- Example:
-- AUDIO::LOAD_STREAM_WITH_START_OFFSET("STASH_TOXIN_STREAM", 2400, "FBI_05_SOUNDS");
-- Only called a few times in the scripts.
function Global.LoadStreamWithStartOffset(streamName, startOffset, soundSet)
	return _in(0x59C16B79F53B3712, _ts(streamName), startOffset, _ts(soundSet), _r)
end

function Global.LoadTvChannel(tvChannel)
	return _in(0x0AD973CA1E077B60, _ch(tvChannel), _r)
end
Global.N_0x0ad973ca1e077b60 = Global.LoadTvChannel

--- Loads a User-Generated Content (UGC) file. These files can be found in "[GTA5]\data\ugc" and "[GTA5]\common\patch\ugc". They seem to follow a naming convention, most likely of "[name]_[part].ugc". See example below for usage.
-- Returns whether or not the file was successfully loaded.
-- Example:
-- DATAFILE::_LOAD_UGC_FILE("RockstarPlaylists") // loads "rockstarplaylists_00.ugc"
function Global.LoadUgcFile(filename)
	return _in(0xC5238C011AF405E4, _ts(filename), _r)
end

--- Locks the minimap to the specified angle in integer degrees.
-- angle: The angle in whole degrees. If less than 0 or greater than 360, unlocks the angle.
function Global.LockMinimapAngle(angle)
	return _in(0x299FAEBB108AE05B, angle)
end

--- Locks the minimap to the specified world position.
function Global.LockMinimapPosition(x, y)
	return _in(0x1279E861A329E73F, x, y)
end

--- Not present in retail version of the game, actual definiton seems to be
-- _LOG_DEBUG_INFO(char* category, char* debugText);
function Global.LogDebugInfo(p0)
	return _in(0x2162C446DFDF38FD, _ts(p0))
end
Global.N_0x2162c446dfdf38fd = Global.LogDebugInfo

function Global.LowerConvertibleRoof(vehicle, instantlyLower)
	return _in(0xDED51F703D0FA83D, vehicle, instantlyLower)
end

function Global.MakePedReload(ped)
	return _in(0x20AE33F3AC9C0033, ped, _r)
end

--- is this like setting is as no longer needed?
function Global.MarkObjectForDeletion(object)
	return _in(0xADBE4809F19F927A, object)
end

function Global.MaxRadioStationIndex()
	return _in(0xF1620ECB50E01DE7, _r, _ri)
end

--- Sets the water height for a given position and radius.
function Global.ModifyWater(x, y, radius, height)
	return _in(0xC443FD757C3BA637, x, y, radius, height)
end

--- For move the finger of player, the value of int goes 1 at 5.
function Global.MoveFinger(direction)
	return _in(0x95C9E72F3D7DEC9B, direction)
end

function Global.MoveVehicleDecals(p0, p1)
	return _in(0x84C8D7C2D30D3280, p0, p1)
end

--- 2 matches in 1 script
-- Used in multiplayer scripts?
function Global.N_0x0032a6dba562c518()
	return _in(0x0032A6DBA562C518)
end

--- GET_VEHICLE_CLASS_MAX_*
function Global.N_0x00c09f246abedd82(vehicleClass)
	return _in(0x00C09F246ABEDD82, vehicleClass, _r, _rf)
end

--- if ((NETWORK::_597F8DBA9B206FC7() &gt; 0) &amp;&amp; DATAFILE::_01095C95CD46B624(0)) {
-- v_10 = DATAFILE::_GET_ROOT_OBJECT();
-- v_11 = DATAFILE::_OBJECT_VALUE_GET_INTEGER(v_10, "pt");
-- sub_20202(2, v_11);
-- a_0 += 1;
-- } else {
-- a_0 += 1;
-- }
function Global.N_0x01095c95cd46b624(p0)
	return _in(0x01095C95CD46B624, p0, _r)
end

function Global.N_0x011883f41211432a(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x011883F41211432A, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x013e5cfc38cd5387(p0)
	return _in(0x013E5CFC38CD5387, p0, _i, _i, _i)
end

function Global.N_0x0150b6ff25a9e2e5()
	return _in(0x0150B6FF25A9E2E5)
end

function Global.N_0x01708e8dd3ff8c65(p0, p1, p2, p3, p4, p5)
	return _in(0x01708E8DD3FF8C65, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.N_0x017568a8182d98a6(p0)
	return _in(0x017568A8182D98A6, p0, _r, _ri)
end

--- native only found once in appinternet.c4
function Global.N_0x01a358d9128b7a86()
	return _in(0x01A358D9128B7A86, _r, _ri)
end

function Global.N_0x01abce5e7cbda196()
	return _in(0x01ABCE5E7CBDA196, _r, _ri)
end

function Global.N_0x01bb4d577d38bd9e(p0, p1)
	return _in(0x01BB4D577D38BD9E, p0, p1)
end

function Global.N_0x0218ba067d249dea()
	return _in(0x0218BA067D249DEA)
end

--- some camera effect that is (also) used in the drunk-cheat, and turned off (by setting it to 0.0) along with the shaking effects once the drunk cheat is disabled. Possibly a cinematic or script-cam version of _0x487A82C650EB7799
function Global.N_0x0225778816fdc28c(p0)
	return _in(0x0225778816FDC28C, p0)
end

function Global.N_0x02369d5c8a51fdcf(p0)
	return _in(0x02369D5C8A51FDCF, p0)
end

function Global.N_0x02398b627547189c(p0, p1)
	return _in(0x02398B627547189C, p0, p1)
end

function Global.N_0x024a60deb0ea69f0(p0, player, p2, p3)
	return _in(0x024A60DEB0EA69F0, p0, player, p2, p3, _r)
end

function Global.N_0x02a8bec6fd9af660(p1)
	return _in(0x02A8BEC6FD9AF660, _i, p1, _r)
end

function Global.N_0x02ac28f3a01fa04a(p0)
	return _in(0x02AC28F3A01FA04A, p0, _r, _ri)
end

function Global.N_0x02ada21ea2f6918f()
	return _in(0x02ADA21EA2F6918F, _r, _ri)
end

--- Found in the scripts:
-- GAMEPLAY::_02DEAAC8F8EA7FE7("");
function Global.N_0x02deaac8f8ea7fe7(p0)
	return _in(0x02DEAAC8F8EA7FE7, _ts(p0))
end

function Global.N_0x02e93c796abd3a97(p0)
	return _in(0x02E93C796ABD3A97, p0)
end

--- 2 calls in the b617d scripts. This line is called 2 times:
-- AUDIO::_031ACB6ABA18C729("RADIO_16_SILVERLAKE", "MIRRORPARK_LOCKED");
-- Note: Another name for RADIO_16_SILVERLAKE is RADIO MIRROR PARK
function Global.N_0x031acb6aba18c729(radioStation, p1)
	return _in(0x031ACB6ABA18C729, _ts(radioStation), _ts(p1))
end

function Global.N_0x03300b57fcac6ddb(p0)
	return _in(0x03300B57FCAC6DDB, p0)
end

function Global.N_0x0378c08504160d0d(p0)
	return _in(0x0378C08504160D0D, p0, _r)
end

function Global.N_0x0395cb47b022e62c(p0)
	return _in(0x0395CB47B022E62C, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x03c27e13b42a0e82(doorHash, p1, p2, p3)
	return _in(0x03C27E13B42A0E82, _ch(doorHash), p1, p2, p3)
end

function Global.N_0x03ea03af85a85cb7(ped, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x03EA03AF85A85CB7, ped, p1, p2, p3, p4, p5, p6, p7, p8, _r)
end

function Global.N_0x03f1a106bda7dd3e()
	return _in(0x03F1A106BDA7DD3E)
end

function Global.N_0x03fc694ae06c5a20()
	return _in(0x03FC694AE06C5A20)
end

--- Found in the b617d scripts, duplicates removed:
-- AUDIO::_044DBAD7A7FA2BE5("V_CARSHOWROOM_PS_WINDOW_UNBROKEN", "V_CARSHOWROOM_PS_WINDOW_BROKEN");
-- AUDIO::_044DBAD7A7FA2BE5("V_CIA_PS_WINDOW_UNBROKEN", "V_CIA_PS_WINDOW_BROKEN");
-- AUDIO::_044DBAD7A7FA2BE5("V_DLC_HEIST_APARTMENT_DOOR_CLOSED", "V_DLC_HEIST_APARTMENT_DOOR_OPEN");
-- AUDIO::_044DBAD7A7FA2BE5("V_FINALEBANK_PS_VAULT_INTACT", "V_FINALEBANK_PS_VAULT_BLOWN");
-- AUDIO::_044DBAD7A7FA2BE5("V_MICHAEL_PS_BATHROOM_WITH_WINDOW", "V_MICHAEL_PS_BATHROOM_WITHOUT_WINDOW");
function Global.N_0x044dbad7a7fa2be5(p0, p1)
	return _in(0x044DBAD7A7FA2BE5, _ts(p0), _ts(p1))
end

function Global.N_0x04655f9d075d0ae5(p0)
	return _in(0x04655F9D075D0AE5, p0)
end

function Global.N_0x047cbed6f6f8b63c()
	return _in(0x047CBED6F6F8B63C)
end

--- p0 was always 0xAE2602A3.
function Global.N_0x052991e59076e4e4(p0, p1)
	return _in(0x052991E59076E4E4, _ch(p0), _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x06087579e7aa85a9(p0, p1, p2, p3, p4, p5)
	return _in(0x06087579E7AA85A9, p0, p1, p2, p3, p4, p5, _r)
end

function Global.N_0x061cb768363d6424(p0, p1)
	return _in(0x061CB768363D6424, p0, p1)
end

function Global.N_0x0626a247d2405330()
	return _in(0x0626A247D2405330, _r, _ri)
end

function Global.N_0x062d5ead4da2fa6a()
	return _in(0x062D5EAD4DA2FA6A)
end

function Global.N_0x063ae2b2cc273588(p0, p1)
	return _in(0x063AE2B2CC273588, p0, p1)
end

function Global.N_0x06462a961e94b67c()
	return _in(0x06462A961E94B67C)
end

function Global.N_0x06582aff74894c75(p0, p1)
	return _in(0x06582AFF74894C75, p0, p1)
end

function Global.N_0x06a320535f5f0248(p0)
	return _in(0x06A320535F5F0248, p0)
end

function Global.N_0x06a3524161c502ba(p0)
	return _in(0x06A3524161C502BA, _ii(p0) --[[ may be optional ]])
end

function Global.N_0x06c0023bed16dd6b(p0, p1)
	return _in(0x06C0023BED16DD6B, p0, p1)
end

function Global.N_0x06ee9048fd080382(p0)
	return _in(0x06EE9048FD080382, p0)
end

function Global.N_0x06f761ea47c1d3ed(p0)
	return _in(0x06F761EA47C1D3ED, p0)
end

function Global.N_0x075f1d57402c93ba()
	return _in(0x075F1D57402C93BA, _r, _ri)
end

function Global.N_0x07c313f94746702c(p0)
	return _in(0x07C313F94746702C, p0, _r, _ri)
end

function Global.N_0x07c61676e5bb52cd(p0)
	return _in(0x07C61676E5BB52CD, p0, _r, _ri)
end

function Global.N_0x07dd29d5e22763f1(p0)
	return _in(0x07DD29D5E22763F1, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x07fb139b592fa687(p0, p1, p2, p3)
	return _in(0x07FB139B592FA687, p0, p1, p2, p3, _r)
end

function Global.N_0x0811381ef5062fec(p0)
	return _in(0x0811381EF5062FEC, p0)
end

function Global.N_0x0923dbf87dff735e(x, y, z)
	return _in(0x0923DBF87DFF735E, x, y, z)
end

function Global.N_0x098760c7461724cd()
	return _in(0x098760C7461724CD)
end

function Global.N_0x098ab65b9ed9a9ec(p1, p2)
	return _in(0x098AB65B9ED9A9EC, _i, p1, p2, _r)
end

function Global.N_0x09c0403ed9a751c2(p0)
	return _in(0x09C0403ED9A751C2, p0, _r)
end

function Global.N_0x0a123435a26c36cd()
	return _in(0x0A123435A26C36CD)
end

function Global.N_0x0a436b8643716d14()
	return _in(0x0A436B8643716D14)
end

function Global.N_0x0a46af8a78dc5e0a()
	return _in(0x0A46AF8A78DC5E0A)
end

function Global.N_0x0a60017f841a54f2(p0, p1, p2, p3)
	return _in(0x0A60017F841A54F2, p0, p1, p2, p3)
end

function Global.N_0x0a6a279f3aa4fd70(vehicle, p1)
	return _in(0x0A6A279F3AA4FD70, vehicle, p1)
end

function Global.N_0x0a6d923dffc9bd89()
	return _in(0x0A6D923DFFC9BD89, _r, _ri)
end

function Global.N_0x0a9f2a468b328e74(p0, p1, p2, p3)
	return _in(0x0A9F2A468B328E74, p0, p1, p2, p3)
end

function Global.N_0x0abc54de641dc0fc(p0)
	return _in(0x0ABC54DE641DC0FC, _ii(p0) --[[ may be optional ]], _r, _ri)
end

function Global.N_0x0ad9710cee2f590f(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x0AD9710CEE2F590F, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.N_0x0ad9e8f87ff7c16f(p0, p1)
	return _in(0x0AD9E8F87FF7C16F, p0, p1)
end

function Global.N_0x0ae1f1653b554ab9(p0)
	return _in(0x0AE1F1653B554AB9, p0, _r)
end

function Global.N_0x0ae73d8df3a762b2(p0)
	return _in(0x0AE73D8DF3A762B2, p0)
end

--- Appear to have something to do with the clipping at close range.
function Global.N_0x0af7b437918103b3(p0)
	return _in(0x0AF7B437918103B3, p0)
end

--- calling this each frame, it stops the player from receiving a weapon via the weapon wheel.
function Global.N_0x0afc4af510774b47()
	return _in(0x0AFC4AF510774B47)
end

function Global.N_0x0afce529f69b21ff()
	return _in(0x0AFCE529F69B21FF, _r, _ri)
end

function Global.N_0x0b203b4afde53a4f(p2)
	return _in(0x0B203B4AFDE53A4F, _i, _i, p2, _r, _ri)
end

function Global.N_0x0b40ed49d7d6ff84()
	return _in(0x0B40ED49D7D6FF84)
end

function Global.N_0x0b568201dd99f0eb(p0)
	return _in(0x0B568201DD99F0EB, p0)
end

function Global.N_0x0b919e1fb47cc4e0(p0)
	return _in(0x0B919E1FB47CC4E0, p0)
end

function Global.N_0x0bc3144deb678666(modelHash)
	return _in(0x0BC3144DEB678666, _ch(modelHash), _r)
end

function Global.N_0x0bca1d2c47b0d269(p0, p1, p2)
	return _in(0x0BCA1D2C47B0D269, p0, p1, p2)
end

function Global.N_0x0bf3b3bd47d79c08(p0, p1)
	return _in(0x0BF3B3BD47D79C08, p0, p1)
end

function Global.N_0x0c0c4e81e1ac60a0()
	return _in(0x0C0C4E81E1AC60A0, _r, _ri)
end

function Global.N_0x0c15b0e443b2349d()
	return _in(0x0C15B0E443B2349D, _r, _ri)
end

function Global.N_0x0c1f7d49c39d2289()
	return _in(0x0C1F7D49C39D2289, _r, _ri)
end

function Global.N_0x0c4bbf625ca98c4e(ped, p1)
	return _in(0x0C4BBF625CA98C4E, ped, p1)
end

function Global.N_0x0c5a80a9e096d529(p0, p2, p3, p4, p5)
	return _in(0x0C5A80A9E096D529, p0, _i, p2, p3, p4, p5, _r)
end

--- x360 Hash: 0x4AF0ADF5
function Global.N_0x0c978fda19692c2c(p0, p1)
	return _in(0x0C978FDA19692C2C, p0, p1)
end

function Global.N_0x0cd9ab83489430ea(p0)
	return _in(0x0CD9AB83489430EA, p0, _r, _ri)
end

function Global.N_0x0cdda42f9e360ca6(vehicle, p1)
	return _in(0x0CDDA42F9E360CA6, vehicle, p1)
end

function Global.N_0x0cf54f20de43879c(p0)
	return _in(0x0CF54F20DE43879C, p0)
end

function Global.N_0x0d01d20616fc73fb(p0, p1)
	return _in(0x0D01D20616FC73FB, p0, p1)
end

function Global.N_0x0d6ca79eeebd8ca3()
	return _in(0x0D6CA79EEEBD8CA3, _r, _ri)
end

function Global.N_0x0d77a82dc2d0da59()
	return _in(0x0D77A82DC2D0DA59, _i, _i)
end

function Global.N_0x0dbd5d7e3c5bec3b()
	return _in(0x0DBD5D7E3C5BEC3B, _r, _ri)
end

function Global.N_0x0e4299c549f0d1f1(p0)
	return _in(0x0E4299C549F0D1F1, p0)
end

function Global.N_0x0ede326d47cd0f3e(ped, player)
	return _in(0x0EDE326D47CD0F3E, ped, player, _r)
end

function Global.N_0x0f3b4d4e43177236(p0, p1)
	return _in(0x0F3B4D4E43177236, p0, p1)
end

function Global.N_0x0f70731baccfbb96()
	return _in(0x0F70731BACCFBB96, _r)
end

function Global.N_0x0f73393bac7e6730()
	return _in(0x0F73393BAC7E6730, _i, _i, _r)
end

function Global.N_0x0fb82563989cf4fb(p0, p1, p2, p3)
	return _in(0x0FB82563989CF4FB, p0, p1, p2, p3)
end

--- SET_PLAYERS_*
function Global.N_0x0fde9dbfc0a6bc65(p0)
	return _in(0x0FDE9DBFC0A6BC65, _ii(p0) --[[ may be optional ]])
end

--- p0 is always false in scripts.
function Global.N_0x0ff2862b61a58af9(p0)
	return _in(0x0FF2862B61A58AF9, p0)
end

function Global.N_0x1033371fc8e842a7(p0)
	return _in(0x1033371FC8E842A7, p0, _r)
end

function Global.N_0x10655fab9915623d(p0, p1)
	return _in(0x10655FAB9915623D, p0, p1)
end

function Global.N_0x1072f115dab0717e(p0, p1)
	return _in(0x1072F115DAB0717E, p0, p1)
end

function Global.N_0x108be26959a9d9bb(p0)
	return _in(0x108BE26959A9D9BB, p0)
end

function Global.N_0x1093408b4b9d1146(p0, p1)
	return _in(0x1093408B4B9D1146, p0, p1)
end

--- Not sure what this function does, but it's related to the audio of the local player's vehicle (Considering the surrounding natives, it's probably radio related).
function Global.N_0x109697e2ffbac8a1()
	return _in(0x109697E2FFBAC8A1, _r)
end

function Global.N_0x10bd227a753b0d84()
	return _in(0x10BD227A753B0D84, _r, _ri)
end

--- In agency_heist3b.c4, its like this 90% of the time:
-- PED::_110F526AB784111F(ped, 0.099);
-- PED::SET_PED_ENVEFF_SCALE(ped, 1.0);
-- PED::_D69411AA0CEBF9E9(ped, 87, 81, 68);
-- PED::SET_ENABLE_PED_ENVEFF_SCALE(ped, 1);
-- and its like this 10% of the time:
-- PED::_110F526AB784111F(ped, 0.2);
-- PED::SET_PED_ENVEFF_SCALE(ped, 0.65);
-- PED::_D69411AA0CEBF9E9(ped, 74, 69, 60);
-- PED::SET_ENABLE_PED_ENVEFF_SCALE(ped, 1);
function Global.N_0x110f526ab784111f(ped, p1)
	return _in(0x110F526AB784111F, ped, p1)
end

function Global.N_0x1121bfa1a1a522a8()
	return _in(0x1121BFA1A1A522A8, _r, _ri)
end

function Global.N_0x113e6e3e50e286b0(p0)
	return _in(0x113E6E3E50E286B0, p0)
end

function Global.N_0x1153fa02a659051c()
	return _in(0x1153FA02A659051C)
end

function Global.N_0x116fb94dc4b79f17(p0)
	return _in(0x116FB94DC4B79F17, _ts(p0))
end

function Global.N_0x1171a97a3d3981b6(p2, p3)
	return _in(0x1171A97A3D3981B6, _i, _i, p2, p3, _r)
end

--- SET_TEXT_??? - Used in golf and golf_mp
function Global.N_0x1185a8087587322c(p0)
	return _in(0x1185A8087587322C, p0)
end

--- Found in the scripts:
-- GAMEPLAY::_11B56FBBF7224868("CONTRAILS");
function Global.N_0x11b56fbbf7224868(p0)
	return _in(0x11B56FBBF7224868, _ts(p0))
end

function Global.N_0x11d1e53a726891fe(p0)
	return _in(0x11D1E53A726891FE, p0, _r)
end

function Global.N_0x11fa5d3479c7dd47(p0)
	return _in(0x11FA5D3479C7DD47, p0)
end

function Global.N_0x11ff1c80276097ed(p0, p1, p2)
	return _in(0x11FF1C80276097ED, p0, p1, p2)
end

function Global.N_0x120364de2845daf8(p1)
	return _in(0x120364DE2845DAF8, _i, p1, _r, _ri)
end

function Global.N_0x1216e0bfa72cc703(p0, p1)
	return _in(0x1216E0BFA72CC703, p0, p1)
end

function Global.N_0x121fb4dddc2d5291(p0, p1, p2, p3)
	return _in(0x121FB4DDDC2D5291, p0, p1, p2, p3)
end

--- p0 is usually 0. sometimes 2. Not sure what this does.
function Global.N_0x12561fcbb62d5b9c(p0)
	return _in(0x12561FCBB62D5B9C, p0)
end

function Global.N_0x1280804f7cfd2d6c(p0)
	return _in(0x1280804F7CFD2D6C, p0)
end

function Global.N_0x129466ed55140f8d(ped, toggle)
	return _in(0x129466ED55140F8D, ped, toggle)
end

--- Only used in the golf and golf_mp script
function Global.N_0x12995f2e53ffa601(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	return _in(0x12995F2E53FFA601, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
end

function Global.N_0x12b6281b6c6706c0(p0)
	return _in(0x12B6281B6C6706C0, p0, _r, _ri)
end

--- Hardcoded to only work in multiplayer.
function Global.N_0x12ded8ca53d47ea5(p0)
	return _in(0x12DED8CA53D47EA5, p0)
end

function Global.N_0x1327e2fe9746baee(p0)
	return _in(0x1327E2FE9746BAEE, p0, _r)
end

function Global.N_0x13518ff1c6b28938(p0)
	return _in(0x13518FF1C6B28938, p0, _r)
end

--- Returns some kind of banned state
function Global.N_0x1353f87e89946207()
	return _in(0x1353F87E89946207, _r)
end

function Global.N_0x135f9b7b7add2185(p0)
	return _in(0x135F9B7B7ADD2185, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x13b350b8ad0eee10()
	return _in(0x13B350B8AD0EEE10)
end

function Global.N_0x13c4b962653a5280()
	return _in(0x13C4B962653A5280, _r, _ri)
end

function Global.N_0x140e6a44870a11ce()
	return _in(0x140E6A44870A11CE)
end

function Global.N_0x14590ddbedb1ec85(ped)
	return _in(0x14590DDBEDB1EC85, ped, _r)
end

function Global.N_0x14621bb1df14e2b2()
	return _in(0x14621BB1DF14E2B2)
end

function Global.N_0x14832bf2aba53fc5()
	return _in(0x14832BF2ABA53FC5, _r, _ri)
end

function Global.N_0x14922ed3e38761f0()
	return _in(0x14922ED3E38761F0, _r, _ri)
end

function Global.N_0x149aee66f0cb3a99(p0, p1)
	return _in(0x149AEE66F0CB3A99, p0, p1)
end

function Global.N_0x14c9fdcc41f81f63(p0)
	return _in(0x14C9FDCC41F81F63, p0)
end

function Global.N_0x14d29bb12d47f68c(p0, p1, p2, p3, p4)
	return _in(0x14D29BB12D47F68C, p0, p1, p2, p3, p4)
end

function Global.N_0x14e0b2d1ad1044e0()
	return _in(0x14E0B2D1AD1044E0, _i, _i, _i, _i)
end

function Global.N_0x14fc5833464340a8()
	return _in(0x14FC5833464340A8)
end

function Global.N_0x152d90e4c1b4738a()
	return _in(0x152D90E4C1B4738A, _i, _i, _r)
end

function Global.N_0x158ec424f35ec469(p1)
	return _in(0x158EC424F35EC469, _i, p1, _i, _r)
end

function Global.N_0x15e33297c3e8dc60(p0)
	return _in(0x15E33297C3E8DC60, p0)
end

function Global.N_0x15e69e2802c24b8d(p0)
	return _in(0x15E69E2802C24B8D, p0)
end

function Global.N_0x15ff52b809db2353(p0)
	return _in(0x15FF52B809DB2353, p0, _r)
end

function Global.N_0x1600fd8cf72ebc12(p0)
	return _in(0x1600FD8CF72EBC12, p0)
end

function Global.N_0x160aa1b32f6139b8(doorHash)
	return _in(0x160AA1B32F6139B8, _ch(doorHash), _r, _ri)
end

function Global.N_0x1612c45f9e3e0d44()
	return _in(0x1612C45F9E3E0D44)
end

function Global.N_0x162c23ca83ed0a62(p0)
	return _in(0x162C23CA83ED0A62, p0, _r)
end

--- gets some camera far clip
function Global.N_0x162f9d995753dc19()
	return _in(0x162F9D995753DC19, _r, _rf)
end

--- only documented params
-- dont know what this does.... To Be Continued...
function Global.N_0x163f8b586bc95f2a(coords, radius, modelHash, x, y, z, p7)
	return _in(0x163F8B586BC95F2A, coords, radius, _ch(modelHash), x, y, z, _v, p7, _r, _ri)
end

--- 3 calls in the b617d scripts, removed duplicate.
-- AUDIO::_1654F24A88A8E3FE("RADIO_16_SILVERLAKE");
-- AUDIO::_1654F24A88A8E3FE("RADIO_01_CLASS_ROCK");
function Global.N_0x1654f24a88a8e3fe(radioStation)
	return _in(0x1654F24A88A8E3FE, _ts(radioStation))
end

function Global.N_0x1670f8d05056f257(p0)
	return _in(0x1670F8D05056F257, _ii(p0) --[[ may be optional ]], _r, _ri)
end

function Global.N_0x16a304e6cb2bfab9(r, g, b, a)
	return _in(0x16A304E6CB2BFAB9, r, g, b, a)
end

--- only documented to be continued...
function Global.N_0x16b5e274bde402f8(vehicle, trailer, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	return _in(0x16B5E274BDE402F8, vehicle, trailer, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
end

function Global.N_0x16da8172459434aa()
	return _in(0x16DA8172459434AA, _r, _ri)
end

function Global.N_0x16f46fb18c8009e4(p0, p1, p2, p3, p4)
	return _in(0x16F46FB18C8009E4, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0x170910093218c8b9(p0)
	return _in(0x170910093218C8B9, _ii(p0) --[[ may be optional ]], _r)
end

--- Related to displaying cash on the HUD
-- Always called before UI::_SET_SINGLEPLAYER_HUD_CASH in decompiled scripts
function Global.N_0x170f541e1cadd1de(p0)
	return _in(0x170F541E1CADD1DE, p0)
end

function Global.N_0x171df6a0c07fb3dc(p0, p1)
	return _in(0x171DF6A0C07FB3DC, p0, p1, _r, _ri)
end

function Global.N_0x172f75b6ee2233ba()
	return _in(0x172F75B6EE2233BA, _r, _ri)
end

function Global.N_0x17440aa15d1d3739()
	return _in(0x17440AA15D1D3739)
end

function Global.N_0x1761dc5d8471cbaa(p0, player, p2)
	return _in(0x1761DC5D8471CBAA, p0, player, p2, _r)
end

function Global.N_0x17ad8c9706bdd88a(p0)
	return _in(0x17AD8C9706BDD88A, p0)
end

function Global.N_0x17df68d720aa77f8(p0)
	return _in(0x17DF68D720AA77F8, p0, _r)
end

function Global.N_0x17e0198b3882c2cb()
	return _in(0x17E0198B3882C2CB)
end

function Global.N_0x17fca7199a530203()
	return _in(0x17FCA7199A530203, _r, _ri)
end

function Global.N_0x182f266c2d9e2beb(vehicle, p1)
	return _in(0x182F266C2D9E2BEB, vehicle, p1)
end

function Global.N_0x18eb48cfc41f2ea0(p0, p1)
	return _in(0x18EB48CFC41F2EA0, p0, p1)
end

function Global.N_0x190428512b240692(p0, p1, p2, p3, p4)
	return _in(0x190428512B240692, p0, p1, p2, p3, p4)
end

function Global.N_0x192547247864dfdd(vehicle, p1)
	return _in(0x192547247864DFDD, vehicle, p1)
end

function Global.N_0x19853b5b17d77bca(p0, p1)
	return _in(0x19853B5B17D77BCA, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x1989c6e6f67e76a8()
	return _in(0x1989C6E6F67E76A8, _i, _i, _i, _r)
end

function Global.N_0x19af7ed9b9d23058()
	return _in(0x19AF7ED9B9D23058)
end

function Global.N_0x19bfed045c647c49(p0)
	return _in(0x19BFED045C647C49, p0, _r)
end

--- Seems to return the current type of view
-- example: // checks if you're currently in first person
-- if ((CAM::_EE778F8C7E1142E2(CAM::_19CAFA3C87F7C2FF()) == 4) &amp;&amp; (!__463_$28ED382849B17AFC())) {
-- UI::_FDEC055AB549E328();
-- UI::_SET_NOTIFICATION_TEXT_ENTRY("REC_FEED_WAR");
-- l_CE[0/*1*/] = UI::_DRAW_NOTIFICATION(0, 1);
-- }
function Global.N_0x19cafa3c87f7c2ff()
	return _in(0x19CAFA3C87F7C2FF, _r, _ri)
end

--- SET_ENTITY_*
function Global.N_0x1a092bb0c3808b96(entity, p1)
	return _in(0x1A092BB0C3808B96, entity, p1)
end

--- Only appears in lamar1 script.
function Global.N_0x1a330d297aac6bc1(ped, p1)
	return _in(0x1A330D297AAC6BC1, ped, p1)
end

function Global.N_0x1a78ad3d8240536f(vehicle, p1)
	return _in(0x1A78AD3D8240536F, vehicle, p1)
end

function Global.N_0x1a8e2c8b9cf4549c()
	return _in(0x1A8E2C8B9CF4549C, _i, _i)
end

function Global.N_0x1aa8a837d2169d94(vehicle, p1)
	return _in(0x1AA8A837D2169D94, vehicle, p1)
end

function Global.N_0x1accfba3d8dab2ee(p0, p1)
	return _in(0x1ACCFBA3D8DAB2EE, p0, p1, _r, _ri)
end

--- unk_0xCEA55F4C(uVar3, "AM_ROLLERCOASTER", -1))
-- Probably has to do with seeing if they are riding the roller coaster or ferris wheel
-- NETWORK_IS_PLAYER_???
function Global.N_0x1ad5b71586b94820(p0, p2)
	return _in(0x1AD5B71586B94820, p0, _i, p2, _r)
end

function Global.N_0x1b0b4aeed5b9b41c(p0)
	return _in(0x1B0B4AEED5B9B41C, p0)
end

function Global.N_0x1b2366c3f2a5c8df()
	return _in(0x1B2366C3F2A5C8DF, _r, _ri)
end

--- Console Hash: 0x76A9FEB6
function Global.N_0x1b857666604b1a74(p0)
	return _in(0x1B857666604B1A74, p0)
end

function Global.N_0x1bb299305c3e8c13(p0, p1, p2, p3)
	return _in(0x1BB299305C3E8C13, p0, p1, p2, p3)
end

function Global.N_0x1bbc135a4d25edde(p0)
	return _in(0x1BBC135A4D25EDDE, p0)
end

function Global.N_0x1c073274e065c6d2(p0, p1)
	return _in(0x1C073274E065C6D2, p0, p1)
end

--- p0 = int (?)
function Global.N_0x1c186837d0619335(p0)
	return _in(0x1C186837D0619335, p0, _r, _ri)
end

--- NETWORK_CAN_R??? or NETWORK_CAN_S???
function Global.N_0x1c2473301b1c66ba()
	return _in(0x1C2473301B1C66BA, _r, _ri)
end

function Global.N_0x1c4fc5752bcd8e48(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	return _in(0x1C4FC5752BCD8E48, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
end

function Global.N_0x1cae5d2e3f9a07f0(p0, p1, p2, p3, p4, p5)
	return _in(0x1CAE5D2E3F9A07F0, p0, p1, p2, p3, p4, p5)
end

function Global.N_0x1cba05ae7bd7ee05(p0)
	return _in(0x1CBA05AE7BD7EE05, p0)
end

--- what does this do?
-- you'RE mother
function Global.N_0x1cf38d529d7441d9(vehicle, toggle)
	return _in(0x1CF38D529D7441D9, vehicle, toggle)
end

function Global.N_0x1d4446a62d35b0d0(p0, p1)
	return _in(0x1D4446A62D35B0D0, p0, p1, _r, _ri)
end

function Global.N_0x1d4dc17c38feaff0()
	return _in(0x1D4DC17C38FEAFF0, _r, _ri)
end

function Global.N_0x1d610eb0fea716d9(p0)
	return _in(0x1D610EB0FEA716D9, p0, _r)
end

--- Related to Hao races.
function Global.N_0x1d97d1e3a70a649f(vehicle, p1)
	return _in(0x1D97D1E3A70A649F, vehicle, p1)
end

function Global.N_0x1dd2139a9a20dce8()
	return _in(0x1DD2139A9A20DCE8, _r, _ri)
end

function Global.N_0x1de0f5f50d723caa()
	return _in(0x1DE0F5F50D723CAA, _i, _i, _i, _r)
end

function Global.N_0x1e77fa7a62ee6c4c(p0)
	return _in(0x1E77FA7A62EE6C4C, p0, _r, _ri)
end

function Global.N_0x1e9057a74fd73e23()
	return _in(0x1E9057A74FD73E23)
end

function Global.N_0x1eac5f91bcbc5073(p0)
	return _in(0x1EAC5F91BCBC5073, p0)
end

--- Unsure about the use of this native but here's an example:
-- void sub_8709() {
-- GAMEPLAY::_1EAE0A6E978894A2(0, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(1, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(2, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(3, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(4, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(5, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(6, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(7, 1);
-- GAMEPLAY::_1EAE0A6E978894A2(8, 1);
-- }
-- So it appears that p0 ranges from 0 to 8.
-- ENABLE_DISPATCH_SERVICE, seems to have a similar layout.
function Global.N_0x1eae0a6e978894a2(p0, p1)
	return _in(0x1EAE0A6E978894A2, p0, p1)
end

function Global.N_0x1eae6dd17b7a5efa(p0)
	return _in(0x1EAE6DD17B7A5EFA, p0)
end

function Global.N_0x1ee7d8df4425f053(p0)
	return _in(0x1EE7D8DF4425F053, p0)
end

function Global.N_0x1f1e9682483697c7(p0, p1)
	return _in(0x1F1E9682483697C7, p0, p1, _r)
end

function Global.N_0x1f2300cb7fa7b7f6()
	return _in(0x1F2300CB7FA7B7F6, _r, _ri)
end

function Global.N_0x1f2e4e06dea8992b(p0, p1)
	return _in(0x1F2E4E06DEA8992B, p0, p1)
end

function Global.N_0x1f3f018bc3afa77c(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x1F3F018BC3AFA77C, p0, p1, p2, p3, p4, p5, p6, p7, p8, _r, _ri)
end

function Global.N_0x1f9fb66f3a3842d2(vehicle, p1)
	return _in(0x1F9FB66F3A3842D2, vehicle, p1)
end

function Global.N_0x1fc289a0c3ff470f(p0)
	return _in(0x1FC289A0C3FF470F, p0, _r, _ri)
end

function Global.N_0x1ff6bf9a63e5757f()
	return _in(0x1FF6BF9A63E5757F)
end

function Global.N_0x2016c603d6b8987c(p0, p1)
	return _in(0x2016C603D6B8987C, p0, p1)
end

function Global.N_0x206bc5dc9d1ac70a(vehicle, p1)
	return _in(0x206BC5DC9D1AC70A, vehicle, p1)
end

function Global.N_0x20746f7b1032a3c7(p0, p1, p2, p3)
	return _in(0x20746F7B1032A3C7, p0, p1, p2, p3)
end

--- -This function appears to be deprecated/ unused. Tracing the call internally leads to a _nullsub -
-- first one seems to be a string of a mission name, second one seems to be a bool/toggle
-- p1 was always 0.
function Global.N_0x208784099002bc30(missionNameLabel, p1)
	return _in(0x208784099002BC30, _ts(missionNameLabel), p1)
end

function Global.N_0x20c6c7e4eb082a7f(p0)
	return _in(0x20C6C7E4EB082A7F, p0)
end

function Global.N_0x20fe7fdfeead38c0()
	return _in(0x20FE7FDFEEAD38C0)
end

function Global.N_0x2107a3773771186d()
	return _in(0x2107A3773771186D, _r, _ri)
end

function Global.N_0x21115bcd6e44656a(p0, p1)
	return _in(0x21115BCD6E44656A, p0, p1)
end

function Global.N_0x211c4ef450086857()
	return _in(0x211C4EF450086857)
end

--- example
-- if (UI::IS_HELP_MESSAGE_BEING_DISPLAYED()&amp;&amp;(!UI::_214CD562A939246A())) {
-- return 0;
-- }
function Global.N_0x214cd562a939246a()
	return _in(0x214CD562A939246A, _r)
end

--- Only called once inside main_persitant with the parameters, 0
function Global.N_0x21973bbf8d17edfa(p0, p1)
	return _in(0x21973BBF8D17EDFA, p0, p1)
end

function Global.N_0x21c235bc64831e5a(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x21C235BC64831E5A, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, _r, _rv)
end

function Global.N_0x21d04d7bc538c146(p0)
	return _in(0x21D04D7BC538C146, p0, _r)
end

--- From b617 scripts:
-- CAM::_21E253A7F8DA5DFB("DINGHY");
-- CAM::_21E253A7F8DA5DFB("ISSI2");
-- CAM::_21E253A7F8DA5DFB("SPEEDO");
function Global.N_0x21e253a7f8da5dfb(vehicleName)
	return _in(0x21E253A7F8DA5DFB, _ts(vehicleName))
end

--- SET_TV_???
function Global.N_0x2201c576facaebe8(p0, p1, p2)
	return _in(0x2201C576FACAEBE8, p0, _ts(p1), p2)
end

--- Function.Call(Hash._0x2208438012482A1A, ped, 0, 0);
-- This makes the ped have faster animations
function Global.N_0x2208438012482a1a(ped, p1, p2)
	return _in(0x2208438012482A1A, ped, p1, p2)
end

function Global.N_0x225798743970412b(p0)
	return _in(0x225798743970412B, _ii(p0) --[[ may be optional ]], _r)
end

--- Probably the opposite of  0x80E4A6EDDB0BE8D9 / LOAD_ALL_PATH_NODES
function Global.N_0x228e5c6ad4d74bfd(p0)
	return _in(0x228E5C6AD4D74BFD, p0)
end

function Global.N_0x22a249a53034450a(p0)
	return _in(0x22A249A53034450A, p0)
end

function Global.N_0x22da66936e0fff37(p0)
	return _in(0x22DA66936E0FFF37, p0, _r)
end

function Global.N_0x2302c0264ea58d31()
	return _in(0x2302C0264EA58D31)
end

function Global.N_0x2311dd7159f00582(vehicle, p1)
	return _in(0x2311DD7159F00582, vehicle, p1)
end

function Global.N_0x23227df0b2115469()
	return _in(0x23227DF0B2115469)
end

function Global.N_0x23789e777d14ce44()
	return _in(0x23789E777D14CE44, _r, _ri)
end

function Global.N_0x237d5336a9a54108(p0)
	return _in(0x237D5336A9A54108, p0, _r)
end

function Global.N_0x23b59d8912f94246()
	return _in(0x23B59D8912F94246)
end

function Global.N_0x23ba6b0c2ad7b0d3(p0)
	return _in(0x23BA6B0C2AD7B0D3, p0)
end

function Global.N_0x23f09eadc01449d6(p0)
	return _in(0x23F09EADC01449D6, p0, _r)
end

--- Console Hash: 0x0AF83036
-- Only used once in scripts, in maintransition.
-- maintransition.c4, line ~82432:
-- if (PED::_7350823473013C02(PLAYER::PLAYER_PED_ID()) &amp;&amp; (DECORATOR::_241FCA5B1AA14F75() == 0)) {
-- g_2542A5 = a_1; // 'g_2542A5' used in 'building_controller.ysc' for IPL stuff?
-- return 1;
-- }
-- Likely used solely for the players ped. The function it's in seems to only be used for initialization/quitting. Called among natives to discard scaleforms, disable frontend, fading in/out, etc. Neighboring strings to some calls include "HUD_JOINING", "HUD_QUITTING".
function Global.N_0x241fca5b1aa14f75()
	return _in(0x241FCA5B1AA14F75, _r)
end

--- p0 is int or bool
function Global.N_0x2432784aca090da4(p0)
	return _in(0x2432784ACA090DA4, p0, _r)
end

function Global.N_0x24409fc4c55cb22d(p0)
	return _in(0x24409FC4C55CB22D, p0, _r, _ri)
end

function Global.N_0x247acbc4abbc9d1c(p0)
	return _in(0x247ACBC4ABBC9D1C, p0)
end

function Global.N_0x2485d34e50a22e84(p0, p1, p2)
	return _in(0x2485D34E50A22E84, p0, p1, p2)
end

function Global.N_0x24a49beaf468dc90(p0, p2, p3, p4)
	return _in(0x24A49BEAF468DC90, p0, _i, p2, p3, p4, _r)
end

function Global.N_0x24e4e51fc16305f9()
	return _in(0x24E4E51FC16305F9, _r, _ri)
end

function Global.N_0x25361a96e0f7e419(p0, p1, p2, p3)
	return _in(0x25361A96E0F7E419, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0x25367de49d64cf16(vehicle, p1)
	return _in(0x25367DE49D64CF16, vehicle, p1)
end

function Global.N_0x25615540d894b814(p0, p1)
	return _in(0x25615540D894B814, p0, p1)
end

function Global.N_0x2587a48bc88dfadf(p0)
	return _in(0x2587A48BC88DFADF, p0)
end

function Global.N_0x25b99872d588a101(p0, p1, p2, p3, p4, p5)
	return _in(0x25B99872D588A101, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.N_0x25d990f8e0e3f13c()
	return _in(0x25D990F8E0E3F13C)
end

function Global.N_0x25f87b30c382fca7()
	return _in(0x25F87B30C382FCA7)
end

function Global.N_0x25fc3e33a31ad0c9(p0)
	return _in(0x25FC3E33A31AD0C9, p0)
end

function Global.N_0x260ee4fdbdf4db01(p0)
	return _in(0x260EE4FDBDF4DB01, p0, _r, _rf)
end

function Global.N_0x261e97ad7bcf3d40(p0)
	return _in(0x261E97AD7BCF3D40, p0)
end

function Global.N_0x2632482fd6b9ab87()
	return _in(0x2632482FD6B9AB87)
end

function Global.N_0x265635150fb0d82e()
	return _in(0x265635150FB0D82E)
end

function Global.N_0x267c78c60e806b9a(p0, p1)
	return _in(0x267C78C60E806B9A, p0, p1)
end

function Global.N_0x26903d9cd1175f2c(p0, p1)
	return _in(0x26903D9CD1175F2C, p0, p1, _r, _ri)
end

function Global.N_0x26af0e8e30bd2a2c(ped)
	return _in(0x26AF0E8E30BD2A2C, ped, _r)
end

--- STATS::0x343B27E2(0);
-- STATS::0x343B27E2(1);
-- STATS::0x343B27E2(2);
-- STATS::0x343B27E2(3);
-- STATS::0x343B27E2(4);
-- STATS::0x343B27E2(5);
-- STATS::0x343B27E2(6);
-- STATS::0x343B27E2(7);
-- Identical in ingamehud &amp; maintransition.
function Global.N_0x26d7399b9587fe89(p0)
	return _in(0x26D7399B9587FE89, p0)
end

function Global.N_0x26f07dd83a5f7f98()
	return _in(0x26F07DD83A5F7F98, _r, _ri)
end

function Global.N_0x2708fc083123f9ff()
	return _in(0x2708FC083123F9FF)
end

function Global.N_0x271017b9ba825366(p0, p1)
	return _in(0x271017B9BA825366, p0, p1)
end

function Global.N_0x271401846bd26e92(p0, p1)
	return _in(0x271401846BD26E92, p0, p1)
end

function Global.N_0x271c9d3aca5d6409(rope)
	return _in(0x271C9D3ACA5D6409, rope, _r)
end

function Global.N_0x2735233a786b1bef(ped, p1)
	return _in(0x2735233A786B1BEF, ped, p1)
end

function Global.N_0x274a1519dfc1094f(p1)
	return _in(0x274A1519DFC1094F, _i, p1, _i, _r)
end

function Global.N_0x279d50de5652d935(p0, p1)
	return _in(0x279D50DE5652D935, p0, p1)
end

function Global.N_0x27b926779deb502d(vehicle, p1)
	return _in(0x27B926779DEB502D, vehicle, p1, _r)
end

function Global.N_0x27cb772218215325()
	return _in(0x27CB772218215325)
end

function Global.N_0x27cfb1b1e078cb2d()
	return _in(0x27CFB1B1E078CB2D)
end

function Global.N_0x27e32866e9a5c416(p0)
	return _in(0x27E32866E9A5C416, p0)
end

function Global.N_0x27feb5254759cde3(textureDict, p1)
	return _in(0x27FEB5254759CDE3, _ts(textureDict), p1, _r)
end

function Global.N_0x2801d0012266df07(p0)
	return _in(0x2801D0012266DF07, p0)
end

function Global.N_0x280c7e3ac7f56e90(p0)
	return _in(0x280C7E3AC7F56E90, p0, _i, _i, _i)
end

function Global.N_0x283b6062a2c01e9b()
	return _in(0x283B6062A2C01E9B)
end

function Global.N_0x287f1f75d2803595(p0, p1)
	return _in(0x287F1F75D2803595, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x288df530c92dad6f(p0, p1)
	return _in(0x288DF530C92DAD6F, p0, p1)
end

function Global.N_0x293220da1b46cebc(p0, p1, p2)
	return _in(0x293220DA1B46CEBC, p0, p1, p2)
end

function Global.N_0x299ef3c576773506()
	return _in(0x299EF3C576773506, _r, _ri)
end

function Global.N_0x29c24bfbed8ab8fb(p0, p1)
	return _in(0x29C24BFBED8AB8FB, p0, p1, _r, _rf)
end

function Global.N_0x2a2173e46daecd12(p0, p1)
	return _in(0x2A2173E46DAECD12, p0, p1)
end

function Global.N_0x2a25adc48f87841f()
	return _in(0x2A25ADC48F87841F, _r, _ri)
end

function Global.N_0x2a2a52824db96700(p0)
	return _in(0x2A2A52824DB96700, _ii(p0) --[[ may be optional ]])
end

function Global.N_0x2a56c06ebef2b0d9(cutsceneEntName, ped, modelHash)
	return _in(0x2A56C06EBEF2B0D9, _ts(cutsceneEntName), ped, _ch(modelHash))
end

function Global.N_0x2a7776c709904ab0(p0)
	return _in(0x2A7776C709904AB0, p0, _r, _ri)
end

--- 2 matches across 2 scripts. Only showed in appcamera &amp; appmedia. Both were 0.
function Global.N_0x2a893980e96b659a(p0)
	return _in(0x2A893980E96B659A, p0, _r, _ri)
end

--- VEHICLE::_2A8F319B392E7B3F(vehicle, 0.5);
function Global.N_0x2a8f319b392e7b3f(vehicle, p1)
	return _in(0x2A8F319B392E7B3F, vehicle, p1)
end

--- if (ENTITY::DOES_ENTITY_EXIST(l_228)) {
-- CAM::_2AED6301F67007D5(l_228);
function Global.N_0x2aed6301f67007d5(entity)
	return _in(0x2AED6301F67007D5, entity)
end

function Global.N_0x2b3334bca57cd799(p0)
	return _in(0x2B3334BCA57CD799, p0)
end

function Global.N_0x2b51edbefc301339(p0, p1)
	return _in(0x2B51EDBEFC301339, p0, _ts(p1), _r)
end

function Global.N_0x2b5aa717a181fb4c(p0, p1)
	return _in(0x2B5AA717A181FB4C, p0, p1)
end

function Global.N_0x2b5e102e4a42f2bf()
	return _in(0x2B5E102E4A42F2BF, _r, _ri)
end

function Global.N_0x2b626a0150e4d449()
	return _in(0x2B626A0150E4D449, _r, _ri)
end

function Global.N_0x2b6747faa9db9d6b(vehicle, p1)
	return _in(0x2B6747FAA9DB9D6B, vehicle, p1, _r, _ri)
end

function Global.N_0x2b694afcf64e6994(ped, p1)
	return _in(0x2B694AFCF64E6994, ped, p1)
end

function Global.N_0x2b69f5074c894811(p0, p1, p2, p3)
	return _in(0x2B69F5074C894811, p0, p1, p2, p3)
end

function Global.N_0x2b949a1e6aec8f6a()
	return _in(0x2B949A1E6AEC8F6A, _r, _ri)
end

function Global.N_0x2be4bc731d039d5a(p0, p1)
	return _in(0x2BE4BC731D039D5A, p0, p1)
end

function Global.N_0x2bf66d2e7414f686()
	return _in(0x2BF66D2E7414F686, _r, _ri)
end

function Global.N_0x2bf72ad5b41aa739()
	return _in(0x2BF72AD5B41AA739)
end

--- SET_ENTITY_*
function Global.N_0x2c2e3dc128f44309(entity, p1)
	return _in(0x2C2E3DC128F44309, entity, p1)
end

function Global.N_0x2c328af17210f009(p0)
	return _in(0x2C328AF17210F009, p0)
end

function Global.N_0x2c42340f916c5930(p0)
	return _in(0x2C42340F916C5930, p0, _r, _ri)
end

function Global.N_0x2c4a1590abf43e8b(vehicle, p1)
	return _in(0x2C4A1590ABF43E8B, vehicle, p1)
end

function Global.N_0x2c8cbfe1ea5fc631(p0)
	return _in(0x2C8CBFE1EA5FC631, p0, _r, _ri)
end

function Global.N_0x2c96cdb04fca358e(p0)
	return _in(0x2C96CDB04FCA358E, p0)
end

function Global.N_0x2cc848a861d01493()
	return _in(0x2CC848A861D01493, _r, _ri)
end

function Global.N_0x2ce544c68fb812a0(p0, p1, p2, p3, p4, p5)
	return _in(0x2CE544C68FB812A0, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.N_0x2d4259f1feb81da9(p0, p1, p2, p3)
	return _in(0x2D4259F1FEB81DA9, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0x2d5dc831176d0114(p0)
	return _in(0x2D5DC831176D0114, p0, _r)
end

--- Needs a bit more research, but it seems to return an int.
-- "agency_heist3b.ysc", line 71836:
-- if (CONTROLS::IS_CONTROL_JUST_PRESSED(2, 201) || CONTROLS::IS_CONTROL_JUST_PRESSED(2, 237)) {
-- GRAPHICS::_PUSH_SCALEFORM_MOVIE_FUNCTION(l_46, "SET_INPUT_EVENT_SELECT");
-- l_45 = GRAPHICS::_POP_SCALEFORM_MOVIE_FUNCTION();
-- }
-- if (GRAPHICS::_0x768FF8961BA904D6(l_45)) {
-- v_13 = GRAPHICS::_0x2DE7EFA66B906036(l_45);
-- if (v_13 == 6) {
-- sub_73269(a_0);
-- }
-- }
function Global.N_0x2de7efa66b906036(funcData)
	return _in(0x2DE7EFA66B906036, funcData, _r, _ri)
end

function Global.N_0x2df9038c90ad5264(p0, p1, p2, p3, p4, interiorFlags, scale, duration)
	return _in(0x2DF9038C90AD5264, p0, p1, p2, p3, p4, interiorFlags, scale, duration)
end

function Global.N_0x2e0bf682cc778d49(p0)
	return _in(0x2E0BF682CC778D49, p0, _r)
end

function Global.N_0x2e22fefa0100275e()
	return _in(0x2E22FEFA0100275E, _r, _ri)
end

function Global.N_0x2e65248609523599(p0, p1, p2)
	return _in(0x2E65248609523599, p0, p1, p2)
end

function Global.N_0x2e89990ddff670c3(p0, p1)
	return _in(0x2E89990DDFF670C3, p0, p1, _r, _ri)
end

function Global.N_0x2eac52b4019e2782()
	return _in(0x2EAC52B4019E2782, _r, _ri)
end

function Global.N_0x2ed61456317b8178()
	return _in(0x2ED61456317B8178)
end

--- Appears to return whether the player is using the pause menu store. Can't be sure though.
function Global.N_0x2f057596f2bd0061()
	return _in(0x2F057596F2BD0061, _r, _ri)
end

--- only documented. to be continued...
function Global.N_0x2f09f7976c512404(xCoord, yCoord, zCoord, p3)
	return _in(0x2F09F7976C512404, xCoord, yCoord, zCoord, p3, _r)
end

function Global.N_0x2f137b508de238f2(p0)
	return _in(0x2F137B508DE238F2, p0)
end

function Global.N_0x2f3c3d9f50681de4(p0, p1)
	return _in(0x2F3C3D9F50681DE4, p0, p1)
end

--- Used with radios:
-- void sub_cf383(auto _a0) {
-- if ((a_0)==1) {
-- if (GAMEPLAY::IS_BIT_SET((g_240005._f1), 3)) {
-- PLAYER::_2F7CEB6520288061(0);
-- AUDIO::SET_AUDIO_FLAG("AllowRadioDuringSwitch", 0);
-- AUDIO::SET_MOBILE_PHONE_RADIO_STATE(0);
-- AUDIO::SET_AUDIO_FLAG("MobileRadioInGame", 0);
-- }
-- sub_cf3f6(1);
-- } else {
-- if (GAMEPLAY::IS_BIT_SET((g_240005._f1), 3)) {
-- PLAYER::_2F7CEB6520288061(1);
-- AUDIO::SET_AUDIO_FLAG("AllowRadioDuringSwitch", 1);
-- AUDIO::SET_MOBILE_PHONE_RADIO_STATE(1);
-- AUDIO::SET_AUDIO_FLAG("MobileRadioInGame", 1);
-- }
-- sub_cf3f6(0);
-- }
-- }
-- SET_PLAYER_S*
function Global.N_0x2f7ceb6520288061(p0)
	return _in(0x2F7CEB6520288061, p0)
end

function Global.N_0x2f7f2b26dd3f18ee(p0, p1)
	return _in(0x2F7F2B26DD3F18EE, p0, p1)
end

--- NETWORK_IS_IN_???
function Global.N_0x2fc5650b0271cb57()
	return _in(0x2FC5650B0271CB57, _r, _ri)
end

function Global.N_0x3001bef2feca3680()
	return _in(0x3001BEF2FECA3680, _r)
end

function Global.N_0x302c91ab2d477f7e()
	return _in(0x302C91AB2D477F7E)
end

function Global.N_0x3044240d2e0fa842()
	return _in(0x3044240D2E0FA842, _r)
end

function Global.N_0x3054f114121c21ea(p0)
	return _in(0x3054F114121C21EA, p0, _r)
end

function Global.N_0x308f96458b7087cc(p1, p2, p3, p5)
	return _in(0x308F96458B7087CC, _i, p1, p2, p3, _i, p5, _r, _ri)
end

function Global.N_0x30a6614c1f7799b8(p0, p1, p2)
	return _in(0x30A6614C1F7799B8, p0, p1, p2)
end

--- possibly   ENABLE_VEHICLE_FOREVER_HYDRAULICS
function Global.N_0x30d779de7c4f6dd3(p0, p1)
	return _in(0x30D779DE7C4F6DD3, p0, p1)
end

function Global.N_0x30ed88d5e0c56a37(p0)
	return _in(0x30ED88D5E0C56A37, p0, _r)
end

function Global.N_0x31125fd509d9043f(p0)
	return _in(0x31125FD509D9043F, p0)
end

function Global.N_0x311438a071dd9b1a(p0, p1, p2)
	return _in(0x311438A071DD9B1A, p0, p1, p2)
end

function Global.N_0x3117d84efa60f77b(p0)
	return _in(0x3117D84EFA60F77B, p0)
end

--- p8 seems to always be false.
function Global.N_0x312342e1a4874f3f(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x312342E1A4874F3F, p0, p1, p2, p3, p4, p5, p6, p7, p8)
end

function Global.N_0x3133b907d8b32053(p0, p1)
	return _in(0x3133B907D8B32053, p0, p1, _r, _rf)
end

function Global.N_0x31727907b2c43c55(p0)
	return _in(0x31727907B2C43C55, p0)
end

--- From the decompiled scripts, called 61 times:
-- UI::_317EBA71D7543F52(&amp;v_13, &amp;v_13, &amp;v_3, &amp;v_3);
function Global.N_0x317eba71d7543f52()
	return _in(0x317EBA71D7543F52, _i, _i, _i, _i)
end

function Global.N_0x318516e02de3ece2(p0)
	return _in(0x318516E02DE3ECE2, p0)
end

function Global.N_0x3195f8dd0d531052(p0, p1)
	return _in(0x3195F8DD0D531052, p0, p1, _i, _i, _r)
end

function Global.N_0x31f924b53eaddf65(p0)
	return _in(0x31F924B53EADDF65, p0)
end

function Global.N_0x3270f67eed31fbc1(p0)
	return _in(0x3270F67EED31FBC1, p0, _i, _i, _r)
end

function Global.N_0x32c7a7e8c43a1f80(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x32C7A7E8C43A1F80, p0, p1, p2, p3, p4, p5, p6, p7, _r, _ri)
end

function Global.N_0x32dd916f3f7c9672(p0)
	return _in(0x32DD916F3F7C9672, p0, _r, _ri)
end

function Global.N_0x33506883545ac0df(vehicle, p1)
	return _in(0x33506883545AC0DF, vehicle, p1)
end

--- calculates two distances
function Global.N_0x336511a34f2e5185(left, right)
	return _in(0x336511A34F2E5185, left, right, _r, _rf)
end

function Global.N_0x336b3d200ab007cb(p0, p1, p2, p3, p4)
	return _in(0x336B3D200AB007CB, p0, p1, p2, p3, p4, _r, _ri)
end

function Global.N_0x33a60d8bdd6e508c(ped, p1)
	return _in(0x33A60D8BDD6E508C, ped, p1)
end

function Global.N_0x33d47e85b476abcd(p0)
	return _in(0x33D47E85B476ABCD, p0, _r)
end

function Global.N_0x33e3c6c6f2f0b506(p0, p1, p2, p3)
	return _in(0x33E3C6C6F2F0B506, p0, p1, p2, p3)
end

function Global.N_0x33ee12743ccd6343(p0, p1, p2)
	return _in(0x33EE12743CCD6343, p0, p1, p2, _r, _ri)
end

--- 6,000+ calls from scripts, all with either 0 or 1 for p2, that's a boolean in my book
-- ---
-- ^ The last one is the componentId
-- iVar8 = dlc1::get_hash_name_for_component(iParam0, 8, ped::get_ped_drawable_variation(iParam0, 8), ped::get_ped_texture_variation(iParam0, 8));
-- if (dlc1::_0x341DE7ED1D2A1BFD(iVar8, 240476421, 8))
function Global.N_0x341de7ed1d2a1bfd(componentHash, drawableSlotHash, componentId)
	return _in(0x341DE7ED1D2A1BFD, _ch(componentHash), _ch(drawableSlotHash), componentId, _r)
end

function Global.N_0x34318593248c8fb2(p0, p1, p2, p3, p4, p5)
	return _in(0x34318593248C8FB2, p0, p1, p2, p3, p4, p5, _r)
end

function Global.N_0x3441cad2f2231923(vehicle, p1)
	return _in(0x3441CAD2F2231923, vehicle, p1)
end

function Global.N_0x346ef3ecaaab149e()
	return _in(0x346EF3ECAAAB149E)
end

function Global.N_0x34770b9ce0e03b91(p0, p1)
	return _in(0x34770B9CE0E03B91, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x350aa5ebc03d3bd2()
	return _in(0x350AA5EBC03D3BD2, _r, _ri)
end

function Global.N_0x357b152ef96c30b6()
	return _in(0x357B152EF96C30B6, _r, _ri)
end

function Global.N_0x3599d741c9ac6310(p0, p1, p2, p3)
	return _in(0x3599D741C9AC6310, p0, p1, p2, p3, _r, _rf)
end

function Global.N_0x359af31a4b52f5ed()
	return _in(0x359AF31A4B52F5ED, _r, _ri)
end

function Global.N_0x35a1b3e1d1315cfa(p0, p1)
	return _in(0x35A1B3E1D1315CFA, p0, p1, _r)
end

function Global.N_0x35e0654f4bad7971(p0)
	return _in(0x35E0654F4BAD7971, p0)
end

function Global.N_0x35edd5b2e3ff01c0()
	return _in(0x35EDD5B2E3FF01C0)
end

function Global.N_0x35f0b98a8387274d()
	return _in(0x35F0B98A8387274D, _r, _ri)
end

function Global.N_0x35fb78dc42b7bd21()
	return _in(0x35FB78DC42B7BD21, _r, _ri)
end

function Global.N_0x36391f397731595d(p0)
	return _in(0x36391F397731595D, p0, _r, _ri)
end

--- Returns a float value related to slipstream.
function Global.N_0x36492c2f0d134c56(p0)
	return _in(0x36492C2F0D134C56, p0, _r, _ri)
end

function Global.N_0x3669f1b198dcaa4f()
	return _in(0x3669F1B198DCAA4F)
end

function Global.N_0x367ef5e2f439b4c6(p0)
	return _in(0x367EF5E2F439B4C6, p0)
end

--- GET_TIME_SINCE_???
function Global.N_0x36b77bb84687c318(ped, p1)
	return _in(0x36B77BB84687C318, ped, p1, _r, _ri)
end

function Global.N_0x36c1451a88a09630()
	return _in(0x36C1451A88A09630, _i, _i)
end

--- when player character is used plays remove scuba gear animation
function Global.N_0x36c6984c3ed0c911(p0)
	return _in(0x36C6984C3ED0C911, p0)
end

function Global.N_0x36ccb9be67b970fd(p0, p1)
	return _in(0x36CCB9BE67B970FD, p0, p1)
end

function Global.N_0x36f1b38855f2a8df(player)
	return _in(0x36F1B38855F2A8DF, player)
end

function Global.N_0x36f6626459d91457(p0)
	return _in(0x36F6626459D91457, p0)
end

function Global.N_0x372ef6699146a1e4(p0, entity, p2, p3)
	return _in(0x372EF6699146A1E4, p0, entity, p2, p3, _r)
end

function Global.N_0x374706271354cb18(vehicle, p1, p2)
	return _in(0x374706271354CB18, vehicle, p1, p2)
end

--- NETWORK_IS_TRANSITION_???
function Global.N_0x37a4494483b9f5c9()
	return _in(0x37A4494483B9F5C9, _r, _ri)
end

function Global.N_0x37deb0aa183fb6d8()
	return _in(0x37DEB0AA183FB6D8)
end

--- Sets some values in a vehicle gadget (tow arm, digger arm, etc.). Don't know which one though.
-- I've tested on the towtruck 1 &amp; 2, Dock Lift (Crate Arm), Dozer, and such have no effect. However when used on a Forklift it sets the height of the forks. 0.0 = Lowest 1.0 = Highest. This is best to be used if you wanna pick-up a car since un-realistically on GTA V forklifts can't pick up much of anything due to vehicle mass. If you put this under a car then set it above 0.0 to a 'lifted-value' it will raise the car with no issue lol
function Global.N_0x37ebbf3117bd6a25(vehicle, height)
	return _in(0x37EBBF3117BD6A25, vehicle, height)
end

function Global.N_0x38491439b6ba7f7d(p0, p1)
	return _in(0x38491439B6BA7F7D, p0, p1, _r, _rf)
end

--- Sets profile setting 934
function Global.N_0x38baaa5dd4c9d19f(value)
	return _in(0x38BAAA5DD4C9D19F, value)
end

--- Returns true if an unk value is greater than 0.0f
function Global.N_0x38d28da81e4e9bf9(player)
	return _in(0x38D28DA81E4E9BF9, player, _r)
end

function Global.N_0x397baa01068baa96()
	return _in(0x397BAA01068BAA96, _r, _ri)
end

function Global.N_0x39917e1b4cb0f911(p0)
	return _in(0x39917E1B4CB0F911, p0)
end

--- from extreme3.c4
-- PED::_39D55A620FCB6A3A(PLAYER::PLAYER_PED_ID(), 8, PED::GET_PED_DRAWABLE_VARIATION(PLAYER::PLAYER_PED_ID(), 8), PED::GET_PED_TEXTURE_VARIATION(PLAYER::PLAYER_PED_ID(), 8));
-- p1 is probably componentId
function Global.N_0x39d55a620fcb6a3a(ped, p1, drawableId, textureId)
	return _in(0x39D55A620FCB6A3A, ped, p1, drawableId, textureId, _r, _ri)
end

function Global.N_0x3a17a27d75c74887()
	return _in(0x3A17A27D75C74887, _r, _ri)
end

function Global.N_0x3a3d5568af297cd5(p0)
	return _in(0x3A3D5568AF297CD5, p0, _r)
end

function Global.N_0x3a48ab4445d499be()
	return _in(0x3A48AB4445D499BE, _r, _ri)
end

function Global.N_0x3b39236746714134(p0)
	return _in(0x3B39236746714134, p0, _r, _ri)
end

function Global.N_0x3bab9a4e4f2ff5c7()
	return _in(0x3BAB9A4E4F2FF5C7, _r, _ri)
end

function Global.N_0x3bbbd13e5041a79e()
	return _in(0x3BBBD13E5041A79E, _r, _ri)
end

function Global.N_0x3c4487461e9b0dcb()
	return _in(0x3C4487461E9B0DCB, _r, _ri)
end

function Global.N_0x3c5c1e2c2ff814b1(p0)
	return _in(0x3C5C1E2C2FF814B1, p0)
end

function Global.N_0x3c67506996001f5e()
	return _in(0x3C67506996001F5E, _r, _ri)
end

function Global.N_0x3c891a251567dfce(p0)
	return _in(0x3C891A251567DFCE, _ii(p0) --[[ may be optional ]], _r, _ri)
end

function Global.N_0x3ca6050692bc61b0(p0)
	return _in(0x3CA6050692BC61B0, p0)
end

function Global.N_0x3d3d15af7bcaaf83(p0, p1, p2)
	return _in(0x3D3D15AF7BCAAF83, p0, p1, p2)
end

function Global.N_0x3d3d8b3be5a83d35()
	return _in(0x3D3D8B3BE5A83D35, _r, _ri)
end

--- Used in carsteal3 script with p0 = "Carsteal4_spycar".
function Global.N_0x3d42b92563939375(p0)
	return _in(0x3D42B92563939375, _ts(p0), _r)
end

function Global.N_0x3d9acb1eb139e702()
	return _in(0x3D9ACB1EB139E702, _r, _ri)
end

function Global.N_0x3dbf2df0aeb7d289(p0)
	return _in(0x3DBF2DF0AEB7D289, p0, _r)
end

function Global.N_0x3dda37128dd1aca8(p0)
	return _in(0x3DDA37128DD1ACA8, p0)
end

--- 1 match in 1 script. cellphone_controller.
-- p0 is -1 in scripts.
function Global.N_0x3dec726c25a11bac(p0)
	return _in(0x3DEC726C25A11BAC, p0, _r, _ri)
end

function Global.N_0x3e200c2bcf4164eb(p0, p1)
	return _in(0x3E200C2BCF4164EB, p0, p1)
end

function Global.N_0x3e38e28a1d80ddf6(ped)
	return _in(0x3E38E28A1D80DDF6, ped, _r)
end

function Global.N_0x3e802f11fbe27674(p0)
	return _in(0x3E802F11FBE27674, p0, _r)
end

--- p0 was always 2 in R* scripts.
-- Called before calling DISPLAY_ONSCREEN_KEYBOARD if the input needs to be saved.
function Global.N_0x3ed1438c1f5c6612(p0)
	return _in(0x3ED1438C1F5C6612, p0)
end

function Global.N_0x3f52e880aaf6c8ca(p0)
	return _in(0x3F52E880AAF6C8CA, p0)
end

function Global.N_0x3f5cc444dcaaa8f2(p0, p1, p2)
	return _in(0x3F5CC444DCAAA8F2, p0, p1, p2)
end

function Global.N_0x3f9990bf5f22759c(p0)
	return _in(0x3F9990BF5F22759C, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x3fa36981311fa4ff(netId, state)
	return _in(0x3FA36981311FA4FF, netId, state)
end

function Global.N_0x4008edf7d6e48175(p0)
	return _in(0x4008EDF7D6E48175, p0)
end

function Global.N_0x402f9ed62087e898()
	return _in(0x402F9ED62087E898)
end

function Global.N_0x405591ec8fd9096d(p0)
	return _in(0x405591EC8FD9096D, p0)
end

--- Usage: INTERIOR::_0x405DC2AEF6AF95B9(INTERIOR::GET_KEY_FOR_ENTITY_IN_ROOM(PLAYER::PLAYER_PED_ID()));
function Global.N_0x405dc2aef6af95b9(roomHashKey)
	return _in(0x405DC2AEF6AF95B9, _ch(roomHashKey))
end

--- Console Hash: 0x9F82917F
function Global.N_0x407091cf6037118e(netID)
	return _in(0x407091CF6037118E, netID)
end

function Global.N_0x40aefd1a244741f2(p0)
	return _in(0x40AEFD1A244741F2, p0)
end

function Global.N_0x40f7e66472df3e5c(p0, p1)
	return _in(0x40F7E66472DF3E5C, p0, p1, _r, _ri)
end

function Global.N_0x41350b4fc28e3941(p0)
	return _in(0x41350B4FC28E3941, p0)
end

function Global.N_0x4167efe0527d706e()
	return _in(0x4167EFE0527D706E, _r)
end

function Global.N_0x418dc16fae452c1c(p0)
	return _in(0x418DC16FAE452C1C, p0, _r)
end

function Global.N_0x419594e137637120(p0, p1, p2)
	return _in(0x419594E137637120, p0, p1, p2)
end

function Global.N_0x41faa8fb2ece8720(p0)
	return _in(0x41FAA8FB2ECE8720, p0)
end

function Global.N_0x42156508606de65e(p0)
	return _in(0x42156508606DE65E, p0)
end

function Global.N_0x422d396f80a96547()
	return _in(0x422D396F80A96547, _r, _ri)
end

function Global.N_0x422f32cc7e56abad(p0)
	return _in(0x422F32CC7E56ABAD, p0, _r)
end

function Global.N_0x4237e822315d8ba9()
	return _in(0x4237E822315D8BA9, _r)
end

function Global.N_0x425aecf167663f48(ped, p1)
	return _in(0x425AECF167663F48, ped, p1)
end

function Global.N_0x4282e08174868be3()
	return _in(0x4282E08174868BE3, _r, _ri)
end

--- if (!ENTITY::DOES_ENTITY_BELONG_TO_THIS_SCRIPT(g_10A5A._f8B[a_0/*1*/], 1)) {
-- sub_20af7("No longer needed: Vehicle owned by other script");
-- if ((((a_0 == 24) &amp;&amp; (!sub_3a04(g_10A5A._f8B[a_0/*1*/]))) &amp;&amp; (!sub_39c9(g_10A5A._f8B[a_0/*1*/]))) &amp;&amp; (ENTITY::GET_ENTITY_MODEL(g_10A5A._f8B[a_0/*1*/]) != ${monster})) {
-- VEHICLE::_428BACCDF5E26EAD(g_10A5A._f8B[a_0/*1*/], 1);
-- }
-- g_10A5A._f8B[a_0/*1*/] = 0;
-- g_10A5A[a_0/*1*/] = 1;
-- sub_20ada(a_0);
-- return ;
-- }
function Global.N_0x428baccdf5e26ead(vehicle, p1)
	return _in(0x428BACCDF5E26EAD, vehicle, p1)
end

function Global.N_0x428eaf89e24f6c36(p0, p1)
	return _in(0x428EAF89E24F6C36, p0, p1)
end

--- LOD related
function Global.N_0x42a4beb35d372407(p0)
	return _in(0x42A4BEB35D372407, p0, _r, _ri)
end

function Global.N_0x437138b6a830166a()
	return _in(0x437138B6A830166A)
end

function Global.N_0x43865688ae10f0d7()
	return _in(0x43865688AE10F0D7, _r, _ri)
end

function Global.N_0x43d1680c6d19a8e9()
	return _in(0x43D1680C6D19A8E9)
end

function Global.N_0x43fa0dfc5df87815(vehicle, p1)
	return _in(0x43FA0DFC5DF87815, vehicle, p1)
end

--- sfink: related to: NETWORK_BAIL
-- NETWORK_BAIL_TRANSITION
-- NETWORK_JOIN_GROUP_ACTIVITY
-- NETWORK_JOIN_TRANSITION
-- NETWORK_LAUNCH_TRANSITION
-- NETWORK_SESSION_HOST
-- NETWORK_SESSION_HOST_CLOSED
-- NETWORK_SESSION_HOST_FRIENDS_ONLY
-- NETWORK_SESSION_HOST_SINGLE_PLAYER
-- NETWORK_SESSION_VOICE_LEAVE
function Global.N_0x444c4525ece0a4b9()
	return _in(0x444C4525ECE0A4B9)
end

function Global.N_0x44a0bdc559b35f6e()
	return _in(0x44A0BDC559B35F6E, _r, _ri)
end

function Global.N_0x44aca259d67651db(p1)
	return _in(0x44ACA259D67651DB, _i, p1)
end

function Global.N_0x44b37cdcae765aae(p0, p1)
	return _in(0x44B37CDCAE765AAE, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x451294e859ecc018(p0)
	return _in(0x451294E859ECC018, p0, _r, _ri)
end

function Global.N_0x459fd2c8d0ab78bc()
	return _in(0x459FD2C8D0AB78BC, _r, _ri)
end

function Global.N_0x45a83257ed02d9bc()
	return _in(0x45A83257ED02D9BC)
end

function Global.N_0x45e816772e93a9db()
	return _in(0x45E816772E93A9DB, _r, _ri)
end

function Global.N_0x46326e13da4e0546(p0)
	return _in(0x46326E13DA4E0546, _ii(p0) --[[ may be optional ]])
end

--- NOTE: 'p2' might be some kind of array.
function Global.N_0x4645de9980999e93(p0, p1, p2, p3, type)
	return _in(0x4645DE9980999E93, _ts(p0), _ts(p1), _ts(p2), _ts(p3), _ts(type), _r)
end

function Global.N_0x46494a2475701343(p0, p1, p2, p3, modelHash, p5)
	return _in(0x46494A2475701343, p0, p1, p2, p3, _ch(modelHash), p5, _r)
end

function Global.N_0x4668d80430d6c299(ped)
	return _in(0x4668D80430D6C299, ped)
end

--- This has been found in use in the decompiled files.
function Global.N_0x4669b3ed80f24b4e(player)
	return _in(0x4669B3ED80F24B4E, player, _r, _ri)
end

function Global.N_0x466da42c89865553(p0)
	return _in(0x466DA42C89865553, p0)
end

function Global.N_0x4683149ed1dde7a1(p0)
	return _in(0x4683149ED1DDE7A1, _ts(p0), _r)
end

function Global.N_0x469f2ecdec046337(p0)
	return _in(0x469F2ECDEC046337, p0)
end

--- Checks if the specified unknown flag is set in the ped's model.
-- The engine itself seems to exclusively check for flags 1 and 4 (Might be inlined code of the check that checks for other flags).
-- Game scripts exclusively check for flags 1 and 4.
function Global.N_0x46b05bcae43856b0(ped, flag)
	return _in(0x46B05BCAE43856B0, ped, flag, _r)
end

function Global.N_0x46d1a61a21f566fc(p0)
	return _in(0x46D1A61A21F566FC, p0)
end

function Global.N_0x46fb3ed415c7641c(p0, p1, p2)
	return _in(0x46FB3ED415C7641C, p0, p1, p2, _r)
end

function Global.N_0x472397322e92a856()
	return _in(0x472397322E92A856)
end

--- Returns an unknown value (dword_142317A08 in b944).
-- Used in appcamera.ysc and maintransition.ysc
function Global.N_0x473151ebc762c6da()
	return _in(0x473151EBC762C6DA, _r, _ri)
end

function Global.N_0x4737980e8a283806(p0, p1)
	return _in(0x4737980E8A283806, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x4750fc27570311ec()
	return _in(0x4750FC27570311EC, _r, _ri)
end

function Global.N_0x4759cc730f947c81()
	return _in(0x4759CC730F947C81)
end

function Global.N_0x4811bbac21c5fcd5(p0)
	return _in(0x4811BBAC21C5FCD5, p0)
end

function Global.N_0x4852fc386e2e1bb5(p0)
	return _in(0x4852FC386E2E1BB5, p0, _i, _i, _i)
end

function Global.N_0x48621c9fca3ebd28(p0)
	return _in(0x48621C9FCA3EBD28, p0)
end

function Global.N_0x4862437a486f91b0(p1, p2, p3)
	return _in(0x4862437A486F91B0, _i, p1, p2, p3, _r)
end

function Global.N_0x487912fd248efddf(p0, p1)
	return _in(0x487912FD248EFDDF, p0, p1, _r)
end

function Global.N_0x48adc8a773564670()
	return _in(0x48ADC8A773564670)
end

--- Only found 3 times in decompiled scripts. Not a whole lot to go off of.
-- GAMEPLAY::_48F069265A0E4BEC(a_0, "Movie_Name_For_This_Player");
-- GAMEPLAY::_48F069265A0E4BEC(&amp;a_0._fB, "Ringtone_For_This_Player");
-- GAMEPLAY::_48F069265A0E4BEC(&amp;a_0._f1EC4._f12[v_A/*6*/], &amp;v_13); // where v_13 is "MPATMLOGSCRS0" thru "MPATMLOGSCRS15"
function Global.N_0x48f069265a0e4bec(name)
	return _in(0x48F069265A0E4BEC, _i, _ts(name))
end

function Global.N_0x49482f9fcd825aaa(entity)
	return _in(0x49482F9FCD825AAA, entity)
end

function Global.N_0x49e50bdb8ba4dab2(ped, p1)
	return _in(0x49E50BDB8BA4DAB2, ped, p1)
end

function Global.N_0x49ec8030f5015f8b(p0)
	return _in(0x49EC8030F5015F8B, p0)
end

function Global.N_0x4a0c7c9bb10abb36(p0)
	return _in(0x4A0C7C9BB10ABB36, p0)
end

function Global.N_0x4a2d4e8bf4265b0f(p0)
	return _in(0x4A2D4E8BF4265B0F, p0, _r)
end

function Global.N_0x4a39db43e47cf3aa(p0)
	return _in(0x4A39DB43E47CF3AA, p0)
end

function Global.N_0x4a7d6e727f941747(p0)
	return _in(0x4A7D6E727F941747, _ii(p0) --[[ may be optional ]], _r, _ri)
end

--- example:
-- if (!((v_7)==UI::_4A9923385BDB9DAD())) {
-- UI::SET_BLIP_SPRITE((v_6), (v_7));
-- }
-- This function is hard-coded to always return 1.
function Global.N_0x4a9923385bdb9dad()
	return _in(0x4A9923385BDB9DAD, _r)
end

function Global.N_0x4a9fde3a5a6d0437(p0)
	return _in(0x4A9FDE3A5A6D0437, p0)
end

function Global.N_0x4af92acd3141d96c()
	return _in(0x4AF92ACD3141D96C)
end

--- p0 - Scale? Looks to be a normalized value (0.0 - 1.0)
-- offroad_races.c4, line ~67407:
-- a_3._f7 = GRAPHICS::CREATE_CHECKPOINT(v_D, v_A, a_4, a_7, v_E, v_F, v_10, sub_62b2(v_A, 220, 255), 0);
-- UI::GET_HUD_COLOUR(134, &amp;v_E, &amp;v_F, &amp;v_10, &amp;v_11);
-- GRAPHICS::_SET_CHECKPOINT_ICON_RGBA(a_3._f7, v_E, v_F, v_10, sub_62b2(v_A, 70, 210));
-- GRAPHICS::_4B5B4DA5D79F1943(a_3._f7, 0.95);
-- GRAPHICS::SET_CHECKPOINT_CYLINDER_HEIGHT(a_3._f7, 4.0, 4.0, 100.0);
function Global.N_0x4b5b4da5d79f1943(checkpoint, p0)
	return _in(0x4B5B4DA5D79F1943, checkpoint, p0)
end

function Global.N_0x4b5cfc83122df602()
	return _in(0x4B5CFC83122DF602)
end

--- Seems to call GET_PAUSED_MAP_STREAMING_REQUEST lol wtf
-- seg001:000000000158C324 sub_158C324:                            # DATA XREF: OPD:stru_1C29978o
-- seg001:000000000158C324
-- seg001:000000000158C324 .set arg_10,  0x10
-- seg001:000000000158C324
-- seg001:000000000158C324                 mflr      r0
-- seg001:000000000158C328                 bl        sub_1803774
-- seg001:000000000158C32C                 stdu      r1, -0x80(r1)
-- seg001:000000000158C330                 std       r0, 0x80+arg_10(r1)
-- seg001:000000000158C334                 mr        r31, r3
-- seg001:000000000158C338                 lwz       r3, 8(r31)
-- seg001:000000000158C33C                 addic     r4, r3, 4
-- seg001:000000000158C340                 addic     r5, r3, 0x10
-- seg001:000000000158C344                 addic     r7, r3, 0x20
-- seg001:000000000158C348                 lwz       r6, 0(r3)
-- seg001:000000000158C34C                 lfs       f1, 0x1C(r3)
-- seg001:000000000158C350                 lwz       r8, 0x2C(r3)
-- seg001:000000000158C354                 extsw     r3, r6
-- seg001:000000000158C358                 extsw     r8, r8
-- seg001:000000000158C35C                 bl        GET_PAUSED_MAP_STREAMING_REQUEST
-- seg001:000000000158C360                 lwz       r4, 0(r31)
-- seg001:000000000158C364                 stw       r3, 0(r4)
-- seg001:000000000158C368                 addi      r1, r1, 0x80
-- seg001:000000000158C36C                 b         loc_18037D8
-- sorta makes sense though since the one above this native and GET_PAUSED_MAP_STREAMING_REQUEST are used together often in scripts
function Global.N_0x4ba92a18502bca61(player, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, flags)
	return _in(0x4BA92A18502BCA61, player, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, flags, _r)
end

function Global.N_0x4bc2854478f3a749(doorHash)
	return _in(0x4BC2854478F3A749, _ch(doorHash), _r, _ri)
end

--- Only used once in the entire game scripts, probably useless. Always returns 0.
function Global.N_0x4c2330e61d3deb56(interiorID)
	return _in(0x4C2330E61D3DEB56, interiorID, _r, _ri)
end

function Global.N_0x4c61b39930d045da(p0)
	return _in(0x4C61B39930D045DA, p0, _r)
end

function Global.N_0x4c61c75bee8184c2(p0, p1, p2)
	return _in(0x4C61C75BEE8184C2, _ts(p0), p1, p2)
end

function Global.N_0x4c89fe2bdeb3f169()
	return _in(0x4C89FE2BDEB3F169, _r, _ri)
end

--- This function is hard-coded to always return 1.
function Global.N_0x4cebc1ed31e8925e(cutsceneName)
	return _in(0x4CEBC1ED31E8925E, _ts(cutsceneName), _r)
end

function Global.N_0x4d02279c83be69fe()
	return _in(0x4D02279C83BE69FE, _r, _ri)
end

function Global.N_0x4d89d607cb3dd1d2(object, toggle)
	return _in(0x4D89D607CB3DD1D2, object, toggle)
end

--- Something like flush_all_scripts
-- Most of time comes after NETWORK_END_TUTORIAL_SESSION() or before TERMINATE_THIS_THREAD()
function Global.N_0x4d953df78ebf8158()
	return _in(0x4D953DF78EBF8158)
end

function Global.N_0x4d9d109f63fee1d4(p0, p1)
	return _in(0x4D9D109F63FEE1D4, p0, p1)
end

function Global.N_0x4dcdf92bf64236cd(p0, p1)
	return _in(0x4DCDF92BF64236CD, p0, p1)
end

function Global.N_0x4df7cfff471a7fb1(p0)
	return _in(0x4DF7CFFF471A7FB1, p0, _r)
end

function Global.N_0x4dfdd9eb705f8140(p0)
	return _in(0x4DFDD9EB705F8140, _i --[[ actually bool ]], _r)
end

function Global.N_0x4e3cd0ef8a489541()
	return _in(0x4E3CD0EF8A489541, _r, _ri)
end

--- Examples:
-- AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_MICHAEL", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_MICHAEL", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_KILL_TREVOR", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "END_CREDITS_SAVE_MICHAEL_TREVOR", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "OFF_ROAD_RADIO_ROCK_LIST", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_06_COUNTRY", "MAGDEMO2_RADIO_DINGHY", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_16_SILVERLAKE", "SEA_RACE_RADIO_PLAYLIST", 1);
-- AUDIO::_4E404A9361F75BB2("RADIO_01_CLASS_ROCK", "OFF_ROAD_RADIO_ROCK_LIST", 1);
function Global.N_0x4e404a9361f75bb2(radioStation, p1, p2)
	return _in(0x4E404A9361F75BB2, _ts(radioStation), _ts(p1), p2)
end

function Global.N_0x4e52e752c76e7e7a(p0)
	return _in(0x4E52E752C76E7E7A, p0)
end

function Global.N_0x4e548c0d7ae39ff9(p0, p1)
	return _in(0x4E548C0D7AE39FF9, p0, p1, _r, _ri)
end

function Global.N_0x4e74e62e0a97e901(vehicle, p1)
	return _in(0x4E74E62E0A97E901, vehicle, p1)
end

--- The "disabled" variant of _0x5B84D09CEC5209C5.
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.N_0x4f8a26a890fd62fb(inputGroup, control)
	return _in(0x4F8A26A890FD62FB, inputGroup, control, _r, _rf)
end

function Global.N_0x4fef53183c3c6414()
	return _in(0x4FEF53183C3C6414, _r, _ri)
end

--- console hash: 0x004926A3
function Global.N_0x500873a45724c863(vehicle, p1)
	return _in(0x500873A45724C863, vehicle, p1)
end

function Global.N_0x5009dfd741329729(p0, p1)
	return _in(0x5009DFD741329729, _ts(p0), p1)
end

function Global.N_0x503f5920162365b2(p0, p1, p2, p3)
	return _in(0x503F5920162365B2, p0, p1, p2, p3)
end

function Global.N_0x5068f488ddb54dd8()
	return _in(0x5068F488DDB54DD8, _r, _ri)
end

function Global.N_0x5096fd9ccb49056d(p0)
	return _in(0x5096FD9CCB49056D, _ii(p0) --[[ may be optional ]])
end

function Global.N_0x50f457823ce6eb5f(p0, p1, p2, p3)
	return _in(0x50F457823CE6EB5F, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0x511f1a683387c7e2(p0)
	return _in(0x511F1A683387C7E2, p0, _r, _ri)
end

function Global.N_0x51bb2d88d31a914b(vehicle, p1)
	return _in(0x51BB2D88D31A914B, vehicle, p1)
end

function Global.N_0x51db102f4a3ba5e0(p0)
	return _in(0x51DB102F4A3BA5E0, p0)
end

function Global.N_0x51f1a8e48c3d2f6d(p0, p1, p2)
	return _in(0x51F1A8E48C3D2F6D, p0, p1, p2, _r)
end

--- Shows a hud element for reporting jobs
function Global.N_0x523a590c1a3cc0d3()
	return _in(0x523A590C1A3CC0D3)
end

function Global.N_0x524ff0aeff9c3973(p0)
	return _in(0x524FF0AEFF9C3973, p0)
end

function Global.N_0x52818819057f2b40(p0)
	return _in(0x52818819057F2B40, p0, _r)
end

function Global.N_0x52d59ab61ddc05dd(ped, p1)
	return _in(0x52D59AB61DDC05DD, ped, p1)
end

function Global.N_0x5324a0e3e4ce3570(p0, p1)
	return _in(0x5324A0E3E4CE3570, p0, p1, _i, _i, _r)
end

--- GET_VEHICLE_MODEL_*
-- 9.8 * thrust if air vehicle, else 0.38 + drive force?
-- For a full list, see here: pastebin.com/bJQeDqNd
function Global.N_0x53409b5163d5b846(modelHash)
	return _in(0x53409B5163D5B846, _ch(modelHash), _r, _rf)
end

--- GET_VEHICLE_MAX_*
-- sfink: this returns the vehicle property "Assisted Steering" or at least, it returned 37.5 when i was in a car with that value as assisted steering.
function Global.N_0x53af99baa671ca47(vehicle)
	return _in(0x53AF99BAA671CA47, vehicle, _r, _rf)
end

function Global.N_0x53afd64c6758f2f9()
	return _in(0x53AFD64C6758F2F9, _r, _ri)
end

function Global.N_0x53f4892d18ec90a4(p0)
	return _in(0x53F4892D18EC90A4, p0)
end

function Global.N_0x5407b7288d0478b7(p0)
	return _in(0x5407B7288D0478B7, p0, _r, _ri)
end

function Global.N_0x54318c915d27e4ce(p0, p1)
	return _in(0x54318C915D27E4CE, p0, p1)
end

function Global.N_0x544810ed9db6bbe6()
	return _in(0x544810ED9DB6BBE6, _r, _ri)
end

function Global.N_0x54b0f614960f4a5f(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x54B0F614960F4A5F, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.N_0x54e22ea2c1956a8d(p0)
	return _in(0x54E22EA2C1956A8D, p0)
end

--- From the scripts:
-- GAMEPLAY::_54F157E0336A3822(sub_aa49(a_0), "ForcedStopDirection", v_E);
function Global.N_0x54f157e0336a3822(p0, p1, p2)
	return _in(0x54F157E0336A3822, p0, _ts(p1), p2)
end

--- DISABLE_*
-- p0 seems to be Player or int
function Global.N_0x5501b7a5cdb79d37(p0)
	return _in(0x5501B7A5CDB79D37, p0)
end

function Global.N_0x551df99658db6ee8(p0, p1, p2)
	return _in(0x551DF99658DB6EE8, p0, p1, p2, _r, _ri)
end

--- Sets profile setting 935
function Global.N_0x55384438fc55ad8e(value)
	return _in(0x55384438FC55AD8E, value)
end

function Global.N_0x5539c3ebf104a53a(p0)
	return _in(0x5539C3EBF104A53A, p0)
end

--- GET_PLAYER_*
-- Seems to do something with network (?)
-- PLAYER::_56105E599CAB0EFA(NETWORK::NETWORK_GET_PLAYER_INDEX_FROM_PED(ped))
function Global.N_0x56105e599cab0efa(p0)
	return _in(0x56105E599CAB0EFA, _ii(p0) --[[ may be optional ]], _r, _ri)
end

--- Returns the current AI BLIP for the specified ped
function Global.N_0x56176892826a4fe8(ped)
	return _in(0x56176892826A4FE8, ped, _r, _ri)
end

--- NETWORK_PLAYER_???
function Global.N_0x565e430db3b05bec(p0)
	return _in(0x565E430DB3B05BEC, p0, _r)
end

function Global.N_0x567384dfa67029e6()
	return _in(0x567384DFA67029E6, _r, _ri)
end

function Global.N_0x5688585e6d563cd8(p0)
	return _in(0x5688585E6D563CD8, p0)
end

function Global.N_0x56b94c6d7127dfba(p0, p1, p2)
	return _in(0x56B94C6D7127DFBA, p0, p1, p2)
end

function Global.N_0x56c8b608cfd49854()
	return _in(0x56C8B608CFD49854)
end

--- console hash = 0x30F43FE3
function Global.N_0x56eb5e94318d3fb6(vehicle, p1)
	return _in(0x56EB5E94318D3FB6, vehicle, p1)
end

--- Jenkins hash: 0x772DA539
-- p0 looks like Player or int (found in "am_pi_menu")
function Global.N_0x5702b917b99db1cd(p0)
	return _in(0x5702B917B99DB1CD, p0)
end

function Global.N_0x570389d1c3de3c6b(p0)
	return _in(0x570389D1C3DE3C6B, p0)
end

--- consoel hash 0xAEB29F98
function Global.N_0x571feb383f629926(cargobob, p1)
	return _in(0x571FEB383F629926, cargobob, p1)
end

function Global.N_0x576594e8d64375e2(p0, p1)
	return _in(0x576594E8D64375E2, p0, p1)
end

--- Not sure what it does but it's in a function called in the main of appbroadcast and is also called in freemode. Likely chat related.
function Global.N_0x57b192b4d4ad23d5(p0)
	return _in(0x57B192B4D4AD23D5, p0)
end

function Global.N_0x57d760d55f54e071(p0)
	return _in(0x57D760D55F54E071, p0)
end

function Global.N_0x583049884a2eee3c()
	return _in(0x583049884A2EEE3C)
end

function Global.N_0x5835d9cd92e83184()
	return _in(0x5835D9CD92E83184, _i, _i, _r)
end

function Global.N_0x583df8e3d4afbd98()
	return _in(0x583DF8E3D4AFBD98, _r, _ri)
end

function Global.N_0x5845066d8a1ea7f7(vehicle, x, y, z, p4)
	return _in(0x5845066D8A1EA7F7, vehicle, x, y, z, p4)
end

function Global.N_0x584770794d758c18(p0, p1)
	return _in(0x584770794D758C18, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x589f80b325cc82c5(p0, p1, p2, p3, p4)
	return _in(0x589F80B325CC82C5, p0, p1, p2, p3, _ii(p4) --[[ may be optional ]], _r)
end

--- LEADERBOARDS_GET_CACHE_???
function Global.N_0x58a651cd201d89ad(p0)
	return _in(0x58A651CD201D89AD, p0, _r, _ri)
end

function Global.N_0x58bb377bec7cd5f4(p0, p1)
	return _in(0x58BB377BEC7CD5F4, p0, p1)
end

function Global.N_0x58c21165f6545892(p0, p1)
	return _in(0x58C21165F6545892, p0, p1)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x58cc181719256197(p0, p1, p2)
	return _in(0x58CC181719256197, p0, p1, p2, _r, _ri)
end

function Global.N_0x59328eb08c5ceb2b()
	return _in(0x59328EB08C5CEB2B, _r, _ri)
end

function Global.N_0x593570c289a77688()
	return _in(0x593570C289A77688, _r, _ri)
end

function Global.N_0x593feae1f73392d4()
	return _in(0x593FEAE1F73392D4, _r, _ri)
end

function Global.N_0x59424bd75174c9b1()
	return _in(0x59424BD75174C9B1)
end

function Global.N_0x595f028698072dd9(p0, p1, p2)
	return _in(0x595F028698072DD9, p0, p1, p2, _r)
end

function Global.N_0x597f8dba9b206fc7()
	return _in(0x597F8DBA9B206FC7, _r, _ri)
end

--- Same behavior as GET_LOCAL_PLAYER_AIM_STATE but only used on the PC version.
function Global.N_0x59b9a7af4c95133c()
	return _in(0x59B9A7AF4C95133C, _r, _ri)
end

--- may be 0x6CDAA7D2
-- sfink: related to: NETWORK_BAIL
-- NETWORK_BAIL_TRANSITION
-- NETWORK_JOIN_GROUP_ACTIVITY
-- NETWORK_JOIN_TRANSITION
-- NETWORK_LAUNCH_TRANSITION
-- NETWORK_SESSION_HOST
-- NETWORK_SESSION_HOST_CLOSED
-- NETWORK_SESSION_HOST_FRIENDS_ONLY
-- NETWORK_SESSION_HOST_SINGLE_PLAYER
-- NETWORK_SESSION_VOICE_LEAVE
function Global.N_0x59df79317f85a7e0()
	return _in(0x59DF79317F85A7E0, _r, _ri)
end

function Global.N_0x59e7b488451f4d3a(p0, p1)
	return _in(0x59E7B488451F4D3A, p0, p1)
end

function Global.N_0x5a0a3d1a186a5508()
	return _in(0x5A0A3D1A186A5508, _r, _ri)
end

function Global.N_0x5a34cd9c3c5bec44(p0)
	return _in(0x5A34CD9C3C5BEC44, p0, _r)
end

function Global.N_0x5a43c76f7fc7ba5f()
	return _in(0x5A43C76F7FC7BA5F)
end

function Global.N_0x5a556b229a169402()
	return _in(0x5A556B229A169402, _r)
end

--- NETWORK_IS_TRANSITION_???
function Global.N_0x5a6aa44ff8e931e6()
	return _in(0x5A6AA44FF8E931E6, _r)
end

function Global.N_0x5a6ffa2433e2f14c(player, p1, p2, p3, p4, p5, p6, p7, flags)
	return _in(0x5A6FFA2433E2F14C, player, p1, p2, p3, p4, p5, p6, p7, flags, _r)
end

function Global.N_0x5a7f62fda59759bd()
	return _in(0x5A7F62FDA59759BD)
end

function Global.N_0x5aa3befa29f03ad4()
	return _in(0x5AA3BEFA29F03AD4, _r, _ri)
end

--- GET_VEHICLE_MODEL_*
-- called if the vehicle is a boat -- returns vecMoveResistanceX?
-- For a full list, see here: pastebin.com/Pyb2RhZ9
function Global.N_0x5aa3f878a178c4fc(modelHash)
	return _in(0x5AA3F878A178C4FC, _ch(modelHash), _r, _rf)
end

function Global.N_0x5aab586ffec0fd96(p0)
	return _in(0x5AAB586FFEC0FD96, p0)
end

--- Disables some other rendering (internal)
function Global.N_0x5ad3932daeb1e5d3()
	return _in(0x5AD3932DAEB1E5D3)
end

function Global.N_0x5ae17c6b0134b7f1()
	return _in(0x5AE17C6B0134B7F1, _r, _ri)
end

function Global.N_0x5b0316762afd4a64()
	return _in(0x5B0316762AFD4A64, _r, _ri)
end

function Global.N_0x5b1f2e327b6b6fe1()
	return _in(0x5B1F2E327B6B6FE1, _r, _ri)
end

function Global.N_0x5b48a06dd0e792a5()
	return _in(0x5B48A06DD0E792A5, _r, _ri)
end

function Global.N_0x5b50abb1fe3746f4()
	return _in(0x5B50ABB1FE3746F4, _r, _ri)
end

function Global.N_0x5b6010b3cbc29095(p0, p1)
	return _in(0x5B6010B3CBC29095, p0, p1)
end

function Global.N_0x5b73c77d9eb66e24(p0)
	return _in(0x5B73C77D9EB66E24, p0)
end

--- Seems to return values between -1 and 1 for controls like gas and steering.
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.N_0x5b84d09cec5209c5(inputGroup, control)
	return _in(0x5B84D09CEC5209C5, inputGroup, control, _r, _rf)
end

function Global.N_0x5b8ed3db018927b1(p0)
	return _in(0x5B8ED3DB018927B1, p0)
end

function Global.N_0x5bd5f255321c4aaf(p0)
	return _in(0x5BD5F255321C4AAF, p0, _r, _ri)
end

function Global.N_0x5bff36d6ed83e0ae()
	return _in(0x5BFF36D6ED83E0AE, _r, _rv)
end

--- Only called once in the scripts.
-- Related to weapon objects.
function Global.N_0x5c3b791d580e0bc2(entity, p1)
	return _in(0x5C3B791D580E0BC2, entity, p1)
end

function Global.N_0x5c41e6babc9e2112(p0)
	return _in(0x5C41E6BABC9E2112, p0)
end

function Global.N_0x5c48a1d6e3b33179(p0)
	return _in(0x5C48A1D6E3B33179, p0, _r)
end

function Global.N_0x5c497525f803486b()
	return _in(0x5C497525F803486B)
end

function Global.N_0x5c4ebffa98bdb41c(p0)
	return _in(0x5C4EBFFA98BDB41C, p0, _r, _ri)
end

function Global.N_0x5c707a667df8b9fa(p0, p1)
	return _in(0x5C707A667DF8B9FA, p0, p1)
end

function Global.N_0x5cae833b0ee0c500(p0)
	return _in(0x5CAE833B0EE0C500, p0, _r)
end

--- Only called in golf and golf_mp
-- parameters used are
-- GRAPHICS::_0x5CE62918F8D703C7(255, 0, 0, 64, 255, 255, 255, 5, 255, 255, 0, 64);
function Global.N_0x5ce62918f8d703c7(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	return _in(0x5CE62918F8D703C7, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
end

function Global.N_0x5d10b3795f3fc886()
	return _in(0x5D10B3795F3FC886, _r)
end

function Global.N_0x5d517b27cf6ecd04(p0)
	return _in(0x5D517B27CF6ECD04, p0)
end

function Global.N_0x5d5caff661ddf6fc(p0, p1)
	return _in(0x5D5CAFF661DDF6FC, p0, _ii(p1) --[[ may be optional ]])
end

function Global.N_0x5d7b620dae436138(p0)
	return _in(0x5D7B620DAE436138, p0)
end

--- longest time being ilde?
function Global.N_0x5da3a8de8cb6226f(time)
	return _in(0x5DA3A8DE8CB6226F, time)
end

function Global.N_0x5db8010ee71fdef2(vehicle)
	return _in(0x5DB8010EE71FDEF2, vehicle, _r)
end

function Global.N_0x5dc40a8869c22141(p0, p1)
	return _in(0x5DC40A8869C22141, p0, p1)
end

--- NETWORK_IS_TRANSITION_???
function Global.N_0x5dc577201723960a()
	return _in(0x5DC577201723960A, _r)
end

function Global.N_0x5debd9c4dc995692()
	return _in(0x5DEBD9C4DC995692)
end

function Global.N_0x5e0165278f6339ee(p0)
	return _in(0x5E0165278F6339EE, p0, _r, _ri)
end

function Global.N_0x5e24341a7f92a74b()
	return _in(0x5E24341A7F92A74B, _r, _ri)
end

function Global.N_0x5e3aa4ca2b6fb0ee(p0)
	return _in(0x5E3AA4CA2B6FB0EE, p0)
end

function Global.N_0x5e569ec46ec21cae(vehicle, toggle)
	return _in(0x5E569EC46EC21CAE, vehicle, toggle)
end

function Global.N_0x5e657ef1099edd65(p0)
	return _in(0x5E657EF1099EDD65, p0, _r)
end

function Global.N_0x5e9daf5a20f15908(p0)
	return _in(0x5E9DAF5A20F15908, p0)
end

function Global.N_0x5ea784d197556507()
	return _in(0x5EA784D197556507, _r, _ri)
end

--- returns pickup hash.
function Global.N_0x5eaad83f8cfb4575(pickupHash)
	return _in(0x5EAAD83F8CFB4575, pickupHash, _r, _ri)
end

--- example from completionpercentage_controller.ysc.c4
-- if (STATS::_5EAD2BF6484852E4()) {
-- GAMEPLAY::SET_BIT(g_17b95._f20df._ff10, 15);
-- STATS::_11FF1C80276097ED(0xe9ec4dd1, 200, 0);
-- }
function Global.N_0x5ead2bf6484852e4()
	return _in(0x5EAD2BF6484852E4, _r)
end

function Global.N_0x5edef0cf8c1dab3c()
	return _in(0x5EDEF0CF8C1DAB3C, _r, _ri)
end

function Global.N_0x5f0f3f56635809ef(p0)
	return _in(0x5F0F3F56635809EF, p0)
end

--- SET_PLAYERS_*
function Global.N_0x5f2013f8bc24ee69(p0)
	return _in(0x5F2013F8BC24EE69, p0)
end

function Global.N_0x5f35f6732c3fbba0(p0)
	return _in(0x5F35F6732C3FBBA0, p0, _r, _rf)
end

function Global.N_0x5fbd7095fe7ae57f(p0, p1)
	return _in(0x5FBD7095FE7AE57F, p0, _fi(p1) --[[ may be optional ]], _r)
end

--- Appears once in "re_dealgonewrong"
function Global.N_0x5fc472c501ccadb3(player)
	return _in(0x5FC472C501CCADB3, player, _r)
end

function Global.N_0x600048c60d5c2c51(p0)
	return _in(0x600048C60D5C2C51, p0)
end

function Global.N_0x600f8cb31c7aab6e(p0)
	return _in(0x600F8CB31C7AAB6E, p0)
end

function Global.N_0x606e4d3e3cccf3eb()
	return _in(0x606E4D3E3CCCF3EB, _r, _ri)
end

--- Console Hash: 0x37C388DB
function Global.N_0x6070104b699b2ef4(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x6070104B699B2EF4, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.N_0x60734cc207c9833c(p0)
	return _in(0x60734CC207C9833C, p0)
end

function Global.N_0x609278246a29ca34(p0, p1, p2)
	return _in(0x609278246A29CA34, p0, p1, p2)
end

--- Something with Social Club or online.
function Global.N_0x60e892ba4f5bdca4()
	return _in(0x60E892BA4F5BDCA4)
end

function Global.N_0x60edd13eb3ac1ff3()
	return _in(0x60EDD13EB3AC1FF3, _r, _ri)
end

--- Unknown. Called after creating a checkpoint (type: 51) in the creators.
function Global.N_0x615d3925e87a3b26(checkpoint)
	return _in(0x615D3925E87A3B26, checkpoint)
end

--- From the scripts:
-- OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 0);
-- OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 0);
-- OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 1);
-- OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_portable_package}, 0);
-- OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_armour_standard}, 0);
-- OBJECT::_616093EC6B139DD9(PLAYER::PLAYER_ID(), ${pickup_armour_standard}, 1);
-- SET_PLAYER_P*
function Global.N_0x616093ec6b139dd9(player, pickupHash, p2)
	return _in(0x616093EC6B139DD9, player, _ch(pickupHash), p2)
end

function Global.N_0x61631f5df50d1c34(p0)
	return _in(0x61631F5DF50D1C34, p0)
end

function Global.N_0x61767f73eaceed21(ped)
	return _in(0x61767F73EACEED21, ped, _r)
end

function Global.N_0x61a885d3f7cfee9a()
	return _in(0x61A885D3F7CFEE9A)
end

function Global.N_0x61f95e5bb3e0a8c6(p0)
	return _in(0x61F95E5BB3E0A8C6, p0)
end

function Global.N_0x6216b116083a7cb4(p0)
	return _in(0x6216B116083A7CB4, p0)
end

--- Used only once (am_mp_property_int)
-- ped was PLAYER_PED_ID()
function Global.N_0x621c6e4729388e41(ped)
	return _in(0x621C6E4729388E41, ped, _r)
end

function Global.N_0x6274c4712850841e(entity, p1)
	return _in(0x6274C4712850841E, entity, p1)
end

function Global.N_0x629526aba383bcaa()
	return _in(0x629526ABA383BCAA)
end

function Global.N_0x62a0296c1bb1ceb3()
	return _in(0x62A0296C1BB1CEB3, _r, _ri)
end

function Global.N_0x62b9fec9a11f10ef()
	return _in(0x62B9FEC9A11F10EF, _r, _ri)
end

function Global.N_0x62ca17b74c435651(vehicle)
	return _in(0x62CA17B74C435651, vehicle, _r)
end

function Global.N_0x62e849b7eb28e770(p0)
	return _in(0x62E849B7EB28E770, p0)
end

--- returns sceneHandle
function Global.N_0x62ec273d00187dca(x, y, z, radius, object)
	return _in(0x62EC273D00187DCA, x, y, z, radius, _ch(object), _r, _ri)
end

function Global.N_0x62ecfcfdee7885d6()
	return _in(0x62ECFCFDEE7885D6)
end

function Global.N_0x631dc5dff4b110e3(p0)
	return _in(0x631DC5DFF4B110E3, p0, _r)
end

function Global.N_0x632b2940c67f4ea9(scaleformHandle)
	return _in(0x632B2940C67F4EA9, scaleformHandle, _i, _i, _i, _r)
end

function Global.N_0x634148744f385576(vehicle)
	return _in(0x634148744F385576, vehicle, _r)
end

function Global.N_0x638a3a81733086db()
	return _in(0x638A3A81733086DB, _r, _ri)
end

function Global.N_0x639431e895b9aa57(ped, vehicle, p2, p3, p4)
	return _in(0x639431E895B9AA57, ped, vehicle, p2, p3, p4, _r)
end

function Global.N_0x63b406d7884bfa95()
	return _in(0x63B406D7884BFA95, _r, _ri)
end

function Global.N_0x63eb2b972a218cac()
	return _in(0x63EB2B972A218CAC)
end

function Global.N_0x643ed62d5ea3bebd()
	return _in(0x643ED62D5EA3BEBD)
end

function Global.N_0x644546ec5287471b()
	return _in(0x644546EC5287471B, _r)
end

function Global.N_0x6483c25849031c4f(p0, p1, p2, p3)
	return _in(0x6483C25849031C4F, p0, p1, p2, _ii(p3) --[[ may be optional ]])
end

function Global.N_0x648e7a5434af7969(p0, p2, type)
	return _in(0x648E7A5434AF7969, _ts(p0), _i, p2, _i, _i, _i, _ts(type), _r)
end

function Global.N_0x649c97d52332341a(p0)
	return _in(0x649C97D52332341A, p0)
end

function Global.N_0x64f62afb081e260d()
	return _in(0x64F62AFB081E260D)
end

function Global.N_0x6512765e3be78c50()
	return _in(0x6512765E3BE78C50, _r, _ri)
end

--- possibly called:
-- ADD_DOOR_EXPERIMENTAL_MATRIX
function Global.N_0x65499865fca6e5ec(doorHash)
	return _in(0x65499865FCA6E5EC, _ch(doorHash), _r, _rf)
end

--- Something related to clearing the ped because always used with CLEAR_PED_WETNESS, CLEAR_PED_BLOOD_DAMAGE and RESET_PED_VISIBLE_DAMAGE.
function Global.N_0x6585d955a68452a5(ped)
	return _in(0x6585D955A68452A5, ped, _r, _ri)
end

function Global.N_0x65d2ebb47e1cec21(p0)
	return _in(0x65D2EBB47E1CEC21, p0)
end

--- IS_PLAYER_*
function Global.N_0x65faee425de637b0(p0)
	return _in(0x65FAEE425DE637B0, p0, _r)
end

function Global.N_0x661b5c8654add825(p0, p1)
	return _in(0x661B5C8654ADD825, p0, p1)
end

function Global.N_0x662635855957c411(p0)
	return _in(0x662635855957C411, p0, _r, _ri)
end

--- Something related to vehicle lean? (References CVehicleLeanHelper)
function Global.N_0x6636c535f6cc2725(vehicle)
	return _in(0x6636C535F6CC2725, vehicle, _r, _rf)
end

function Global.N_0x6647c5f6f5792496(ped, p1)
	return _in(0x6647C5F6F5792496, ped, p1)
end

--- Normally returns true. Returns false briefly whilst getting into a plane. This is probably a check to see if the ped model and all its components/drawables are properly loaded yet.
function Global.N_0x66680a92700f43df(p0)
	return _in(0x66680A92700F43DF, p0, _r)
end

function Global.N_0x66972397e0757e7a(p0, p1, p2)
	return _in(0x66972397E0757E7A, p0, p1, p2)
end

function Global.N_0x66979acf5102fd2f(cargobob, p1)
	return _in(0x66979ACF5102FD2F, cargobob, p1)
end

function Global.N_0x66a49d021870fe88()
	return _in(0x66A49D021870FE88)
end

function Global.N_0x66b59cffd78467af()
	return _in(0x66B59CFFD78467AF, _r, _ri)
end

function Global.N_0x66e7cb63c97b7d20()
	return _in(0x66E7CB63C97B7D20, _r, _ri)
end

function Global.N_0x66f010a4b031a331(p0)
	return _in(0x66F010A4B031A331, _ii(p0) --[[ may be optional ]])
end

function Global.N_0x673ed815d6e323b7(p0, p1, p2, p3, p4)
	return _in(0x673ED815D6E323B7, p0, p1, p2, p3, p4, _r)
end

function Global.N_0x675721c9f644d161()
	return _in(0x675721C9F644D161)
end

function Global.N_0x678bb03c1a3bd51e(p0, p1, p2)
	return _in(0x678BB03C1A3BD51E, p0, p1, p2, _i, _i, _r)
end

function Global.N_0x67a5589628e0cff6()
	return _in(0x67A5589628E0CFF6, _r)
end

function Global.N_0x67eedea1b9bafd94()
	return _in(0x67EEDEA1B9BAFD94)
end

function Global.N_0x67f6413d3220e18d(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x67F6413D3220E18D, p0, p1, p2, p3, p4, p5, p6, p7, p8, _r, _ri)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x67fc09bc554a75e5()
	return _in(0x67FC09BC554A75E5, _r, _ri)
end

function Global.N_0x68103e2247887242()
	return _in(0x68103E2247887242)
end

--- example:
-- if (GAMEPLAY::_684A41975F077262()) {
-- (a_0) = GAMEPLAY::_ABB2FA71C83A1B72();
-- } else {
-- (a_0) = -1;
-- }
function Global.N_0x684a41975f077262()
	return _in(0x684A41975F077262, _r)
end

function Global.N_0x6856ec3d35c81ea4()
	return _in(0x6856EC3D35C81EA4, _r, _ri)
end

function Global.N_0x685d5561680d088b(vehicle, p1)
	return _in(0x685D5561680D088B, vehicle, p1)
end

function Global.N_0x68772db2b2526f9f(ped, x, y, z, range)
	return _in(0x68772DB2B2526F9F, ped, x, y, z, range, _r)
end

function Global.N_0x687c0b594907d2e8(ped)
	return _in(0x687C0B594907D2E8, ped)
end

--- p0 seems to be Ped
function Global.N_0x690a61a6d13583f6(p0)
	return _in(0x690A61A6D13583F6, p0, _r)
end

function Global.N_0x692d58df40657e8c(p0, p1, p2, p4, p5)
	return _in(0x692D58DF40657E8C, p0, p1, p2, _i, p4, p5, _r)
end

function Global.N_0x692d808c34a82143(p0, p1, type)
	return _in(0x692D808C34A82143, _ts(p0), p1, _ts(type), _r)
end

--- what does it do?
function Global.N_0x694e00132f2823ed(entity, p1)
	return _in(0x694E00132F2823ED, entity, p1)
end

function Global.N_0x699e4a5c8c893a18(p0, p1, p2)
	return _in(0x699E4A5C8C893A18, p0, _ts(p1), _ii(p2) --[[ may be optional ]], _r)
end

function Global.N_0x69fe6dc87bd2a5e9(p0)
	return _in(0x69FE6DC87BD2A5E9, p0)
end

function Global.N_0x6a12d88881435dca()
	return _in(0x6A12D88881435DCA)
end

--- Called in freemode related scripts but not freemode itself.
function Global.N_0x6a5d89d7769a40d8(p0)
	return _in(0x6A5D89D7769A40D8, p0)
end

function Global.N_0x6a98c2ecf57fa5d4(vehicle, entity)
	return _in(0x6A98C2ECF57FA5D4, vehicle, entity)
end

function Global.N_0x6adaabd3068c5235()
	return _in(0x6ADAABD3068C5235, _r, _ri)
end

function Global.N_0x6afd2cd753feef83(p0)
	return _in(0x6AFD2CD753FEEF83, _ts(p0), _r)
end

function Global.N_0x6b0e6172c9a4d902(p0)
	return _in(0x6B0E6172C9A4D902, p0)
end

function Global.N_0x6b1de27ee78e6a19(p0)
	return _in(0x6B1DE27EE78E6A19, p0)
end

function Global.N_0x6bfb12ce158e3dd4(p0)
	return _in(0x6BFB12CE158E3DD4, p0, _r)
end

function Global.N_0x6bff5f84102df80a(p0)
	return _in(0x6BFF5F84102DF80A, p0)
end

function Global.N_0x6c34f1208b8923fd(p0)
	return _in(0x6C34F1208B8923FD, p0, _r, _ri)
end

function Global.N_0x6cc86e78358d5119()
	return _in(0x6CC86E78358D5119)
end

function Global.N_0x6cd5a433374d4cfb(p0, p1)
	return _in(0x6CD5A433374D4CFB, p0, p1, _r)
end

function Global.N_0x6cd79468a1e595c6(inputGroup)
	return _in(0x6CD79468A1E595C6, inputGroup, _r)
end

function Global.N_0x6d4cb481fac835e8(p0, p1, p3)
	return _in(0x6D4CB481FAC835E8, p0, p1, _i, p3, _r)
end

--- Possible values:
-- act_cinema
-- am_mp_carwash_launch
-- am_mp_carwash_control
-- am_mp_property_ext
-- chop
-- fairgroundHub
-- launcher_BasejumpHeli
-- launcher_BasejumpPack
-- launcher_CarWash
-- launcher_golf
-- launcher_Hunting_Ambient
-- launcher_MrsPhilips
-- launcher_OffroadRacing
-- launcher_pilotschool
-- launcher_Racing
-- launcher_rampage
-- launcher_rampage
-- launcher_range
-- launcher_stunts
-- launcher_stunts
-- launcher_tennis
-- launcher_Tonya
-- launcher_Triathlon
-- launcher_Yoga
-- ob_mp_bed_low
-- ob_mp_bed_med
function Global.N_0x6d6840cee8845831(action)
	return _in(0x6D6840CEE8845831, _ts(action))
end

function Global.N_0x6d6af961b72728ae(vehicle)
	return _in(0x6D6AF961B72728AE, vehicle)
end

--- Console Hash: 0x60E29B78
function Global.N_0x6d8eac07506291fb(cargobob, p1)
	return _in(0x6D8EAC07506291FB, cargobob, p1)
end

function Global.N_0x6d955f6a9e0295b1(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x6D955F6A9E0295B1, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0x6dd8f5aa635eb4b2(p0, p1)
	return _in(0x6DD8F5AA635EB4B2, p0, p1, _i, _i)
end

function Global.N_0x6ddbf9dffc4ac080(p0)
	return _in(0x6DDBF9DFFC4AC080, p0)
end

function Global.N_0x6dee77aff8c21bd1()
	return _in(0x6DEE77AFF8C21BD1, _i, _i, _r)
end

function Global.N_0x6e04f06094c87047()
	return _in(0x6E04F06094C87047, _r, _ri)
end

function Global.N_0x6e0eb3eb47c8d7aa()
	return _in(0x6E0EB3EB47C8D7AA, _r)
end

--- Looks like a cousin of above function _6D6840CEE8845831 as it was found among them. Must be similar
-- Here are possible values of argument -
-- "ob_tv"
-- "launcher_Darts"
function Global.N_0x6e91b04e08773030(action)
	return _in(0x6E91B04E08773030, _ts(action))
end

--- sfink: sets bit in vehicle's structure, used by maintransition, fm_mission_controller, mission_race and a couple of other scripts. see dissassembly:
-- CVehicle *__fastcall sub_140CDAA10(signed int a1, char a2)
-- {
-- CVehicle *result; // rax@1
-- result = EntityAsCVehicle(a1);
-- if ( result )
-- {
-- result-&gt;field_886 &amp;= 0xEFu;
-- result-&gt;field_886 |= 16 * (a2 &amp; 1);
-- }
-- return result;
-- }
function Global.N_0x6ebfb22d646ffc18(vehicle, p1)
	return _in(0x6EBFB22D646FFC18, vehicle, p1)
end

function Global.N_0x6ef54ab721dc6242()
	return _in(0x6EF54AB721DC6242)
end

function Global.N_0x6f1554b0cc2089fa(p0)
	return _in(0x6F1554B0CC2089FA, p0)
end

function Global.N_0x6f2135b6129620c1(p0)
	return _in(0x6F2135B6129620C1, p0)
end

function Global.N_0x6f259f82d873b8b8()
	return _in(0x6F259F82D873B8B8, _r, _ri)
end

function Global.N_0x6f361b8889a792a3()
	return _in(0x6F361B8889A792A3)
end

function Global.N_0x6f44cbf56d79fac0(p0, p1)
	return _in(0x6F44CBF56D79FAC0, p0, p1, _r, _ri)
end

function Global.N_0x6f697a66ce78674e(team, toggle)
	return _in(0x6F697A66CE78674E, team, toggle)
end

function Global.N_0x6f72cd94f7b5b68c()
	return _in(0x6F72CD94F7B5B68C, _r, _ri)
end

--- Seems to have the same functionality as REGISTER_TEXT_LABEL_TO_SAVE?
-- GAMEPLAY::_6F7794F28C6B2535(&amp;a_0._f1, "tlPlateText");
-- GAMEPLAY::_6F7794F28C6B2535(&amp;a_0._f1C, "tlPlateText_pending");
-- GAMEPLAY::_6F7794F28C6B2535(&amp;a_0._f10B, "tlCarAppPlateText");
-- "tl" prefix sounds like "Text Label"
function Global.N_0x6f7794f28c6b2535(name)
	return _in(0x6F7794F28C6B2535, _i, _ts(name))
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x6fb7bb3607d27fa2()
	return _in(0x6FB7BB3607D27FA2, _r, _ri)
end

--- This function is hard-coded to always return 1.
function Global.N_0x6fcf8ddea146c45b(p0)
	return _in(0x6FCF8DDEA146C45B, p0, _r, _ri)
end

function Global.N_0x6fddad856e36988a(p0, p1)
	return _in(0x6FDDAD856E36988A, p0, p1)
end

--- - if (GAMEPLAY::_6FDDF453C0C756EC() || GAMEPLAY::IS_PC_VERSION()) {
function Global.N_0x6fddf453c0c756ec()
	return _in(0x6FDDF453C0C756EC, _r)
end

function Global.N_0x700569dba175a77c(p0)
	return _in(0x700569DBA175A77C, p0, _r, _ri)
end

function Global.N_0x701fda1e82076ba4()
	return _in(0x701FDA1E82076BA4)
end

function Global.N_0x702bc4d605522539(p0)
	return _in(0x702BC4D605522539, p0)
end

function Global.N_0x703cc7f60cbb2b57(p0)
	return _in(0x703CC7F60CBB2B57, p0)
end

function Global.N_0x703f12425eca8bf5(p0)
	return _in(0x703F12425ECA8BF5, p0, _r, _ri)
end

function Global.N_0x705a276ebff3133d()
	return _in(0x705A276EBFF3133D, _r)
end

function Global.N_0x70894bd0915c5bca(p0)
	return _in(0x70894BD0915C5BCA, p0, _r, _ri)
end

function Global.N_0x708bdd8cd795b043()
	return _in(0x708BDD8CD795B043, _r)
end

function Global.N_0x70b8ec8fc108a634(p0, p1)
	return _in(0x70B8EC8FC108A634, p0, p1)
end

function Global.N_0x70ea8da57840f9be(p0)
	return _in(0x70EA8DA57840F9BE, p0, _r)
end

--- Used in am_mp_property_ext and am_mp_property_int
function Global.N_0x715135f4b82ac90d(entity)
	return _in(0x715135F4B82AC90D, entity)
end

--- If the function fails, returns "Unknown".
-- Could be task (sequence) name. Needs more research.
function Global.N_0x717e4d1f2048376d(ped)
	return _in(0x717E4D1F2048376D, ped, _r, _s)
end

function Global.N_0x71862b1d855f32e1(p1, p2, p3)
	return _in(0x71862B1D855F32E1, _i, p1, p2, p3)
end

function Global.N_0x71b008056e5692d6()
	return _in(0x71B008056E5692D6)
end

--- It's 100% an IS_CUTSCENE_* native.
function Global.N_0x71b74d2ae19338d0(p0)
	return _in(0x71B74D2AE19338D0, p0, _r)
end

function Global.N_0x71bdb63dbaf8da59(p0)
	return _in(0x71BDB63DBAF8DA59, p0)
end

function Global.N_0x71e7b2e657449aad()
	return _in(0x71E7B2E657449AAD, _r, _ri)
end

function Global.N_0x722f5d28b61c5ea8(p0)
	return _in(0x722F5D28B61C5EA8, p0, _r, _ri)
end

function Global.N_0x723c1ce13fbfdb67(p0, p1)
	return _in(0x723C1CE13FBFDB67, p0, p1)
end

function Global.N_0x728c4cc7920cd102(p0)
	return _in(0x728C4CC7920CD102, p0, _r, _ri)
end

--- Appears to be a HIDE_* native.
function Global.N_0x72c1056d678bb7d8(weaponHash)
	return _in(0x72C1056D678BB7D8, _ch(weaponHash))
end

function Global.N_0x72d0706cd6ccdb58()
	return _in(0x72D0706CD6CCDB58)
end

function Global.N_0x72d918c99bcacc54(p0)
	return _in(0x72D918C99BCACC54, p0, _r)
end

function Global.N_0x72dd432f3cdfc0ee(posX, posY, posZ, radius, p4)
	return _in(0x72DD432F3CDFC0EE, posX, posY, posZ, radius, p4)
end

function Global.N_0x72de52178c291cb5()
	return _in(0x72DE52178C291CB5, _r, _ri)
end

function Global.N_0x72eb7ba9b69bf6ab()
	return _in(0x72EB7BA9B69BF6AB, _r, _ri)
end

--- NETWORK_CAN_R??? or NETWORK_CAN_S???
function Global.N_0x7303e27cc6532080(p0, p1, p2, p3, p5)
	return _in(0x7303E27CC6532080, p0, p1, p2, p3, _i, p5, _r)
end

--- AUDIO::_733ADF241531E5C2("inTunnel", 1.0);
-- AUDIO::_733ADF241531E5C2("inTunnel", 0.0);
-- I do not know as of yet what this does, but this was found in the scripts.
function Global.N_0x733adf241531e5c2(name, p1)
	return _in(0x733ADF241531E5C2, _ts(name), p1)
end

function Global.N_0x733c87d4ce22bea2(p0)
	return _in(0x733C87D4CE22BEA2, p0)
end

function Global.N_0x7350823473013c02(ped)
	return _in(0x7350823473013C02, ped, _r)
end

function Global.N_0x741a3d8380319a81()
	return _in(0x741A3D8380319A81)
end

function Global.N_0x742b58f723233ed9(p0)
	return _in(0x742B58F723233ED9, p0, _r, _ri)
end

--- NETWORK_IS_*
function Global.N_0x74698374c45701d2()
	return _in(0x74698374C45701D2, _r, _ri)
end

function Global.N_0x74a0fd0688f1ee45(p0)
	return _in(0x74A0FD0688F1EE45, p0, _r)
end

function Global.N_0x74bd83ea840f6bc9()
	return _in(0x74BD83EA840F6BC9, _r)
end

function Global.N_0x74c180030fde4b69(p0)
	return _in(0x74C180030FDE4B69, p0)
end

function Global.N_0x74de2e8739086740()
	return _in(0x74DE2E8739086740)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x74fb3e29e6d10fa9()
	return _in(0x74FB3E29E6D10FA9, _r, _ri)
end

--- bufferSize is 35 in the scripts.
function Global.N_0x7543bb439f63792b(bufferSize)
	return _in(0x7543BB439F63792B, _i, bufferSize, _r)
end

function Global.N_0x75773e11ba459e90(p0, p1)
	return _in(0x75773E11BA459E90, p0, p1)
end

function Global.N_0x759299c5bb31d2a9(p0, p1)
	return _in(0x759299C5BB31D2A9, p0, p1, _r, _ri)
end

function Global.N_0x759650634f07b6b4(p0)
	return _in(0x759650634F07B6B4, p0, _r)
end

function Global.N_0x75a16c3da34f1245(p0, p1)
	return _in(0x75A16C3DA34F1245, p0, p1)
end

function Global.N_0x75ba1cb3b7d40caf(ped, p1)
	return _in(0x75BA1CB3B7D40CAF, ped, p1)
end

function Global.N_0x75d3691713c3b05a()
	return _in(0x75D3691713C3B05A)
end

function Global.N_0x762db2d380b48d04(p0)
	return _in(0x762DB2D380B48D04, p0)
end

function Global.N_0x7669f9e39dc17063()
	return _in(0x7669F9E39DC17063)
end

function Global.N_0x7679cc1bcebe3d4c(p0, p1, p2)
	return _in(0x7679CC1BCEBE3D4C, p0, p1, p2)
end

--- Seems to take data that is returned from "_POP_SCALEFORM_MOVIE_FUNCTION" and checks to see if it's not null/empty.
-- "agency_heist3b.ysc", line 71836:
-- if (CONTROLS::IS_CONTROL_JUST_PRESSED(2, 201) || CONTROLS::IS_CONTROL_JUST_PRESSED(2, 237)) {
-- GRAPHICS::_PUSH_SCALEFORM_MOVIE_FUNCTION(l_46, "SET_INPUT_EVENT_SELECT");
-- l_45 = GRAPHICS::_POP_SCALEFORM_MOVIE_FUNCTION();
-- }
-- if (GRAPHICS::_0x768FF8961BA904D6(l_45)) {
-- v_13 = GRAPHICS::_0x2DE7EFA66B906036(l_45);
-- if (v_13 == 6) {
-- sub_73269(a_0);
-- }
-- }
function Global.N_0x768ff8961ba904d6(funcData)
	return _in(0x768FF8961BA904D6, funcData, _r)
end

function Global.N_0x769951e2455e2eb5()
	return _in(0x769951E2455E2EB5, _r, _ri)
end

function Global.N_0x76bf03fadbf154f5()
	return _in(0x76BF03FADBF154F5, _r, _ri)
end

--- 6 calls in the b617d scripts, removed identical lines:
-- AUDIO::_774BD811F656A122("RADIO_01_CLASS_ROCK", 1);
-- AUDIO::_774BD811F656A122(AUDIO::GET_RADIO_STATION_NAME(10), 0);
-- AUDIO::_774BD811F656A122(AUDIO::GET_RADIO_STATION_NAME(10), 1);
function Global.N_0x774bd811f656a122(radioStation, p1)
	return _in(0x774BD811F656A122, _ts(radioStation), p1)
end

function Global.N_0x77758139ec9b66c7(p0)
	return _in(0x77758139EC9B66C7, p0)
end

function Global.N_0x7792424aa0eac32e()
	return _in(0x7792424AA0EAC32E)
end

function Global.N_0x77f16b447824da6c(p0)
	return _in(0x77F16B447824DA6C, p0)
end

function Global.N_0x77f33f2ccf64b3aa(object, p1)
	return _in(0x77F33F2CCF64B3AA, object, p1)
end

function Global.N_0x77faddcbe3499df7(p0)
	return _in(0x77FADDCBE3499DF7, p0)
end

--- MulleDK19: This function is hard-coded to always return 1.
function Global.N_0x7808619f31ff22db()
	return _in(0x7808619F31FF22DB, _r, _ri)
end

--- p1: "MP_FEMALE_ACTION" found multiple times in the b617d scripts.
-- Console Hash: 0x83BAE814
function Global.N_0x781de8fa214e87d2(ped, p1)
	return _in(0x781DE8FA214E87D2, ped, _ts(p1))
end

function Global.N_0x78321bea235fd8cd(p0, p1)
	return _in(0x78321BEA235FD8CD, p0, p1, _r)
end

--- Normally returns true. Returns false briefly whilst putting on a helmet after getting onto a motorbike. Not sure what that's about.
function Global.N_0x784002a632822099(ped)
	return _in(0x784002A632822099, ped, _r)
end

function Global.N_0x784ba7e0eceb4178(p0, x, y, z)
	return _in(0x784BA7E0ECEB4178, p0, x, y, z)
end

function Global.N_0x78857fc65cadb909(p0)
	return _in(0x78857FC65CADB909, p0)
end

function Global.N_0x788e7fd431bd67f1(p0, p1, p2, p3, p4, p5)
	return _in(0x788E7FD431BD67F1, p0, p1, p2, p3, p4, p5)
end

function Global.N_0x78c0d93253149435()
	return _in(0x78C0D93253149435, _r, _ri)
end

function Global.N_0x78c4e9961db3eb5b(p0, p1)
	return _in(0x78C4E9961DB3EB5B, p0, p1)
end

--- Related to cutscene entities. Unsure about the use.
function Global.N_0x78e8e3a640178255(entity)
	return _in(0x78E8E3A640178255, entity)
end

function Global.N_0x793ff272d5b365f4()
	return _in(0x793FF272D5B365F4, _r, _ri)
end

function Global.N_0x796a877e459b99ea(p0, p1, p2, p3)
	return _in(0x796A877E459B99EA, p0, p1, p2, p3)
end

function Global.N_0x796a87b3b68d1f3d(p0)
	return _in(0x796A87B3B68D1F3D, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x79ab33f0fbfac40c(p0)
	return _in(0x79AB33F0FBFAC40C, p0)
end

function Global.N_0x79df7e806202ce01(p0, p1)
	return _in(0x79DF7E806202CE01, p0, p1)
end

function Global.N_0x7a42b2e236e71415()
	return _in(0x7A42B2E236E71415)
end

function Global.N_0x7ac24eab6d74118d(p0)
	return _in(0x7AC24EAB6D74118D, p0, _r)
end

function Global.N_0x7ac752103856fb20(p0)
	return _in(0x7AC752103856FB20, p0)
end

function Global.N_0x7ae0589093a2e088(p0, p1, p2, p3, p4, p5)
	return _in(0x7AE0589093A2E088, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.N_0x7b21e0bb01e8224a(p0)
	return _in(0x7B21E0BB01E8224A, p0)
end

function Global.N_0x7b226c785a52a0a9()
	return _in(0x7B226C785A52A0A9, _r, _ri)
end

--- Set's the string displayed when flag 3 (AudioSpeaker) active.
function Global.N_0x7b7723747ccb55b6(gamerTagId, string)
	return _in(0x7B7723747CCB55B6, gamerTagId, _ts(string))
end

function Global.N_0x7bf1a54ae67ac070(p0, p1, p2)
	return _in(0x7BF1A54AE67AC070, p0, p1, p2)
end

function Global.N_0x7c0043fdff6436bc(vehicle)
	return _in(0x7C0043FDFF6436BC, vehicle)
end

--- Used for cash gifts
-- Console Hash
function Global.N_0x7c4fccd2e4deb394()
	return _in(0x7C4FCCD2E4DEB394, _r)
end

function Global.N_0x7c9c0b1eeb1f9072(p0)
	return _in(0x7C9C0B1EEB1F9072, p0)
end

function Global.N_0x7cd934010e115c2c(ped)
	return _in(0x7CD934010E115C2C, ped)
end

--- From the scripts:
-- AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("PAIGE_PVG"));
-- AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("TALINA_PVG"));
-- AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("FEMALE_LOST_BLACK_PVG"));
-- AUDIO::_7CDC8C3B89F661B3(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("FEMALE_LOST_WHITE_PVG"));
function Global.N_0x7cdc8c3b89f661b3(playerPed, p1)
	return _in(0x7CDC8C3B89F661B3, playerPed, _ch(p1))
end

function Global.N_0x7d395ea61622e116(p0)
	return _in(0x7D395EA61622E116, p0)
end

function Global.N_0x7d41e9d2d17c5b2d(p0)
	return _in(0x7D41E9D2D17C5B2D, p0, _r, _ri)
end

--- what does this native do?
-- Here's some pseudocode of the internal setter function:
-- __int64 __fastcall sub_140CD86B4(signed int vehicle, char a2, char a3)
-- {
-- char v3; // di@1
-- char v4; // bl@1
-- __int64 result; // rax@1
-- __int16 v6; // cx@3
-- v3 = a3;
-- v4 = a2;
-- result = GetScriptHandleAddressVehicleCheck(vehicle);
-- if ( result )
-- {
-- if ( v3 || (v6 = *(_WORD *)(result + 0xDA), (v6 &amp; 0xFu) - 6 &lt;= 1) )
-- {
-- *(_BYTE *)(result + 0x89B) &amp;= 0xDFu;
-- *(_BYTE *)(result + 0x89B) |= 32 * (v4 &amp; 1);
-- }
-- }
-- return result;
-- }
-- Now it's time for you to find out :P
function Global.N_0x7d6f9a3ef26136a0(vehicle, p1, p2)
	return _in(0x7D6F9A3EF26136A0, vehicle, p1, p2)
end

--- i found this function just like VEHICLE::TRACK_VEHICLE_VISIBILITY
-- example:
-- PED::_0x7D7A2E43E74E2EB8(ped);// TRACK_PED_VISIBILITY
-- if (PED::IS_TRACKED_PED_VISIBLE(ped))
-- {
-- }
function Global.N_0x7d7a2e43e74e2eb8(p0)
	return _in(0x7D7A2E43E74E2EB8, p0)
end

function Global.N_0x7db53b37a2f211a0()
	return _in(0x7DB53B37A2F211A0, _r, _ri)
end

function Global.N_0x7e17be53e1aaabaf()
	return _in(0x7E17BE53E1AAABAF, _i, _i, _i)
end

function Global.N_0x7e2bd3ef6c205f09(p0, p1)
	return _in(0x7E2BD3EF6C205F09, p0, p1)
end

function Global.N_0x7e6946f68a38b74f(p0)
	return _in(0x7E6946F68A38B74F, p0, _r)
end

function Global.N_0x7ec6f9a478a6a512()
	return _in(0x7EC6F9A478A6A512)
end

--- _PLAYSTATS_ROB_ARMOURD_TRUCK
function Global.N_0x7eec2a316c250073(p0, p1, p2)
	return _in(0x7EEC2A316C250073, p0, p1, p2)
end

function Global.N_0x7f2c4cdf2e82df4c(p0)
	return _in(0x7F2C4CDF2E82DF4C, p0, _r)
end

function Global.N_0x7f2f4f13ac5257ef(p0)
	return _in(0x7F2F4F13AC5257EF, p0, _r)
end

function Global.N_0x7f8f6405f4777af6(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x7F8F6405F4777AF6, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, _r, _rf)
end

function Global.N_0x7f96f23fa9b73327(modelHash)
	return _in(0x7F96F23FA9B73327, _ch(modelHash))
end

function Global.N_0x7fa5d82b8f58ec06()
	return _in(0x7FA5D82B8F58EC06, _r, _ri)
end

function Global.N_0x7fcc39c46c3c03bd(p0)
	return _in(0x7FCC39C46C3C03BD, p0, _r)
end

function Global.N_0x7fd2990af016795e(p2, p3, p4)
	return _in(0x7FD2990AF016795E, _i, _i, p2, p3, p4, _r, _ri)
end

function Global.N_0x80054d7fcc70eec6(p0)
	return _in(0x80054D7FCC70EEC6, p0)
end

function Global.N_0x806058bbdc136e06()
	return _in(0x806058BBDC136E06)
end

function Global.N_0x8098c8d6597aae18(p0)
	return _in(0x8098C8D6597AAE18, p0, _r, _ri)
end

--- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.N_0x80c2fd58d720c801(inputGroup, control, p2)
	return _in(0x80C2FD58D720C801, inputGroup, control, p2, _r, _s)
end

--- gets some camera fov
function Global.N_0x80ec114669daeff4()
	return _in(0x80EC114669DAEFF4, _r, _rf)
end

function Global.N_0x80fe4f3ab4e1b62a()
	return _in(0x80FE4F3AB4E1B62A)
end

function Global.N_0x8147fff6a718e1ad(p0)
	return _in(0x8147FFF6A718E1AD, p0, _r, _ri)
end

--- UI::_817B86108EB94E51(1, &amp;g_189F36._f10CD1[0/*16*/], &amp;g_189F36._f10CD1[1/*16*/], &amp;g_189F36._f10CD1[2/*16*/], &amp;g_189F36._f10CD1[3/*16*/], &amp;g_189F36._f10CD1[4/*16*/], &amp;g_189F36._f10CD1[5/*16*/], &amp;g_189F36._f10CD1[6/*16*/], &amp;g_189F36._f10CD1[7/*16*/]);
function Global.N_0x817b86108eb94e51(p0)
	return _in(0x817B86108EB94E51, p0, _i, _i, _i, _i, _i, _i, _i, _i)
end

function Global.N_0x81cbae94390f9f89()
	return _in(0x81CBAE94390F9F89)
end

--- "GET_OBJ_ENTITY" seems highly unlikely.
function Global.N_0x82377b65e943f72d(p0)
	return _in(0x82377B65E943F72D, p0, _r)
end

--- Only found 2 times in decompiled scripts. Not a whole lot to go off of.
-- GAMEPLAY::_8269816F6CFD40F8(&amp;a_0._f1F5A._f6[0/*8*/], "TEMPSTAT_LABEL"); // gets saved in a struct called "g_SaveData_STRING_ScriptSaves"
-- GAMEPLAY::_8269816F6CFD40F8(&amp;a_0._f4B4[v_1A/*8*/], &amp;v_5); // where v_5 is "Name0" thru "Name9", gets saved in a struct called "OUTFIT_Name"
function Global.N_0x8269816f6cfd40f8(name)
	return _in(0x8269816F6CFD40F8, _i, _ts(name))
end

--- HUD_COLOUR_CONTROLLER_CHOP = 174;
-- UI::GET_HUD_COLOUR(174, &amp;v_6, &amp;v_7, &amp;v_8, &amp;v_9);
-- CONTROLS::_8290252FFF36ACB5(0, v_6, v_7, v_8);
function Global.N_0x8290252fff36acb5(p0, red, green, blue)
	return _in(0x8290252FFF36ACB5, p0, red, green, blue)
end

function Global.N_0x82cedc33687e1f50(p0)
	return _in(0x82CEDC33687E1F50, p0)
end

function Global.N_0x82ebb79e258fa2b7(entity, interiorID)
	return _in(0x82EBB79E258FA2B7, entity, interiorID)
end

--- only documented to be continued...
function Global.N_0x82fde6a57ee4ee44(ped, weaponhash, p2, p3, p4, p5)
	return _in(0x82FDE6A57EE4EE44, ped, _ch(weaponhash), p2, p3, p4, p5, _r, _ri)
end

function Global.N_0x83a169eabcdb10a2(p0, p1)
	return _in(0x83A169EABCDB10A2, p0, p1)
end

function Global.N_0x83b8201ed82a9a2d(p0, p1, p2, p3)
	return _in(0x83B8201ED82A9A2D, p0, p1, p2, p3)
end

--- Saves a JSON file? It might even be saving it to the Rockstar Cloud, but I have no way of verifying this
-- "shrinkletter.c4", line ~378:
-- DATAFILE::DATAFILE_CREATE();
-- v_5 = DATAFILE::_GET_ROOT_OBJECT();
-- DATAFILE::_OBJECT_VALUE_ADD_INTEGER(v_5, "in", a_2);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "st", &amp;a_2._f1);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "mp", &amp;a_2._f2);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "ms", &amp;a_2._f3);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "sc", &amp;a_2._f5);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "pr", &amp;a_2._f6);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "fa", &amp;a_2._f7);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "sm", &amp;a_2._f8);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "kp", &amp;a_2._f9);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "sv", &amp;a_2._fA);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "yo", &amp;a_2._fB);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "fi", &amp;a_2._fC);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "rc", &amp;a_2._fD);
-- DATAFILE::_OBJECT_VALUE_ADD_STRING(v_5, "co", &amp;a_2._fE);
-- DATAFILE::_OBJECT_VALUE_ADD_INTEGER(v_5, "su", a_2._fF);
-- DATAFILE::_83BCCE3224735F05("gta5/psych/index.json"); // saves the file?
function Global.N_0x83bcce3224735f05(filename)
	return _in(0x83BCCE3224735F05, _ts(filename), _r)
end

function Global.N_0x83f28ce49fbbffba(p0, p1, p2)
	return _in(0x83F28CE49FBBFFBA, p0, p1, p2, _r)
end

function Global.N_0x83fe8d7229593017()
	return _in(0x83FE8D7229593017)
end

--- sfink: from scripts:
-- func_720(socialclub::_0x8416FE4E4629D7D7("bIgnoreCheaterOverride"));
-- func_719(socialclub::_0x8416FE4E4629D7D7("bIgnoreBadSportOverride"));
function Global.N_0x8416fe4e4629d7d7(p0)
	return _in(0x8416FE4E4629D7D7, _ts(p0), _r)
end

function Global.N_0x84698ab38d0c6636(hash)
	return _in(0x84698AB38D0C6636, _ch(hash), _r)
end

function Global.N_0x84de3b5fb3e666f0(p0)
	return _in(0x84DE3B5FB3E666F0, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x851cd923176eba7c()
	return _in(0x851CD923176EBA7C)
end

function Global.N_0x85535acf97fc0969(p0)
	return _in(0x85535ACF97FC0969, p0, _r, _ri)
end

function Global.N_0x855bc38818f6f684()
	return _in(0x855BC38818F6F684, _r)
end

function Global.N_0x85a0ef54a500882c(p0)
	return _in(0x85A0EF54A500882C, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0x85b6c850546fdde2(p0, p1, p2, p3, p4)
	return _in(0x85B6C850546FDDE2, p0, p1, p2, p3, p4, _r)
end

function Global.N_0x85f6c9aba1de2bcf()
	return _in(0x85F6C9ABA1DE2BCF, _r, _ri)
end

function Global.N_0x869daacbbe9fa006()
	return _in(0x869DAACBBE9FA006, _r, _ri)
end

function Global.N_0x86e0660e4f5c956d()
	return _in(0x86E0660E4F5C956D)
end

function Global.N_0x876928dddfccc9cd()
	return _in(0x876928DDDFCCC9CD, _r, _ri)
end

function Global.N_0x87e0052f08bd64e6(p0, p1)
	return _in(0x87E0052F08BD64E6, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x87e5c46c187fe0ae(p0, p1)
	return _in(0x87E5C46C187FE0AE, p0, p1, _r, _ri)
end

function Global.N_0x8806cebfabd3ce05(p0)
	return _in(0x8806CEBFABD3CE05, p0, _r)
end

function Global.N_0x8817605c2ba76200()
	return _in(0x8817605C2BA76200)
end

function Global.N_0x883d79c4071e18b3()
	return _in(0x883D79C4071E18B3, _r, _ri)
end

function Global.N_0x88578f6ec36b4a3a(p0, p1)
	return _in(0x88578F6EC36B4A3A, p0, p1, _r, _ri)
end

function Global.N_0x886913bbeaca68c1(p0)
	return _in(0x886913BBEACA68C1, _ii(p0) --[[ may be optional ]], _r, _ri)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x88b588b41ff7868e()
	return _in(0x88B588B41FF7868E, _r, _ri)
end

function Global.N_0x88bc673ca9e0ae99(vehicle, p1)
	return _in(0x88BC673CA9E0AE99, vehicle, p1)
end

--- SET_PED_PATH_*
-- Could be the move speed on the path. Needs testing.
-- Default is 1.0 and maximum is 10.0
function Global.N_0x88e32db8c1a4aa4b(ped, p1)
	return _in(0x88E32DB8C1A4AA4B, ped, p1)
end

--- SET_LOCAL_PLAYER_*
function Global.N_0x88eaec617cd26926(p0, p1)
	return _in(0x88EAEC617CD26926, _ch(p0), p1)
end

--- Something to do with time, used in context:
-- NETWORK::GET_TIME_DIFFERENCE(NETWORK::_89023FBBF9200E9F(), ... )
-- sfink: returns the same value as NETWORK::GET_NETWORK_TIME in freemode.
function Global.N_0x89023fbbf9200e9f()
	return _in(0x89023FBBF9200E9F, _r, _ri)
end

function Global.N_0x89215ec747df244a(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x89215EC747DF244A, p0, p1, p2, p3, p4, p5, p6, p7, p8, _r, _ri)
end

function Global.N_0x892b6ab8f33606f5(p0, p1)
	return _in(0x892B6AB8F33606F5, p0, p1)
end

function Global.N_0x8951eb9c6906d3c8()
	return _in(0x8951EB9C6906D3C8)
end

function Global.N_0x897433d292b44130()
	return _in(0x897433D292B44130, _i, _i, _r)
end

function Global.N_0x89d630cf5ea96d23(vehicle, entity)
	return _in(0x89D630CF5EA96D23, vehicle, entity, _r)
end

function Global.N_0x8a35c742130c6080(p0)
	return _in(0x8A35C742130C6080, p0, _i, _i)
end

--- One call found in the b617d scripts:
-- AUDIO::_8A694D7A68F8DC38(NETWORK::NET_TO_PED(l_3989._f26F[0/*1*/]), "CONV_INTERRUPT_QUIT_IT", "LESTER");
function Global.N_0x8a694d7a68f8dc38(p0, p1, p2)
	return _in(0x8A694D7A68F8DC38, p0, _ts(p1), _ts(p2))
end

--- REQUEST_*
-- Something to do with interiors that have been loaded.
-- STREAMING::_8A7A40100EDFEC58(l_13BC, "V_FIB01_cur_elev");
-- STREAMING::_8A7A40100EDFEC58(l_13BC, "limbo");
-- STREAMING::_8A7A40100EDFEC58(l_13BB, "V_Office_gnd_lifts");
-- STREAMING::_8A7A40100EDFEC58(l_13BB, "limbo");
-- STREAMING::_8A7A40100EDFEC58(l_13BC, "v_fib01_jan_elev");
-- STREAMING::_8A7A40100EDFEC58(l_13BC, "limbo");
function Global.N_0x8a7a40100edfec58(interiorID, roomName)
	return _in(0x8A7A40100EDFEC58, interiorID, _ts(roomName))
end

function Global.N_0x8aa464d4e0f6accd()
	return _in(0x8AA464D4E0F6ACCD, _r, _ri)
end

function Global.N_0x8aa9180de2fedd45(vehicle, p1)
	return _in(0x8AA9180DE2FEDD45, vehicle, p1)
end

function Global.N_0x8abe8608576d9ce3(p0, p1, p2, p3)
	return _in(0x8ABE8608576D9CE3, p0, p1, p2, p3, _r, _rf)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x8b0c2964ba471961()
	return _in(0x8B0C2964BA471961, _r, _ri)
end

function Global.N_0x8bbacbf51da047a8(p0)
	return _in(0x8BBACBF51DA047A8, p0)
end

function Global.N_0x8bd6c6dea20e82c6(p0)
	return _in(0x8BD6C6DEA20E82C6, p0, _r, _ri)
end

--- only documented to be continued...
-- Vector3 func_164(Vector3 vParam0, Vector3 vParam1)
-- {
-- return vParam0.y * vParam1.z - vParam0.z * vParam1.y, vParam0.z * vParam1.x - vParam0.x * vParam1.z, vParam0.x * vParam1.y - vParam0.y * vParam1.x;
-- }
-- float func_67(vector3 vParam0, vector3 vParam1)
-- {
-- return vParam0.x * vParam1.x + vParam0.y * vParam1.y + vParam0.z * vParam1.z;
-- }
-- float p3; Vector3 p4;
-- _0x64D91CED(coords0to.x, coords0to.y, coords0to.z, &amp;p3, &amp;p4);
function Global.N_0x8bdc7bfc57a81e76(x, y, z)
	return _in(0x8BDC7BFC57A81E76, x, y, z, _f, _v, _r)
end

function Global.N_0x8bf907833be275de(p0, p1)
	return _in(0x8BF907833BE275DE, p0, p1)
end

function Global.N_0x8bfceb5ea1b161b6()
	return _in(0x8BFCEB5EA1B161B6, _r, _ri)
end

function Global.N_0x8c4f3bf23b6237db(ped, p1, p2)
	return _in(0x8C4F3BF23B6237DB, ped, p1, p2, _r, _ri)
end

function Global.N_0x8c8d2739ba44af0f(p0)
	return _in(0x8C8D2739BA44AF0F, p0, _r)
end

function Global.N_0x8cc469ab4d349b7c(p0, p1, p2)
	return _in(0x8CC469AB4D349B7C, p0, _ts(p1), _ii(p2) --[[ may be optional ]], _r)
end

--- console hash: 0x19EC0001
function Global.N_0x8cde909a0370bb3a(p0)
	return _in(0x8CDE909A0370BB3A, p0)
end

--- Maybe NETWORK_IS_PSN_AVAILABLE as it only applies to the PS4 version.
function Global.N_0x8d11e61a4abf49cc()
	return _in(0x8D11E61A4ABF49CC, _r)
end

function Global.N_0x8d30f648014a92b5()
	return _in(0x8D30F648014A92B5, _r, _ri)
end

--- GAMEPLAY::_8D74E26F54B4E5C3("");
function Global.N_0x8d74e26f54b4e5c3(p0)
	return _in(0x8D74E26F54B4E5C3, _ts(p0))
end

function Global.N_0x8d7a43ec6a5fea45(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x8D7A43EC6A5FEA45, p0, p1, p2, p3, p4, p5, p6, p7, p8, _r, _ri)
end

--- Example of usage:
-- v_2 = SCRIPT::_30B4FA1C82DD4B9F(); // int _GET_ID_OF_NEXT_SCRIPT_IN_ENUMERATION()
-- CUTSCENE::_8D9DF6ECA8768583(v_2);
function Global.N_0x8d9df6eca8768583(p0)
	return _in(0x8D9DF6ECA8768583, p0)
end

function Global.N_0x8e2a065abdae6994()
	return _in(0x8E2A065ABDAE6994)
end

function Global.N_0x8ec74ceb042e7cff(p0)
	return _in(0x8EC74CEB042E7CFF, p0)
end

function Global.N_0x8ef5573a1f801a5c(p0)
	return _in(0x8EF5573A1F801A5C, p0, _i, _i, _r)
end

--- Example, only occurrence in the scripts:
-- UI::_8EFCCF6EC66D85E4(&amp;v_23, &amp;v_13, &amp;v_13, 1, v_34);
function Global.N_0x8efccf6ec66d85e4(p3, p4)
	return _in(0x8EFCCF6EC66D85E4, _i, _i, _i, p3, p4, _r, _ri)
end

function Global.N_0x8f08017f9d7c47bd(p0, p2)
	return _in(0x8F08017F9D7C47BD, p0, _i, p2, _r)
end

function Global.N_0x8f5ea1c01d65a100(p0)
	return _in(0x8F5EA1C01D65A100, p0, _r)
end

--- No observed effect.
function Global.N_0x8f719973e1445ba2(vehicle, p1)
	return _in(0x8F719973E1445BA2, vehicle, p1)
end

function Global.N_0x8fa9c42fc5d7c64b(p0, p1, p2, p3, p4, p5)
	return _in(0x8FA9C42FC5D7C64B, p0, p1, p2, p3, p4, p5)
end

--- Appears only in fm_mission_controller and used only 3 times.
-- ped was always PLAYER_PED_ID()
-- p1 was always true
-- p2 was always true
function Global.N_0x8fd89a6240813fd0(ped, p1, p2)
	return _in(0x8FD89A6240813FD0, ped, p1, p2)
end

--- SET_GPS_???
function Global.N_0x900086f371220b6f(p0, p1, p2)
	return _in(0x900086F371220B6F, p0, p1, p2)
end

function Global.N_0x9007a2f21dc108d4(p0, p1)
	return _in(0x9007A2F21DC108D4, p0, p1)
end

function Global.N_0x9049fe339d5f6f6f()
	return _in(0x9049FE339D5F6F6F, _r, _ri)
end

function Global.N_0x90a6526cf0381030(p0, p2, p3)
	return _in(0x90A6526CF0381030, p0, _i, p2, p3, _r)
end

function Global.N_0x90a78ecaa4e78453()
	return _in(0x90A78ECAA4E78453, _r, _ri)
end

function Global.N_0x90d0622866e80445(p0, p1)
	return _in(0x90D0622866E80445, p0, _ts(p1))
end

--- return bool according to scripts
function Global.N_0x9135584d09a3437e()
	return _in(0x9135584D09A3437E, _r, _ri)
end

function Global.N_0x918c7b2d2ff3928b(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x918C7B2D2FF3928B, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end

function Global.N_0x919b3c98ed8292f9(p0)
	return _in(0x919B3C98ED8292F9, p0, _r)
end

function Global.N_0x91a0bd635321f145(vehicle, p1)
	return _in(0x91A0BD635321F145, vehicle, p1)
end

--- bool?
-- am_crate_drop.c
-- &lt;...&gt;
-- if (network::_network_are_ros_available())
-- {
-- if (network::_0x91B87C55093DE351())
-- &lt;..&gt;
function Global.N_0x91b87c55093de351()
	return _in(0x91B87C55093DE351, _r, _ri)
end

function Global.N_0x91d6dd290888cbab()
	return _in(0x91D6DD290888CBAB, _r)
end

function Global.N_0x91ef6ee6419e5b97(p0)
	return _in(0x91EF6EE6419E5B97, p0)
end

function Global.N_0x920d853f3e17f1da(interiorID, roomHashKey)
	return _in(0x920D853F3E17F1DA, interiorID, _ch(roomHashKey))
end

function Global.N_0x921ce12c489c4c41(PlayerID)
	return _in(0x921CE12C489C4C41, PlayerID, _r)
end

function Global.N_0x9237e334f6e43156(p0)
	return _in(0x9237E334F6E43156, p0, _r, _ri)
end

function Global.N_0x9245e81072704b8a(p0)
	return _in(0x9245E81072704B8A, p0)
end

function Global.N_0x92523b76657a517d(p0, p1)
	return _in(0x92523B76657A517D, p0, p1, _r, _ri)
end

--- I can 100% confirm this is some kind of START_* native.
-- Next character in the name is either C, D or E.
-- Used only once in the scripts (benchmark.ysc).
function Global.N_0x92790862e36c2ada()
	return _in(0x92790862E36C2ADA)
end

function Global.N_0x92aefb5f6e294023(object, p1, p2)
	return _in(0x92AEFB5F6E294023, object, p1, p2)
end

function Global.N_0x92ccc17a7a2285da()
	return _in(0x92CCC17A7A2285DA)
end

function Global.N_0x92da6e70ef249bd1(p0, p1)
	return _in(0x92DA6E70EF249BD1, _ts(p0), _ii(p1) --[[ may be optional ]], _r)
end

--- Unknown.
-- Seems to return either 0, 1, or -1.
function Global.N_0x930de22f07b1cce3(p0)
	return _in(0x930DE22F07B1CCE3, p0, _r, _ri)
end

function Global.N_0x933bbeeb8c61b5f4()
	return _in(0x933BBEEB8C61B5F4, _r, _ri)
end

function Global.N_0x941e5306bcd7c2c7()
	return _in(0x941E5306BCD7C2C7, _r, _ri)
end

function Global.N_0x94538037ee44f5cf(p0)
	return _in(0x94538037EE44F5CF, p0)
end

function Global.N_0x9465e683b12d3f6b()
	return _in(0x9465E683B12D3F6B)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0x9489659372a81585()
	return _in(0x9489659372A81585, _r, _ri)
end

function Global.N_0x949f397a288b28b3(p0)
	return _in(0x949F397A288B28B3, p0)
end

--- NETWORK_IS_*
function Global.N_0x94a8394d150b013a()
	return _in(0x94A8394D150B013A, _r, _ri)
end

--- Needs more research. Possibly used to calculate the "mask" when calling "STAT_SET_MASKED_INT"?
function Global.N_0x94f12abf9c79e339(p0)
	return _in(0x94F12ABF9C79E339, p0, _r, _ri)
end

function Global.N_0x952f06beecd775cc(p0, p1, p2, p3)
	return _in(0x952F06BEECD775CC, p0, p1, p2, p3)
end

function Global.N_0x953563ce563143af(p0)
	return _in(0x953563CE563143AF, p0, _r, _ri)
end

function Global.N_0x95a7dabddbb78ae7()
	return _in(0x95A7DABDDBB78AE7, _i, _i)
end

--- in the decompiled scripts, seems to be always called on the vehicle right after being attached to a trailer.
function Global.N_0x95cf53b3d687f9fa(vehicle)
	return _in(0x95CF53B3D687F9FA, vehicle)
end

function Global.N_0x95cf81bd06ee1887()
	return _in(0x95CF81BD06EE1887)
end

function Global.N_0x9614b71f8adb982b()
	return _in(0x9614B71F8ADB982B, _r, _ri)
end

function Global.N_0x966dd84fb6a46017()
	return _in(0x966DD84FB6A46017)
end

function Global.N_0x967278682cb6967a(p0, p1, p2, p3)
	return _in(0x967278682CB6967A, p0, p1, p2, p3)
end

function Global.N_0x9689123e3f213aa5()
	return _in(0x9689123E3F213AA5, _r)
end

--- SET_VEHICLE_DOORS_LOCKED_FOR_*
function Global.N_0x9737a37136f07e75(vehicle, toggle)
	return _in(0x9737A37136F07E75, vehicle, toggle)
end

function Global.N_0x973d76aa760a6cb6(p0)
	return _in(0x973D76AA760A6CB6, p0)
end

function Global.N_0x975d66a0bc17064c(p0)
	return _in(0x975D66A0BC17064C, p0)
end

--- p4 and p5 are always 0 in scripts
function Global.N_0x9769f811d1785b03(player, x, y, z, p4, p5)
	return _in(0x9769F811D1785B03, player, x, y, z, p4, p5)
end

--- gets some camera far depth of field
function Global.N_0x9780f32bcaf72431()
	return _in(0x9780F32BCAF72431, _r, _rf)
end

function Global.N_0x97e7e2c04245115b(p0)
	return _in(0x97E7E2C04245115B, p0)
end

function Global.N_0x98215325a695e78a(p0)
	return _in(0x98215325A695E78A, p0)
end

--- It's called after 0xD3A10FC7FD8D98CD and 0xF1CEA8A4198D8E9A
-- p0 was always "CELEBRATION_WINNER"
function Global.N_0x98c4fe6ec34154ca(p0, ped, p2, posX, posY, posZ)
	return _in(0x98C4FE6EC34154CA, _ts(p0), ped, p2, posX, posY, posZ, _r)
end

function Global.N_0x98e2bc1ca26287c3()
	return _in(0x98E2BC1CA26287C3)
end

function Global.N_0x98edf76a7271e4f2()
	return _in(0x98EDF76A7271E4F2)
end

function Global.N_0x9911f4a24485f653(p0)
	return _in(0x9911F4A24485F653, p0)
end

function Global.N_0x993cbe59d350d225(p0)
	return _in(0x993CBE59D350D225, p0, _r)
end

function Global.N_0x996dd1e1e02f1008()
	return _in(0x996DD1E1E02F1008, _r, _ri)
end

function Global.N_0x99ac7f0d8b9c893d(p0)
	return _in(0x99AC7F0D8B9C893D, p0)
end

function Global.N_0x99ad4cccb128cbc9(vehicle)
	return _in(0x99AD4CCCB128CBC9, vehicle)
end

--- console hash: 0x99F58A07
function Global.N_0x99b72c7abde5c910(ped, player)
	return _in(0x99B72C7ABDE5C910, ped, player, _r)
end

function Global.N_0x99cad8e7afdb60fa(vehicle, p1, p2)
	return _in(0x99CAD8E7AFDB60FA, vehicle, p1, p2)
end

function Global.N_0x9a62ec95ae10e011()
	return _in(0x9A62EC95AE10E011, _r, _ri)
end

--- Example gotten from chinese2.c4
-- VEHICLE::_9A75585FB2E54FAD(2004.4471435546875, 3076.806640625, 46.60689926147461, 10.0);
function Global.N_0x9a75585fb2e54fad(p0, p1, p2, p3)
	return _in(0x9A75585FB2E54FAD, p0, p1, p2, p3)
end

function Global.N_0x9a77dfd295e29b09(p0, p1)
	return _in(0x9A77DFD295E29B09, p0, p1)
end

function Global.N_0x9aa47fff660cb932(p0, p1)
	return _in(0x9AA47FFF660CB932, p0, p1)
end

function Global.N_0x9ac92eed5e4793ab()
	return _in(0x9AC92EED5E4793AB)
end

function Global.N_0x9b079e5221d984d3(p0)
	return _in(0x9B079E5221D984D3, p0)
end

function Global.N_0x9b2bd3773123ea2f(type, toggle)
	return _in(0x9B2BD3773123EA2F, type, toggle)
end

function Global.N_0x9b4bd21d69b1e609()
	return _in(0x9B4BD21D69B1E609)
end

function Global.N_0x9b6e70c5ceef4eeb(p0)
	return _in(0x9B6E70C5CEEF4EEB, p0, _r, _ri)
end

function Global.N_0x9ba001cb45cbf627(doorHash, heading, p2, p3)
	return _in(0x9BA001CB45CBF627, _ch(doorHash), heading, p2, p3)
end

--- Console Hash: 0x50CDB295
function Global.N_0x9bddc73cc6a115d4(vehicle, p1, p2)
	return _in(0x9BDDC73CC6A115D4, vehicle, p1, p2)
end

function Global.N_0x9becd4b9fef3f8a6(vehicle, p1)
	return _in(0x9BECD4B9FEF3F8A6, vehicle, p1)
end

--- Gets some kind of data related to missions like the online player created races n stuff
function Global.N_0x9bf438815f5d96ea(p0, p1, p3, p4, p5)
	return _in(0x9BF438815F5D96EA, p0, p1, _i, p3, p4, p5, _r)
end

function Global.N_0x9c6a6c19b6c0c496(p0, p1)
	return _in(0x9C6A6C19B6C0C496, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0x9cb0bfa7a9342c3d(p0, p1)
	return _in(0x9CB0BFA7A9342C3D, p0, p1, _r)
end

--- Only appeared in Golf &amp; Golf_mp. Parameters were all ptrs
function Global.N_0x9cfdd90b2b844bf7(p0, p1, p2, p3, p4)
	return _in(0x9CFDD90B2B844BF7, p0, p1, p2, p3, p4)
end

function Global.N_0x9d3af56e94c9ae98(p0, p1)
	return _in(0x9D3AF56E94C9AE98, p0, p1)
end

function Global.N_0x9d728c1e12bf5518(p0)
	return _in(0x9D728C1E12BF5518, p0, _r, _ri)
end

function Global.N_0x9d7afcbf21c51712(p0)
	return _in(0x9D7AFCBF21C51712, p0)
end

function Global.N_0x9d8d44adbba61ef2(p0)
	return _in(0x9D8D44ADBBA61EF2, p0)
end

--- Found in the b617d scripts:
-- PED::_9DBA107B4937F809(v_7, "trevor_heist_cover_2h");
function Global.N_0x9dba107b4937f809(p0, p1)
	return _in(0x9DBA107B4937F809, p0, _ts(p1))
end

function Global.N_0x9e30e91fb03a2caf()
	return _in(0x9E30E91FB03A2CAF, _i, _i, _r)
end

function Global.N_0x9e4cfff989258472()
	return _in(0x9E4CFFF989258472)
end

--- Only found 4 times in Rockstar scripts.
-- Clearly has something to do with Cutscenes.
function Global.N_0x9e6542f0ce8e70a3(toggle)
	return _in(0x9E6542F0CE8E70A3, toggle)
end

--- UI::0x7AD67C95("Gallery");
-- UI::0x7AD67C95("Missions");
-- UI::0x7AD67C95("General");
-- UI::0x7AD67C95("Playlists");
function Global.N_0x9e778248d6685fe0(p0)
	return _in(0x9E778248D6685FE0, _ts(p0))
end

--- p2 - mainly set as false in scripts
function Global.N_0x9ebc85ed0fffe51c(entity, p1, p2)
	return _in(0x9EBC85ED0FFFE51C, entity, p1, p2)
end

function Global.N_0x9edd76e87d5d51ba(player)
	return _in(0x9EDD76E87D5D51BA, player)
end

function Global.N_0x9f3f689b814f2599(vehicle, p1)
	return _in(0x9F3F689B814F2599, vehicle, p1)
end

function Global.N_0x9f5e6bb6b34540da(p0)
	return _in(0x9F5E6BB6B34540DA, p0)
end

function Global.N_0x9f6e2821885caee2(p0, p1, p2)
	return _in(0x9F6E2821885CAEE2, p0, p1, p2, _i, _i, _r)
end

function Global.N_0x9fedf86898f100e9()
	return _in(0x9FEDF86898F100E9, _r, _ri)
end

function Global.N_0xa01bc64dd4bfbbac(vehicle, p1)
	return _in(0xA01BC64DD4BFBBAC, vehicle, p1, _r, _ri)
end

--- gets some camera near depth of field
function Global.N_0xa03502fc581f7d9b()
	return _in(0xA03502FC581F7D9B, _r, _rf)
end

function Global.N_0xa049a5be0f04f2f8()
	return _in(0xA049A5BE0F04F2F8, _r, _ri)
end

function Global.N_0xa071e0ed98f91286(p0, p1)
	return _in(0xA071E0ED98F91286, p0, p1)
end

function Global.N_0xa08fe5e49bdc39dd(p0, p1, p2)
	return _in(0xA08FE5E49BDC39DD, p0, p1, p2)
end

function Global.N_0xa097ab275061fb21()
	return _in(0xA097AB275061FB21, _r, _ri)
end

function Global.N_0xa09f896ce912481f(p0)
	return _in(0xA09F896CE912481F, p0, _r, _ri)
end

function Global.N_0xa0cefcea390aab9b(p0)
	return _in(0xA0CEFCEA390AAB9B, p0)
end

function Global.N_0xa0f93d5465b3094d(p0)
	return _in(0xA0F93D5465B3094D, _ii(p0) --[[ may be optional ]], _r)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0xa0fa4ec6a05da44e()
	return _in(0xA0FA4EC6A05DA44E, _r, _ri)
end

function Global.N_0xa0fe76168a189ddb()
	return _in(0xA0FE76168A189DDB, _r, _ri)
end

function Global.N_0xa134777ff7f33331(p0, p1)
	return _in(0xA134777FF7F33331, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0xa13c11e1b5c06bfc()
	return _in(0xA13C11E1B5C06BFC)
end

function Global.N_0xa13e93403f26c812(p0)
	return _in(0xA13E93403F26C812, p0, _r, _ri)
end

function Global.N_0xa1607996431332df(netId)
	return _in(0xA1607996431332DF, netId, _r)
end

function Global.N_0xa17bad153b51547e(cargobob, p1)
	return _in(0xA17BAD153B51547E, cargobob, p1)
end

function Global.N_0xa1c996c2a744262e(p0)
	return _in(0xA1C996C2A744262E, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0xa1e5e0204a6fcc70()
	return _in(0xA1E5E0204A6FCC70)
end

--- MulleDK19: This function is hard-coded to always return 1.
function Global.N_0xa213b11dff526300()
	return _in(0xA213B11DFF526300, _r, _ri)
end

function Global.N_0xa21c118553bbdf02(p0)
	return _in(0xA21C118553BBDF02, p0)
end

function Global.N_0xa238192f33110615()
	return _in(0xA238192F33110615, _i, _i, _i, _r)
end

function Global.N_0xa2767257a320fc82(p0, p1)
	return _in(0xA2767257A320FC82, p0, p1)
end

function Global.N_0xa277800a9eae340e()
	return _in(0xA277800A9EAE340E, _r, _ri)
end

function Global.N_0xa2c1f5e92afe49ed()
	return _in(0xA2C1F5E92AFE49ED)
end

--- Needs more research. If the "phone_cam12" filter is applied, this function is called with "TRUE"; otherwise, "FALSE".
-- Example (XBOX 360):
-- // check current filter selection
-- if (GAMEPLAY::ARE_STRINGS_EQUAL(getElem(g_2471024, &amp;l_17, 4), "phone_cam12") != 0)
-- {
-- MOBILE::_0xC273BB4D(0); // FALSE
-- }
-- else
-- {
-- MOBILE::_0xC273BB4D(1); // TRUE
-- }
function Global.N_0xa2ccbe62cd4c91a4(toggle)
	return _in(0xA2CCBE62CD4C91A4, _ii(toggle) --[[ may be optional ]])
end

function Global.N_0xa2e9c1ab8a92e8cd(p0)
	return _in(0xA2E9C1AB8A92E8CD, p0)
end

function Global.N_0xa2f952104fc6dd4b(p0)
	return _in(0xA2F952104FC6DD4B, p0, _r)
end

function Global.N_0xa306f470d1660581()
	return _in(0xA306F470D1660581, _r, _ri)
end

function Global.N_0xa31fd15197b192bd()
	return _in(0xA31FD15197B192BD, _r, _ri)
end

function Global.N_0xa356990e161c9e65(p0)
	return _in(0xA356990E161C9E65, p0)
end

function Global.N_0xa3a9299c4f2adb98(p0)
	return _in(0xA3A9299C4F2ADB98, p0)
end

--- Only called once in the scripts:
-- if (sub_1abd() &amp;&amp; (!PED::_A3F3564A5B3646C0(l_8C))) {
-- if (sub_52e3("RESNA_CELLR", 0)) {
-- PED::SET_PED_CAN_PLAY_GESTURE_ANIMS(l_8C, 1);
-- PED::SET_PED_CAN_PLAY_AMBIENT_ANIMS(l_8C, 1);
-- PED::SET_PED_CAN_PLAY_VISEME_ANIMS(l_8C, 1, 0);
-- l_184 += 1;
-- }
-- }
function Global.N_0xa3f3564a5b3646c0(ped)
	return _in(0xA3F3564A5B3646C0, ped, _r)
end

function Global.N_0xa41bcd7213805aac(p0)
	return _in(0xA41BCD7213805AAC, p0)
end

function Global.N_0xa44ff770dfbc5dae()
	return _in(0xA44FF770DFBC5DAE)
end

function Global.N_0xa4664972a9b8f8ba(p0)
	return _in(0xA4664972A9B8F8BA, p0, _r, _ri)
end

function Global.N_0xa46b73faa3460ae1(p0)
	return _in(0xA46B73FAA3460AE1, p0)
end

function Global.N_0xa4819f5e23e2ffad()
	return _in(0xA4819F5E23E2FFAD, _r, _ri)
end

function Global.N_0xa4822f1cf23f4810(p1, p3, p4, p5, p6, p7, p8)
	return _in(0xA4822F1CF23F4810, _v, p1, _v, p3, p4, p5, p6, p7, p8, _r)
end

function Global.N_0xa48931185f0536fe()
	return _in(0xA48931185F0536FE, _r, _ri)
end

function Global.N_0xa4a0065e39c9f25c(p0, p1, p2, p3)
	return _in(0xA4A0065E39C9F25C, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0xa4dede28b1814289()
	return _in(0xA4DEDE28B1814289)
end

function Global.N_0xa51c4b86b71652ae(p0)
	return _in(0xA51C4B86B71652AE, p0)
end

function Global.N_0xa52d5247a4227e14(p0)
	return _in(0xA52D5247A4227E14, p0)
end

function Global.N_0xa5342d390cda41d6(p0, p1)
	return _in(0xA5342D390CDA41D6, p0, p1)
end

function Global.N_0xa586fbeb32a53dbb()
	return _in(0xA586FBEB32A53DBB, _r, _ri)
end

function Global.N_0xa5c80d8e768a9e66(p0)
	return _in(0xA5C80D8E768A9E66, _ii(p0) --[[ may be optional ]], _r)
end

--- NOTE: 'p1' might be some kind of array.
function Global.N_0xa5efc3e847d60507(p0, p1, p2, p3, p4)
	return _in(0xA5EFC3E847D60507, _ts(p0), _ts(p1), _ts(p2), _ts(p3), p4, _r)
end

function Global.N_0xa5f377b175a699c5(p0)
	return _in(0xA5F377B175A699C5, p0)
end

function Global.N_0xa635c11b8c44afc2()
	return _in(0xA635C11B8C44AFC2, _r, _ri)
end

function Global.N_0xa6385deb180f319f(p0, p1, p2)
	return _in(0xA6385DEB180F319F, p0, p1, p2)
end

function Global.N_0xa660faf550eb37e5(p0, p1)
	return _in(0xA660FAF550EB37E5, p0, p1)
end

function Global.N_0xa67c35c56eb1bd9d()
	return _in(0xA67C35C56EB1BD9D, _r, _ri)
end

--- Displays a bunch of icons above the players name, and level, and their name twice
function Global.N_0xa67f9c46d612b6f1(headDisplayId, p1)
	return _in(0xA67F9C46D612B6F1, headDisplayId, p1)
end

function Global.N_0xa68d3d229f4f3b06(p0)
	return _in(0xA68D3D229F4F3B06, _ts(p0))
end

function Global.N_0xa699957e60d80214(p0)
	return _in(0xA699957E60D80214, p0, _r)
end

function Global.N_0xa69ac4ade82b57a4(p0)
	return _in(0xA69AC4ADE82B57A4, p0, _r)
end

--- Appears to remove stealth kill action from memory
function Global.N_0xa6a12939f16d85be(hash, p1)
	return _in(0xA6A12939F16D85BE, _ch(hash), p1)
end

function Global.N_0xa72835064dd63e4c()
	return _in(0xA72835064DD63E4C, _r, _ri)
end

function Global.N_0xa735353c77334ea0()
	return _in(0xA735353C77334EA0, _i, _i)
end

function Global.N_0xa736cf7fb7c5bff4()
	return _in(0xA736CF7FB7C5BFF4, _i, _i, _i, _i)
end

--- Called 4 times in the b617d scripts:
-- GAMEPLAY::_A74802FB8D0B7814("CONTRAILS", 0);
function Global.N_0xa74802fb8d0b7814(p0, p1)
	return _in(0xA74802FB8D0B7814, _ts(p0), p1)
end

function Global.N_0xa75e2b6733da5142()
	return _in(0xA75E2B6733DA5142, _r, _ri)
end

function Global.N_0xa76359fc80b2438e(p0)
	return _in(0xA76359FC80B2438E, p0)
end

function Global.N_0xa7862bc5ed1dfd7e(p0, p1)
	return _in(0xA7862BC5ED1DFD7E, p0, p1, _i, _i, _r)
end

--- STATS::0xE3247582(0);
-- STATS::0xE3247582(1);
-- STATS::0xE3247582(2);
-- STATS::0xE3247582(3);
-- STATS::0xE3247582(4);
-- STATS::0xE3247582(5);
-- STATS::0xE3247582(6);
function Global.N_0xa78b8fa58200da56(p0)
	return _in(0xA78B8FA58200DA56, p0)
end

function Global.N_0xa7a1127490312c36(p0)
	return _in(0xA7A1127490312C36, p0)
end

function Global.N_0xa7dcdf4ded40a8f4(vehicle, p1)
	return _in(0xA7DCDF4DED40A8F4, vehicle, p1)
end

--- NETWORK_OVERRIDE_???
function Global.N_0xa7e30de9272b6d49(ped, x, y, z, p4)
	return _in(0xA7E30DE9272B6D49, ped, x, y, z, p4)
end

--- Found in scripts:
-- if (AI::_A7FFBA498E4AAF67(l_9BC, "Run")) {
-- if (AI::_A7FFBA498E4AAF67(l_9BC, "Escape")) {
-- p0 is probably Ped and this native checks if the ped is doing the AI task in p1. Just a guess though.
function Global.N_0xa7ffba498e4aaf67(p0, p1)
	return _in(0xA7FFBA498E4AAF67, p0, _ts(p1), _r)
end

--- p1 always false.
function Global.N_0xa80ae305e0a3044f(entity, p1)
	return _in(0xA80AE305E0A3044F, entity, p1)
end

function Global.N_0xa8434f1dff41d6e7(p0)
	return _in(0xA8434F1DFF41D6E7, p0)
end

function Global.N_0xa85a21582451e951(doorHash, p1)
	return _in(0xA85A21582451E951, _ch(doorHash), p1)
end

function Global.N_0xa8733668d1047b51(p0)
	return _in(0xA8733668D1047B51, p0)
end

function Global.N_0xa8acb6459542a8c8()
	return _in(0xA8ACB6459542A8C8, _r, _ri)
end

function Global.N_0xa8fdb297a8d25fba()
	return _in(0xA8FDB297A8D25FBA)
end

function Global.N_0xa905192a6781c41b(x, y, z)
	return _in(0xA905192A6781C41B, x, y, z)
end

function Global.N_0xa9240a96c74cca13(p0)
	return _in(0xA9240A96C74CCA13, p0, _r)
end

function Global.N_0xa9b61a329bfdcbea(p0, p1)
	return _in(0xA9B61A329BFDCBEA, p0, p1)
end

function Global.N_0xa9cbfd40b3fa3010()
	return _in(0xA9CBFD40B3FA3010, _r, _ri)
end

function Global.N_0xa9f9c2e0fde11cbb(p0, p1, p2)
	return _in(0xA9F9C2E0FDE11CBB, p0, p1, _ii(p2) --[[ may be optional ]], _r)
end

function Global.N_0xaa19f5572c38b564(p0)
	return _in(0xAA19F5572C38B564, _ii(p0) --[[ may be optional ]], _r, _ri)
end

function Global.N_0xaa76052dda9bfc3e(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xAA76052DDA9BFC3E, p0, p1, p2, p3, p4, p5, p6)
end

--- console hash: 0xFD0F7EDD
function Global.N_0xaaa553e7dd28a457(p0)
	return _in(0xAAA553E7DD28A457, p0)
end

function Global.N_0xaaa6a3698a69e048(p0)
	return _in(0xAAA6A3698A69E048, p0, _r, _ri)
end

function Global.N_0xab04325045427aae(vehicle, p1)
	return _in(0xAB04325045427AAE, vehicle, p1)
end

function Global.N_0xab13a5565480b6d9(p0, p1)
	return _in(0xAB13A5565480B6D9, p0, p1, _r, _ri)
end

function Global.N_0xabb2fa71c83a1b72()
	return _in(0xABB2FA71C83A1B72, _r, _ri)
end

--- Only one occurence in the scripts:
-- auto sub_cb43(auto a_0, auto a_1) {
-- if (g_2594CB._f1) {
-- if (NETWORK::_855BC38818F6F684()) {
-- NETWORK::_ABD5E88B8A2D3DB2(&amp;a_0._fB93);
-- g_2594CB._f14/*{13}*/ = a_0._fB93;
-- g_2594CB._f4/*"64"*/ = a_1;
-- return 1;
-- }
-- }
-- return 0;
-- }
-- other:
-- looks like it passes a player in the paramater
-- Contains string "NETWORK_VOICE_CONNECT_TO_PLAYER" in ida
function Global.N_0xabd5e88b8a2d3db2(globalPtr)
	return _in(0xABD5E88B8A2D3DB2, _ii(globalPtr) --[[ may be optional ]])
end

function Global.N_0xac2890471901861c(p0)
	return _in(0xAC2890471901861C, p0)
end

--- For planes only!
-- value can be 1.0 or lower (higher values will automatically result in 1.0).
function Global.N_0xad2d28a1afdff131(vehicle, value)
	return _in(0xAD2D28A1AFDFF131, vehicle, value)
end

function Global.N_0xad5fdf34b81bfe79()
	return _in(0xAD5FDF34B81BFE79)
end

function Global.N_0xad6875bbc0fc899c(p0)
	return _in(0xAD6875BBC0FC899C, p0)
end

--- This has been found in use in the decompiled files.
function Global.N_0xad73ce5a09e42d12(player)
	return _in(0xAD73CE5A09E42D12, player, _r, _ri)
end

function Global.N_0xadb57e5b663cca8b(p0)
	return _in(0xADB57E5B663CCA8B, p0, _f, _f)
end

function Global.N_0xaddd1c754e2e2914(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0xADDD1C754E2E2914, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
end

function Global.N_0xaded7f5748acafe6()
	return _in(0xADED7F5748ACAFE6)
end

function Global.N_0xae3fee8709b39dcb(vehicle)
	return _in(0xAE3FEE8709B39DCB, vehicle, _r)
end

function Global.N_0xae51bc858f32ba66(p0, p1, p2, p3, p4)
	return _in(0xAE51BC858F32BA66, p0, p1, p2, p3, p4)
end

function Global.N_0xaeab987727c5a8a4(p0)
	return _in(0xAEAB987727C5A8A4, p0, _r)
end

function Global.N_0xaeef48cdf5b6ce7c(p0, p1)
	return _in(0xAEEF48CDF5B6CE7C, p0, p1, _r)
end

--- Possible p0 values:
-- "prologue"
-- "Prologue_Main"
function Global.N_0xaf12610c644a35c9(p0, p1)
	return _in(0xAF12610C644A35C9, _ts(p0), p1)
end

--- Exemple of use(carmod_shop.c4)
-- INTERIOR::_AF348AFCB575A441("V_CarModRoom");
function Global.N_0xaf348afcb575a441(roomName)
	return _in(0xAF348AFCB575A441, _ts(roomName))
end

function Global.N_0xaf42195a42c63bba()
	return _in(0xAF42195A42C63BBA, _r, _ri)
end

function Global.N_0xaf66dcee6609b148()
	return _in(0xAF66DCEE6609B148)
end

function Global.N_0xafc976fd0580c7b3(ped, toggle)
	return _in(0xAFC976FD0580C7B3, ped, toggle)
end

function Global.N_0xaff4710e2a0a6c12(ped)
	return _in(0xAFF4710E2A0A6C12, ped)
end

function Global.N_0xb055a34527cb8fd7(vehicle, p1)
	return _in(0xB055A34527CB8FD7, vehicle, p1)
end

function Global.N_0xb07d3185e11657a5(p0)
	return _in(0xB07D3185E11657A5, p0, _r)
end

function Global.N_0xb088e9a47ae6edd5(vehicle, p1)
	return _in(0xB088E9A47AE6EDD5, vehicle, p1)
end

function Global.N_0xb08b85d860e7ba3c(p0, p1, p2)
	return _in(0xB08B85D860E7BA3C, p0, p1, p2)
end

function Global.N_0xb094bc1db4018240(p0, p1, p2, p3)
	return _in(0xB094BC1DB4018240, p0, p1, p2, p3)
end

--- Examples:
-- AI::_B0A6CFD2C69C1088(PLAYER::PLAYER_PED_ID(), "isFirstPerson", 0);
-- AI::_B0A6CFD2C69C1088(PLAYER::PLAYER_PED_ID(), "isFirstPerson", 1);
-- AI::_B0A6CFD2C69C1088(PLAYER::PLAYER_PED_ID(), "isBlocked", sub_179027());
function Global.N_0xb0a6cfd2c69c1088(p0, p2)
	return _in(0xB0A6CFD2C69C1088, p0, _i, p2)
end

function Global.N_0xb0c56bd3d808d863(p0)
	return _in(0xB0C56BD3D808D863, p0)
end
Global.GetBroadcastFinshedLosSound = Global.N_0xb0c56bd3d808d863

--- Has something to do with player switch.
-- Only possible values:
-- - "CSM_ST_BOX3x3"
function Global.N_0xb11d94bc55f41932(p0)
	return _in(0xB11D94BC55F41932, _ts(p0))
end

--- p0 is the handle returned from _0xFDBF4CDBC07E1706
-- console hash: 0x7DBCEF6F
-- Most likely REMOVE_CURRENT_*
function Global.N_0xb1252e3e59a82aaf(p0)
	return _in(0xB1252E3E59A82AAF, p0)
end

function Global.N_0xb129e447a2eda4bf(p0, p1)
	return _in(0xB129E447A2EDA4BF, p0, p1)
end

function Global.N_0xb13e88e655e5a3bc()
	return _in(0xB13E88E655E5A3BC)
end

function Global.N_0xb1577667c3708f9b()
	return _in(0xB1577667C3708F9B)
end

function Global.N_0xb1b6216ca2e7b55e(p0, p1, p2)
	return _in(0xB1B6216CA2E7B55E, p0, p1, p2)
end

--- 12 matches across 4 scripts. All 4 scripts were job creators.
-- type ranged from 0 - 2.
-- p4 was always 0.2f. Likely scale.
-- assuming p5 - p8 is RGBA, the graphic is always yellow (255, 255, 0, 255).
-- Tested but noticed nothing.
function Global.N_0xb1bb03742917a5d6(type, xPos, yPos, zPos, p4, red, green, blue, alpha)
	return _in(0xB1BB03742917A5D6, type, xPos, yPos, zPos, p4, red, green, blue, alpha)
end

function Global.N_0xb1d2bb1e1631f5b1()
	return _in(0xB1D2BB1E1631F5B1, _r)
end

--- This native doesn't seem to do anything, might be a debug-only native.
-- Confirmed, it is a debug native.
function Global.N_0xb264c4d2f2b0a78b(vehicle)
	return _in(0xB264C4D2F2B0A78B, vehicle)
end

--- No observed effect.
function Global.N_0xb28b1fe5bfadd7f5(vehicle, p1)
	return _in(0xB28B1FE5BFADD7F5, vehicle, p1)
end

function Global.N_0xb2a592b04648a9cb()
	return _in(0xB2A592B04648A9CB, _r, _ri)
end

function Global.N_0xb2aff10216defa2f(x, y, z, p3, p4, p5, p6, interiorFlags, scale, duration)
	return _in(0xB2AFF10216DEFA2F, x, y, z, p3, p4, p5, p6, interiorFlags, scale, duration)
end

function Global.N_0xb2d0bde54f0e8e5a(object, toggle)
	return _in(0xB2D0BDE54F0E8E5A, object, toggle)
end

function Global.N_0xb2ebe8cbc58b90e9()
	return _in(0xB2EBE8CBC58B90E9, _r, _ri)
end

function Global.N_0xb309ebea797e001f(p0)
	return _in(0xB309EBEA797E001F, p0, _r, _ri)
end

--- This line found 48 times in the scripts:
-- GAMEPLAY::_B335F761606DB47C(&amp;v_4, &amp;v_7, a_0, v_A);
function Global.N_0xb335f761606db47c(p2, p3)
	return _in(0xB335F761606DB47C, _i, _i, p2, p3, _r)
end

function Global.N_0xb37e4e6a2388ca7b()
	return _in(0xB37E4E6A2388CA7B, _r, _ri)
end

function Global.N_0xb3c641f3630bf6da(p0)
	return _in(0xB3C641F3630BF6DA, p0)
end

function Global.N_0xb3cd58cca6cda852()
	return _in(0xB3CD58CCA6CDA852)
end

--- This function is hard-coded to always return 1.
function Global.N_0xb3da2606774a8e2d()
	return _in(0xB3DA2606774A8E2D, _r, _ri)
end

function Global.N_0xb3e6360dde733e82(p0)
	return _in(0xB3E6360DDE733E82, p0)
end

function Global.N_0xb4271092ca7edf48(p0)
	return _in(0xB4271092CA7EDF48, p0, _r, _ri)
end

--- PLAYER::0xBF6993C7(rPtr((&amp;l_122) + 71)); // Found in decompilation
-- ***
-- In "am_hold_up.ysc" used once:
-- l_8d._f47 = GAMEPLAY::GET_RANDOM_FLOAT_IN_RANGE(18.0, 28.0);
-- PLAYER::_B45EFF719D8427A6((l_8d._f47));
function Global.N_0xb45eff719d8427a6(p0)
	return _in(0xB45EFF719D8427A6, p0)
end

function Global.N_0xb475f27c6a994d65()
	return _in(0xB475F27C6A994D65)
end

--- Found in the b617d scripts, duplicates removed:
-- AUDIO::_B4BBFD9CD8B3922B("V_CARSHOWROOM_PS_WINDOW_UNBROKEN");
-- AUDIO::_B4BBFD9CD8B3922B("V_CIA_PS_WINDOW_UNBROKEN");
-- AUDIO::_B4BBFD9CD8B3922B("V_DLC_HEIST_APARTMENT_DOOR_CLOSED");
-- AUDIO::_B4BBFD9CD8B3922B("V_FINALEBANK_PS_VAULT_INTACT");
-- AUDIO::_B4BBFD9CD8B3922B("V_MICHAEL_PS_BATHROOM_WITH_WINDOW");
function Global.N_0xb4bbfd9cd8b3922b(p0)
	return _in(0xB4BBFD9CD8B3922B, _ts(p0))
end

--- This does not take a weapon hash...
function Global.N_0xb4c8d77c80c0421e(ped, p1)
	return _in(0xB4C8D77C80C0421E, ped, p1, _r, _ri)
end

function Global.N_0xb4f47213df45a64c(p0, p1)
	return _in(0xB4F47213DF45A64C, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0xb50eb4ccb29704ac(p0)
	return _in(0xB50EB4CCB29704AC, p0)
end

function Global.N_0xb51b9ab9ef81868c(toggle)
	return _in(0xB51B9AB9EF81868C, toggle)
end

function Global.N_0xb542de8c3d1cb210(p0)
	return _in(0xB542DE8C3D1CB210, p0)
end

--- "Can request assets for cutscene entity"? (found in decompiled scripts)
function Global.N_0xb56bbbcc2955d9cb()
	return _in(0xB56BBBCC2955D9CB, _r)
end

function Global.N_0xb57a49545ba53ce7(p0)
	return _in(0xB57A49545BA53CE7, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0xb5a4db34fe89b88a()
	return _in(0xB5A4DB34FE89B88A)
end

function Global.N_0xb5d3453c98456528()
	return _in(0xB5D3453C98456528, _r, _ri)
end

function Global.N_0xb606e6cc59664972(p0)
	return _in(0xB606E6CC59664972, p0)
end

function Global.N_0xb6871b0555b02996(p2, p5)
	return _in(0xB6871B0555B02996, _i, _i, p2, _i, _i, p5, _r, _ri)
end

function Global.N_0xb695e2cd0a2da9ee()
	return _in(0xB695E2CD0A2DA9EE)
end

function Global.N_0xb743f735c03d7810(p0, p1)
	return _in(0xB743F735C03D7810, p0, p1)
end

function Global.N_0xb746d20b17f2a229()
	return _in(0xB746D20B17F2A229, _i, _i, _r)
end

function Global.N_0xb782f8238512bad5(p0, p1)
	return _in(0xB782F8238512BAD5, p0, _ii(p1) --[[ may be optional ]])
end

function Global.N_0xb7c7f6ad6424304b()
	return _in(0xB7C7F6AD6424304B)
end

function Global.N_0xb7ed70c49521a61d(p0)
	return _in(0xB7ED70C49521A61D, p0)
end

function Global.N_0xb8721407ee9c3ff6(p0, p1, p2)
	return _in(0xB8721407EE9C3FF6, p0, p1, p2)
end

--- Old Gen: 0x47D6004E
-- Disables something. Used only once in R* scripts (freemode.ysc).
function Global.N_0xb885852c39cc265d()
	return _in(0xB885852C39CC265D)
end

--- if (!$B8B52E498014F5B0(PLAYER::PLAYER_PED_ID())) {
function Global.N_0xb8b52e498014f5b0(ped)
	return _in(0xB8B52E498014F5B0, ped, _r)
end

function Global.N_0xb8f87ead7533b176(p0)
	return _in(0xB8F87EAD7533B176, p0)
end

function Global.N_0xb9449845f73f5e9c(functionName)
	return _in(0xB9449845F73F5E9C, _ts(functionName), _r)
end

function Global.N_0xb9854dfde0d833d6(p0)
	return _in(0xB9854DFDE0D833D6, p0)
end

function Global.N_0xb99c4e4d9499df29(p0)
	return _in(0xB99C4E4D9499DF29, p0)
end

--- Seem to return bool
function Global.N_0xb9cf1f793a9f1bf1()
	return _in(0xB9CF1F793A9F1BF1, _r, _ri)
end

--- Every p2 - p5 occurrence was 0f.
function Global.N_0xba3d65906822bed5(p0, p1, p2, p3, p4, p5)
	return _in(0xBA3D65906822BED5, p0, p1, p2, p3, p4, p5)
end

function Global.N_0xba4b8d83bdc75551(p0)
	return _in(0xBA4B8D83BDC75551, p0)
end

function Global.N_0xba63d9fe45412247(ped, p1)
	return _in(0xBA63D9FE45412247, ped, p1, _r)
end

function Global.N_0xba751764f0821256()
	return _in(0xBA751764F0821256)
end

function Global.N_0xba8d65c1c65702e5(p0)
	return _in(0xBA8D65C1C65702E5, p0)
end

function Global.N_0xba96394a0eecfa65()
	return _in(0xBA96394A0EECFA65)
end

function Global.N_0xba9775570db788cf()
	return _in(0xBA9775570DB788CF, _r, _ri)
end

function Global.N_0xbae4f9b97cd43b30(p0)
	return _in(0xBAE4F9B97CD43B30, p0)
end

function Global.N_0xbaf6babf9e7ccc13(p0, p1)
	return _in(0xBAF6BABF9E7CCC13, p0, p1, _r, _ri)
end

function Global.N_0xbb0527ec6341496d()
	return _in(0xBB0527EC6341496D, _r, _ri)
end

function Global.N_0xbb90e12cac1dab25(p0)
	return _in(0xBB90E12CAC1DAB25, p0)
end

function Global.N_0xbbb45c3cf5c8aa85()
	return _in(0xBBB45C3CF5C8AA85, _r, _ri)
end

function Global.N_0xbbdf066252829606(p0, p1)
	return _in(0xBBDF066252829606, p0, p1)
end

function Global.N_0xbbf327ded94e4deb(p0)
	return _in(0xBBF327DED94E4DEB, _ts(p0))
end

--- var num3 = PLAYER::GET_PLAYER_PED(l_2171); // proof l_2171 is a player
-- var num17 = PLAYER::0x9DF75B2A(l_2171, 100, 0); // l_2171
-- .ysc:
-- if (PLAYER::GET_PLAYER_WANTED_LEVEL(l_6EF) &lt; v_4) { // l_6EF is a player
-- PLAYER::SET_PLAYER_WANTED_LEVEL(l_6EF, v_4, 0); // l_6EF
-- PLAYER::SET_PLAYER_WANTED_LEVEL_NOW(l_6EF, 0); // l_6EF
-- } else {
-- PLAYER::_4669B3ED80F24B4E(l_6EF); // l_6EF
-- UI::_BA8D65C1C65702E5(1);
-- a_0 = 1;
-- }
-- if (l_4B24[l_6F2/*156*/]._f8C != PLAYER::_BC0753C9CA14B506(l_6EF, 100, 0)) { // l_6EF
-- l_4B24[l_6F2/*156*/]._f8C = PLAYER::_BC0753C9CA14B506(l_6EF, 100, 0); // l_6EF
-- }
-- Both was taken from fm_mission_controller
-- GET_PLAYER_*
function Global.N_0xbc0753c9ca14b506(player, p1, p2)
	return _in(0xBC0753C9CA14B506, player, p1, p2, _r)
end

--- Most likely ROPE_ATTACH_*
function Global.N_0xbc0ce682d4d05650(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	return _in(0xBC0CE682D4D05650, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
end

function Global.N_0xbc1cc91205ec8d6e()
	return _in(0xBC1CC91205EC8D6E, _r, _ri)
end

function Global.N_0xbc3cca5844452b06(p0)
	return _in(0xBC3CCA5844452B06, p0)
end

--- Seems to only appear in scripts used in Singleplayer.
-- AI_PHONE_ARGS is a hash collision!!!
-- Always used like this in scripts
-- PLAYER::_BC9490CA15AEA8FB(PLAYER::PLAYER_ID());
function Global.N_0xbc9490ca15aea8fb(player)
	return _in(0xBC9490CA15AEA8FB, player)
end

function Global.N_0xbc9823ab80a3dcac()
	return _in(0xBC9823AB80A3DCAC, _r, _ri)
end

function Global.N_0xbce595371a5fbaaf(p0, p1)
	return _in(0xBCE595371A5FBAAF, p0, p1)
end

function Global.N_0xbcedb009461da156()
	return _in(0xBCEDB009461DA156, _r, _ri)
end

function Global.N_0xbcfc632db7673bf0(p0, p1)
	return _in(0xBCFC632DB7673BF0, p0, p1)
end

function Global.N_0xbd0be0bfc927eac1()
	return _in(0xBD0BE0BFC927EAC1)
end

--- MulleDK19: This function is hard-coded to always return 1.
function Global.N_0xbd545d44cce70597()
	return _in(0xBD545D44CCE70597, _r)
end

function Global.N_0xbd605b8e0e18b3bb()
	return _in(0xBD605B8E0E18B3BB)
end

function Global.N_0xbdb6f89c729cf388()
	return _in(0xBDB6F89C729CF388, _r, _ri)
end

function Global.N_0xbdeb86f4d5809204(p0)
	return _in(0xBDEB86F4D5809204, p0)
end

--- This function is hard-coded to always return 0.
function Global.N_0xbe197eaa669238f4(p0, p1, p2, p3)
	return _in(0xBE197EAA669238F4, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0xbe5c1255a1830ff5(vehicle, toggle)
	return _in(0xBE5C1255A1830FF5, vehicle, toggle)
end

function Global.N_0xbeb2d9a1d9a8f55a(p0, p1, p2, p3)
	return _in(0xBEB2D9A1D9A8F55A, p0, p1, p2, p3)
end

function Global.N_0xbeb3d46bb7f043c0(p0)
	return _in(0xBEB3D46BB7F043C0, p0)
end

function Global.N_0xbed8ca5ff5e04113(p0, p1, p2, p3)
	return _in(0xBED8CA5FF5E04113, p0, p1, p2, p3)
end

function Global.N_0xbed9f5693f34ed17(statName, p1, outValue)
	return _in(0xBED9F5693F34ED17, _ch(statName), p1, _fi(outValue) --[[ may be optional ]], _r)
end

function Global.N_0xbef34b1d9624d5dd(p0)
	return _in(0xBEF34B1D9624D5DD, p0)
end

function Global.N_0xbf09786a7fcab582(p0)
	return _in(0xBF09786A7FCAB582, p0, _r, _ri)
end

function Global.N_0xbf22e0f32968e967(player, p1)
	return _in(0xBF22E0F32968E967, player, p1)
end

function Global.N_0xbf4dc1784be94dfa(p0, p1, p2)
	return _in(0xBF4DC1784BE94DFA, p0, p1, p2)
end

function Global.N_0xbf4f34a85ca2970c()
	return _in(0xBF4F34A85CA2970C)
end

--- Something to do with timecycles.
function Global.N_0xbf59707b3e5ed531(p0)
	return _in(0xBF59707B3E5ED531, _ts(p0))
end

function Global.N_0xbf72910d0f26f025()
	return _in(0xBF72910D0F26F025, _r, _ri)
end

function Global.N_0xbfa0a56a817c6c7d(p0)
	return _in(0xBFA0A56A817C6C7D, p0)
end

--- GET_VEHICLE_MODEL_MAX_*
-- max braking if air vehicle, else max braking + 0.1
-- -------------------
-- For a full list, see here: pastebin.com/Cb9L1Cn0
function Global.N_0xbfba3ba79cff7ebf(modelHash)
	return _in(0xBFBA3BA79CFF7EBF, _ch(modelHash), _r, _rf)
end

--- Since latest patches has 18 parameters.
-- Console Hash: 0xCCDC33CC
-- only documented to be continued...
function Global.N_0xbfe5756e7407064a(x1, y1, z1, x2, y2, z2, damage, p7, weaponHash, ownerPed, isAudible, isInvisible, speed, entity, p14, p15, p16, p17)
	return _in(0xBFE5756E7407064A, x1, y1, z1, x2, y2, z2, damage, p7, _ch(weaponHash), ownerPed, isAudible, isInvisible, speed, entity, p14, p15, p16, p17)
end

function Global.N_0xc0416b061f2b7e5e(p0)
	return _in(0xC0416B061F2B7E5E, p0)
end

--- Use _GET_VEHICLE_MOD_DATA for modData
-- Appears to be a GET_DLC_VEHICLE_MOD_* native.
function Global.N_0xc098810437312fff(modData)
	return _in(0xC098810437312FFF, modData, _r, _ri)
end

function Global.N_0xc0d2af00bcc234ca()
	return _in(0xC0D2AF00BCC234CA, _r, _ri)
end

function Global.N_0xc0e0d686ddfc6eae()
	return _in(0xC0E0D686DDFC6EAE, _r, _ri)
end

function Global.N_0xc13c38e47ea5df31(p0)
	return _in(0xC13C38E47EA5DF31, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0xc141b8917e0017ec()
	return _in(0xC141B8917E0017EC)
end

function Global.N_0xc15907d667f7cfb2(vehicle, toggle)
	return _in(0xC15907D667F7CFB2, vehicle, toggle)
end

function Global.N_0xc17ad0e5752becda(componentHash)
	return _in(0xC17AD0E5752BECDA, _ch(componentHash), _r, _ri)
end

function Global.N_0xc1805d05e6d4fe10(vehicle)
	return _in(0xC1805D05E6D4FE10, vehicle)
end

function Global.N_0xc1f6ebf9a3d55538(p0, p1)
	return _in(0xC1F6EBF9A3D55538, p0, p1)
end

--- same call as VEHICLE::_0x0F3B4D4E43177236
function Global.N_0xc1f981a6f74f0c23(p0, p1)
	return _in(0xC1F981A6F74F0C23, p0, p1)
end

function Global.N_0xc22912b1d85f26b1(p0)
	return _in(0xC22912B1D85F26B1, p0, _i, _i, _r)
end

function Global.N_0xc265df9fb44a9fbd(p0)
	return _in(0xC265DF9FB44A9FBD, p0, _r)
end

--- This seems to be related to Steam achievements.
-- p0 and p1 are int (?)
-- ------
-- Can't say anything about the Steam version but it is hardcoded to always return false int the retail version.
function Global.N_0xc2afffdabbdc2c5c(p0, p1)
	return _in(0xC2AFFFDABBDC2C5C, p0, p1, _r)
end

function Global.N_0xc2d15bef167e27bc()
	return _in(0xC2D15BEF167E27BC)
end

--- CAM::_C2EAE3FB8CDBED31("SHAKE_CAM_medium", "medium", "", 0.5f);
function Global.N_0xc2eae3fb8cdbed31(p0, p1, p2, p3)
	return _in(0xC2EAE3FB8CDBED31, _ts(p0), _ts(p1), _ts(p2), p3)
end

function Global.N_0xc2ee020f5fb4db53(ped)
	return _in(0xC2EE020F5FB4DB53, ped)
end

function Global.N_0xc32ea7a2f6ca7557()
	return _in(0xC32EA7A2F6CA7557, _r, _ri)
end

--- - This is called after SET_ALL_RANDOM_PEDS_FLEE_THIS_FRAME
-- hash collision
function Global.N_0xc3376f42b1faccc6(player)
	return _in(0xC3376F42B1FACCC6, player)
end
Global.SetAreasGeneratorOrientation = Global.N_0xc3376f42b1faccc6

function Global.N_0xc35a6d07c93802b2()
	return _in(0xC35A6D07C93802B2)
end

function Global.N_0xc361aa040d6637a8(vehicle, p1)
	return _in(0xC361AA040D6637A8, vehicle, p1)
end

function Global.N_0xc38dc1e90d22547c()
	return _in(0xC38DC1E90D22547C, _i, _i, _i, _r)
end

function Global.N_0xc3c221addde31a11(p0)
	return _in(0xC3C221ADDDE31A11, p0)
end

function Global.N_0xc3ead29ab273ece8(p0)
	return _in(0xC3EAD29AB273ECE8, p0)
end

function Global.N_0xc4278f70131baa6d(p0, p1)
	return _in(0xC4278F70131BAA6D, p0, p1)
end

function Global.N_0xc42dd763159f3461()
	return _in(0xC42DD763159F3461, _r, _ri)
end

function Global.N_0xc45c27ef50f36adc(vehicle, p1)
	return _in(0xC45C27EF50F36ADC, vehicle, p1)
end

function Global.N_0xc485e07e4f0b7958(doorHash, p1, p2, p3)
	return _in(0xC485E07E4F0B7958, _ch(doorHash), p1, p2, p3)
end

function Global.N_0xc505036a35afd01b(p0)
	return _in(0xC505036A35AFD01B, p0)
end

function Global.N_0xc50ce861b55eab8b(vehicle, p1)
	return _in(0xC50CE861B55EAB8B, vehicle, p1)
end

--- This seems to edit the water wave, intensity around your current location.
-- 0.0f = Normal
-- 1.0f = So Calm and Smooth, a boat will stay still.
-- 3.0f = Really Intense.
function Global.N_0xc54a08c85ae4d410(p0)
	return _in(0xC54A08C85AE4D410, p0)
end

function Global.N_0xc55854c7d7274882()
	return _in(0xC55854C7D7274882)
end

function Global.N_0xc55a0b40ffb1ed23()
	return _in(0xC55A0B40FFB1ED23, _r, _ri)
end

function Global.N_0xc56fbf2f228e1dac(p0, p1, p2)
	return _in(0xC56FBF2F228E1DAC, p0, p1, p2, _r, _ri)
end

--- NETWORK_IS_TRANSITION_???
function Global.N_0xc571d0e77d8bbc29()
	return _in(0xC571D0E77D8BBC29, _r, _ri)
end

--- Interesting fact: A hash collision for this is RESET_JETPACK_MODEL_SETTINGS
function Global.N_0xc594b315edf2d4af(ped)
	return _in(0xC594B315EDF2D4AF, ped)
end

function Global.N_0xc5be134ec7ba96a0(p0, p1, p2, p3, p4)
	return _in(0xC5BE134EC7BA96A0, p0, p1, p2, p3, p4)
end

function Global.N_0xc6033d32241f6fb5(p0, p1)
	return _in(0xC6033D32241F6FB5, p0, p1)
end

--- Toggles a value (bool) for cutscenes.
function Global.N_0xc61b86c9f61eb404(toggle)
	return _in(0xC61B86C9F61EB404, toggle)
end

function Global.N_0xc6372ecd45d73bcd(p0)
	return _in(0xC6372ECD45D73BCD, p0)
end

function Global.N_0xc64ded7ef0d2fe37(p0)
	return _in(0xC64DED7EF0D2FE37, _ii(p0) --[[ may be optional ]], _r, _ri)
end

--- Often called after _REMOVE_LOADING_PROMPT. Unsure what exactly it does, but It references busy_spinner, I can only guess its freeing the busy_spinner scaleform from memory
function Global.N_0xc65ab383cd91df98()
	return _in(0xC65AB383CD91DF98)
end

--- GET_VEHICLE_MODEL_*
-- Function pertains only to aviation vehicles.
-- For a full list, see here: pastebin.com/JwuGNp2K
function Global.N_0xc6ad107ddc9054cc(modelHash)
	return _in(0xC6AD107DDC9054CC, _ch(modelHash), _r, _rf)
end

function Global.N_0xc6e0e2616a7576bb()
	return _in(0xC6E0E2616A7576BB, _r, _ri)
end

function Global.N_0xc70ddce56d0d3a99()
	return _in(0xC70DDCE56D0D3A99, _r, _ri)
end

function Global.N_0xc7397a83f7a2a462(p1, p2)
	return _in(0xC7397A83F7A2A462, _i, p1, p2, _i, _r)
end

function Global.N_0xc78e239ac5b2ddb9(p0, p1, p2)
	return _in(0xC78E239AC5B2DDB9, p0, p1, p2)
end

function Global.N_0xc79196dcb36f6121(p0)
	return _in(0xC79196DCB36F6121, p0)
end

function Global.N_0xc79ae21974b01fb2()
	return _in(0xC79AE21974B01FB2)
end

function Global.N_0xc7abac5de675ee3b()
	return _in(0xC7ABAC5DE675EE3B, _r, _ri)
end

function Global.N_0xc7be335216b5ec7c()
	return _in(0xC7BE335216B5EC7C, _r, _ri)
end

function Global.N_0xc7db36c24634f52b()
	return _in(0xC7DB36C24634F52B)
end

function Global.N_0xc7e7181c09f33b69(p0)
	return _in(0xC7E7181C09F33B69, p0)
end

function Global.N_0xc7f29ca00f46350e(p0)
	return _in(0xC7F29CA00F46350E, p0)
end

function Global.N_0xc8391c309684595a()
	return _in(0xC8391C309684595A)
end

function Global.N_0xc84527e235fca219(p0, p1, p2, type, p6)
	return _in(0xC84527E235FCA219, _ts(p0), p1, _ts(p2), _i, _i, _ts(type), p6, _r)
end

function Global.N_0xc847b43f369ac0b5()
	return _in(0xC847B43F369AC0B5)
end

function Global.N_0xc87e740d9f3872cc()
	return _in(0xC87E740D9F3872CC, _r, _ri)
end

function Global.N_0xc8b1b2425604cdd0()
	return _in(0xC8B1B2425604CDD0, _r, _ri)
end

function Global.N_0xc8b5c4a79cc18b94(p0)
	return _in(0xC8B5C4A79CC18B94, p0)
end

function Global.N_0xc8e1071177a23be5()
	return _in(0xC8E1071177A23BE5, _i, _i, _i, _r)
end

function Global.N_0xc8ede9bdbccba6d4(p1, p2, p3)
	return _in(0xC8EDE9BDBCCBA6D4, _i, p1, p2, p3)
end

function Global.N_0xc8f3aaf93d0600bf(p0, p1, p2, p3)
	return _in(0xC8F3AAF93D0600BF, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0xc91c6c55199308ca(p0, p1, p2, p3)
	return _in(0xC91C6C55199308CA, p0, p1, p2, p3)
end

function Global.N_0xc92717ef615b6704(p0)
	return _in(0xC92717EF615B6704, p0)
end

function Global.N_0xc980e62e33df1d5c()
	return _in(0xC980E62E33DF1D5C, _i, _i, _r)
end

--- Seems to be called before SPECIAL_ABILITY_DEACTIVATE. Needs more research.
-- SPECIAL_ABILITY_CHARGE_*
function Global.N_0xc9a763d8fe87436a(player)
	return _in(0xC9A763D8FE87436A, player)
end

function Global.N_0xc9b18b4619f48f7b(p0)
	return _in(0xC9B18B4619F48F7B, p0)
end

function Global.N_0xc9b43a33d09cada7(p0)
	return _in(0xC9B43A33D09CADA7, p0)
end

function Global.N_0xca4ae345a153d573(p0)
	return _in(0xCA4AE345A153D573, p0)
end

function Global.N_0xca575c391fea25cc(p0)
	return _in(0xCA575C391FEA25CC, p0)
end

function Global.N_0xca6b2f7ce32ab653(p0, p2)
	return _in(0xCA6B2F7CE32AB653, p0, _i, p2, _r)
end

function Global.N_0xca94551b50b4932c(p0)
	return _in(0xCA94551B50B4932C, p0, _r, _ri)
end

function Global.N_0xca9d2aa3e326d720()
	return _in(0xCA9D2AA3E326D720, _r)
end

--- Found in "director_mode", "fm_bj_race_controler", "fm_deathmatch_controler", "fm_impromptu_dm_controler", "fm_race_controler", "gb_deathmatch".
function Global.N_0xcac57395b151135f(player, p1)
	return _in(0xCAC57395B151135F, player, p1)
end

function Global.N_0xcac66558b944da67(vehicle, p1)
	return _in(0xCAC66558B944DA67, vehicle, p1)
end

--- Only call found in the b617d scripts:
-- AUDIO::_CADA5A0D0702381E("BACK", "HUD_FREEMODE_SOUNDSET");
function Global.N_0xcada5a0d0702381e(p0, soundset)
	return _in(0xCADA5A0D0702381E, _ts(p0), _ts(soundset))
end

function Global.N_0xcae55f48d3d7875c(p0)
	return _in(0xCAE55F48D3D7875C, p0)
end

function Global.N_0xcb00196b31c39eb1(p0, p1, p2, p3)
	return _in(0xCB00196B31C39EB1, p0, p1, p2, p3)
end

function Global.N_0xcb0360efefb2580d(p0)
	return _in(0xCB0360EFEFB2580D, p0)
end

function Global.N_0xcb215c4b56a7fae7(p0)
	return _in(0xCB215C4B56A7FAE7, p0, _r, _ri)
end

function Global.N_0xcb82a0bf0e3e3265(p0)
	return _in(0xCB82A0BF0E3E3265, p0, _r, _ri)
end

function Global.N_0xcb968b53fc7f916d(p0, p1, p2, p3)
	return _in(0xCB968B53FC7F916D, p0, p1, p2, p3)
end

function Global.N_0xcc3fdded67bcfc63()
	return _in(0xCC3FDDED67BCFC63)
end

--- RESET_*
function Global.N_0xcc6e963682533882(p0)
	return _in(0xCC6E963682533882, p0)
end

--- p4 seems to vary from 0 to 3.
function Global.N_0xcc9682b8951c5229(ped, r, g, b, p4)
	return _in(0xCC9682B8951C5229, ped, r, g, b, p4)
end

function Global.N_0xcca4318e1ab03f1f(p0)
	return _in(0xCCA4318E1AB03F1F, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0xccd078c2665d2973(p0)
	return _in(0xCCD078C2665D2973, p0)
end

function Global.N_0xcd018c591f94cb43(p0, p1)
	return _in(0xCD018C591F94CB43, p0, p1)
end

function Global.N_0xcd71a4ecab22709e(entity)
	return _in(0xCD71A4ECAB22709E, entity)
end

function Global.N_0xcdca26e80faecb8f()
	return _in(0xCDCA26E80FAECB8F)
end

function Global.N_0xce5aa445aba8dee0(p0)
	return _in(0xCE5AA445ABA8DEE0, _ii(p0) --[[ may be optional ]], _r, _ri)
end

function Global.N_0xced08cbe8ebb97c7(p0, p1)
	return _in(0xCED08CBE8EBB97C7, p0, p1)
end

function Global.N_0xceda60a74219d064(p0, p1)
	return _in(0xCEDA60A74219D064, p0, p1)
end

function Global.N_0xcef214315d276fd1(p0)
	return _in(0xCEF214315D276FD1, p0)
end

function Global.N_0xcf1182f682f65307(p0, p1)
	return _in(0xCF1182F682F65307, p0, p1)
end

function Global.N_0xcf38dafbb49ede5e(p0)
	return _in(0xCF38DAFBB49EDE5E, _ii(p0) --[[ may be optional ]], _r)
end

function Global.N_0xcf61d4b4702ee9eb()
	return _in(0xCF61D4B4702EE9EB, _r, _ri)
end

function Global.N_0xcfd115b373c0df63(p0, p1)
	return _in(0xCFD115B373C0DF63, p0, _ii(p1) --[[ may be optional ]])
end

--- what does this do?
function Global.N_0xcfd778e7904c255e(vehicle)
	return _in(0xCFD778E7904C255E, vehicle)
end

function Global.N_0xcfeb46dcd7d8d5eb(p0)
	return _in(0xCFEB46DCD7D8D5EB, p0)
end

function Global.N_0xcfeb8af24fc1d0bb(p0)
	return _in(0xCFEB8AF24FC1D0BB, p0)
end

--- gets some camera near clip
function Global.N_0xd0082607100d7193()
	return _in(0xD0082607100D7193, _r, _rf)
end

function Global.N_0xd00d76a7dfc9d852(p0)
	return _in(0xD00D76A7DFC9D852, _ii(p0) --[[ may be optional ]])
end

function Global.N_0xd01005d2ba2eb778(p0)
	return _in(0xD01005D2BA2EB778, _ii(p0) --[[ may be optional ]])
end

function Global.N_0xd01015c7316ae176(ped, p1)
	return _in(0xD01015C7316AE176, ped, _ts(p1), _r, _ri)
end

function Global.N_0xd05d1a6c74da3498(p1)
	return _in(0xD05D1A6C74DA3498, _i, p1, _i, _r)
end

--- x360 Hash: 0xF637166E
function Global.N_0xd0a484cb2f829fbe()
	return _in(0xD0A484CB2F829FBE, _r, _ri)
end

function Global.N_0xd0bc1c6fb18ee154(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xD0BC1C6FB18EE154, p0, p1, p2, p3, p4, p5, p6)
end

function Global.N_0xd0ee05fe193646ea()
	return _in(0xD0EE05FE193646EA, _i, _i, _i, _r)
end

function Global.N_0xd10282b6e3751ba0()
	return _in(0xD10282B6E3751BA0, _r, _ri)
end

function Global.N_0xd1032e482629049e(p0)
	return _in(0xD1032E482629049E, p0)
end

function Global.N_0xd10f442036302d50(p0, p1, p2)
	return _in(0xD10F442036302D50, p0, p1, p2)
end

function Global.N_0xd1871251f3b5acd7(ped)
	return _in(0xD1871251F3B5ACD7, ped, _r)
end

function Global.N_0xd1b0f412f109ea5d(p0, p1)
	return _in(0xD1B0F412F109EA5D, p0, p1)
end

--- SET_TV_???
function Global.N_0xd1c55b110e4df534(p0)
	return _in(0xD1C55B110E4DF534, p0)
end

function Global.N_0xd1c7cb175e012964(scaleformHandle)
	return _in(0xD1C7CB175E012964, scaleformHandle, _r)
end

function Global.N_0xd1f8363dfad03848(p0)
	return _in(0xD1F8363DFAD03848, p0)
end

--- returns a notification handle, prints out a notification like below:
-- type range: 0
-- if you set type to 1, image goes from 0 - 39 - Xbox you can add text to
-- example:
-- UI::_0xD202B92CBF1D816F(1, 20, "Who you trynna get crazy with, ese? Don't you know I'm LOCO?!");
function Global.N_0xd202b92cbf1d816f(type, image, text)
	return _in(0xD202B92CBF1D816F, type, image, _ts(text), _r, _ri)
end

function Global.N_0xd2049635deb9c375()
	return _in(0xD2049635DEB9C375)
end

--- "SwitchHUDFranklinOut",
-- "SwitchHUDMichaelOut",
-- "SwitchHUDOut",
-- "SwitchHUDTrevorOut",
-- "SwitchOpenFranklinOut",
-- "SwitchOpenMichaelIn",
-- "SwitchOpenNeutral"
function Global.N_0xd2209be128b5418c(graphicsName)
	return _in(0xD2209BE128B5418C, _ts(graphicsName))
end

function Global.N_0xd2300034310557e4(vehicle, p1)
	return _in(0xD2300034310557E4, vehicle, p1)
end

function Global.N_0xd261ba3e7e998072(p0, p1)
	return _in(0xD261BA3E7E998072, p0, p1)
end

function Global.N_0xd2936cab8b58fcbd(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0xD2936CAB8B58FCBD, p0, p1, p2, p3, p4, p5, p6, p7)
end

--- 1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
function Global.N_0xd2b315b6689d537d(player, p1)
	return _in(0xD2B315B6689D537D, player, p1)
end

function Global.N_0xd2b32be3fc1626c6()
	return _in(0xD2B32BE3FC1626C6)
end

function Global.N_0xd2cc78cd3d0b50f9(p0, p1)
	return _in(0xD2CC78CD3D0B50F9, p0, p1)
end

function Global.N_0xd2dccd8e16e20997(p0)
	return _in(0xD2DCCD8E16E20997, p0)
end

function Global.N_0xd302e99edf0449cf(p0)
	return _in(0xD302E99EDF0449CF, p0, _r, _ri)
end

function Global.N_0xd313de83394af134()
	return _in(0xD313DE83394AF134, _r, _ri)
end

function Global.N_0xd33daa36272177c4(ped)
	return _in(0xD33DAA36272177C4, ped)
end

function Global.N_0xd38c4a6d047c019d()
	return _in(0xD38C4A6D047C019D, _r, _ri)
end

function Global.N_0xd39b3fff8ffdd5bf(p0)
	return _in(0xD39B3FFF8FFDD5BF, p0, _r, _ri)
end

function Global.N_0xd39d13c9febf0511(p0)
	return _in(0xD39D13C9FEBF0511, p0)
end

function Global.N_0xd3a10fc7fd8d98cd()
	return _in(0xD3A10FC7FD8D98CD, _r)
end

function Global.N_0xd3a6a0ef48823a8c()
	return _in(0xD3A6A0EF48823A8C, _r, _ri)
end

function Global.N_0xd3d15555431ab793()
	return _in(0xD3D15555431AB793, _r, _ri)
end

function Global.N_0xd4438c0564490e63()
	return _in(0xD4438C0564490E63)
end

function Global.N_0xd4793dff3af2abcd()
	return _in(0xD4793DFF3AF2ABCD)
end

--- SET_*_MULTIPLIER_THIS_FRAME
function Global.N_0xd4b8e3d1917bc86b(toggle)
	return _in(0xD4B8E3D1917BC86B, toggle)
end

--- Only used like this:
-- if (VEHICLE::_D4C4642CB7F50B5D(ENTITY::GET_VEHICLE_INDEX_FROM_ENTITY_INDEX(v_3))) {                                                        sub_157e9c(g_40001._f1868, 0);
-- }
function Global.N_0xd4c4642cb7f50b5d(vehicle)
	return _in(0xD4C4642CB7F50B5D, vehicle, _r)
end

function Global.N_0xd53acdbef24a46e8()
	return _in(0xD53ACDBEF24A46E8, _r, _ri)
end

function Global.N_0xd57aaae0e2214d11()
	return _in(0xD57AAAE0E2214D11)
end

function Global.N_0xd5a4b59980401588(p0, p1)
	return _in(0xD5A4B59980401588, p0, p1, _i, _i, _r)
end

--- p0 - PLAYER::PLAYER_PED_ID();
-- p1 - "Phase", "Wobble", "x_axis","y_axis","introphase","speed".
-- p2 - From what i can see it goes up to 1f (maybe).
-- -LcGamingHD
-- Example: AI::_D5BB4025AE449A4E(PLAYER::PLAYER_PED_ID(), "Phase", 0.5);
function Global.N_0xd5bb4025ae449a4e(p0, p1, p2)
	return _in(0xD5BB4025AE449A4E, p0, _ts(p1), p2)
end

function Global.N_0xd642319c54aadeb6()
	return _in(0xD642319C54AADEB6, _r, _ri)
end

function Global.N_0xd66c9e72b3cc4982(p1)
	return _in(0xD66C9E72B3CC4982, _i, p1, _r, _ri)
end

function Global.N_0xd68a5ff8a3a89874(r, g, b, a)
	return _in(0xD68A5FF8A3A89874, r, g, b, a)
end

--- Something related to the environmental effects natives.
-- In the "agency_heist3b" script, p1 - p3 are always under 100 - usually they are {87, 81, 68}. If SET_PED_ENVEFF_SCALE is set to 0.65 (instead of the usual 1.0), they use {74, 69, 60}
function Global.N_0xd69411aa0cebf9e9(ped, p1, p2, p3)
	return _in(0xD69411AA0CEBF9E9, ped, p1, p2, p3)
end

function Global.N_0xd6ade981781fca09(p0)
	return _in(0xD6ADE981781FCA09, p0)
end

--- Only one match in the scripts:
-- GRAPHICS::_D7021272EB0A451E("int_carrier_hanger");
function Global.N_0xd7021272eb0a451e(p0)
	return _in(0xD7021272EB0A451E, _ts(p0))
end

function Global.N_0xd79185689f8fd5df(p0)
	return _in(0xD79185689F8FD5DF, p0)
end

function Global.N_0xd7d0b00177485411(p0, p1)
	return _in(0xD7D0B00177485411, p0, p1)
end

function Global.N_0xd7d22f5592aed8ba(p0)
	return _in(0xD7D22F5592AED8BA, p0, _r, _ri)
end

--- 4 matches across 2 scripts.
-- appcamera:
-- called after UI::HIDE_HUD_AND_RADAR_THIS_FRAME() and before GRAPHICS::0x108F36CC();
-- cellphone_controller:
-- called after GRAPHICS::0xE9F2B68F(0, 0) and before GRAPHICS::0x108F36CC();
function Global.N_0xd801cc02177fa3f1()
	return _in(0xD801CC02177FA3F1)
end

function Global.N_0xd8122c407663b995()
	return _in(0xD8122C407663B995, _r, _ri)
end

function Global.N_0xd8295af639fd9cb8(p0)
	return _in(0xD8295AF639FD9CB8, p0)
end

function Global.N_0xd8c3be3ee94caf2d(p0, p1, p2, p3, p4)
	return _in(0xD8C3BE3EE94CAF2D, p0, p1, p2, p3, p4)
end

function Global.N_0xd8e694757bcea8e9()
	return _in(0xD8E694757BCEA8E9)
end

function Global.N_0xd9454b5752c857dc()
	return _in(0xD9454B5752C857DC)
end

function Global.N_0xd972df67326f966e()
	return _in(0xD972DF67326F966E)
end

function Global.N_0xd9b71952f78a2640(doorHash, p1)
	return _in(0xD9B71952F78A2640, _ch(doorHash), p1)
end

function Global.N_0xd9f692d349249528()
	return _in(0xD9F692D349249528)
end

function Global.N_0xda024bdbd600f44a(p0)
	return _in(0xDA024BDBD600F44A, _ii(p0) --[[ may be optional ]])
end

--- Set profile setting 866
function Global.N_0xdac073c7901f9e15(p0)
	return _in(0xDAC073C7901F9E15, p0)
end

function Global.N_0xdaf87174be7454ff(p0)
	return _in(0xDAF87174BE7454FF, p0, _r)
end

function Global.N_0xdb34e8d56fc13b08(p0, p1, p2)
	return _in(0xDB34E8D56FC13B08, p0, p1, p2)
end

function Global.N_0xdb41d07a45a6d4b7(p0)
	return _in(0xDB41D07A45A6D4B7, p0, _r, _ri)
end

function Global.N_0xdb90c6cca48940f1(p0)
	return _in(0xDB90C6CCA48940F1, p0)
end

--- REQUEST_VEHICLE_*
function Global.N_0xdba3c090e3d74690(vehicle)
	return _in(0xDBA3C090E3D74690, vehicle)
end

function Global.N_0xdbaa5ec848ba2d46(p0, p1)
	return _in(0xDBAA5EC848BA2D46, p0, p1)
end

--- Related to locking the vehicle or something similar.
-- In the decompiled scripts, its always called after
-- VEHICLE::_SET_EXCLUSIVE_DRIVER(a_0, 0, 0);
-- VEHICLE::SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(a_0, 1);
-- VEHICLE::SET_VEHICLE_DOORS_LOCKED_FOR_PLAYER(a_0, PLAYER::PLAYER_ID(), 0);
function Global.N_0xdbc631f109350b8c(vehicle, p1)
	return _in(0xDBC631F109350B8C, vehicle, p1)
end

--- probably 0x3461981 on console
function Global.N_0xdc18531d7019a535(p0, p1)
	return _in(0xDC18531D7019A535, p0, p1, _r)
end

function Global.N_0xdc459cfa0cce245b(p0)
	return _in(0xDC459CFA0CCE245B, p0)
end

function Global.N_0xdc48473142545431()
	return _in(0xDC48473142545431, _r, _ri)
end

function Global.N_0xdc54a7af8b3a14ef()
	return _in(0xDC54A7AF8B3A14EF, _r, _ri)
end

function Global.N_0xdc57a637a20006ed(p0, p1)
	return _in(0xDC57A637A20006ED, p0, p1)
end

--- Has something to do with police.
function Global.N_0xdc64d2c53493ed12(player)
	return _in(0xDC64D2C53493ED12, player)
end

--- SET_ENTITY_*
-- x360 Hash: 0xA0466A69
-- Only called within 1 script for x360. 'fm_mission_controller' and it used on an object.
-- Ran after these 2 natives,
-- set_object_targettable(uParam0, 0);
-- set_entity_invincible(uParam0, 1);
function Global.N_0xdc6f8601faf2e893(entity, p1)
	return _in(0xDC6F8601FAF2E893, entity, p1)
end

function Global.N_0xdc9274a7ef6b2867()
	return _in(0xDC9274A7EF6B2867, _r, _ri)
end

function Global.N_0xdc9da9e8789f5246()
	return _in(0xDC9DA9E8789F5246)
end

function Global.N_0xdcca191df9980fd7(ped)
	return _in(0xDCCA191DF9980FD7, ped, _r)
end

function Global.N_0xdcfb5d4db8bf367e(p0, p1)
	return _in(0xDCFB5D4DB8BF367E, p0, p1)
end

function Global.N_0xdd2238f57b977751(p0)
	return _in(0xDD2238F57B977751, p0, _r)
end

--- 2 occurrences in agency_heist3a. p1 was 0.7f then 0.4f.
function Global.N_0xdd2620b7b9d16ff1(player, p1)
	return _in(0xDD2620B7B9D16FF1, player, p1, _r)
end

--- Tune Backwards... ?
function Global.N_0xdd6bcf9e94425df9()
	return _in(0xDD6BCF9E94425DF9)
end

--- returns a notification handle, prints out a notification like below:
-- type range: 0
-- if you set type to 1, button accepts "~INPUT_SOMETHING~"
-- example:
-- UI::_0xDD6CB2CCE7C2735C(1, "~INPUT_TALK~", "Who you trynna get crazy with, ese? Don't you know I'm LOCO?!");
-- - imgur.com/UPy0Ial
-- Examples from the scripts:
-- l_D1[1/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_REPLAY_START_STOP_RECORDING~","");
-- l_D1[2/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_SAVE_REPLAY_CLIP~","");
-- l_D1[1/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_REPLAY_START_STOP_RECORDING~","");
-- l_D1[2/*1*/]=UI::_DD6CB2CCE7C2735C(1,"~INPUT_REPLAY_START_STOP_RECORDING_SECONDARY~","");
function Global.N_0xdd6cb2cce7c2735c(type, button, text)
	return _in(0xDD6CB2CCE7C2735C, type, _ts(button), _ts(text), _r, _ri)
end

function Global.N_0xdd79df9f4d26e1c9()
	return _in(0xDD79DF9F4D26E1C9)
end

function Global.N_0xddc635d5b3262c56(p0)
	return _in(0xDDC635D5B3262C56, _ii(p0) --[[ may be optional ]])
end

function Global.N_0xde03620f8703a9df()
	return _in(0xDE03620F8703A9DF, _r, _ri)
end

--- No use in scripts.
function Global.N_0xde45d1a1ef45ee61(player, toggle)
	return _in(0xDE45D1A1EF45EE61, player, toggle)
end
Global.SetHudAnimStopLevel = Global.N_0xde45d1a1ef45ee61

function Global.N_0xde81239437e8c5a8()
	return _in(0xDE81239437E8C5A8)
end

function Global.N_0xdea36202fc3382df(p0)
	return _in(0xDEA36202FC3382DF, p0)
end

function Global.N_0xdeaaf77eb3687e97(p0, p1)
	return _in(0xDEAAF77EB3687E97, p0, _ii(p1) --[[ may be optional ]], _r, _ri)
end

--- Only found twice in decompiled scripts. Something to do with an entity/object?
-- On a side note, it's very interesting how the hash for this native is "DEADC0DE" - this is usually used as padding for initializing a buffer of some sort. I wonder if this native is actually "dead"?
-- "carmod_shop.ysc", line 9520:
-- if (ENTITY::DOES_ENTITY_EXIST(l_324._f6)) {
-- GRAPHICS::_0xDEADC0DEDEADC0DE(l_324._f6);
-- }
-- "fm_mission_controller.ysc", line 189641:
-- if (GAMEPLAY::IS_BIT_SET(g_1870E1._f7B64[a_0/*104*/]._f25, 28)) {
-- GRAPHICS::_0xDEADC0DEDEADC0DE(NETWORK::NET_TO_OBJ(l_4064._f26A._f87[a_0/*1*/]));
-- if (!GAMEPLAY::IS_BIT_SET(g_1870E1._f7B64[a_0/*104*/]._f25, 31)) {
-- if (!ENTITY::IS_ENTITY_DEAD(v_7)) {
-- AUDIO::PLAY_SOUND_FROM_ENTITY(-1, "EMP_Vehicle_Hum", v_7, "DLC_HEIST_BIOLAB_DELIVER_EMP_SOUNDS", 0, 0);
-- GAMEPLAY::SET_BIT(&amp;g_1870E1._f7B64[a_0/*104*/]._f25, 31);
-- }
-- }
-- }
-- Console Hash: 0xC12AC47A
-- ----------
-- It's most likely named UPDATE_* (like UPDATE_ENTITY_SHIT_OR_SOMETHING).
function Global.N_0xdeadc0dedeadc0de(object)
	return _in(0xDEADC0DEDEADC0DE, object)
end

function Global.N_0xdeb2b99a1af1a2a6(p0)
	return _in(0xDEB2B99A1AF1A2A6, p0, _r, _ri)
end

--- Scripts use 0.2, 0.5 and 1.0.
-- SET_DRIVER_*
function Global.N_0xded5af5a0ea4b297(driver, p1)
	return _in(0xDED5AF5A0EA4B297, driver, p1)
end

function Global.N_0xdf4b952f7d381b95()
	return _in(0xDF4B952F7D381B95, _r, _ri)
end

function Global.N_0xdf649c4e9afdd788()
	return _in(0xDF649C4E9AFDD788, _r, _ri)
end

--- Outputs 2 Vector3's.
-- Scripts check if out2.x - out1.x &gt; someshit.x
-- Could be suspension related, as in max suspension height and min suspension height, considering the natives location.
function Global.N_0xdf7e3eeb29642c38(vehicle)
	return _in(0xDF7E3EEB29642C38, vehicle, _v, _v)
end

function Global.N_0xdf97cdd4fc08fd34(p0)
	return _in(0xDF97CDD4FC08FD34, p0, _r)
end

function Global.N_0xdfa80cb25d0a19b3()
	return _in(0xDFA80CB25D0A19B3, _r, _ri)
end

--- From a quick disassembly I can say that this has something to do with weapons.
-- Added params according to what I could see in IDA.
function Global.N_0xdfb4138eefed7b81(ped, weaponHash, radius, p4)
	return _in(0xDFB4138EEFED7B81, ped, _ch(weaponHash), radius, _i, p4, _r)
end

--- gets some camera far clip
function Global.N_0xdfc8cbc606fdb0fc()
	return _in(0xDFC8CBC606FDB0FC, _r, _rf)
end

function Global.N_0xdffcef48e511db48(p0, p1)
	return _in(0xDFFCEF48E511DB48, p0, p1)
end

function Global.N_0xe0130b41d3cf4574()
	return _in(0xE0130B41D3CF4574, _r, _rf)
end

function Global.N_0xe01903c47c7ac89e()
	return _in(0xE01903C47C7AC89E)
end

function Global.N_0xe058175f8eafe79a(p0)
	return _in(0xE058175F8EAFE79A, p0)
end

function Global.N_0xe05dd0e9707003a3(p0, p1)
	return _in(0xE05DD0E9707003A3, p0, p1)
end

function Global.N_0xe0a6138401bcb837()
	return _in(0xE0A6138401BCB837, _r, _ri)
end

function Global.N_0xe111a7c0d200cbc5(p0, p1)
	return _in(0xE111A7C0D200CBC5, p0, p1)
end

--- p1 always false.
function Global.N_0xe12abe5e3a389a6c(entity, p1)
	return _in(0xE12ABE5E3A389A6C, entity, p1)
end

--- This function is hard-coded to always return 1.
function Global.N_0xe154b48b68ef72bc(p0)
	return _in(0xE154B48B68EF72BC, p0, _r, _ri)
end

function Global.N_0xe16142b94664defd(vehicle, p1)
	return _in(0xE16142B94664DEFD, vehicle, p1)
end

--- Used with IS_LOOK_INVERTED() and negates its affect.
-- --
-- Not sure how the person above got that description, but here's an actual example:
-- if (CONTROLS::_GET_LAST_INPUT_METHOD(2)) {
-- if (a_5) {
-- if (CONTROLS::IS_LOOK_INVERTED()) {
-- a_3 *= -1;
-- }
-- if (CONTROLS::_E1615EC03B3BB4FD()) {
-- a_3 *= -1;
-- }
-- }
-- }
function Global.N_0xe1615ec03b3bb4fd()
	return _in(0xE1615EC03B3BB4FD, _r)
end

function Global.N_0xe1c8709406f2c41c()
	return _in(0xE1C8709406F2C41C)
end

function Global.N_0xe1ca84ebf72e691d(p0, p1)
	return _in(0xE1CA84EBF72E691D, p0, p1, _i, _i, _i)
end

function Global.N_0xe1cd1e48e025e661()
	return _in(0xE1CD1E48E025E661)
end

function Global.N_0xe260e0bb9cd995ac(p0)
	return _in(0xE260E0BB9CD995AC, p0, _r)
end

function Global.N_0xe266ed23311f24d4(p0, p3, p4, p5)
	return _in(0xE266ED23311F24D4, p0, _i, _i, p3, p4, p5)
end

function Global.N_0xe2892e7e55d7073a(p0)
	return _in(0xE2892E7E55D7073A, p0)
end

function Global.N_0xe301bd63e9e13cf0(vehicle, cargobob)
	return _in(0xE301BD63E9E13CF0, vehicle, cargobob)
end

--- REMOTE_VEHICLE_*
function Global.N_0xe30524e1871f481d(p0)
	return _in(0xE30524E1871F481D, p0)
end

--- IS_*
function Global.N_0xe33ffa906ce74880(vehicle, p1)
	return _in(0xE33FFA906CE74880, vehicle, p1, _r)
end

function Global.N_0xe36a98d8ab3d3c66(p0)
	return _in(0xE36A98D8AB3D3C66, p0)
end

--- only documented to be continued...
function Global.N_0xe3a7742e0b7a2f8b(x1, y1, z1, x2, y2, z2, damage, p7, weaponHash, ownerPed, isAudible, isInvisible, speed, entity)
	return _in(0xE3A7742E0B7A2F8B, x1, y1, z1, x2, y2, z2, damage, p7, _ch(weaponHash), ownerPed, isAudible, isInvisible, speed, entity)
end

function Global.N_0xe3b05614dce1d014(p0)
	return _in(0xE3B05614DCE1D014, p0, _r, _ri)
end

--- sets something to 1
function Global.N_0xe3d969d2785ffb5e()
	return _in(0xE3D969D2785FFB5E)
end

function Global.N_0xe3e2c1b4c59dbc77(p0)
	return _in(0xE3E2C1B4C59DBC77, p0)
end

function Global.N_0xe3e5a7c64ca2c6ed()
	return _in(0xE3E5A7C64CA2C6ED, _r, _ri)
end

--- No observed effect.
function Global.N_0xe3ebaae484798530(vehicle, p1)
	return _in(0xE3EBAAE484798530, vehicle, p1)
end

function Global.N_0xe43a13c9e4cccbcf(ped, p1)
	return _in(0xE43A13C9E4CCCBCF, ped, p1)
end

function Global.N_0xe44a982368a4af23(vehicle, vehicle2)
	return _in(0xE44A982368A4AF23, vehicle, vehicle2)
end

function Global.N_0xe45087d85f468bc2(p0, p1)
	return _in(0xE45087D85F468BC2, p0, _ii(p1) --[[ may be optional ]])
end

function Global.N_0xe4723db6e736ccff(ped, p1, p2, p3, p4, p5, p6)
	return _in(0xE4723DB6E736CCFF, ped, p1, p2, p3, p4, p5, p6)
end

function Global.N_0xe496a53ba5f50a56(p0)
	return _in(0xE496A53BA5F50A56, p0, _r, _ri)
end

function Global.N_0xe4dcec7fd5b739a5(ped)
	return _in(0xE4DCEC7FD5B739A5, ped)
end

function Global.N_0xe4e6dd5566d28c82()
	return _in(0xE4E6DD5566D28C82)
end

function Global.N_0xe52b8e7f85d39a08(ped, unk)
	return _in(0xE52B8E7F85D39A08, ped, unk)
end

function Global.N_0xe532ec1a63231b4f(p0, p1)
	return _in(0xE532EC1A63231B4F, p0, p1)
end

function Global.N_0xe5810ac70602f2f5(vehicle, p1)
	return _in(0xE5810AC70602F2F5, vehicle, p1)
end

function Global.N_0xe59343e9e96529e7()
	return _in(0xE59343E9E96529E7, _r, _ri)
end

function Global.N_0xe599a503b3837e1b()
	return _in(0xE599A503B3837E1B, _r, _rf)
end

function Global.N_0xe620fd3512a04f18(p0)
	return _in(0xE620FD3512A04F18, p0)
end

function Global.N_0xe63d7c6eececb66b(p0)
	return _in(0xE63D7C6EECECB66B, p0)
end

function Global.N_0xe64a3ca08dfa37a9(p0)
	return _in(0xE64A3CA08DFA37A9, p0, _r)
end

function Global.N_0xe66c690248f11150(p0, p1)
	return _in(0xE66C690248F11150, p0, p1)
end

function Global.N_0xe67c6dfd386ea5e7(p0)
	return _in(0xE67C6DFD386EA5E7, p0)
end

function Global.N_0xe6869becdd8f2403(p0, p1)
	return _in(0xE6869BECDD8F2403, p0, p1)
end

--- Performs the same type of trace as START_SHAPE_TEST_CAPSULE, but with some different hardcoded parameters.
function Global.N_0xe6ac6c45fbe83004(x1, y1, z1, x2, y2, z2, radius, flags, entity, p9)
	return _in(0xE6AC6C45FBE83004, x1, y1, z1, x2, y2, z2, radius, flags, entity, p9, _r, _ri)
end

--- GET_VEHICLE_*
function Global.N_0xe6b0e8cfc3633bf0(vehicle)
	return _in(0xE6B0E8CFC3633BF0, vehicle, _r, _ri)
end

function Global.N_0xe6c0c80b8c867537(p0)
	return _in(0xE6C0C80B8C867537, p0)
end

function Global.N_0xe6ca85e7259ce16b(p0)
	return _in(0xE6CA85E7259CE16B, p0)
end

function Global.N_0xe6de0561d9232a64()
	return _in(0xE6DE0561D9232A64)
end

function Global.N_0xe6f13851780394da(vehicle, p1)
	return _in(0xE6F13851780394DA, vehicle, p1)
end

function Global.N_0xe70ba7b90f8390dc(p0, p1, p2, p3)
	return _in(0xE70BA7B90F8390DC, p0, p1, p2, p3)
end

function Global.N_0xe73364db90778ffa()
	return _in(0xE73364DB90778FFA, _r, _ri)
end

--- This function is hard-coded to always return 0.
function Global.N_0xe791df1f73ed2c8b(p0)
	return _in(0xE791DF1F73ED2C8B, p0, _r, _ri)
end

function Global.N_0xe7e4c198b0185900(p0, p1, p2)
	return _in(0xE7E4C198B0185900, p0, p1, p2)
end

--- This method is the equivalent to PUSH_SCALEFORM_MOVIE_FUNCTION_PARAMETER_STRING when using it to add a new button (like "INSTRUCTIONAL_BUTTONS").
-- When switching with a controller, the icons update and become the controller's icons.
function Global.N_0xe83a3e3557a56640(button)
	return _in(0xE83A3E3557A56640, _ts(button))
end

--- Vehicle must be a boat.
function Global.N_0xe842a9398079bd82(vehicle, p1)
	return _in(0xE842A9398079BD82, vehicle, p1)
end

function Global.N_0xe851e480b814d4ba(vehicle, p1)
	return _in(0xE851E480B814D4BA, vehicle, p1)
end

function Global.N_0xe861d0b05c7662b8(p0, p1, p2)
	return _in(0xE861D0B05C7662B8, p0, p1, p2)
end

function Global.N_0xe8a169e666cbc541()
	return _in(0xE8A169E666CBC541, _r, _ri)
end

function Global.N_0xe8b9c0ec9e183f35()
	return _in(0xE8B9C0EC9E183F35, _r, _ri)
end

function Global.N_0xe95b0c7d5ba3b96b(p0)
	return _in(0xE95B0C7D5BA3B96B, p0, _r)
end

function Global.N_0xe95c8a1875a02ca4(p0, p1, p2)
	return _in(0xE95C8A1875A02CA4, p0, p1, p2)
end

function Global.N_0xe9b99b6853181409()
	return _in(0xE9B99B6853181409)
end

function Global.N_0xe9ea16d6e54cdca4(p0, p1)
	return _in(0xE9EA16D6E54CDCA4, p0, p1, _r, _ri)
end

function Global.N_0xea14eef5b7cd2c30()
	return _in(0xEA14EEF5B7CD2C30, _r, _ri)
end

function Global.N_0xea2f2061875eed90()
	return _in(0xEA2F2061875EED90, _r, _ri)
end

function Global.N_0xea9960d07dadcf10(p0)
	return _in(0xEA9960D07DADCF10, p0, _r, _ri)
end

function Global.N_0xeaf0fa793d05c592()
	return _in(0xEAF0FA793D05C592, _r, _ri)
end

function Global.N_0xeb078ca2b5e82add(p0, p1)
	return _in(0xEB078CA2B5E82ADD, p0, p1)
end

function Global.N_0xeb2104e905c6f2e9()
	return _in(0xEB2104E905C6F2E9, _r, _ri)
end

function Global.N_0xeb2d525b57f42b40()
	return _in(0xEB2D525B57F42B40)
end

function Global.N_0xeb3dac2c86001e5e()
	return _in(0xEB3DAC2C86001E5E, _r)
end

function Global.N_0xeb6f1a9b5510a5d2(p0, p1)
	return _in(0xEB6F1A9B5510A5D2, p0, p1)
end

function Global.N_0xeb709a36958abe0d(gamerTagId)
	return _in(0xEB709A36958ABE0D, gamerTagId, _r)
end

function Global.N_0xebb376779a760aa8()
	return _in(0xEBB376779A760AA8, _r, _ri)
end

--- MulleDK19: This function is hard-coded to always return 1.
function Global.N_0xebcab9e5048434f4()
	return _in(0xEBCAB9E5048434F4, _r, _ri)
end

function Global.N_0xebd0edba5be957cf(ped)
	return _in(0xEBD0EDBA5BE957CF, ped, _r)
end

function Global.N_0xebd3205a207939ed(p0)
	return _in(0xEBD3205A207939ED, p0)
end

--- example from scripts:
-- unk_0xE0C28DB5(0,Global_2398291.imm_726,1);
-- that global is for ps3/xbox not pc
-- no idea what this does does
function Global.N_0xebefc2e77084f599(p0, p1, p2)
	return _in(0xEBEFC2E77084F599, p0, _ts(p1), p2)
end

function Global.N_0xebf8284d8cadeb53()
	return _in(0xEBF8284D8CADEB53)
end

function Global.N_0xebfa8d50addc54c4(p0)
	return _in(0xEBFA8D50ADDC54C4, p0, _r)
end

--- SET_PED_*
-- Has most likely to do with some shooting attributes as it sets the float which is in the same range as shootRate.
function Global.N_0xec4b4b3b9908052a(ped, unk)
	return _in(0xEC4B4B3B9908052A, ped, unk)
end

function Global.N_0xec52c631a1831c03(p0)
	return _in(0xEC52C631A1831C03, p0)
end

function Global.N_0xec6935ebe0847b90(p0, p1, p2, p3)
	return _in(0xEC6935EBE0847B90, p0, p1, p2, p3, _r, _ri)
end

--- This function is hard-coded to always return 0.
function Global.N_0xec72c258667be5ea(p0)
	return _in(0xEC72C258667BE5EA, p0, _r, _ri)
end

function Global.N_0xec9264727eec0f28()
	return _in(0xEC9264727EEC0F28)
end

function Global.N_0xecb41ac6ab754401()
	return _in(0xECB41AC6AB754401, _r)
end

function Global.N_0xecf128344e9ff9f1(p0)
	return _in(0xECF128344E9FF9F1, p0)
end

function Global.N_0xed3c76adfa6d07c4(p0)
	return _in(0xED3C76ADFA6D07C4, p0)
end

function Global.N_0xed6d8e27a43b8cde(p0)
	return _in(0xED6D8E27A43B8CDE, p0, _r)
end

function Global.N_0xed8286f71a819baa(cargobob, p1)
	return _in(0xED8286F71A819BAA, cargobob, p1)
end

function Global.N_0xedf7f927136c224b()
	return _in(0xEDF7F927136C224B, _r, _ri)
end

function Global.N_0xee066c7006c49c0a(p0, p1, p2)
	return _in(0xEE066C7006C49C0A, p0, p1, _ii(p2) --[[ may be optional ]])
end

--- Hides the hud element displayed by _0x523A590C1A3CC0D3
function Global.N_0xee4c0e6dbc6f2c6f()
	return _in(0xEE4C0E6DBC6F2C6F)
end

function Global.N_0xee76ff7e6a0166b0(headDisplayId, p1)
	return _in(0xEE76FF7E6A0166B0, headDisplayId, p1)
end

--- interprets the result of CAM::_0x19CAFA3C87F7C2FF()
-- example: // checks if you're currently in first person
-- if ((CAM::_EE778F8C7E1142E2(CAM::_19CAFA3C87F7C2FF()) == 4) &amp;&amp; (!__463_$28ED382849B17AFC())) {
-- UI::_FDEC055AB549E328();
-- UI::_SET_NOTIFICATION_TEXT_ENTRY("REC_FEED_WAR");
-- l_CE[0/*1*/] = UI::_DRAW_NOTIFICATION(0, 1);
-- }
function Global.N_0xee778f8c7e1142e2(p0)
	return _in(0xEE778F8C7E1142E2, p0, _r, _ri)
end

--- Some kind of flags.
function Global.N_0xeebfc7a7efdc35b4(vehicle)
	return _in(0xEEBFC7A7EFDC35B4, vehicle, _r, _ri)
end

function Global.N_0xeeed8fafec331a70(p0, p1, p2, p3)
	return _in(0xEEED8FAFEC331A70, p0, p1, p2, p3, _r, _ri)
end

--- dont know what this native does but im storing some documentation here
-- _NETWORK_VOICE_CONNECT_TO_PLAYER
-- _NETWORK_GET_GAMER_STATUS
-- _NETWORK_HAS_TRANSITION_INVITE_BEEN_ACKED
-- _NETWORK_SEND_PRESENCE_INVITE
-- _NETWORK_SEND_PRESENCE_TRANSITION_INVITE
-- _NETWORK_CHECK_DATA_MANAGER_SUCCEEDED_FOR_HANDLE
-- _NETWORK_CHECK_DATA_MANAGER_FOR_HANDLE
-- _NETWORK_CAN_COMMUNICATE_WITH_GAMER
-- _NETWORK_CRC_HASH_CHECK_EVENT
function Global.N_0xef0912ddf7c4cb4b()
	return _in(0xEF0912DDF7C4CB4B, _r)
end

function Global.N_0xef398beee4ef45f9(p0)
	return _in(0xEF398BEEE4EF45F9, p0)
end

function Global.N_0xef39ee20c537e98c(p0, p1, p2, p3, p4, p5)
	return _in(0xEF39EE20C537E98C, p0, p1, p2, p3, p4, p5)
end

function Global.N_0xef49cf0270307cbe()
	return _in(0xEF49CF0270307CBE)
end

function Global.N_0xef7d17bc6c85264c()
	return _in(0xEF7D17BC6C85264C, _r)
end

function Global.N_0xefabc7722293da7c()
	return _in(0xEFABC7722293DA7C)
end

function Global.N_0xefb55e7c25d3b3be()
	return _in(0xEFB55E7C25D3B3BE)
end

function Global.N_0xf033419d1b81fae8(p0)
	return _in(0xF033419D1B81FAE8, p0, _r, _ri)
end

function Global.N_0xf03755696450470c()
	return _in(0xF03755696450470C)
end

function Global.N_0xf06ebb91a81e09e3(p0)
	return _in(0xF06EBB91A81E09E3, p0)
end

function Global.N_0xf083835b70ba9bfe()
	return _in(0xF083835B70BA9BFE)
end

function Global.N_0xf086ad9354fac3a3(p0)
	return _in(0xF086AD9354FAC3A3, p0)
end

function Global.N_0xf0daef2f545bee25(p0)
	return _in(0xF0DAEF2F545BEE25, p0, _r)
end

--- Adds some kind of shadow to the vehicle.
function Global.N_0xf0e4ba16d1db546c(vehicle, p1, p2)
	return _in(0xF0E4BA16D1DB546C, vehicle, p1, p2)
end

--- IS_OBJECT_???
function Global.N_0xf0eed5a6bc7b237a(p0, entity, p2)
	return _in(0xF0EED5A6BC7B237A, p0, entity, p2, _r)
end

function Global.N_0xf0f2103efaf8cba7(p0, p1)
	return _in(0xF0F2103EFAF8CBA7, p0, p1, _r, _rv)
end

--- Only 1 occurrence. p1 was 2.
function Global.N_0xf10b44fd479d69f3(player, p1)
	return _in(0xF10B44FD479D69F3, player, p1, _r)
end

function Global.N_0xf13fe2a80c05c561()
	return _in(0xF13FE2A80C05C561, _r, _ri)
end

function Global.N_0xf154b8d1775b2dec(p0)
	return _in(0xF154B8D1775B2DEC, p0)
end

--- Sets profile setting 933
function Global.N_0xf1a1803d3476f215(value)
	return _in(0xF1A1803D3476F215, value)
end

function Global.N_0xf1a6c18b35bcade6(p0)
	return _in(0xF1A6C18B35BCADE6, p0)
end

--- LEADERBOARDS2_READ_BY_???
function Global.N_0xf1ae5dcdbfca2721()
	return _in(0xF1AE5DCDBFCA2721, _i, _i, _i, _r)
end

function Global.N_0xf1b84178f8674195(p0)
	return _in(0xF1B84178F8674195, p0)
end

function Global.N_0xf1c03a5352243a30(p0)
	return _in(0xF1C03A5352243A30, p0)
end

function Global.N_0xf1cea8a4198d8e9a(p0)
	return _in(0xF1CEA8A4198D8E9A, _ts(p0), _r)
end

function Global.N_0xf1e22dc13f5eebad(p0)
	return _in(0xF1E22DC13F5EEBAD, p0)
end

function Global.N_0xf1eea2dda9ffa69d(p0)
	return _in(0xF1EEA2DDA9FFA69D, p0)
end

--- 2 calls found in the b617d scripts:
-- AUDIO::_F1F8157B8C3F171C(l_A42, "Franklin_Bike_Rev", "BIG_SCORE_3A_SOUNDS");
-- AUDIO::_F1F8157B8C3F171C(l_166, "Trevor_Revs_Off", "PALETO_SCORE_SETUP_SOUNDS");
function Global.N_0xf1f8157b8c3f171c(p0, p1, p2)
	return _in(0xF1F8157B8C3F171C, p0, _ts(p1), _ts(p2))
end

function Global.N_0xf22ca0fd74b80e7a(p0)
	return _in(0xF22CA0FD74B80E7A, p0, _r)
end

function Global.N_0xf2385935bffd4d92(p0)
	return _in(0xF2385935BFFD4D92, p0, _r)
end

function Global.N_0xf239400e16c23e08(p0, p1)
	return _in(0xF239400E16C23E08, p0, p1)
end

function Global.N_0xf25e02cb9c5818f8()
	return _in(0xF25E02CB9C5818F8)
end

function Global.N_0xf284ac67940c6812()
	return _in(0xF284AC67940C6812, _r, _ri)
end

--- toggle was always 0 except in one instance (b678).
-- The one time this is set to true seems to do with when you fail the mission.
function Global.N_0xf2bebcdfafdaa19e(toggle)
	return _in(0xF2BEBCDFAFDAA19E, toggle)
end

--- MulleDK19: This function is hard-coded to always return 0.
function Global.N_0xf2ca003f167e21d2()
	return _in(0xF2CA003F167E21D2, _r, _ri)
end
Global.ReturnZero = Global.N_0xf2ca003f167e21d2

--- MulleDK19: This function is hard-coded to always return 1.
function Global.N_0xf2e07819ef1a5289()
	return _in(0xF2E07819EF1A5289, _r)
end

function Global.N_0xf2e1a7133dd356a6(hash, toggle)
	return _in(0xF2E1A7133DD356A6, _ch(hash), toggle)
end

function Global.N_0xf2eac213d5ea0623()
	return _in(0xF2EAC213D5EA0623, _r, _ri)
end

function Global.N_0xf2f6a2fa49278625(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0xF2F6A2FA49278625, p0, p1, p2, p3, p4, p5, p6, p7, p8, _i, _i, _i, _i)
end

function Global.N_0xf3365489e0dd50f9(p0, p1)
	return _in(0xF3365489E0DD50F9, p0, p1)
end

--- characters
-- 0: Michael
-- 1: Franklin
-- 2: Trevor
-- 3: MPMale
-- 4: MPFemale
function Global.N_0xf3fbe2d50a6a8c28(character, p1)
	return _in(0xF3FBE2D50A6A8C28, character, p1, _r, _ri)
end

function Global.N_0xf41b5d290c99a3d6(p0)
	return _in(0xF41B5D290C99A3D6, p0, _r)
end

function Global.N_0xf434a10ba01c37d0(p0)
	return _in(0xF434A10BA01C37D0, p0)
end

function Global.N_0xf445de8da80a1792()
	return _in(0xF445DE8DA80A1792, _r, _ri)
end

--- Another function related to "HUD scaleforms"
function Global.N_0xf44a5456ac3f4f97(p0)
	return _in(0xF44A5456AC3F4F97, p0)
end

--- bufferSize is 35 in the scripts.
function Global.N_0xf45352426ff3a4f0(bufferSize)
	return _in(0xF45352426FF3A4F0, _i, bufferSize, _i)
end

function Global.N_0xf46a1e03e8755980(p0)
	return _in(0xF46A1E03E8755980, p0)
end

function Global.N_0xf488c566413b4232(p0, p1)
	return _in(0xF488C566413B4232, p0, p1)
end

function Global.N_0xf49abc20d8552257(p0)
	return _in(0xF49ABC20D8552257, p0)
end

function Global.N_0xf4a0dadb70f57fa6()
	return _in(0xF4A0DADB70F57FA6)
end

--- Something to do with shake:
-- CAM::_F4C8CF9E353AFECA("HAND_SHAKE", 0.2);
function Global.N_0xf4c8cf9e353afeca(p0, p1)
	return _in(0xF4C8CF9E353AFECA, _ts(p0), p1)
end

--- Needs more research. Possibly used to calculate the "mask" when calling "STAT_SET_BOOL_MASKED"?
function Global.N_0xf4d8e7ac2a27758c(p0)
	return _in(0xF4D8E7AC2A27758C, p0, _r, _ri)
end

function Global.N_0xf4f2c0d4ee209e20()
	return _in(0xF4F2C0D4EE209E20)
end

function Global.N_0xf4ff020a08bc8863(p0, p1)
	return _in(0xF4FF020A08BC8863, p0, p1)
end

--- This does not move an existing checkpoint... so wtf.
function Global.N_0xf51d36185993515d(checkpoint, posX, posY, posZ, unkX, unkY, unkZ)
	return _in(0xF51D36185993515D, checkpoint, posX, posY, posZ, unkX, unkY, unkZ)
end

function Global.N_0xf53e48461b71eecb(p0)
	return _in(0xF53E48461B71EECB, p0, _r)
end

function Global.N_0xf55e4046f6f831dc(p0, p1)
	return _in(0xF55E4046F6F831DC, p0, p1)
end

function Global.N_0xf56dfb7b61be7276(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	return _in(0xF56DFB7B61BE7276, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, _ii(p12) --[[ may be optional ]], _r)
end

function Global.N_0xf5846edb26a98a24(ped, p1)
	return _in(0xF5846EDB26A98A24, ped, p1)
end

function Global.N_0xf5bb8dac426a52c0()
	return _in(0xF5BB8DAC426A52C0, _i, _i, _i, _i)
end

--- 3 matches across 3 scripts. First 2 were 0, 3rd was 1. Possibly a bool.
-- appcamera, appmedia, and cellphone_controller.
function Global.N_0xf5bed327cea362b1(p0)
	return _in(0xF5BED327CEA362B1, p0, _r, _ri)
end

function Global.N_0xf60165e1d2c5370b(ped)
	return _in(0xF60165E1D2C5370B, ped, _i, _i, _r)
end

--- Set profile setting 501
function Global.N_0xf6792800ac95350d(p0)
	return _in(0xF6792800AC95350D, p0)
end

function Global.N_0xf6baaaf762e1bf40(p0, p1)
	return _in(0xF6BAAAF762E1BF40, _ts(p0), _ii(p1) --[[ may be optional ]], _r)
end

function Global.N_0xf70efa14fe091429(p0)
	return _in(0xF70EFA14FE091429, p0, _r, _ri)
end

function Global.N_0xf751b16fb32abc1d(p0)
	return _in(0xF751B16FB32ABC1D, p0)
end

function Global.N_0xf78b803082d4386f(p0)
	return _in(0xF78B803082D4386F, p0)
end

function Global.N_0xf78f94d60248c737(p0, p1)
	return _in(0xF78F94D60248C737, p0, p1, _r)
end

function Global.N_0xf79f9def0aade61a(ped)
	return _in(0xF79F9DEF0AADE61A, ped)
end

--- SET_TV_???
function Global.N_0xf7b38b8305f1fe8b(p0, p1, p2)
	return _in(0xF7B38B8305F1FE8B, p0, _ts(p1), p2)
end

--- Only did a quick disassembly, but this function seems to load all path nodes in the given area. Parameters appear to be start x, start y, end x, end y.
function Global.N_0xf7b79a50b905a30d(p0, p1, p2, p3)
	return _in(0xF7B79A50B905A30D, p0, p1, p2, p3, _r)
end

--- IS_S*
function Global.N_0xf7f203e31f96f6a1(vehicle, flag)
	return _in(0xF7F203E31F96F6A1, vehicle, flag, _r)
end

function Global.N_0xf814fec6a19fd6e0()
	return _in(0xF814FEC6A19FD6E0)
end

function Global.N_0xf8155a7f03ddfc8e(p0)
	return _in(0xF8155A7F03DDFC8E, p0)
end

function Global.N_0xf854439efbb3b583()
	return _in(0xF854439EFBB3B583)
end

function Global.N_0xf87d9f2301f7d206(p0)
	return _in(0xF87D9F2301F7D206, p0)
end

function Global.N_0xf8bdbf3d573049a1(p0)
	return _in(0xF8BDBF3D573049A1, p0)
end

function Global.N_0xf8c54a461c3e11dc()
	return _in(0xF8C54A461C3E11DC, _i, _i, _i, _i)
end

function Global.N_0xf8cc1ebe0b62e29f(p0)
	return _in(0xF8CC1EBE0B62E29F, p0, _r)
end

function Global.N_0xf8ebccc96adb9fb7(p0, p1, p2)
	return _in(0xF8EBCCC96ADB9FB7, p0, p1, p2)
end

function Global.N_0xf92099527db8e2a7(p0, p1)
	return _in(0xF92099527DB8E2A7, p0, p1)
end

function Global.N_0xf98dde0a8ed09323(p0)
	return _in(0xF98DDE0A8ED09323, p0)
end

function Global.N_0xf98e4b3e56afc7b1(p0, p1)
	return _in(0xF98E4B3E56AFC7B1, p0, p1)
end

--- p1 was always 1 (true).
-- Kicks the ped from the current vehicle and keeps the rendering-focus on this ped (also disables its collision). If doing this for your player ped, you'll still be able to drive the vehicle.
function Global.N_0xf9acf4a08098ea25(ped, p1)
	return _in(0xF9ACF4A08098EA25, ped, p1)
end

function Global.N_0xf9b83b77929d8863()
	return _in(0xF9B83B77929D8863, _r, _ri)
end

function Global.N_0xf9c1681347c8bd15(object)
	return _in(0xF9C1681347C8BD15, object)
end

function Global.N_0xf9e1ccae8ba4c281(p0, p1)
	return _in(0xF9E1CCAE8BA4C281, p0, p1, _i, _i, _r)
end

function Global.N_0xfa1e0e893d915215(p0)
	return _in(0xFA1E0E893D915215, p0)
end

function Global.N_0xfa2888e3833c8e96()
	return _in(0xFA2888E3833C8E96)
end

--- Another unknown label type...
-- GAMEPLAY::_FAA457EF263E8763(a_0, "Thumb_label");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f10, "Photo_label");
-- GAMEPLAY::_FAA457EF263E8763(a_0, "GXTlabel");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f21, "StringComp");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f43, "SecondStringComp");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f53, "ThirdStringComp");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f32, "SenderStringComp");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f726[v_1A/*16*/], &amp;v_20); // where v_20 is "LastJobTL_0_1" thru "LastJobTL_2_1", gets saved in a struct called "LAST_JobGamer_TL"
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f4B, "PAID_PLAYER");
-- GAMEPLAY::_FAA457EF263E8763(&amp;a_0._f5B, "RADIO_STATION");
function Global.N_0xfaa457ef263e8763(name)
	return _in(0xFAA457EF263E8763, _i, _ts(name))
end

function Global.N_0xfae628f1e9adb239(p0, p1, p2)
	return _in(0xFAE628F1E9ADB239, p0, p1, p2)
end

function Global.N_0xfaf2a78061fd9ef4(p0, p1, p2, p3)
	return _in(0xFAF2A78061FD9EF4, p0, p1, p2, p3)
end

function Global.N_0xfb00ca71da386228()
	return _in(0xFB00CA71DA386228)
end

function Global.N_0xfb199266061f820a()
	return _in(0xFB199266061F820A, _r, _ri)
end

--- p0 is always 0. p1 is pointing to a global.
function Global.N_0xfb1f9381e80fa13f(p0, p1)
	return _in(0xFB1F9381E80FA13F, p0, p1, _r, _ri)
end

function Global.N_0xfb680d403909dc70(p0, p1)
	return _in(0xFB680D403909DC70, p0, p1)
end

function Global.N_0xfb8f2a6f3df08cbe()
	return _in(0xFB8F2A6F3DF08CBE)
end

function Global.N_0xfbc5e768c7a77a6a()
	return _in(0xFBC5E768C7A77A6A, _r, _ri)
end

function Global.N_0xfbe20329593dec9d(p0, p1, p2, p3)
	return _in(0xFBE20329593DEC9D, p0, p1, p2, p3)
end

function Global.N_0xfc18db55ae19e046(p0)
	return _in(0xFC18DB55AE19E046, p0)
end

function Global.N_0xfc859e2374407556()
	return _in(0xFC859E2374407556, _r)
end

function Global.N_0xfccae5b92a830878(p0)
	return _in(0xFCCAE5B92A830878, p0, _r)
end

function Global.N_0xfcf37a457cb96dc0(p0, p1, p2, p3, p4)
	return _in(0xFCF37A457CB96DC0, p0, p1, p2, p3, p4, _r)
end

function Global.N_0xfd3151cd37ea2245(p0)
	return _in(0xFD3151CD37EA2245, p0)
end

function Global.N_0xfd75dabc0957bf33(p0)
	return _in(0xFD75DABC0957BF33, p0)
end

--- NETWORK_IS_IN_???
function Global.N_0xfd8b834a8ba05048()
	return _in(0xFD8B834A8BA05048, _r, _ri)
end

function Global.N_0xfdb423997fa30340()
	return _in(0xFDB423997FA30340)
end

--- console hash: 0x45268B6F
-- Most likely ADD_CURRENT_*
function Global.N_0xfdbf4cdbc07e1706(x, y, z, radius, unk)
	return _in(0xFDBF4CDBC07E1706, x, y, z, radius, unk, _r, _ri)
end

function Global.N_0xfdd85225b2dea55e()
	return _in(0xFDD85225B2DEA55E)
end

function Global.N_0xfdec055ab549e328()
	return _in(0xFDEC055AB549E328)
end

function Global.N_0xfe07ff6495d52e2a(p0, p1, p2, p3)
	return _in(0xFE07FF6495D52E2A, p0, p1, p2, p3, _r, _ri)
end

function Global.N_0xfe26117a5841b2ff(vehicle, p1)
	return _in(0xFE26117A5841B2FF, vehicle, p1, _r, _ri)
end

function Global.N_0xfe4c1d0d3b9cc17e(p0, p1)
	return _in(0xFE4C1D0D3B9CC17E, p0, p1, _r)
end

function Global.N_0xfec9a3b1820f3331(p0)
	return _in(0xFEC9A3B1820F3331, p0, _r)
end

function Global.N_0xfee4a5459472a9f8()
	return _in(0xFEE4A5459472A9F8)
end

--- Tune Forward... ?
function Global.N_0xff266d1d0eb1195d()
	return _in(0xFF266D1D0EB1195D)
end

--- gets byte at offset 0x862 in the specified players data (ped data + 0xbd0) and stores the bool p1 in it.
-- lwz       r3, 0xBD0(r3) ;r3 is player data
-- lbz       r4, 0x862(r3) ;r4 is now the byte
-- insrwi    r4, r31, 1,28 ;stores p1 as a bit in place 28 idk
-- stb       r4, 0x862(r3) ; puts the newly modified one back in
-- SET_PLAYER_*
function Global.N_0xff300c7649724a0b(player, p1)
	return _in(0xFF300C7649724A0B, player, p1)
end

function Global.N_0xff4803bc019852d9(p0, p1)
	return _in(0xFF4803BC019852D9, p0, p1)
end

function Global.N_0xff56381874f82086(p0, p1, outComponent)
	return _in(0xFF56381874F82086, p0, p1, _ii(outComponent) --[[ may be optional ]], _r)
end

--- Actual name starts with START_SHAPE_TEST_??? and it returns a ShapeTest handle that can be used with GET_SHAPE_TEST_RESULT.
-- In its only usage in game scripts its called with flag set to 511, entity to player_ped_id and flag2 set to 7
function Global.N_0xff6be494c7987f34(flag, entity, flag2)
	return _in(0xFF6BE494C7987F34, _v, _v, flag, entity, flag2, _r, _ri)
end

function Global.N_0xff8f3a92b75ed67a()
	return _in(0xFF8F3A92B75ED67A, _r, _ri)
end

--- may be 0xBF21818E
-- related to: NETWORK_BAIL
-- NETWORK_BAIL_TRANSITION
-- NETWORK_JOIN_GROUP_ACTIVITY
-- NETWORK_JOIN_TRANSITION
-- NETWORK_LAUNCH_TRANSITION
-- NETWORK_SESSION_HOST
-- NETWORK_SESSION_HOST_CLOSED
-- NETWORK_SESSION_HOST_FRIENDS_ONLY
-- NETWORK_SESSION_HOST_SINGLE_PLAYER
-- NETWORK_SESSION_VOICE_LEAVE
function Global.N_0xffe1e5b792d92b34()
	return _in(0xFFE1E5B792D92B34, _r, _ri)
end

function Global.N_0xffee8fa29ab9a18e(player)
	return _in(0xFFEE8FA29AB9A18E, player)
end

function Global.NetToEnt(netHandle)
	return _in(0xBFFEAB45A9A9094A, netHandle, _r, _ri)
end

function Global.NetToObj(netHandle)
	return _in(0xD8515F5FEA14CB3F, netHandle, _r, _ri)
end

function Global.NetToPed(netHandle)
	return _in(0xBDCD95FC216A8B3E, netHandle, _r, _ri)
end

function Global.NetToVeh(netHandle)
	return _in(0x367B936610BA360C, netHandle, _r, _ri)
end

function Global.NetworkAcceptPresenceInvite(p0)
	return _in(0xFA91550DF9318B22, p0, _r)
end

--- Some of the tunable contexts used in the PC scripts:
-- - "CONTENT_MODIFIER_MP_FM_RACES"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_SEA"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_AIR"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CYCLE"
-- - "CONTENT_MODIFIER_MP_FM_RACES_BIKE"
-- - "CONTENT_MODIFIER_MP_FM_MISSIONS"
-- - "CONTENT_MODIFIER_MP_FM_CONTACT"
-- - "CONTENT_MODIFIER_MP_FM_RANDOM"
-- - "CONTENT_MODIFIER_MP_FM_VERSUS"
-- - "CONTENT_MODIFIER_MP_FM_LTS"
-- - "CONTENT_MODIFIER_MP_FM_CAPTURE"
-- - "CONTENT_MODIFIER_MP_FM_DM"
-- - "CONTENT_MODIFIER_MP_FM_SURVIVAL"
-- - "CONTENT_MODIFIER_MP_FM_GANG_ATTACK"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "BASE_GLOBALS"
-- - "MP_GLOBAL"
-- and some of the tunable names used in the PC scripts:
-- - "XP_MULTIPLIER"
-- - "CASH_MULTIPLIER"
-- - "ARMOUR_REWARD_GIFT"
-- - "TOGGLE_CREATORS_OFF"
-- - "MULTIPLAYER_DISABLED"
function Global.NetworkAccessTunableBool(tunableContext, tunableName)
	return _in(0xAA6A47A573ABB75A, _ts(tunableContext), _ts(tunableName), _r)
end
Global.N_0xaa6a47a573abb75a = Global.NetworkAccessTunableBool

--- Console Hash - 0x18867C61 = NETWORK_ACCESS_TUNABLE_BOOL_HASH
function Global.NetworkAccessTunableBoolHash(tunableContext, tunableName)
	return _in(0xEA16B69D93D71A45, _ch(tunableContext), _ch(tunableName), _r)
end
Global.N_0xea16b69d93d71a45 = Global.NetworkAccessTunableBoolHash

--- Returns a default value if the tunable don't exist.
-- Console Hash
function Global.NetworkAccessTunableBoolHashFailVal(tunableContext, tunableName, defaultValue)
	return _in(0xC7420099936CE286, _ch(tunableContext), _ch(tunableName), defaultValue, _r)
end
Global.N_0xc7420099936ce286 = Global.NetworkAccessTunableBoolHashFailVal

--- Some of the tunable contexts used in the PC scripts:
-- - "CONTENT_MODIFIER_MP_FM_RACES"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_SEA"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_AIR"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CYCLE"
-- - "CONTENT_MODIFIER_MP_FM_RACES_BIKE"
-- - "CONTENT_MODIFIER_MP_FM_MISSIONS"
-- - "CONTENT_MODIFIER_MP_FM_CONTACT"
-- - "CONTENT_MODIFIER_MP_FM_RANDOM"
-- - "CONTENT_MODIFIER_MP_FM_VERSUS"
-- - "CONTENT_MODIFIER_MP_FM_LTS"
-- - "CONTENT_MODIFIER_MP_FM_CAPTURE"
-- - "CONTENT_MODIFIER_MP_FM_DM"
-- - "CONTENT_MODIFIER_MP_FM_SURVIVAL"
-- - "CONTENT_MODIFIER_MP_FM_GANG_ATTACK"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "BASE_GLOBALS"
-- - "MP_GLOBAL"
-- - "MP_CNC_TEAM_COP"
-- - "MP_CNC_TEAM_VAGOS"
-- - "MP_CNC_TEAM_LOST"
-- - "MP_FM_DM"
-- - "MP_FM_RACES"
-- - "MP_FM_RACES_CAR"
-- - "MP_FM_RACES_BIKE"
-- - "MP_FM_RACES_CYCLE"
-- - "MP_FM_RACES_AIR"
-- - "MP_FM_RACES_SEA"
-- - "MP_FM_MISSIONS"
-- - "MP_FM_SURVIVAL
-- - "MP_FM_BASEJUMP"
-- - "MP_FM_CAPTURE"
-- - "MP_FM_LTS"
-- -"MP_FM_GANG_ATTACK"
-- and some of the tunable names used in the PC scripts:
-- - "XP_MULTIPLIER"
-- - "CASH_MULTIPLIER"
-- - "ARMOUR_REWARD_GIFT"
-- - "TOGGLE_CREATORS_OFF"
function Global.NetworkAccessTunableFloat(tunableContext, tunableName, value)
	return _in(0xE5608CA7BC163A5F, _ts(tunableContext), _ts(tunableName), _fi(value) --[[ may be optional ]], _r)
end
Global.N_0xe5608ca7bc163a5f = Global.NetworkAccessTunableFloat

--- Console Hash - 0x3972551F = NETWORK_ACCESS_TUNABLE_FLOAT_HASH
function Global.NetworkAccessTunableFloatHash(tunableContext, tunableName, value)
	return _in(0x972BC203BBC4C4D5, _ch(tunableContext), _ch(tunableName), _fi(value) --[[ may be optional ]], _r)
end
Global.N_0x972bc203bbc4c4d5 = Global.NetworkAccessTunableFloatHash

--- Some of the tunable contexts used in the PC scripts:
-- - "CONTENT_MODIFIER_MP_FM_RACES"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_SEA"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_AIR"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CYCLE"
-- - "CONTENT_MODIFIER_MP_FM_RACES_BIKE"
-- - "CONTENT_MODIFIER_MP_FM_MISSIONS"
-- - "CONTENT_MODIFIER_MP_FM_CONTACT"
-- - "CONTENT_MODIFIER_MP_FM_RANDOM"
-- - "CONTENT_MODIFIER_MP_FM_VERSUS"
-- - "CONTENT_MODIFIER_MP_FM_LTS"
-- - "CONTENT_MODIFIER_MP_FM_CAPTURE"
-- - "CONTENT_MODIFIER_MP_FM_DM"
-- - "CONTENT_MODIFIER_MP_FM_SURVIVAL"
-- - "CONTENT_MODIFIER_MP_FM_GANG_ATTACK"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "BASE_GLOBALS"
-- - "MP_GLOBAL"
-- and some of the tunable names used in the PC scripts:
-- - "XP_MULTIPLIER"
-- - "CASH_MULTIPLIER"
-- - "ARMOUR_REWARD_GIFT"
-- - "TOGGLE_CREATORS_OFF"
function Global.NetworkAccessTunableInt(tunableContext, tunableName, value)
	return _in(0x8BE1146DFD5D4468, _ts(tunableContext), _ts(tunableName), _ii(value) --[[ may be optional ]], _r)
end
Global.N_0x8be1146dfd5d4468 = Global.NetworkAccessTunableInt

--- Console Hash - 0xB2E83B75 = NETWORK_ACCESS_TUNABLE_INT_HASH
function Global.NetworkAccessTunableIntHash(tunableContext, tunableName, value)
	return _in(0x40FCE03E50E8DBE8, _ch(tunableContext), _ch(tunableName), _ii(value) --[[ may be optional ]], _r)
end
Global.N_0x40fce03e50e8dbe8 = Global.NetworkAccessTunableIntHash

function Global.NetworkActionFollowInvite()
	return _in(0xC88156EBB786F8D5, _r, _ri)
end
Global.N_0xc88156ebb786f8d5 = Global.NetworkActionFollowInvite

--- Console hash: 0xCD69BEA1
function Global.NetworkAddEntityAngledArea(p0, p1, p2, p3, p4, p5, p6)
	return _in(0x376C6375BA60293A, p0, p1, p2, p3, p4, p5, p6, _r, _ri)
end
Global.N_0x376c6375ba60293a = Global.NetworkAddEntityAngledArea

function Global.NetworkAddEntityArea(p0, p1, p2, p3, p4, p5)
	return _in(0x494C8FB299290269, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.NetworkAddEntityToSynchronisedScene(entity, netScene, animDict, animName, speed, speedMulitiplier, flag)
	return _in(0xF2404D68CBC855FA, entity, netScene, _ts(animDict), _ts(animName), speed, speedMulitiplier, flag)
end

--- ..
function Global.NetworkAddFollowers(p1)
	return _in(0x236406F60CF216D6, _i, p1)
end
Global.N_0x236406f60cf216d6 = Global.NetworkAddFollowers

function Global.NetworkAddFriend(p1)
	return _in(0x8E02D73914064223, _i, _ts(p1), _r)
end

function Global.NetworkAddPedToSynchronisedScene(ped, netScene, animDict, animnName, speed, speedMultiplier, duration, flag, playbackRate, p9)
	return _in(0x742A637471BCECD9, ped, netScene, _ts(animDict), _ts(animnName), speed, speedMultiplier, duration, flag, playbackRate, p9)
end

function Global.NetworkAmIBlockedByGamer(p0)
	return _in(0x15337C7C268A27B2, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkAmIBlockedByPlayer(player)
	return _in(0x87F395D957D4353D, player, _r)
end

function Global.NetworkAmIMutedByGamer(p0)
	return _in(0xDF02A2C93F1F26DA, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkAmIMutedByPlayer(player)
	return _in(0x9D6981DFC91A8604, player, _r)
end

function Global.NetworkApplyTransitionParameter(p0, p1)
	return _in(0x521638ADA1BA0D18, p0, p1)
end
Global.N_0x521638ada1ba0d18 = Global.NetworkApplyTransitionParameter

function Global.NetworkAreHandlesTheSame()
	return _in(0x57DBA049E110F217, _i, _i, _r)
end

--- Returns whether the Rockstar game services are available or not:
-- SCLB_NO_ROS = The Rockstar game services are unavailable right now. Please try again later.
-- prod.ros.rockstargames.com
-- prod.telemetry.ros.rockstargames.com
-- conductor-prod.ros.rockstargames.com
function Global.NetworkAreRosAvailable()
	return _in(0x85443FF4C328F53B, _r)
end
Global.N_0x85443ff4c328f53b = Global.NetworkAreRosAvailable

function Global.NetworkAreTransitionDetailsValid(p0)
	return _in(0x2615AA2A695930C1, p0, _r)
end
Global.N_0x2615aa2a695930c1 = Global.NetworkAreTransitionDetailsValid

function Global.NetworkAttachSynchronisedSceneToEntity(netScene, entity, bone)
	return _in(0x478DCBD2A98B705A, netScene, entity, bone)
end

function Global.NetworkBail()
	return _in(0x95914459A87EBA28)
end

function Global.NetworkBailTransition()
	return _in(0xEAA572036990CD1B)
end

function Global.NetworkBlockInvites(toggle)
	return _in(0x34F9E9049454A7A0, toggle)
end

function Global.NetworkBlockKickedPlayers(p0)
	return _in(0x6B07B9CE4D390375, p0)
end
Global.N_0x6b07b9ce4d390375 = Global.NetworkBlockKickedPlayers

--- p1 = 0 (always)
-- p2 = 1 (always)
function Global.NetworkBuyAirstrike(cost, p1, p2)
	return _in(0x763B4BD305338F19, cost, p1, p2)
end

--- p1 is just an assumption. p2 was false and p3 was true.
function Global.NetworkBuyBounty(amount, victim, p2, p3)
	return _in(0x7B718E197453F2D9, amount, victim, p2, p3)
end

--- The first parameter is the amount spent which is store in a global when this native is called. The global returns 10. Which is the price for both rides.
-- The last 3 parameters are,
-- 2,0,1 in the am_ferriswheel.c
-- 1,0,1 in the am_rollercoaster.c
function Global.NetworkBuyFairgroundRide(amountSpent, p1, p2, p3)
	return _in(0x8A7B3952DD64D2B5, amountSpent, p1, p2, p3)
end
Global.N_0x8a7b3952dd64d2b5 = Global.NetworkBuyFairgroundRide

function Global.NetworkBuyHealthcare(cost, p1, p2)
	return _in(0xD9B067E55253E3DD, cost, p1, p2)
end

--- p1 = 0 (always)
-- p2 = 1 (always)
function Global.NetworkBuyHeliStrike(cost, p1, p2)
	return _in(0x81AA4610E3FD3A69, cost, p1, p2)
end

function Global.NetworkBuyItem(player, item, p2, p3, p4, item_name, p6, p7, p8, p9)
	return _in(0xF0077C797F66A355, player, _ch(item), p2, p3, p4, _ts(item_name), p6, p7, p8, p9)
end

function Global.NetworkBuyProperty(propertyCost, propertyName, p2, p3)
	return _in(0x650A08A280870AF6, propertyCost, _ch(propertyName), p2, p3)
end

--- 11 - Need to download tunables.
-- 12 - Need to download background script.
-- Returns 1 if the multiplayer is loaded, otherwhise 0.
function Global.NetworkCanAccessMultiplayer(loadingState)
	return _in(0xAF50DA1A3F8B1BA4, _ii(loadingState) --[[ may be optional ]], _r)
end
Global.N_0xaf50da1a3f8b1ba4 = Global.NetworkCanAccessMultiplayer

function Global.NetworkCanBail()
	return _in(0x580CE4438479CC61, _r)
end

function Global.NetworkCanBet(p0)
	return _in(0x3A54E33660DED67F, p0, _r)
end
Global.N_0x3a54e33660ded67f = Global.NetworkCanBet

function Global.NetworkCanCommunicateWithGamer(player)
	return _in(0xA150A4F065806B1F, _ii(player) --[[ may be optional ]], _r)
end

function Global.NetworkCanEnterMultiplayer()
	return _in(0x7E782A910C362C25, _r)
end

function Global.NetworkCanReceivePlayerCash(p0, p1, p2, p3)
	return _in(0x5D17BE59D2123284, p0, p1, p2, p3, _r)
end

function Global.NetworkCanSessionEnd()
	return _in(0x4EEBC3694E49C572, _r)
end

function Global.NetworkCanSetWaypoint()
	return _in(0xC927EC229934AF60, _r)
end

function Global.NetworkCanSpendMoney(p0, p1, p2, p3, p4)
	return _in(0xAB3CAA6B422164DA, p0, p1, p2, p3, p4, _r)
end
Global.N_0xab3caa6b422164da = Global.NetworkCanSpendMoney

function Global.NetworkChangeTransitionSlots(p0, p1)
	return _in(0xEEEDA5E6D7080987, p0, p1)
end
Global.N_0xeeeda5e6d7080987 = Global.NetworkChangeTransitionSlots

--- Only documented...
function Global.NetworkClanAnimation(animDict, animName)
	return _in(0x729E3401F0430686, _ts(animDict), _ts(animName), _r)
end
Global.N_0x729e3401f0430686 = Global.NetworkClanAnimation

function Global.NetworkClanDownloadMembership(networkHandle)
	return _in(0xA989044E70010ABE, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkClanDownloadMembershipPending(p0)
	return _in(0x5B9E023DC6EBEDC0, _ii(p0) --[[ may be optional ]], _r)
end

--- BOOL DEBUG_MEMBRESHIP(int Param)
-- {
-- int membership;
-- networkHandleMgr handle;
-- NETWORK_HANDLE_FROM_PLAYER(iSelectedPlayer, &amp;handle.netHandle, 13);
-- if (!_NETWORK_IS_CLAN_MEMBERSHIP_FINISHED_DOWNLOADING())
-- {
-- if (NETWORK_CLAN_REMOTE_MEMBERSHIPS_ARE_IN_CACHE(&amp;Param))
-- {
-- if (NETWORK_CLAN_GET_MEMBERSHIP_COUNT(&amp;Param) &gt; 0)
-- {
-- if (NETWORK_CLAN_GET_MEMBERSHIP_VALID(&amp;Param, 0))
-- {
-- if (NETWORK_CLAN_GET_MEMBERSHIP(&amp;Param, &amp;membership, -1))
-- {
-- _0xF633805A(&amp;membership, 35, &amp;handle.netHandle);
-- }
-- }
-- }
-- }
-- }
-- else
-- {
-- NETWORK_CLAN_DOWNLOAD_MEMBERSHIP(&amp;handle.netHandle);
-- }
-- }
function Global.NetworkClanGetMembership(p2)
	return _in(0xC8BC2011F67B3411, _i, _i, p2, _r)
end

function Global.NetworkClanGetMembershipCount(p0)
	return _in(0xAAB11F6C4ADBC2C1, _ii(p0) --[[ may be optional ]], _r, _ri)
end

--- networkMembershipMgr memShip;
-- int maxMemship = _GET_NUM_MEMBERSHIP_DESC();
-- for (int i = 0; i &lt; maxMemship; i++)
-- {
-- NETWORK_CLAN_GET_MEMBERSHIP_DESC(&amp;memShip.memHandle, i);
-- }
function Global.NetworkClanGetMembershipDesc(p1)
	return _in(0x48DE78AF2C8885B8, _i, p1, _r)
end

function Global.NetworkClanGetMembershipValid(p1)
	return _in(0x48A59CF88D43DF0E, _i, p1, _r)
end

function Global.NetworkClanJoin(clanDesc)
	return _in(0x9FAAA4F4FC71F87F, clanDesc, _r)
end

--- bufferSize is 35 in the scripts.
-- bufferSize is the elementCount of p0(desc), sizeof(p0) == 280 == p1*8 == 35 * 8, p2(netHandle) is obtained from NETWORK::NETWORK_HANDLE_FROM_PLAYER.  And no, I can't explain why 35 * sizeof(int) == 280 and not 140, but I'll get back to you on that.
-- the answer is: because p0 an int64_t* / int64_t[35].  and FYI p2 is an int64_t[13]
-- pastebin.com/cSZniHak
function Global.NetworkClanPlayerGetDesc(bufferSize)
	return _in(0xEEE6EACBE8874FBA, _i, bufferSize, _i, _r)
end

function Global.NetworkClanPlayerIsActive(networkHandle)
	return _in(0xB124B57F571D8F18, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkClanRemoteMembershipsAreInCache(p0)
	return _in(0xBB6E6FEE99D866B2, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkClearCharacterWallet(p0)
	return _in(0xA921DED15FDF28F5, p0)
end
Global.N_0xa921ded15fdf28f5 = Global.NetworkClearCharacterWallet

function Global.NetworkClearFollowInvite()
	return _in(0x439BFDE3CD0610F6, _r, _ri)
end
Global.N_0x439bfde3cd0610f6 = Global.NetworkClearFollowInvite

function Global.NetworkClearFollowers()
	return _in(0x058F43EC59A8631A)
end
Global.N_0x058f43ec59a8631a = Global.NetworkClearFollowers

function Global.NetworkClearFoundGamers()
	return _in(0x6D14CCEE1B40381A)
end

function Global.NetworkClearPropertyId()
	return _in(0xC2B82527CA77053E)
end
Global.N_0xc2b82527ca77053e = Global.NetworkClearPropertyId

function Global.NetworkClearTransitionCreatorHandle()
	return _in(0xFB3272229A82C759)
end

function Global.NetworkClearVoiceChannel()
	return _in(0xE036A705F989E049)
end
Global.N_0xe036a705f989e049 = Global.NetworkClearVoiceChannel

function Global.NetworkCloseTransitionMatchmaking()
	return _in(0x43F4DBA69710E01E)
end
Global.N_0x43f4dba69710e01e = Global.NetworkCloseTransitionMatchmaking

--- returns netScene
-- this native is missing 2 params
-- float p10, float p11
function Global.NetworkCreateSynchronisedScene(x, y, z, xRot, yRot, zRot, p6, p7, p8, p9)
	return _in(0x7CD6BC4C2BBDD526, x, y, z, xRot, yRot, zRot, p6, p7, p8, p9, _r, _ri)
end

--- Note the 2nd parameters are always 1, 0. I have a feeling it deals with your money, wallet, bank. So when you delete the character it of course wipes the wallet cash at that time. So if that was the case, it would be eg, NETWORK_DELETE_CHARACTER(characterIndex, deleteWalletCash, deleteBankCash);
function Global.NetworkDeleteCharacter(characterIndex, p1, p2)
	return _in(0x05A50AF38947EB8D, characterIndex, p1, p2)
end

--- hash collision???
function Global.NetworkDisableInvincibleFlashing(player, p1)
	return _in(0x9DD368BF06983221, player, p1)
end
Global.N_0x9dd368bf06983221 = Global.NetworkDisableInvincibleFlashing

function Global.NetworkDoTransitionQuickmatch(p0, p1, p2, p3)
	return _in(0x71FB0EBCD4915D56, p0, p1, p2, p3, _r)
end
Global.N_0x71fb0ebcd4915d56 = Global.NetworkDoTransitionQuickmatch

function Global.NetworkDoTransitionQuickmatchAsync(p0, p1, p2, p3)
	return _in(0xA091A5E44F0072E5, p0, p1, p2, p3, _r)
end
Global.N_0xa091a5e44f0072e5 = Global.NetworkDoTransitionQuickmatchAsync

function Global.NetworkDoTransitionQuickmatchWithGroup(p0, p1, p2, p3, p5)
	return _in(0x9C4AB58491FDC98A, p0, p1, p2, p3, _i, p5, _r)
end

--- p2 is true 3/4 of the occurrences I found.
-- 'players' is the number of players for a session. On PS3/360 it's always 18. On PC it's 32.
function Global.NetworkDoTransitionToFreemode(p1, p2, players, p4)
	return _in(0x3AAD8B2FCA1E289F, _i, p1, p2, players, p4, _r)
end

function Global.NetworkDoTransitionToGame(p0, maxPlayers)
	return _in(0x3E9BB38102A589B0, p0, maxPlayers, _r)
end

function Global.NetworkDoTransitionToNewFreemode(players, p3, p4, p5)
	return _in(0x9E80A5BA8109F974, _i, _i, players, p3, p4, p5, _r)
end

function Global.NetworkDoTransitionToNewGame(p0, maxPlayers, p2)
	return _in(0x4665F51EFED00034, p0, maxPlayers, p2, _r)
end

function Global.NetworkDoesEntityExistWithNetworkId(entity)
	return _in(0x18A47D074708FD68, entity, _r)
end

function Global.NetworkDoesNetworkIdExist(netID)
	return _in(0x38CE16C96BD11344, netID, _r)
end

--- Some of the tunable contexts used in the PC scripts:
-- - "CONTENT_MODIFIER_MP_FM_RACES"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_SEA"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CAR"
-- - "CONTENT_MODIFIER_MP_FM_RACES_AIR"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "CONTENT_MODIFIER_MP_FM_RACES_CYCLE"
-- - "CONTENT_MODIFIER_MP_FM_RACES_BIKE"
-- - "CONTENT_MODIFIER_MP_FM_MISSIONS"
-- - "CONTENT_MODIFIER_MP_FM_CONTACT"
-- - "CONTENT_MODIFIER_MP_FM_RANDOM"
-- - "CONTENT_MODIFIER_MP_FM_VERSUS"
-- - "CONTENT_MODIFIER_MP_FM_LTS"
-- - "CONTENT_MODIFIER_MP_FM_CAPTURE"
-- - "CONTENT_MODIFIER_MP_FM_DM"
-- - "CONTENT_MODIFIER_MP_FM_SURVIVAL"
-- - "CONTENT_MODIFIER_MP_FM_GANG_ATTACK"
-- - "CONTENT_MODIFIER_MP_FM_BASEJUMP"
-- - "BASE_GLOBALS"
-- - "MP_GLOBAL"
-- and some of the tunable names used in the PC scripts:
-- - "XP_MULTIPLIER"
-- - "CASH_MULTIPLIER"
-- - "ARMOUR_REWARD_GIFT"
-- - "TOGGLE_CREATORS_OFF"
function Global.NetworkDoesTunableExist(tunableContext, tunableName)
	return _in(0x85E5F8B9B898B20A, _ts(tunableContext), _ts(tunableName), _r)
end

--- Console Hash - 0x25915CB9 = NETWORK_DOES_TUNABLE_EXIST_HASH
function Global.NetworkDoesTunableExistHash(tunbaleContext, tunableName)
	return _in(0xE4E53E1419D81127, _ch(tunbaleContext), _ch(tunableName), _r)
end
Global.N_0xe4e53e1419d81127 = Global.NetworkDoesTunableExistHash

--- DSPORT
function Global.NetworkEarnFromAiTargetKill(p0, p1)
	return _in(0x515B4A22E4D3C6D7, p0, p1)
end
Global.N_0x515b4a22e4d3c6d7 = Global.NetworkEarnFromAiTargetKill

--- Console Hash - 0xA14CC95D = NETWORK_EARN_FROM_AMBIENT_JOB
-- Example for p1: "AM_DISTRACT_COPS"
function Global.NetworkEarnFromAmbientJob(p0, p1, p2)
	return _in(0xFB6DB092FBAE29E6, p0, _ts(p1), _ii(p2) --[[ may be optional ]])
end
Global.N_0xfb6db092fbae29e6 = Global.NetworkEarnFromAmbientJob

--- For the money bags that drop a max of $40,000. Often called 40k bags.
-- Most likely NETWORK_EARN_FROM_ROB***
function Global.NetworkEarnFromArmourTruck(amount)
	return _in(0xF514621E8EA463D0, amount)
end
Global.N_0xf514621e8ea463d0 = Global.NetworkEarnFromArmourTruck

function Global.NetworkEarnFromBetting(amount, p1)
	return _in(0x827A5BA1A44ACA6D, amount, _ts(p1))
end

function Global.NetworkEarnFromBounty(amount, p3)
	return _in(0x131BB5DA15453ACF, amount, _i, _i, p3)
end

function Global.NetworkEarnFromChallengeWin(p0, p2)
	return _in(0x2B171E6B2F64D8DF, p0, _i, p2)
end
Global.N_0x2b171e6b2f64d8df = Global.NetworkEarnFromChallengeWin

function Global.NetworkEarnFromCrateDrop(amount)
	return _in(0xB1CC1B9EC3007A2A, amount)
end
Global.N_0xb1cc1b9ec3007a2a = Global.NetworkEarnFromCrateDrop

--- Console Hash - 0xAB6BD72F = NETWORK_EARN_FROM_DAILY_OBJECTIVE
function Global.NetworkEarnFromDailyObjective(p0, p1, p2)
	return _in(0x6EA318C91C1A8786, p0, _ts(p1), p2)
end
Global.N_0x6ea318c91c1a8786 = Global.NetworkEarnFromDailyObjective

function Global.NetworkEarnFromGangPickup(amount)
	return _in(0xA03D4ACE0A3284CE, amount)
end
Global.N_0xa03d4ace0a3284ce = Global.NetworkEarnFromGangPickup

function Global.NetworkEarnFromHoldups(amount)
	return _in(0x45B8154E077D9E4D, amount)
end

function Global.NetworkEarnFromImportExport(p0, p1)
	return _in(0xF92A014A634442D6, p0, p1)
end

function Global.NetworkEarnFromJob(amount, p1)
	return _in(0xB2CC4836834E8A98, amount, _ts(p1))
end

--- Console Hash - 0xBEE23713 = NETWORK_EARN_FROM_JOB_BONUS
function Global.NetworkEarnFromJobBonus(p0)
	return _in(0x6816FB4416760775, p0, _i, _i)
end
Global.N_0x6816fb4416760775 = Global.NetworkEarnFromJobBonus

--- Pretty sure this is actually a hash collision.
-- It should be NETWORK_EARN_FROM_A*** or NETWORK_EARN_FROM_B***
-- =============================================================
-- Not a hash collision, test it for yourself when finishing heist.
-- lackos; 2017.03.12
function Global.NetworkEarnFromMissionH(amount, heistHash)
	return _in(0x61326EE6DF15B0CA, amount, _ts(heistHash))
end
Global.N_0x61326ee6df15b0ca = Global.NetworkEarnFromMissionH

function Global.NetworkEarnFromNotBadsport(amount)
	return _in(0x4337511FA8221D36, amount)
end
Global.N_0x4337511fa8221d36 = Global.NetworkEarnFromNotBadsport

--- Now has 9 parameters.
function Global.NetworkEarnFromPersonalVehicle(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x3F4D00167E41E0AD, p0, p1, p2, p3, p4, p5, p6, p7, p8)
end
Global.N_0x3f4d00167e41e0ad = Global.NetworkEarnFromPersonalVehicle

function Global.NetworkEarnFromPickup(amount)
	return _in(0xED1517D3AF17C698, amount, _r, _ri)
end

function Global.NetworkEarnFromProperty(amount, propertyName)
	return _in(0x849648349D77F5C5, amount, _ch(propertyName))
end

--- This merely adds an entry in the Network Transaction Log;
-- it does not grant cash to the player (on PC).
-- Max value for amount is 9999999.
function Global.NetworkEarnFromRockstar(amount)
	return _in(0x02CE1D6AC0FC73EA, amount)
end

--- Now has 8 params.
function Global.NetworkEarnFromVehicle(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0xB539BD8A4C1EECF8, p0, p1, p2, p3, p4, p5, p6, p7)
end

--- Pretty sure this is a hash collision
function Global.NetworkEnableMotionDrugged()
	return _in(0x0B0CC10720653F3B, _r, _ri)
end
Global.N_0x0b0cc10720653f3b = Global.NetworkEnableMotionDrugged

function Global.NetworkEndTutorialSession()
	return _in(0xD0AFAFF5A51D72F7)
end

--- In the console script dumps, this is only referenced once.
-- NETWORK::NETWORK_EXPLODE_VEHICLE(vehicle, 1, 0, 0);
-- ^^^^^ That must be PC script dumps? In X360 Script Dumps it is reference a few times with 2 differences in the parameters.
-- Which as you see below is 1, 0, 0 + 1, 1, 0 + 1, 0, and a *param?
-- am_plane_takedown.c
-- network_explode_vehicle(net_to_veh(Local_40.imm_2), 1, 1, 0);
-- armenian2.c
-- network_explode_vehicle(Local_80[6 &lt;2&gt;], 1, 0, 0);
-- fm_horde_controler.c
-- network_explode_vehicle(net_to_veh(*uParam0), 1, 0, *uParam0);
-- fm_mission_controller.c, has 6 hits so not going to list them.
-- Side note, setting the first parameter to 0 seems to mute sound or so?
-- Seems it's like ADD_EXPLOSION, etc. the first 2 params. The 3rd atm no need to worry since it always seems to be 0.
function Global.NetworkExplodeVehicle(vehicle, isAudible, isInvisible, p3)
	return _in(0x301A42153C9AD707, vehicle, isAudible, isInvisible, p3, _r, _ri)
end

--- state - 0 does 5 fades
-- state - 1 does 6 fades
-- native is missing third argument, also boolean, setting to 1 made vehicle fade in slower, probably "slow" as per NETWORK_FADE_OUT_ENTITY
function Global.NetworkFadeInEntity(entity, state)
	return _in(0x1F4ED342ACEFE62D, entity, state)
end

--- normal - transition like when your coming out of LSC
-- slow - transition like when you walk into a mission
function Global.NetworkFadeOutEntity(entity, normal, slow)
	return _in(0xDE564951F95E09ED, entity, normal, slow)
end

function Global.NetworkFindMatchedGamers(p0, p1, p2, p3)
	return _in(0xF7B2CFDE5C9F700D, p0, p1, p2, p3, _r)
end
Global.N_0xf7b2cfde5c9f700d = Global.NetworkFindMatchedGamers

function Global.NetworkForceLocalUseOfSyncedSceneCamera(netScene, animDict, animName)
	return _in(0xCF8BD3B0BD6D42D7, netScene, _ts(animDict), _ts(animName))
end
Global.N_0xcf8bd3b0bd6d42d7 = Global.NetworkForceLocalUseOfSyncedSceneCamera

function Global.NetworkGamerHasHeadset(p0)
	return _in(0xF2FD55CB574BCC55, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkGamertagFromHandlePending()
	return _in(0xB071E27958EF4CF0, _r)
end

function Global.NetworkGamertagFromHandleStart(networkHandle)
	return _in(0x9F0C0A981D73FA56, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkGamertagFromHandleSucceeded()
	return _in(0xFD00798DBA7523DD, _r)
end

function Global.NetworkGetActivityPlayerNum(p0)
	return _in(0x73E2B500410DA5A2, p0, _r, _ri)
end

function Global.NetworkGetBackgroundLoadingRecipients(p0, p1)
	return _in(0x97A770BEEF227E2B, p0, p1, _i, _i, _r)
end
Global.N_0x97a770beef227e2b = Global.NetworkGetBackgroundLoadingRecipients

--- Console Hash: Probably 0xAA7EA3BD
function Global.NetworkGetBankBalanceString()
	return _in(0xA6FA3979BED01B81, _r, _s)
end
Global.N_0xa6fa3979bed01b81 = Global.NetworkGetBankBalanceString

function Global.NetworkGetCurrentlySelectedGamerHandleFromInviteMenu(p0)
	return _in(0x74881E6BCAE2327C, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkGetDesroyerOfEntity(p0, p1, p2)
	return _in(0x4CACA84440FA26F6, p0, p1, _ii(p2) --[[ may be optional ]], _r)
end
Global.N_0x4caca84440fa26f6 = Global.NetworkGetDesroyerOfEntity

function Global.NetworkGetDestroyerOfNetworkId(netId, weaponHash)
	return _in(0x7A1ADEEF01740A24, netId, _ii(weaponHash) --[[ may be optional ]], _r, _ri)
end

function Global.NetworkGetEntityFromNetworkId(netId)
	return _in(0xCE4E5D9B0A4FF560, netId, _r, _ri)
end

function Global.NetworkGetEntityIsLocal(entity)
	return _in(0x0991549DE4D64762, entity, _r)
end

function Global.NetworkGetEntityIsNetworked(entity)
	return _in(0xC7827959479DCC78, entity, _r)
end
Global.N_0xc7827959479dcc78 = Global.NetworkGetEntityIsNetworked

function Global.NetworkGetEntityKillerOfPlayer(player, weaponHash)
	return _in(0x42B2DAA6B596F5F8, player, _ii(weaponHash) --[[ may be optional ]], _r, _ri)
end

function Global.NetworkGetFoundGamer(p1)
	return _in(0x9DCFF2AFB68B3476, _i, p1, _r)
end

function Global.NetworkGetFriendCount()
	return _in(0x203F1CFD823B27A4, _r, _ri)
end

function Global.NetworkGetFriendName(player)
	return _in(0xE11EBBB2A783FE8B, player, _r, _s)
end

function Global.NetworkGetFriendNameFromIndex(friendIndex)
	return _in(0x4164F227D052E293, friendIndex, _r, _s)
end
Global.NetworkGetFriendName = Global.NetworkGetFriendNameFromIndex

function Global.NetworkGetGamertagFromHandle(networkHandle)
	return _in(0x426141162EBE5CDB, _ii(networkHandle) --[[ may be optional ]], _r, _s)
end

--- scriptName examples:
-- "freemode", "AM_CR_SecurityVan", ...
-- Most of the time, these values are used:
-- p1 = -1
-- p2 = 0
function Global.NetworkGetHostOfScript(scriptName, p1, p2)
	return _in(0x1D6A14F1F9A736FC, _ts(scriptName), p1, p2, _r, _ri)
end

function Global.NetworkGetHostOfThisScript()
	return _in(0xC7B4D79B01FA7A5C, _r, _ri)
end

--- Retrieves the local player's NetworkHandle* and stores it in the given buffer.
-- * Currently unknown struct
function Global.NetworkGetLocalHandle(bufferSize)
	return _in(0xE86051786B66CD8E, _i, bufferSize)
end

function Global.NetworkGetMaxFriends()
	return _in(0xAFEBB0D5D8F687D2, _r, _ri)
end

function Global.NetworkGetNetworkIdFromEntity(entity)
	return _in(0xA11700682F3AD45C, entity, _r, _ri)
end

--- Returns the amount of players connected in the current session. Only works when connected to a session/server.
function Global.NetworkGetNumConnectedPlayers()
	return _in(0xA4A79DD2D9600654, _r, _ri)
end

function Global.NetworkGetNumFoundGamers()
	return _in(0xA1B043EE79A916FB, _r, _ri)
end

function Global.NetworkGetNumParticipants()
	return _in(0x18D0456E86604654, _r, _ri)
end

--- Seems to always return 0, but it's used in quite a few loops.
-- for (num3 = 0; num3 &lt; NETWORK::0xCCD8C02D(); num3++)
-- {
-- if (NETWORK::NETWORK_IS_PARTICIPANT_ACTIVE(PLAYER::0x98F3B274(num3)) != 0)
-- {
-- var num5 = NETWORK::NETWORK_GET_PLAYER_INDEX(PLAYER::0x98F3B274(num3));
function Global.NetworkGetNumParticipantsHost()
	return _in(0xA6C90FBC38E395EE, _r, _ri)
end

function Global.NetworkGetNumPresenceInvites()
	return _in(0xCEFA968912D0F78D, _r, _ri)
end
Global.N_0xcefa968912d0f78d = Global.NetworkGetNumPresenceInvites

function Global.NetworkGetNumScriptParticipants(p1, p2)
	return _in(0x3658E8CD94FC121A, _i, p1, p2, _r, _ri)
end
Global.N_0x3658e8cd94fc121a = Global.NetworkGetNumScriptParticipants

function Global.NetworkGetParticipantIndex(index)
	return _in(0x1B84DF6AF2A46938, index, _r, _ri)
end

function Global.NetworkGetPlayerFromGamerHandle(networkHandle)
	return _in(0xCE5F689CF5A0A49D, _ii(networkHandle) --[[ may be optional ]], _r, _ri)
end

function Global.NetworkGetPlayerIndex(player)
	return _in(0x24FB80D107371267, player, _r, _ri)
end

--- Returns the Player associated to a given Ped when in an online session.
function Global.NetworkGetPlayerIndexFromPed(ped)
	return _in(0x6C0E2E0125610278, ped, _r, _ri)
end
Global.N_0x6c0e2e0125610278 = Global.NetworkGetPlayerIndexFromPed

function Global.NetworkGetPlayerLoudness(p0)
	return _in(0x21A1684A25C2867F, p0, _r, _rf)
end

function Global.NetworkGetPresenceInviteHandle(p0, p1)
	return _in(0x38D5B0FEBB086F75, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.NetworkGetPresenceInviteId(p0)
	return _in(0xDFF09646E12EC386, p0, _r, _ri)
end
Global.N_0xdff09646e12ec386 = Global.NetworkGetPresenceInviteId

function Global.NetworkGetPresenceInviteInviter(p0)
	return _in(0x4962CC4AA2F345B7, p0, _r, _ri)
end
Global.N_0x4962cc4aa2f345b7 = Global.NetworkGetPresenceInviteInviter

function Global.NetworkGetPresenceInviteSessionId(p0)
	return _in(0x26E1CD96B0903D60, p0, _r, _ri)
end
Global.N_0x26e1cd96b0903d60 = Global.NetworkGetPresenceInviteSessionId

function Global.NetworkGetPrimaryClanDataCancel()
	return _in(0x042E4B70B93E6054)
end
Global.N_0x042e4b70b93e6054 = Global.NetworkGetPrimaryClanDataCancel

function Global.NetworkGetPrimaryClanDataClear()
	return _in(0x9AA46BADAD0E27ED, _r, _ri)
end
Global.N_0x9aa46badad0e27ed = Global.NetworkGetPrimaryClanDataClear

function Global.NetworkGetPrimaryClanDataNew()
	return _in(0xC080FF658B2E41DA, _i, _i, _r)
end

function Global.NetworkGetPrimaryClanDataPending()
	return _in(0xB5074DB804E28CE7, _r, _ri)
end
Global.N_0xb5074db804e28ce7 = Global.NetworkGetPrimaryClanDataPending

function Global.NetworkGetPrimaryClanDataStart(p1)
	return _in(0xCE86D8191B762107, _i, p1, _r)
end

function Global.NetworkGetPrimaryClanDataSuccess()
	return _in(0x5B4F04F19376A0BA, _r, _ri)
end
Global.N_0x5b4f04f19376a0ba = Global.NetworkGetPrimaryClanDataSuccess

function Global.NetworkGetRandomInt()
	return _in(0x599E4FA1F87EB5FF, _r, _ri)
end
Global.N_0x599e4fa1f87eb5ff = Global.NetworkGetRandomInt

--- Same as GAMEPLAY::GET_RANDOM_INT_IN_RANGE
function Global.NetworkGetRandomIntInRange(rangeStart, rangeEnd)
	return _in(0xE30CF56F1EFA5F43, rangeStart, rangeEnd, _r, _ri)
end
Global.N_0xe30cf56f1efa5f43 = Global.NetworkGetRandomIntInRange

--- Based on scripts such as in freemode.c how they call their vars vVar and fVar the 2nd and 3rd param it a Vector3 and Float, but the first is based on get_random_int_in_range..
function Global.NetworkGetRespawnResult(randomInt)
	return _in(0x371EA43692861CF1, randomInt, _v, _f)
end

function Global.NetworkGetScriptStatus()
	return _in(0x57D158647A6BFABF, _r, _ri)
end

function Global.NetworkGetServerTime()
	return _in(0x6D03BFBD643B2A02, _i, _i, _i)
end
Global.N_0x6d03bfbd643b2a02 = Global.NetworkGetServerTime

function Global.NetworkGetTalkerProximity()
	return _in(0x84F0F13120B4E098, _r, _ri)
end

function Global.NetworkGetThisScriptIsNetworkScript()
	return _in(0x2910669969E9535E, _r)
end

function Global.NetworkGetTimeoutTime()
	return _in(0x5ED0356A0CE3A34F, _r, _ri)
end
Global.N_0x5ed0356a0ce3a34f = Global.NetworkGetTimeoutTime

function Global.NetworkGetTransitionHost(networkHandle)
	return _in(0x65042B9774C4435E, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkGetTransitionMembers(p1)
	return _in(0x73B000F7FBC55829, _i, p1, _r, _ri)
end

function Global.NetworkGetVcBalance()
	return _in(0x5CBAD97E059E1B94, _r, _ri)
end
Global.N_0x5cbad97e059e1b94 = Global.NetworkGetVcBalance

--- From what I can see in ida, I believe it retrieves the players online bank balance.
function Global.NetworkGetVcBankBalance()
	return _in(0x76EF28DA05EA395A, _r, _ri)
end
Global.N_0x76ef28da05ea395a = Global.NetworkGetVcBankBalance

--- From what I understand, it retrieves STAT_WALLET_BALANCE for the specified character (-1 means use MPPLY_LAST_MP_CHAR)
function Global.NetworkGetVcWalletBalance(character)
	return _in(0xA40F9C2623F6A8B5, character, _r, _ri)
end
Global.N_0xa40f9c2623f6a8b5 = Global.NetworkGetVcWalletBalance

function Global.NetworkGivePlayerJobshareCash(amount, networkHandle)
	return _in(0xFB18DF9CB95E0105, amount, _ii(networkHandle) --[[ may be optional ]])
end

function Global.NetworkHandleFromFriend(friendIndex, bufferSize)
	return _in(0xD45CB817D7E177D2, friendIndex, _i, bufferSize)
end

--- Returns a NetworkHandle* from the specified member ID and stores it in a given buffer.
-- * Currently unknown struct
function Global.NetworkHandleFromMemberId(memberId, bufferSize)
	return _in(0xA0FD21BED61E5C4C, _ts(memberId), _i, bufferSize)
end

--- Returns a handle to networkHandle* from the specified player handle and stores it in a given buffer.
-- * Currently unknown struct
-- Example:
-- std::vector&lt;UINT64&gt; GetPlayerNetworkHandle(Player player) {
-- const int size = 13;
-- uint64_t *buffer = std::make_unique&lt;uint64_t[]&gt;(size).get();
-- NETWORK::NETWORK_HANDLE_FROM_PLAYER(player, reinterpret_cast&lt;int *&gt;(buffer), 13);
-- for (int i = 0; i &lt; size; i++) {
-- Log::Msg("networkhandle[%i]: %llx", i, buffer[i]);
-- }
-- std::vector&lt;UINT64&gt; result(buffer, buffer + sizeof(buffer));
-- return result;
-- }
function Global.NetworkHandleFromPlayer(player, bufferSize)
	return _in(0x388EB2B86C73B6B3, player, _i, bufferSize)
end

--- Returns a NetworkHandle* from the specified user ID and stores it in a given buffer.
-- * Currently unknown struct
function Global.NetworkHandleFromUserId(userId, bufferSize)
	return _in(0xDCD51DD8F87AEC5C, _ts(userId), _i, bufferSize)
end

function Global.NetworkHasControlOfDoor(doorID)
	return _in(0xCB3C68ADB06195DF, doorID, _r)
end

function Global.NetworkHasControlOfEntity(entity)
	return _in(0x01BF60A500E28887, entity, _r)
end

function Global.NetworkHasControlOfNetworkId(netId)
	return _in(0x4D36070FE0215186, netId, _r)
end

function Global.NetworkHasControlOfPavementStats(hash)
	return _in(0xC01E93FAC20C3346, _ch(hash), _r)
end
Global.N_0xc01e93fac20c3346 = Global.NetworkHasControlOfPavementStats

function Global.NetworkHasControlOfPickup(pickup)
	return _in(0x5BC9495F0B3B6FA6, pickup, _r)
end

function Global.NetworkHasFollowInvite()
	return _in(0x76D9B976C4C09FDE, _r)
end
Global.N_0x76d9b976c4c09fde = Global.NetworkHasFollowInvite

function Global.NetworkHasHeadset()
	return _in(0xE870F9F1F7B4F1FA, _r)
end

function Global.NetworkHasInvitedGamer(p0)
	return _in(0x4D86CD31E8976ECE, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkHasInvitedGamerToTransition(p0)
	return _in(0x7284A47B3540E6CF, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkHasPendingInvite()
	return _in(0xAC8C7B9B88C4A668, _r)
end

function Global.NetworkHasPlayerStartedTransition(player)
	return _in(0x9AC9CCBFA8C29795, player, _r)
end

--- console hash: 0x5AC9F04D = network_hash_from_gamer_handle
function Global.NetworkHashFromGamerHandle(networkHandle)
	return _in(0x58575AC3CF2CA8EC, _ii(networkHandle) --[[ may be optional ]], _r, _ri)
end
Global.N_0x58575ac3cf2ca8ec = Global.NetworkHashFromGamerHandle

--- console hash: 0xF8D7AF3B = NETWORK_HASH_FROM_PLAYER_HANDLE
function Global.NetworkHashFromPlayerHandle(player)
	return _in(0xBC1D768F2F5D6C05, player, _r, _ri)
end
Global.N_0xbc1d768f2f5d6c05 = Global.NetworkHashFromPlayerHandle

function Global.NetworkHaveOnlinePrivileges()
	return _in(0x25CB5A9F37BFD063, _r)
end

function Global.NetworkHostTransition(p0, p1, p2, p3, p4, p5)
	return _in(0xA60BB5CE242BB254, p0, p1, p2, p3, p4, p5, _r, _ri)
end

function Global.NetworkInitializeCash(p0, p1)
	return _in(0x3DA5ECD1A56CBA6D, p0, p1)
end
Global.N_0x3da5ecd1a56cba6d = Global.NetworkInitializeCash

function Global.NetworkInviteGamers(p1)
	return _in(0x9D80CD1D0E6327DE, _i, p1, _i, _i, _r)
end

function Global.NetworkInviteGamersToTransition(p1)
	return _in(0x4A595C32F77DFF76, _i, p1, _r)
end

function Global.NetworkIsActivitySession()
	return _in(0x05095437424397FA, _r)
end

function Global.NetworkIsActivitySpectator()
	return _in(0x12103B9E0C9F92FB, _r, _ri)
end

function Global.NetworkIsActivitySpectatorFromHandle(networkHandle)
	return _in(0x2763BBAA72A7BCB9, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkIsAddingFriend()
	return _in(0x6EA101606F6E4D81, _r, _ri)
end

function Global.NetworkIsCableConnected()
	return _in(0xEFFB25453D8600F9, _r)
end
Global.N_0xeffb25453d8600f9 = Global.NetworkIsCableConnected

--- This would be nice to see if someone is in party chat, but 2 sad notes.
-- 1) It only becomes true if said person is speaking in that party at the time.
-- 2) It will never, become true unless you are in that party with said person.
function Global.NetworkIsChattingInPlatformParty(networkHandle)
	return _in(0x8DE9945BCC9AEC52, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkIsClanMembershipFinishedDownloading()
	return _in(0xB3F64A6A91432477, _r)
end
Global.N_0xb3f64a6a91432477 = Global.NetworkIsClanMembershipFinishedDownloading

function Global.NetworkIsClockTimeOverridden()
	return _in(0xD7C95D322FF57522, _r)
end
Global.N_0xd7c95d322ff57522 = Global.NetworkIsClockTimeOverridden

function Global.NetworkIsCloudAvailable()
	return _in(0x9A4CF4F48AD77302, _r)
end

function Global.NetworkIsFindingGamers()
	return _in(0xDDDF64C91BFCF0AA, _r)
end

function Global.NetworkIsFriend(networkHandle)
	return _in(0x1A24A179F9B31654, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkIsFriendInMultiplayer(friendName)
	return _in(0x57005C18827F3A28, _ts(friendName), _r)
end

--- In scripts R* calls 'NETWORK_GET_FRIEND_NAME' in this param.
function Global.NetworkIsFriendInSameTitle(friendName)
	return _in(0x2EA9A3BEDF3F17B8, _ts(friendName), _r)
end

function Global.NetworkIsFriendIndexOnline(friendIndex)
	return _in(0xBAD8F2A42B844821, friendIndex, _r)
end
Global.N_0xbad8f2a42b844821 = Global.NetworkIsFriendIndexOnline

function Global.NetworkIsFriendOnline(name)
	return _in(0x425A44533437B64D, _ts(name), _r)
end

function Global.NetworkIsFriendOnline_2(networkHandle)
	return _in(0x87EB7A3FFCB314DB, _ii(networkHandle) --[[ may be optional ]], _r)
end
Global.N_0x87eb7a3ffcb314db = Global.NetworkIsFriendOnline_2

function Global.NetworkIsGameInProgress()
	return _in(0x10FAB35428CCC9D7, _r)
end

function Global.NetworkIsGamerBlockedByMe(p0)
	return _in(0xE944C4F5AF1B5883, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkIsGamerInMySession(networkHandle)
	return _in(0x0F10B05DDF8D16E9, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkIsGamerMutedByMe(p0)
	return _in(0xCE60DE011B6C7978, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkIsGamerTalking(p0)
	return _in(0x71C33B22606CD88A, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkIsHandleValid(bufferSize)
	return _in(0x6F79B93B0A8E4133, _i, bufferSize, _r)
end

--- If you are host, returns true else returns false.
-- anyone know how to use this to find correct host? is possible?
function Global.NetworkIsHost()
	return _in(0x8DB296B814EDDA07, _r)
end

function Global.NetworkIsHostOfThisScript()
	return _in(0x83CD99A1E6061AB5, _r)
end

function Global.NetworkIsInMpCutscene()
	return _in(0x6CC27C9FA2040220, _r)
end

--- Note according to IDA TU27 X360(Console),
-- This native &amp; 'NETWORK_IS_PARTY_MEMBER' both jump to the same location.
-- Side note: This location just stops where it's at once jumped to.
-- Screenshot for side note,
-- h t t p ://i.imgur.com/m2ci1mF.png
-- h t t p://i.imgur.com/Z0Wx2B6.png
function Global.NetworkIsInParty()
	return _in(0x966C2BC2A7FE3F30, _r)
end

function Global.NetworkIsInSession()
	return _in(0xCA97246103B63917, _r)
end

function Global.NetworkIsInSpectatorMode()
	return _in(0x048746E388762E11, _r)
end

function Global.NetworkIsInTransition()
	return _in(0x68049AEFF83D8F0A, _r)
end

function Global.NetworkIsInTutorialSession()
	return _in(0xADA24309FE08DACF, _r, _ri)
end

function Global.NetworkIsInactiveProfile(p0)
	return _in(0x7E58745504313A2E, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkIsLocalPlayerInvincible()
	return _in(0x8A8694B48715B000, _r)
end

function Global.NetworkIsMultiplayerDisabled()
	return _in(0x9747292807126EDA, _r)
end
Global.N_0x9747292807126eda = Global.NetworkIsMultiplayerDisabled

function Global.NetworkIsParticipantActive(p0)
	return _in(0x6FF8FF40B6357D45, p0, _r)
end

--- Note according to IDA TU27 X360(Console),
-- This native &amp; 'NETWORK_IS_PARTY_MEMBER' both jump to the same location.
-- Side note: This location just stops where it's at once jumped to.
-- Screenshot for side note,
-- h t t p ://i.imgur.com/m2ci1mF.png
-- h t t p://i.imgur.com/Z0Wx2B6.png
function Global.NetworkIsPartyMember(networkHandle)
	return _in(0x676ED266AADD31E0, _ii(networkHandle) --[[ may be optional ]], _r)
end

--- This function is hard-coded to always return 0.
function Global.NetworkIsPendingFriend(p0)
	return _in(0x0BE73DA6984A6E33, p0, _r, _ri)
end

function Global.NetworkIsPlayerAParticipant(p0)
	return _in(0x3CA58F6CB7CBD784, p0, _r)
end

function Global.NetworkIsPlayerActive(player)
	return _in(0xB8DFD30D6973E135, player, _r)
end

--- hash collision
function Global.NetworkIsPlayerAnimationDrawingSynchronized()
	return _in(0xC6F8AB8A4189CF3A)
end

function Global.NetworkIsPlayerBlockedByMe(player)
	return _in(0x57AF1F8E27483721, player, _r)
end

function Global.NetworkIsPlayerConnected(player)
	return _in(0x93DC1BE4E1ABE9D1, player, _r)
end

--- NETWORK_ARE_*
function Global.NetworkIsPlayerEqualToIndex(player, index)
	return _in(0x9DE986FC9A87C474, player, index, _r)
end
Global.N_0x9de986fc9a87c474 = Global.NetworkIsPlayerEqualToIndex

function Global.NetworkIsPlayerInMpCutscene(player)
	return _in(0x63F9EE203C3619F2, player, _r)
end

function Global.NetworkIsPlayerMutedByMe(player)
	return _in(0x8C71288AE68EDE39, player, _r)
end

function Global.NetworkIsPlayerTalking(player)
	return _in(0x031E11F3D447647E, player, _r)
end

function Global.NetworkIsScriptActive(scriptName, p1, p2, p3)
	return _in(0x9D40DF90FAD26098, _ts(scriptName), p1, p2, p3, _r)
end

function Global.NetworkIsSessionActive()
	return _in(0xD83C2B94E7508980, _r)
end

function Global.NetworkIsSessionBusy()
	return _in(0xF4435D66A8E2905E, _r)
end

--- This checks if player is playing on gta online or not.
-- Please add an if and block your mod if this is "true".
function Global.NetworkIsSessionStarted()
	return _in(0x9DE624D2FC4B603F, _r)
end

--- Returns whether the player is signed into Social Club.
function Global.NetworkIsSignedIn()
	return _in(0x054354A99211EB96, _r)
end

--- Returns whether the game is not in offline mode.
-- seemed not to work for some ppl
function Global.NetworkIsSignedOnline()
	return _in(0x1077788E268557C2, _r)
end

--- Same as _IS_TEXT_CHAT_ACTIVE, except it does not check if the text chat HUD component is initialized, and therefore may crash.
function Global.NetworkIsTextChatActive()
	return _in(0x5FCF4D7069B09026, _r)
end

function Global.NetworkIsTransitionBusy()
	return _in(0x520F3282A53D26B7, _r, _ri)
end

function Global.NetworkIsTransitionHost()
	return _in(0x0B824797C9BF2159, _r, _ri)
end

function Global.NetworkIsTransitionHostFromHandle(networkHandle)
	return _in(0x6B5C83BA3EFE6A10, _ii(networkHandle) --[[ may be optional ]], _r)
end

function Global.NetworkIsTransitionMatchmaking()
	return _in(0x292564C735375EDF, _r, _ri)
end
Global.N_0x292564c735375edf = Global.NetworkIsTransitionMatchmaking

function Global.NetworkIsTransitionStarted()
	return _in(0x53FA83401D9C07FE, _r)
end

function Global.NetworkIsTransitionToGame()
	return _in(0x9D7696D8F4FA6CB7, _r, _ri)
end

function Global.NetworkJoinGroupActivity()
	return _in(0xA06509A691D12BE4, _r, _ri)
end
Global.N_0xa06509a691d12be4 = Global.NetworkJoinGroupActivity

--- int handle[76];
-- NETWORK_HANDLE_FROM_FRIEND(iSelectedPlayer, &amp;handle[0], 13);
-- Player uVar2 = NETWORK_GET_PLAYER_FROM_GAMER_HANDLE(&amp;handle[0]);
-- NETWORK_JOIN_TRANSITION(uVar2);
-- nothing doin.
function Global.NetworkJoinTransition(player)
	return _in(0x9D060B08CD63321A, player, _r)
end

function Global.NetworkLaunchTransition()
	return _in(0x2DCF46CB1A4F0884, _r, _ri)
end

function Global.NetworkLeaveTransition()
	return _in(0xD23A1A815D21DB19, _r, _ri)
end

function Global.NetworkMarkTransitionGamerAsFullyJoined(p0)
	return _in(0x5728BB6D63E3FF1D, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkMemberIdFromGamerHandle(networkHandle)
	return _in(0xC82630132081BB6F, _ii(networkHandle) --[[ may be optional ]], _r, _s)
end

function Global.NetworkMoneyCanBet(p0, p1, p2)
	return _in(0x81404F3DC124FE5B, p0, p1, p2, _r)
end
Global.N_0x81404f3dc124fe5b = Global.NetworkMoneyCanBet

function Global.NetworkOpenTransitionMatchmaking()
	return _in(0x2B3A8F7CA3A38FDE)
end
Global.N_0x2b3a8f7ca3a38fde = Global.NetworkOpenTransitionMatchmaking

--- Could possibly bypass being muted or automatically muted? Who knows.
function Global.NetworkOverrideChatRestrictions(player, toggle)
	return _in(0x3039AE5AD2C9C0C4, player, toggle)
end
Global.N_0x3039ae5ad2c9c0c4 = Global.NetworkOverrideChatRestrictions

--- Works in Singleplayer too.
-- Actually has a 4th param (BOOL) that sets byte_14273C46C (in b944) to whatever was passed to p3.
function Global.NetworkOverrideClockTime(Hours, Minutes, Seconds)
	return _in(0xE679E3E06E363892, Hours, Minutes, Seconds)
end

--- R* uses this to hear all player when spectating.
-- It allows you to hear other online players when their chat is on none, crew and or friends
function Global.NetworkOverrideReceiveRestrictions(player, toggle)
	return _in(0xDDF73E2B1FEC5AB4, player, toggle)
end
Global.N_0xddf73e2b1fec5ab4 = Global.NetworkOverrideReceiveRestrictions

--- Console Hash: 0x6C344AE3
-- "NETWORK_OVERRIDE_SEND_RESTRICTIONS" is right, but dev-c put a _ by default.
-- This is used alongside the native,
-- 'NETWORK_OVERRIDE_RECEIVE_RESTRICTIONS'. Read it's description for more info.
function Global.NetworkOverrideSendRestrictions(player, toggle)
	return _in(0x97DD4C5944CC2E6A, player, toggle)
end
Global.N_0x97dd4c5944cc2e6a = Global.NetworkOverrideSendRestrictions

function Global.NetworkOverrideTransitionChat(p0)
	return _in(0xAF66059A131AA269, p0)
end
Global.N_0xaf66059a131aa269 = Global.NetworkOverrideTransitionChat

function Global.NetworkPayEmployeeWage(p0, p1, p2)
	return _in(0x5FD5ED82CBBE9989, p0, p1, p2)
end
Global.N_0x5fd5ed82cbbe9989 = Global.NetworkPayEmployeeWage

function Global.NetworkPayMatchEntryFee(value, p2, p3)
	return _in(0x9346E14F2AF74D46, value, _i, p2, p3)
end
Global.N_0x9346e14f2af74d46 = Global.NetworkPayMatchEntryFee

function Global.NetworkPayUtilityBill(p0, p1, p2)
	return _in(0xAFE08B35EC0C9EAE, p0, p1, p2)
end
Global.N_0xafe08b35ec0c9eae = Global.NetworkPayUtilityBill

--- Returns the name of a given player. Returns "**Invalid**" if CPlayerInfo of the given player cannot be retrieved or the player doesn't exist.
function Global.NetworkPlayerGetName(player)
	return _in(0x7718D2E2060837D2, player, _r, _s)
end

--- Returns the user id of a given player. Returns "**Invalid**" if CPlayerInfo of the given player cannot be retrieved or the player doesn't exist.
function Global.NetworkPlayerGetUserid(player, userID)
	return _in(0x4927FC39CD0869A0, player, _ii(userID) --[[ may be optional ]], _r, _s)
end
Global.NetworkPlayerGetUserId = Global.NetworkPlayerGetUserid

function Global.NetworkPlayerHasHeadset(player)
	return _in(0x3FB99A8B08D18FD6, player, _r)
end

--- Does exactly the same thing as PLAYER_ID()
function Global.NetworkPlayerIdToInt()
	return _in(0xEE68096F9F37341E, _r, _ri)
end

--- Returns whether the player has been reported too often or not.
-- Example : griefing.
function Global.NetworkPlayerIsBadsport()
	return _in(0x19D8DA0E5A68045A, _r)
end

function Global.NetworkPlayerIsCheater()
	return _in(0x655B91F1495A9090, _r)
end

function Global.NetworkPlayerIsInClan()
	return _in(0x579CCED0265D4896, _r)
end

--- Checks if a specific value (BYTE) in CPlayerInfo is nonzero.
-- Returns always false in Singleplayer.
-- No longer used for dev checks since first mods were released on PS3 &amp; 360.
-- R* now checks with the is_dlc_present native for the dlc hash 2532323046,
-- if that is present it will unlock dev stuff.
function Global.NetworkPlayerIsRockstarDev(player)
	return _in(0x544ABDDA3B409B6D, player, _r)
end

function Global.NetworkReceivePlayerJobshareCash(value, networkHandle)
	return _in(0x56A3B51944C50598, value, _ii(networkHandle) --[[ may be optional ]])
end

--- index
-- -------
-- See function sub_1005 in am_boat_taxi.ysc
-- context
-- ----------
-- "BACKUP_VAGOS"
-- "BACKUP_LOST"
-- "BACKUP_FAMILIES"
-- "HIRE_MUGGER"
-- "HIRE_MERCENARY"
-- "BUY_CARDROPOFF"
-- "HELI_PICKUP"
-- "BOAT_PICKUP"
-- "CLEAR_WANTED"
-- "HEAD_2_HEAD"
-- "CHALLENGE"
-- "SHARE_LAST_JOB"
-- "DEFAULT"
-- reason
-- ---------
-- "NOTREACHTARGET"
-- "TARGET_ESCAPE"
-- "DELIVERY_FAIL"
-- "NOT_USED"
-- "TEAM_QUIT"
-- "SERVER_ERROR"
-- "RECEIVE_LJ_L"
-- "CHALLENGE_PLAYER_LEFT"
-- "DEFAULT"
-- unk
-- -----
-- Unknown bool value
function Global.NetworkRefundCash(index, context, reason, unk)
	return _in(0xF9C812CD7C46E817, index, _ts(context), _ts(reason), unk)
end
Global.N_0xf9c812cd7c46e817 = Global.NetworkRefundCash

function Global.NetworkRegisterEntityAsNetworked(entity)
	return _in(0x06FAACD625D80CAA, entity)
end
Global.N_0x06faacd625d80caa = Global.NetworkRegisterEntityAsNetworked

function Global.NetworkRegisterHostBroadcastVariables(numVars)
	return _in(0x3E9B2F01C50DF595, _i, numVars)
end

function Global.NetworkRegisterPlayerBroadcastVariables(numVars)
	return _in(0x3364AA97340CA215, _i, numVars)
end

function Global.NetworkRemoveAllTransitionInvite()
	return _in(0x726E0375C7A26368)
end
Global.N_0x726e0375c7a26368 = Global.NetworkRemoveAllTransitionInvite

function Global.NetworkRemoveEntityArea(p0)
	return _in(0x93CF869BAA0C4874, p0, _r)
end

function Global.NetworkRemovePresenceInvite(p0)
	return _in(0xF0210268DB0974B1, p0, _r)
end
Global.N_0xf0210268db0974b1 = Global.NetworkRemovePresenceInvite

function Global.NetworkRemoveTransitionInvite(p0)
	return _in(0x7524B431B2E6F7EE, _ii(p0) --[[ may be optional ]])
end

--- NETWORK_REQUEST_CLOUD_BACKGROUND_SCRIPTS - Correct console hash is 0x98EFB921
-- Start the downloading of BG_NG.RPF from R* Cloud which contains hotfix.
-- The console hash given is incorrect for Xbox360 that is. I searched in IDA and found 0x98EFB921 which came right after 0x155465EE. Then I searched it in TU27 X360 scripts and found it was the same results same scripts as the PC Hash for this which is obviously correct. I found the correct one as I noticed TU27 X360 script search pulled no results for 0x29532731 when it should have.
-- As you can see here you will see the 155465EE first then the correct hash for this native. Then the current 29532731 one which could be the native below or the native below's hash could be the has below the 29532731
-- puu.sh/nhdQI/e0ca5567b4.png
-- 0x98EFB921 is the correct console hash for "_DOWNLOAD_BG_SCRIPT_RPF". 0x29532731 is "_HAS_BG_SCRIPT_BEEN_DOWNLOADED"
function Global.NetworkRequestCloudBackgroundScripts()
	return _in(0x924426BFFD82E915, _r)
end
Global.N_0x924426bffd82e915 = Global.NetworkRequestCloudBackgroundScripts

--- This native start the download of tunables from R* cloud
function Global.NetworkRequestCloudTunables()
	return _in(0x42FB3B532D526E6C)
end
Global.N_0x42fb3b532d526e6c = Global.NetworkRequestCloudTunables

function Global.NetworkRequestControlOfDoor(doorID)
	return _in(0x870DDFD5A4A796E4, doorID, _r)
end

function Global.NetworkRequestControlOfEntity(entity)
	return _in(0xB69317BF5E782347, entity, _r)
end

function Global.NetworkRequestControlOfNetworkId(netId)
	return _in(0xA670B3662FAFFBD0, netId, _r)
end

--- hash collision?? - Not sure, but fits alphabetically
function Global.NetworkResetBodyTracker()
	return _in(0x72433699B4E6DD64)
end

function Global.NetworkResurrectLocalPlayer(x, y, z, heading, unk, changetime)
	return _in(0xEA23C49EAA83ACFB, x, y, z, heading, unk, changetime)
end

function Global.NetworkSendPresenceInvite(p2, p3)
	return _in(0xC3C7A6AFDB244624, _i, _i, p2, p3, _r)
end
Global.N_0xc3c7a6afdb244624 = Global.NetworkSendPresenceInvite

--- String "NETWORK_SEND_PRESENCE_TRANSITION_INVITE" is contained in the function in ida so this one is correct.
function Global.NetworkSendPresenceTransitionInvite(p2, p3)
	return _in(0xC116FF9B4D488291, _i, _i, p2, p3, _r)
end
Global.N_0xc116ff9b4d488291 = Global.NetworkSendPresenceTransitionInvite

--- how can I increase the character limit on this native?
-- --------------------------------
-- return - it's possible for it to have an error and return a value. One error is if it cannot find space to create the event it doesn't send the text and returns zero. It also returns 0 is the strlen is 0 or the strlen &gt; 0x100 (I thought it was 64 so idk why it's checking 265. I may just be dumb :P ) There are other ways it could return 0 also but who the hell cares cuz it's very unlikely, but it returns a bool.
-- to the top guy, idk if it is possible. It is probably read a max of 64 characters on the recieving end so even if we did modify it to send more it probably wouldn't work. One of the other problems is that in part of the function it copies the string to the local stack which means we would have to change that to make it work.
function Global.NetworkSendTextMessage(message, networkHandle)
	return _in(0x3A214F2EC889B100, _ts(message), _ii(networkHandle) --[[ may be optional ]], _r)
end

--- the first arg seems to be the network player handle (&amp;handle) and the second var is pretty much always "" and the third seems to be a number between 0 and ~10 and the 4th is is something like 0 to 5 and I guess the 5th is a bool cuz it is always 0 or 1
-- does this send an invite to a player?
function Global.NetworkSendTransitionGamerInstruction(p1, p2, p3, p4)
	return _in(0x31D1D2B858D25E6B, _i, _ts(p1), p2, p3, p4, _r)
end

function Global.NetworkSessionActivityQuickmatch(p0, p1, p2, p3)
	return _in(0xBE3E347A87ACEB82, p0, p1, p2, p3, _r)
end
Global.N_0xbe3e347a87aceb82 = Global.NetworkSessionActivityQuickmatch

function Global.NetworkSessionBlockJoinRequests(p0)
	return _in(0xA73667484D7037C3, p0)
end
Global.N_0xa73667484d7037c3 = Global.NetworkSessionBlockJoinRequests

function Global.NetworkSessionCancelInvite()
	return _in(0x2FBF47B1B36D36F9)
end

function Global.NetworkSessionChangeSlots(p0, p1)
	return _in(0xB4AB419E0D86ACAE, p0, p1)
end
Global.N_0xb4ab419e0d86acae = Global.NetworkSessionChangeSlots

function Global.NetworkSessionCrewMatchmaking(p0, p1, p2, maxPlayers, p4)
	return _in(0x94BC51E9449D917F, p0, p1, p2, maxPlayers, p4, _r)
end
Global.N_0x94bc51e9449d917f = Global.NetworkSessionCrewMatchmaking

--- p0 is always false and p1 varies.
-- NETWORK_SESSION_END(0, 1)
-- NETWORK_SESSION_END(0, 0)
-- Results in: "Connection to session lost due to an unknown network error. Please return to Grand Theft Auto V and try again later."
function Global.NetworkSessionEnd(p0, p1)
	return _in(0xA02E59562D711006, p0, p1, _r)
end

--- unknown params
-- p0 = 0, 2, or 999 (The global is 999 by default.)
-- p1 = 0 (Always in every script it's found in atleast.)
-- p2 = 0, 3, or 4 (Based on a var that is determined by a function.)
-- p3 = maxPlayers (It's obvious in x360 scripts it's always 18)
-- p4 = 0 (Always in every script it's found in atleast.)
-- p5 = 0 or 1. (1 if network_can_enter_multiplayer, but set to 0 if other checks after that are passed.)
-- p5 is reset to 0 if,
-- Global_1315318 = 0 or Global_1315323 = 9 or 12 or (Global_1312629 = 0 &amp;&amp; Global_1312631 = true/1) those are passed.
function Global.NetworkSessionEnter(p0, p1, p2, maxPlayers, p4, p5)
	return _in(0x330ED4D05491934F, p0, p1, p2, maxPlayers, p4, p5, _r, _ri)
end

function Global.NetworkSessionForceCancelInvite()
	return _in(0xA29177F7703B5644)
end
Global.N_0xa29177f7703b5644 = Global.NetworkSessionForceCancelInvite

function Global.NetworkSessionFriendMatchmaking(p0, p1, maxPlayers, p3)
	return _in(0x2CFC76E0D087C994, p0, p1, maxPlayers, p3, _r)
end
Global.N_0x2cfc76e0d087c994 = Global.NetworkSessionFriendMatchmaking

function Global.NetworkSessionGetInviter(networkHandle)
	return _in(0xE57397B4A3429DD0, _ii(networkHandle) --[[ may be optional ]])
end

function Global.NetworkSessionGetUnk(p0)
	return _in(0x56CE820830EF040B, p0, _r, _ri)
end
Global.N_0x56ce820830ef040b = Global.NetworkSessionGetUnk

--- Does nothing in online but in offline it will cause the screen to fade to black. Nothing happens past then, the screen will sit at black until you restart GTA. Other stuff must be needed to actually host a session.
function Global.NetworkSessionHost(p0, maxPlayers, p2)
	return _in(0x6F3D4ED9BEE4E61D, p0, maxPlayers, p2, _r)
end

function Global.NetworkSessionHostClosed(p0, maxPlayers)
	return _in(0xED34C0C02C098BB7, p0, maxPlayers, _r)
end
Global.N_0xed34c0c02c098bb7 = Global.NetworkSessionHostClosed

--- Does nothing in online but in offline it will cause the screen to fade to black. Nothing happens past then, the screen will sit at black until you restart GTA. Other stuff must be needed to actually host a session.
function Global.NetworkSessionHostFriendsOnly(p0, maxPlayers)
	return _in(0xB9CFD27A5D578D83, p0, maxPlayers, _r)
end

--- Loads up the map that is loaded when beeing in mission creator
-- Player gets placed in a mix between online/offline mode
-- p0 is always 2 in R* scripts.
-- Appears to be patched in gtav b757 (game gets terminated) alonside with most other network natives to prevent online modding ~ghost30812
function Global.NetworkSessionHostSinglePlayer(p0)
	return _in(0xC74C33FCA52856D5, p0)
end

function Global.NetworkSessionHosted(p0)
	return _in(0xC19F6C8E7865A6FF, p0)
end
Global.N_0xc19f6c8e7865a6ff = Global.NetworkSessionHosted

function Global.NetworkSessionIsClosedCrew()
	return _in(0x74732C6CA90DA2B4, _r)
end
Global.N_0x74732c6ca90da2b4 = Global.NetworkSessionIsClosedCrew

function Global.NetworkSessionIsClosedFriends()
	return _in(0xFBCFA2EA2E206890, _r)
end
Global.N_0xfbcfa2ea2e206890 = Global.NetworkSessionIsClosedFriends

function Global.NetworkSessionIsPlayerVotedToKick(player)
	return _in(0xD6D09A6F32F49EF1, player, _r)
end
Global.NetworkSessionArePlayersVotingToKick = Global.NetworkSessionIsPlayerVotedToKick

function Global.NetworkSessionIsPrivate()
	return _in(0xCEF70AA5B3F89BA1, _r)
end
Global.N_0xcef70aa5b3f89ba1 = Global.NetworkSessionIsPrivate

function Global.NetworkSessionIsSolo()
	return _in(0xF3929C2379B60CCE, _r)
end
Global.N_0xf3929c2379b60cce = Global.NetworkSessionIsSolo

function Global.NetworkSessionIsVisible()
	return _in(0xBA416D68C631496A, _r, _ri)
end
Global.N_0xba416d68c631496a = Global.NetworkSessionIsVisible

--- Only works when you are host.
function Global.NetworkSessionKickPlayer(player)
	return _in(0xFA8904DC5F304220, player)
end

function Global.NetworkSessionLeaveSinglePlayer()
	return _in(0x3442775428FD2DAA)
end

function Global.NetworkSessionMarkVisible(p0)
	return _in(0x271CC6AB59EBF9A5, p0)
end
Global.N_0x271cc6ab59ebf9a5 = Global.NetworkSessionMarkVisible

--- playerTypes:
-- 0 = regular joiner
-- 4 = spectator
-- 8 = unknown
function Global.NetworkSessionSetMaxPlayers(playerType, playerCount)
	return _in(0x8B6A4DD0AF9CE215, playerType, playerCount)
end
Global.N_0x8b6a4dd0af9ce215 = Global.NetworkSessionSetMaxPlayers

function Global.NetworkSessionVoiceHost()
	return _in(0x9C1556705F864230)
end

function Global.NetworkSessionVoiceLeave()
	return _in(0x6793E42BE02B575D)
end

function Global.NetworkSessionWasInvited()
	return _in(0x23DFB504655D0CE4, _r)
end
Global.N_0x23dfb504655d0ce4 = Global.NetworkSessionWasInvited

function Global.NetworkSetActivitySpectator(toggle)
	return _in(0x75138790B4359A74, toggle)
end

function Global.NetworkSetActivitySpectatorMax(maxSpectators)
	return _in(0x9D277B76D1D12222, maxSpectators)
end

function Global.NetworkSetCurrentlySelectedGamerHandleFromInviteMenu(p0)
	return _in(0x7206F674F2A3B1BB, _ii(p0) --[[ may be optional ]], _r)
end

function Global.NetworkSetEntityCanBlend(entity, toggle)
	return _in(0xD830567D88A1E873, entity, toggle)
end

--- if set to true other network players can't see it
-- if set to false other network player can see it
-- =========================================
-- ^^ I attempted this by grabbing an object with GET_ENTITY_PLAYER_IS_FREE_AIMING_AT and setting this naive no matter the toggle he could still see it.
-- pc or last gen?
-- ^^ last-gen
function Global.NetworkSetEntityVisibleToNetwork(entity, toggle)
	return _in(0xF1CA12B18AEF5298, entity, toggle)
end
Global.N_0xf1ca12b18aef5298 = Global.NetworkSetEntityVisibleToNetwork

--- //friendly fire toggle
function Global.NetworkSetFriendlyFireOption(toggle)
	return _in(0xF808475FA571D823, toggle)
end

function Global.NetworkSetGamerInvitedToTransition(networkHandle)
	return _in(0xCA2C8073411ECDB6, _ii(networkHandle) --[[ may be optional ]])
end

function Global.NetworkSetInMpCutscene(p0, p1)
	return _in(0x9CA5DE655269FEC4, p0, p1)
end

function Global.NetworkSetInSpectatorMode(toggle, playerPed)
	return _in(0x423DE3854BB50894, toggle, playerPed)
end

--- hash collision???
function Global.NetworkSetKeepFocuspoint(p0, p1)
	return _in(0x7F8413B7FC2AA6B9, p0, p1)
end

function Global.NetworkSetLocalPlayerInvincibleTime(time)
	return _in(0x2D95C7E2D7E07307, time)
end

function Global.NetworkSetMissionFinished()
	return _in(0x3B3D11CD9FFCDFC9)
end

function Global.NetworkSetNetworkIdDynamic(netID, toggle)
	return _in(0x2B1813ABA29016C5, netID, toggle)
end
Global.N_0x2b1813aba29016c5 = Global.NetworkSetNetworkIdDynamic

function Global.NetworkSetOverrideSpectatorMode(toggle)
	return _in(0x70DA3BF8DACD3210, toggle)
end

function Global.NetworkSetPropertyId(p0)
	return _in(0x1775961C2FBBCB5C, p0)
end

function Global.NetworkSetRichPresence(p0, p1, p2, p3)
	return _in(0x1DCCACDCFC569362, p0, p1, p2, p3)
end

function Global.NetworkSetScriptIsSafeForNetworkGame()
	return _in(0x9243BAC96D64C050)
end

function Global.NetworkSetTalkerProximity(p0)
	return _in(0xCBF12D65F95AD686, p0)
end

function Global.NetworkSetTeamOnlyChat(toggle)
	return _in(0xD5B4883AC32F24C3, toggle)
end

--- p1 is always 0
function Global.NetworkSetThisScriptIsNetworkScript(lobbySize, p1, playerId)
	return _in(0x1CA59E306ECB80A5, lobbySize, p1, playerId)
end

function Global.NetworkSetThisScriptMarked(p0, p1, p2)
	return _in(0xD1110739EEADB592, p0, p1, p2, _r)
end
Global.N_0xd1110739eeadb592 = Global.NetworkSetThisScriptMarked

function Global.NetworkSetTransitionActivityId(p0)
	return _in(0x30DE938B516F0AD2, p0)
end
Global.N_0x30de938b516f0ad2 = Global.NetworkSetTransitionActivityId

function Global.NetworkSetTransitionCreatorHandle(p0)
	return _in(0xEF26739BCD9907D5, _ii(p0) --[[ may be optional ]])
end

function Global.NetworkSetVoiceActive(toggle)
	return _in(0xBABEC9E69A91C57B, toggle)
end

function Global.NetworkSetVoiceChannel(p0)
	return _in(0xEF6212C2EFEF1A23, p0)
end

--- p0 is pointer to a script array
function Global.NetworkShopBasketAddItem(p1)
	return _in(0xF30980718C8ED876, _i, p1, _r, _ri)
end
Global.N_0xf30980718c8ed876 = Global.NetworkShopBasketAddItem

--- p0 =&gt; unk3::_network_shop_basket_apply_server_data(Global_2590199[iParam0 /*76*/], &amp;uVar6); =&gt; script array
function Global.NetworkShopBasketApplyServerData(p0, p1)
	return _in(0xE1A0450ED46A7812, p0, _ii(p1) --[[ may be optional ]], _r)
end
Global.N_0xe1a0450ed46a7812 = Global.NetworkShopBasketApplyServerData

function Global.NetworkShopBasketEnd()
	return _in(0xA65568121DF2EA26, _r, _ri)
end
Global.N_0xa65568121df2ea26 = Global.NetworkShopBasketEnd

function Global.NetworkShopBasketIsFull()
	return _in(0x27F76CC6C55AD30E, _r, _ri)
end
Global.N_0x27f76cc6c55ad30e = Global.NetworkShopBasketIsFull

function Global.NetworkShopBasketStart(p1, p2, p3)
	return _in(0x279F08B1A4B29B7E, _i, p1, p2, p3, _r)
end

--- int netShop = 2147483647;
-- UNK3::_NETWORK_SHOP_BEGIN_SERVICE(&amp;netShop, 1474183246, 1982688246, 1445302971, 90000000, 4);
-- if (!UNK3::_NETWORK_SHOP_CHECKOUT_START(netShop)) {
-- showNotification("Transaction failed!");
-- }
function Global.NetworkShopBeginService(p1, p2, p3, p4, p5)
	return _in(0x3C5FD37B5499582E, _i, p1, p2, p3, p4, p5, _r)
end
Global.N_0x3c5fd37b5499582e = Global.NetworkShopBeginService

function Global.NetworkShopCashTransferSetTelemetryNonceSeed()
	return _in(0x498C1E05CE5F7877, _r, _ri)
end
Global.N_0x498c1e05ce5f7877 = Global.NetworkShopCashTransferSetTelemetryNonceSeed

function Global.NetworkShopCheckoutStart(p0)
	return _in(0x39BE7CEA8D9CC8E6, p0, _r)
end
Global.N_0x39be7cea8d9cc8e6 = Global.NetworkShopCheckoutStart

function Global.NetworkShopDeleteSetTelemetryNonceSeed()
	return _in(0x112CEF1615A1139F, _r, _ri)
end
Global.N_0x112cef1615a1139f = Global.NetworkShopDeleteSetTelemetryNonceSeed

--- Belongs in UNK3, non-hashed version of 0x247F0F73A182EA0B
function Global.NetworkShopDoesItemExist(name)
	return _in(0xBD4D7EAF8A30F637, _ts(name), _r)
end
Global.N_0xbd4d7eaf8a30f637 = Global.NetworkShopDoesItemExist
Global.NetworkShopIsItemUnlocked = Global.NetworkShopDoesItemExist

--- ex.:
-- v_15 = sub_10cc8(VEHICLE::GET_VEHICLE_WHEEL_TYPE(a_2));
-- if (!MOBILE::_247F0F73A182EA0B(v_15)) {
-- return 1;
-- }
-- Belongs in UNK3, hashed version of 0xBD4D7EAF8A30F637
function Global.NetworkShopDoesItemExistHash(hash)
	return _in(0x247F0F73A182EA0B, _ch(hash), _r)
end
Global.N_0x247f0f73a182ea0b = Global.NetworkShopDoesItemExistHash
Global.NetworkShopIsItemUnlockedHash = Global.NetworkShopDoesItemExistHash

function Global.NetworkShopEndService(p0)
	return _in(0xE2A99A9B524BEFFF, p0, _r)
end
Global.N_0xe2a99a9b524befff = Global.NetworkShopEndService

--- bool is always true in game scripts
function Global.NetworkShopGetPrice(hash, hash2, p2)
	return _in(0xC27009422FCCA88D, _ch(hash), _ch(hash2), p2, _r, _ri)
end

function Global.NetworkShopGetTransactionsDisabled()
	return _in(0x810E8431C0614BF9, _r)
end
Global.N_0x810e8431c0614bf9 = Global.NetworkShopGetTransactionsDisabled

function Global.NetworkShopGetTransactionsEnabledForCharacter(mpChar)
	return _in(0xB24F0944DA203D9E, mpChar, _r)
end
Global.N_0xb24f0944da203d9e = Global.NetworkShopGetTransactionsEnabledForCharacter

function Global.NetworkShopSessionApplyReceivedData(p0)
	return _in(0x2F41D51BA3BCD1F1, p0, _r)
end
Global.N_0x2f41d51ba3bcd1f1 = Global.NetworkShopSessionApplyReceivedData

function Global.NetworkShopSetTelemetryNonceSeed(p0)
	return _in(0x9507D4271988E1AE, p0, _r)
end
Global.N_0x9507d4271988e1ae = Global.NetworkShopSetTelemetryNonceSeed

function Global.NetworkShopStartSession(p0)
	return _in(0xA135AC892A58FC07, p0, _r)
end
Global.N_0xa135ac892a58fc07 = Global.NetworkShopStartSession

--- Example:
-- int playerHandle;
-- NETWORK_HANDLE_FROM_PLAYER(selectedPlayer, &amp;playerHandle, 13);
-- NETWORK_SHOW_PROFILE_UI(&amp;playerHandle);
function Global.NetworkShowProfileUi(networkHandle)
	return _in(0x859ED1CEA343FCA8, _ii(networkHandle) --[[ may be optional ]])
end

function Global.NetworkSpentAmmoDrop(p0, p1, p2)
	return _in(0xB162DC95C0A3317B, p0, p1, p2)
end

function Global.NetworkSpentArrestBail(p0, p1, p2)
	return _in(0x812F5488B1B2A299, p0, p1, p2)
end

function Global.NetworkSpentBetting(p0, p1, p3, p4)
	return _in(0x1C436FD11FFA692F, p0, p1, _i, p3, p4)
end

function Global.NetworkSpentBoatPickup(p0, p1, p2)
	return _in(0x524EE43A37232C00, p0, p1, p2)
end

function Global.NetworkSpentBounty(p0, p1, p2)
	return _in(0x29B260B84947DFCC, p0, p1, p2)
end

function Global.NetworkSpentBullShark(p0, p1, p2)
	return _in(0xA6DD8458CE24012C, p0, p1, p2)
end

function Global.NetworkSpentBuyOfftheradar(p0, p1, p2)
	return _in(0xA628A745E2275C5D, p0, p1, p2)
end

function Global.NetworkSpentBuyPassiveMode(p0, p1, p2)
	return _in(0x6D3A430D1A809179, p0, p1, p2)
end

function Global.NetworkSpentBuyRevealPlayers(p0, p1, p2)
	return _in(0x6E176F1B18BC0637, p0, p1, p2)
end

function Global.NetworkSpentBuyWantedlevel(p0, p2, p3)
	return _in(0xE1B13771A843C4F6, p0, _i, p2, p3)
end

function Global.NetworkSpentCallPlayer(p0, p2, p3)
	return _in(0xACDE7185B374177C, p0, _i, p2, p3)
end

function Global.NetworkSpentCarwash(p0, p1, p2, p3, p4)
	return _in(0xEC03C719DB2F4306, p0, p1, p2, p3, p4)
end

function Global.NetworkSpentCashDrop(amount, p1, p2)
	return _in(0x289016EC778D60E0, amount, p1, p2)
end

function Global.NetworkSpentCinema(p0, p1, p2, p3)
	return _in(0x6B38ECB05A63A685, p0, p1, p2, p3)
end

function Global.NetworkSpentFromRockstar(bank, p1, p2)
	return _in(0x6A445B64ED7ABEB5, bank, p1, p2)
end
Global.N_0x6a445b64ed7abeb5 = Global.NetworkSpentFromRockstar

function Global.NetworkSpentHeliPickup(p0, p1, p2)
	return _in(0x7BF1D73DB2ECA492, p0, p1, p2)
end

function Global.NetworkSpentHireMercenary(p0, p1, p2)
	return _in(0xE7B80E2BF9D80BD6, p0, p1, p2)
end

--- Only used once in a script (am_contact_requests)
-- p1 = 0
-- p2 = 1
function Global.NetworkSpentHireMugger(p0, p1, p2)
	return _in(0xE404BFB981665BF0, p0, p1, p2)
end

function Global.NetworkSpentHoldups(p0, p1, p2)
	return _in(0xD9B86B9872039763, p0, p1, p2)
end

function Global.NetworkSpentInStripclub(p0, p1, p2, p3)
	return _in(0xEE99784E4467689C, p0, p1, p2, p3)
end
Global.N_0xee99784e4467689c = Global.NetworkSpentInStripclub

function Global.NetworkSpentNoCops(p0, p1, p2)
	return _in(0xD5BB406F4E04019F, p0, p1, p2)
end
Global.N_0xd5bb406f4e04019f = Global.NetworkSpentNoCops

--- According to how I understood this in the freemode script alone,
-- The first parameter is determined by a function named, func_5749 within the freemode script which has a list of all the vehicles and a set price to return which some vehicles deals with globals as well. So the first parameter is basically the set in stone insurance cost it's gonna charge you for that specific vehicle model.
-- The second parameter whoever put it was right, they call GET_ENTITY_MODEL with the vehicle as the paremeter.
-- The third parameter is the network handle as they call their little struct&lt;13&gt; func or atleast how the script decompiled it to look which in lamens terms just returns the network handle of the previous owner based on DECOR_GET_INT(vehicle, "Previous_Owner").
-- The fourth parameter is a bool that returns true/false depending on if your bank balance is greater then 0.
-- The fifth and last parameter is a bool that returns true/false depending on if you have the money for the car based on the cost returned by func_5749. In the freemode script eg,
-- bool hasTheMoney = NETWORKCASH::_GET_BANK_BALANCE() &lt; carCost.
function Global.NetworkSpentPayVehicleInsurancePremium(amount, vehicleModel, notBankrupt, hasTheMoney)
	return _in(0x9FF28D88C766E3E8, amount, _ch(vehicleModel), _i, notBankrupt, hasTheMoney)
end

function Global.NetworkSpentPlayerHealthcare(p0, p1, p2, p3)
	return _in(0x7C99101F7FCE2EE5, p0, p1, p2, p3)
end
Global.N_0x7c99101f7fce2ee5 = Global.NetworkSpentPlayerHealthcare

function Global.NetworkSpentProstitutes(p0, p1, p2)
	return _in(0xB21B89501CFAC79E, p0, p1, p2)
end

--- Console Hash 0xF4287778 = NETWORK_SPENT_REQUEST_HEIST
function Global.NetworkSpentRequestHeist(p0, p1, p2)
	return _in(0x9D26502BB97BFE62, p0, p1, p2)
end
Global.N_0x9d26502bb97bfe62 = Global.NetworkSpentRequestHeist

function Global.NetworkSpentRequestJob(p0, p1, p2)
	return _in(0x8204DA7934DF3155, p0, p1, p2)
end
Global.N_0x8204da7934df3155 = Global.NetworkSpentRequestJob

function Global.NetworkSpentRobbedByMugger(amount, p1, p2)
	return _in(0x995A65F15F581359, amount, p1, p2)
end
Global.N_0x995a65f15f581359 = Global.NetworkSpentRobbedByMugger

function Global.NetworkSpentTaxi(amount, p1, p2)
	return _in(0x17C3A7D31EAE39F9, amount, p1, p2)
end

function Global.NetworkSpentTelescope(p0, p1, p2)
	return _in(0x7FE61782AD94CC09, p0, p1, p2)
end

function Global.NetworkStartSynchronisedScene(netScene)
	return _in(0x9A1B3FCDB36C8697, netScene)
end

function Global.NetworkStopLoadScene()
	return _in(0x64E630FAF5F60F44)
end

function Global.NetworkStopSynchronisedScene(netScene)
	return _in(0xC254481A4574CB2F, netScene)
end

function Global.NetworkSuppressInvite(toggle)
	return _in(0xA0682D67EF1FBA3D, toggle)
end

--- used in atm_trigger script.
-- usage:
-- int iVar0;		STATS::STAT_GET_INT(GAMEPLAY::GET_HASH_KEY("mpply_last_mp_char"), &amp;iVar0, -1);
-- UNK3::_NETWORK_TRANSFER_WALLET_TO_BANK(iVar0, amount);
-- used to deposit money into bank from wallet, shows up in transaction log.
function Global.NetworkTransferBankToWallet(charStatInt, amount)
	return _in(0xD47A2C1BA117471D, charStatInt, amount, _r)
end
Global.N_0xd47a2c1ba117471d = Global.NetworkTransferBankToWallet

--- used in atm_trigger script.
-- usage:
-- int iVar0; 		STATS::STAT_GET_INT(GAMEPLAY::GET_HASH_KEY("mpply_last_mp_char"), &amp;iVar0, -1);
-- UNK3::_NETWORK_TRANSFER_BANK_TO_WALLET(iVar0, amount);
-- used to withdraw money from bank into wallet, shows up in transaction log.
function Global.NetworkTransferWalletToBank(charStatInt, amount)
	return _in(0xC2F7FE5309181C7D, charStatInt, amount, _r)
end
Global.N_0xc2f7fe5309181c7d = Global.NetworkTransferWalletToBank

--- netScene to scene
function Global.NetworkUnlinkNetworkedSynchronisedScene(netScene)
	return _in(0x02C40BF885C567B6, netScene, _r, _ri)
end
Global.N_0x02c40bf885c567b6 = Global.NetworkUnlinkNetworkedSynchronisedScene

function Global.NetworkUnregisterNetworkedEntity(entity)
	return _in(0x7368E683BB9038D6, entity)
end
Global.N_0x7368e683bb9038d6 = Global.NetworkUnregisterNetworkedEntity

function Global.NetworkUpdateLoadScene()
	return _in(0xC4582015556D1C46, _r, _ri)
end

function Global.NetworkXAffectsGamers(p0)
	return _in(0xE532D6811B3A4D2A, p0, _r)
end
Global.N_0xe532d6811b3a4d2a = Global.NetworkXAffectsGamers

function Global.NewLoadSceneStart(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x212A8D0D2BABFAC2, p0, p1, p2, p3, p4, p5, p6, p7, _r)
end

--- if (!sub_8f12("START LOAD SCENE SAFE")) {
-- if (CUTSCENE::GET_CUTSCENE_TIME() &gt; 4178) {
-- STREAMING::_ACCFB4ACF53551B0(1973.845458984375, 3818.447265625, 32.43629837036133, 15.0, 2);
-- sub_8e9e("START LOAD SCENE SAFE", 1);
-- }
-- }
-- (Previously known as STREAMING::_NEW_LOAD_SCENE_START_SAFE)
function Global.NewLoadSceneStartSphere(x, y, z, radius, p4)
	return _in(0xACCFB4ACF53551B0, x, y, z, radius, p4, _r)
end
Global.N_0xaccfb4acf53551b0 = Global.NewLoadSceneStartSphere

function Global.NewLoadSceneStop()
	return _in(0xC197616D221FF4A4)
end

--- This function and the one below it are for after you receive an invite, not sending it.
-- p0 = 1 or 0
-- nothin doin.
-- int invite(Player player)
-- {
-- int iVar2, iVar3;
-- networkHandleMgr handle;
-- NETWORK_HANDLE_FROM_PLAYER(player, &amp;handle.netHandle, 13);
-- networkClanMgr clan;
-- char *playerName = GET_PLAYER_NAME(player);
-- _SET_NOTIFICATION_TEXT_ENTRY("STRING");
-- _SET_NOTIFACTION_COLOR_NEXT(0);
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(playerName);
-- if (NETWORK_CLAN_PLAYER_GET_DESC(&amp;clan, 35, &amp;handle.netHandle))
-- {
-- iVar2 = 0;
-- if (ARE_STRINGS_EQUAL(clan.unk22, "Leader") &amp;&amp; clan.unk30 == 0)
-- {
-- iVar2 = 1;
-- }
-- if (clan.unk21 &gt; 0)
-- {
-- iVar3 = 0;
-- }
-- else
-- {
-- iVar3 = 1;
-- }
-- BOOL unused = _0x54E79E9C(&amp;clan.clanHandle, 35);
-- return _NOTIFICATION_SEND_APARTMENT_INVITE(iVar3, 0 /*unused*/, &amp;clan.unk17, clan.unk30, iVar2, 0, clan.clanHandle, 0, 0, 0);
-- }
-- }
function Global.NotificationSendApartmentInvite(p0, p1, p3, isLeader, unk0, clanDesc, R, G, B)
	return _in(0x97C9E4E7024A8F2C, p0, p1, _i, p3, isLeader, unk0, clanDesc, R, G, B, _r, _ri)
end
Global.N_0x97c9e4e7024a8f2c = Global.NotificationSendApartmentInvite

--- p0 = 1 or 0
-- crashes my game...
-- this is for sending invites to network players - jobs/apartment/ect...
-- return notification handle
-- int invite(Player player)
-- {
-- networkHandleMgr netHandle;
-- networkClanMgr clan;
-- char *playerName = GET_PLAYER_NAME(player);
-- _SET_NOTIFICATION_TEXT_ENTRY("STRING");
-- _SET_NOTIFACTION_COLOR_NEXT(1);
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(playerName);
-- NETWORK_HANDLE_FROM_PLAYER(player, &amp;netHandle.netHandle, 13);
-- if (NETWORK_CLAN_PLAYER_IS_ACTIVE(&amp;netHandle.netHandle))
-- {
-- NETWORK_CLAN_PLAYER_GET_DESC(&amp;clan.clanHandle, 35, &amp;netHandle.netHandle);
-- _NOTIFICATION_SEND_CLAN_INVITE(0, _0x54E79E9C(&amp;clan.clanHandle, 35), &amp;clan.unk17, clan.isLeader, 0, 0, clan.clanHandle, playerName, 0, 0, 0);
-- }
-- }
function Global.NotificationSendClanInvite(p0, p1, p3, isLeader, unk0, clanDesc, playerName, R, G, B)
	return _in(0x137BC35589E34E1E, p0, p1, _i, p3, isLeader, unk0, clanDesc, _ts(playerName), R, G, B, _r, _ri)
end
Global.N_0x137bc35589e34e1e = Global.NotificationSendClanInvite

--- Sets the value of the specified variable to 0.
-- Always returns true.
-- bool _NULLIFY(void* variable, int unused)
-- {
-- *variable = NULL;
-- return true;
-- }
function Global.Nullify(unused)
	return _in(0x46E2B844905BC5F0, _i, unused, _r)
end

--- Lets objects spawn online simply do it like this:
-- int createdObject = OBJ_TO_NET(CREATE_OBJECT_NO_OFFSET(oball, pCoords.x, pCoords.y, pCoords.z, 1, 0, 0));
function Global.ObjToNet(object)
	return _in(0x99BFDC94A603E541, object, _r, _ri)
end

--- Please change back to _0x444D8CF241EC25C5 (hash collision)
function Global.ObjectDecalToggle(hash)
	return _in(0x444D8CF241EC25C5, _ch(hash))
end

function Global.ObjectValueAddArray(key)
	return _in(0x5B11728527CA6E5F, _i, _ts(key), _r, _ri)
end

function Global.ObjectValueAddBoolean(key, value)
	return _in(0x35124302A556A325, _i, _ts(key), value)
end

function Global.ObjectValueAddFloat(key, value)
	return _in(0xC27E1CC2D795105E, _i, _ts(key), value)
end

function Global.ObjectValueAddInteger(key, value)
	return _in(0xE7E035450A7948D5, _i, _ts(key), value)
end

function Global.ObjectValueAddObject(key)
	return _in(0xA358F56F10732EE1, _i, _ts(key), _r, _ri)
end

function Global.ObjectValueAddString(key, value)
	return _in(0x8FF3847DADD8E30C, _i, _ts(key), _ts(value))
end

function Global.ObjectValueAddVector3(key, valueX, valueY, valueZ)
	return _in(0x4CD49B76338C7DEE, _i, _ts(key), valueX, valueY, valueZ)
end

function Global.ObjectValueGetArray(key)
	return _in(0x7A983AA9DA2659ED, _i, _ts(key), _r, _ri)
end

function Global.ObjectValueGetBoolean(key)
	return _in(0x1186940ED72FFEEC, _i, _ts(key), _r)
end

function Global.ObjectValueGetFloat(key)
	return _in(0x06610343E73B9727, _i, _ts(key), _r, _rf)
end

function Global.ObjectValueGetInteger(key)
	return _in(0x78F06F6B1FB5A80C, _i, _ts(key), _r, _ri)
end

function Global.ObjectValueGetObject(key)
	return _in(0xB6B9DDC412FCEEE2, _i, _ts(key), _r, _ri)
end

function Global.ObjectValueGetString(key)
	return _in(0x3D2FD9E763B24472, _i, _ts(key), _r, _s)
end

--- Types:
-- 1 = Boolean
-- 2 = Integer
-- 3 = Float
-- 4 = String
-- 5 = Vector3
-- 6 = Object
-- 7 = Array
function Global.ObjectValueGetType(key)
	return _in(0x031C55ED33227371, _i, _ts(key), _r, _ri)
end

function Global.ObjectValueGetVector3(key)
	return _in(0x46CD3CB66E0825CC, _i, _ts(key), _r, _rv)
end

function Global.OpenBombBayDoors(vehicle)
	return _in(0x87E7F24270732CB1, vehicle)
end
Global.OpenVehicleBombBay = Global.OpenBombBayDoors

--- patrolRoutes found in the b617d scripts:
-- "miss_Ass0",
-- "miss_Ass1",
-- "miss_Ass2",
-- "miss_Ass3",
-- "miss_Ass4",
-- "miss_Ass5",
-- "miss_Ass6",
-- "MISS_PATROL_6",
-- "MISS_PATROL_7",
-- "MISS_PATROL_8",
-- "MISS_PATROL_9",
-- "miss_Tower_01",
-- "miss_Tower_02",
-- "miss_Tower_03",
-- "miss_Tower_04",
-- "miss_Tower_05",
-- "miss_Tower_06",
-- "miss_Tower_07",
-- "miss_Tower_08",
-- "miss_Tower_10"
function Global.OpenPatrolRoute(patrolRoute)
	return _in(0xA36BFB5EE89F3D82, _ts(patrolRoute))
end

function Global.OpenSequenceTask(taskSequence)
	return _in(0xE8854A4326B9E12B, _ii(taskSequence) --[[ may be optional ]], _r, _ri)
end

--- Max value for p1 is 15.
function Global.OverrideCamSplineMotionBlur(cam, p1, p2, p3)
	return _in(0x7DCF7C708D292D55, cam, p1, p2, p3)
end

function Global.OverrideCamSplineVelocity(cam, p1, p2, p3)
	return _in(0x40B62FA033EB0346, cam, p1, p2, p3)
end

--- Only used once in the decompiled scripts. Seems to be related to scripted vehicle generators.
-- Modified example from "am_imp_exp.c4", line 6406:
-- /* popSchedules[0] = ZONE::GET_ZONE_POPSCHEDULE(ZONE::GET_ZONE_AT_COORDS(891.3, 807.9, 188.1));
-- etc.
-- */
-- ZONE::OVERRIDE_POPSCHEDULE_VEHICLE_MODEL(popSchedules[index], vehicleHash);
-- STREAMING::REQUEST_MODEL(vehicleHash);
function Global.OverridePopscheduleVehicleModel(scheduleId, vehicleHash)
	return _in(0x5F7D596BAC2E7777, scheduleId, _ch(vehicleHash))
end

function Global.OverrideSaveHouse(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x1162EA8AE9D24EEA, p0, p1, p2, p3, p4, p5, p6, p7, _r)
end

function Global.OverrideTrevorRage(p0)
	return _in(0x13AD665062541A7E, _ii(p0) --[[ may be optional ]])
end

function Global.OverrideUnderwaterStream(p1)
	return _in(0xF2A9CDABCEA04BD6, _i, p1)
end

--- vehicle - the vehicle whose horn should be overwritten
-- mute - p1 seems to be an option for muting the horn
-- p2 - maybe a horn id, since the function AUDIO::GET_VEHICLE_DEFAULT_HORN(veh) exists?
function Global.OverrideVehHorn(vehicle, mute, p2)
	return _in(0x3CDC1E622CCE0356, vehicle, mute, p2)
end

--- Return the local Participant ID
function Global.ParticipantId()
	return _in(0x90986E8876CE0A83, _r, _ri)
end

--- Return the local Participant ID.
-- This native is exactly the same as 'PARTICIPANT_ID' native.
function Global.ParticipantIdToInt()
	return _in(0x57A3BDDAD8E5AA0A, _r, _ri)
end

function Global.PauseClock(toggle)
	return _in(0x4055E40BD2DBEC1D, toggle)
end

function Global.PausePlaybackRecordedVehicle(p0)
	return _in(0x632A689BF42301B1, p0)
end

function Global.PauseScriptedConversation(p0)
	return _in(0x8530AD776CD72B12, p0)
end

function Global.PedHasUseScenarioTask(ped)
	return _in(0x295E3CCEC879CCD7, ped, _r)
end

--- [23.03.2017 19:08] by ins1de :
-- "_IS_PED_RELOADING" is totally a wrong name...
-- This native actually disables the reloading animation and script for the specified ped. Native renamed.
function Global.PedSkipNextReloading(ped)
	return _in(0x8C0D57EA686FAD87, ped, _r)
end
Global.IsPedReloading = Global.PedSkipNextReloading

function Global.PedToNet(ped)
	return _in(0x0EDEC3C276198689, ped, _r, _ri)
end

function Global.PinRopeVertex(rope, vertex, x, y, z)
	return _in(0x2B320CF14146B69A, rope, vertex, x, y, z)
end

function Global.PlaceObjectOnGroundProperly(object)
	return _in(0x58A850EAEE20FAA3, object, _r)
end

--- Plays ambient speech. See also _0x444180DB.
-- ped: The ped to play the ambient speech.
-- speechName: Name of the speech to play, eg. "GENERIC_HI".
-- speechParam: Can be one of the following:
-- SPEECH_PARAMS_STANDARD
-- SPEECH_PARAMS_ALLOW_REPEAT
-- SPEECH_PARAMS_BEAT
-- SPEECH_PARAMS_FORCE
-- SPEECH_PARAMS_FORCE_FRONTEND
-- SPEECH_PARAMS_FORCE_NO_REPEAT_FRONTEND
-- SPEECH_PARAMS_FORCE_NORMAL
-- SPEECH_PARAMS_FORCE_NORMAL_CLEAR
-- SPEECH_PARAMS_FORCE_NORMAL_CRITICAL
-- SPEECH_PARAMS_FORCE_SHOUTED
-- SPEECH_PARAMS_FORCE_SHOUTED_CLEAR
-- SPEECH_PARAMS_FORCE_SHOUTED_CRITICAL
-- SPEECH_PARAMS_FORCE_PRELOAD_ONLY
-- SPEECH_PARAMS_MEGAPHONE
-- SPEECH_PARAMS_HELI
-- SPEECH_PARAMS_FORCE_MEGAPHONE
-- SPEECH_PARAMS_FORCE_HELI
-- SPEECH_PARAMS_INTERRUPT
-- SPEECH_PARAMS_INTERRUPT_SHOUTED
-- SPEECH_PARAMS_INTERRUPT_SHOUTED_CLEAR
-- SPEECH_PARAMS_INTERRUPT_SHOUTED_CRITICAL
-- SPEECH_PARAMS_INTERRUPT_NO_FORCE
-- SPEECH_PARAMS_INTERRUPT_FRONTEND
-- SPEECH_PARAMS_INTERRUPT_NO_FORCE_FRONTEND
-- SPEECH_PARAMS_ADD_BLIP
-- SPEECH_PARAMS_ADD_BLIP_ALLOW_REPEAT
-- SPEECH_PARAMS_ADD_BLIP_FORCE
-- SPEECH_PARAMS_ADD_BLIP_SHOUTED
-- SPEECH_PARAMS_ADD_BLIP_SHOUTED_FORCE
-- SPEECH_PARAMS_ADD_BLIP_INTERRUPT
-- SPEECH_PARAMS_ADD_BLIP_INTERRUPT_FORCE
-- SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED
-- SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CLEAR
-- SPEECH_PARAMS_FORCE_PRELOAD_ONLY_SHOUTED_CRITICAL
-- SPEECH_PARAMS_SHOUTED
-- SPEECH_PARAMS_SHOUTED_CLEAR
-- SPEECH_PARAMS_SHOUTED_CRITICAL
-- Note: A list of Name and Parameters can be found here pastebin.com/1GZS5dCL
-- Full list of speeches and voices names by alexguirre: gist.github.com/alexguirre/0af600eb3d4c91ad4f900120a63b8992
function Global.PlayAmbientSpeech1(ped, speechName, speechParam)
	return _in(0x8E04FEDD28D42462, ped, _ts(speechName), _ts(speechParam))
end

--- Plays ambient speech. See also _0x5C57B85D.
-- See _PLAY_AMBIENT_SPEECH1 for parameter specifications.
-- Full list of speeches and voices names by alexguirre: gist.github.com/alexguirre/0af600eb3d4c91ad4f900120a63b8992
function Global.PlayAmbientSpeech2(ped, speechName, speechParam)
	return _in(0xC6941B4A3A8FBBB9, ped, _ts(speechName), _ts(speechParam))
end

function Global.PlayAmbientSpeechAtCoords(p0, p1, p2, p3, p4, p5)
	return _in(0xED640017ED337E45, _ts(p0), _ts(p1), p2, p3, p4, _ts(p5))
end
Global.N_0xed640017ed337e45 = Global.PlayAmbientSpeechAtCoords

--- This is the same as _PLAY_AMBIENT_SPEECH1 and _PLAY_AMBIENT_SPEECH2 but it will allow you to play a speech file from a specific voice file. It works on players and all peds, even animals.
-- EX (C#):
-- GTA.Native.Function.Call(Hash._0x3523634255FC3318, Game.Player.Character, "GENERIC_INSULT_HIGH", "s_m_y_sheriff_01_white_full_01", "SPEECH_PARAMS_FORCE_SHOUTED", 0);
-- The first param is the ped you want to play it on, the second is the speech name, the third is the voice name, the fourth is the speech param, and the last param is usually always 0.
-- Full list of speeches and voices names by alexguirre: gist.github.com/alexguirre/0af600eb3d4c91ad4f900120a63b8992
function Global.PlayAmbientSpeechWithVoice(p0, speechName, voiceName, speechParam, p4)
	return _in(0x3523634255FC3318, p0, _ts(speechName), _ts(voiceName), _ts(speechParam), p4)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.PlayAnimOnRunningScenario(ped, animDict, animName)
	return _in(0x748040460F8DF5DC, ped, _ts(animDict), _ts(animName))
end

--- Atleast one time in a script for the zRot Rockstar uses GET_ENTITY_HEADING to help fill the parameter.
-- p9 is unknown at this time.
-- p10 throughout all the X360 Scripts is always 2.
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.PlayCamAnim(cam, animName, animDictionary, x, y, z, xRot, yRot, zRot, p9, p10)
	return _in(0x9A2D0FB2E7852392, cam, _ts(animName), _ts(animDictionary), x, y, z, xRot, yRot, zRot, p9, p10, _r)
end

function Global.PlayEndCreditsMusic(play)
	return _in(0xCD536C4D33DCC900, play)
end

--- delta and bitset are guessed fields. They are based on the fact that most of the calls have 0 or nil field types passed in.
-- The only time bitset has a value is 0x4000 and the only time delta has a value is during stealth with usually &lt;1.0f values.
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.PlayEntityAnim(entity, animName, animDict, p3, loop, stayInAnim, p6, delta, bitset)
	return _in(0x7FB218262B810701, entity, _ts(animName), _ts(animDict), p3, loop, stayInAnim, p6, delta, bitset, _r)
end

function Global.PlayEntityScriptedAnim(p0, p4, p5)
	return _in(0x77A1EEC547E7FCF1, p0, _i, _i, _i, p4, p5)
end

function Global.PlayFacialAnim(ped, animName, animDict)
	return _in(0xE1E65CA8AC9C00ED, ped, _ts(animName), _ts(animDict))
end

--- Called 38 times in the scripts. There are 5 different audioNames used.
-- One unknown removed below.
-- AUDIO::PLAY_MISSION_COMPLETE_AUDIO("DEAD");
-- AUDIO::PLAY_MISSION_COMPLETE_AUDIO("FRANKLIN_BIG_01");
-- AUDIO::PLAY_MISSION_COMPLETE_AUDIO("GENERIC_FAILED");
-- AUDIO::PLAY_MISSION_COMPLETE_AUDIO("TREVOR_SMALL_01");
function Global.PlayMissionCompleteAudio(audioName)
	return _in(0xB138AAB8A70D3C69, _ts(audioName))
end

--- Needs another parameter [int p2]. The signature is PED::PLAY_PAIN(Ped ped, int painID, int p1, int p2);
-- Last 2 parameters always seem to be 0.
-- EX: Function.Call(Hash.PLAY_PAIN, TestPed, 6, 0, 0);
-- Known Pain IDs
-- ________________________
-- 1 - Doesn't seem to do anything. Does NOT crash the game like previously said. (Latest patch)
-- 6 - Scream (Short)
-- 7 - Scared Scream (Kinda Long)
-- 8 - On Fire
function Global.PlayPain(ped, painID, p1)
	return _in(0xBC9AE166038A5CEC, ped, painID, p1)
end

--- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/RFb4GTny
-- AUDIO::PLAY_PED_RINGTONE("Remote_Ring", PLAYER::PLAYER_PED_ID(), 1);
-- AUDIO::PLAY_PED_RINGTONE("Dial_and_Remote_Ring", PLAYER::PLAYER_PED_ID(), 1);
function Global.PlayPedRingtone(ringtoneName, ped, p2)
	return _in(0xF9E56683CA8E11A5, _ts(ringtoneName), ped, p2)
end

--- Please change to void. (Does not return anything!)
-- Plays the given police radio message.
-- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/GBnsQ5hr
function Global.PlayPoliceReport(name, p1)
	return _in(0xDFEBD56D9BD1EB16, _ts(name), p1, _r, _ri)
end

--- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/A8Ny8AHZ
function Global.PlaySound(soundId, audioName, audioRef, p3, p4, p5)
	return _in(0x7FF4944CC209192D, soundId, _ts(audioName), _ts(audioRef), p3, p4, p5)
end

--- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/eeFc5DiW
-- gtaforums.com/topic/795622-audio-for-mods
function Global.PlaySoundFromCoord(soundId, audioName, x, y, z, audioRef, p6, range, p8)
	return _in(0x8D8686B622B88120, soundId, _ts(audioName), x, y, z, _ts(audioRef), p6, range, p8)
end

--- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/f2A7vTj0
-- No changes made in b678d.
-- gtaforums.com/topic/795622-audio-for-mods
function Global.PlaySoundFromEntity(soundId, audioName, entity, audioRef, p4, p5)
	return _in(0xE65F427EB70AB1ED, soundId, _ts(audioName), entity, _ts(audioRef), p4, p5)
end

--- list: pastebin.com/DCeRiaLJ
-- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/0neZdsZ5
function Global.PlaySoundFrontend(soundId, audioName, audioRef, p3)
	return _in(0x67C540AA08E4A6F5, soundId, _ts(audioName), _ts(audioRef), p3)
end

--- Used with AUDIO::LOAD_STREAM
-- Example from finale_heist2b.c4:
-- AI::TASK_SYNCHRONIZED_SCENE(l_4C8[2/*14*/], l_4C8[2/*14*/]._f7, l_30A, "push_out_vault_l", 4.0, -1.5, 5, 713, 4.0, 0);
-- PED::SET_SYNCHRONIZED_SCENE_PHASE(l_4C8[2/*14*/]._f7, 0.0);
-- PED::_2208438012482A1A(l_4C8[2/*14*/], 0, 0);
-- PED::SET_PED_COMBAT_ATTRIBUTES(l_4C8[2/*14*/], 38, 1);
-- PED::SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(l_4C8[2/*14*/], 1);
-- if (AUDIO::LOAD_STREAM("Gold_Cart_Push_Anim_01", "BIG_SCORE_3B_SOUNDS")) {
-- AUDIO::PLAY_STREAM_FROM_OBJECT(l_36F[0/*1*/]);
-- }
function Global.PlayStreamFromObject(object)
	return _in(0xEBAA9B64D76356FD, object)
end

function Global.PlayStreamFromPed(ped)
	return _in(0x89049DD63C08B5D1, ped)
end
Global.N_0x89049dd63c08b5d1 = Global.PlayStreamFromPed

function Global.PlayStreamFromVehicle(vehicle)
	return _in(0xB70374A758007DFA, vehicle)
end

function Global.PlayStreamFrontend()
	return _in(0x58FCE43488F9F5F4)
end

function Global.PlaySynchronizedAudioEvent(p0)
	return _in(0x8B2FD4560E55DD2D, p0, _r)
end

--- Examples:
-- CAM::PLAY_SYNCHRONIZED_CAM_ANIM(l_2734, NETWORK::_02C40BF885C567B6(l_2739), "PLAYER_EXIT_L_CAM", "mp_doorbell");
-- CAM::PLAY_SYNCHRONIZED_CAM_ANIM(l_F0D[7/*1*/], l_F4D[15/*1*/], "ah3b_attackheli_cam2", "missheistfbi3b_helicrash");
function Global.PlaySynchronizedCamAnim(p0, p1, animName, animDictionary)
	return _in(0xE32EFE9AB4A9AA0C, p0, p1, _ts(animName), _ts(animDictionary), _r)
end

--- p4 and p7 are usually 1000.0f.
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.PlaySynchronizedEntityAnim(entity, syncedScene, animation, propName, p4, p5, p6, p7)
	return _in(0xC77720A12FE14A86, entity, syncedScene, _ts(animation), _ts(propName), p4, p5, p6, p7, _r)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.PlaySynchronizedMapEntityAnim(p0, p1, p2, p3, p4, p5, p8, p9, p10, p11)
	return _in(0xB9C54555ED30FBC4, p0, p1, p2, p3, p4, p5, _i, _i, p8, p9, p10, p11, _r)
end

--- This native only comes up once. And in that one instance, p1 is "1".
function Global.PlayVehicleDoorCloseSound(vehicle, p1)
	return _in(0x62A456AA4769EF34, vehicle, p1)
end

--- p1 appears to only be "0" or "3". I personally use "0" as p1.
function Global.PlayVehicleDoorOpenSound(vehicle, p1)
	return _in(0x3A539D52857EA82D, vehicle, p1)
end

--- Only 1 match. ob_sofa_michael.
-- PLAYER::PLAYER_ATTACH_VIRTUAL_BOUND(-804.5928f, 173.1801f, 71.68436f, 0f, 0f, 0.590625f, 1f, 0.7f);1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
function Global.PlayerAttachVirtualBound(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0xED51733DC73AED51, p0, p1, p2, p3, p4, p5, p6, p7)
end

--- 1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
function Global.PlayerDetachVirtualBound()
	return _in(0x1DD5897E2FA6E7C9)
end

--- This returns YOUR 'identity' as a Player type.
-- Always returns 0 in story mode.
function Global.PlayerId()
	return _in(0x4F8644AF03D0E0D6, _r, _ri)
end

--- Returns current player ped
function Global.PlayerPedId()
	return _in(0xD80958FC74E988A6, _r, _ri)
end

function Global.PlaystatsAmbientMissionCrateCreated(p0, p1, p2)
	return _in(0xAFC7E5E075A96F46, p0, p1, p2)
end
Global.N_0xafc7e5e075a96f46 = Global.PlaystatsAmbientMissionCrateCreated

function Global.PlaystatsAwardXp(p0, p1, p2)
	return _in(0x46F917F6B4128FE4, p0, p1, p2)
end

function Global.PlaystatsCheatApplied(cheat)
	return _in(0x6058665D72302D3F, _ts(cheat))
end

function Global.PlaystatsClothChange(p0, p1, p2, p3, p4)
	return _in(0x34B973047A2268B9, p0, p1, p2, p3, p4)
end

function Global.PlaystatsFriendActivity(p0, p1)
	return _in(0x0F71DE29AB2258F1, p0, p1)
end

function Global.PlaystatsMatchStarted(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xBC80E22DED931E3D, p0, p1, p2, p3, p4, p5, p6)
end

function Global.PlaystatsMissionCheckpoint(p1, p2, p3)
	return _in(0xC900596A63978C1D, _i, p1, p2, p3)
end

function Global.PlaystatsMissionOver(p1, p2, p3, p4, p5)
	return _in(0x7C4BB33A8CED7324, _i, p1, p2, p3, p4, p5)
end

function Global.PlaystatsMissionStarted(p1, p2, p3)
	return _in(0xC19A2925C34D2231, _i, p1, p2, p3)
end

function Global.PlaystatsNpcInvite(p0)
	return _in(0x93054C88E6AA7C44, _ii(p0) --[[ may be optional ]])
end

function Global.PlaystatsOddjobDone(p0, p1, p2)
	return _in(0x69DEA3E9DB727B4C, p0, p1, p2)
end

function Global.PlaystatsPropChange(p0, p1, p2, p3)
	return _in(0xBA739D6D5A05D6E7, p0, p1, p2, p3)
end

function Global.PlaystatsRaceCheckpoint(p0, p1, p2, p3, p4)
	return _in(0x9C375C315099DDE4, p0, p1, p2, p3, p4)
end

function Global.PlaystatsRankUp(p0)
	return _in(0xC7F2DE41D102BFB4, p0)
end

function Global.PlaystatsShopItem(p0, p1, p2, p3, p4)
	return _in(0x176852ACAAC173D1, p0, p1, p2, p3, p4)
end

function Global.PlaystatsWebsiteVisited(scaleformHash, p1)
	return _in(0xDDF24D535060F811, _ch(scaleformHash), p1)
end
Global.N_0xddf24d535060f811 = Global.PlaystatsWebsiteVisited

function Global.PointCamAtCoord(cam, x, y, z)
	return _in(0xF75497BB865F0803, cam, x, y, z)
end

--- p5 always seems to be 1 i.e TRUE
function Global.PointCamAtEntity(cam, entity, p2, p3, p4, p5)
	return _in(0x5640BFF86B16E8DC, cam, entity, p2, p3, p4, p5)
end

--- Parameters p0-p5 seems correct. The bool p6 is unknown, but through every X360 script it's always 1. Please correct p0-p5 if any prove to be wrong.
function Global.PointCamAtPedBone(cam, ped, boneIndex, x, y, z, p6)
	return _in(0x68B2B5F33BA63C41, cam, ped, boneIndex, x, y, z, p6)
end

--- Pops and calls the Scaleform movie on the stack. Returns data from the function (not sure if this is a string).
function Global.PopScaleformMovieFunction()
	return _in(0xC50AA39A577AF886, _r, _ri)
end

--- Pops and calls the Scaleform function on the stack
function Global.PopScaleformMovieFunctionVoid()
	return _in(0xC6796A8FFA375E53)
end

function Global.PopTimecycleModifier()
	return _in(0x3C8938D7D872211E)
end

--- spawns a few distant/out-of-sight peds, vehicles, animals etc each time it is called
function Global.PopulateNow()
	return _in(0x7472BB270D7B4F3E)
end

function Global.Pow(base, exponent)
	return _in(0xE3621CC40F31FE2E, base, exponent, _r, _rf)
end

function Global.PrefetchSrl(srl)
	return _in(0x3D245789CE12982C, _ts(srl))
end

function Global.PreloadScriptConversation(p0, p1, p2, p3)
	return _in(0x3B3CAD6166916D87, p0, p1, p2, p3)
end

function Global.PreloadScriptPhoneConversation(p0, p1)
	return _in(0x6004BCB0E226AAEA, p0, p1)
end

function Global.PreloadVehicleMod(p0, p1, p2)
	return _in(0x758F49C24925568A, p0, p1, p2)
end

--- Example:
-- bool prepareAlarm = AUDIO::PREPARE_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS");
function Global.PrepareAlarm(alarmName)
	return _in(0x9D74AE343DB65533, _ts(alarmName), _r)
end

--- All music event names found in the b617d scripts: pastebin.com/GnYt0R3P
function Global.PrepareMusicEvent(eventName)
	return _in(0x1E5185B72EF5158A, _ts(eventName), _r)
end

function Global.PrepareSynchronizedAudioEvent(p0, p1)
	return _in(0xC7ABCACA4985A766, _ts(p0), p1, _r, _ri)
end

function Global.PrepareSynchronizedAudioEventForScene(p0, p1)
	return _in(0x029FE7CD1B7E2E75, p0, _ii(p1) --[[ may be optional ]], _r)
end

--- This isn't a hash collision. It is used to give the player cash via the CASH_GIFT stats.
function Global.ProcessCashGift(p2)
	return _in(0x20194D48EAEC9A41, _i, _i, _ts(p2), _r, _s)
end
Global.N_0x20194d48eaec9a41 = Global.ProcessCashGift

--- Called to update entity attachments.
function Global.ProcessEntityAttachments(entity)
	return _in(0xF4080490ADC51C6F, entity)
end

function Global.PulseBlip(blip)
	return _in(0x742D6FD43115AF73, blip)
end

--- Push a function from the Scaleform onto the stack
function Global.PushScaleformMovieFunction(scaleform, functionName)
	return _in(0xF6E48914C7A8694E, scaleform, _ts(functionName), _r)
end

--- Pushes a function from the Hud component Scaleform onto the stack. Same behavior as GRAPHICS::_PUSH_SCALEFORM_MOVIE_FUNCTION, just a hud component id instead of a Scaleform.
-- Known components:
-- 19
-- 20
-- This native requires more research - all information can be found inside of 'hud.gfx'. Using a decompiler, the different components are located under "scripts\__Packages\com\rockstargames\gtav\hud\hudComponents" and "scripts\__Packages\com\rockstargames\gtav\Multiplayer".
function Global.PushScaleformMovieFunctionFromHudComponent(hudComponent, functionName)
	return _in(0x98C494FD5BDFBFD5, hudComponent, _ts(functionName), _r)
end

--- Possibly calls "global" Scaleform functions - needs more research!
function Global.PushScaleformMovieFunctionN(functionName)
	return _in(0xAB58C27C2E6123C6, _ts(functionName), _r)
end
Global.N_0xab58c27c2e6123c6 = Global.PushScaleformMovieFunctionN

--- Pushes a boolean for the Scaleform function onto the stack.
function Global.PushScaleformMovieFunctionParameterBool(value)
	return _in(0xC58424BA936EB458, value)
end

--- Pushes a float for the Scaleform function onto the stack.
function Global.PushScaleformMovieFunctionParameterFloat(value)
	return _in(0xD69736AAE04DB51A, value)
end

--- Pushes an integer for the Scaleform function onto the stack.
function Global.PushScaleformMovieFunctionParameterInt(value)
	return _in(0xC3D0841A0CC546A6, value)
end

function Global.PushScaleformMovieFunctionParameterString(value)
	return _in(0xBA7148484BD90365, _ts(value))
end

function Global.PushTimecycleModifier()
	return _in(0x58F735290861E6B4)
end

function Global.RaiseConvertibleRoof(vehicle, instantlyRaise)
	return _in(0x8F5FB35D7E88FC70, vehicle, instantlyRaise)
end

function Global.RefreshInterior(interiorID)
	return _in(0x41F37C3427C75AE0, interiorID)
end

function Global.RefreshWaypoint()
	return _in(0x81FA173F170560D1)
end

function Global.RegisterBoolToSave(name)
	return _in(0xC8F4131414C835A1, _i, _ts(name))
end

function Global.RegisterCommand(commandName, handler, restricted)
	return _in(0x5fa79b0f, _ts(commandName), _mfr(handler), restricted)
end

function Global.RegisterEntityForCutscene(cutscenePed, cutsceneEntName, p2, modelHash, p4)
	return _in(0xE40C1C56DF95C2E8, cutscenePed, _ts(cutsceneEntName), p2, _ch(modelHash), p4)
end

function Global.RegisterEnumToSave(name)
	return _in(0x10C2FA78D0E128A1, _i, _ts(name))
end

function Global.RegisterFloatToSave(name)
	return _in(0x7CAEC29ECB5DFEBB, _i, _ts(name))
end

--- Registers a specified .gfx file as GFx font library.
-- The .gfx file has to be registered with the streamer already.
-- @param fileName The name of the .gfx file, without extension.
function Global.RegisterFontFile(fileName)
	return _in(0x1b3a363, _ts(fileName))
end

--- Registers a specified font name for use with text draw commands.
-- @param fontName The name of the font in the GFx font library.
-- @return An index to use with [SET\_TEXT\_FONT](#_0x66E0276CC5F6B9DA) and similar natives.
function Global.RegisterFontId(fontName)
	return _in(0xacf6d8ee, _ts(fontName), _r, _ri)
end

--- Based on TASK_COMBAT_HATED_TARGETS_AROUND_PED, the parameters are likely similar (PedHandle, and area to attack in).
function Global.RegisterHatedTargetsAroundPed(ped, radius)
	return _in(0x9222F300BF8354FE, ped, radius)
end

function Global.RegisterIntToSave(name)
	return _in(0x34C9EE5986258415, _i, _ts(name))
end

function Global.RegisterNamedRendertarget(p0, p1)
	return _in(0x57D9C12635E25CE3, _ts(p0), p1, _r)
end

function Global.RegisterNuiCallbackType(callbackType)
	return _in(0xcd03cda9, _ts(callbackType))
end

--- Registers a script for any object with a specific model hash.
-- BRAIN::REGISTER_OBJECT_SCRIPT_BRAIN("ob_telescope", ${prop_telescope_01}, 100, 4.0, -1, 9);
function Global.RegisterObjectScriptBrain(scriptName, objectName, p2, p3, p4, p5)
	return _in(0x0BE84C318BA6EC22, _ts(scriptName), _ch(objectName), p2, p3, p4, p5)
end

--- gtaforums.com/topic/885580-ped-headshotmugshot-txd/
function Global.RegisterPedheadshot(ped)
	return _in(0x4462658788425076, ped, _r, _ri)
end

function Global.RegisterSaveHouse(p0, p1, p2, p3, p5, p6)
	return _in(0xC0714D0A7EEECA54, p0, p1, p2, p3, _i, p5, p6, _r, _ri)
end

function Global.RegisterScriptWithAudio(p0)
	return _in(0xC6ED9D5092438D91, p0)
end

function Global.RegisterSynchronisedScriptSpeech()
	return _in(0x2131046957F31B04)
end

--- PED::REGISTER_TARGET(l_216, PLAYER::PLAYER_PED_ID()); from re_prisonbreak.txt.
-- l_216 = RECSBRobber1
function Global.RegisterTarget(ped, target)
	return _in(0x2F25D9AEFA34FBA2, ped, target)
end

function Global.RegisterTextLabelToSave(name)
	return _in(0xEDB1232C5BEAE62F, _i, _ts(name))
end

function Global.RegisterWorldPointScriptBrain(p1, p2)
	return _in(0x3CDC7136613284BD, _i, p1, p2)
end

function Global.ReleaseAmbientAudioBank()
	return _in(0x65475A218FFAA93D)
end

function Global.ReleaseMissionAudioBank()
	return _in(0x0EC92A1BF0857187)
end

function Global.ReleaseMovieMeshSet(movieMeshSet)
	return _in(0xEB119AA014E89183, movieMeshSet)
end

function Global.ReleaseNamedRendertarget(p0)
	return _in(0xE9F6FFE837354DD4, _ii(p0) --[[ may be optional ]], _r)
end

function Global.ReleaseNamedScriptAudioBank(audioBank)
	return _in(0x77ED170667F50170, _ts(audioBank))
end

function Global.ReleasePreloadMods(vehicle)
	return _in(0x445D79F995508307, vehicle)
end

function Global.ReleaseScriptAudioBank()
	return _in(0x7A2D8AD0A9EB9C3F)
end

function Global.ReleaseSoundId(soundId)
	return _in(0x353FC880830B88FA, soundId)
end

function Global.RemoveActionModeAsset(asset)
	return _in(0x13E940F88470FA51, _ts(asset))
end

function Global.RemoveAllCoverBlockingAreas()
	return _in(0xDB6708C0B46F56D8)
end

--- setting the last params to false it does that same so I would suggest its not a toggle
function Global.RemoveAllPedWeapons(ped, p1)
	return _in(0xF25DF915FA38C5F3, ped, p1)
end

--- Pickup hashes: pastebin.com/8EuSv2r1
function Global.RemoveAllPickupsOfType(pickupHash)
	return _in(0x27F9D613092159CF, _ch(pickupHash))
end

--- p1 seems always to be 0
function Global.RemoveAllProjectilesOfType(weaponHash, p1)
	return _in(0xFC52E0F37E446528, _ch(weaponHash), p1)
end

function Global.RemoveAllShockingEvents(p0)
	return _in(0xEAABE8FDFA21274C, p0)
end

function Global.RemoveAnimDict(animDict)
	return _in(0xF66A602F829E2A06, _ts(animDict))
end

--- Unloads the specified animation set. An animation set provides movement animations for a ped. See SET_PED_MOVEMENT_CLIPSET.
-- Animation set and clip set are synonymous.
function Global.RemoveAnimSet(animSet)
	return _in(0x16350528F93024B3, _ts(animSet))
end

--- In the C++ SDK, this seems not to work-- the blip isn't removed immediately. I use it for saving cars.
-- E.g.:
-- Ped pped = PLAYER::PLAYER_PED_ID();
-- Vehicle v = PED::GET_VEHICLE_PED_IS_USING(pped);
-- Blip b = UI::ADD_BLIP_FOR_ENTITY(v);
-- works fine.
-- But later attempting to delete it with:
-- Blip b = UI::GET_BLIP_FROM_ENTITY(v);
-- if (UI::DOES_BLIP_EXIST(b)) UI::REMOVE_BLIP(&amp;b);
-- doesn't work. And yes, doesn't work without the DOES_BLIP_EXIST check either. Also, if you attach multiple blips to the same thing (say, a vehicle), and that thing disappears, the blips randomly attach to other things (in my case, a vehicle).
-- Thus for me, UI::REMOVE_BLIP(&amp;b) only works if there's one blip, (in my case) the vehicle is marked as no longer needed, you drive away from it and it eventually despawns, AND there is only one blip attached to it. I never intentionally attach multiple blips but if the user saves the car, this adds a blip. Then if they delete it, it is supposed to remove the blip, but it doesn't. Then they can immediately save it again, causing another blip to re-appear.
-- -------------
-- Passing the address of the variable instead of the value works for me.
-- e.g.
-- int blip = UI::ADD_BLIP_FOR_ENTITY(ped);
-- UI::REMOVE_BLIP(&amp;blip);
-- Remove blip will currently crash your game, just artificially remove the blip by setting the sprite to a id that is 'invisible'.
-- --
-- It crashes my game.
function Global.RemoveBlip(blip)
	return _in(0x86A652570E5F25DD, _ii(blip) --[[ may be optional ]])
end

--- Alias for REMOVE_ANIM_SET.
function Global.RemoveClipSet(clipSet)
	return _in(0x01F73A131C18CD94, _ts(clipSet))
end

function Global.RemoveCoverPoint(coverpoint)
	return _in(0xAE287C923D891715, coverpoint)
end

function Global.RemoveCutscene()
	return _in(0x440AF51A3462B86F)
end

function Global.RemoveDecal(decal)
	return _in(0xED3F346429CCD659, decal)
end

function Global.RemoveDecalsFromObject(obj)
	return _in(0xCCF71CBDDF5B6CB9, obj)
end

function Global.RemoveDecalsFromObjectFacing(obj, x, y, z)
	return _in(0xA6F6F70FDC6D144C, obj, x, y, z)
end

function Global.RemoveDecalsFromVehicle(vehicle)
	return _in(0xE91F1B65F2B48D57, vehicle)
end

--- Removes all decals in range from a position, it includes the bullet holes, blood pools, petrol...
function Global.RemoveDecalsInRange(x, y, z, range)
	return _in(0x5D6B2D4830A67C62, x, y, z, range)
end

function Global.RemoveDispatchSpawnBlockingArea(p0)
	return _in(0x264AC28B01B353A5, p0)
end

function Global.RemoveDoorFromSystem(doorHash)
	return _in(0x464D8E1427156FE4, _ch(doorHash))
end

function Global.RemoveForcedObject(p0, p1, p2, p3, p4)
	return _in(0x61B6775E83C0DB6F, p0, p1, p2, p3, p4)
end

function Global.RemoveFromItemset(p0, p1)
	return _in(0x25E68244B0177686, p0, p1)
end

function Global.RemoveGroup(groupId)
	return _in(0x8EB2F69076AF7053, groupId)
end

--- Removes an IPL from the map.
-- IPL List: pastebin.com/pwkh0uRP
-- Example:
-- C#:
-- Function.Call(Hash.REMOVE_IPL, "trevorstrailertidy");
-- C++:
-- STREAMING::REMOVE_IPL("trevorstrailertidy");
-- iplName = Name of IPL you want to remove.
function Global.RemoveIpl(iplName)
	return _in(0xEE6C5AD3ECE0A82D, _ts(iplName))
end

--- Removes the loading prompt at the bottom right of the screen, created by the UI::_SHOW_LOADING_PROMPT native.
function Global.RemoveLoadingPrompt()
	return _in(0x10D373323E5B9C0D)
end
Global.N_0x10d373323e5b9c0d = Global.RemoveLoadingPrompt

function Global.RemoveModelHide(p0, p1, p2, p3, p4, p5)
	return _in(0xD9E3006FB3CBD765, p0, p1, p2, p3, p4, p5)
end

function Global.RemoveModelSwap(x, y, z, radius, originalModel, newModel, p6)
	return _in(0x033C0F9A64E229AE, x, y, z, radius, _ch(originalModel), _ch(newModel), p6)
end

function Global.RemoveMpGamerTag(gamerTagId)
	return _in(0x31698AA80E0223F8, gamerTagId)
end
Global.N_0x31698aa80e0223f8 = Global.RemoveMpGamerTag

function Global.RemoveMultiplayerBankCash()
	return _in(0xC7C6789AA1CFEDD0)
end

--- Removes multiplayer cash hud each frame
function Global.RemoveMultiplayerHudCash()
	return _in(0x968F270E39141ECA)
end

--- console hash: 0xC44762A1
function Global.RemoveNamedPtfxAsset(fxName)
	return _in(0x5F61EBBE1A00F96D, _ts(fxName))
end

function Global.RemoveNavmeshBlockingObject(p0)
	return _in(0x46399A7895957C0E, p0)
end

function Global.RemoveNavmeshRequiredRegions()
	return _in(0x916F0A3CDEC3445E)
end

--- Removes a notification instantly instead of waiting for it to disappear
function Global.RemoveNotification(notificationId)
	return _in(0xBE4390CB40B3E627, notificationId)
end

function Global.RemoveParticleFx(ptfxHandle, p1)
	return _in(0xC401503DFE8D53CF, ptfxHandle, p1)
end

function Global.RemoveParticleFxFromEntity(entity)
	return _in(0xB8FEAEEBCC127425, entity)
end

function Global.RemoveParticleFxInRange(X, Y, Z, radius)
	return _in(0xDD19FA1C6D657305, X, Y, Z, radius)
end

--- Ped will no longer get angry when you stay near him.
function Global.RemovePedDefensiveArea(ped, toggle)
	return _in(0x74D4E028107450A9, ped, toggle)
end

--- Judging purely from a quick disassembly, if the ped is in a vehicle, the ped will be deleted immediately. If not, it'll be marked as no longer needed.
function Global.RemovePedElegantly(ped)
	return _in(0xAC6D445B994DF95E, _ii(ped) --[[ may be optional ]])
end

function Global.RemovePedFromGroup(ped)
	return _in(0xED74007FFB146BC2, ped)
end

function Global.RemovePedHelmet(ped, instantly)
	return _in(0xA7B2458D0AD6DED8, ped, instantly)
end

function Global.RemovePedPreferredCoverSet(ped)
	return _in(0xFDDB234CF74073D9, ped)
end
Global.N_0xfddb234cf74073d9 = Global.RemovePedPreferredCoverSet

--- Retracts the hook on the cargobob.
-- Note: after you retract it the natives for dropping the hook no longer work
function Global.RemovePickUpRopeForCargobob(cargobob)
	return _in(0x9768CF648F54C804, cargobob)
end
Global.RetractCargobobHook = Global.RemovePickUpRopeForCargobob

function Global.RemovePickup(pickup)
	return _in(0x3288D8ACAECD2AB2, pickup)
end

function Global.RemovePlayerHelmet(player, p2)
	return _in(0xF3AC26D3CC576528, player, p2, _r, _ri)
end

function Global.RemovePtfxAsset()
	return _in(0x88C6814073DD4A73)
end

function Global.RemoveRelationshipGroup(groupHash)
	return _in(0xB6BA2444AB393DA2, _ch(groupHash))
end

function Global.RemoveScenarioBlockingArea(p0, p1)
	return _in(0x31D16B74C6E29D66, p0, p1)
end

function Global.RemoveScenarioBlockingAreas()
	return _in(0xD37401D78A929A49)
end

function Global.RemoveScriptFire(fireHandle)
	return _in(0x7FF548385680673F, fireHandle)
end

function Global.RemoveShockingEvent(event)
	return _in(0x2CDA538C44C6CCE5, event, _r)
end

function Global.RemoveShockingEventSpawnBlockingAreas()
	return _in(0x340F1415B68AEADE)
end

function Global.RemoveStealthModeAsset(asset)
	return _in(0x9219857D21F0E842, _ts(asset))
end

function Global.RemoveVehicleAsset(vehicleAsset)
	return _in(0xACE699C71AB9DEB5, vehicleAsset)
end

function Global.RemoveVehicleHighDetailModel(vehicle)
	return _in(0x00689CDE5F7C6787, vehicle)
end

function Global.RemoveVehicleMod(vehicle, modType)
	return _in(0x92D619E420858204, vehicle, modType)
end

function Global.RemoveVehicleRecording(p0, p1)
	return _in(0xF1160ACCF98A3FC8, p0, _ii(p1) --[[ may be optional ]])
end

function Global.RemoveVehicleStuckCheck(vehicle)
	return _in(0x8386BFB614D06749, vehicle)
end

function Global.RemoveVehicleUpsidedownCheck(vehicle)
	return _in(0xC53EB42A499A7E90, vehicle)
end

--- windowIndex:
-- 0 = Front Right Window
-- 1 = Front Left Window
-- 2 = Back Right Window
-- 3 = Back Left Window
function Global.RemoveVehicleWindow(vehicle, windowIndex)
	return _in(0xA711568EEDB43069, vehicle, windowIndex)
end

function Global.RemoveVehiclesFromGeneratorsInArea(x1, y1, z1, x2, y2, z2, unk)
	return _in(0x46A1E1A299EC4BBA, x1, y1, z1, x2, y2, z2, unk)
end

--- For a full list, see here: pastebin.com/Tp0XpBMN
function Global.RemoveWaypointRecording(name)
	return _in(0xFF1B8B4AA1C25DC8, _ts(name))
end

function Global.RemoveWeaponAsset(weaponHash)
	return _in(0xAA08EF13F341C8FC, _ch(weaponHash))
end

function Global.RemoveWeaponComponentFromPed(ped, weaponHash, componentHash)
	return _in(0x1E8BE90C74FB4C09, ped, _ch(weaponHash), _ch(componentHash))
end

function Global.RemoveWeaponComponentFromWeaponObject(p0, p1)
	return _in(0xF7D82B0D66777611, p0, p1)
end

--- This native removes a specified weapon from your selected ped.
-- Weapon Hashes: pastebin.com/0wwDZgkF
-- Example:
-- C#:
-- Function.Call(Hash.REMOVE_WEAPON_FROM_PED, Game.Player.Character, 0x99B507EA);
-- C++:
-- WEAPON::REMOVE_WEAPON_FROM_PED(PLAYER::PLAYER_PED_ID(), 0x99B507EA);
-- The code above removes the knife from the player.
function Global.RemoveWeaponFromPed(ped, weaponHash)
	return _in(0x4899CB088EDF59B8, ped, _ch(weaponHash))
end

--- This native makes the gameplay camera zoom into first person/third person with a special effect.
-- For example, if you were first person in a mission and after the cutscene ends, the camera would then zoom into the first person camera view.
-- if (CAM::GET_FOLLOW_PED_CAM_VIEW_MODE() != 4)
-- CAM::_C819F3CBB62BF692(1, 0, 3, 0)
-- This makes the camera zoom in to first person.
-- --------------------------------------------
-- 1st Param Options: 0 or 1 (Changes quit often, toggle?)
-- 2nd Param Options: 0, 0f, 1f, 3.8f, 10f, 20f (Mostly 0)
-- 3rd Param Options: 3, 2, 1 (Mostly 3);
-- Note for the 2nd param 10f (offroad_race.c) and 3rd param 20f (range_modern.c) are the only times those 2 high floats are called.
-- Note for the 3rd param 2 is only ever set in (franklin0.c), but it also sets it as 3. (0, 0, 3) ||(0, 0f, 2) || (0, 0, 3)
function Global.RenderFirstPersonCam(render, p1, p2)
	return _in(0xC819F3CBB62BF692, render, p1, p2)
end
Global.N_0xc819f3cbb62bf692 = Global.RenderFirstPersonCam

--- ease - smooth transition between the camera's positions
-- easeTime - Time in milliseconds for the transition to happen
-- If you have created a script (rendering) camera, and want to go back to the
-- character (gameplay) camera, call this native with render set to 0.
-- Setting ease to 1 will smooth the transition.
function Global.RenderScriptCams(render, ease, easeTime, p3, p4)
	return _in(0x07E5B515DB0636FC, render, ease, easeTime, p3, p4)
end

--- PLAYER::REPORT_CRIME(PLAYER::PLAYER_ID(), 37, PLAYER::GET_WANTED_LEVEL_THRESHOLD(1));
-- From am_armybase.ysc.c4:
-- PLAYER::REPORT_CRIME(PLAYER::PLAYER_ID(4), 36, PLAYER::GET_WANTED_LEVEL_THRESHOLD(4));
-- -----
-- This was taken from the GTAV.exe v1.334. The function is called sub_140592CE8. For a full decompilation of the function, see here: pastebin.com/09qSMsN7
-- -----
-- crimeType:
-- 1: Firearms possession
-- 2: Person running a red light ("5-0-5")
-- 3: Reckless driver
-- 4: Speeding vehicle (a "5-10")
-- 5: Traffic violation (a "5-0-5")
-- 6: Motorcycle rider without a helmet
-- 7: Vehicle theft (a "5-0-3")
-- 8: Grand Theft Auto
-- 9: ???
-- 10: ???
-- 11: Assault on a civilian (a "2-40")
-- 12: Assault on an officer
-- 13: Assault with a deadly weapon (a "2-45")
-- 14: Officer shot (a "2-45")
-- 15: Pedestrian struck by a vehicle
-- 16: Officer struck by a vehicle
-- 17: Helicopter down (an "AC"?)
-- 18: Civilian on fire (a "2-40")
-- 19: Officer set on fire (a "10-99")
-- 20: Car on fire
-- 21: Air unit down (an "AC"?)
-- 22: An explosion (a "9-96")
-- 23: A stabbing (a "2-45") (also something else I couldn't understand)
-- 24: Officer stabbed (also something else I couldn't understand)
-- 25: Attack on a vehicle ("MDV"?)
-- 26: Damage to property
-- 27: Suspect threatening officer with a firearm
-- 28: Shots fired
-- 29: ???
-- 30: ???
-- 31: ???
-- 32: ???
-- 33: ???
-- 34: A "2-45"
-- 35: ???
-- 36: A "9-25"
-- 37: ???
-- 38: ???
-- 39: ???
-- 40: ???
-- 41: ???
-- 42: ???
-- 43: Possible disturbance
-- 44: Civilian in need of assistance
-- 45: ???
-- 46: ???
function Global.ReportCrime(player, crimeType, wantedLvlThresh)
	return _in(0xE9B09589827545E7, player, crimeType, wantedLvlThresh)
end

function Global.RequestActionModeAsset(asset)
	return _in(0x290E2780BB7AA598, _ts(asset))
end

--- MulleDK19: Alias of REQUEST_COLLISION_AT_COORD.
function Global.RequestAdditionalCollisionAtCoord(p0, p1, p2)
	return _in(0xC9156DC11411A9EA, p0, p1, p2)
end

--- Request a gxt into the passed slot.
function Global.RequestAdditionalText(gxt, slot)
	return _in(0x71A78003C8E71424, _ts(gxt), slot)
end

function Global.RequestAdditionalText_2(gxt, slot)
	return _in(0x6009F9F1AE90D8A6, _ts(gxt), slot)
end

--- All occurrences and usages found in b617d, sorted alphabetically and identical lines removed: pastebin.com/XZ1tmGEz
function Global.RequestAmbientAudioBank(p0, p1)
	return _in(0xFE02FFBED8CA9D99, _ts(p0), p1, _r)
end

function Global.RequestAnimDict(animDict)
	return _in(0xD3BD40951412FEF6, _ts(animDict))
end

--- Starts loading the specified animation set. An animation set provides movement animations for a ped. See SET_PED_MOVEMENT_CLIPSET.
function Global.RequestAnimSet(animSet)
	return _in(0x6EA47DAE7FAD0EED, _ts(animSet))
end

function Global.RequestClipSet(clipSet)
	return _in(0xD2A71E1A77418A49, _ts(clipSet))
end

function Global.RequestCollisionAtCoord(x, y, z)
	return _in(0x07503F7948F491A7, x, y, z, _r, _ri)
end

function Global.RequestCollisionForModel(model)
	return _in(0x923CB32A3B874FCB, _ch(model))
end

--- p1: usually 8
function Global.RequestCutscene(cutsceneName, p1)
	return _in(0x7A86743F475D9E09, _ts(cutsceneName), p1)
end

--- Example:
-- CUTSCENE::_0xC23DE0E91C30B58C("JOSH_1_INT_CONCAT", 13, 8);
function Global.RequestCutsceneEx(cutsceneName, p1, p2)
	return _in(0xC23DE0E91C30B58C, _ts(cutsceneName), p1, p2)
end
Global.N_0xc23de0e91c30b58c = Global.RequestCutsceneEx

--- http://gtaforums.com/topic/717612-v-scriptnative-documentation-and-research/?p=1068285912
function Global.RequestHudScaleform(hudComponent)
	return _in(0x9304881D6F6537EA, hudComponent)
end
Global.N_0x9304881d6f6537ea = Global.RequestHudScaleform

--- Exemple: REQUEST_IPL("TrevorsTrailerTrash");
-- IPL + Coords: http://pastebin.com/FyV5mMma
function Global.RequestIpl(iplName)
	return _in(0x41B4893843BBDB74, _ts(iplName))
end

function Global.RequestMenuPedModel(model)
	return _in(0xA0261AEF7ACFC51E, _ch(model))
end
Global.N_0xa0261aef7acfc51e = Global.RequestMenuPedModel

--- All occurrences and usages found in b617d: pastebin.com/NzZZ2Tmm
function Global.RequestMissionAudioBank(p0, p1)
	return _in(0x7345BDD95E62E0F2, _ts(p0), p1, _r)
end

--- Request a model to be loaded into memory
-- Looking it the disassembly, it seems like it actually returns the model if it's already loaded.
function Global.RequestModel(model)
	return _in(0x963D27A58DF860AC, _ch(model))
end

--- From the b678d decompiled scripts:
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("core_snow");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("fm_mission_controler");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("proj_xmas_firework");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_apartment_mp");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_biolab_heist");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_indep_fireworks");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_indep_parachute");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_indep_wheelsmoke");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_mp_cig_plane");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_mp_creator");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_mp_tankbattle");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_ornate_heist");
-- STREAMING::REQUEST_NAMED_PTFX_ASSET("scr_prison_break_heist_station");
function Global.RequestNamedPtfxAsset(fxName)
	return _in(0xB80D8756B4668AB6, _ts(fxName))
end

--- maps script name (thread + 0xD0) by lookup via scriptfx.dat - does nothing when script name is empty
function Global.RequestPtfxAsset()
	return _in(0x944955FB2A3935C8, _r, _ri)
end

--- Gets a new native after almost every update.
-- Update 1.0.393.2
-- 0x67D02A194A2FC2BD
-- Update 1.0.463.1
-- 0xC97D787CE7726A2F
-- Update 1.0.505.2
-- 0x36ECDA4DD9A3F08D
-- Update 1.0.573.1
-- 0xE3C796DC28BC3254
-- Update 1.0.678.1
-- 0x2F14983962462691
function Global.RequestScaleformMovie(scaleformName)
	return _in(0x11FE353CF9733E6F, _ts(scaleformName), _r, _ri)
end

--- Also used by 0x67D02A194A2FC2BD
function Global.RequestScaleformMovieInstance(scaleformName)
	return _in(0xC514489CFB8AF806, _ts(scaleformName), _r, _ri)
end

--- Similar to REQUEST_SCALEFORM_MOVIE, but seems to be some kind of "interactive" scaleform movie?
-- These seem to be the only scaleforms ever requested by this native:
-- "breaking_news"
-- "desktop_pc"
-- "ECG_MONITOR"
-- "Hacking_PC"
-- "TEETH_PULLING"
-- Note: Unless this hash is out-of-order, this native is next-gen only.
function Global.RequestScaleformMovieInteractive(scaleformName)
	return _in(0xBD06C611BB9048C2, _ts(scaleformName), _r, _ri)
end
Global.RequestScaleformMovie3 = Global.RequestScaleformMovieInteractive

--- For a full list, see here: pastebin.com/yLNWicUi
function Global.RequestScript(scriptName)
	return _in(0x6EB5F71AA68F2E8E, _ts(scriptName))
end

--- All occurrences and usages found in b617d, sorted alphabetically and identical lines removed: pastebin.com/AkmDAVn6
function Global.RequestScriptAudioBank(p0, p1)
	return _in(0x2F844A8B08D76685, _ts(p0), p1, _r)
end

--- formerly _REQUEST_STREAMED_SCRIPT
function Global.RequestScriptWithNameHash(scriptHash)
	return _in(0xD62A67D26D9653E6, _ch(scriptHash))
end
Global.RequestStreamedScript = Global.RequestScriptWithNameHash

function Global.RequestStealthModeAsset(asset)
	return _in(0x2A0A62FCDEE16D4F, _ts(asset))
end

--- last param isnt a toggle
function Global.RequestStreamedTextureDict(textureDict, p1)
	return _in(0xDFA2EF8E04127DD5, _ts(textureDict), p1)
end

--- REQUEST_VEHICLE_ASSET(GET_HASH_KEY(cargobob3), 3);
-- vehicle found that have asset's:
-- cargobob3
-- submersible
-- blazer
function Global.RequestVehicleAsset(vehicleHash, vehicleAsset)
	return _in(0x81A15811460FAB3A, _ch(vehicleHash), vehicleAsset)
end

function Global.RequestVehicleHighDetailModel(vehicle)
	return _in(0xA6E9FDCB2C76785E, vehicle)
end

function Global.RequestVehicleRecording(p0, p1)
	return _in(0xAF514CABE74CBF15, p0, _ii(p1) --[[ may be optional ]])
end

--- For a full list, see here: pastebin.com/Tp0XpBMN
-- For a full list of the points, see here: goo.gl/wIH0vn
-- Max number of loaded recordings is 32.
function Global.RequestWaypointRecording(name)
	return _in(0x9EEFB62EB27B5792, _ts(name))
end

--- Nearly every instance of p1 I found was 31. Nearly every instance of p2 I found was 0.
-- REQUEST_WEAPON_ASSET(iLocal_1888, 31, 26);
function Global.RequestWeaponAsset(weaponHash, p1, p2)
	return _in(0x5443438F033E29C3, _ch(weaponHash), p1, p2)
end

function Global.RequestWeaponHighDetailModel(weaponObject)
	return _in(0x48164DBB970AC3F0, weaponObject)
end

function Global.ReserveNetworkMissionObjects(p0)
	return _in(0x4E5C93BD0C32FBF8, p0)
end

function Global.ReserveNetworkMissionPeds(p0)
	return _in(0xB60FEBA45333D36F, p0)
end

function Global.ReserveNetworkMissionVehicles(p0)
	return _in(0x76B02E21ED27A469, p0)
end

function Global.ResetAiMeleeWeaponDamageModifier()
	return _in(0x46E56A7CD1D63C3F)
end

function Global.ResetAiWeaponDamageModifier()
	return _in(0xEA16670E7BA4743C)
end

function Global.ResetDispatchIdealSpawnDistance()
	return _in(0x77A84429DD9F0A15)
end

function Global.ResetDispatchSpawnBlockingAreas()
	return _in(0xAC7BFD5C1D83EA75)
end

--- Sets (almost, not sure) all Rockstar Editor values (bIsRecording etc) to 0.
function Global.ResetEditorValues()
	return _in(0x3353D13F09307691)
end
Global.N_0x3353d13f09307691 = Global.ResetEditorValues

function Global.ResetEntityAlpha(entity)
	return _in(0x9B1E824FFBB7027A, entity, _r, _ri)
end

function Global.ResetExclusiveScenarioGroup()
	return _in(0x4202BBCB8684563D)
end

function Global.ResetGroupFormationDefaultSpacing(groupHandle)
	return _in(0x63DAB4CCB3273205, groupHandle)
end

function Global.ResetHudComponentValues(id)
	return _in(0x450930E616475D0D, id)
end

--- Sets the localplayer playerinfo state back to playing (State 0)
-- States are:
-- -1: "Invalid"
-- 0: "Playing"
-- 1: "Died"
-- 2: "Arrested"
-- 3: "Failed Mission"
-- 4: "Left Game"
-- 5: "Respawn"
-- 6: "In MP Cutscene"
function Global.ResetLocalplayerState()
	return _in(0xC0AA53F866B3134D)
end

--- console hash: 0x9E8D8B72
-- Resets the effect of _SET_PARTICLE_FX_ASSET_OLD_TO_NEW
function Global.ResetParticleFxAssetOldToNew(name)
	return _in(0x89C8553DD3274AAE, _ts(name))
end
Global.N_0x89c8553dd3274aae = Global.ResetParticleFxAssetOldToNew

function Global.ResetPedAudioFlags(p0)
	return _in(0xF54BB7B61036F335, p0)
end

function Global.ResetPedInVehicleContext(ped)
	return _in(0x22EF8FF8778030EB, ped)
end

--- Resets the value for the last vehicle driven by the Ped.
function Global.ResetPedLastVehicle(ped)
	return _in(0xBB8DE8CF6A8DD8BB, ped)
end

--- If p1 is 0.0, I believe you are back to normal.
-- If p1 is 1.0, it looks like you can only rotate the ped, not walk.
-- Using the following code to reset back to normal
-- PED::RESET_PED_MOVEMENT_CLIPSET(PLAYER::PLAYER_PED_ID(), 0.0);
function Global.ResetPedMovementClipset(ped, p1)
	return _in(0xAA74EC0CB0AAEA2C, ped, p1)
end

--- There seem to be 26 flags
function Global.ResetPedRagdollBlockingFlags(ped, flags)
	return _in(0xD86D101FCFD00A4B, ped, flags)
end
Global.N_0xd86d101fcfd00a4b = Global.ResetPedRagdollBlockingFlags

function Global.ResetPedRagdollTimer(ped)
	return _in(0x9FA4664CF62E47E8, ped)
end

function Global.ResetPedStrafeClipset(ped)
	return _in(0x20510814175EA477, ped)
end

function Global.ResetPedVisibleDamage(ped)
	return _in(0x3AC1F7B898F30C05, ped, _r, _ri)
end

function Global.ResetPedWeaponMovementClipset(ped)
	return _in(0x97B0DB5B4AA74E77, ped)
end

function Global.ResetPlayerArrestState(player)
	return _in(0x2D03E13C460760D6, player)
end

function Global.ResetPlayerInputGait(player)
	return _in(0x19531C47A2ABD691, player)
end

function Global.ResetPlayerStamina(player)
	return _in(0xA6F312FCCE9C1DFE, player)
end

function Global.ResetReticuleValues()
	return _in(0x12782CE0A636E9F0)
end

function Global.ResetScenarioGroupsEnabled()
	return _in(0xDD902D0349AFAD3A)
end

function Global.ResetScenarioTypesEnabled()
	return _in(0x0D40EE2A7F2B2D6D)
end

function Global.ResetTrevorRage()
	return _in(0xE78503B10C4314E0)
end

--- The inner function has a switch on the second parameter. It's the stuck timer index.
-- Here's some pseudo code I wrote for the inner function:
-- void __fastcall NATIVE_RESET_VEHICLE_STUCK_TIMER_INNER(CUnknown* unknownClassInVehicle, int timerIndex)
-- {
-- switch (timerIndex)
-- {
-- case 0:
-- unknownClassInVehicle-&gt;FirstStuckTimer = (WORD)0u;
-- case 1:
-- unknownClassInVehicle-&gt;SecondStuckTimer = (WORD)0u;
-- case 2:
-- unknownClassInVehicle-&gt;ThirdStuckTimer = (WORD)0u;
-- case 3:
-- unknownClassInVehicle-&gt;FourthStuckTimer = (WORD)0u;
-- case 4:
-- unknownClassInVehicle-&gt;FirstStuckTimer = (WORD)0u;
-- unknownClassInVehicle-&gt;SecondStuckTimer = (WORD)0u;
-- unknownClassInVehicle-&gt;ThirdStuckTimer = (WORD)0u;
-- unknownClassInVehicle-&gt;FourthStuckTimer = (WORD)0u;
-- break;
-- };
-- }
function Global.ResetVehicleStuckTimer(vehicle, nullAttributes)
	return _in(0xD7591B0065AFAA7A, vehicle, nullAttributes)
end

function Global.ResetVehicleWheels(vehicle, toggle)
	return _in(0x21D2E5662C1F6FED, vehicle, toggle)
end

function Global.ResetWantedLevelDifficulty(player)
	return _in(0xB9D0DD990DC141DD, player)
end

--- Sets the waves intensity back to original (1.0 in most cases).
-- console hash: 0x4AD23212
-- Most likely RESET_CURRENT_*
function Global.ResetWavesIntensity()
	return _in(0x5E5E99285AE812DB)
end
Global.N_0x5e5e99285ae812db = Global.ResetWavesIntensity

--- Please change back to _0xBD12C5EEE184C33 (hash collision)
-- actual native starts with SET_RADAR_ZOOM_...
function Global.RespondingAsTemp(p0)
	return _in(0xBD12C5EEE184C337, p0)
end

--- Before using this native click the native above and look at the decription.
-- Example:
-- int GetHash = Function.Call&lt;int&gt;(Hash.GET_HASH_KEY, "fe_menu_version_corona_lobby");
-- Function.Call(Hash.ACTIVATE_FRONTEND_MENU, GetHash, 0, -1);
-- Function.Call(Hash.RESTART_FRONTEND_MENU(GetHash, -1);
-- This native refreshes the frontend menu.
-- p1 = Hash of Menu
-- p2 = Unknown but always works with -1.
function Global.RestartFrontendMenu(menuHash, p1)
	return _in(0x10706DC6AD2D49C0, _ch(menuHash), p1)
end

function Global.RestartScriptedConversation()
	return _in(0x9AEB285D1818C9AC)
end

function Global.RestorePlayerStamina(player, p1)
	return _in(0xA352C1B864CAFD33, player, p1)
end

--- This function will simply bring the dead person back to life.
-- Try not to use it alone, since using this function alone, will make peds fall through ground in hell(well for the most of the times).
-- Instead, before calling this function, you may want to declare the position, where your Resurrected ped to be spawn at.(For instance, Around 2 floats of Player's current position.)
-- Also, disabling any assigned task immediately helped in the number of scenarios, where If you want peds to perform certain decided tasks.
function Global.ResurrectPed(ped)
	return _in(0x71BC8E838B9C6035, ped)
end

--- It returns two lol
-- li r3, 2
-- blr
-- thats all it does.
-- mov dword ptr [rax], 2
function Global.ReturnTwo(p0)
	return _in(0x40AFB081F8ADD4EE, p0, _r, _ri)
end
Global.N_0x40afb081f8add4ee = Global.ReturnTwo

--- It will revive/cure the injured ped. The condition is ped must not be dead.
-- Upon setting and converting the health int, found, if health falls below 5, the ped will lay on the ground in pain(Maximum default health is 100).
-- This function is well suited there.
function Global.ReviveInjuredPed(ped)
	return _in(0x8D8ACD8388CD99CE, ped)
end

--- windowIndex:
-- 0 = Front Right Window
-- 1 = Front Left Window
-- 2 = Back Right Window
-- 3 = Back Left Window
function Global.RollDownWindow(vehicle, windowIndex)
	return _in(0x7AD9E6CE657D69E3, vehicle, windowIndex, _r, _ri)
end

--- Roll down all the windows of the vehicle passed through the first parameter.
function Global.RollDownWindows(vehicle)
	return _in(0x85796B0549DDE156, vehicle)
end

--- 0 = Front Right Window
-- 1 = Front Left Window
-- 2 = Back Right Window
-- 3 = Back Left Window
function Global.RollUpWindow(vehicle, windowIndex)
	return _in(0x602E548F46E24D59, vehicle, windowIndex, _r, _ri)
end

function Global.RopeAreTexturesLoaded()
	return _in(0xF2D0E6A75CC05597, _r)
end

function Global.RopeConvertToSimple(rope)
	return _in(0x5389D48EFA2F079A, rope)
end

function Global.RopeDrawShadowEnabled(toggle)
	return _in(0xF159A63806BB5BA8, _i, toggle)
end

--- Forces a rope to a certain length.
function Global.RopeForceLength(rope, length)
	return _in(0xD009F759A723DB1B, rope, length, _r, _ri)
end

--- Loads rope textures for all ropes in the current scene.
function Global.RopeLoadTextures()
	return _in(0x9B9039DBF2D258C1, _r, _ri)
end

--- Reset a rope to a certain length.
function Global.RopeResetLength(rope, length)
	return _in(0xC16DE94D9BEA14A0, rope, length, _r, _ri)
end

function Global.RopeSetUpdatePinverts(rope)
	return _in(0xC8D667EE52114ABA, rope)
end

--- Unloads rope textures for all ropes in the current scene.
function Global.RopeUnloadTextures()
	return _in(0x6CE36C35C1AC8163, _r, _ri)
end

function Global.Round(value)
	return _in(0xF2DB717A73826179, value, _r, _ri)
end

function Global.ScEmailMessageClearRecipList()
	return _in(0x55DF6DB45179236E)
end
Global.N_0x55df6db45179236e = Global.ScEmailMessageClearRecipList

function Global.ScEmailMessagePushGamerToRecipList(player)
	return _in(0x2330C12A7A605D16, _ii(player) --[[ may be optional ]])
end

--- Returns the status of a _SC_START_CHECK_STRING_TASK task.
-- Possible return values:
-- 0: not a profane string
-- 1: a profane string
-- 3: server error occurred
function Global.ScGetCheckStringStatus(taskHandle)
	return _in(0x82E4A58BABC15AE7, taskHandle, _r, _ri)
end
Global.N_0x82e4a58babc15ae7 = Global.ScGetCheckStringStatus

--- Returns the nickname of the logged-in Rockstar Social Club account.
function Global.ScGetNickname()
	return _in(0x198D161F458ECC7F, _r, _s)
end

--- Returns whether or not a task started with _SC_START_CHECK_STRING_TASK has completed.
function Global.ScHasCheckStringTaskCompleted(taskHandle)
	return _in(0x1753344C770358AE, taskHandle, _r)
end
Global.N_0x1753344c770358ae = Global.ScHasCheckStringTaskCompleted

function Global.ScInboxGetEmails(offset, limit)
	return _in(0x040ADDCBAFA1018A, offset, limit)
end
Global.N_0x040addcbafa1018a = Global.ScInboxGetEmails

function Global.ScInboxMessageGetDataBool(p0, p1)
	return _in(0xFFE5C16F402D851D, p0, _ts(p1), _r)
end
Global.N_0xffe5c16f402d851d = Global.ScInboxMessageGetDataBool

function Global.ScInboxMessageGetDataInt(p0, context, out)
	return _in(0xA00EFE4082C4056E, p0, _ts(context), _ii(out) --[[ may be optional ]], _r)
end

function Global.ScInboxMessageGetDataString(p0, context, out)
	return _in(0x7572EF42FC6A9B6D, p0, _ts(context), _ts(out), _r)
end

function Global.ScInboxMessageGetString(p0)
	return _in(0xF3E31D16CBDCB304, p0, _r, _s)
end
Global.N_0xf3e31d16cbdcb304 = Global.ScInboxMessageGetString

function Global.ScInboxMessageGetUgcdata(p0, p1)
	return _in(0x69D82604A1A5A254, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.ScInboxMessageInit(p0)
	return _in(0xBB8EA16ECBC976C4, p0, _r, _ri)
end
Global.N_0xbb8ea16ecbc976c4 = Global.ScInboxMessageInit

function Global.ScInboxMessagePop(p0)
	return _in(0x2C015348CF19CA1D, p0, _r)
end
Global.N_0x2c015348cf19ca1d = Global.ScInboxMessagePop

function Global.ScInboxMessagePush(p0)
	return _in(0x9A2C8064B6C1E41A, p0, _r)
end
Global.N_0x9a2c8064b6c1e41a = Global.ScInboxMessagePush

--- Starts a task to check an entered string for profanity on the ROS/Social Club services.
-- See also: 1753344C770358AE, 82E4A58BABC15AE7.
function Global.ScStartCheckStringTask(string, taskHandle)
	return _in(0x75632C5ECD7ED843, _ts(string), _ii(taskHandle) --[[ may be optional ]], _r)
end
Global.N_0x75632c5ecd7ed843 = Global.ScStartCheckStringTask

--- Seems to move all the drawn text on the screen to given coordinates.
-- It also removed all the drawn sprites of my screen so not to sure what the exact function is.
function Global.ScreenDrawPositionBegin(x, y)
	return _in(0xB8A850F20A067EB6, x, y)
end
Global.SetScreenDrawPosition = Global.ScreenDrawPositionBegin

function Global.ScreenDrawPositionEnd()
	return _in(0xE3A3DB414A373DAB)
end
Global.N_0xe3a3db414a373dab = Global.ScreenDrawPositionEnd

function Global.ScreenDrawPositionRatio(x, y, p2, p3)
	return _in(0xF5A2C681787E579D, x, y, p2, p3)
end
Global.N_0xf5a2c681787e579d = Global.ScreenDrawPositionRatio

--- If bool Toggle = true so the mobile is hide to screen.
-- If bool Toggle = false so the mobile is show to screen.
function Global.ScriptIsMovingMobilePhoneOffscreen(toggle)
	return _in(0xF511F759238A5122, toggle)
end

function Global.SendNuiMessage(jsonString)
	return _in(0x78608acb, _ts(jsonString), _r)
end

function Global.SetAbilityBarValue(p0, p1)
	return _in(0x9969599CCFF5D85E, p0, p1)
end

function Global.SetActivateObjectPhysicsAsSoonAsItIsUnfrozen(object, toggle)
	return _in(0x406137F8EF90EAF5, object, toggle)
end

--- Makes pedestrians sound their horn longer, faster and more agressive when they use their horn.
function Global.SetAggressiveHorns(toggle)
	return _in(0x395BF71085D1B1D9, toggle)
end

--- Previously named _0x97C65887D4B37FA9.
-- Sets the maximum view distance for the AI BIP
function Global.SetAiBlipMaxDistance(ped, distance)
	return _in(0x97C65887D4B37FA9, ped, distance)
end
Global.N_0x97c65887d4b37fa9 = Global.SetAiBlipMaxDistance

function Global.SetAiMeleeWeaponDamageModifier(modifier)
	return _in(0x66460DEDDD417254, modifier)
end

function Global.SetAiWeaponDamageModifier(value)
	return _in(0x1B1E2A40A65B8521, value)
end

--- This can be between 1.0f - 14.9f
-- You can change the max in IDA from 15.0. I say 15.0 as the function blrs if what you input is greater than or equal to 15.0 hence why it's 14.9 max default.
function Global.SetAirDragMultiplierForPlayersVehicle(player, multiplier)
	return _in(0xCA7DC8329F0A1E9E, player, multiplier)
end

function Global.SetAllLowPriorityVehicleGeneratorsActive(active)
	return _in(0x608207E7A8FB787C, active)
end

function Global.SetAllRandomPedsFlee(player, toggle)
	return _in(0x056E0FE8534C2949, player, toggle)
end

function Global.SetAllRandomPedsFleeThisFrame(player)
	return _in(0x471D2FF42A94B4F2, player)
end

function Global.SetAllVehicleGeneratorsActive()
	return _in(0x34AD89078831A4BC)
end

function Global.SetAllVehicleGeneratorsActiveInArea(x1, y1, z1, x2, y2, z2, p6, p7)
	return _in(0xC12321827687FE4D, x1, y1, z1, x2, y2, z2, p6, p7)
end

--- Most likely a hash collision
function Global.SetAllVehiclesSpawn(p0, p1, p2, p3)
	return _in(0xE023E8AC4EF7C117, p0, p1, p2, p3, _r, _ri)
end

--- Audio List
-- gtaforums.com/topic/795622-audio-for-mods/
-- All found occurrences in b617d, sorted alphabetically and identical lines removed: pastebin.com/FTeAj4yZ
-- Yes
function Global.SetAmbientVoiceName(ped, name)
	return _in(0x6C8065A3B780185B, ped, _ts(name))
end

function Global.SetAmbientZoneListState(p1, p2)
	return _in(0x9748FA4DE50CCE3E, _i, p1, p2)
end

--- All occurrences found in b617d, sorted alphabetically and identical lines removed: pastebin.com/WkXDGgQL
function Global.SetAmbientZoneListStatePersistent(ambientZone, p1, p2)
	return _in(0xF3638DAE8C4045E1, _ts(ambientZone), p1, p2)
end

function Global.SetAmbientZoneState(p1, p2)
	return _in(0xBDA07E5950085E46, _i, p1, p2)
end

--- All occurrences found in b617d, sorted alphabetically and identical lines removed: pastebin.com/jYvw7N1S
function Global.SetAmbientZoneStatePersistent(ambientZone, p1, p2)
	return _in(0x1D6650420CEC9D3B, _ts(ambientZone), p1, p2)
end

function Global.SetAmmoInClip(ped, weaponHash, ammo)
	return _in(0xDCD2A934D65CB497, ped, _ch(weaponHash), ammo, _r)
end

function Global.SetAnimLooped(p0, p1, p2, p3)
	return _in(0x70033C3CC29A1FF4, p0, p1, p2, p3)
end

function Global.SetAnimRate(p0, p1, p2, p3)
	return _in(0x032D49C5E359C847, p0, p1, p2, p3)
end

function Global.SetAnimWeight(p0, p1, p2, p3, p4)
	return _in(0x207F1A47C0342F48, p0, p1, p2, p3, p4)
end

--- mood can be 0 or 1 (it's not a boolean value!). Effects audio of the animal.
function Global.SetAnimalMood(animal, mood)
	return _in(0xCC97B29285B1DC3B, animal, mood)
end

--- Possible flag names:
-- "ActivateSwitchWheelAudio"
-- "AllowAmbientSpeechInSlowMo"
-- "AllowCutsceneOverScreenFade"
-- "AllowForceRadioAfterRetune"
-- "AllowPainAndAmbientSpeechToPlayDuringCutscene"
-- "AllowPlayerAIOnMission"
-- "AllowPoliceScannerWhenPlayerHasNoControl"
-- "AllowRadioDuringSwitch"
-- "AllowRadioOverScreenFade"
-- "AllowScoreAndRadio"
-- "AllowScriptedSpeechInSlowMo"
-- "AvoidMissionCompleteDelay"
-- "DisableAbortConversationForDeathAndInjury"
-- "DisableAbortConversationForRagdoll"
-- "DisableBarks"
-- "DisableFlightMusic"
-- "DisableReplayScriptStreamRecording"
-- "EnableHeadsetBeep"
-- "ForceConversationInterrupt"
-- "ForceSeamlessRadioSwitch"
-- "ForceSniperAudio"
-- "FrontendRadioDisabled"
-- "HoldMissionCompleteWhenPrepared"
-- "IsDirectorModeActive"
-- "IsPlayerOnMissionForSpeech"
-- "ListenerReverbDisabled"
-- "LoadMPData"
-- "MobileRadioInGame"
-- "OnlyAllowScriptTriggerPoliceScanner"
-- "PlayMenuMusic"
-- "PoliceScannerDisabled"
-- "ScriptedConvListenerMaySpeak"
-- "SpeechDucksScore"
-- "SuppressPlayerScubaBreathing"
-- "WantedMusicDisabled"
-- "WantedMusicOnMission"
-- -------------------------------
-- No added flag names between b393d and b573d, including b573d.
-- #######################################################################
-- "IsDirectorModeActive" is an audio flag which will allow you to play speech infinitely without any pauses like in Director Mode.
-- -----------------------------------------------------------------------
-- All flag IDs and hashes:
-- ID: 01 | Hash: 0x20A7858F
-- ID: 02 | Hash: 0xA11C2259
-- ID: 03 | Hash: 0x08DE4700
-- ID: 04 | Hash: 0x989F652F
-- ID: 05 | Hash: 0x3C9E76BA
-- ID: 06 | Hash: 0xA805FEB0
-- ID: 07 | Hash: 0x4B94EA26
-- ID: 08 | Hash: 0x803ACD34
-- ID: 09 | Hash: 0x7C741226
-- ID: 10 | Hash: 0x31DB9EBD
-- ID: 11 | Hash: 0xDF386F18
-- ID: 12 | Hash: 0x669CED42
-- ID: 13 | Hash: 0x51F22743
-- ID: 14 | Hash: 0x2052B35C
-- ID: 15 | Hash: 0x071472DC
-- ID: 16 | Hash: 0xF9928BCC
-- ID: 17 | Hash: 0x7ADBDD48
-- ID: 18 | Hash: 0xA959BA1A
-- ID: 19 | Hash: 0xBBE89B60
-- ID: 20 | Hash: 0x87A08871
-- ID: 21 | Hash: 0xED1057CE
-- ID: 22 | Hash: 0x1584AD7A
-- ID: 23 | Hash: 0x8582CFCB
-- ID: 24 | Hash: 0x7E5E2FB0
-- ID: 25 | Hash: 0xAE4F72DB
-- ID: 26 | Hash: 0x5D16D1FA
-- ID: 27 | Hash: 0x06B2F4B8
-- ID: 28 | Hash: 0x5D4CDC96
-- ID: 29 | Hash: 0x8B5A48BA
-- ID: 30 | Hash: 0x98FBD539
-- ID: 31 | Hash: 0xD8CB0473
-- ID: 32 | Hash: 0x5CBB4874
-- ID: 33 | Hash: 0x2E9F93A9
-- ID: 34 | Hash: 0xD93BEA86
-- ID: 35 | Hash: 0x92109B7D
-- ID: 36 | Hash: 0xB7EC9E4D
-- ID: 37 | Hash: 0xCABDBB1D
-- ID: 38 | Hash: 0xB3FD4A52
-- ID: 39 | Hash: 0x370D94E5
-- ID: 40 | Hash: 0xA0F7938F
-- ID: 41 | Hash: 0xCBE1CE81
-- ID: 42 | Hash: 0xC27F1271
-- ID: 43 | Hash: 0x9E3258EB
-- ID: 44 | Hash: 0x551CDA5B
-- ID: 45 | Hash: 0xCB6D663C
-- ID: 46 | Hash: 0x7DACE87F
-- ID: 47 | Hash: 0xF9DE416F
-- ID: 48 | Hash: 0x882E6E9E
-- ID: 49 | Hash: 0x16B447E7
-- ID: 50 | Hash: 0xBD867739
-- ID: 51 | Hash: 0xA3A58604
-- ID: 52 | Hash: 0x7E046BBC
-- ID: 53 | Hash: 0xD95FDB98
-- ID: 54 | Hash: 0x5842C0ED
-- ID: 55 | Hash: 0x285FECC6
-- ID: 56 | Hash: 0x9351AC43
-- ID: 57 | Hash: 0x50032E75
-- ID: 58 | Hash: 0xAE6D0D59
-- ID: 59 | Hash: 0xD6351785
-- ID: 60 | Hash: 0xD25D71BC
-- ID: 61 | Hash: 0x1F7F6423
-- ID: 62 | Hash: 0xE24C3AA6
-- ID: 63 | Hash: 0xBFFDD2B7
function Global.SetAudioFlag(flagName, toggle)
	return _in(0xB9EFD5C25018725A, _ts(flagName), toggle)
end

function Global.SetAudioSceneVariable(scene, variable, value)
	return _in(0xEF21A9EF089A2668, _ts(scene), _ts(variable), value)
end

function Global.SetAudioVehiclePriority(vehicle, p1)
	return _in(0xE5564483E407F914, vehicle, p1)
end

function Global.SetAutoGiveParachuteWhenEnterPlane(player, toggle)
	return _in(0x9F343285A00B4BB6, player, toggle)
end

function Global.SetBalanceAddMachine()
	return _in(0x815E5E3073DA1D67, _i, _i, _r)
end

function Global.SetBalanceAddMachines(p1)
	return _in(0xB8322EEB38BE7C26, _i, p1, _i, _r)
end

--- Only works on bikes, both X and Y work in the -1 - 1 range.
-- X forces the bike to turn left or right (-1, 1)
-- Y forces the bike to lean to the left or to the right (-1, 1)
-- Example with X -1/Y 1
-- http://i.imgur.com/TgIuAPJ.jpg
function Global.SetBikeLeanAngle(vehicle, x, y)
	return _in(0x9CFA4896C3A53CBB, vehicle, x, y)
end

--- This sets bit [offset] of [address] to on.
-- The offsets used are different bits to be toggled on and off, typically there is only one address used in a script.
-- Example:
-- GAMEPLAY::SET_BIT(&amp;bitAddress, 1);
-- To check if this bit has been enabled:
-- GAMEPLAY::IS_BIT_SET(bitAddress, 1); // will return 1 afterwards
-- Please note, this method may assign a value to [address] when used.
function Global.SetBit(offset)
	return _in(0x933D6A9EEC1BACD0, _i, offset)
end

function Global.SetBitsInRange(rangeStart, rangeEnd, p3)
	return _in(0x8EF07E15701D61ED, _i, rangeStart, rangeEnd, p3)
end

--- Disables all emissive textures and lights like city lights, car lights, cop car lights. Particles still emit light
-- Used in Humane Labs Heist for EMP.
function Global.SetBlackout(enable)
	return _in(0x1268615ACE24D504, enable)
end

--- Sets alpha-channel for blip color.
-- Example:
-- Blip blip = UI::ADD_BLIP_FOR_ENTITY(entity);
-- UI::SET_BLIP_COLOUR(blip , 3);
-- UI::SET_BLIP_ALPHA(blip , 64);
function Global.SetBlipAlpha(blip, alpha)
	return _in(0x45FF974EEE1C8734, blip, alpha)
end

--- false for enemy
-- true for friendly
function Global.SetBlipAsFriendly(blip, toggle)
	return _in(0x6F6F290102C02AB4, blip, toggle)
end

function Global.SetBlipAsMissionCreatorBlip(blip, toggle)
	return _in(0x24AC0137444F9FD5, blip, toggle)
end

function Global.SetBlipAsShortRange(blip, toggle)
	return _in(0xBE8BE4FE60E27B72, blip, toggle)
end

function Global.SetBlipBright(blip, toggle)
	return _in(0xB203913733F27884, blip, toggle)
end

--- int index:
-- 1 = No Text on blip or Distance
-- 2 = Text on blip
-- 3 = No text, just distance
-- 4+ No Text on blip or distance
function Global.SetBlipCategory(blip, index)
	return _in(0x234CDD44D996FD9A, blip, index)
end

--- Adds a green checkmark on top of a blip.
function Global.SetBlipChecked(blip, toggle)
	return _in(0x74513EA3E505181E, blip, toggle)
end
Global.N_0x74513ea3e505181e = Global.SetBlipChecked

--- Color:
-- 0: white
-- 1: red
-- 2: green
-- 3: blue
-- 17: orange
-- 19: purple
-- 20: grey
-- 21: brown
-- 23: pink
-- 25: dark green
-- 27: dark purple
-- 29: dark blue
-- Default (Function not used): yellow
-- Those are not the only ones. i.e: 17 is Trevor's orange.
function Global.SetBlipColour(blip, color)
	return _in(0x03D7FB09E75D6B7E, blip, color)
end

function Global.SetBlipCoords(blip, posX, posY, posZ)
	return _in(0xAE2AF67E9D9AF65D, blip, posX, posY, posZ)
end

--- displayId = 8 : shows on radar
-- displayId:
-- 3 = Shows on Main map but not Radar (not selectable on map)
-- displayId = 2 (Shows on Main map + Radar + selectable)
function Global.SetBlipDisplay(blip, displayId)
	return _in(0x9029B2F3DA924928, blip, displayId)
end

function Global.SetBlipFade(blip, opacity, duration)
	return _in(0x2AEE8F8390D2298C, blip, opacity, duration)
end

function Global.SetBlipFlashInterval(blip, p1)
	return _in(0xAA51DB313C010A7E, blip, p1)
end

--- Adds up after viewing multiple R* scripts. I believe that the duration is in miliseconds.
function Global.SetBlipFlashTimer(blip, duration)
	return _in(0xD3CD6FD297AE87CC, blip, duration)
end

function Global.SetBlipFlashes(blip, toggle)
	return _in(0xB14552383D39CE3E, blip, toggle)
end

function Global.SetBlipFlashesAlternate(blip, toggle)
	return _in(0x2E8D9498C56DD0D1, blip, toggle)
end

--- Highlights a blip by a half cyan circle.
function Global.SetBlipFriend(blip, toggle)
	return _in(0x23C3EB807312F01A, blip, toggle)
end
Global.N_0x23c3eb807312f01a = Global.SetBlipFriend

--- Highlights a blip by a cyan color circle.
-- Color can be changed with SET_BLIP_SECONDARY_COLOUR
function Global.SetBlipFriendly(blip, toggle)
	return _in(0xB81656BC81FE24D1, blip, toggle)
end
Global.N_0xb81656bc81fe24d1 = Global.SetBlipFriendly

function Global.SetBlipHighDetail(blip, toggle)
	return _in(0xE2590BC29220CEBB, blip, toggle)
end

--- Doesn't work if the label text of gxtEntry is &gt;= 80.
function Global.SetBlipNameFromTextFile(blip, gxtEntry)
	return _in(0xEAA0FFE120D92784, blip, _ts(gxtEntry))
end

function Global.SetBlipNameToPlayerName(blip, player)
	return _in(0x127DE7B20C60A6A3, blip, player)
end

--- See this topic for more details : gtaforums.com/topic/717612-v-scriptnative-documentation-and-research/page-35?p=1069477935
function Global.SetBlipPriority(blip, priority)
	return _in(0xAE9FC9EF6A9FAC79, blip, priority)
end

--- After some testing, looks like you need to use UI:CEIL() on the rotation (vehicle/ped heading) before using it there.
function Global.SetBlipRotation(blip, rotation)
	return _in(0xF87683CDF73C3F6E, blip, rotation)
end

--- Enable / disable showing route for the Blip-object.
function Global.SetBlipRoute(blip, enabled)
	return _in(0x4F7D8A9BFB0B43E9, blip, enabled)
end

function Global.SetBlipRouteColour(blip, colour)
	return _in(0x837155CD2F63DA09, blip, colour)
end

function Global.SetBlipScale(blip, scale)
	return _in(0xD38744167B2FA257, blip, scale)
end

function Global.SetBlipSecondaryColour(blip, r, g, b)
	return _in(0x14892474891E09EB, blip, r, g, b)
end

function Global.SetBlipShowCone(blip, toggle)
	return _in(0x13127EC3665E8EE1, blip, toggle)
end

--- Makes a blip go small when off the minimap.
function Global.SetBlipShrink(blip, toggle)
	return _in(0x2B6D467DAB714E8D, blip, toggle)
end
Global.N_0x2b6d467dab714e8d = Global.SetBlipShrink

--- Takes a blip object and adds a sprite to it on the map.
-- You may have your own list, but since dev-c didn't show it I was bored and started looking through scripts and functions to get a presumable almost positive list of a majority of blip IDs
-- h t t p://pastebin.com/Bpj9Sfft
-- Blips Images + IDs:
-- gtaxscripting.blogspot.com/2016/05/gta-v-blips-id-and-image.html
function Global.SetBlipSprite(blip, spriteId)
	return _in(0xDF735600A4696DAF, blip, spriteId)
end

--- works with AI::TASK_SET_BLOCKING_OF_NON_TEMPORARY_EVENTS to make a ped completely oblivious to all events going on around him
function Global.SetBlockingOfNonTemporaryEvents(ped, toggle)
	return _in(0x9F8AA94D6D97DBF4, ped, toggle)
end

function Global.SetBoatAnchor(vehicle, toggle)
	return _in(0x75DBEC174AEEAD10, vehicle, toggle)
end

--- Set camera as active/inactive.
function Global.SetCamActive(cam, active)
	return _in(0x026FB97D0A425F84, cam, active)
end

--- Previous declaration void SET_CAM_ACTIVE_WITH_INTERP(Cam camTo, Cam camFrom, int duration, BOOL easeLocation, BOOL easeRotation) is completely wrong. The last two params are integers not BOOLs...
function Global.SetCamActiveWithInterp(camTo, camFrom, duration, easeLocation, easeRotation)
	return _in(0x9FBDA379383A52A4, camTo, camFrom, duration, easeLocation, easeRotation)
end

--- Allows you to aim and shoot at the direction the camera is facing.
function Global.SetCamAffectsAiming(cam, toggle)
	return _in(0x8C1DC7770C51DC8D, cam, toggle)
end

function Global.SetCamAnimCurrentPhase(cam, phase)
	return _in(0x4145A4C44FF3B5A6, cam, phase)
end

--- Sets the position of the cam.
function Global.SetCamCoord(cam, posX, posY, posZ)
	return _in(0x4D41783FB745E42E, cam, posX, posY, posZ)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.SetCamDebugName(camera, name)
	return _in(0x1B93E0107865DD40, camera, _ts(name))
end

--- This native has its name defined inside its codE
function Global.SetCamDofFnumberOfLens(camera, p1)
	return _in(0x7DD234D6F3914C5B, camera, p1)
end
Global.N_0x7dd234d6f3914c5b = Global.SetCamDofFnumberOfLens

--- This native has a name defined inside its code
function Global.SetCamDofFocusDistanceBias(camera, p1)
	return _in(0xC669EEA5D031B7DE, camera, p1)
end
Global.N_0xc669eea5d031b7de = Global.SetCamDofFocusDistanceBias

--- This native has a name defined inside its code
function Global.SetCamDofMaxNearInFocusDistance(camera, p1)
	return _in(0xC3654A441402562D, camera, p1)
end
Global.N_0xc3654a441402562d = Global.SetCamDofMaxNearInFocusDistance

--- This native has a name defined inside its code
function Global.SetCamDofMaxNearInFocusDistanceBlendLevel(camera, p1)
	return _in(0x2C654B4943BDDF7C, camera, p1)
end
Global.N_0x2c654b4943bddf7c = Global.SetCamDofMaxNearInFocusDistanceBlendLevel

function Global.SetCamDofPlanes(cam, p1, p2, p3, p4)
	return _in(0x3CF48F6F96E749DC, cam, p1, p2, p3, p4)
end

function Global.SetCamDofStrength(cam, dofStrength)
	return _in(0x5EE29B4D7D5DF897, cam, dofStrength)
end

--- if p0 is 0, effect is cancelled
-- if p0 is 1, effect zooms in, gradually tilts cam clockwise apx 30 degrees, wobbles slowly. Motion blur is active until cancelled.
-- if p0 is 2, effect immediately tilts cam clockwise apx 30 degrees, begins to wobble slowly, then gradually tilts cam back to normal. The wobbling will continue until the effect is cancelled.
function Global.SetCamEffect(p0)
	return _in(0x80C8B1846639BB19, p0)
end

function Global.SetCamFarClip(cam, farClip)
	return _in(0xAE306F2A904BF86E, cam, farClip)
end

function Global.SetCamFarDof(cam, farDOF)
	return _in(0xEDD91296CD01AEE0, cam, farDOF)
end

--- Sets the field of view of the cam.
-- ---------------------------------------------
-- Min: 1.0f
-- Max: 130.0f
function Global.SetCamFov(cam, fieldOfView)
	return _in(0xB13C14F66A00D047, cam, fieldOfView)
end

--- The native seems to only be called once.
-- The native is used as so,
-- CAM::SET_CAM_INHERIT_ROLL_VEHICLE(l_544, getElem(2, &amp;l_525, 4));
-- In the exile1 script.
function Global.SetCamInheritRollVehicle(cam, p1)
	return _in(0x45F1DE9C34B93AE6, cam, p1)
end

function Global.SetCamMotionBlurStrength(cam, strength)
	return _in(0x6F0F77FBA9A8F2E6, cam, strength)
end

function Global.SetCamNearClip(cam, nearClip)
	return _in(0xC7848EFCCC545182, cam, nearClip)
end

function Global.SetCamNearDof(cam, nearDOF)
	return _in(0x3FA4BF0A7AB7DE2C, cam, nearDOF)
end

function Global.SetCamParams(cam, posX, posY, posZ, rotX, rotY, rotZ, fieldOfView, p8, p9, p10, p11)
	return _in(0xBFD8727AEA3CCEBA, cam, posX, posY, posZ, rotX, rotY, rotZ, fieldOfView, p8, p9, p10, p11)
end

--- Sets the rotation of the cam.
-- Last parameter unknown.
-- Last parameter seems to always be set to 2.
function Global.SetCamRot(cam, rotX, rotY, rotZ, rotationOrder)
	return _in(0x85973643155D0B07, cam, rotX, rotY, rotZ, rotationOrder)
end

function Global.SetCamShakeAmplitude(cam, amplitude)
	return _in(0xD93DB43B82BC0D00, cam, amplitude)
end

--- I named p1 as timeDuration as it is obvious. I'm assuming tho it is ran in ms(Milliseconds) as usual.
function Global.SetCamSplineDuration(cam, timeDuration)
	return _in(0x1381539FEE034CDA, cam, timeDuration)
end

function Global.SetCamSplinePhase(cam, p1)
	return _in(0x242B5874F0A4E052, cam, p1)
end

function Global.SetCamUseShallowDofMode(cam, toggle)
	return _in(0x16A96863A17552BB, cam, toggle)
end

function Global.SetCameraRange(cam, range)
	return _in(0xF9D02130ECDD1D77, cam, range)
end
Global.N_0xf9d02130ecdd1d77 = Global.SetCameraRange

--- Setting ped to true allows the ped to shoot "friendlies".
-- p2 set to true when toggle is also true seams to make peds permanently unable to aim at, even if you set p2 back to false.
-- p1 = false &amp; p2 = false for unable to aim at.
-- p1 = true &amp; p2 = false for able to aim at.
function Global.SetCanAttackFriendly(ped, toggle, p2)
	return _in(0xB3B1CB349FF9C75D, ped, toggle, p2)
end

--- Hardcoded to not work in multiplayer.
function Global.SetCanResprayVehicle(vehicle, state)
	return _in(0x52BBA29D5EC69356, vehicle, state)
end

--- Something to do with "high speed bump severity"?
-- if (!sub_87a46("SET_CAR_HIGH_SPEED_BUMP_SEVERITY_MULTIPLIER")) {
-- VEHICLE::_84FD40F56075E816(0.0);
-- sub_8795b("SET_CAR_HIGH_SPEED_BUMP_SEVERITY_MULTIPLIER", 1);
-- }
function Global.SetCarHighSpeedBumpSeverityMultiplier(multiplier)
	return _in(0x84FD40F56075E816, multiplier)
end
Global.N_0x84fd40f56075e816 = Global.SetCarHighSpeedBumpSeverityMultiplier

--- For now, I changed the last one from bool to int.
-- According to scripts specifically 'fm_mission_controller' this last parameter is 'false/0' when its called after the create rope native above is called for the magnet and 'true/1' after the create rope native above is called for the hook.
function Global.SetCargobobHookPosition(p0, p1, p2, state)
	return _in(0x877C1EAEAC531023, p0, p1, p2, state)
end
Global.N_0x877c1eaeac531023 = Global.SetCargobobHookPosition

--- Console Hash: 0xF57066DA
-- Won't attract or magnetize to any helicopters or planes of course, but that's common sense.
function Global.SetCargobobPickupMagnetActive(cargobob, isActive)
	return _in(0x9A665550F8DA349B, cargobob, isActive)
end
Global.CargobobMagnetGrabVehicle = Global.SetCargobobPickupMagnetActive

--- console hash 0xCC3CF97D
function Global.SetCargobobPickupMagnetStrength(cargobob, strength)
	return _in(0xBCBFCD9D1DAC19E2, cargobob, strength)
end
Global.N_0xbcbfcd9d1dac19e2 = Global.SetCargobobPickupMagnetStrength

function Global.SetCgAtBoundcenter(rope)
	return _in(0xBE520D9761FF811F, rope)
end

function Global.SetCgoffset(rope, x, y, z)
	return _in(0xD8FA3908D7B86904, rope, x, y, z)
end

--- Sets the cylinder height of the checkpoint.
-- Parameters:
-- * nearHeight - The height of the checkpoint when inside of the radius.
-- * farHeight - The height of the checkpoint when outside of the radius.
-- * radius - The radius of the checkpoint.
function Global.SetCheckpointCylinderHeight(checkpoint, nearHeight, farHeight, radius)
	return _in(0x2707AAE9D9297D89, checkpoint, nearHeight, farHeight, radius)
end

--- Sets the checkpoint icon color.
function Global.SetCheckpointIconRgba(checkpoint, red, green, blue, alpha)
	return _in(0xB9EA40907C680580, checkpoint, red, green, blue, alpha)
end

--- Sets the checkpoint color.
function Global.SetCheckpointRgba(checkpoint, red, green, blue, alpha)
	return _in(0x7167371E8AD747F7, checkpoint, red, green, blue, alpha)
end

function Global.SetCinematicButtonActive(p0)
	return _in(0x51669F7D1FB53D9F, p0)
end

function Global.SetCinematicCamShakeAmplitude(p0)
	return _in(0xC724C701C30B2FE7, p0)
end

--- p0 = 0/1 or true/false
-- It doesn't seems to work
function Global.SetCinematicModeActive(p0)
	return _in(0xDCF0754AC3D6FD4E, p0)
end

function Global.SetClockDate(day, month, year)
	return _in(0xB096419DF0D06CE7, day, month, year)
end

--- SET_CLOCK_TIME(12, 34, 56);
function Global.SetClockTime(hour, minute, second)
	return _in(0x47C3B5848C3E45D8, hour, minute, second)
end

function Global.SetCloudHatOpacity(opacity)
	return _in(0xF36199225D6D8C86, opacity)
end
Global.N_0xf36199225d6d8c86 = Global.SetCloudHatOpacity

function Global.SetCloudHatTransition(type, transitionTime)
	return _in(0xFC4842A34657BFCB, _ts(type), transitionTime)
end

--- combatType can be between 0-14. See GET_COMBAT_FLOAT below for a list of possible parameters.
function Global.SetCombatFloat(ped, combatType, p2)
	return _in(0xFF41B4B141ED981C, ped, combatType, p2)
end

--- This is for simulating player input.
-- amount is a float value from 0
-- 0, 1 and 2 used in the scripts. 0 is by far the most common of them.
function Global.SetControlNormal(inputGroup, control, amount)
	return _in(0xE8A25867FBA3B05E, inputGroup, control, amount, _r)
end
Global.N_0xe8a25867fba3b05e = Global.SetControlNormal

function Global.SetConvertibleRoof(vehicle, p1)
	return _in(0xF39C4F538B5124C2, vehicle, p1)
end

function Global.SetCreateRandomCops(toggle)
	return _in(0x102E68B2024D536D, toggle)
end

function Global.SetCreateRandomCopsNotOnScenarios(toggle)
	return _in(0x8A4986851C4EF6E7, toggle)
end

function Global.SetCreateRandomCopsOnScenarios(toggle)
	return _in(0x444CB7D7DBE6973D, toggle)
end

function Global.SetCreditsActive(toggle)
	return _in(0xB938B7E6D3C0620C, toggle)
end

function Global.SetCurrentPedVehicleWeapon(ped, weaponHash)
	return _in(0x75C55983C2C39DAA, ped, _ch(weaponHash), _r)
end

function Global.SetCurrentPedWeapon(ped, weaponHash, equipNow)
	return _in(0xADF692B254977C0C, ped, _ch(weaponHash), equipNow)
end

--- Renamed to SET_CURSOR_LOCATION (I previously named it _SET_CURSOR_POSTION) which is the correct name as far as I can tell.
function Global.SetCursorLocation(x, y)
	return _in(0xFC695459D4D0E219, x, y, _r)
end
Global.N_0xfc695459d4d0e219 = Global.SetCursorLocation

--- Changes the mouse cursor's sprite.
-- 1 = Normal
-- 6 = Left Arrow
-- 7 = Right Arrow
function Global.SetCursorSprite(spriteId)
	return _in(0x8DB8CFFD58B62552, spriteId)
end
Global.N_0x8db8cffd58b62552 = Global.SetCursorSprite

--- Specifies a custom respawn position to be used in conjunction with _SET_NEXT_RESPAWN_TO_CUSTOM
function Global.SetCustomRespawnPosition(x, y, z, heading)
	return _in(0x706B5EDCAA7FA663, x, y, z, heading)
end
Global.N_0x706b5edcaa7fa663 = Global.SetCustomRespawnPosition

--- All occurrences found in b617d, sorted alphabetically and identical lines removed:
-- AUDIO::SET_CUTSCENE_AUDIO_OVERRIDE("_AK");
-- AUDIO::SET_CUTSCENE_AUDIO_OVERRIDE("_CUSTOM");
-- AUDIO::SET_CUTSCENE_AUDIO_OVERRIDE("_TOOTHLESS");
function Global.SetCutsceneAudioOverride(p0)
	return _in(0x3B4BF5F0859204D9, _ts(p0))
end

function Global.SetCutsceneFadeValues(p0, p1, p2, p3)
	return _in(0x8093F23ABACCC7D4, p0, p1, p2, p3)
end

--- p3 could be heading. Needs more research.
function Global.SetCutsceneOrigin(x, y, z, p3, p4)
	return _in(0xB812B3FD1C01CF27, x, y, z, p3, p4)
end

function Global.SetCutscenePedComponentVariation(cutsceneEntName, p1, p2, p3, modelHash)
	return _in(0xBA01E7B6DEEFBBC9, _ts(cutsceneEntName), p1, p2, p3, _ch(modelHash))
end

--- Thanks R*! ;)
-- if ((l_161 == 0) || (l_161 == 2)) {
-- sub_2ea27("Trying to set Jimmy prop variation");
-- CUTSCENE::_0546524ADE2E9723("Jimmy_Boston", 1, 0, 0, 0);
-- }
function Global.SetCutscenePedPropVariation(cutsceneEntName, p1, p2, p3, modelHash)
	return _in(0x0546524ADE2E9723, _ts(cutsceneEntName), p1, p2, p3, _ch(modelHash))
end
Global.N_0x0546524ade2e9723 = Global.SetCutscenePedPropVariation

--- Only used twice in R* scripts
function Global.SetCutsceneTriggerArea(p0, p1, p2, p3, p4, p5)
	return _in(0x9896CE4721BE84BA, p0, p1, p2, p3, p4, p5)
end

function Global.SetDamping(rope, vertex, value)
	return _in(0xEEA3B200A6FEB65B, rope, vertex, value)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.SetDebugLinesAndSpheresDrawingActive(enabled)
	return _in(0x175B6BFC15CDD0C5, enabled)
end

function Global.SetDecisionMaker(ped, name)
	return _in(0xB604A2942ADED0EE, ped, _ch(name))
end

--- Defines the state of a destructible object.
-- Use the "0xB48FCED898292E52" native to find an object's handle with its name / coords
-- State 2 == object just spawned
-- State 4 == Beginning of the animation
-- State 6 == Start animation
-- State 9 == End of the animation
function Global.SetDesObjectState(handle, state)
	return _in(0x5C29F698D404C5E1, handle, state)
end
Global.N_0x5c29f698d404c5e1 = Global.SetDesObjectState

--- If toggle is true, hides special ability bar / character name in the pause menu
-- If toggle is false, shows special ability bar / character name in the pause menu
function Global.SetDirectorMode(toggle)
	return _in(0x808519373FD336A3, toggle)
end
Global.N_0x808519373fd336a3 = Global.SetDirectorMode

function Global.SetDisableAmbientMeleeMove(player, toggle)
	return _in(0x2E8AABFA40A84F8C, player, toggle)
end

function Global.SetDisableBreaking(rope, enabled)
	return _in(0x5CEC1A84620E7D5B, rope, enabled, _r, _ri)
end

--- sometimes used used with NET_TO_OBJ
-- hash collision last 2 words
function Global.SetDisableFragDamage(object, toggle)
	return _in(0x01BA3AED21C16CFB, object, toggle)
end

function Global.SetDisableVehiclePetrolTankDamage(vehicle, toggle)
	return _in(0x37C8252A7C92D017, vehicle, toggle)
end

function Global.SetDisableVehiclePetrolTankFires(vehicle, toggle)
	return _in(0x465BF26AB9684352, vehicle, toggle)
end
Global.N_0x465bf26ab9684352 = Global.SetDisableVehiclePetrolTankFires

function Global.SetDispatchCopsForPlayer(player, toggle)
	return _in(0xDB172424876553F4, player, toggle)
end

function Global.SetDispatchIdealSpawnDistance(p0)
	return _in(0x6FE601A64180D423, p0)
end

function Global.SetDispatchTimeBetweenSpawnAttempts(p0, p1)
	return _in(0x44F7CBC1BEB3327D, p0, p1)
end

function Global.SetDispatchTimeBetweenSpawnAttemptsMultiplier(p0, p1)
	return _in(0x48838ED9937A15D1, p0, p1)
end

--- This is a NOP function. It does nothing at all.
function Global.SetDitchPoliceModels(toggle)
	return _in(0x42CBE54462D92634, toggle)
end

--- Sets the acceleration limit of a door.
-- How fast it can open, or the inverse hinge resistance.
-- A limit of 0 seems to lock doors.
-- p2 is always 0, p3 is always 1.
function Global.SetDoorAccelerationLimit(doorHash, limit, p2, p3)
	return _in(0x6BAB9442830C7F53, _ch(doorHash), limit, p2, p3)
end
Global.N_0x6bab9442830c7f53 = Global.SetDoorAccelerationLimit

--- Sets the ajar angle of a door.
-- Ranges from -1.0 to 1.0, and 0.0 is closed / default.
-- p2 is always 0, p3 is always 1.
function Global.SetDoorAjarAngle(doorHash, ajar, p2, p3)
	return _in(0xB6E6FBA95C7324AC, _ch(doorHash), ajar, p2, p3)
end
Global.N_0xb6e6fba95c7324ac = Global.SetDoorAjarAngle

--- Sets the on-screen drawing origin for draw-functions (which is normally x=0,y=0 in the upper left corner of the screen) to a world coordinate.
-- From now on, the screen coordinate which displays the given world coordinate on the screen is seen as x=0,y=0.
-- Example in C#:
-- Vector3 boneCoord = somePed.GetBoneCoord(Bone.SKEL_Head);
-- Function.Call(Hash.SET_DRAW_ORIGIN, boneCoord.X, boneCoord.Y, boneCoord.Z, 0);
-- Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", -0.01, -0.015, 0.013, 0.013, 0.0, 255, 0, 0, 200);
-- Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", 0.01, -0.015, 0.013, 0.013, 90.0, 255, 0, 0, 200);
-- Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", -0.01, 0.015, 0.013, 0.013, 270.0, 255, 0, 0, 200);
-- Function.Call(Hash.DRAW_SPRITE, "helicopterhud", "hud_corner", 0.01, 0.015, 0.013, 0.013, 180.0, 255, 0, 0, 200);
-- Function.Call(Hash.CLEAR_DRAW_ORIGIN);
-- Result: www11.pic-upload.de/19.06.15/bkqohvil2uao.jpg
-- If the pedestrian starts walking around now, the sprites are always around her head, no matter where the head is displayed on the screen.
-- This function also effects the drawing of texts and other UI-elements.
-- The effect can be reset by calling GRAPHICS::CLEAR_DRAW_ORIGIN().
function Global.SetDrawOrigin(x, y, z, p3)
	return _in(0xAA0008F3BBB8F416, x, y, z, p3)
end

function Global.SetDriveTaskCruiseSpeed(driver, cruiseSpeed)
	return _in(0x5C9B84BD7D31D908, driver, cruiseSpeed)
end

--- This native is used to set the driving style for specific ped.
-- Driving styles id seems to be:
-- 786468
-- 262144
-- 786469
-- http://gtaforums.com/topic/822314-guide-driving-styles/
function Global.SetDriveTaskDrivingStyle(ped, drivingStyle)
	return _in(0xDACE1BE37D88AF67, ped, drivingStyle)
end

function Global.SetDriveTaskMaxCruiseSpeed(p0, p1)
	return _in(0x404A5AA9B9F0B746, p0, p1)
end

--- For p1 &amp; p2 (Ped, Vehicle). I could be wrong, as the only time this native is called in scripts is once and both are 0, but I assume this native will work like SET_MOUNTED_WEAPON_TARGET in which has the same exact amount of parameters and the 1st and last 3 parameters are right and the same for both natives.
function Global.SetDrivebyTaskTarget(shootingPed, targetPed, targetVehicle, x, y, z)
	return _in(0xE5B302114D8162EE, shootingPed, targetPed, targetVehicle, x, y, z)
end

--- The function specifically verifies the value is equal to, or less than 1.0f. If it is greater than 1.0f, the function does nothing at all.
function Global.SetDriverAbility(driver, ability)
	return _in(0xB195FFA8042FC5C3, driver, ability)
end

--- range 0.0f - 1.0f
function Global.SetDriverAggressiveness(driver, aggressiveness)
	return _in(0xA731F608CA104E3C, driver, aggressiveness)
end

function Global.SetEmitterRadioStation(emitterName, radioStation)
	return _in(0xACF57305B12AF907, _ts(emitterName), _ts(radioStation))
end

function Global.SetEnableBoundAnkles(ped, toggle)
	return _in(0xC52E0F855C58FC2E, ped, toggle)
end

--- ped can not pull out a weapon when true
function Global.SetEnableHandcuffs(ped, toggle)
	return _in(0xDF1AF8B5D56542FA, ped, toggle)
end

function Global.SetEnablePedEnveffScale(ped, toggle)
	return _in(0xD2C5AA0C0E8D0F1E, ped, toggle)
end

--- Enables diving motion when underwater.
function Global.SetEnableScuba(ped, toggle)
	return _in(0xF99F62004024D506, ped, toggle)
end

--- skin - everything alpha except skin
-- Set entity alpha level. Ranging from 0 to 255 but chnages occur after every 20 percent (after every 51).
function Global.SetEntityAlpha(entity, alphaLevel, skin)
	return _in(0x44A0870B7E92D7C0, entity, alphaLevel, skin)
end

function Global.SetEntityAlwaysPrerender(entity, toggle)
	return _in(0xACAD101E1FB66689, entity, toggle)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.SetEntityAnimCurrentTime(entity, animDictionary, animName, time)
	return _in(0x4487C259F0F70977, entity, _ts(animDictionary), _ts(animName), time)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.SetEntityAnimSpeed(entity, animDictionary, animName, speedMultiplier)
	return _in(0x28D1A16553C51776, entity, _ts(animDictionary), _ts(animName), speedMultiplier)
end

--- Makes the specified entity (ped, vehicle or object) persistent. Persistent entities will not automatically be removed by the engine.
-- p1 has no effect when either its on or off
-- maybe a quick disassembly will tell us what it does
-- p2 has no effect when either its on or off
-- maybe a quick disassembly will tell us what it does
function Global.SetEntityAsMissionEntity(entity, p1, p2)
	return _in(0xAD738C3085FE7E11, entity, p1, p2)
end

--- Marks the specified entity (ped, vehicle or object) as no longer needed.
-- Entities marked as no longer needed, will be deleted as the engine sees fit.
function Global.SetEntityAsNoLongerNeeded(entity)
	return _in(0xB736A491E64A32CF, _ii(entity) --[[ may be optional ]])
end

function Global.SetEntityCanBeDamaged(entity, toggle)
	return _in(0x1760FFA8AB074D66, entity, toggle)
end

function Global.SetEntityCanBeDamagedByRelationshipGroup(entity, bCanBeDamaged, relGroup)
	return _in(0xE22D8FDE858B8119, entity, bCanBeDamaged, relGroup)
end

--- Sets whether the entity can be targeted without being in line-of-sight.
function Global.SetEntityCanBeTargetedWithoutLos(entity, toggle)
	return _in(0xD3997889736FD899, entity, toggle)
end

function Global.SetEntityCollision(entity, toggle, keepPhysics)
	return _in(0x1A9205C1B9EE827F, entity, toggle, keepPhysics)
end

--- p7 is always 1 in the scripts. Set to 1, an area around the destination coords for the moved entity is cleared from other entities.
-- Often ends with 1, 0, 0, 1); in the scripts. It works.
-- Axis - Invert Axis Flags
function Global.SetEntityCoords(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
	return _in(0x06843DA7060A026B, entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
end

--- Axis - Invert Axis Flags
function Global.SetEntityCoordsNoOffset(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis)
	return _in(0x239A3351AC1DA385, entity, xPos, yPos, zPos, xAxis, yAxis, zAxis)
end

--- does the same as SET_ENTITY_COORDS.
-- Console Hash: 0x749B282E
function Global.SetEntityCoords_2(entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
	return _in(0x621873ECE1178967, entity, xPos, yPos, zPos, xAxis, yAxis, zAxis, clearArea)
end

function Global.SetEntityDynamic(entity, toggle)
	return _in(0x1718DE8E3F2823CA, entity, toggle)
end

function Global.SetEntityHasGravity(entity, toggle)
	return _in(0x4A4722448F18EEF5, entity, toggle)
end

function Global.SetEntityHeading(entity, heading)
	return _in(0x8E2530AA8ADA980E, entity, heading)
end

--- health &gt;= 0
function Global.SetEntityHealth(entity, health)
	return _in(0x6B76DC1F3AE6E6A3, entity, health)
end

function Global.SetEntityIconColor(entity, red, green, blue, alpha)
	return _in(0x1D5F595CCAE2E238, entity, red, green, blue, alpha)
end

function Global.SetEntityIconVisibility(entity, toggle)
	return _in(0xE0E8BEECCA96BA31, entity, toggle)
end

--- Sets a ped or an object totally invincible. It doesn't take any kind of damage. Peds will not ragdoll on explosions and the tazer animation won't apply either.
-- If you use this for a ped and you want Ragdoll to stay enabled, then do:
-- *(DWORD *)(pedAddress + 0x188) |= (1 &lt;&lt; 9);
-- Use this if you want to get the invincibility status:
-- bool IsPedInvincible(Ped ped)
-- {
-- auto addr = getScriptHandleBaseAddress(ped);
-- if (addr)
-- {
-- DWORD flag = *(DWORD *)(addr + 0x188);
-- return ((flag &amp; (1 &lt;&lt; 8)) != 0) || ((flag &amp; (1 &lt;&lt; 9)) != 0);
-- }
-- return false;
-- }
function Global.SetEntityInvincible(entity, toggle)
	return _in(0x3882114BDE571AD4, entity, toggle)
end

function Global.SetEntityIsTargetPriority(entity, p1, p2)
	return _in(0xEA02E132F5C68722, entity, p1, p2)
end

function Global.SetEntityLights(entity, toggle)
	return _in(0x7CFBA6A80BDF3874, entity, toggle)
end

function Global.SetEntityLoadCollisionFlag(entity, toggle)
	return _in(0x0DC7CABAB1E9B67E, entity, toggle)
end

function Global.SetEntityLocallyInvisible(entity)
	return _in(0xE135A9FF3F5D05D8, entity)
end

function Global.SetEntityLocallyVisible(entity)
	return _in(0x241E289B5C059EDC, entity)
end

--- LOD distance can be 0 to 0xFFFF (higher values will result in 0xFFFF) as it is actually stored as a 16-bit value (aka uint16_t).
function Global.SetEntityLodDist(entity, value)
	return _in(0x5927F96A78577363, entity, value)
end

--- For instance: ENTITY::SET_ENTITY_MAX_HEALTH(PLAYER::PLAYER_PED_ID(), 200); // director_mode.c4: 67849
function Global.SetEntityMaxHealth(entity, value)
	return _in(0x166E7CF68597D8B5, entity, value)
end

function Global.SetEntityMaxSpeed(entity, speed)
	return _in(0x0E46A3FCBDE2A1B1, entity, speed)
end

function Global.SetEntityMotionBlur(entity, toggle)
	return _in(0x295D82A8559F9150, entity, toggle)
end

--- Calling this function, regardless of the "unknown" value, disabled collision between two entities.
-- Importance of entity1 and 2 order is unclear.
function Global.SetEntityNoCollisionEntity(entity1, entity2, unknown)
	return _in(0xA53ED5520C07654A, entity1, entity2, unknown)
end

function Global.SetEntityOnlyDamagedByPlayer(entity, toggle)
	return _in(0x79F020FF9EDC0748, entity, toggle)
end

function Global.SetEntityOnlyDamagedByRelationshipGroup(entity, p1, p2)
	return _in(0x7022BD828FA0B082, entity, p1, p2)
end

--- Enable / disable each type of damage.
-- Can't get drownProof to work.
-- --------------
-- p7 is to to '1' in am_mp_property_ext/int: entity::set_entity_proofs(uParam0-&gt;f_19, true, true, true, true, true, true, 1, true);
function Global.SetEntityProofs(entity, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, p6, p7, drownProof)
	return _in(0xFAEE099C6F890BB8, entity, bulletProof, fireProof, explosionProof, collisionProof, meleeProof, p6, p7, drownProof)
end

--- w is the correct parameter name!
function Global.SetEntityQuaternion(entity, x, y, z, w)
	return _in(0x77B21BE7AC540F07, entity, x, y, z, w)
end

function Global.SetEntityRecordsCollisions(entity, toggle)
	return _in(0x0A50A1EEDAD01E65, entity, toggle)
end

function Global.SetEntityRenderScorched(entity, toggle)
	return _in(0x730F5F8D3F0F2050, entity, toggle)
end

--- rotationOrder refers to the order yaw pitch roll is applied
-- value ranges from 0 to 5. What you use for rotationOrder when setting must be the same as rotationOrder when getting the rotation.
-- Unsure what value corresponds to what rotation order, more testing will be needed for that.
-- For the most part R* uses 1 or 2 as the order.
-- p5 is usually set as true
function Global.SetEntityRotation(entity, pitch, roll, yaw, rotationOrder, p5)
	return _in(0x8524A8B0171D5E07, entity, pitch, roll, yaw, rotationOrder, p5)
end

--- what does this native do?
-- bool IsEntitySomething(Entity entity)
-- {
-- auto addr = getScriptHandleBaseAddress(entity);
-- printf("addr: 0x%X \n", addr);
-- if (addr)
-- {
-- DWORD flag = *(DWORD *)(addr + 0x48D);
-- printf("flag: 0x%X \n", flag);
-- return ((flag &amp; (1 &lt;&lt; 3)) != 0) || ((flag &amp; (1 &lt;&lt; 30)) != 0);
-- }
-- return false;
-- }
-- wot ?
function Global.SetEntitySomething(entity, toggle)
	return _in(0x3910051CCECDB00C, entity, toggle)
end
Global.N_0x3910051ccecdb00c = Global.SetEntitySomething
Global.SetEntityRegister = Global.SetEntitySomething

--- Example here: www.gtaforums.com/topic/830463-help-with-turning-lights-green-and-causing-peds-to-crash-into-each-other/#entry1068211340
-- 0 = green
-- 1 = red
-- 2 = yellow
-- changing lights may not change the behavior of vehicles
function Global.SetEntityTrafficlightOverride(entity, state)
	return _in(0x57C5DB656185EAC4, entity, state)
end

--- Note that the third parameter(denoted as z) is "up and down" with positive numbers encouraging upwards movement.
function Global.SetEntityVelocity(entity, x, y, z)
	return _in(0x1C99BB7B6E96D16F, entity, x, y, z)
end

--- unk was always 0.
function Global.SetEntityVisible(entity, toggle, unk)
	return _in(0xEA1C610A04DB6BBB, entity, toggle, unk)
end

function Global.SetEntityVisibleInCutscene(p0, p1, p2)
	return _in(0xE0031D3C8F36AB82, p0, p1, p2)
end

function Global.SetEveryoneIgnorePlayer(player, toggle)
	return _in(0x8EEDA153AD141BA4, player, toggle)
end

--- In appcamera.c4, Line 106:
-- if (VEHICLE::IS_VEHICLE_DRIVEABLE(PED::SET_EXCLUSIVE_PHONE_RELATIONSHIPS(PLAYER::PLAYER_PED_ID()), 0))
-- So return type could be a vehicle?
-- !Hash collision - gets the vehicle handle from ped which is about entering the vehicle!
-- sfink: agreed, 100%
-- Proper name is GET_VEHICLE_PED_IS_ENTERING
function Global.SetExclusivePhoneRelationships(ped)
	return _in(0xF92691AED837A5FC, ped, _r, _ri)
end

--- Groups found in the scripts used with this native:
-- "AMMUNATION",
-- "QUARRY",
-- "Triathlon_1",
-- "Triathlon_2",
-- "Triathlon_3"
function Global.SetExclusiveScenarioGroup(scenarioGroup)
	return _in(0x535E97E1F7FC0C6A, _ts(scenarioGroup))
end

function Global.SetExplosiveAmmoThisFrame(player)
	return _in(0xA66C71C98D5F2CFB, player, _r, _ri)
end

function Global.SetExplosiveMeleeThisFrame(player)
	return _in(0xFF1BED81BFDC0FE0, player, _r, _ri)
end

function Global.SetFacialIdleAnimOverride(ped, animName, animDict)
	return _in(0xFFC24B988B938B38, ped, _ts(animName), _ts(animDict))
end

--- Sets whether the game should fade in after the player dies or is arrested.
function Global.SetFadeInAfterDeathArrest(toggle)
	return _in(0xDA66D2796BA33F12, toggle)
end

function Global.SetFadeInAfterLoad(toggle)
	return _in(0xF3D78F59DFE18D79, toggle)
end

--- Sets whether the game should fade out after the player is arrested.
function Global.SetFadeOutAfterArrest(toggle)
	return _in(0x1E0B4DC0D990A4E7, toggle)
end

--- Sets whether the game should fade out after the player dies.
function Global.SetFadeOutAfterDeath(toggle)
	return _in(0x4A18E01DF2C87B86, toggle)
end

--- Sets a visually fake wanted level on the user interface. Used by Rockstar's scripts to "override" regular wanted levels and make custom ones while the real wanted level and multipliers are ignored.
-- Max is 5, anything above this makes it just 5. Also the mini-map gets the red &amp; blue flashing effect. I wish I could use this to fake I had 6 stars like a few of the old GTAs'
function Global.SetFakeWantedLevel(fakeWantedLevel)
	return _in(0x1454F2448DE30163, fakeWantedLevel)
end

function Global.SetFarDrawVehicles(toggle)
	return _in(0x26324F33423F3CC3, toggle)
end

--- When this is set to ON, shadows only draw as you get nearer.
-- When OFF, they draw from a further distance.
function Global.SetFarShadowsSuppressed(toggle)
	return _in(0x80ECBC0C856D3B0B, toggle)
end

function Global.SetFireAmmoThisFrame(player)
	return _in(0x11879CDD803D30F4, player, _r, _ri)
end

--- Purpose of p0 and p1 unknown.
function Global.SetFlash(p0, p1, fadeIn, duration, fadeOut)
	return _in(0x0AB84296FED9CFC6, p0, p1, fadeIn, duration, fadeOut)
end

function Global.SetFlashLightFadeDistance(distance)
	return _in(0xCEA66DAD478CD39B, distance, _r, _ri)
end

--- Override the area where the camera will render the terrain.
-- p3, p4 and p5 are usually set to 0.0
function Global.SetFocusArea(x, y, z, offsetX, offsetY, offsetZ)
	return _in(0xBB7454BAFF08FE25, x, y, z, offsetX, offsetY, offsetZ)
end

--- It seems to make the entity's coords mark the point from which LOD-distances are measured. In my testing, setting a vehicle as the focus entity and moving that vehicle more than 300 distance units away from the player will make the level of detail around the player go down drastically (shadows disappear, textures go extremely low res, etc). The player seems to be the default focus entity.
function Global.SetFocusEntity(entity)
	return _in(0x198F77705FA0931D, entity)
end

--- From the b617d scripts:
-- CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_ATTACHED_TO_ROPE_CAMERA", 0);
-- CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_ON_EXILE1_LADDER_CAMERA", 1500);
-- CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_CAMERA", 0);
-- CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_CAMERA", 3000);
-- CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_FAMILY5_CAMERA", 0);
-- CAM::SET_FOLLOW_PED_CAM_CUTSCENE_CHAT("FOLLOW_PED_SKY_DIVING_CAMERA", 0);
function Global.SetFollowPedCamCutsceneChat(p0, p1)
	return _in(0x44A113DD6FFC48D1, _ts(p0), p1, _r)
end

--- Sets the type of Player camera:
-- 0 - Third Person Close
-- 1 - Third Person Mid
-- 2 - Third Person Far
-- 4 - First Person
function Global.SetFollowPedCamViewMode(viewMode)
	return _in(0x5A4F9EDF1673F704, viewMode)
end

--- Sets the type of Player camera in vehicles:
-- 0 - Third Person Close
-- 1 - Third Person Mid
-- 2 - Third Person Far
-- 4 - First Person
function Global.SetFollowVehicleCamViewMode(viewMode)
	return _in(0xAC253D7842768F48, viewMode)
end

function Global.SetFollowVehicleCamZoomLevel(zoomLevel)
	return _in(0x19464CB6E4078C8A, zoomLevel)
end

function Global.SetForceHdVehicle(vehicle, toggle)
	return _in(0x97CE68CB032583F0, vehicle, toggle)
end
Global.N_0x97ce68cb032583f0 = Global.SetForceHdVehicle

function Global.SetForceObjectThisFrame(p0, p1, p2, p3)
	return _in(0xF538081986E49E9D, p0, p1, p2, p3)
end

--- Forces footstep tracks on all surfaces.
function Global.SetForcePedFootstepsTracks(toggle)
	return _in(0xAEEDAD1420C65CC0, toggle)
end

--- Forces vehicle trails on all surfaces.
function Global.SetForceVehicleTrails(toggle)
	return _in(0x4CC7F0FEA5283FE0, toggle)
end

function Global.SetFrontendActive(active)
	return _in(0x745711A75AB09277, active)
end

function Global.SetFrontendRadioActive(active)
	return _in(0xF7F26C6E9CC9EBB8, active)
end

function Global.SetFrozenRenderingDisabled(enabled)
	return _in(0xDFC252D8A3E15AB7, enabled)
end
Global.EnableGameplayCam = Global.SetFrozenRenderingDisabled

--- Make sure to call this from the correct thread if you're using multiple threads because all other threads except the one which is calling SET_GAME_PAUSED will be paused which means you will lose control and the game remains in paused mode until you exit GTA5.exe
function Global.SetGamePaused(toggle)
	return _in(0x577D1284D6873711, toggle)
end

function Global.SetGamePausesForStreaming(toggle)
	return _in(0x717CD6E6FAEBBEDC, toggle)
end

function Global.SetGameplayCamRawPitch(pitch)
	return _in(0x759E13EBC1C15C5A, pitch)
end

--- Does nothing
function Global.SetGameplayCamRawYaw(yaw)
	return _in(0x103991D4A307D472, yaw)
end

--- Sets the camera position relative to heading in float from -360 to +360.
-- Heading is alwyas 0 in aiming camera.
function Global.SetGameplayCamRelativeHeading(heading)
	return _in(0xB4EC2312F4E5B1F1, heading)
end

--- Sets the camera pitch.
-- Parameters:
-- x = pitches the camera on the x axis.
-- Value2 = always seems to be hex 0x3F800000 (1.000000 float).
function Global.SetGameplayCamRelativePitch(x, Value2)
	return _in(0x6D0858B8EDFD2B7D, x, Value2, _r, _ri)
end

--- Sets the amplitude for the gameplay (i.e. 3rd or 1st) camera to shake. Used in script "drunk_controller.ysc.c4" to simulate making the player drunk.
function Global.SetGameplayCamShakeAmplitude(amplitude)
	return _in(0xA87E00932DB4D85D, amplitude)
end

function Global.SetGameplayCoordHint(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xD51ADCD2D8BC0FB3, p0, p1, p2, p3, p4, p5, p6)
end

--- p6 &amp; p7 - possibly length or time
function Global.SetGameplayEntityHint(entity, xOffset, yOffset, zOffset, p4, p5, p6, p7, p8)
	return _in(0x189E955A8313E298, entity, xOffset, yOffset, zOffset, p4, p5, p6, p7, p8)
end

function Global.SetGameplayHintFov(FOV)
	return _in(0x513403FB9C56211F, FOV)
end

function Global.SetGameplayObjectHint(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x83E87508A2CA2AC6, p0, p1, p2, p3, p4, p5, p6, p7)
end

function Global.SetGameplayPedHint(p0, x1, y1, z1, p4, p5, p6, p7)
	return _in(0x2B486269ACD548D3, p0, x1, y1, z1, p4, p5, p6, p7)
end

function Global.SetGameplayVehicleHint(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0xA2297E18F3E71C2E, p0, p1, p2, p3, p4, p5, p6, p7)
end

function Global.SetGarbageTrucks(toggle)
	return _in(0x2AFD795EEAC8D30D, toggle, _r, _ri)
end

--- Needs to be looped! And yes, it does work and is not a hash collision.
-- Birds will try to reach the given height.
function Global.SetGlobalMinBirdFlightHeight(height)
	return _in(0x6C6B148586F934F7, height)
end

function Global.SetGpsActive(active)
	return _in(0x3BD3F52BA9B1E4E8, active)
end

function Global.SetGpsDisabledZone(p0, p1, p2, p3, p4, p5)
	return _in(0xDC20483CD3DD5201, p0, p1, p2, p3, p4, p5)
end

--- Only the script that originally called SET_GPS_FLAGS can set them again. Another script cannot set the flags, until the first script that called it has called CLEAR_GPS_FLAGS.
-- Doesn't seem like the flags are actually read by the game at all.
function Global.SetGpsFlags(p0, p1)
	return _in(0x5B440763A4C8D15B, p0, p1)
end

function Global.SetGpsFlashes(toggle)
	return _in(0x320D0E0D936A0E9B, toggle)
end

--- level can be from 0 to 3
-- 0: 9.8
-- 1: 2.4
-- 2: 0.1 - very low
-- 3: 0.0
-- //SuckMyCoke
function Global.SetGravityLevel(level)
	return _in(0x740E14FAD5842351, level)
end

--- 0: Default
-- 1: Circle Around Leader
-- 2: Alternative Circle Around Leader
-- 3: Line, with Leader at center
function Global.SetGroupFormation(groupId, formationType)
	return _in(0xCE2F5FC3AF7E8C1E, groupId, formationType)
end

function Global.SetGroupFormationSpacing(groupId, p1, p2, p3)
	return _in(0x1D9D45004C28C916, groupId, p1, p2, p3)
end

--- Sets the range at which members will automatically leave the group.
function Global.SetGroupSeparationRange(groupHandle, separationRange)
	return _in(0x4102C7858CFEE4E4, groupHandle, separationRange)
end

function Global.SetHdArea(x, y, z, ground)
	return _in(0xB85F26619073E775, x, y, z, ground)
end

--- Equivalent of SET_HELI_BLADES_SPEED(vehicleHandle, 1.0f);
function Global.SetHeliBladesFullSpeed(vehicle)
	return _in(0xA178472EBB8AE60D, vehicle)
end

--- Sets the speed of the helicopter blades in percentage of the full speed.
-- vehicleHandle: The helicopter.
-- speed: The speed in percentage, 0.0f being 0% and 1.0f being 100%.
function Global.SetHeliBladesSpeed(vehicle, speed)
	return _in(0xFD280B4D7F3ABC4D, vehicle, speed)
end

--- value between 0.0 and 1.0
function Global.SetHelicopterRollPitchYawMult(helicopter, multiplier)
	return _in(0x6E0859B530A365CC, helicopter, multiplier)
end

--- Makes the ped ragdoll like when falling from a great height
function Global.SetHighFallTask(ped, p1, p2, p3)
	return _in(0x8C825BDC7741D37C, ped, p1, p2, p3)
end

function Global.SetHornEnabled(vehicle, toggle)
	return _in(0x76D683C108594D0E, vehicle, toggle)
end

--- HUD colors and their values: pastebin.com/d9aHPbXN
function Global.SetHudColour(hudColorIndex, r, g, b, a)
	return _in(0xF314CF4F0211894E, hudColorIndex, r, g, b, a)
end
Global.N_0xf314cf4f0211894e = Global.SetHudColour

--- HUD colors and their values: pastebin.com/d9aHPbXN
-- --------------------------------------------------
-- makes hudColorIndex2 color into hudColorIndex color
function Global.SetHudColoursSwitch(hudColorIndex, hudColorIndex2)
	return _in(0x1CCC708F0F850613, hudColorIndex, hudColorIndex2)
end
Global.N_0x1ccc708f0f850613 = Global.SetHudColoursSwitch

function Global.SetHudComponentPosition(id, x, y)
	return _in(0xAABB1F56E2A17CED, id, x, y)
end

function Global.SetIgnoreLowPriorityShockingEvents(player, toggle)
	return _in(0x596976B02B6B5700, player, toggle)
end

function Global.SetIgnoreNoGpsFlag(ignore)
	return _in(0x72751156E7678833, ignore)
end

function Global.SetIkTarget(ped, p1, targetPed, boneLookAt, x, y, z, p7, duration, duration1)
	return _in(0xC32779C16FCEECD9, ped, p1, targetPed, boneLookAt, x, y, z, p7, duration, duration1)
end

function Global.SetInitialPlayerStation(radioStation)
	return _in(0x88795F13FACDA88D, _ts(radioStation))
end

function Global.SetInputExclusive(inputGroup, control)
	return _in(0xEDE476E5EE29EDB1, inputGroup, control)
end

function Global.SetInteriorActive(interiorID, toggle)
	return _in(0xE37B76C387BE28ED, interiorID, toggle)
end

function Global.SetLastDrivenVehicle(vehicle)
	return _in(0xACFB2463CC22BED2, vehicle)
end
Global.N_0xacfb2463cc22bed2 = Global.SetLastDrivenVehicle

--- Initializes the text entry for the the text next to a loading prompt. All natives for for building UI texts can be used here
-- e.g
-- void StartLoadingMessage(char *text, int spinnerType = 3)
-- {
-- _SET_LOADING_PROMPT_TEXT_ENTRY("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- _SHOW_LOADING_PROMPT(spinnerType);
-- }
-- /*OR*/
-- void ShowLoadingMessage(char *text, int spinnerType = 3, int timeMs = 10000)
-- {
-- _SET_LOADING_PROMPT_TEXT_ENTRY("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- _SHOW_LOADING_PROMPT(spinnerType);
-- WAIT(timeMs);
-- _REMOVE_LOADING_PROMPT();
-- }
-- These are some localized strings used in the loading spinner.
-- "PM_WAIT"                   = Please Wait
-- "CELEB_WPLYRS"              = Waiting For Players.
-- "CELL_SPINNER2"             = Scanning storage.
-- "ERROR_CHECKYACHTNAME" = Registering your yacht's name. Please wait.
-- "ERROR_CHECKPROFANITY"   = Checking your text for profanity. Please wait.
-- "FM_COR_AUTOD"                        = Just spinner no text
-- "FM_IHELP_WAT2"                        = Waiting for other players
-- "FM_JIP_WAITO"                            = Game options are being set
-- "FMMC_DOWNLOAD"                    = Downloading
-- "FMMC_PLYLOAD"                         = Loading
-- "FMMC_STARTTRAN"                    = Launching session
-- "HUD_QUITTING"                           =  Quiting session
-- "KILL_STRIP_IDM"                         = Waiting for to accept
-- "MP_SPINLOADING"                      = Loading
function Global.SetLoadingPromptTextEntry(string)
	return _in(0xABA17D7CE615ADBF, _ts(string))
end
Global.N_0xaba17d7ce615adbf = Global.SetLoadingPromptTextEntry

function Global.SetLocalPlayerInvisibleLocally(p0)
	return _in(0xE5F773C1A1D9D168, p0)
end

function Global.SetLocalPlayerVisibleInCutscene(p0, p1)
	return _in(0xD1065D68947E7B6E, p0, p1)
end

function Global.SetLocalPlayerVisibleLocally(p0)
	return _in(0x7619364C82D3BF14, p0)
end

--- If toggle is true, the map is shown in full screen
-- If toggle is false, the map is shown in normal mode
function Global.SetMapFullScreen(toggle)
	return _in(0x5354C5BA2EA868A4, toggle)
end
Global.N_0x5354c5ba2ea868a4 = Global.SetMapFullScreen

function Global.SetMaxWantedLevel(maxWantedLevel)
	return _in(0xAA5F02DB48D704B9, maxWantedLevel)
end

--- If this is the correct name, what microphone? I know your TV isn't going to reach out and adjust your headset so..
function Global.SetMicrophonePosition(p0, x1, y1, z1, x2, y2, z2, x3, y3, z3)
	return _in(0xB6AE90EDDE95C762, p0, x1, y1, z1, x2, y2, z2, x3, y3, z3)
end

function Global.SetMinigameInProgress(toggle)
	return _in(0x19E00D7322C6F85B, toggle)
end

--- Argument must be 0.0f or above 38.0f, or it will be ignored.
function Global.SetMinimapAttitudeIndicatorLevel(altitude, p1)
	return _in(0xD201F3FF917A506D, altitude, p1)
end

function Global.SetMinimapBlockWaypoint(toggle)
	return _in(0x58FADDED207897DC, toggle)
end

--- Please change to void.
-- p2 appears to be always -1.
function Global.SetMinimapComponent(p0, p1, p2)
	return _in(0x75A9A10948D1DEA6, p0, p1, p2, _r, _ri)
end

--- If true, the entire map will be revealed.
function Global.SetMinimapRevealed(toggle)
	return _in(0xF8DEE0A5600CBB93, toggle)
end
Global.N_0xf8dee0a5600cbb93 = Global.SetMinimapRevealed

--- If true, the player can't save the game.
-- If the parameter is true, sets the mission flag to true, if the parameter is false, the function does nothing at all.
-- ^ also, if the mission flag is already set, the function does nothing at all
function Global.SetMissionFlag(toggle)
	return _in(0xC4301E5121A0ED73, toggle)
end

function Global.SetMissionName(p0, name)
	return _in(0x5F28ECF5FC84772F, p0, _ts(name))
end

--- p1 is always 0
function Global.SetMissionTrainAsNoLongerNeeded(p1)
	return _in(0xBBE7648349B49BE8, _i, p1)
end

function Global.SetMissionTrainCoords(train, x, y, z)
	return _in(0x591CA673AA6AB736, train, x, y, z)
end

function Global.SetMobilePhonePosition(posX, posY, posZ)
	return _in(0x693A5C6D6734085B, posX, posY, posZ)
end

function Global.SetMobilePhoneRadioState(state)
	return _in(0xBF286C554784F3DF, state)
end

--- Last parameter is unknown and always zero.
function Global.SetMobilePhoneRotation(rotX, rotY, rotZ, p3)
	return _in(0xBB779C0CA917E865, rotX, rotY, rotZ, p3)
end

--- The minimum/default is 500.0f. If you plan to make it bigger set it's position as well. Also this seems to need to be called in a loop as when you close the phone the scale is reset. If not in a loop you'd need to call it everytime before you re-open the phone.
function Global.SetMobilePhoneScale(scale)
	return _in(0xCBDD322A73D6D932, scale)
end

--- Enables Radio on phone.
function Global.SetMobileRadioEnabledDuringGameplay(Toggle)
	return _in(0x1098355A16064BB3, Toggle)
end

--- Unloads model from memory
function Global.SetModelAsNoLongerNeeded(model)
	return _in(0xE532F5D78798DAAB, _ch(model))
end

function Global.SetModelHeadlightConfiguration(modelHash, ratePerSecond, headlightRotation, invertRotation)
	return _in(0x7f6b8d75, _ch(modelHash), ratePerSecond, headlightRotation, invertRotation)
end

--- Note: Look in decompiled scripts and the times that p1 and p2 aren't 0. They are filled with vars. If you look through out that script what other natives those vars are used in, you can tell p1 is a ped and p2 is a vehicle. Which most likely means if you want the mounted weapon to target a ped set targetVehicle to 0 or vice-versa.
function Global.SetMountedWeaponTarget(shootingPed, targetPed, targetVehicle, x, y, z)
	return _in(0xCCD892192C6D2BB9, shootingPed, targetPed, targetVehicle, x, y, z)
end

--- Sets flag's sprite transparency. 0-255.
function Global.SetMpGamerTagAlpha(gamerTagId, component, alpha)
	return _in(0xD48FE545CD46F857, gamerTagId, component, alpha)
end
Global.N_0xd48fe545cd46f857 = Global.SetMpGamerTagAlpha

--- Ranges from 0 to 255. 0 is grey health bar, ~50 yellow, 200 purple.
function Global.SetMpGamerTagColour(gamerTagId, flag, color)
	return _in(0x613ED644950626AE, gamerTagId, flag, color)
end
Global.N_0x613ed644950626ae = Global.SetMpGamerTagColour

--- Ranges from 0 to 255. 0 is grey health bar, ~50 yellow, 200 purple.
-- Should be enabled as flag (2). Has 0 opacity by default.
-- - This was _SET_MP_GAMER_TAG_HEALTH_BAR_COLOR,
function Global.SetMpGamerTagHealthBarColour(headDisplayId, color)
	return _in(0x3158C77A7E888AB4, headDisplayId, color)
end
Global.N_0x3158c77a7e888ab4 = Global.SetMpGamerTagHealthBarColour
Global.SetMpGamerTagHealthBarColor = Global.SetMpGamerTagHealthBarColour

function Global.SetMpGamerTagName(gamerTagId, string)
	return _in(0xDEA2B8283BAA3944, gamerTagId, _ts(string))
end
Global.N_0xdea2b8283baa3944 = Global.SetMpGamerTagName

--- enum MpGamerTagComponent
-- {
-- GAMER_NAME = 0,
-- CREW_TAG,
-- healthArmour,
-- BIG_TEXT,
-- AUDIO_ICON,
-- MP_USING_MENU,
-- MP_PASSIVE_MODE,
-- WANTED_STARS,
-- MP_DRIVER,
-- MP_CO_DRIVER,
-- MP_TAGGED,
-- GAMER_NAME_NEARBY,
-- ARROW,
-- MP_PACKAGES,
-- INV_IF_PED_FOLLOWING,
-- RANK_TEXT,
-- MP_TYPING
-- };
function Global.SetMpGamerTagVisibility(gamerTagId, component, toggle)
	return _in(0x63BB75ABEDC1F6A0, gamerTagId, component, toggle)
end
Global.N_0x63bb75abedc1f6a0 = Global.SetMpGamerTagVisibility

--- displays wanted star above head
function Global.SetMpGamerTagWantedLevel(gamerTagId, wantedlvl)
	return _in(0xCF228E2AA03099C3, gamerTagId, wantedlvl)
end
Global.N_0xcf228e2aa03099c3 = Global.SetMpGamerTagWantedLevel

function Global.SetMultiplayerBankCash()
	return _in(0xDD21B55DF695CD0A)
end

function Global.SetMultiplayerHudCash(p0, p1)
	return _in(0xFD1D220394BCB824, p0, p1)
end

--- Whether or not another player is allowed to take control of the entity
function Global.SetNetworkIdCanMigrate(netId, toggle)
	return _in(0x299EEB23175895FC, netId, toggle)
end

function Global.SetNetworkIdExistsOnAllMachines(netId, toggle)
	return _in(0xE05E81A888FA63C8, netId, toggle)
end

--- not tested....
function Global.SetNetworkIdSyncToPlayer(netId, player, toggle)
	return _in(0xA8A024587329F36A, netId, player, toggle)
end
Global.N_0xa8a024587329f36a = Global.SetNetworkIdSyncToPlayer

function Global.SetNetworkIdVisibleInCutscene(netId, p1, p2)
	return _in(0xA6928482543022B4, netId, p1, p2)
end

function Global.SetNetworkVehicleRespotTimer(netId, p1)
	return _in(0xEC51713AB6EC36E8, netId, p1)
end

function Global.SetNewWaypoint(x, y)
	return _in(0xFE43368D2AA4F2FC, x, y)
end

--- Not used in the scripts.
-- Bullshit! It's used in spawn_activities
function Global.SetNextDesiredMoveState(p0)
	return _in(0xF1B9F16E89E2C93A, p0)
end

--- Sets the next spawn location to the position supplied to _SET_CUSTOM_RESPAWN_POSITION.
function Global.SetNextRespawnToCustom()
	return _in(0xA2716D40842EAF79)
end
Global.N_0xa2716d40842eaf79 = Global.SetNextRespawnToCustom

--- Enables Night Vision.
-- Example:
-- C#: Function.Call(Hash.SET_NIGHTVISION, true);
-- C++: GRAPHICS::SET_NIGHTVISION(true);
-- BOOL toggle:
-- true = turns night vision on for your player.
-- false = turns night vision off for your player.
function Global.SetNightvision(toggle)
	return _in(0x18F621F7A5B1F85D, toggle)
end

function Global.SetNoLoadingScreen(toggle)
	return _in(0x5262CC1995D07E09, toggle)
end

function Global.SetNoiseoveride(toggle)
	return _in(0xE787BF1C5CF823C9, toggle)
end

function Global.SetNoisinessoveride(value)
	return _in(0xCB6A7C3BB17A0C67, value)
end

--- Toggles the North Yankton map
function Global.SetNorthYanktonMap(toggle)
	return _in(0x9133955F1A2DA957, toggle)
end
Global.SetDrawMapVisible = Global.SetNorthYanktonMap

--- From the decompiled scripts:
-- UI::_92F0DA1E27DB96DC(6);
-- UI::_92F0DA1E27DB96DC(184);
-- UI::_92F0DA1E27DB96DC(190);
-- sets background color for the next notification
-- 6 = red
-- 184 = green
-- 190 = yellow
-- this seems to set the alpha to 255 automatically, if you have a work around let me know
function Global.SetNotificationBackgroundColor(hudIndex)
	return _in(0x92F0DA1E27DB96DC, hudIndex)
end
Global.N_0x92f0da1e27db96dc = Global.SetNotificationBackgroundColor

--- sets font color for the next notification
function Global.SetNotificationColorNext(p0)
	return _in(0x39BBF623FC803EAC, p0)
end
Global.N_0x39bbf623fc803eac = Global.SetNotificationColorNext

--- sets color for notification flash
function Global.SetNotificationFlashColor(red, green, blue, alpha)
	return _in(0x17430B918701C342, red, green, blue, alpha)
end
Global.N_0x17430b918701c342 = Global.SetNotificationFlashColor

--- List of picNames: pastebin.com/XdpJVbHz
-- flash is a bool for fading in.
-- iconTypes:
-- 1 : Chat Box
-- 2 : Email
-- 3 : Add Friend Request
-- 4 : Nothing
-- 5 : Nothing
-- 6 : Nothing
-- 7 : Right Jumping Arrow
-- 8 : RP Icon
-- 9 : $ Icon
-- "sender" is the very top header. This can be any old string.
-- "subject" is the header under the sender.
function Global.SetNotificationMessage(picName1, picName2, flash, iconType, sender, subject)
	return _in(0x1CCD9A37359072CF, _ts(picName1), _ts(picName2), flash, iconType, _ts(sender), _ts(subject), _r, _ri)
end

--- List of picNames pastebin.com/XdpJVbHz
-- flash is a bool for fading in.
-- iconTypes:
-- 1 : Chat Box
-- 2 : Email
-- 3 : Add Friend Request
-- 4 : Nothing
-- 5 : Nothing
-- 6 : Nothing
-- 7 : Right Jumping Arrow
-- 8 : RP Icon
-- 9 : $ Icon
-- "sender" is the very top header. This can be any old string.
-- "subject" is the header under the sender.
-- "duration" is a multiplier, so 1.0 is normal, 2.0 is twice as long (very slow), and 0.5 is half as long.
-- "clanTag" shows a crew tag in the "sender" header, after the text. You need to use 3 underscores as padding. Maximum length of this field seems to be 7. (e.g. "MK" becomes "___MK", "ACE" becomes "___ACE", etc.)
function Global.SetNotificationMessageClanTag(picName1, picName2, flash, iconType, sender, subject, duration, clanTag)
	return _in(0x5CBF7BADE20DB93E, _ts(picName1), _ts(picName2), flash, iconType, _ts(sender), _ts(subject), duration, _ts(clanTag), _r, _ri)
end

--- List of picNames: pastebin.com/XdpJVbHz
-- flash is a bool for fading in.
-- iconTypes:
-- 1 : Chat Box
-- 2 : Email
-- 3 : Add Friend Request
-- 4 : Nothing
-- 5 : Nothing
-- 6 : Nothing
-- 7 : Right Jumping Arrow
-- 8 : RP Icon
-- 9 : $ Icon
-- "sender" is the very top header. This can be any old string.
-- "subject" is the header under the sender.
-- "duration" is a multiplier, so 1.0 is normal, 2.0 is twice as long (very slow), and 0.5 is half as long.
-- "clanTag" shows a crew tag in the "sender" header, after the text. You need to use 3 underscores as padding. Maximum length of this field seems to be 7. (e.g. "MK" becomes "___MK", "ACE" becomes "___ACE", etc.)
-- iconType2 is a mirror of iconType. It shows in the "subject" line, right under the original iconType.
-- int IconNotification(char *text, char *text2, char *Subject)
-- {
-- _SET_NOTIFICATION_TEXT_ENTRY("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- _SET_NOTIFICATION_MESSAGE_CLAN_TAG_2("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", 1, 7, text2, Subject, 1.0f, "__EXAMPLE", 7);
-- return _DRAW_NOTIFICATION(1, 1);
-- }
function Global.SetNotificationMessageClanTag_2(picName1, picName2, flash, iconType1, sender, subject, duration, clanTag, iconType2, p9)
	return _in(0x531B84E7DA981FB6, _ts(picName1), _ts(picName2), flash, iconType1, _ts(sender), _ts(subject), duration, _ts(clanTag), iconType2, p9, _r, _ri)
end

--- List of picNames: pastebin.com/XdpJVbHz
function Global.SetNotificationMessage_2(p0, p1, p2, p3, p4, picName1, picName2)
	return _in(0x2B7E9A4EAAA93C89, _ts(p0), p1, p2, p3, p4, _ts(picName1), _ts(picName2), _r, _ri)
end
Global.N_0x2b7e9a4eaaa93c89 = Global.SetNotificationMessage_2

--- Needs more research.
-- Only one type of usage in the scripts:
-- UI::_C6F580E4C94926AC("CHAR_ACTING_UP", "CHAR_ACTING_UP", 0, 0, "DI_FEED_CHAR", a_0);
function Global.SetNotificationMessage_3(picName1, picName2, p2, p3, p4, p5)
	return _in(0xC6F580E4C94926AC, _ts(picName1), _ts(picName2), p2, p3, _ts(p4), _ts(p5), _r, _ri)
end
Global.N_0xc6f580e4c94926ac = Global.SetNotificationMessage_3

--- NOTE: 'duration' is a multiplier, so 1.0 is normal, 2.0 is twice as long (very slow), and 0.5 is half as long.
-- Example, only occurrence in the scripts:
-- v_8 = UI::_1E6611149DB3DB6B("CHAR_SOCIAL_CLUB", "CHAR_SOCIAL_CLUB", 0, 0, &amp;v_9, "", a_5);
function Global.SetNotificationMessage_4(picName1, picName2, flash, iconType, sender, subject, duration)
	return _in(0x1E6611149DB3DB6B, _ts(picName1), _ts(picName2), flash, iconType, _ts(sender), _ts(subject), duration, _r, _ri)
end
Global.N_0x1e6611149db3db6b = Global.SetNotificationMessage_4

--- Declares the entry type of a notification, for example "STRING".
-- int ShowNotification(char *text)
-- {
-- _SET_NOTIFICATION_TEXT_ENTRY("STRING");
-- ADD_TEXT_COMPONENT_SUBSTRING_PLAYER_NAME(text);
-- return _DRAW_NOTIFICATION(1, 1);
-- }
function Global.SetNotificationTextEntry(type)
	return _in(0x202709F4C58A0424, _ts(type))
end

function Global.SetNuiFocus(hasFocus, hasCursor)
	return _in(0x5b98ae30, hasFocus, hasCursor)
end

function Global.SetNumberOfParkedVehicles(value)
	return _in(0xCAA15F13EBD417FF, value, _r, _ri)
end

--- This is an alias of SET_ENTITY_AS_NO_LONGER_NEEDED.
function Global.SetObjectAsNoLongerNeeded(object)
	return _in(0x3AE22DEB5BA5A3E6, _ii(object) --[[ may be optional ]])
end

--- Adjust the physics parameters of a prop, or otherwise known as "object". This is useful for simulated gravity.
-- Other parameters seem to be unknown.
-- p2: seems to be weight and gravity related. Higher value makes the obj fall faster. Very sensitive?
-- p3: seems similar to p2
-- p4: makes obj fall slower the higher the value
-- p5: similar to p4
function Global.SetObjectPhysicsParams(object, weight, p2, p3, p4, p5, gravity, p7, p8, p9, p10, buoyancy)
	return _in(0xF6DF6E90DE7DF90F, object, weight, p2, p3, p4, p5, gravity, p7, p8, p9, p10, buoyancy)
end

function Global.SetObjectTargettable(object, targettable)
	return _in(0x8A7391690F5AFD81, object, targettable, _r, _ri)
end

--- enum ObjectPaintVariants
-- {
-- Pacific = 0,
-- Azure = 1,
-- Nautical = 2,
-- Continental = 3,
-- Battleship = 4,
-- Intrepid = 5,
-- Uniform = 6,
-- Classico = 7,
-- Mediterranean = 8,
-- Command = 9,
-- Mariner = 10,
-- Ruby = 11,
-- Vintage = 12,
-- Pristine = 13,
-- Merchant = 14,
-- Voyager = 15
-- };
function Global.SetObjectTextureVariant(object, paintIndex)
	return _in(0x971DA0055324D033, object, paintIndex)
end
Global.N_0x971da0055324d033 = Global.SetObjectTextureVariant

--- Appears to have an optional bool parameter that is unused in the scripts.
-- If you pass true, something will be set to zero.
function Global.SetOverrideWeather(weatherType)
	return _in(0xA43D5C6FE51ADBEF, _ts(weatherType))
end

--- p0 always seems to be 0
-- duration in milliseconds
-- frequency should range from about 10 (slow vibration) to 255 (very fast)
-- appears to be a hash collision, though it does do what it says
-- example:
-- SET_PAD_SHAKE(0, 100, 200);
function Global.SetPadShake(p0, duration, frequency)
	return _in(0x48B3886C1358D0D5, p0, duration, frequency)
end

function Global.SetParachuteTaskTarget(ped, x, y, z)
	return _in(0xC313379AF0FCEDA7, ped, x, y, z)
end

function Global.SetParachuteTaskThrust(ped, thrust)
	return _in(0x0729BAC1B8C64317, ped, thrust)
end

function Global.SetParkedVehicleDensityMultiplierThisFrame(multiplier)
	return _in(0xEAE6DCC7EEE3DB1D, multiplier)
end

--- console hash: 0xC92719A7
function Global.SetParticleFxAssetOldToNew(oldAsset, newAsset)
	return _in(0xEA1E2D93F6F75ED9, _ts(oldAsset), _ts(newAsset))
end
Global.SetPtfxAssetOld_2New = Global.SetParticleFxAssetOldToNew

--- hash collision
function Global.SetParticleFxBloodScale(p0)
	return _in(0x5F6DF3D92271E8A1, p0)
end

function Global.SetParticleFxCamInsideNonplayerVehicle(p0, p1)
	return _in(0xACEE6F360FC1F6B6, p0, p1)
end

function Global.SetParticleFxCamInsideVehicle(p0)
	return _in(0xEEC4047028426510, p0)
end

function Global.SetParticleFxLoopedAlpha(ptfxHandle, alpha)
	return _in(0x726845132380142E, ptfxHandle, alpha)
end

--- only works on some fx's
-- p4 = 0
function Global.SetParticleFxLoopedColour(ptfxHandle, r, g, b, p4)
	return _in(0x7F8F65877F88783B, ptfxHandle, r, g, b, p4)
end

function Global.SetParticleFxLoopedEvolution(ptfxHandle, propertyName, amount, Id)
	return _in(0x5F0C4B5B1C393BE2, ptfxHandle, _ts(propertyName), amount, Id)
end

function Global.SetParticleFxLoopedOffsets(ptfxHandle, x, y, z, rotX, rotY, rotZ)
	return _in(0xF7DDEBEC43483C43, ptfxHandle, x, y, z, rotX, rotY, rotZ)
end

function Global.SetParticleFxLoopedRange(ptfxHandle, range)
	return _in(0xDCB194B85EF7B541, ptfxHandle, range)
end

function Global.SetParticleFxLoopedScale(ptfxHandle, scale)
	return _in(0xB44250AAA456492D, ptfxHandle, scale)
end

--- Usage example for C#:
-- Function.Call(Hash.SET_PARTICLE_FX_NON_LOOPED_ALPHA, new InputArgument[] { 0.1f });
-- Note: the argument alpha ranges from 0.0f-1.0f !
function Global.SetParticleFxNonLoopedAlpha(alpha)
	return _in(0x77168D722C58B2FC, alpha)
end

--- only works on some fx's
function Global.SetParticleFxNonLoopedColour(r, g, b)
	return _in(0x26143A59EF48B262, r, g, b)
end

function Global.SetParticleFxShootoutBoat(p0)
	return _in(0x96EF97DAEB89BEF5, p0)
end

function Global.SetPauseMenuActive(toggle)
	return _in(0xDF47FC56C71569CF, toggle)
end

--- accuracy = 0-100, 100 being perfectly accurate
function Global.SetPedAccuracy(ped, accuracy)
	return _in(0x7AEFB85C1D49DEB6, ped, accuracy, _r, _ri)
end

--- value ranges from 0 to 3.
function Global.SetPedAlertness(ped, value)
	return _in(0xDBA71115ED9941A6, ped, value)
end

function Global.SetPedAllowVehiclesOverride(ped, toggle)
	return _in(0x3C028C636A414ED9, ped, toggle)
end

function Global.SetPedAllowedToDuck(ped, toggle)
	return _in(0xDA1F1B7BE1A8766F, ped, toggle)
end

--- stance:
-- 0 = idle
-- 1 = walk
-- 2 = running
-- p5 = usually set to true
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.SetPedAlternateMovementAnim(ped, stance, animDictionary, animationName, p4, p5)
	return _in(0x90A43CC281FFAB46, ped, stance, _ts(animDictionary), _ts(animationName), p4, p5)
end

function Global.SetPedAlternateWalkAnim(ped, animDict, animName, p3, p4)
	return _in(0x6C60394CB4F75E9A, ped, _ts(animDict), _ts(animName), p3, p4)
end

function Global.SetPedAmmo(ped, weaponHash, ammo)
	return _in(0x14E56BC5B5DB6A19, ped, _ch(weaponHash), ammo)
end

function Global.SetPedAmmoByType(ped, ammoType, ammo)
	return _in(0x5FD1E1F011E76D7E, ped, ammoType, ammo)
end

function Global.SetPedAmmoToDrop(p0, p1)
	return _in(0xA4EFEF9440A5B0EF, p0, p1)
end

function Global.SetPedAngledDefensiveArea(ped, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	return _in(0xC7F76DF27A5045A1, ped, p1, p2, p3, p4, p5, p6, p7, p8, p9)
end

--- Sets the armor of the specified ped.
-- ped: The Ped to set the armor of.
-- amount: A value between 0 and 100 indicating the value to set the Ped's armor to.
function Global.SetPedArmour(ped, amount)
	return _in(0xCEA04D83135264CC, ped, amount)
end

--- Turns the desired ped into a cop. If you use this on the player ped, you will become almost invisible to cops dispatched for you. You will also report your own crimes, get a generic cop voice, get a cop-vision-cone on the radar, and you will be unable to shoot at other cops. SWAT and Army will still shoot at you. Toggling ped as "false" has no effect; you must change p0's ped model to disable the effect.
function Global.SetPedAsCop(ped, toggle)
	return _in(0xBB03C38DD3FB7FFD, ped, toggle)
end

function Global.SetPedAsEnemy(ped, toggle)
	return _in(0x02A0C9720B854BFA, ped, toggle)
end

function Global.SetPedAsGroupLeader(ped, groupId)
	return _in(0x2A7819605465FBCE, ped, groupId)
end

function Global.SetPedAsGroupMember(ped, groupId)
	return _in(0x9F3480FE65DB31B5, ped, groupId)
end

--- This is an alias of SET_ENTITY_AS_NO_LONGER_NEEDED.
function Global.SetPedAsNoLongerNeeded(ped)
	return _in(0x2595DD4236549CE3, _ii(ped) --[[ may be optional ]])
end

function Global.SetPedBlendFromParents(ped, p1, p2, p3, p4)
	return _in(0x137BBD05230DB22D, ped, p1, p2, p3, p4)
end

function Global.SetPedBoundsOrientation(ped, p1, p2, p3, p4, p5)
	return _in(0x4F5F651ACCC9C4CF, ped, p1, p2, p3, p4, p5)
end

function Global.SetPedCanArmIk(ped, toggle)
	return _in(0x6C3B4D6D13B4C841, ped, toggle)
end

function Global.SetPedCanBeDraggedOut(ped, toggle)
	return _in(0xC1670E958EEE24E5, ped, toggle)
end

--- 0 = can (bike)
-- 1 = can't (bike)
-- 2 = unk
-- 3 = unk
function Global.SetPedCanBeKnockedOffVehicle(ped, state)
	return _in(0x7A6535691B477C48, ped, state)
end

function Global.SetPedCanBeShotInVehicle(ped, toggle)
	return _in(0xC7EF1BA83230BA07, ped, toggle)
end

function Global.SetPedCanBeTargetedWhenInjured(ped, toggle)
	return _in(0x638C03B0F9878F57, ped, toggle)
end

function Global.SetPedCanBeTargetedWithoutLos(ped, toggle)
	return _in(0x4328652AE5769C71, ped, toggle)
end

function Global.SetPedCanBeTargetted(ped, toggle)
	return _in(0x63F58F7C80513AAD, ped, toggle)
end

function Global.SetPedCanBeTargettedByPlayer(ped, player, toggle)
	return _in(0x66B57B72E0836A76, ped, player, toggle)
end

function Global.SetPedCanBeTargettedByTeam(ped, team, toggle)
	return _in(0xBF1CA77833E58F2C, ped, team, toggle)
end

--- It simply makes the said ped to cower behind cover object(wall, desk, car)
-- Peds flee attributes must be set to not to flee, first. Else, most of the peds, will just flee from gunshot sounds or any other panic situations.
function Global.SetPedCanCowerInCover(ped, toggle)
	return _in(0xCB7553CDCEF4A735, ped, toggle)
end

function Global.SetPedCanEvasiveDive(ped, toggle)
	return _in(0x6B7A646C242A7059, ped, toggle)
end

function Global.SetPedCanHeadIk(ped, toggle)
	return _in(0xC11C18092C5530DC, ped, toggle)
end

function Global.SetPedCanLegIk(ped, toggle)
	return _in(0x73518ECE2485412B, ped, toggle)
end

function Global.SetPedCanPeekInCover(ped, toggle)
	return _in(0xC514825C507E3736, ped, toggle)
end

function Global.SetPedCanPlayAmbientAnims(ped, toggle)
	return _in(0x6373D1349925A70E, ped, toggle)
end

function Global.SetPedCanPlayAmbientBaseAnims(ped, toggle)
	return _in(0x0EB0585D15254740, ped, toggle)
end

function Global.SetPedCanPlayGestureAnims(ped, toggle)
	return _in(0xBAF20C5432058024, ped, toggle)
end

--- p2 usually 0
function Global.SetPedCanPlayVisemeAnims(ped, toggle, p2)
	return _in(0xF833DDBA3B104D43, ped, toggle, p2)
end

function Global.SetPedCanRagdoll(ped, toggle)
	return _in(0xB128377056A54E2A, ped, toggle)
end

function Global.SetPedCanRagdollFromPlayerImpact(ped, toggle)
	return _in(0xDF993EE5E90ABA25, ped, toggle)
end

function Global.SetPedCanSmashGlass(ped, p1, p2)
	return _in(0x1CCE141467FF42A2, ped, p1, p2)
end

function Global.SetPedCanSwitchWeapon(ped, toggle)
	return _in(0xED7F7EFE9FABF340, ped, toggle)
end

--- This only will teleport the ped to the group leader if the group leader teleports (sets coords).
-- Only works in singleplayer
function Global.SetPedCanTeleportToGroupLeader(pedHandle, groupHandle, toggle)
	return _in(0x2E2F4240B3F24647, pedHandle, groupHandle, toggle)
end

function Global.SetPedCanTorsoIk(ped, toggle)
	return _in(0xF2B7106D37947CE0, ped, toggle)
end

function Global.SetPedCanUseAutoConversationLookat(ped, toggle)
	return _in(0xEC4686EC06434678, ped, toggle)
end

--- Overrides the ped's collision capsule radius for the current tick.
-- Must be called every tick to be effective.
-- Setting this to 0.001 will allow warping through some objects.
function Global.SetPedCapsule(ped, value)
	return _in(0x364DF566EC833DE2, ped, value)
end

function Global.SetPedChanceOfFiringBlanks(ped, xBias, yBias)
	return _in(0x8378627201D5497D, ped, xBias, yBias)
end

function Global.SetPedClothProne(p0, p1)
	return _in(0x82A3D6D9CC2CB8E3, p0, p1)
end
Global.N_0x82a3d6d9cc2cb8e3 = Global.SetPedClothProne

--- 100 would equal attack
-- less then 50ish would mean run away
-- Only the values 0, 1 and 2 occur in the decompiled scripts. Most likely refers directly to the values also described in combatbehaviour.meta:
-- 0: CA_Poor
-- 1: CA_Average
-- 2: CA_Professional
-- Tested this and got the same results as the first explanation here. Could not find any difference between 0, 1 and 2.
function Global.SetPedCombatAbility(ped, p1)
	return _in(0xC7622C0D36B2FDA8, ped, p1)
end

--- These combat attributes seem to be the same as the BehaviourFlags from combatbehaviour.meta.
-- So far, these are the equivalents found:
-- enum CombatAttributes
-- {
-- BF_CanUseCover = 0,
-- BF_CanUseVehicles = 1,
-- BF_CanDoDrivebys = 2,
-- BF_CanLeaveVehicle = 3,
-- BF_CanFightArmedPedsWhenNotArmed = 5,
-- BF_CanTauntInVehicle = 20,
-- BF_AlwaysFight = 46,
-- BF_IgnoreTrafficWhenDriving = 52,
-- BF_FreezeMovement = 292,
-- BF_PlayerCanUseFiringWeapons = 1424
-- };
-- 8 = ?
-- 9 = ?
-- 13 = ?
-- 14 ?
-- Research thread: gtaforums.com/topic/833391-researchguide-combat-behaviour-flags/
function Global.SetPedCombatAttributes(ped, attributeIndex, enabled)
	return _in(0x9F7794730795E019, ped, attributeIndex, enabled)
end

--- 0 - Stationary (Will just stand in place)
-- 1 - Defensive (Will try to find cover and very likely to blind fire)
-- 2 - Offensive (Will attempt to charge at enemy but take cover as well)
-- 3 - Suicidal Offensive (Will try to flank enemy in a suicidal attack)
function Global.SetPedCombatMovement(ped, combatMovement)
	return _in(0x4D9CA1009AFBD057, ped, combatMovement)
end

--- Only the values 0, 1 and 2 occur in the decompiled scripts. Most likely refers directly to the values also described as AttackRange in combatbehaviour.meta:
-- 0: CR_Near
-- 1: CR_Medium
-- 2: CR_Far
function Global.SetPedCombatRange(ped, p1)
	return _in(0x3C606747B23E497B, ped, p1)
end

--- paletteId/palletColor -  0 to 3.
-- enum PedVariationData
-- {
-- PED_VARIATION_FACE = 0,
-- PED_VARIATION_HEAD = 1,
-- PED_VARIATION_HAIR = 2,
-- PED_VARIATION_TORSO = 3,
-- PED_VARIATION_LEGS = 4,
-- PED_VARIATION_HANDS = 5,
-- PED_VARIATION_FEET = 6,
-- PED_VARIATION_EYES = 7,
-- PED_VARIATION_ACCESSORIES = 8,
-- PED_VARIATION_TASKS = 9,
-- PED_VARIATION_TEXTURES = 10,
-- PED_VARIATION_TORSO2 = 11
-- };
-- Usage:
-- SET_PED_COMPONENT_VARIATION(playerPed, PED_VARIATION_FACE, GET_NUMBER_OF_PED_DRAWABLE_VARIATIONS(playerPed, PED_VARIATION_FACE), GET_NUMBER_OF_PED_TEXTURE_VARIATIONS(playerPed, PED_VARIATION_FACE, 0), 2);
-- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.SetPedComponentVariation(ped, componentId, drawableId, textureId, paletteId)
	return _in(0x262B14F48D29DE80, ped, componentId, drawableId, textureId, paletteId)
end

--- Research help : pastebin.com/fPL1cSwB
-- New items added with underscore as first char
-- -----------------------------------------------------------------------
-- enum PedConfigFlags
-- {
-- PED_FLAG_CAN_FLY_THRU_WINDSCREEN = 32,
-- PED_FLAG_DIES_BY_RAGDOLL = 33,
-- PED_FLAG_NO_COLLISION = 52,
-- _PED_FLAG_IS_SHOOTING = 58,
-- _PED_FLAG_IS_ON_GROUND = 60,
-- PED_FLAG_NO_COLLIDE = 62,
-- PED_FLAG_DEAD = 71,
-- PED_FLAG_IS_SNIPER_SCOPE_ACTIVE = 72,
-- PED_FLAG_SUPER_DEAD = 73,
-- _PED_FLAG_IS_IN_AIR = 76,
-- PED_FLAG_IS_AIMING = 78,
-- PED_FLAG_DRUNK = 100,
-- _PED_FLAG_IS_NOT_RAGDOLL_AND_NOT_PLAYING_ANIM = 104,
-- PED_FLAG_NO_PLAYER_MELEE = 122,
-- PED_FLAG_NM_MESSAGE_466 = 125,
-- PED_FLAG_INJURED_LIMP = 166,
-- PED_FLAG_INJURED_LIMP_2 = 170,
-- PED_FLAG_INJURED_DOWN = 187,
-- PED_FLAG_SHRINK = 223,
-- PED_FLAG_MELEE_COMBAT = 224,
-- _PED_FLAG_IS_ON_STAIRS = 253,
-- _PED_FLAG_HAS_ONE_LEG_ON_GROUND = 276,
-- PED_FLAG_NO_WRITHE = 281,
-- PED_FLAG_FREEZE = 292,
-- PED_FLAG_IS_STILL = 301,
-- PED_FLAG_NO_PED_MELEE = 314,
-- _PED_SWITCHING_WEAPON = 331,
-- PED_FLAG_ALPHA = 410,
-- };
-- (*) When flagId is set to 33 and the bool value to true, peds will die by starting ragdoll, so you should set this flag to false when you resurrect a ped.
-- When flagId is set to 62 and the boolvalue to false this happens: Ped is taken out of vehicle and can't get back in when jacking their empty vehicle. If in a plane it falls from the sky and crashes. Sometimes peds vehicle continue to drive the route without its driver who's running after.
-- (*)
-- JUMPING CHANGES  60,61,104 TO FALSE
-- BEING ON WATER CHANGES 60,61 TO FALSE AND 65,66,168 TO TRUE
-- FALLING CHANGES 60,61,104,276 TO FALSE AND TO 76 TRUE
-- DYING CHANGES 60,61,104,276* TO FALSE AND (NONE) TO TRUE
-- DYING MAKES 60,61,104 TO FALSE
-- BEING IN A CAR CHANGES 60,79,104 TO FALSE AND 62 TO TRUE
-- (*)Maximum value for flagId is 0x1AA (426) in b944.
-- ID 0xF0 (240) appears to be a special flag which is handled different compared to the others IDs.
function Global.SetPedConfigFlag(ped, flagId, value)
	return _in(0x1913FE4CBF41C463, ped, flagId, value)
end

--- teleports ped to coords along with the vehicle ped is in
function Global.SetPedCoordsKeepVehicle(ped, posX, posY, posZ)
	return _in(0x9AFEFF481A85AB2E, ped, posX, posY, posZ)
end

function Global.SetPedCoordsNoGang(ped, posX, posY, posZ)
	return _in(0x87052FE446E07247, ped, posX, posY, posZ)
end

--- p1: Only "CODE_HUMAN_STAND_COWER" found in the b617d scripts.
function Global.SetPedCowerHash(ped, p1)
	return _in(0xA549131166868ED3, ped, _ts(p1))
end

--- Has 5 parameters since latest patches.
function Global.SetPedCurrentWeaponVisible(ped, visible, deselectWeapon, p3, p4)
	return _in(0x0725A4CCFDED9A70, ped, visible, deselectWeapon, p3, p4)
end

--- Applies an Item from a PedDecorationCollection to a ped. These include tattoos and shirt decals.
-- collection - PedDecorationCollection filename hash
-- overlay - Item name hash
-- Example:
-- Entry inside "mpbeach_overlays.xml" -
-- &lt;Item&gt;
-- &lt;uvPos x="0.500000" y="0.500000" /&gt;
-- &lt;scale x="0.600000" y="0.500000" /&gt;
-- &lt;rotation value="0.000000" /&gt;
-- &lt;nameHash&gt;FM_Hair_Fuzz&lt;/nameHash&gt;
-- &lt;txdHash&gt;mp_hair_fuzz&lt;/txdHash&gt;
-- &lt;txtHash&gt;mp_hair_fuzz&lt;/txtHash&gt;
-- &lt;zone&gt;ZONE_HEAD&lt;/zone&gt;
-- &lt;type&gt;TYPE_TATTOO&lt;/type&gt;
-- &lt;faction&gt;FM&lt;/faction&gt;
-- &lt;garment&gt;All&lt;/garment&gt;
-- &lt;gender&gt;GENDER_DONTCARE&lt;/gender&gt;
-- &lt;award /&gt;
-- &lt;awardLevel /&gt;
-- &lt;/Item&gt;
-- Code:
-- PED::_0x5F5D1665E352A839(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("mpbeach_overlays"), GAMEPLAY::GET_HASH_KEY("fm_hair_fuzz"))
function Global.SetPedDecoration(ped, collection, overlay)
	return _in(0x5F5D1665E352A839, ped, _ch(collection), _ch(overlay))
end
Global.ApplyPedOverlay = Global.SetPedDecoration

--- Sets Ped Default Clothes
function Global.SetPedDefaultComponentVariation(ped)
	return _in(0x45EEE61580806D63, ped)
end

function Global.SetPedDefensiveAreaAttachedToPed(ped, attachPed, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return _in(0x4EF47FE21698A8B6, ped, attachPed, p2, p3, p4, p5, p6, p7, p8, p9, p10)
end

function Global.SetPedDefensiveAreaDirection(ped, p1, p2, p3, p4)
	return _in(0x413C6C763A4AFFAD, ped, p1, p2, p3, p4)
end

function Global.SetPedDefensiveSphereAttachedToPed(ped, target, xOffset, yOffset, zOffset, radius, p6)
	return _in(0xF9B8F91AAD3B953E, ped, target, xOffset, yOffset, zOffset, radius, p6)
end
Global.N_0xf9b8f91aad3b953e = Global.SetPedDefensiveSphereAttachedToPed

--- ??? Usage
-- ??? Use this native inside a looped function.
-- ??? Values:
-- ??? 0.0 = no peds on streets
-- ??? 1.0 = normal peds on streets
function Global.SetPedDensityMultiplierThisFrame(multiplier)
	return _in(0x95E3D6257B166CF2, multiplier)
end

function Global.SetPedDesiredHeading(ped, heading)
	return _in(0xAA5A7ECE2AA8FE70, ped, heading)
end

function Global.SetPedDesiredMoveBlendRatio(ped, p1)
	return _in(0x1E982AC8716912C5, ped, p1)
end

function Global.SetPedDiesInSinkingVehicle(ped, toggle)
	return _in(0xD718A22995E2B4BC, ped, toggle)
end

function Global.SetPedDiesInVehicle(ped, toggle)
	return _in(0x2A30922C90C9B42C, ped, toggle)
end

function Global.SetPedDiesInWater(ped, toggle)
	return _in(0x56CEF0AC79073BDE, ped, toggle)
end

function Global.SetPedDiesInstantlyInWater(ped, toggle)
	return _in(0xEEB64139BA29A7CF, ped, toggle)
end

function Global.SetPedDiesWhenInjured(ped, toggle)
	return _in(0x5BA7919BED300023, ped, toggle, _r, _ri)
end

function Global.SetPedDriveByClipsetOverride(ped, clipset)
	return _in(0xED34AB6C5CB36520, ped, _ts(clipset))
end

function Global.SetPedDropsInventoryWeapon(ped, weaponHash, xOffset, yOffset, zOffset, p5)
	return _in(0x208A1888007FC0E6, ped, _ch(weaponHash), xOffset, yOffset, zOffset, p5)
end

function Global.SetPedDropsWeapon(ped)
	return _in(0x6B7513D9966FBEC0, ped)
end

function Global.SetPedDropsWeaponsWhenDead(ped, toggle)
	return _in(0x476AE72C1D19D1A8, ped, toggle)
end

--- This is the SET_CHAR_DUCKING from GTA IV, that makes Peds duck. This function does nothing in GTA V. It cannot set the ped as ducking in vehicles, and IS_PED_DUCKING will always return false.
function Global.SetPedDucking(ped, toggle)
	return _in(0x030983CA930B692D, ped, toggle)
end

function Global.SetPedEnableWeaponBlocking(ped, toggle)
	return _in(0x97A790315D3831FD, ped, toggle, _r, _ri)
end

--- This is a hash collision...
-- _IS_VEHICLE_NEAR_ENTITY
function Global.SetPedEnabledBikeRingtone(vehicle, entity)
	return _in(0x57715966069157AD, vehicle, entity, _r)
end

--- Previously named _0xD30C50DF888D58B5, this native turns on the AI blip on the specified ped. It also disappears automatically when the ped is too far or if the ped is dead. You don't need to control it with other natives.
-- See gtaforums.com/topic/884370-native-research-ai-blips for further information.
function Global.SetPedEnemyAiBlip(pedHandle, showViewCones)
	return _in(0xD30C50DF888D58B5, pedHandle, showViewCones)
end
Global.N_0xd30c50df888d58b5 = Global.SetPedEnemyAiBlip

--- Values look to be between 0.0 and 1.0
-- From decompiled scripts: 0.0, 0.6, 0.65, 0.8, 1.0
-- You are correct, just looked in IDA it breaks from the function if it's less than 0.0f or greater than 1.0f.
function Global.SetPedEnveffScale(ped, value)
	return _in(0xBF29516833893561, ped, value)
end

--- Used for freemode (online) characters.
-- For some reason, the scripts use a rounded float for the index.
function Global.SetPedEyeColor(ped, index)
	return _in(0x50B56988B170AFDF, ped, index)
end

--- Sets the various freemode face features, e.g. nose length, chin shape. Scale ranges from -1.0 to 1.0.
-- Index can be 0
function Global.SetPedFaceFeature(ped, index, scale)
	return _in(0x71A5C1DBA060049E, ped, index, scale)
end

--- Console Hash: 0x8CD3E487
function Global.SetPedFacialDecoration(ped, collection, overlay)
	return _in(0x5619BFA07CFD7833, ped, _ch(collection), _ch(overlay))
end
Global.N_0x5619bfa07cfd7833 = Global.SetPedFacialDecoration

--- FIRING_PATTERN_BURST_FIRE = 0xD6FF6D61 ( 1073727030 )
-- FIRING_PATTERN_BURST_FIRE_IN_COVER = 0x026321F1 ( 40051185 )
-- FIRING_PATTERN_BURST_FIRE_DRIVEBY = 0xD31265F2 ( -753768974 )
-- FIRING_PATTERN_FROM_GROUND = 0x2264E5D6 ( 577037782 )
-- FIRING_PATTERN_DELAY_FIRE_BY_ONE_SEC = 0x7A845691 ( 2055493265 )
-- FIRING_PATTERN_FULL_AUTO = 0xC6EE6B4C ( -957453492 )
-- FIRING_PATTERN_SINGLE_SHOT = 0x5D60E4E0 ( 1566631136 )
-- FIRING_PATTERN_BURST_FIRE_PISTOL = 0xA018DB8A ( -1608983670 )
-- FIRING_PATTERN_BURST_FIRE_SMG = 0xD10DADEE ( 1863348768 )
-- FIRING_PATTERN_BURST_FIRE_RIFLE = 0x9C74B406 ( -1670073338 )
-- FIRING_PATTERN_BURST_FIRE_MG = 0xB573C5B4 ( -1250703948 )
-- FIRING_PATTERN_BURST_FIRE_PUMPSHOTGUN = 0x00BAC39B ( 12239771 )
-- FIRING_PATTERN_BURST_FIRE_HELI = 0x914E786F ( -1857128337 )
-- FIRING_PATTERN_BURST_FIRE_MICRO = 0x42EF03FD ( 1122960381 )
-- FIRING_PATTERN_SHORT_BURSTS = 0x1A92D7DF ( 445831135 )
-- FIRING_PATTERN_SLOW_FIRE_TANK = 0xE2CA3A71 ( -490063247 )
-- if anyone is interested firing pattern info: pastebin.com/Px036isB
function Global.SetPedFiringPattern(ped, patternHash)
	return _in(0x9AC577F5A12AD8A9, ped, _ch(patternHash))
end

--- Bool probably has something to do with vehicles, maybe if the ped can use vehicle to flee?
-- Values used as attributes are those in sequence of powers of two, 1, 2, 4, 8, 16, 32, 64.... 65536.
function Global.SetPedFleeAttributes(ped, attributes, p2)
	return _in(0x70A2D1137C8ED7C9, ped, attributes, p2)
end

--- p1/gadgetHash was always 0xFBAB5776 ("GADGET_PARACHUTE").
-- p2 is always true.
function Global.SetPedGadget(ped, gadgetHash, p2)
	return _in(0xD0D7B1E680ED4A1A, ped, _ch(gadgetHash), p2)
end

function Global.SetPedGeneratesDeadBodyEvents(ped, toggle)
	return _in(0x7FB17BA2E7DECA5B, ped, toggle)
end

--- From the scripts:
-- PED::SET_PED_GESTURE_GROUP(PLAYER::PLAYER_PED_ID(),
-- "ANIM_GROUP_GESTURE_MISS_FRA0");
-- PED::SET_PED_GESTURE_GROUP(PLAYER::PLAYER_PED_ID(),
-- "ANIM_GROUP_GESTURE_MISS_DocksSetup1");
function Global.SetPedGestureGroup(ped, animGroupGesture)
	return _in(0xDDF803377F94AAA8, ped, _ts(animGroupGesture))
end

function Global.SetPedGetOutUpsideDownVehicle(ped, toggle)
	return _in(0xBC0ED94165A48BC2, ped, toggle)
end

function Global.SetPedGravity(ped, toggle)
	return _in(0x9FF447B6B6AD960A, ped, toggle)
end

function Global.SetPedGroupMemberPassengerIndex(ped, index)
	return _in(0x0BDDB8D9EC6BCF3C, ped, index)
end

--- Used for freemode (online) characters.
function Global.SetPedHairColor(ped, colorID, highlightColorID)
	return _in(0x4CFFC65454C93A49, ped, colorID, highlightColorID)
end

--- The "shape" parameters control the shape of the ped's face. The "skin" parameters control the skin tone. ShapeMix and skinMix control how much the first and second IDs contribute,(typically mother and father.) ThirdMix overrides the others in favor of the third IDs. IsParent is set for "children" of the player character's grandparents during old-gen character creation. It has unknown effect otherwise.
-- The IDs start at zero and go Male Non-DLC, Female Non-DLC, Male DLC, and Female DLC.
-- !!!Can someone add working example for this???
-- try this:
-- headBlendData headData;
-- _GET_PED_HEAD_BLEND_DATA(PLAYER_PED_ID(), &amp;headData);
-- SET_PED_HEAD_BLEND_DATA(PLAYER_PED_ID(), headData.shapeFirst, headData.shapeSecond, headData.shapeThird, headData.skinFirst, headData.skinSecond
-- , headData.skinThird, headData.shapeMix, headData.skinMix, headData.skinThird, 0);
-- For more info please refer to this topic.
-- gtaforums.com/topic/858970-all-gtao-face-ids-pedset-ped-head-blend-data-explained
function Global.SetPedHeadBlendData(ped, shapeFirstID, shapeSecondID, shapeThirdID, skinFirstID, skinSecondID, skinThirdID, shapeMix, skinMix, thirdMix, isParent)
	return _in(0x9414E18B9434C2FE, ped, shapeFirstID, shapeSecondID, shapeThirdID, skinFirstID, skinSecondID, skinThirdID, shapeMix, skinMix, thirdMix, isParent)
end

--- OverlayID ranges from 0 to 12, index from 0 to _GET_NUM_OVERLAY_VALUES(overlayID)-1, and opacity from 0.0 to 1.0.
-- overlayID       Part                  Index, to disable
-- 0               Blemishes             0 - 23, 255
-- 1               Facial Hair           0 - 28, 255
-- 2               Eyebrows              0 - 33, 255
-- 3               Ageing                0 - 14, 255
-- 4               Makeup                0 - 74, 255
-- 5               Blush                 0 - 6, 255
-- 6               Complexion            0 - 11, 255
-- 7               Sun Damage            0 - 10, 255
-- 8               Lipstick              0 - 9, 255
-- 9               Moles/Freckles        0 - 17, 255
-- 10              Chest Hair            0 - 16, 255
-- 11              Body Blemishes        0 - 11, 255
-- 12              Add Body Blemishes    0 - 1, 255
function Global.SetPedHeadOverlay(ped, overlayID, index, opacity)
	return _in(0x48F44967FA05CC1E, ped, overlayID, index, opacity)
end

--- Used for freemode (online) characters.
-- ColorType is 1 for eyebrows, beards, and chest hair; 2 for blush and lipstick; and 0 otherwise, though not called in those cases.
-- Called after SET_PED_HEAD_OVERLAY().
function Global.SetPedHeadOverlayColor(ped, overlayID, colorType, colorID, secondColorID)
	return _in(0x497BF74A7B9CB952, ped, overlayID, colorType, colorID, secondColorID)
end

function Global.SetPedHearingRange(ped, value)
	return _in(0x33A8F7F7D5F7F33C, ped, value)
end

function Global.SetPedHelmet(ped, canWearHelmet)
	return _in(0x560A43136EB58105, ped, canWearHelmet)
end

function Global.SetPedHelmetFlag(ped, helmetFlag)
	return _in(0xC0E78D5C2CE3EB25, ped, helmetFlag)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.SetPedHelmetPropIndex(ped, propIndex)
	return _in(0x26D83693ED99291C, ped, propIndex)
end

function Global.SetPedHelmetTextureIndex(ped, textureIndex)
	return _in(0xF1550C4BD22582E2, ped, textureIndex)
end

function Global.SetPedIdRange(ped, value)
	return _in(0xF107E836A70DCE05, ped, value)
end

--- PED::SET_PED_IN_VEHICLE_CONTEXT(l_128, GAMEPLAY::GET_HASH_KEY("MINI_PROSTITUTE_LOW_PASSENGER"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(l_128, GAMEPLAY::GET_HASH_KEY("MINI_PROSTITUTE_LOW_RESTRICTED_PASSENGER"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(l_3212, GAMEPLAY::GET_HASH_KEY("MISS_FAMILY1_JIMMY_SIT"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(l_3212, GAMEPLAY::GET_HASH_KEY("MISS_FAMILY1_JIMMY_SIT_REAR"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(l_95, GAMEPLAY::GET_HASH_KEY("MISS_FAMILY2_JIMMY_BICYCLE"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(num3, GAMEPLAY::GET_HASH_KEY("MISSFBI2_MICHAEL_DRIVEBY"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("MISS_ARMENIAN3_FRANKLIN_TENSE"));
-- PED::SET_PED_IN_VEHICLE_CONTEXT(PLAYER::PLAYER_PED_ID(), GAMEPLAY::GET_HASH_KEY("MISSFBI5_TREVOR_DRIVING"));
function Global.SetPedInVehicleContext(ped, context)
	return _in(0x530071295899A8C6, ped, _ch(context))
end

function Global.SetPedInfiniteAmmo(ped, toggle, weaponHash)
	return _in(0x3EDCB0505123623B, ped, toggle, _ch(weaponHash))
end

function Global.SetPedInfiniteAmmoClip(ped, toggle)
	return _in(0x183DADC6AA953186, ped, toggle)
end

--- Ped: The ped to warp.
-- vehicle: The vehicle to warp the ped into.
-- Seat_Index: [-1 is driver seat, -2 first free passenger seat]
-- Moreinfo of Seat Index
-- DriverSeat = -1
-- Passenger = 0
-- Left Rear = 1
-- RightRear = 2
function Global.SetPedIntoVehicle(ped, vehicle, seatIndex)
	return _in(0xF75B0D629E1C063D, ped, vehicle, seatIndex)
end

--- Sets the ped drunk sounds.  Only works with PLAYER_PED_ID
-- ====================================================
-- As mentioned above, this only sets the drunk sound to ped/player.
-- To give the Ped a drunk effect with drunk walking animation try using SET_PED_MOVEMENT_CLIPSET
-- Below is an example
-- if (!Function.Call&lt;bool&gt;(Hash.HAS_ANIM_SET_LOADED, "move_m@drunk@verydrunk"))
-- {
-- Function.Call(Hash.REQUEST_ANIM_SET, "move_m@drunk@verydrunk");
-- }
-- Function.Call(Hash.SET_PED_MOVEMENT_CLIPSET, Ped.Handle, "move_m@drunk@verydrunk", 0x3E800000);
-- And to stop the effect use
-- RESET_PED_MOVEMENT_CLIPSET
function Global.SetPedIsDrunk(ped, toggle)
	return _in(0x95D2D383D5396B8A, ped, toggle)
end

function Global.SetPedKeepTask(ped, toggle)
	return _in(0x971D38760FBC02EF, ped, toggle)
end

--- "IK" stands for "Inverse kinematics." I assume this has something to do with how the ped uses his legs to balance. In the scripts, the second parameter is always an int with a value of 2, 0, or sometimes 1
function Global.SetPedLegIkMode(ped, mode)
	return _in(0xC396F5B86FF9FEBD, ped, mode)
end

function Global.SetPedLodMultiplier(ped, multiplier)
	return _in(0xDC2C5C242AAC342B, ped, multiplier)
end

function Global.SetPedMaxHealth(ped, value)
	return _in(0xF5F6378C4F3419D3, ped, value)
end

function Global.SetPedMaxMoveBlendRatio(ped, value)
	return _in(0x433083750C5E064A, ped, value)
end

function Global.SetPedMaxTimeInWater(ped, value)
	return _in(0x43C851690662113D, ped, value)
end

function Global.SetPedMaxTimeUnderwater(ped, value)
	return _in(0x6BA428C528D9E522, ped, value)
end

--- Ped will stay on the ground after being stunned for at lest ms time. (in milliseconds)
function Global.SetPedMinGroundTimeForStungun(ped, ms)
	return _in(0xFA0675AB151073FA, ped, ms)
end

function Global.SetPedMinMoveBlendRatio(ped, value)
	return _in(0x01A898D26E2333DD, ped, value)
end

function Global.SetPedModelIsSuppressed(ped, toggle)
	return _in(0xE163A4BCE4DE6F11, ped, toggle)
end

--- Maximum possible amount of money on MP is 2000. ~JX
-- -----------------------------------------------------------------------------
-- Maximum amount that a ped can theoretically have is 65535 (0xFFFF) since the amount is stored as an unsigned short (uint16_t) value.
function Global.SetPedMoney(ped, amount)
	return _in(0xA9C8960E8684C1B5, ped, amount)
end

function Global.SetPedMotionBlur(ped, toggle)
	return _in(0x0A986918B102B448, ped, toggle)
end

function Global.SetPedMoveAnimsBlendOut(ped)
	return _in(0x9E8C908F41584ECD, ped)
end

--- Min: 0.00
-- Max: 10.00
-- Can be used in combo with fast run cheat.
-- When value is set to 10.00:
-- Sprinting without fast run cheat: 66 m/s
-- Sprinting with fast run cheat: 77 m/s
-- Does not need to be looped!
-- Note: According to IDA for the Xbox360 xex, when they check bgt they seem to have the min to 0.0f, but the max set to 1.15f not 10.0f.
function Global.SetPedMoveRateOverride(ped, value)
	return _in(0x085BF80FA50A39D1, ped, value)
end

--- p2 is usually 1.0f
-- EDIT 12/24/16:
-- p2 does absolutely nothing no matter what the value is.
-- List of movement clipsets:
-- Thanks to elsewhat for list.
-- "ANIM_GROUP_MOVE_BALLISTIC"
-- "ANIM_GROUP_MOVE_LEMAR_ALLEY"
-- "clipset@move@trash_fast_turn"
-- "FEMALE_FAST_RUNNER"
-- "missfbi4prepp1_garbageman"
-- "move_characters@franklin@fire"
-- "move_characters@Jimmy@slow@"
-- "move_characters@michael@fire"
-- "move_f@flee@a"
-- "move_f@scared"
-- "move_f@sexy@a"
-- "move_heist_lester"
-- "move_injured_generic"
-- "move_lester_CaneUp"
-- "move_m@bag"
-- "MOVE_M@BAIL_BOND_NOT_TAZERED"
-- "MOVE_M@BAIL_BOND_TAZERED"
-- "move_m@brave"
-- "move_m@casual@d"
-- "move_m@drunk@moderatedrunk"
-- "MOVE_M@DRUNK@MODERATEDRUNK"
-- "MOVE_M@DRUNK@MODERATEDRUNK_HEAD_UP"
-- "MOVE_M@DRUNK@SLIGHTLYDRUNK"
-- "MOVE_M@DRUNK@VERYDRUNK"
-- "move_m@fire"
-- "move_m@gangster@var_e"
-- "move_m@gangster@var_f"
-- "move_m@gangster@var_i"
-- "move_m@JOG@"
-- "MOVE_M@PRISON_GAURD"
-- "MOVE_P_M_ONE"
-- "MOVE_P_M_ONE_BRIEFCASE"
-- "move_p_m_zero_janitor"
-- "move_p_m_zero_slow"
-- "move_ped_bucket"
-- "move_ped_crouched"
-- "move_ped_mop"
-- "MOVE_M@FEMME@"
-- "MOVE_F@FEMME@"
-- "MOVE_M@GANGSTER@NG"
-- "MOVE_F@GANGSTER@NG"
-- "MOVE_M@POSH@"
-- "MOVE_F@POSH@"
-- "MOVE_M@TOUGH_GUY@"
-- "MOVE_F@TOUGH_GUY@"
-- ~ NotCrunchyTaco
function Global.SetPedMovementClipset(ped, clipSet, p2)
	return _in(0xAF8A94EDE7712BEF, ped, _ts(clipSet), p2)
end

--- Stops speech.
function Global.SetPedMute(ped)
	return _in(0x7A73D05A607734C7, ped)
end
Global.N_0x7a73d05a607734c7 = Global.SetPedMute

--- NOTE: Debugging functions are not present in the retail version of the game.
-- *untested but char *name could also be a hash for a localized string
function Global.SetPedNameDebug(ped, name)
	return _in(0x98EFA132A4117BE1, ped, _ts(name))
end

function Global.SetPedNeverLeavesGroup(ped, toggle)
	return _in(0x3DBFC55D5C9BB447, ped, toggle)
end

--- The distance between these points, is the diagonal of a box (remember it's 3D).
function Global.SetPedNonCreationArea(x1, y1, z1, x2, y2, z2)
	return _in(0xEE01041D559983EA, x1, y1, z1, x2, y2, z2)
end

function Global.SetPedParachuteTintIndex(ped, tintIndex)
	return _in(0x333FC8DB079B7186, ped, tintIndex)
end

function Global.SetPedPathAvoidFire(ped, avoidFire)
	return _in(0x4455517B28441E60, ped, avoidFire)
end

function Global.SetPedPathCanDropFromHeight(ped, Toggle)
	return _in(0xE361C5C71C431A4F, ped, Toggle)
end

function Global.SetPedPathCanUseClimbovers(ped, Toggle)
	return _in(0x8E06A6FE76C9EFF4, ped, Toggle, _r, _ri)
end

function Global.SetPedPathCanUseLadders(ped, Toggle)
	return _in(0x77A5B103C87F476E, ped, Toggle, _r, _ri)
end

function Global.SetPedPathPreferToAvoidWater(ped, avoidWater)
	return _in(0x38FE1EC73743793C, ped, avoidWater)
end

function Global.SetPedPathsBackToOriginal(p0, p1, p2, p3, p4, p5)
	return _in(0xE04B48F2CC926253, p0, p1, p2, p3, p4, p5)
end

function Global.SetPedPathsInArea(x1, y1, z1, x2, y2, z2, unknown)
	return _in(0x34F060F4BF92E018, x1, y1, z1, x2, y2, z2, unknown)
end

--- Hash collision!!! Actual name: SET_PED_PATH_MAY_ENTER_WATER
function Global.SetPedPathsWidthPlant(ped, mayEnterWater)
	return _in(0xF35425A4204367EC, ped, mayEnterWater)
end

--- i could be time. Only example in the decompiled scripts uses it as -1.
function Global.SetPedPinnedDown(ped, pinned, i)
	return _in(0xAAD6D1ACF08F4612, ped, pinned, i, _r, _ri)
end

--- Points to the same function as for example GET_RANDOM_VEHICLE_MODEL_IN_MEMORY and it does absolutely nothing.
function Global.SetPedPlaysHeadOnHornAnimWhenDiesInVehicle(ped, toggle)
	return _in(0x94D94BF1A75AED3D, ped, toggle)
end

function Global.SetPedPopulationBudget(p0)
	return _in(0x8C95333CFC3340F3, p0)
end

function Global.SetPedPreferredCoverSet(ped, itemSet)
	return _in(0x8421EB4DA7E391B9, ped, itemSet)
end
Global.N_0x8421eb4da7e391b9 = Global.SetPedPreferredCoverSet

--- This is only called once in the scripts.
-- sub_1CD9(&amp;l_49, 0, getElem(3, &amp;l_34, 4), "MICHAEL", 0, 1);
-- sub_1CA8("WORLD_HUMAN_SMOKING", 2);
-- PED::SET_PED_PRIMARY_LOOKAT(getElem(3, &amp;l_34, 4), PLAYER::PLAYER_PED_ID());
function Global.SetPedPrimaryLookat(ped, lookAt)
	return _in(0xCD17B554996A8D9E, ped, lookAt)
end

--- ComponentId can be set to various things based on what category you're wanting to set
-- enum PedPropsData
-- {
-- PED_PROP_HATS = 0,
-- PED_PROP_GLASSES = 1,
-- PED_PROP_EARS = 2,
-- PED_PROP_WATCHES = 3,
-- };
-- Usage: SET_PED_PROP_INDEX(playerPed, PED_PROP_HATS, GET_NUMBER_OF_PED_PROP_DRAWABLE_VARIATIONS(playerPed, PED_PROP_HATS), GET_NUMBER_OF_PED_PROP_TEXTURE_VARIATIONS(playerPed, PED_PROP_HATS, 0), TRUE);
-- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.SetPedPropIndex(ped, componentId, drawableId, TextureId, attach)
	return _in(0x93376B65A266EB5F, ped, componentId, drawableId, TextureId, attach)
end

--- Works for both player and peds, but some flags don't seem to work for the player (1, for example)
-- 1 - Blocks ragdolling when shot.
-- 2 - Blocks ragdolling when hit by a vehicle. The ped still might play a falling animation.
-- 4 - Blocks ragdolling when set on fire.
-- -----------------------------------------------------------------------
-- There seem to be 26 flags
function Global.SetPedRagdollBlockingFlags(ped, flags)
	return _in(0x26695EC767728D84, ped, flags)
end
Global.N_0x26695ec767728d84 = Global.SetPedRagdollBlockingFlags

function Global.SetPedRagdollForceFall(ped)
	return _in(0x01F6594B923B9251, ped, _r, _ri)
end

--- Causes Ped to ragdoll on collision with any object (e.g Running into trashcan). If applied to player you will sometimes trip on the sidewalk.
function Global.SetPedRagdollOnCollision(ped, toggle)
	return _in(0xF0A4F1BBF4FA7497, ped, toggle)
end

--- p1 is always false in R* scripts.
-- Quick disassembly seems to indicate that p1 is unused.
-- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.SetPedRandomComponentVariation(ped, p1)
	return _in(0xC8A9481A01E63C28, ped, p1)
end

--- List of component/props ID
-- gtaxscripting.blogspot.com/2016/04/gta-v-peds-component-and-props.html
function Global.SetPedRandomProps(ped)
	return _in(0xC44AA05345C992C6, ped)
end

function Global.SetPedRelationshipGroupDefaultHash(ped, hash)
	return _in(0xADB3F206518799E8, ped, _ch(hash))
end

function Global.SetPedRelationshipGroupHash(ped, hash)
	return _in(0xC80A74AC829DDD92, ped, _ch(hash))
end

function Global.SetPedReserveParachuteTintIndex(ped, p1)
	return _in(0xE88DA0751C22A2AD, ped, p1)
end

--- PED::SET_PED_RESET_FLAG(PLAYER::PLAYER_PED_ID(), 240, 1);
function Global.SetPedResetFlag(ped, flagId, doReset)
	return _in(0xC1E8A365BF3B29F2, ped, flagId, doReset)
end

--- Assigns some ambient voice to the ped.
function Global.SetPedScream(ped)
	return _in(0x40CF0D12D142A9E8, ped)
end
Global.N_0x40cf0d12d142a9e8 = Global.SetPedScream

function Global.SetPedSeeingRange(ped, value)
	return _in(0xF29CF591C4BF6CEE, ped, value)
end

--- shootRate 0-1000
function Global.SetPedShootRate(ped, shootRate)
	return _in(0x614DA022990752DC, ped, shootRate)
end

function Global.SetPedShootsAtCoord(ped, x, y, z, toggle)
	return _in(0x96A05E4FB321B1BA, ped, x, y, z, toggle)
end

function Global.SetPedSphereDefensiveArea(ped, x, y, z, radius, p5, p6)
	return _in(0x9D3151A373974804, ped, x, y, z, radius, p5, p6)
end

function Global.SetPedStayInVehicleWhenJacked(ped, toggle)
	return _in(0xEDF4079F9D54C9A1, ped, toggle)
end

--- p1 is usually 0 in the scripts. action is either 0 or a pointer to "DEFAULT_ACTION".
function Global.SetPedStealthMovement(ped, p1, action)
	return _in(0x88CBB5CEB96B7BD2, ped, p1, _ts(action))
end

function Global.SetPedSteersAroundObjects(ped, toggle)
	return _in(0x1509C089ADC208BF, ped, toggle)
end

function Global.SetPedSteersAroundPeds(ped, toggle)
	return _in(0x46F2193B3AD1D891, ped, toggle)
end

function Global.SetPedSteersAroundVehicles(ped, toggle)
	return _in(0xEB6FB9D48DDE23EC, ped, toggle)
end

function Global.SetPedStrafeClipset(ped, clipSet)
	return _in(0x29A28F3F8CF6D854, ped, _ts(clipSet))
end

--- ped cannot be headshot if this is set to false
function Global.SetPedSuffersCriticalHits(ped, toggle)
	return _in(0xEBD76F2359F190AC, ped, toggle)
end

--- Sweat is set to 100.0 or 0.0 in the decompiled scripts.
function Global.SetPedSweat(ped, sweat)
	return _in(0x27B0405F59637D1F, ped, sweat)
end

--- Speech related.
function Global.SetPedTalk(ped)
	return _in(0x4ADA3F19BE4A6047, ped)
end
Global.N_0x4ada3f19be4a6047 = Global.SetPedTalk

--- Only 1 and 2 appear in the scripts. combatbehaviour.meta seems to only have TLR_SearchForTarget for all peds, but we don't know if that's 1 or 2.
function Global.SetPedTargetLossResponse(ped, responseType)
	return _in(0x0703B9079823DA4A, ped, responseType)
end

--- destroyType is 1 for opens on damage, 2 for breaks on damage.
function Global.SetPedTargettableVehicleDestroy(vehicle, vehicleComponent, destroyType)
	return _in(0xBE70724027F85BCD, vehicle, vehicleComponent, destroyType)
end

function Global.SetPedToInformRespectedFriends(ped, radius, maxFriends)
	return _in(0x112942C6E708F70B, ped, radius, maxFriends)
end

function Global.SetPedToLoadCover(ped, toggle)
	return _in(0x332B562EEDA62399, ped, toggle)
end

--- time1- Time Ped is in ragdoll mode(ms)
-- time2- Unknown time, in milliseconds
-- ragdollType-
-- 0 : Normal ragdoll
-- 1 : Falls with stiff legs/body
-- 2 : Narrow leg stumble(may not fall)
-- 3 : Wide leg stumble(may not fall)
-- p4, p5, p6- No idea. In R*'s scripts they are usually either "true, true, false" or "false, false, false".
-- EDIT 3/11/16: unclear what 'mircoseconds' mean-- a microsecond is 1000x a ms, so time2 must be 1000x time1?  more testing needed.  -sob
-- Edit Mar 21, 2017: removed part about time2 being the microseconds version of time1. this just isn't correct. time2 is in milliseconds, and time1 and time2 don't seem to be connected in any way.
function Global.SetPedToRagdoll(ped, time1, time2, ragdollType, p4, p5, p6)
	return _in(0xAE99FB955581844A, ped, time1, time2, ragdollType, p4, p5, p6, _r)
end

--- Return variable is never used in R*'s scripts.
-- Not sure what p2 does. It seems like it would be a time judging by it's usage in R*'s scripts, but didn't seem to affect anything in my testings.
-- x, y, and z are coordinates, most likely to where the ped will fall.
-- p7 is probably the force of the fall, but untested, so I left the variable name the same.
-- p8 to p13 are always 0f in R*'s scripts.
-- (Simplified) Example of the usage of the function from R*'s scripts:
-- ped::set_ped_to_ragdoll_with_fall(ped, 1500, 2000, 1, -entity::get_entity_forward_vector(ped), 1f, 0f, 0f, 0f, 0f, 0f, 0f);
function Global.SetPedToRagdollWithFall(ped, time, p2, ragdollType, x, y, z, p7, p8, p9, p10, p11, p12, p13)
	return _in(0xD76632D99E4966C8, ped, time, p2, ragdollType, x, y, z, p7, p8, p9, p10, p11, p12, p13, _r)
end

--- p2 is usually -1 in the scripts. action is either 0 or "DEFAULT_ACTION".
function Global.SetPedUsingActionMode(ped, p1, p2, action)
	return _in(0xD75ACCF5E0FB5367, ped, p1, p2, _ts(action))
end

function Global.SetPedVisualFieldCenterAngle(ped, angle)
	return _in(0x3B6405E8AB34A907, ped, angle)
end

function Global.SetPedVisualFieldMaxAngle(ped, value)
	return _in(0x70793BDCA1E854D4, ped, value)
end

--- This native refers to the field of vision the ped has above them, starting at 0 degrees. 90f would let the ped see enemies directly above of them.
function Global.SetPedVisualFieldMaxElevationAngle(ped, angle)
	return _in(0x78D0B67629D75856, ped, angle)
end

function Global.SetPedVisualFieldMinAngle(ped, value)
	return _in(0x2DB492222FB21E26, ped, value)
end

--- This native refers to the field of vision the ped has below them, starting at 0 degrees. The angle value should be negative.
function Global.SetPedVisualFieldMinElevationAngle(ped, angle)
	return _in(0x7A276EB2C224D70F, ped, angle)
end

function Global.SetPedVisualFieldPeripheralRange(ped, range)
	return _in(0x9C74B0BC831B753A, ped, range)
end

function Global.SetPedWaypointRouteOffset(p0, p1, p2, p3)
	return _in(0xED98E10B0AFCE4B4, p0, p1, p2, p3, _r, _ri)
end

function Global.SetPedWeaponMovementClipset(ped, clipSet)
	return _in(0x2622E35B77D3ACA2, ped, _ts(clipSet))
end

--- tintIndex can be the following:
-- 1
-- 2
-- 3
-- 4
-- 5
-- 6
-- 7
function Global.SetPedWeaponTintIndex(ped, weaponHash, tintIndex)
	return _in(0x50969B9B89ED5738, ped, _ch(weaponHash), tintIndex)
end

--- combined with PED::SET_PED_WETNESS_HEIGHT(), this native makes the ped drenched in water up to the height specified in the other function
function Global.SetPedWetnessEnabledThisFrame(ped)
	return _in(0xB5485E4907B53019, ped)
end

--- It adds the wetness level to the player clothing/outfit. As if player just got out from water surface.
function Global.SetPedWetnessHeight(ped, height)
	return _in(0x44CB6447D2571AA0, ped, height)
end

--- if the bool "Toggle" is "true" so the phone is lean.
-- if the bool "Toggle" is "false" so the phone is not lean.
function Global.SetPhoneLean(Toggle)
	return _in(0x44E44169EF70138E, Toggle)
end

function Global.SetPickupRegenerationTime(p0, p1)
	return _in(0x78015C9B4B3ECC9D, p0, p1)
end

function Global.SetPlaneMinHeightAboveGround(plane, height)
	return _in(0xB893215D8D4C015B, plane, height)
end
Global.N_0xb893215d8d4c015b = Global.SetPlaneMinHeightAboveGround

function Global.SetPlaybackSpeed(vehicle, speed)
	return _in(0x6683AB880E427778, vehicle, speed)
end

function Global.SetPlaybackToUseAi(vehicle, flag)
	return _in(0xA549C3B37EA28131, vehicle, flag)
end

function Global.SetPlaybackToUseAiTryToRevertBackLater(p0, p1, p2, p3)
	return _in(0x6E63860BBB190730, p0, p1, p2, p3)
end

--- Hash collision! Disables speech.
function Global.SetPlayerAngry(playerPed, disabled)
	return _in(0xEA241BB04110F091, playerPed, disabled)
end

--- Sets the position of the arrow icon representing the player on both the minimap and world map.
-- Too bad this wouldn't work over the network (obviously not). Could spoof where we would be.
function Global.SetPlayerBlipPositionThisFrame(x, y)
	return _in(0x77E2DD177910E1CF, x, y)
end

--- Sets whether this player can be hassled by gangs.
function Global.SetPlayerCanBeHassledByGangs(player, toggle)
	return _in(0xD5E460AD7020A246, player, toggle)
end

--- Set whether this player should be able to do drive-bys.
-- "A drive-by is when a ped is aiming/shooting from vehicle. This includes middle finger taunts. By setting this value to false I confirm the player is unable to do all that. Tested on tick."
function Global.SetPlayerCanDoDriveBy(player, toggle)
	return _in(0x6E8834B52EC20C77, player, toggle)
end

function Global.SetPlayerCanLeaveParachuteSmokeTrail(player, enabled)
	return _in(0xF401B182DBA8AF53, player, enabled)
end

--- Sets whether this player can take cover.
function Global.SetPlayerCanUseCover(player, toggle)
	return _in(0xD465A8599DFF6814, player, toggle, _r, _ri)
end

--- Displays cash change notifications on HUD.
function Global.SetPlayerCashChange(cash, bank)
	return _in(0x0772DF77852C2E30, cash, bank)
end
Global.SetSingleplayerHudCash = Global.SetPlayerCashChange

--- 6 matches across 4 scripts. 5 occurrences were 240. The other was 255.
function Global.SetPlayerClothLockCounter(value)
	return _in(0x14D913B777DFF5DA, value)
end

--- Every occurrence was either 0 or 2.
function Global.SetPlayerClothPackageIndex(index)
	return _in(0x9F7BBA2EA6372500, index)
end

--- Every occurrence of p1 I found was true.1.0.335.2, 1.0.350.1/2, 1.0.372.2, 1.0.393.2, 1.0.393.4, 1.0.463.1;
function Global.SetPlayerClothPinFrames(player, toggle)
	return _in(0x749FADDF97DFE930, player, toggle)
end

--- Flags used in the scripts: 0,4,16,24,32,56,60,64,128,134,256,260,384,512,640,768,896,900,952,1024,1280,2048,2560
-- Note to people who needs this with camera mods, etc.:
-- Flags(0, 4, 16, 24, 32, 56, 60, 64, 128, 134, 512, 640, 1024, 2048, 2560)
-- - Disables camera rotation as well.
-- Flags(256, 260, 384, 768, 896, 900, 952, 1280)
function Global.SetPlayerControl(player, toggle, possiblyFlags)
	return _in(0x8D32347D6D4C40A2, player, toggle, possiblyFlags)
end

function Global.SetPlayerForceSkipAimIntro(player, toggle)
	return _in(0x7651BC64AE59E128, player, toggle)
end

function Global.SetPlayerForcedAim(player, toggle)
	return _in(0x0FEE4F80AC44A726, player, toggle)
end

function Global.SetPlayerForcedZoom(player, toggle)
	return _in(0x75E7D505F2B15902, player, toggle)
end

function Global.SetPlayerHasReserveParachute(player)
	return _in(0x7DDAB28D31FAC363, player)
end

function Global.SetPlayerHealthRechargeMultiplier(player, regenRate)
	return _in(0x5DB660B38DD98A31, player, regenRate)
end

--- Hash collision
function Global.SetPlayerInvertedUp()
	return _in(0x08C2D6C52A3104BB, _r, _ri)
end

--- Simply sets you as invincible (Health will not deplete).
-- Use 0x733A643B5B0C53C1 instead if you want Ragdoll enabled, which is equal to:
-- *(DWORD *)(playerPedAddress + 0x188) |= (1 &lt;&lt; 9);
function Global.SetPlayerInvincible(player, toggle)
	return _in(0x239528EACDC3E7DE, player, toggle)
end

function Global.SetPlayerInvisibleLocally(player, toggle)
	return _in(0x12B37D54667DB0B8, player, toggle)
end

--- Example from fm_mission_controler.ysc.c4:
-- PLAYER::SET_PLAYER_LOCKON(PLAYER::PLAYER_ID(), 1);
-- All other decompiled scripts using this seem to be using the player id as the first parameter, so I feel the need to confirm it as so.
-- No need to confirm it says PLAYER_ID() so it uses PLAYER_ID() lol.
function Global.SetPlayerLockon(player, toggle)
	return _in(0x5C8B2F450EE4328E, player, toggle)
end

--- Affects the range of auto aim target.
function Global.SetPlayerLockonRangeOverride(player, range)
	return _in(0x29961D490E5814FD, player, range)
end

--- Default is 100. Use player id and not ped id. For instance: PLAYER::SET_PLAYER_MAX_ARMOUR(PLAYER::PLAYER_ID(), 100); // main_persistent.ct4
function Global.SetPlayerMaxArmour(player, value)
	return _in(0x77DFCCF5948B8C71, player, value)
end

function Global.SetPlayerMayNotEnterAnyVehicle(player)
	return _in(0x1DE37BBF9E9CC14A, player)
end

function Global.SetPlayerMayOnlyEnterThisVehicle(player, vehicle)
	return _in(0x8026FF78F208978A, player, vehicle)
end

function Global.SetPlayerMeleeWeaponDamageModifier(player, modifier)
	return _in(0x4A3DC7ECCC321032, player, modifier)
end

function Global.SetPlayerMeleeWeaponDefenseModifier(player, modifier)
	return _in(0xAE540335B4ABC4E2, player, modifier)
end

--- Make sure to request the model first and wait until it has loaded.
function Global.SetPlayerModel(player, model)
	return _in(0x00A1CADD00108836, player, _ch(model))
end

function Global.SetPlayerNoiseMultiplier(player, multiplier)
	return _in(0xDB89EF50FF25FCE9, player, multiplier)
end

--- example:
-- PLAYER::SET_PLAYER_PARACHUTE_MODEL_OVERRIDE(PLAYER::PLAYER_ID(), 0x73268708);
function Global.SetPlayerParachuteModelOverride(player, model)
	return _in(0x977DB4641F6FC3DB, player, _ch(model))
end

function Global.SetPlayerParachutePackModelOverride(player, model)
	return _in(0xDC80A4C2F18A2B64, player, _ch(model))
end

--- tints 0
-- 1
-- 2
-- 3
-- 4
function Global.SetPlayerParachutePackTintIndex(player, tintIndex)
	return _in(0x93B0FB27C9A04060, player, tintIndex)
end

function Global.SetPlayerParachuteSmokeTrailColor(player, r, g, b)
	return _in(0x8217FD371A4625CF, player, r, g, b)
end

--- Tints:
-- None = -1,
-- Rainbow = 0,
-- Red = 1,
-- SeasideStripes = 2,
-- WidowMaker = 3,
-- Patriot = 4,
-- Blue = 5,
-- Black = 6,
-- Hornet = 7,
-- AirFocce = 8,
-- Desert = 9,
-- Shadow = 10,
-- HighAltitude = 11,
-- Airbone = 12,
-- Sunrise = 13,
function Global.SetPlayerParachuteTintIndex(player, tintIndex)
	return _in(0xA3D0E54541D9A5E5, player, tintIndex)
end

--- p1 was always 5.
-- p4 was always false.
function Global.SetPlayerParachuteVariationOverride(player, p1, p2, p3, p4)
	return _in(0xD9284A8C0D48352C, player, p1, p2, p3, p4)
end

--- Tints:
-- None = -1,
-- Rainbow = 0,
-- Red = 1,
-- SeasideStripes = 2,
-- WidowMaker = 3,
-- Patriot = 4,
-- Blue = 5,
-- Black = 6,
-- Hornet = 7,
-- AirFocce = 8,
-- Desert = 9,
-- Shadow = 10,
-- HighAltitude = 11,
-- Airbone = 12,
-- Sunrise = 13,
function Global.SetPlayerReserveParachuteTintIndex(player, index)
	return _in(0xAF04C87F5DC1DF38, player, index)
end

--- example:
-- flags: 0-6
-- PLAYER::SET_PLAYER_RESET_FLAG_PREFER_REAR_SEATS(PLAYER::PLAYER_ID(), 6);
-- wouldnt the flag be the seatIndex?
function Global.SetPlayerResetFlagPreferRearSeats(player, flags)
	return _in(0x11D5F725F0E780E0, player, flags)
end

function Global.SetPlayerSimulateAiming(player, toggle)
	return _in(0xC54C95DA968EC5B5, player, toggle)
end

--- Values around 1.0f to 2.0f used in game scripts.
function Global.SetPlayerSneakingNoiseMultiplier(player, multiplier)
	return _in(0xB2C1A29588A9F47C, player, multiplier)
end

function Global.SetPlayerSprint(player, toggle)
	return _in(0xA01B8075D8B92DF4, player, toggle)
end

function Global.SetPlayerStealthPerceptionModifier(player, value)
	return _in(0x4E9021C1FCDD507A, player, value)
end

function Global.SetPlayerSwitchOutro(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0xC208B673CE446B61, p0, p1, p2, p3, p4, p5, p6, p7, p8)
end
Global.N_0xc208b673ce446b61 = Global.SetPlayerSwitchOutro

--- Sets your targeting mode.
-- 0 = Traditional GTA
-- 1 = Assisted Aiming
-- 2 = Free Aim
-- Even tho gtaforums nor Alexander B supports this, if you're online in freemode already it's nice to have this since retail or otherwise you have to go to SP to change it.
function Global.SetPlayerTargetingMode(targetMode)
	return _in(0xB1906895227793F3, targetMode)
end

--- Set player team on deathmatch and last team standing..
function Global.SetPlayerTeam(player, team)
	return _in(0x0299FA38396A4940, player, team)
end

function Global.SetPlayerVehicleDamageModifier(player, damageAmount)
	return _in(0xA50E117CDDF82F0C, player, damageAmount)
end

function Global.SetPlayerVehicleDefenseModifier(player, modifier)
	return _in(0x4C60E6EFDAFF2462, player, modifier)
end

function Global.SetPlayerVisibleLocally(player, toggle)
	return _in(0xFAA10F1FAFB11AF2, player, toggle)
end

--- # Predominant call signatures
-- PLAYER::SET_PLAYER_WANTED_CENTRE_POSITION(PLAYER::PLAYER_ID(), ENTITY::GET_ENTITY_COORDS(PLAYER::PLAYER_PED_ID(), 1));
-- # Parameter value ranges
-- P0: PLAYER::PLAYER_ID()
-- P1: ENTITY::GET_ENTITY_COORDS(PLAYER::PLAYER_PED_ID(), 1)
-- P2: Not set by any call
function Global.SetPlayerWantedCentrePosition(player, p2, p3)
	return _in(0x520E541A97A13354, player, _v, p2, p3)
end

--- Call SET_PLAYER_WANTED_LEVEL_NOW for immediate effect
-- wantedLevel is an integer value representing 0 to 5 stars even though the game supports the 6th wanted level but no police will appear since no definitions are present for it in the game files
-- disableNoMission-  Disables When Off Mission- appears to always be false
function Global.SetPlayerWantedLevel(player, wantedLevel, disableNoMission)
	return _in(0x39FF19C64EF7DA5B, player, wantedLevel, disableNoMission)
end

--- p2 is always false in R* scripts
function Global.SetPlayerWantedLevelNoDrop(player, wantedLevel, p2)
	return _in(0x340E61DE7F471565, player, wantedLevel, p2)
end

--- Forces any pending wanted level to be applied to the specified player immediately.
-- Call SET_PLAYER_WANTED_LEVEL with the desired wanted level, followed by SET_PLAYER_WANTED_LEVEL_NOW.
-- Second parameter is unknown (always false).
function Global.SetPlayerWantedLevelNow(player, p1)
	return _in(0xE0A7D1E497FFCD6F, player, p1)
end

--- This modifies the damage value of your weapon. Whether it is a multiplier or base damage is unknown.
-- Based on tests, it is unlikely to be a multiplier.
function Global.SetPlayerWeaponDamageModifier(player, damageAmount)
	return _in(0xCE07B9F7817AADA3, player, damageAmount)
end

function Global.SetPlayerWeaponDefenseModifier(player, modifier)
	return _in(0x2D83BC011CA14A3C, player, modifier)
end

function Global.SetPlayerpadShakesWhenControllerDisabled(toggle)
	return _in(0x798FDEB5B1575088, toggle)
end

function Global.SetPlayersLastVehicle(vehicle)
	return _in(0xBCDF8BAF56C87B6A, vehicle, _r, _ri)
end

function Global.SetPoliceIgnorePlayer(player, toggle)
	return _in(0x32C62AA929C2DA6A, player, toggle)
end

function Global.SetPoliceRadarBlips(toggle)
	return _in(0x43286D561B72B8BF, toggle)
end

function Global.SetRadarAsExteriorThisFrame()
	return _in(0xE81B7D2A3DAB2D81)
end

--- List of interior hashes: pastebin.com/1FUyXNqY
-- Not for every interior zoom &gt; 0 available.
function Global.SetRadarAsInteriorThisFrame(interior, x, y, z, zoom)
	return _in(0x59E727A1C9D3E31A, _ch(interior), x, y, z, zoom)
end

--- Toggles the big minimap state like in GTA:Online.
function Global.SetRadarBigmapEnabled(toggleBigMap, showFullMap)
	return _in(0x231C8F89D0539D8F, toggleBigMap, showFullMap)
end

--- zoomLevel ranges from 0 to 200
function Global.SetRadarZoom(zoomLevel)
	return _in(0x096EF57A0C999BBA, zoomLevel)
end

function Global.SetRadarZoomLevelThisFrame(zoomLevel)
	return _in(0xCB7CC0D58405AD41, zoomLevel)
end

function Global.SetRadioAutoUnfreeze(toggle)
	return _in(0xC1AA9F53CE982990, toggle)
end

--- Sets radio station by index.
function Global.SetRadioToStationIndex(radioStation)
	return _in(0xA619B168B8A8570F, radioStation)
end

--- For a full list, see here: pastebin.com/Kj9t38KF
function Global.SetRadioToStationName(stationName)
	return _in(0xC69EDA28699D5107, _ts(stationName))
end

--- Only found this one in the decompiled scripts:
-- AUDIO::SET_RADIO_TRACK("RADIO_03_HIPHOP_NEW", "ARM1_RADIO_STARTS");
function Global.SetRadioTrack(radioStation, radioTrack)
	return _in(0xB39786F201FEE30B, _ts(radioStation), _ts(radioTrack))
end

--- puddles, rain fx on ground/buildings/puddles, rain sound
function Global.SetRainFxIntensity(intensity)
	return _in(0x643E26EA6E024D92, intensity)
end

function Global.SetRandomBoats(toggle)
	return _in(0x84436EC293B1415F, toggle, _r, _ri)
end

--- If the parameter is true, sets the random event flag to true, if the parameter is false, the function does nothing at all.
-- Does nothing if the mission flag is set.
function Global.SetRandomEventFlag(p0)
	return _in(0x971927086CFD2158, p0)
end

function Global.SetRandomSeed(time)
	return _in(0x444D98F98C11F3EC, time)
end

function Global.SetRandomTrains(toggle)
	return _in(0x80D9F74197EA47D9, toggle)
end

function Global.SetRandomVehicleDensityMultiplierThisFrame(multiplier)
	return _in(0xB3B3359379FE77D3, multiplier)
end

function Global.SetRandomWeatherType()
	return _in(0x8B05F884CF7E8020)
end

function Global.SetReducePedModelBudget(toggle)
	return _in(0x77B5F9A36BF96710, toggle)
end

function Global.SetReduceVehicleModelBudget(toggle)
	return _in(0x80C527893080CCF3, toggle)
end

--- Sets the relationship between two groups. This should be called twice (once for each group).
-- Relationship types:
-- 0 = Companion
-- 1 = Respect
-- 2 = Like
-- 3 = Neutral
-- 4 = Dislike
-- 5 = Hate
-- 255 = Pedestrians
-- Example:
-- PED::SET_RELATIONSHIP_BETWEEN_GROUPS(2, l_1017, 0xA49E591C);
-- PED::SET_RELATIONSHIP_BETWEEN_GROUPS(2, 0xA49E591C, l_1017);
function Global.SetRelationshipBetweenGroups(relationship, group1, group2)
	return _in(0xBF25EB89375A37AD, relationship, _ch(group1), _ch(group2))
end

--- makes the train all jumbled up and derailed as it moves on the tracks (though that wont stop it from its normal operations)
function Global.SetRenderTrainAsDerailed(train, toggle)
	return _in(0x317B11A312DF5534, train, toggle)
end

function Global.SetResourceKvp(key, value)
	return _in(0x21c7a35b, _ts(key), _ts(value))
end

function Global.SetResourceKvpFloat(key, value)
	return _in(0x9add2938, _ts(key), value)
end

function Global.SetResourceKvpInt(key, value)
	return _in(0x6a2b1e8, _ts(key), value)
end

--- missing a last parameter int p6
function Global.SetRoadsBackToOriginal(p0, p1, p2, p3, p4, p5)
	return _in(0x1EE7063B80FFC77C, p0, p1, p2, p3, p4, p5)
end

--- bool p7 - always 1
function Global.SetRoadsBackToOriginalInAngledArea(x1, y1, z1, x2, y2, z2, p6)
	return _in(0x0027501B9F3B407E, x1, y1, z1, x2, y2, z2, p6)
end

--- /* Corrected conflicting parameter names */
function Global.SetRoadsInAngledArea(x1, y1, z1, x2, y2, z2, angle, unknown1, unknown2, unknown3)
	return _in(0x1A5AA1208AF5DB59, x1, y1, z1, x2, y2, z2, angle, unknown1, unknown2, unknown3)
end

--- /* Corrected conflicting parameter names */
function Global.SetRoadsInArea(x1, y1, z1, x2, y2, z2, unknown1, unknown2)
	return _in(0xBF1A602B5BA52FEE, x1, y1, z1, x2, y2, z2, unknown1, unknown2)
end

--- Multiplier goes up to 1.49 any value above will be completely overruled by the game and the multiplier will not take effect, this can be edited in memory however.
-- Just call it one time, it is not required to be called once every tick.
-- Note: At least the IDA method if you change the max float multiplier from 1.5 it will change it for both this and SWIM above. I say 1.5 as the function blrs if what you input is greater than or equal to 1.5 hence why it's 1.49 max default.
function Global.SetRunSprintMultiplierForPlayer(player, multiplier)
	return _in(0x6DB47AA77FD94E09, player, multiplier)
end

function Global.SetSaveHouse(p0, p1, p2)
	return _in(0x4F548CABEAE553BC, p0, p1, p2)
end

--- The bool is not a toggle!!!
function Global.SetSaveMenuActive(unk)
	return _in(0xC9BF75D28165FF77, unk)
end

function Global.SetScaleformMovieAsNoLongerNeeded(scaleformHandle)
	return _in(0x1D132D614DD86811, _ii(scaleformHandle) --[[ may be optional ]])
end

function Global.SetScaleformMovieToUseSystemTime(scaleform, toggle)
	return _in(0x6D8EB211944DCE08, scaleform, toggle)
end

--- Occurrences in the b617d scripts: pastebin.com/Tvg2PRHU
function Global.SetScenarioGroupEnabled(scenarioGroup, p1)
	return _in(0x02C8E5B49848664E, _ts(scenarioGroup), p1)
end

function Global.SetScenarioPedDensityMultiplierThisFrame(p0, p1)
	return _in(0x7A556143A1C03898, p0, p1)
end

function Global.SetScenarioPedsSpawnInSphereArea(p0, p1, p2, p3, p4)
	return _in(0x28157D43CF600981, p0, p1, p2, p3, p4)
end

--- Sets a value indicating whether scenario peds should be returned by the next call to a command that returns peds. Eg. GET_CLOSEST_PED.
function Global.SetScenarioPedsToBeReturnedByNextCommand(value)
	return _in(0x14F19A8782C8071E, value)
end

--- seems to enable/disable specific scenario-types from happening in the game world.
-- Here are some scenario types from the scripts:
-- "WORLD_MOUNTAIN_LION_REST"
-- "WORLD_MOUNTAIN_LION_WANDER"
-- "DRIVE"
-- "WORLD_VEHICLE_POLICE_BIKE"
-- "WORLD_VEHICLE_POLICE_CAR"
-- "WORLD_VEHICLE_POLICE_NEXT_TO_CAR"
-- "WORLD_VEHICLE_DRIVE_SOLO"
-- "WORLD_VEHICLE_BIKER"
-- "WORLD_VEHICLE_DRIVE_PASSENGERS"
-- "WORLD_VEHICLE_SALTON_DIRT_BIKE"
-- "WORLD_VEHICLE_BICYCLE_MOUNTAIN"
-- "PROP_HUMAN_SEAT_CHAIR"
-- "WORLD_VEHICLE_ATTRACTOR"
-- "WORLD_HUMAN_LEANING"
-- "WORLD_HUMAN_HANG_OUT_STREET"
-- "WORLD_HUMAN_DRINKING"
-- "WORLD_HUMAN_SMOKING"
-- "WORLD_HUMAN_GUARD_STAND"
-- "WORLD_HUMAN_CLIPBOARD"
-- "WORLD_HUMAN_HIKER"
-- "WORLD_VEHICLE_EMPTY"
-- "WORLD_VEHICLE_BIKE_OFF_ROAD_RACE"
-- "WORLD_HUMAN_PAPARAZZI"
-- "WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN"
-- "WORLD_VEHICLE_PARK_PARALLEL"
-- "WORLD_VEHICLE_CONSTRUCTION_SOLO"
-- "WORLD_VEHICLE_CONSTRUCTION_PASSENGERS"
-- "WORLD_VEHICLE_TRUCK_LOGS"
-- -alphazolam
-- scenarioType could be the same as scenarioName, used in for example AI::TASK_START_SCENARIO_AT_POSITION.
function Global.SetScenarioTypeEnabled(scenarioType, toggle)
	return _in(0xEB47EC4E34FB7EE1, _ts(scenarioType), toggle)
end

--- For a full list, see here: pastebin.com/yLNWicUi
function Global.SetScriptAsNoLongerNeeded(scriptName)
	return _in(0xC90D2DCACD56184C, _ts(scriptName))
end

--- Only called once in the decompiled scripts. Presumably activates the specified generator.
function Global.SetScriptVehicleGenerator(vehicleGenerator, enabled)
	return _in(0xD9D620E0AC6DC4B0, vehicleGenerator, enabled)
end

function Global.SetScriptWithNameHashAsNoLongerNeeded(scriptHash)
	return _in(0xC5BC038960E9DB27, _ch(scriptHash))
end
Global.SetStreamedScriptAsNoLongerNeeded = Global.SetScriptWithNameHashAsNoLongerNeeded

function Global.SetScriptedAnimSeatOffset(ped, p1)
	return _in(0x5917BBA32D06C230, ped, p1)
end

function Global.SetScriptedConversionCoordThisFrame(x, y, z)
	return _in(0x5086C7843552CF85, x, y, z)
end

--- Toggles Heatvision on/off.
function Global.SetSeethrough(toggle)
	return _in(0x7E08924259E08CE0, toggle)
end

function Global.SetSequenceToRepeat(taskSequence, repeat_)
	return _in(0x58C70CF3A41E4AE7, taskSequence, repeat_)
end

function Global.SetSirenWithNoDriver(vehicle, toggle)
	return _in(0x1FEF0683B96EBCF2, vehicle, toggle)
end

function Global.SetSnakeoilForEntry(name, path, data)
	return _in(0xa7dd3209, _ts(name), _ts(path), _ts(data))
end

--- Judging from the effect, this is some sort of vehicle density multiplier.
function Global.SetSomeVehicleDensityMultiplierThisFrame(value)
	return _in(0x90B6DA738A9A25DA, value)
end
Global.N_0x90b6da738a9a25da = Global.SetSomeVehicleDensityMultiplierThisFrame

function Global.SetSpecialAbilityMultiplier(multiplier)
	return _in(0xA49C426ED0CA4AB7, multiplier)
end

function Global.SetSrlTime(p0)
	return _in(0xA74A541C6884E7B8, p0)
end

--- Hardcoded to not work in multiplayer.
-- Used to lock/unlock doors to interior areas of the game.
-- (Possible) Door Types:
-- pastebin.com/9S2m3qA4
-- Heading is either 1, 0 or -1 in the scripts. Means default closed(0) or opened either into(1) or out(-1) of the interior.
-- Locked means that the heading is locked.
-- p6 is always 0.
-- 225 door types, model names and coords found in stripclub.c4:
-- pastebin.com/gywnbzsH
-- get door info: pastebin.com/i14rbekD
function Global.SetStateOfClosestDoorOfType(type, x, y, z, locked, heading, p6)
	return _in(0xF82D8F1926A02C3D, _ch(type), x, y, z, locked, heading, p6)
end

--- Example:
-- AUDIO::SET_STATIC_EMITTER_ENABLED((Any*)"LOS_SANTOS_VANILLA_UNICORN_01_STAGE", false);	AUDIO::SET_STATIC_EMITTER_ENABLED((Any*)"LOS_SANTOS_VANILLA_UNICORN_02_MAIN_ROOM", false);	AUDIO::SET_STATIC_EMITTER_ENABLED((Any*)"LOS_SANTOS_VANILLA_UNICORN_03_BACK_ROOM", false);
-- This turns off surrounding sounds not connected directly to peds.
function Global.SetStaticEmitterEnabled(emitterName, toggle)
	return _in(0x399D2D3B33F1B8EB, _ts(emitterName), toggle)
end

--- hash collision...
function Global.SetStoreEnabled(toggle)
	return _in(0x9641A9FF718E9C5E, toggle)
end

function Global.SetStreamedTextureDictAsNoLongerNeeded(textureDict)
	return _in(0xBE2CACCF5A8AA805, _ts(textureDict))
end

function Global.SetStreaming(toggle)
	return _in(0x6E0C692677008888, toggle)
end

function Global.SetSuperJumpThisFrame(player)
	return _in(0x57FFF03E423A4C0B, player, _r, _ri)
end

--- Swim speed multiplier.
-- Multiplier goes up to 1.49
-- Just call it one time, it is not required to be called once every tick. - Note copied from below native.
-- Note: At least the IDA method if you change the max float multiplier from 1.5 it will change it for both this and RUN_SPRINT below. I say 1.5 as the function blrs if what you input is greater than or equal to 1.5 hence why it's 1.49 max default.
function Global.SetSwimMultiplierForPlayer(player, multiplier)
	return _in(0xA91C6F0FF7D16A13, player, multiplier)
end

--- Sets the position of the audio event to the entity's position for one frame(?)
-- if (l_8C3 == 0) {
-- sub_27fd1(0, -1, 1);
-- if (PED::IS_SYNCHRONIZED_SCENE_RUNNING(l_87D)) {
-- AUDIO::STOP_SYNCHRONIZED_AUDIO_EVENT(l_87D);
-- }
-- if (sub_7dd(l_A00)) {
-- AUDIO::_950A154B8DAB6185("PAP2_IG1_POPPYSEX", l_A00);
-- }
-- sub_91c("TK************ SETTING SYNCH SCENE AUDIO POSITION THIS FRAME ************TK");
-- l_8C3 = 1;
-- }
-- --
-- Found in the b617d scripts, duplicates removed:
-- AUDIO::_950A154B8DAB6185("CAR_5_IG_6", l_7FE[1/*1*/]);
-- AUDIO::_950A154B8DAB6185("EX03_TRAIN_BIKE_LAND",   PLAYER::PLAYER_PED_ID());
-- AUDIO::_950A154B8DAB6185("FBI_2_MCS_1_LeadIn", l_40[2/*1*/]);
-- AUDIO::_950A154B8DAB6185("FIN_C2_MCS_1", l_24C[0/*1*/]);
-- AUDIO::_950A154B8DAB6185("MNT_DNC", l_5F);
-- AUDIO::_950A154B8DAB6185("PAP2_IG1_POPPYSEX", l_A00);
function Global.SetSynchronizedAudioEventPositionThisFrame(p0, p1)
	return _in(0x950A154B8DAB6185, _ts(p0), p1)
end
Global.N_0x950a154b8dab6185 = Global.SetSynchronizedAudioEventPositionThisFrame

function Global.SetSynchronizedSceneLooped(sceneID, toggle)
	return _in(0xD9A897A4C6C2974F, sceneID, toggle)
end

function Global.SetSynchronizedSceneOcclusionPortal(sceneID, p1)
	return _in(0x394B9CD12435C981, sceneID, p1)
end
Global.N_0x394b9cd12435c981 = Global.SetSynchronizedSceneOcclusionPortal

function Global.SetSynchronizedSceneOrigin(sceneID, x, y, z, roll, pitch, yaw, p7)
	return _in(0x6ACF6B7225801CD7, sceneID, x, y, z, roll, pitch, yaw, p7)
end

function Global.SetSynchronizedScenePhase(sceneID, phase)
	return _in(0x734292F4F0ABF6D0, sceneID, phase)
end

function Global.SetSynchronizedSceneRate(sceneID, rate)
	return _in(0xB6C49F8A5E295A5D, sceneID, rate)
end

function Global.SetTaskVehicleChaseBehaviorFlag(ped, flag, set)
	return _in(0xCC665AAC360D31E7, ped, flag, set)
end

function Global.SetTaskVehicleChaseIdealPursuitDistance(ped, distance)
	return _in(0x639B642FACBE4EDD, ped, distance)
end

--- This is not tested - it's just an assumption.
-- Doesn't seem to work.  I'll try with an int instead. --JT
-- Read the scripts, im dumpass.
-- if (!VEHICLE::IS_TAXI_LIGHT_ON(l_115)) {
-- VEHICLE::SET_TAXI_LIGHTS(l_115, 1);
-- }
function Global.SetTaxiLights(vehicle, state)
	return _in(0x598803E85E8448D9, vehicle, state)
end

function Global.SetTeamPickupObject(object, p1, p2)
	return _in(0x53E0DF1A2A3CF0CA, object, p1, p2)
end

function Global.SetTextCentre(align)
	return _in(0xC02F4DBFB51D988B, align)
end

function Global.SetTextChatEnabled(enabled)
	return _in(0x97b2f9f8, enabled, _r)
end

--- Sets an unknown boolean value in the text chat.
function Global.SetTextChatUnk(p0)
	return _in(0x1DB21A44B09E8BA3, p0)
end

--- colors you input not same as you think?
-- A: for some reason its R B G A
function Global.SetTextColour(red, green, blue, alpha)
	return _in(0xBE6B23FFA53FB442, red, green, blue, alpha)
end

function Global.SetTextDropShadow()
	return _in(0x1CA3E9EAC9D93E5E)
end

--- distance - shadow distance in pixels, both horizontal and vertical
-- r, g, b, a
function Global.SetTextDropshadow(distance, r, g, b, a)
	return _in(0x465C84BC39F1C351, distance, r, g, b, a)
end

function Global.SetTextEdge(p0, r, g, b, a)
	return _in(0x441603240D202FA6, p0, r, g, b, a)
end

--- fonts that mess up your text where made for number values/misc stuff
function Global.SetTextFont(fontType)
	return _in(0x66E0276CC5F6B9DA, fontType)
end

--- Types -
-- 0: Center-Justify
-- 1: Left-Justify
-- 2: Right-Justify
-- Right-Justify requires SET_TEXT_WRAP, otherwise it will draw to the far right of the screen
function Global.SetTextJustification(justifyType)
	return _in(0x4E096588B13FFECA, justifyType)
end
Global.N_0x4e096588b13ffeca = Global.SetTextJustification

--- from script am_mp_yacht.c int?
-- ui::set_text_leading(2);
function Global.SetTextLeading(p0)
	return _in(0xA50ABC31E3CDFAFF, p0)
end

function Global.SetTextOutline()
	return _in(0x2513DFB0FB8400FE)
end

function Global.SetTextProportional(p0)
	return _in(0x038C1F517D7FDCF8, p0)
end

function Global.SetTextRenderId(renderId)
	return _in(0x5F15302936E07111, renderId)
end

function Global.SetTextRightJustify(toggle)
	return _in(0x6B3C4650BC8BEE47, toggle)
end

--- Size range : 0F to 1.0F
-- p0 is unknown and doesn't seem to have an effect, yet in the game scripts it changes to 1.0F sometimes.
function Global.SetTextScale(p0, size)
	return _in(0x07C837F9A01C34C9, p0, size)
end

--- It sets the text in a specified box and wraps the text if it exceeds the boundries. Both values are for X axis. Useful when positioning text set to center or aligned to the right.
-- start - left boundry on screen position (0.0 - 1.0)
-- end - right boundry on screen position (0.0 - 1.0)
function Global.SetTextWrap(start, end_)
	return _in(0x63145D9C883A1A70, start, end_)
end

function Global.SetThisScriptCanBePaused(toggle)
	return _in(0xAA391C728106F7AF, toggle)
end

function Global.SetThisScriptCanRemoveBlipsCreatedByAnyScript(toggle)
	return _in(0xB98236CAAECEF897, toggle)
end

--- Hash collision. Please change back to _0x_
function Global.SetTimeExclusiveDisplayTexture(p0, p1)
	return _in(0xFD325494792302D7, p0, p1)
end

--- hash collision?
function Global.SetTimeIdleDrop(p0, p1)
	return _in(0x9DFE13ECDC1EC196, p0, p1)
end
Global.N_0x9dfe13ecdc1ec196 = Global.SetTimeIdleDrop

--- Maximum value is 1.
-- At a value of 0 the game will still run at a minimum time scale.
-- Slow Motion 1: 0.6
-- Slow Motion 2: 0.4
-- Slow Motion 3: 0.2
function Global.SetTimeScale(time)
	return _in(0x1D408577D440E81E, time)
end

--- Loads the specified timecycle modifier. Modifiers are defined separately in another file (e.g. "timecycle_mods_1.xml")
-- Parameters:
-- modifierName - The modifier to load (e.g. "V_FIB_IT3", "scanline_cam", etc.)
-- For a full list, see here: pastebin.com/kVPwMemE
function Global.SetTimecycleModifier(modifierName)
	return _in(0x2C933ABF17A1DF41, _ts(modifierName))
end

function Global.SetTimecycleModifierStrength(strength)
	return _in(0x82E7FFCD5B2326B3, strength)
end

--- Sets how much the crane on the tow truck is raised, where 0.0 is fully lowered and 1.0 is fully raised.
function Global.SetTowTruckCraneHeight(towTruck, height)
	return _in(0xFE54B92A344583CA, towTruck, height)
end
Global.SetTowTruckCraneRaised = Global.SetTowTruckCraneHeight

function Global.SetTrackedPointInfo(point, x, y, z, radius)
	return _in(0x164ECBB3CF750CB0, point, x, y, z, radius, _r, _ri)
end

function Global.SetTrainCruiseSpeed(train, speed)
	return _in(0x16469284DB8C62B5, train, speed, _r, _ri)
end

function Global.SetTrainSpeed(train, speed)
	return _in(0xAA0BC91BE0B796E3, train, speed, _r, _ri)
end

--- For a full list, see here: pastebin.com/kVPwMemE
function Global.SetTransitionTimecycleModifier(modifierName, transition)
	return _in(0x3BCF567485E1971C, _ts(modifierName), transition)
end

--- Might be more appropriate in AUDIO?
-- Rockstar made it like this.
-- Probably changes tvs from being a 3d audio to being "global" audio
function Global.SetTvAudioFrontend(toggle)
	return _in(0x113D2C5DC57E1774, toggle)
end

function Global.SetTvChannel(channel)
	return _in(0xBAABBB23EB6E484E, channel)
end

function Global.SetTvVolume(volume)
	return _in(0x2982BF73F66E9DDC, volume)
end

--- Sets an unknown flag used by CScene in determining which entities from CMapData scene nodes to draw, similar to 9BAE5AD2508DF078.
-- Documented by NTAuthority (http://fivem.net/).
function Global.SetUnkMapFlag(flag)
	return _in(0xC5F0A8EBD3F361CE, flag)
end

function Global.SetUseHiDof()
	return _in(0xA13B0222F3D94A94)
end

function Global.SetUserRadioControlEnabled(toggle)
	return _in(0x19F21E63AE6EAE4E, toggle)
end

--- Hash collision! Please change back to _0xEF4CED81CEBEDC6D
function Global.SetUseridsUihidden(p0, p1)
	return _in(0xEF4CED81CEBEDC6D, p0, _ii(p1) --[[ may be optional ]], _r)
end

function Global.SetVariableOnSound(soundId, p2)
	return _in(0xAD6B3148A78AE9B6, soundId, _i, p2)
end

--- From the scripts, p0:
-- "ArmWrestlingIntensity",
-- "INOUT",
-- "Monkey_Stream",
-- "ZoomLevel"
function Global.SetVariableOnStream(p0, p1)
	return _in(0x2F9D3834AEB9EF79, _ts(p0), p1)
end

--- For a full list, see here: pastebin.com/Kj9t38KF
function Global.SetVehRadioStation(vehicle, radioStation)
	return _in(0x1B9C0099CB942AC6, vehicle, _ts(radioStation))
end

function Global.SetVehicleAlarm(vehicle, state)
	return _in(0xCDE5E70C1DDB954C, vehicle, state)
end

function Global.SetVehicleAlarmTimeLeft(vehicle, time)
	return _in(0xc108ee6f, vehicle, time)
end

--- Makes the vehicle accept no passengers.
function Global.SetVehicleAllowNoPassengersLockon(veh, toggle)
	return _in(0x5D14D4154BFE7B2C, veh, toggle)
end

--- This is an alias of SET_ENTITY_AS_NO_LONGER_NEEDED.
function Global.SetVehicleAsNoLongerNeeded(vehicle)
	return _in(0x629BFA74418D6239, _ii(vehicle) --[[ may be optional ]])
end

--- This native sets the audio of the specified vehicle to the audioName (p1).
-- Use the audioNameHash found in vehicles.meta
-- Example:
-- _SET_VEHICLE_AUDIO(veh, "ADDER");
-- The selected vehicle will now have the audio of the Adder.
-- FORCE_VEHICLE_???
function Global.SetVehicleAudio(vehicle, audioName)
	return _in(0x4F0C413926060B38, vehicle, _ts(audioName))
end
Global.N_0x4f0c413926060b38 = Global.SetVehicleAudio

--- Please change to void.
function Global.SetVehicleAutomaticallyAttaches(vehicle, p1, p2)
	return _in(0x8BA6F76BC53A1493, vehicle, p1, p2, _r, _ri)
end

--- p2 often set to 1000.0 in the decompiled scripts.
function Global.SetVehicleBodyHealth(vehicle, value)
	return _in(0xB77D05AC8C78AADB, vehicle, value)
end

--- SET_VEHICLE_BOOST_ACTIVE(vehicle, 1, 0);
-- SET_VEHICLE_BOOST_ACTIVE(vehicle, 0, 0);
-- Will give a boost-soundeffect.
function Global.SetVehicleBoostActive(vehicle, Toggle)
	return _in(0x4A04DE7CAB2739A1, vehicle, Toggle)
end

function Global.SetVehicleBrakeLights(vehicle, toggle)
	return _in(0x92B35082E0B42F66, vehicle, toggle)
end

--- On accelerating, spins the driven wheels with the others braked, so you don't go anywhere.
function Global.SetVehicleBurnout(vehicle, toggle)
	return _in(0xFB8794444A7D60FB, vehicle, toggle)
end

--- This has not yet been tested - it's just an assumption of what the types could be.
function Global.SetVehicleCanBeTargetted(vehicle, state)
	return _in(0x3750146A28097A82, vehicle, state)
end

function Global.SetVehicleCanBeUsedByFleeingPeds(vehicle, toggle)
	return _in(0x300504B23BD3B711, vehicle, toggle)
end
Global.N_0x300504b23bd3b711 = Global.SetVehicleCanBeUsedByFleeingPeds

function Global.SetVehicleCanBeVisiblyDamaged(vehicle, state)
	return _in(0x4C7028F78FFD3681, vehicle, state)
end

function Global.SetVehicleCanBreak(vehicle, toggle)
	return _in(0x59BF8C3D52C92F66, vehicle, toggle)
end

--- Previously named GET_VEHICLE_DEFORMATION_GET_TREE (hash collision)
-- from Decrypted Scripts I found
-- VEHICLE::SET_VEHICLE_CEILING_HEIGHT(l_BD9[2/*2*/], 420.0);
function Global.SetVehicleCeilingHeight(vehicle, p1)
	return _in(0xA46413066687A328, vehicle, p1)
end
Global.GetVehicleDeformationGetTree = Global.SetVehicleCeilingHeight

function Global.SetVehicleClutch(vehicle, clutch)
	return _in(0x2f70aced, vehicle, clutch)
end

--- dont be a dick
function Global.SetVehicleColourCombination(vehicle, colorCombination)
	return _in(0x33E8CD3322E2FE31, vehicle, colorCombination)
end

--- colorPrimary &amp; colorSecondary are the paint index for the vehicle.
-- For a list of valid paint indexes, view: pastebin.com/pwHci0xK
-- -------------------------------------------------------------------------
-- Use this to get the number of color indices: pastebin.com/RQEeqTSM
-- Note: minimum color index is 0, maximum color index is (numColorIndices - 1)
function Global.SetVehicleColours(vehicle, colorPrimary, colorSecondary)
	return _in(0x4F1D4BE3A7F24601, vehicle, colorPrimary, colorSecondary)
end

--- Money pickups are created around cars when they explodes. Only works when the vehicle model is a car. A single pickup is between 1 and 18 dollars in size. All car models seems to give the same amount of money.
-- youtu.be/3arlUxzHl5Y
-- i.imgur.com/WrNpYFs.jpg
-- From the scripts:
-- VEHICLE::_068F64F2470F9656(l_36, 0);
-- Found a "correct" name for this :P
-- _dead_vehicle_pickups_dies_when_set_exploded_destroy_it_drops_on_money
-- SET_VEHICLE_D* or SET_VEHICLE_E*
function Global.SetVehicleCreatesMoneyPickupsWhenExploded(vehicle, toggle)
	return _in(0x068F64F2470F9656, vehicle, toggle)
end
Global.N_0x068f64f2470f9656 = Global.SetVehicleCreatesMoneyPickupsWhenExploded

function Global.SetVehicleCurrentRpm(vehicle, rpm)
	return _in(0x2a01a8fc, vehicle, rpm)
end

--- p1, p2, p3 are RGB values for color (255,0,0 for Red, ect)
function Global.SetVehicleCustomPrimaryColour(vehicle, r, g, b)
	return _in(0x7141766F91D15BEA, vehicle, r, g, b)
end

--- p1, p2, p3 are RGB values for color (255,0,0 for Red, ect)
function Global.SetVehicleCustomSecondaryColour(vehicle, r, g, b)
	return _in(0x36CED73BFED89754, vehicle, r, g, b)
end

--- Apply damage to vehicle at a location. Location is relative to vehicle model (not world).
-- Radius of effect damage applied in a sphere at impact location
function Global.SetVehicleDamage(vehicle, xOffset, yOffset, zOffset, damage, radius, p6)
	return _in(0xA1DD317EA8FD4F29, vehicle, xOffset, yOffset, zOffset, damage, radius, p6)
end

function Global.SetVehicleDeformationFixed(vehicle)
	return _in(0x953DA1E1B12C0491, vehicle)
end

--- ??? Usage
-- ??? Use this native inside a looped function.
-- ??? Values:
-- ??? 0.0 = no vehicles on streets
-- ??? 1.0 = normal vehicles on streets
function Global.SetVehicleDensityMultiplierThisFrame(multiplier)
	return _in(0x245A6883D966D537, multiplier)
end

--- You can't use values greater than 15.0
-- You can see why here: pastebin.com/Wbn34fGD
-- Also, R* does (float)(rand() % 15) to get a random dirt level when generating a vehicle.
function Global.SetVehicleDirtLevel(vehicle, dirtLevel)
	return _in(0x79D3B596FE44EE8B, vehicle, dirtLevel)
end

--- doorIndex:
-- 0 = Front Right Door
-- 1 = Front Left Door
-- 2 = Back Right Door
-- 3 = Back Left Door
-- 4 = Hood
-- 5 = Trunk
-- Changed last paramater from CreateDoorObject To NoDoorOnTheFloor because when on false, the door object is created,and not created when on true...the former parameter name was counter intuitive...(by Calderon)
function Global.SetVehicleDoorBroken(vehicle, doorIndex, deleteDoor)
	return _in(0xD4D4F6A4AB575A33, vehicle, doorIndex, deleteDoor)
end

--- Keeps Vehicle Doors/Hood/Trunk from breaking off
function Global.SetVehicleDoorCanBreak(vehicle, doorIndex, isBreakable)
	return _in(0x2FA133A4A9D37ED8, vehicle, doorIndex, isBreakable)
end
Global.SetVehicleDoorBreakable = Global.SetVehicleDoorCanBreak

--- doorIndex:
-- 0 = Front Left Door (driver door)
-- 1 = Front Right Door
-- 2 = Back Left Door
-- 3 = Back Right Door
-- 4 = Hood
-- 5 = Trunk
-- 6 = Trunk2
-- p2:
-- mostly use 0 and 1, very rare using 3 and 5
-- p3:
-- It seems it is an angle
-- Example in VB:
-- Public Shared Sub Set_Vehicle_Door_Angle(Vehicle As Vehicle, Door As VehicleDoor, Angle As Single)
-- Native.Function.Call(Hash.SET_VEHICLE_DOOR_CONTROL, Vehicle.Handle, Door, 1, Angle)
-- End Sub
-- I'm Not MentaL
-- sfink: p2 is speed, 5 is fast, 1 is slow 3 is medium
function Global.SetVehicleDoorControl(vehicle, doorIndex, speed, angle)
	return _in(0xF2BFA0430F0A0FCB, vehicle, doorIndex, speed, angle)
end

function Global.SetVehicleDoorLatched(vehicle, doorIndex, p2, p3, p4)
	return _in(0xA5A9653A8D2CAF48, vehicle, doorIndex, p2, p3, p4)
end

--- doorIndex:
-- 0 = Front Left Door
-- 1 = Front Right Door
-- 2 = Back Left Door
-- 3 = Back Right Door
-- 4 = Hood
-- 5 = Trunk
-- 6 = Back
-- 7 = Back2
function Global.SetVehicleDoorOpen(vehicle, doorIndex, loose, openInstantly)
	return _in(0x7C65DAC73C35C862, vehicle, doorIndex, loose, openInstantly)
end

--- doorIndex:
-- 0 = Front Left Door
-- 1 = Front Right Door
-- 2 = Back Left Door
-- 3 = Back Right Door
-- 4 = Hood
-- 5 = Trunk
-- 6 = Trunk2
function Global.SetVehicleDoorShut(vehicle, doorIndex, closeInstantly)
	return _in(0x93D9BD300D7789E5, vehicle, doorIndex, closeInstantly)
end

--- 1
-- 2 - CARLOCK_LOCKED (locked)
-- 3
-- 4 - CARLOCK_LOCKED_PLAYER_INSIDE (can get in, can't leave)
-- (maybe, these are leftovers from GTA:VC)
-- 5
-- 6
-- 7
-- (source: GTA VC miss2 leak, matching constants for 0/2/4, testing)
-- They use 10 in am_mp_property_int, don't know what it does atm.
function Global.SetVehicleDoorsLocked(vehicle, doorLockStatus)
	return _in(0xB664292EAECF7FA6, vehicle, doorLockStatus)
end

--- After some analysis, I've decided that these are what the parameters are.
-- We can see this being used in R* scripts such as "am_mp_property_int.ysc.c4":
-- l_11A1 = PED::GET_VEHICLE_PED_IS_IN(PLAYER::PLAYER_PED_ID(), 1);
-- ...
-- VEHICLE::SET_VEHICLE_DOORS_LOCKED_FOR_ALL_PLAYERS(l_11A1, 1);
function Global.SetVehicleDoorsLockedForAllPlayers(vehicle, toggle)
	return _in(0xA2F80B8D040727CC, vehicle, toggle)
end

function Global.SetVehicleDoorsLockedForPlayer(vehicle, player, toggle)
	return _in(0x517AAF684BB50CD1, vehicle, player, toggle)
end

function Global.SetVehicleDoorsLockedForTeam(vehicle, team, toggle)
	return _in(0xB81F6D4A8F5EEBA8, vehicle, team, toggle)
end

--- Closes all doors of a vehicle:
function Global.SetVehicleDoorsShut(vehicle, closeInstantly)
	return _in(0x781B3D62BB013EF5, vehicle, closeInstantly)
end

function Global.SetVehicleEngineCanDegrade(vehicle, toggle)
	return _in(0x983765856F2564F9, vehicle, toggle)
end

--- 1000 is max health
-- Begins leaking gas at around 650 health
function Global.SetVehicleEngineHealth(vehicle, health)
	return _in(0x45F6D8EEF34ABEF1, vehicle, health)
end

--- Starts or stops the engine on the specified vehicle.
-- vehicle: The vehicle to start or stop the engine on.
-- value: true to turn the vehicle on; false to turn it off.
-- instantly: if true, the vehicle will be set to the state immediately; otherwise, the current driver will physically turn on or off the engine.
-- --------------------------------------
-- And what's with BOOL otherwise, what does it do???
-- --------------------------------------
-- I have no clue what 'otherwise' is either. Xbox360 of course ends at TU27 so that's our latest scripts and every script still only has the first 3 parameters.
-- Side Note: It would of been nice though if it was to handle jet engines instead of having that separate native for it.
function Global.SetVehicleEngineOn(vehicle, value, instantly, otherwise)
	return _in(0x2497C4717C8B881E, vehicle, value, instantly, otherwise)
end

--- Vehicle power multiplier.
-- Does not have to be looped each frame. Can be set once.
-- Values lower than 1f don't work.
-- Note: If the value is set with GET_RANDOM_FLOAT_IN_RANGE, the vehicle will have an absurdly high ammount of power, and will become almost undrivable for the player or NPCs. The range doesn't seem to matter.
-- An high value like 10000000000f will visually remove the wheels that apply the power (front wheels for FWD, rear wheels for RWD), but the power multiplier will still apply, and the wheels still work.
function Global.SetVehicleEnginePowerMultiplier(vehicle, value)
	return _in(0x93A3996368C94158, vehicle, value)
end

function Global.SetVehicleEngineTemperature(vehicle, temperature)
	return _in(0x6c93c4a9, vehicle, temperature)
end

--- &lt;1.0 - Decreased torque
-- =1.0 - Default torque
-- &gt;1.0 - Increased torque
-- Negative values will cause the vehicle to go backwards instead of forwards while accelerating.
-- value - is between 0.2 and 1.8 in the decompiled scripts.
-- This needs to be called every frame to take effect.
function Global.SetVehicleEngineTorqueMultiplier(vehicle, value)
	return _in(0xB59E4BD37AE292DB, vehicle, value)
end

--- formerly known as _SET_VEHICLE_PAINT_FADE
-- The parameter fade is a value from 0-1, where 0 is fresh paint.
-- ------------------------------------------------------------------------------------
-- The actual value isn't stored as a float but as an unsigned char (BYTE). More info here: pastebin.com/r0h6EM5s
function Global.SetVehicleEnveffScale(vehicle, fade)
	return _in(0x3AFDC536C3D01674, vehicle, fade)
end
Global.SetVehiclePaintFade = Global.SetVehicleEnveffScale

function Global.SetVehicleExclusiveDriver(vehicle, p1)
	return _in(0x41062318F23ED854, vehicle, p1)
end
Global.N_0x41062318f23ed854 = Global.SetVehicleExclusiveDriver

function Global.SetVehicleExclusiveDriver_2(vehicle, ped, p2)
	return _in(0xB5C51B5502E85E83, vehicle, ped, p2)
end
Global.N_0xb5c51b5502e85e83 = Global.SetVehicleExclusiveDriver_2

--- Sets a vehicle to be strongly resistant to explosions. p0 is the vehicle; set p1 to false to toggle the effect on/off.
function Global.SetVehicleExplodesOnHighExplosionDamage(vehicle, toggle)
	return _in(0x71B0892EC081D60A, vehicle, toggle)
end

--- Note: only some vehicle have extras
-- extra ids are from 1 - 9 depending on the vehicle
-- -------------------------------------------------
-- ^ not sure if outdated or simply wrong. Max extra ID for b944 is 14
-- -------------------------------------------------
-- p2 is not a on/off toggle. mostly 0 means on and 1 means off.
-- not sure if it really should be a BOOL.
function Global.SetVehicleExtra(vehicle, extraId, toggle)
	return _in(0x7EE3A3C5E4A40CC9, vehicle, extraId, toggle)
end

--- They use the same color indexs as SET_VEHICLE_COLOURS.
function Global.SetVehicleExtraColours(vehicle, pearlescentColor, wheelColor)
	return _in(0x2036F561ADD12E33, vehicle, pearlescentColor, wheelColor)
end

function Global.SetVehicleFixed(vehicle)
	return _in(0x115722B1B9C14C1C, vehicle)
end

--- SCALE: Setting the speed to 30 would result in a speed of roughly 60mph, according to speedometer.
-- Speed is in meters per second
-- You can convert meters/s to mph here:
-- http://www.calculateme.com/Speed/MetersperSecond/ToMilesperHour.htm
function Global.SetVehicleForwardSpeed(vehicle, speed)
	return _in(0xAB54A438726D25D5, vehicle, speed)
end

--- Seems to be related to the metal parts, not tyres (like i was expecting lol)
function Global.SetVehicleFrictionOverride(vehicle, friction)
	return _in(0x1837AF7C627009BA, vehicle, friction)
end

function Global.SetVehicleFuelLevel(vehicle, level)
	return _in(0xba970511, vehicle, level)
end

--- It switch to highbeam when p1 is set to true.
function Global.SetVehicleFullbeam(vehicle, toggle)
	return _in(0x8B7FD87F0DDB421E, vehicle, toggle)
end

function Global.SetVehicleGravity(vehicle, toggle)
	return _in(0x89F149B6131E57DA, vehicle, toggle)
end

function Global.SetVehicleGravityAmount(vehicle, gravity)
	return _in(0x1a963e58, vehicle, gravity)
end

--- This native makes the vehicle stop immediately, as happens when we enter a MP garage.
-- . distance defines how far it will travel until stopping. Garage doors use 3.0.
-- . If killEngine is set to 1, you cannot resume driving the vehicle once it stops. This looks like is a bitmapped integer.
function Global.SetVehicleHalt(vehicle, distance, killEngine, unknown)
	return _in(0x260BE8F09E326A20, vehicle, distance, killEngine, unknown)
end
Global.N_0x260be8f09e326a20 = Global.SetVehicleHalt

--- does this work while in air?
function Global.SetVehicleHandbrake(vehicle, toggle)
	return _in(0x684785568EF26A22, vehicle, toggle)
end

function Global.SetVehicleHasBeenOwnedByPlayer(vehicle, owned)
	return _in(0x2B5F9D2AF1F1722D, vehicle, owned)
end

--- if true, axles won't bend.
function Global.SetVehicleHasStrongAxles(vehicle, toggle)
	return _in(0x92F0CF722BC4202F, vehicle, toggle)
end

function Global.SetVehicleHighGear(vehicle, gear)
	return _in(0x20b1b3e6, vehicle, gear)
end

--- console hash: 0x71CDD52F
function Global.SetVehicleHudSpecialAbilityBarActive(vehicle, active)
	return _in(0x99C82F8A139F3E4E, vehicle, active)
end
Global.N_0x99c82f8a139f3e4e = Global.SetVehicleHudSpecialAbilityBarActive

--- Sets the turn signal enabled for a vehicle.
-- Set turnSignal to 1 for left light, 0 for right light.
function Global.SetVehicleIndicatorLights(vehicle, turnSignal, toggle)
	return _in(0xB5D45264751B7DF0, vehicle, turnSignal, toggle)
end

function Global.SetVehicleInteriorlight(vehicle, toggle)
	return _in(0xBC2042F090AF6AD3, vehicle, toggle)
end

--- Setting this to false, makes the specified vehicle to where if you press Y your character doesn't even attempt the animation to enter the vehicle. Hence it's not considered aka ignored.
function Global.SetVehicleIsConsideredByPlayer(vehicle, toggle)
	return _in(0x31B927BBC44156CD, vehicle, toggle)
end

function Global.SetVehicleIsStolen(vehicle, isStolen)
	return _in(0x67B2C79AA7FF5738, vehicle, isStolen, _r, _ri)
end

--- Sets the wanted state of this vehicle.
function Global.SetVehicleIsWanted(vehicle, state)
	return _in(0xF7EC25A3EBEEC726, vehicle, state)
end

--- VEHICLE::SET_VEHICLE_ENGINE_ON is not enough to start jet engines when not inside the vehicle. But with this native set to true it works: youtu.be/OK0ps2fDpxs
-- i.imgur.com/7XA14pX.png
-- Certain planes got jet engines.
function Global.SetVehicleJetEngineOn(vehicle, toggle)
	return _in(0xB8FBC8B1330CA9B4, vehicle, toggle)
end
Global.N_0xb8fbc8b1330ca9b4 = Global.SetVehicleJetEngineOn

--- multiplier = brightness of head lights.
-- this value isn't capped afaik.
-- multiplier = 0.0 no lights
-- multiplier = 1.0 default game value
function Global.SetVehicleLightMultiplier(vehicle, multiplier)
	return _in(0xB385454F8791F57C, vehicle, multiplier)
end

--- set's if the vehicle has lights or not.
-- not an on off toggle.
-- p1 = 0 ;vehicle normal lights, off then lowbeams, then highbeams
-- p1 = 1 ;vehicle doesn't have lights, always off
-- p1 = 2 ;vehicle has always on lights
-- p1 = 3 ;or even larger like 4,5,... normal lights like =1
-- note1: when using =2 on day it's lowbeam,highbeam
-- but at night it's lowbeam,lowbeam,highbeam
-- note2: when using =0 it's affected by day or night for highbeams don't exist in daytime.
function Global.SetVehicleLights(vehicle, state)
	return _in(0x34E710FF01247C5A, vehicle, state)
end

--- p1 can be either 0, 1 or 2.
-- Determines how vehicle lights behave when toggled.
-- 0 = Default (Lights can be toggled between off, normal and high beams)
-- 1 = Lights Disabled (Lights are fully disabled, cannot be toggled)
-- 2 = Always On (Lights can be toggled between normal and high beams)
function Global.SetVehicleLightsMode(vehicle, p1)
	return _in(0x1FD09E7390A74D54, vehicle, p1)
end
Global.N_0x1fd09e7390a74d54 = Global.SetVehicleLightsMode

--- Note: Only seems to work on Emergency Vehicles
function Global.SetVehicleLivery(vehicle, livery)
	return _in(0x60BF608F1B8CD1B6, vehicle, livery)
end

function Global.SetVehicleLodMultiplier(vehicle, multiplier)
	return _in(0x93AE6A61BE015BF1, vehicle, multiplier)
end

--- In b944, there are 50 (0 - 49) mod types.
-- Sets the vehicle mod.
-- The vehicle must have a mod kit first.
-- Any out of range ModIndex is stock.
-- #Mod Type
-- Spoilers
-- Front Bumper
-- Rear Bumper
-- Side Skirt
-- Exhaust
-- Frame
-- Grille
-- Hood
-- Fender
-- Right Fender
-- Roof
-- Engine
-- Brakes
-- Transmission
-- Horns - 14 (modIndex from 0 to 51)
-- Suspension
-- Armor
-- Front Wheels
-- Back Wheels - 24 //only for motocycles
-- Plate holders
-- Trim Design
-- Ornaments
-- Dial Design
-- Steering Wheel
-- Shifter Leavers
-- Plaques
-- Hydraulics
-- Livery
-- ENUMS: pastebin.com/QzEAn02v
function Global.SetVehicleMod(vehicle, modType, modIndex, customTires)
	return _in(0x6AF0636DDEDCB6DD, vehicle, modType, modIndex, customTires)
end

--- paintType:
-- 0: Normal
-- 1: Metallic
-- 2: Pearl
-- 3: Matte
-- 4: Metal
-- 5: Chrome
-- color: number of the color.
-- p3 seems to always be 0.
function Global.SetVehicleModColor_1(vehicle, paintType, color, p3)
	return _in(0x43FEB945EE7F85B8, vehicle, paintType, color, p3)
end

--- Changes the secondary paint type and color
-- paintType:
-- 0: Normal
-- 1: Metallic
-- 2: Pearl
-- 3: Matte
-- 4: Metal
-- 5: Chrome
-- color: number of the color
function Global.SetVehicleModColor_2(vehicle, paintType, color)
	return _in(0x816562BADFDEC83E, vehicle, paintType, color)
end

--- Set modKit to 0 if you plan to call SET_VEHICLE_MOD. That's what the game does. Most body modifications through SET_VEHICLE_MOD will not take effect until this is set to 0.
function Global.SetVehicleModKit(vehicle, modKit)
	return _in(0x1F2AA07F00B3217A, vehicle, modKit)
end

--- seems to make the vehicle stop spawning naturally in traffic. Here's an essential example:
-- VEHICLE::SET_VEHICLE_MODEL_IS_SUPPRESSED(GAMEPLAY::GET_HASH_KEY("taco"), true);
-- god I hate taco vans
-- Confirmed to work? Needs to be looped? Can not get it to work.
function Global.SetVehicleModelIsSuppressed(model, suppressed)
	return _in(0x0FC2D89AC25A5814, _ch(model), suppressed)
end

--- NOTE: Debugging functions are not present in the retail version of the game.
function Global.SetVehicleNameDebug(vehicle, name)
	return _in(0xBFDF984E2C22B94F, vehicle, _ts(name))
end

function Global.SetVehicleNeedsToBeHotwired(vehicle, toggle)
	return _in(0xFBA550EA44404EE6, vehicle, toggle)
end

--- Sets the neon lights of the specified vehicle on/off.
-- Indices:
-- 0 = Left
-- 1 = Right
-- 2 = Front
-- 3 = Back
function Global.SetVehicleNeonLightEnabled(vehicle, index, toggle)
	return _in(0x2AA720E4287BF269, vehicle, index, toggle)
end

--- Sets the color of the neon lights of the specified vehicle.
-- More info: pastebin.com/G49gqy8b
function Global.SetVehicleNeonLightsColour(vehicle, r, g, b)
	return _in(0x8E0A582209A62695, vehicle, r, g, b)
end

--- Sets a vehicle's license plate text.  8 chars maximum.
-- Example:
-- Ped playerPed = PLAYER::PLAYER_PED_ID();
-- Vehicle veh = PED::GET_VEHICLE_PED_IS_USING(playerPed);
-- char *plateText = "KING";
-- VEHICLE::SET_VEHICLE_NUMBER_PLATE_TEXT(veh, plateText);
function Global.SetVehicleNumberPlateText(vehicle, plateText)
	return _in(0x95A88F0B409CDA47, vehicle, _ts(plateText))
end

--- Plates:
-- Blue/White
-- Yellow/black
-- Yellow/Blue
-- Blue/White2
-- Blue/White3
-- Yankton
function Global.SetVehicleNumberPlateTextIndex(vehicle, plateIndex)
	return _in(0x9088EB5A43FFB0A1, vehicle, plateIndex)
end

function Global.SetVehicleOilLevel(vehicle, level)
	return _in(0x90d1cad1, vehicle, level)
end

--- Sets a vehicle on the ground on all wheels.  Returns whether or not the operation was successful.
-- sfink: This has an additional param(Vehicle vehicle, float p1) which is always set to 5.0f in the b944 scripts.
function Global.SetVehicleOnGroundProperly(vehicle)
	return _in(0x49733E92263139D1, vehicle, _r)
end

--- Tested on the player's current vehicle. Unless you kill the driver, the vehicle doesn't loose control, however, if enabled, explodeOnImpact is still active. The moment you crash, boom.
function Global.SetVehicleOutOfControl(vehicle, killDriver, explodeOnImpact)
	return _in(0xF19D095E42D430CC, vehicle, killDriver, explodeOnImpact)
end

--- 1000 is max health
-- Begins leaking gas at around 650 health
function Global.SetVehiclePetrolTankHealth(vehicle, health)
	return _in(0x70DB57649FA8D0D8, vehicle, health)
end

function Global.SetVehiclePopulationBudget(p0)
	return _in(0xCB9E1EB3BE2AF4E9, p0)
end

function Global.SetVehicleProvidesCover(vehicle, toggle)
	return _in(0x5AFEEDD9BB2899D7, vehicle, toggle)
end

--- can't seem to enable radio on cop cars etc
function Global.SetVehicleRadioEnabled(vehicle, toggle)
	return _in(0x3B988190C0AA6C0B, vehicle, toggle)
end

function Global.SetVehicleRadioLoud(vehicle, toggle)
	return _in(0xBB6F1CAEC68B0BCE, vehicle, toggle)
end

--- Reduces grip significantly so it's hard to go anywhere.
function Global.SetVehicleReduceGrip(vehicle, toggle)
	return _in(0x222FF6A823D122E2, vehicle, toggle)
end

function Global.SetVehicleRudderBroken(vehicle, p1)
	return _in(0x09606148B6C71DEF, vehicle, p1)
end

--- Only works during nighttime.
function Global.SetVehicleSearchlight(heli, toggle, canBeUsedByAI)
	return _in(0x14E85C5EE7A4D542, heli, toggle, canBeUsedByAI)
end

--- Commands the driver of an armed vehicle (p0) to shoot its weapon at a target (p1). p3, p4 and p5 are the coordinates of the target. Example:
-- WEAPON::SET_CURRENT_PED_VEHICLE_WEAPON(pilot,GAMEPLAY::GET_HASH_KEY("VEHICLE_WEAPON_PLANE_ROCKET"));						VEHICLE::SET_VEHICLE_SHOOT_AT_TARGET(pilot, target, targPos.x, targPos.y, targPos.z);
function Global.SetVehicleShootAtTarget(driver, entity, xTarget, yTarget, zTarget)
	return _in(0x74CD9A9327A282EA, driver, entity, xTarget, yTarget, zTarget)
end

--- If set to TRUE, it seems to suppress door noises and doesn't allow the horn to be continuous.
function Global.SetVehicleSilent(vehicle, toggle)
	return _in(0x9D44FCCE98450843, vehicle, toggle)
end
Global.N_0x9d44fcce98450843 = Global.SetVehicleSilent

--- Activate siren on vehicle (Only works if the vehicle has a siren).
function Global.SetVehicleSiren(vehicle, toggle)
	return _in(0xF4924635A19EB37D, vehicle, toggle)
end

--- Locks the vehicle's steering to the desired angle, explained below.
-- Requires to be called onTick. Steering is unlocked the moment the function stops being called on the vehicle.
-- Steer bias:
-- -1.0 = full right
-- 0.0 = centered steering
-- 1.0 = full left
function Global.SetVehicleSteerBias(vehicle, value)
	return _in(0x42A8EC77D5150CBE, vehicle, value)
end

function Global.SetVehicleSteeringScale(vehicle, scale)
	return _in(0xeb46596f, vehicle, scale)
end

--- If set to true, vehicle will not take crash damage, but is still susceptible to damage from bullets and explosives
function Global.SetVehicleStrong(vehicle, toggle)
	return _in(0x3E8C8727991A8A0B, vehicle, toggle)
end

--- VEHICLE::SET_VEHICLE_TIMED_EXPLOSION(v_3, PLAYER::GET_PLAYER_PED(v_5), 1);
function Global.SetVehicleTimedExplosion(vehicle, ped, toggle)
	return _in(0x2E0A74E1002380B1, vehicle, ped, toggle)
end

function Global.SetVehicleTurboPressure(vehicle, pressure)
	return _in(0x6485615e, vehicle, pressure)
end

--- "To burst tyres VEHICLE::SET_VEHICLE_TYRE_BURST(vehicle, 0, true, 1000.0)
-- to burst all tyres type it 8 times where p1 = 0 to 7.
-- p3 seems to be how much damage it has taken. 0 doesn't deflate them, 1000 completely deflates them.
-- '0 = wheel_lf / bike, plane or jet front
-- '1 = wheel_rf
-- '2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left
-- '3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right
-- '4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left
-- '5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right
-- '45 = 6 wheels trailer mid wheel left
-- '47 = 6 wheels trailer mid wheel right
function Global.SetVehicleTyreBurst(vehicle, index, onRim, p3)
	return _in(0xEC6A202EE4960385, vehicle, index, onRim, p3)
end

--- tyreIndex = 0 to 4 on normal vehicles
-- '0 = wheel_lf / bike, plane or jet front
-- '1 = wheel_rf
-- '2 = wheel_lm / in 6 wheels trailer, plane or jet is first one on left
-- '3 = wheel_rm / in 6 wheels trailer, plane or jet is first one on right
-- '4 = wheel_lr / bike rear / in 6 wheels trailer, plane or jet is last one on left
-- '5 = wheel_rr / in 6 wheels trailer, plane or jet is last one on right
-- '45 = 6 wheels trailer mid wheel left
-- '47 = 6 wheels trailer mid wheel right
function Global.SetVehicleTyreFixed(vehicle, tyreIndex)
	return _in(0x6E13FC662B882D1D, vehicle, tyreIndex)
end

--- Sets the tire smoke's color of this vehicle.
-- vehicle: The vehicle that is the target of this method.
-- r: The red level in the RGB color code.
-- g: The green level in the RGB color code.
-- b: The blue level in the RGB color code.
-- Note:
-- setting r,g,b to 0 will give the car independance day tyre smoke
function Global.SetVehicleTyreSmokeColor(vehicle, r, g, b)
	return _in(0xB5BA80F839791C0F, vehicle, r, g, b)
end

--- Allows you to toggle bulletproof tires.
function Global.SetVehicleTyresCanBurst(vehicle, toggle)
	return _in(0xEB9DC3C7D8596C46, vehicle, toggle)
end

function Global.SetVehicleUndriveable(vehicle, toggle)
	return _in(0x8ABA6AF54B942B95, vehicle, toggle)
end

function Global.SetVehicleWheelHealth(vehicle, wheelIndex, health)
	return _in(0xb22ecefd, vehicle, wheelIndex, health)
end

--- 0: Sport
-- 1: Muscle
-- 2: Lowrider
-- 3: SUV
-- 4: Offroad
-- 5: Tuner
-- 6: Bike Wheels
-- 7: High End
function Global.SetVehicleWheelType(vehicle, WheelType)
	return _in(0x487EB21CC7295BA1, vehicle, WheelType)
end

function Global.SetVehicleWheelsCanBreak(vehicle, enabled)
	return _in(0x29B18B4FD460CA8F, vehicle, enabled, _r, _ri)
end

function Global.SetVehicleWheelsCanBreakOffWhenBlowUp(vehicle, toggle)
	return _in(0xA37B9A517B133349, vehicle, toggle)
end
Global.SetVehicleMaxStrTrap = Global.SetVehicleWheelsCanBreakOffWhenBlowUp

--- enum WindowTints
-- {
-- WINDOWTINT_NONE,
-- WINDOWTINT_PURE_BLACK,
-- WINDOWTINT_DARKSMOKE,
-- WINDOWTINT_LIGHTSMOKE,
-- WINDOWTINT_STOCK,
-- WINDOWTINT_LIMO,
-- WINDOWTINT_GREEN
-- };
function Global.SetVehicleWindowTint(vehicle, tint)
	return _in(0x57C51E6BAD752696, vehicle, tint)
end

--- Max value is 1.0
function Global.SetWantedLevelDifficulty(player, difficulty)
	return _in(0x9B0BB33B04405E7A, player, difficulty)
end

function Global.SetWantedLevelMultiplier(multiplier)
	return _in(0x020E5F00CDA207BA, multiplier)
end

--- You can only use text entries. No custom text.
-- Example: SET_WARNING_MESSAGE("t20", 3, "adder", false, -1, 0, 0, true);
function Global.SetWarningMessage(entryLine1, instructionalKey, entryLine2, p3, p4, background)
	return _in(0x7B1776B3B53F8D74, _ts(entryLine1), instructionalKey, _ts(entryLine2), p3, p4, _i, _i, background)
end

--- You can only use text entries. No custom text.
-- [24/03/2017] by ins1de :
-- C# Example :
-- Function.Call(Hash._SET_WARNING_MESSAGE_2, "HUD_QUIT", "HUD_CGIGNORE", 2, "HUD_CGINVITE", 0, -1, 0, 0, 1);
-- @unknown, you can recreate this easily with scaleforms
function Global.SetWarningMessage_2(entryHeader, entryLine1, instructionalKey, entryLine2, p4, p5, background)
	return _in(0xDC38CC1E35B6A5D7, _ts(entryHeader), _ts(entryLine1), instructionalKey, _ts(entryLine2), p4, p5, _i, _i, background)
end

--- You can only use text entries. No custom text.
function Global.SetWarningMessage_3(entryHeader, entryLine1, instructionalKey, entryLine2, p4, p5, p6, p9)
	return _in(0x701919482C74B5AB, _ts(entryHeader), _ts(entryLine1), instructionalKey, _ts(entryLine2), p4, p5, p6, _i, _i, p9)
end

--- Sets a value that determines how aggressive the ocean waves will be. Values of 2.0 or more make for very aggressive waves like you see during a thunderstorm.
-- Works only ~200 meters around the player.
-- console hash: 0x53B694B1
-- Most likely SET_CURRENT_*
function Global.SetWavesIntensity(intensity)
	return _in(0xB96B00E976BE977F, intensity)
end
Global.N_0xb96b00e976be977f = Global.SetWavesIntensity

--- This native removes the current waypoint from the map.
-- Example:
-- C#:
-- Function.Call(Hash.SET_WAYPOINT_OFF);
-- C++:
-- UI::SET_WAYPOINT_OFF();
function Global.SetWaypointOff()
	return _in(0xA7E4E2D361C2627F)
end

--- Changes the selected ped aiming animation style.
-- Note : You must use GET_HASH_KEY!
-- Strings to use with GET_HASH_KEY :
-- "Ballistic",
-- "Default",
-- "Fat",
-- "Female",
-- "FirstPerson",
-- "FirstPersonAiming",
-- "FirstPersonFranklin",
-- "FirstPersonFranklinAiming",
-- "FirstPersonFranklinRNG",
-- "FirstPersonFranklinScope",
-- "FirstPersonMPFemale",
-- "FirstPersonMichael",
-- "FirstPersonMichaelAiming",
-- "FirstPersonMichaelRNG",
-- "FirstPersonMichaelScope",
-- "FirstPersonRNG",
-- "FirstPersonScope",
-- "FirstPersonTrevor",
-- "FirstPersonTrevorAiming",
-- "FirstPersonTrevorRNG",
-- "FirstPersonTrevorScope",
-- "Franklin",
-- "Gang",
-- "Gang1H",
-- "GangFemale",
-- "Hillbilly",
-- "MP_F_Freemode",
-- "Michael",
-- "SuperFat",
-- "Trevor"
function Global.SetWeaponAnimationOverride(ped, animStyle)
	return _in(0x1055AC3A667F09D9, ped, _ch(animStyle))
end

function Global.SetWeaponObjectTintIndex(weapon, tintIndex)
	return _in(0xF827589017D4E4A9, weapon, tintIndex)
end

--- Hash collision real name is: IS_FLASH_LIGHT_ON
function Global.SetWeaponSmokegrenadeAssigned(ped)
	return _in(0x4B7620C47217126C, ped, _r)
end

--- The following weatherTypes are used in the scripts:
-- "CLEAR"
-- "EXTRASUNNY"
-- "CLOUDS"
-- "OVERCAST"
-- "RAIN"
-- "CLEARING"
-- "THUNDER"
-- "SMOG"
-- "FOGGY"
-- "XMAS"
-- "SNOWLIGHT"
-- "BLIZZARD"
function Global.SetWeatherTypeNow(weatherType)
	return _in(0x29B487C359E19889, _ts(weatherType))
end

--- The following weatherTypes are used in the scripts:
-- "CLEAR"
-- "EXTRASUNNY"
-- "CLOUDS"
-- "OVERCAST"
-- "RAIN"
-- "CLEARING"
-- "THUNDER"
-- "SMOG"
-- "FOGGY"
-- "XMAS"
-- "SNOWLIGHT"
-- "BLIZZARD"
function Global.SetWeatherTypeNowPersist(weatherType)
	return _in(0xED712CA327900C8A, _ts(weatherType))
end

function Global.SetWeatherTypeOverTime(weatherType, time)
	return _in(0xFB5045B7C42B75BF, _ts(weatherType), time)
end

--- The following weatherTypes are used in the scripts:
-- "CLEAR"
-- "EXTRASUNNY"
-- "CLOUDS"
-- "OVERCAST"
-- "RAIN"
-- "CLEARING"
-- "THUNDER"
-- "SMOG"
-- "FOGGY"
-- "XMAS"
-- "SNOWLIGHT"
-- "BLIZZARD"
function Global.SetWeatherTypePersist(weatherType)
	return _in(0x704983DF373B198F, _ts(weatherType))
end

--- Mixes two weather types. If percentWeather2 is set to 0.0f, then the weather will be entirely of weatherType1, if it is set to 1.0f it will be entirely of weatherType2. If it's set somewhere in between, there will be a mixture of weather behaviors. To test, try this in the RPH console, and change the float to different values between 0 and 1:
-- execute "NativeFunction.Natives.x578C752848ECFA0C(Game.GetHashKey(""RAIN""), Game.GetHashKey(""SMOG""), 0.50f);
-- Note that unlike most of the other weather natives, this native takes the hash of the weather name, not the plain string. These are the weather names and their hashes:
-- CLEAR	0x36A83D84
-- EXTRASUNNY	0x97AA0A79
-- CLOUDS	0x30FDAF5C
-- OVERCAST	0xBB898D2D
-- RAIN	0x54A69840
-- CLEARING	0x6DB1A50D
-- THUNDER	0xB677829F
-- SMOG	0x10DCF4B5
-- FOGGY	0xAE737644
-- XMAS	0xAAC9C895
-- SNOWLIGHT	0x23FB812B
-- BLIZZARD	0x27EA2814
-- /* OLD INVALID INFO BELOW */
-- Not tested. Based purely on disassembly. Instantly sets the weather to sourceWeather, then transitions to targetWeather over the specified transitionTime in seconds.
-- If an invalid hash is specified for sourceWeather, the current weather type will be used.
-- If an invalid hash is specified for targetWeather, the next weather type will be used.
-- If an invalid hash is specified for both sourceWeather and targetWeather, the function just changes the transition time of the current transition.
function Global.SetWeatherTypeTransition(weatherType1, weatherType2, percentWeather2)
	return _in(0x578C752848ECFA0C, _ch(weatherType1), _ch(weatherType2), percentWeather2)
end

function Global.SetWidescreenBorders(p0, p1)
	return _in(0xDCD4EA924F42D01A, p0, p1, _r, _ri)
end

function Global.SetWidescreenFormat(p0)
	return _in(0xC3B07BA00A83B0F1, p0)
end

--- Sets the the raw wind speed value.
function Global.SetWind(speed)
	return _in(0xAC3A74E8384A9919, speed)
end

function Global.SetWindDirection(direction)
	return _in(0xEB0F4468467B4528, direction)
end

--- Using this native will clamp the wind speed value to a range of 0.0- 12.0. Using SET_WIND sets the same value but without the restriction.
function Global.SetWindSpeed(speed)
	return _in(0xEE09ECEDBABE47FC, speed)
end

function Global.SetZoneEnabled(zoneId, toggle)
	return _in(0xBA5ECEEA120E5611, zoneId, toggle)
end

--- Called before drawing stuff.
-- Examples:
-- GRAPHICS::_61BB1D9B3A95D802(7);
-- GRAPHICS::DRAW_RECT(0.5, 0.5, 3.0, 3.0, v_4, v_5, v_6, a_0._f172, 0);
-- GRAPHICS::_61BB1D9B3A95D802(1);
-- GRAPHICS::DRAW_RECT(0.5, 0.5, 1.5, 1.5, 0, 0, 0, 255, 0);
-- Appears to be the layer it's drawn on
function Global.Set_2dLayer(layer)
	return _in(0x61BB1D9B3A95D802, layer)
end
Global.N_0x61bb1d9b3a95d802 = Global.Set_2dLayer

function Global.Settimera(value)
	return _in(0xC1B1E9A034A63A62, value)
end

function Global.Settimerb(value)
	return _in(0x5AE11BC36633DE4E, value)
end

--- Possible shake types (updated b617d):
-- DEATH_FAIL_IN_EFFECT_SHAKE
-- DRUNK_SHAKE
-- FAMILY5_DRUG_TRIP_SHAKE
-- HAND_SHAKE
-- JOLT_SHAKE
-- LARGE_EXPLOSION_SHAKE
-- MEDIUM_EXPLOSION_SHAKE
-- SMALL_EXPLOSION_SHAKE
-- ROAD_VIBRATION_SHAKE
-- SKY_DIVING_SHAKE
-- VIBRATE_SHAKE
function Global.ShakeCam(cam, type, amplitude)
	return _in(0x6A25241C340D3822, cam, _ts(type), amplitude)
end

--- p0 argument found in the b617d scripts: "DRUNK_SHAKE"
function Global.ShakeCinematicCam(p0, p1)
	return _in(0xDCE214D9ED58F3CF, _ts(p0), p1)
end

--- Possible shake types (updated b617d):
-- DEATH_FAIL_IN_EFFECT_SHAKE
-- DRUNK_SHAKE
-- FAMILY5_DRUG_TRIP_SHAKE
-- HAND_SHAKE
-- JOLT_SHAKE
-- LARGE_EXPLOSION_SHAKE
-- MEDIUM_EXPLOSION_SHAKE
-- SMALL_EXPLOSION_SHAKE
-- ROAD_VIBRATION_SHAKE
-- SKY_DIVING_SHAKE
-- VIBRATE_SHAKE
function Global.ShakeGameplayCam(shakeName, intensity)
	return _in(0xFD55E49555E017CF, _ts(shakeName), intensity)
end

function Global.ShiftLeft(value, bitShift)
	return _in(0xEDD95A39E5544DE8, value, bitShift, _r, _ri)
end

function Global.ShiftRight(value, bitShift)
	return _in(0x97EF1E5BCE9DC075, value, bitShift, _r, _ri)
end

function Global.ShootSingleBulletBetweenCoords(x1, y1, z1, x2, y2, z2, damage, p7, weaponHash, ownerPed, isAudible, isInvisible, speed)
	return _in(0x867654CBC7606F2C, x1, y1, z1, x2, y2, z2, damage, p7, _ch(weaponHash), ownerPed, isAudible, isInvisible, speed)
end

--- Shows the cursor on screen for the frame its called.
function Global.ShowCursorThisFrame()
	return _in(0xAAE7CE1D63167423)
end

--- Adds the GTA: Online player heading indicator to a blip.
function Global.ShowHeadingIndicatorOnBlip(blip, toggle)
	return _in(0x5FBCA48327B914DF, blip, toggle)
end
Global.N_0x5fbca48327b914df = Global.ShowHeadingIndicatorOnBlip

function Global.ShowHudComponentThisFrame(id)
	return _in(0x0B4DF1FA60C0E664, id)
end

--- This does NOT get called per frame. Call it once to show, then use UI::_REMOVE_LOADING_PROMPT to remove it
-- Changes the the above native's (UI::_SET_LOADING_PROMPT_TEXT_ENTRY) spinning circle type.
-- Types:
-- enum LoadingPromptTypes
-- {
-- LOADING_PROMPT_LEFT,
-- LOADING_PROMPT_LEFT_2,
-- LOADING_PROMPT_LEFT_3,
-- SAVE_PROMPT_LEFT,
-- LOADING_PROMPT_RIGHT,
-- };
function Global.ShowLoadingPrompt(busySpinnerType)
	return _in(0xBD12F8228410D9B4, busySpinnerType)
end
Global.N_0xbd12f8228410d9b4 = Global.ShowLoadingPrompt

function Global.ShowNumberOnBlip(blip, number)
	return _in(0xA3C0B359DCB848B6, blip, number)
end

--- If toggle is true, the ped's head is shown in the pause menu
-- If toggle is false, the ped's head is not shown in the pause menu
function Global.ShowPedInPauseMenu(toggle)
	return _in(0x4EBB7E87AA0DBED4, toggle)
end
Global.N_0x4ebb7e87aa0dbed4 = Global.ShowPedInPauseMenu

--- probs one frame
function Global.ShowSocialClubLegalScreen()
	return _in(0x805D7CBB36FD6C4C)
end

--- Forces the weapon wheel to appear on screen.
function Global.ShowWeaponWheel(forcedShow)
	return _in(0xEB354E5376BC81A7, forcedShow)
end
Global.N_0xeb354e5376bc81a7 = Global.ShowWeaponWheel

--- Starts a new singleplayer game (at the prologue).
function Global.ShutdownAndLaunchSinglePlayerGame()
	return _in(0x593850C16A36B692)
end

function Global.ShutdownCreatorBudget()
	return _in(0xCCE26000E9A6FAD7)
end
Global.N_0xcce26000e9a6fad7 = Global.ShutdownCreatorBudget

function Global.ShutdownLoadingScreen()
	return _in(0x078EBE9809CCD637)
end

--- This is to make the player walk without accepting input from INPUT.
-- gaitType is in increments of 100s. 2000, 500, 300, 200, etc.
-- p4 is always 1 and p5 is always 0.
-- C# Example :
-- Function.Call(Hash.SIMULATE_PLAYER_INPUT_GAIT, Game.Player, 1.0f, 100, 1.0f, 1, 0); //Player will go forward for 100ms
function Global.SimulatePlayerInputGait(player, amount, gaitType, speed, p4, p5)
	return _in(0x477D5D63E63ECA5D, player, amount, gaitType, speed, p4, p5)
end

function Global.Sin(value)
	return _in(0x0BADBFA3B172435F, value, _r, _rf)
end

--- Unsurprisingly, this native is incorrectly named. Instead, this returns the name of the scaleform movie.
-- HASH COLLISION. PLEASE REMOVE NATIVE NAME.
function Global.SittingTv(scaleform)
	return _in(0xE1E258829A885245, scaleform, _r, _s)
end

function Global.SkipRadioForward()
	return _in(0x6DDBBDD98E2E9C25)
end

function Global.SkipTimeInPlaybackRecordedVehicle(p0, p1)
	return _in(0x9438F7AD68771A20, p0, p1)
end

function Global.SkipToEndAndStopPlaybackRecordedVehicle(p0)
	return _in(0xAB8E2EDA0C0A5883, p0)
end

function Global.SkipToNextScriptedConversationLine()
	return _in(0x9663FE6B7A61EB00)
end

--- Returns true if the object has finished moving.
-- If false, moves the object towards the specified X, Y and Z coordinates with the specified X, Y and Z speed.
-- See also: gtag.gtagaming.com/opcode-database/opcode/034E/
function Global.SlideObject(object, toX, toY, toZ, speedX, speedY, speedZ, collision)
	return _in(0x2FDFF4107B8C1147, object, toX, toY, toZ, speedX, speedY, speedZ, collision, _r)
end

function Global.SmashVehicleWindow(vehicle, index)
	return _in(0x9E5B5E4D2CCD2259, vehicle, index, _r, _ri)
end

function Global.SoundVehicleHornThisFrame(vehicle)
	return _in(0x9C11908013EA4715, vehicle)
end
Global.N_0x9c11908013ea4715 = Global.SoundVehicleHornThisFrame

--- p1 appears as 5, 10, 15, 25, or 30. p2 is always true.
function Global.SpecialAbilityChargeAbsolute(player, p1, p2)
	return _in(0xB7B0870EB531D08D, player, p1, p2)
end

--- p1 appears to always be 1 (only comes up twice)
function Global.SpecialAbilityChargeContinuous(player, p2)
	return _in(0xED481732DFF7E997, player, p2)
end

--- 2 matches. p1 was always true.
function Global.SpecialAbilityChargeLarge(player, p1, p2)
	return _in(0xF733F45FA4497D93, player, p1, p2)
end

--- Only 1 match. Both p1 &amp; p2 were true.
function Global.SpecialAbilityChargeMedium(player, p1, p2)
	return _in(0xF113E3AA9BC54613, player, p1, p2)
end

--- normalizedValue is from 0.0 - 1.0
-- p2 is always 1
function Global.SpecialAbilityChargeNormalized(player, normalizedValue, p2)
	return _in(0xA0696A65F009EE18, player, normalizedValue, p2)
end
Global.ResetSpecialAbilityControlsCinematic = Global.SpecialAbilityChargeNormalized

--- Every occurrence of p1 &amp; p2 were both true.
function Global.SpecialAbilityChargeSmall(player, p1, p2)
	return _in(0x2E7B9B683481687D, player, p1, p2)
end

function Global.SpecialAbilityDeactivate(player)
	return _in(0xD6A953C6D1492057, player)
end

function Global.SpecialAbilityDeactivateFast(player)
	return _in(0x9CB5CE07A3968D5A, player)
end

--- p1 was always true.
function Global.SpecialAbilityDepleteMeter(player, p1)
	return _in(0x1D506DBBBC51E64B, player, p1)
end

--- Also known as _RECHARGE_SPECIAL_ABILITY
function Global.SpecialAbilityFillMeter(player, p1)
	return _in(0x3DACA8DDC6FD4980, player, p1)
end

function Global.SpecialAbilityLock(playerModel)
	return _in(0x6A09D0D590A47D13, _ch(playerModel))
end

function Global.SpecialAbilityReset(player)
	return _in(0x375F0E738F861A94, player)
end

function Global.SpecialAbilityUnlock(playerModel)
	return _in(0xF145F3BE2EFA9A3B, _ch(playerModel))
end

--- Hash collision!!! PLAY_STREAM_FROM_POSITION is the correct name!
function Global.SpecialFrontendEqual(x, y, z)
	return _in(0x21442F412E8DE56B, x, y, z)
end

function Global.Sqrt(value)
	return _in(0x71D93B57D07F9804, value, _r, _rf)
end

--- Example:
-- This will start the alarm at Fort Zancudo.
-- AUDIO::START_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS", 1);
-- First parameter (char) is the name of the alarm.
-- Second parameter (bool) is unknown, it does not seem to make a difference if this one is 0 or 1.
-- ----------
-- It DOES make a difference but it has to do with the duration or something I dunno yet
-- ----------
-- Found in the b617d scripts:
-- AUDIO::START_ALARM("AGENCY_HEIST_FIB_TOWER_ALARMS", 0);
-- AUDIO::START_ALARM("AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER", 1);
-- AUDIO::START_ALARM("AGENCY_HEIST_FIB_TOWER_ALARMS_UPPER_B", 0);
-- AUDIO::START_ALARM("BIG_SCORE_HEIST_VAULT_ALARMS", a_0);
-- AUDIO::START_ALARM("FBI_01_MORGUE_ALARMS", 1);
-- AUDIO::START_ALARM("FIB_05_BIOTECH_LAB_ALARMS", 0);
-- AUDIO::START_ALARM("JEWEL_STORE_HEIST_ALARMS", 0);
-- AUDIO::START_ALARM("PALETO_BAY_SCORE_ALARM", 1);
-- AUDIO::START_ALARM("PALETO_BAY_SCORE_CHICKEN_FACTORY_ALARM", 0);
-- AUDIO::START_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS", 1);
-- AUDIO::START_ALARM("PORT_OF_LS_HEIST_SHIP_ALARMS", 0);
-- AUDIO::START_ALARM("PRISON_ALARMS", 0);
-- AUDIO::START_ALARM("PROLOGUE_VAULT_ALARMS", 0);
function Global.StartAlarm(alarmName, p2)
	return _in(0x0355EF116C4C97B2, _ts(alarmName), p2)
end

--- Used to prepare a scene where the surrounding sound is muted or a bit changed. This does not play any sound.
-- List of all usable scene names found in b617d. Sorted alphabetically and identical names removed: pastebin.com/MtM9N9CC
function Global.StartAudioScene(scene)
	return _in(0x013A80FC08F6E4F2, _ts(scene), _r)
end

--- some kind of flag. Usually 0.
function Global.StartCutscene(p0)
	return _in(0x186D5CB5E7B0FF7B, p0)
end

--- p3: some kind of flag. Usually 0.
function Global.StartCutsceneAtCoords(x, y, z, p3)
	return _in(0x1C9ADDA3244A1FBF, x, y, z, p3)
end

function Global.StartEntityFire(entity)
	return _in(0xF6A9D9708F6F23DF, entity, _r, _ri)
end

function Global.StartFindKvp(prefix)
	return _in(0xdd379006, _ts(prefix), _r, _ri)
end

function Global.StartFiringAmnesty(duration)
	return _in(0xBF9BD71691857E48, duration)
end

--- Examples:
-- g_384A = SYSTEM::START_NEW_SCRIPT("cellphone_flashhand", 1424);
-- l_10D = SYSTEM::START_NEW_SCRIPT("taxiService", 1828);
-- SYSTEM::START_NEW_SCRIPT("AM_MP_YACHT", 5000);
-- SYSTEM::START_NEW_SCRIPT("emergencycall", 512);
-- SYSTEM::START_NEW_SCRIPT("emergencycall", 512);
-- SYSTEM::START_NEW_SCRIPT("FM_maintain_cloud_header_data", 1424);
-- SYSTEM::START_NEW_SCRIPT("FM_Mission_Controller", 31000);
-- SYSTEM::START_NEW_SCRIPT("tennis_family", 3650);
-- SYSTEM::START_NEW_SCRIPT("Celebrations", 3650);
-- Decompiled examples of usage when starting a script:
-- SCRIPT::REQUEST_SCRIPT(a_0);
-- if (SCRIPT::HAS_SCRIPT_LOADED(a_0)) {
-- SYSTEM::START_NEW_SCRIPT(a_0, v_3);
-- SCRIPT::SET_SCRIPT_AS_NO_LONGER_NEEDED(a_0);
-- return 1;
-- }
-- or:
-- v_2 = "MrsPhilips2";
-- SCRIPT::REQUEST_SCRIPT(v_2);
-- while (!SCRIPT::HAS_SCRIPT_LOADED(v_2)) {
-- SCRIPT::REQUEST_SCRIPT(v_2);
-- SYSTEM::WAIT(0);
-- }
-- sub_8792(36);
-- SYSTEM::START_NEW_SCRIPT(v_2, 17000);
-- SCRIPT::SET_SCRIPT_AS_NO_LONGER_NEEDED(v_2);
-- All native script names: pastebin.com/K9adDsu4 and pastebin.com/yLNWicUi
function Global.StartNewScript(scriptName, stackSize)
	return _in(0xE81651AD79516E48, _ts(scriptName), stackSize, _r, _ri)
end

--- return : script thread id, 0 if failed
-- Pass pointer to struct of args in p1, size of struct goes into p2
function Global.StartNewScriptWithArgs(scriptName, argCount, stackSize)
	return _in(0xB8BA7F44DF1575E1, _ts(scriptName), _i, argCount, stackSize, _r, _ri)
end

function Global.StartNewScriptWithNameHash(scriptHash, stackSize)
	return _in(0xEB1C67C3A5333A92, _ch(scriptHash), stackSize, _r, _ri)
end
Global.StartNewStreamedScript = Global.StartNewScriptWithNameHash

function Global.StartNewScriptWithNameHashAndArgs(scriptHash, argCount, stackSize)
	return _in(0xC4BB298BD441BE78, _ch(scriptHash), _i, argCount, stackSize, _r, _ri)
end
Global.StartNewStreamedScriptWithArgs = Global.StartNewScriptWithNameHashAndArgs

--- GRAPHICS::START_PARTICLE_FX_LOOPED_AT_COORD("scr_fbi_falling_debris", 93.7743f, -749.4572f, 70.86904f, 0f, 0f, 0f, 0x3F800000, 0, 0, 0, 0)
function Global.StartParticleFxLoopedAtCoord(effectName, x, y, z, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, p11)
	return _in(0xE184F4F0DC5910E7, _ts(effectName), x, y, z, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, p11, _r, _ri)
end

--- list: pastebin.com/N9unUFWY
function Global.StartParticleFxLoopedOnEntity(effectName, entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis)
	return _in(0x1AE42C1660FD6517, _ts(effectName), entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, _r, _ri)
end

--- Console Hash: 0x23BF0F9B
function Global.StartParticleFxLoopedOnEntityBone(effectName, entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, boneIndex, scale, xAxis, yAxis, zAxis)
	return _in(0xC6EB449E33977F0B, _ts(effectName), entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, boneIndex, scale, xAxis, yAxis, zAxis, _r, _ri)
end

--- Console Hash: 0xF478EFCF
-- network fx
function Global.StartParticleFxLoopedOnEntityBone_2(effectName, entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, boneIndex, scale, xAxis, yAxis, zAxis)
	return _in(0xDDE23F30CC5A0F03, _ts(effectName), entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, boneIndex, scale, xAxis, yAxis, zAxis, _r, _ri)
end
Global.N_0xdde23f30cc5a0f03 = Global.StartParticleFxLoopedOnEntityBone_2

--- network fx
function Global.StartParticleFxLoopedOnEntity_2(effectName, entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis)
	return _in(0x6F60E89A7B64EE1D, _ts(effectName), entity, xOffset, yOffset, zOffset, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, _r, _ri)
end
Global.N_0x6f60e89a7b64ee1d = Global.StartParticleFxLoopedOnEntity_2

function Global.StartParticleFxLoopedOnPedBone(effectName, ped, xOffset, yOffset, zOffset, xRot, yRot, zRot, boneIndex, scale, xAxis, yAxis, zAxis)
	return _in(0xF28DA9F38CD1787C, _ts(effectName), ped, xOffset, yOffset, zOffset, xRot, yRot, zRot, boneIndex, scale, xAxis, yAxis, zAxis, _r, _ri)
end

--- GRAPHICS::START_PARTICLE_FX_NON_LOOPED_AT_COORD("scr_paleto_roof_impact", -140.8576f, 6420.789f, 41.1391f, 0f, 0f, 267.3957f, 0x3F800000, 0, 0, 0);
-- Axis - Invert Axis Flags
-- list: pastebin.com/N9unUFWY
-- -------------------------------------------------------------------
-- C#
-- Function.Call&lt;int&gt;(Hash.START_PARTICLE_FX_NON_LOOPED_AT_COORD, = you are calling this function.
-- char *effectname = This is an in-game effect name, for e.g. "scr_fbi4_trucks_crash" is used to give the effects when truck crashes etc
-- float x, y, z pos = this one is Simple, you just have to declare, where do you want this effect to take place at, so declare the ordinates
-- float xrot, yrot, zrot = Again simple? just mention the value in case if you want the effect to rotate.
-- float scale = is declare the scale of the effect, this may vary as per the effects for e.g 1.0f
-- bool xaxis, yaxis, zaxis = To bool the axis values.
-- example:
-- Function.Call&lt;int&gt;(Hash.START_PARTICLE_FX_NON_LOOPED_AT_COORD, "scr_fbi4_trucks_crash", GTA.Game.Player.Character.Position.X, GTA.Game.Player.Character.Position.Y, GTA.Game.Player.Character.Position.Z + 4f, 0, 0, 0, 5.5f, 0, 0, 0);
function Global.StartParticleFxNonLoopedAtCoord(effectName, xPos, yPos, zPos, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis)
	return _in(0x25129531F77B9ED3, _ts(effectName), xPos, yPos, zPos, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, _r, _ri)
end

--- network fx
function Global.StartParticleFxNonLoopedAtCoord_2(effectName, xPos, yPos, zPos, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis)
	return _in(0xF56B8137DF10135D, _ts(effectName), xPos, yPos, zPos, xRot, yRot, zRot, scale, xAxis, yAxis, zAxis, _r)
end

--- Starts a particle effect on an entity for example your player.
-- List: pastebin.com/N9unUFWY
-- Example:
-- C#:
-- Function.Call(Hash.REQUEST_NAMED_PTFX_ASSET, "scr_rcbarry2");                     Function.Call(Hash._SET_PTFX_ASSET_NEXT_CALL, "scr_rcbarry2");                             Function.Call(Hash.START_PARTICLE_FX_NON_LOOPED_ON_ENTITY, "scr_clown_appears", Game.Player.Character, 0.0, 0.0, -0.5, 0.0, 0.0, 0.0, 1.0, false, false, false);
-- Internally this calls the same function as GRAPHICS::START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE
-- however it uses -1 for the specified bone index, so it should be possible to start a non looped fx on an entity bone using that native
function Global.StartParticleFxNonLoopedOnEntity(effectName, entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ)
	return _in(0x0D53A3B8DA0809D2, _ts(effectName), entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ, _r)
end

--- Console hash: 0x469A2B4A
-- network fx
function Global.StartParticleFxNonLoopedOnEntity_2(effectName, entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ)
	return _in(0xC95EB1DB6E92113D, _ts(effectName), entity, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, scale, axisX, axisY, axisZ, _r)
end

--- GRAPHICS::START_PARTICLE_FX_NON_LOOPED_ON_PED_BONE("scr_sh_bong_smoke", PLAYER::PLAYER_PED_ID(), -0.025f, 0.13f, 0f, 0f, 0f, 0f, 31086, 0x3F800000, 0, 0, 0);
-- Axis - Invert Axis Flags
-- list: pastebin.com/N9unUFWY
function Global.StartParticleFxNonLoopedOnPedBone(effectName, ped, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, boneIndex, scale, axisX, axisY, axisZ)
	return _in(0x0E7E72961BA18619, _ts(effectName), ped, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, boneIndex, scale, axisX, axisY, axisZ, _r)
end

--- network fx
function Global.StartParticleFxNonLoopedOnPedBone_2(effectName, ped, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, boneIndex, scale, axisX, axisY, axisZ)
	return _in(0xA41B6A43642AC2CF, _ts(effectName), ped, offsetX, offsetY, offsetZ, rotX, rotY, rotZ, boneIndex, scale, axisX, axisY, axisZ, _r)
end

function Global.StartPlaybackRecordedVehicle(vehicle, p1, playback, p3)
	return _in(0x3F878F92B3A7A071, vehicle, p1, _ts(playback), p3)
end

function Global.StartPlaybackRecordedVehicleUsingAi(p0, p1, p3, p4)
	return _in(0x29DE5FA52D00428C, p0, p1, _i, p3, p4)
end

function Global.StartPlaybackRecordedVehicleWithFlags(vehicle, p1, playback, p3, p4, p5)
	return _in(0x7D80FD645D4DA346, vehicle, p1, _ts(playback), p3, p4, p5)
end

--- // this enum comes directly from R* so don't edit this
-- enum ePlayerSwitchTypes
-- {
-- SWITCH_TYPE_AUTO,
-- SWITCH_TYPE_LONG,
-- SWITCH_TYPE_MEDIUM,
-- SWITCH_TYPE_SHORT
-- };
-- Use GET_IDEAL_PLAYER_SWITCH_TYPE for the best switch type.
-- ----------------------------------------------------
-- Examples from the decompiled scripts:
-- STREAMING::START_PLAYER_SWITCH(l_832._f3, PLAYER::PLAYER_PED_ID(), 0, 3);
-- STREAMING::START_PLAYER_SWITCH(l_832._f3, PLAYER::PLAYER_PED_ID(), 2050, 3);
-- STREAMING::START_PLAYER_SWITCH(PLAYER::PLAYER_PED_ID(), l_832._f3, 1024, 3);
-- STREAMING::START_PLAYER_SWITCH(g_141F27, PLAYER::PLAYER_PED_ID(), 513, v_14);
-- Note: DO NOT, use SWITCH_TYPE_LONG with flag 513. It leaves you stuck in the clouds. You'll have to call STOP_PLAYER_SWITCH() to return to your ped.
-- Flag 8 w/ SWITCH_TYPE_LONG will zoom out 3 steps, then zoom in 2/3 steps and stop on the 3rd and just hang there.
-- Flag 8 w/ SWITCH_TYPE_MEDIUM will zoom out 1 step, and just hang there.
function Global.StartPlayerSwitch(from, to, flags, switchType)
	return _in(0xFAA23F2CBA159D67, from, to, flags, switchType)
end

function Global.StartPlayerTeleport(player, x, y, z, heading, p5, p6, p7)
	return _in(0xAD15F075A4DA0FDE, player, x, y, z, heading, p5, p6, p7)
end

function Global.StartPreloadedConversation()
	return _in(0x23641AFE870AF385)
end

--- Starts recording a replay.
-- If mode is 0, turns on action replay.
-- If mode is 1, starts recording.
-- If already recording a replay, does nothing.
function Global.StartRecording(mode)
	return _in(0xC3AC2FFF9612AC81, mode)
end
Global.N_0xc3ac2fff9612ac81 = Global.StartRecording

function Global.StartRopeUnwindingFront(rope)
	return _in(0x538D1179EC1AA9A9, rope)
end

function Global.StartRopeWinding(rope)
	return _in(0x1461C72C889E343E, rope)
end

--- Second parameter might be length.
function Global.StartSaveArray(p1, arrayName)
	return _in(0x60FE567DF1B1AF9D, _i, p1, _ts(arrayName))
end

function Global.StartSaveData(p1, p2)
	return _in(0xA9575F812C6A7997, _i, p1, p2)
end

--- Second parameter might be length.
function Global.StartSaveStruct(p1, structName)
	return _in(0xBF737600CDDBEADD, _i, p1, _ts(structName))
end

--- playLength - is how long to play the effect for in milliseconds. If 0, it plays the default length
-- if loop is true, the effect wont stop until you call _STOP_SCREEN_EFFECT on it. (only loopable effects)
-- Example and list of screen FX: www.pastebin.com/dafBAjs0
function Global.StartScreenEffect(effectName, duration, looped)
	return _in(0x2206BF9A37B7F724, _ts(effectName), duration, looped)
end

function Global.StartScriptConversation(p0, p1, p2, p3)
	return _in(0x6B17C62C9635D2DC, p0, p1, p2, p3)
end

--- Starts a fire:
-- xyz: Location of fire
-- maxChildren: The max amount of times a fire can spread to other objects. Must be 25 or less, or the function will do nothing.
-- isGasFire: Whether or not the fire is powered by gasoline.
function Global.StartScriptFire(X, Y, Z, maxChildren, isGasFire)
	return _in(0x6B83617E04503888, X, Y, Z, maxChildren, isGasFire, _r, _ri)
end

function Global.StartScriptPhoneConversation(p0, p1)
	return _in(0x252E5F915EABB675, p0, p1)
end

function Global.StartShapeTestBound(entity, flags1, flags2)
	return _in(0x37181417CE7C8900, entity, flags1, flags2, _r, _ri)
end
Global.N_0x37181417ce7c8900 = Global.StartShapeTestBound

function Global.StartShapeTestBoundingBox(entity, flags1, flags2)
	return _in(0x052837721A854EC7, entity, flags1, flags2, _r, _ri)
end
Global.N_0x052837721a854ec7 = Global.StartShapeTestBoundingBox

function Global.StartShapeTestBox(x, y, z, x1, y2, z2, rotX, rotY, rotZ, p9, p10, entity, p12)
	return _in(0xFE466162C4401D18, x, y, z, x1, y2, z2, rotX, rotY, rotZ, p9, p10, entity, p12, _r, _ri)
end
Global.N_0xfe466162c4401d18 = Global.StartShapeTestBox

--- Raycast from point to point, where the ray has a radius.
-- flags:
-- vehicles=10
-- peds =12
-- Iterating through flags yields many ped / vehicle/ object combinations
-- p9 = 7, but no idea what it does
-- Entity is an entity to ignore
function Global.StartShapeTestCapsule(x1, y1, z1, x2, y2, z2, radius, flags, entity, p9)
	return _in(0x28579D1B8F8AAC80, x1, y1, z1, x2, y2, z2, radius, flags, entity, p9, _r, _ri)
end
Global.Cast_3dRayPointToPoint = Global.StartShapeTestCapsule

--- Returns a ray (?) going from x1, y1, z1 to x2, y2, z2.
-- entity = 0 most of the time.
-- p8 = 7 most of the time.
-- Result of this function is passed to WORLDPROBE::_GET_RAYCAST_RESULT as a first argument.
function Global.StartShapeTestLosProbe(x1, y1, z1, x2, y2, z2, flags, entity, p8)
	return _in(0x7EE9F5D83DD4F90E, x1, y1, z1, x2, y2, z2, flags, entity, p8, _r, _ri)
end
Global.N_0x7ee9f5d83dd4f90e = Global.StartShapeTestLosProbe

--- Not sure how or why this differs from 0x7EE9F5D83DD4F90E, but it does.
-- This function casts a ray from Point1 to Point2 and returns it's ray handle.  A simple ray cast will 'shoot' a line from point A to point B, and return whether or not the ray reached it's destination or if it hit anything and if it did hit anything, will return the handle of what it hit (entity handle) and coordinates of where the ray reached.
-- You can use _GET_RAYCAST_RESULT to get the result of the raycast
-- Entity is an entity to ignore, such as the player.
-- Flags are intersection bit flags.  They tell the ray what to care about and what not to care about when casting. Passing -1 will intersect with everything, presumably.
-- Flags:
-- 1: Intersect with map
-- 2: Intersect with vehicles (used to be mission entities?) (includes train)
-- 4: Intersect with peds? (same as 8)
-- 8: Intersect with peds? (same as 4)
-- 16: Intersect with objects
-- 32: Unknown
-- 64: Unknown
-- 128: Unknown
-- 256: Intersect with vegetation (plants, coral. trees not included)
-- NOTE: Raycasts that intersect with mission_entites (flag = 2) has limited range and will not register for far away entites. The range seems to be about 30 metres.
function Global.StartShapeTestRay(x1, y1, z1, x2, y2, z2, flags, entity, p8)
	return _in(0x377906D8A31E5586, x1, y1, z1, x2, y2, z2, flags, entity, p8, _r, _ri)
end
Global.CastRayPointToPoint = Global.StartShapeTestRay

function Global.StartVehicleAlarm(vehicle)
	return _in(0xB8FF7AB45305C345, vehicle, _r, _ri)
end

--- Sounds the horn for the specified vehicle.
-- vehicle: The vehicle to activate the horn for.
-- mode: The hash of "NORMAL" or "HELDDOWN". Can be 0.
-- duration: The duration to sound the horn, in milliseconds.
-- Note: If a player is in the vehicle, it will only sound briefly.
function Global.StartVehicleHorn(vehicle, duration, mode, forever)
	return _in(0x9C8C6504B5B63D2C, vehicle, duration, _ch(mode), forever)
end

--- Please change to "void"!
-- ---------------------------------
-- Example:
-- for (v_2 = 0; v_2 &lt;= 4; v_2 += 1) {
-- STATS::STAT_CLEAR_SLOT_FOR_RELOAD(v_2);
-- }
function Global.StatClearSlotForReload(statSlot)
	return _in(0xEB0A72181D4AA4AD, statSlot, _r, _ri)
end

function Global.StatDeleteSlot(p0)
	return _in(0x49A49BED12794D70, p0, _r, _ri)
end

function Global.StatGetBool(statHash, p2)
	return _in(0x11B5E6D2AE73F48E, _ch(statHash), _i --[[ actually bool ]], p2, _r)
end

--- p2 - Default value? Seems to be -1 most of the time.
function Global.StatGetBoolMasked(statName, mask, p2)
	return _in(0x10FE3F1B79F9B071, _ch(statName), mask, p2, _r)
end

function Global.StatGetDate(statHash, p2, p3)
	return _in(0x8B0FACEFC36C824B, _ch(statHash), _i, p2, p3, _r)
end

function Global.StatGetFloat(statHash, p2)
	return _in(0xD7AE6C9C9C6AC54C, _ch(statHash), _f, p2, _r)
end

--- p2 appears to always be -1
function Global.StatGetInt(statHash, p2)
	return _in(0x767FBC2AC802EF3D, _ch(statHash), _i, p2, _r)
end

function Global.StatGetLicensePlate(statName)
	return _in(0x5473D4195058B2E4, _ch(statName), _r, _s)
end

function Global.StatGetMaskedInt(p0, p2, p3, p4)
	return _in(0x655185A06D9EEAAB, p0, _i, p2, p3, p4, _r)
end

function Global.StatGetNumberOfDays(statName)
	return _in(0xE0E854F5280FB769, _ch(statName), _r, _ri)
end
Global.N_0xe0e854f5280fb769 = Global.StatGetNumberOfDays

function Global.StatGetNumberOfHours(statName)
	return _in(0xF2D4B2FE415AAFC3, _ch(statName), _r, _ri)
end
Global.N_0xf2d4b2fe415aafc3 = Global.StatGetNumberOfHours

function Global.StatGetNumberOfMinutes(statName)
	return _in(0x7583B4BE4C5A41B5, _ch(statName), _r, _ri)
end
Global.N_0x7583b4be4c5a41b5 = Global.StatGetNumberOfMinutes

function Global.StatGetNumberOfSeconds(statName)
	return _in(0x2CE056FF3723F00B, _ch(statName), _r, _ri)
end
Global.N_0x2ce056ff3723f00b = Global.StatGetNumberOfSeconds

function Global.StatGetPos(p0, p4)
	return _in(0x350F82CCB186AA1B, p0, _i, _i, _i, p4, _r)
end

--- p1 is always -1 in the script files
function Global.StatGetString(statHash, p1)
	return _in(0xE50384ACC2C3DB74, _ch(statHash), p1, _r, _s)
end

--- Needs more research. Seems to return "STAT_UNKNOWN" if no such user id exists.
function Global.StatGetUserId(p0)
	return _in(0x2365C388E393BBE2, p0, _r, _s)
end

function Global.StatIncrement(statName, value)
	return _in(0x9B5A68C6489E9909, _ch(statName), value)
end

function Global.StatLoad(p0)
	return _in(0xA651443F437B1CE6, p0, _r)
end

function Global.StatLoadPending(p0)
	return _in(0xA1750FFAFA181661, p0, _r)
end

function Global.StatSave(p0, p1, p2)
	return _in(0xE07BCA305B82D2FD, p0, p1, p2, _r)
end

function Global.StatSavePending()
	return _in(0x7D3A583856F2C5AC, _r, _ri)
end

function Global.StatSavePendingOrRequested()
	return _in(0xBBB6AD006F1BBEA3, _r, _ri)
end

function Global.StatSetBool(statName, value, save)
	return _in(0x4B33C4243DE0C432, _ch(statName), value, save, _r)
end

function Global.StatSetBoolMasked(statName, value, mask, save)
	return _in(0x5BC62EC1937B9E5B, _ch(statName), value, mask, save, _r)
end

--- p1 always true.
function Global.StatSetCurrentPosixTime(statName, p1)
	return _in(0xC2F84B7F9C4D0C61, _ch(statName), p1, _r)
end

--- 'value' is a structure to a structure, 'numFields' is how many fields there are in said structure (usually 7).
-- The structure looks like this:
-- int year
-- int month
-- int day
-- int hour
-- int minute
-- int second
-- int millisecond
-- The decompiled scripts use TIME::GET_POSIX_TIME to fill this structure.
function Global.StatSetDate(statName, numFields, save)
	return _in(0x2C29BFB64F4FCBE4, _ch(statName), _i, numFields, save, _r)
end

function Global.StatSetFloat(statName, value, save)
	return _in(0x4851997F37FE9B3C, _ch(statName), value, save, _r)
end

--- The following values have been found in the decompiled scripts:
-- "RC_ABI1"
-- "RC_ABI2"
-- "RC_BA1"
-- "RC_BA2"
-- "RC_BA3"
-- "RC_BA3A"
-- "RC_BA3C"
-- "RC_BA4"
-- "RC_DRE1"
-- "RC_EPS1"
-- "RC_EPS2"
-- "RC_EPS3"
-- "RC_EPS4"
-- "RC_EPS5"
-- "RC_EPS6"
-- "RC_EPS7"
-- "RC_EPS8"
-- "RC_EXT1"
-- "RC_EXT2"
-- "RC_EXT3"
-- "RC_EXT4"
-- "RC_FAN1"
-- "RC_FAN2"
-- "RC_FAN3"
-- "RC_HAO1"
-- "RC_HUN1"
-- "RC_HUN2"
-- "RC_JOS1"
-- "RC_JOS2"
-- "RC_JOS3"
-- "RC_JOS4"
-- "RC_MAU1"
-- "RC_MIN1"
-- "RC_MIN2"
-- "RC_MIN3"
-- "RC_MRS1"
-- "RC_MRS2"
-- "RC_NI1"
-- "RC_NI1A"
-- "RC_NI1B"
-- "RC_NI1C"
-- "RC_NI1D"
-- "RC_NI2"
-- "RC_NI3"
-- "RC_OME1"
-- "RC_OME2"
-- "RC_PA1"
-- "RC_PA2"
-- "RC_PA3"
-- "RC_PA3A"
-- "RC_PA3B"
-- "RC_PA4"
-- "RC_RAM1"
-- "RC_RAM2"
-- "RC_RAM3"
-- "RC_RAM4"
-- "RC_RAM5"
-- "RC_SAS1"
-- "RC_TON1"
-- "RC_TON2"
-- "RC_TON3"
-- "RC_TON4"
-- "RC_TON5"
function Global.StatSetGxtLabel(statName, value, save)
	return _in(0x17695002FD8B2AE0, _ch(statName), _ts(value), save, _r)
end

--- Add Cash example:
-- for (int i = 0; i &lt; 3; i++)
-- {
-- char statNameFull[32];
-- sprintf_s(statNameFull, "SP%d_TOTAL_CASH", i);
-- Hash hash = GAMEPLAY::GET_HASH_KEY(statNameFull);
-- int val;
-- STATS::STAT_GET_INT(hash, &amp;val, -1);
-- val += 1000000;
-- STATS::STAT_SET_INT(hash, val, 1);
-- }
function Global.StatSetInt(statName, value, save)
	return _in(0xB3271D7AB655B441, _ch(statName), value, save, _r)
end

function Global.StatSetLicensePlate(statName, str)
	return _in(0x69FF13266D7296DA, _ch(statName), _ts(str), _r)
end

function Global.StatSetMaskedInt(statName, p1, p2, p3, save)
	return _in(0x7BBB1B54583ED410, _ch(statName), p1, p2, p3, save, _r)
end

function Global.StatSetPos(statName, x, y, z, save)
	return _in(0xDB283FDE680FE72E, _ch(statName), x, y, z, save, _r)
end

--- Does not take effect immediately, unfortunately.
-- profileSetting seems to only be 936, 937 and 938 in scripts
function Global.StatSetProfileSetting(profileSetting, value)
	return _in(0x68F01422BE1D838F, profileSetting, value)
end
Global.N_0x68f01422be1d838f = Global.StatSetProfileSetting

function Global.StatSetString(statName, value, save)
	return _in(0xA87B2335D12531D7, _ch(statName), _ts(value), save, _r)
end

function Global.StatSetUserId(statName, value, save)
	return _in(0x8CDDF1E452BABE11, _ch(statName), _ts(value), save, _r)
end

function Global.StatSlotIsLoaded(p0)
	return _in(0x0D0A9F0E7BD91E3C, p0, _r)
end

--- This seems like a hash collision?
-- p1 (toggle) was always 1 (true) except in one case in the b678 scripts.
function Global.SteerUnlockBias(vehicle, toggle)
	return _in(0x07116E24E9D1929D, vehicle, toggle)
end

--- Example:
-- This will stop the alarm at Fort Zancudo.
-- AUDIO::STOP_ALARM("PORT_OF_LS_HEIST_FORT_ZANCUDO_ALARMS", 1);
-- First parameter (char) is the name of the alarm.
-- Second parameter (bool) has to be true (1) to have any effect.
function Global.StopAlarm(alarmName, toggle)
	return _in(0xA1CADDCD98415A41, _ts(alarmName), toggle)
end

function Global.StopAllAlarms(stop)
	return _in(0x2F794A877ADD4C92, stop)
end

function Global.StopAllGarageActivity()
	return _in(0x0F87E938BDF29D66)
end

function Global.StopAllScreenEffects()
	return _in(0xB4EDDC19532BFB85)
end

function Global.StopAnimPlayback(ped, p1, p2)
	return _in(0xEE08C992D238C5D1, ped, p1, p2)
end

function Global.StopAnimTask(ped, animDictionary, animationName, p3)
	return _in(0x97FF36A1D40EA00A, ped, _ts(animDictionary), _ts(animationName), p3)
end

function Global.StopAnyPedModelBeingSuppressed()
	return _in(0xB47BD05FA66B40CF)
end

function Global.StopAudioScene(scene)
	return _in(0xDFE8422B3B94E688, _ts(scene))
end

--- ??
function Global.StopAudioScenes()
	return _in(0xBAC7FC81A75EC1A1)
end

function Global.StopCamPointing(cam)
	return _in(0xF33AB75780BA57DE, cam)
end

function Global.StopCamShaking(cam, p1)
	return _in(0xBDECF64367884AC3, cam, p1)
end

function Global.StopCinematicCamShaking(p0)
	return _in(0x2238E588E588A6D7, p0)
end

function Global.StopCinematicShot(p0)
	return _in(0x7660C6E75D3A078E, p0)
end

--- Needs to be called every frame.
function Global.StopCurrentPlayingAmbientSpeech(ped)
	return _in(0xB8BEC0CA6F0EDB0F, ped)
end

function Global.StopCutscene(p0)
	return _in(0xC7272775B4DC786E, p0)
end

function Global.StopCutsceneCamShaking()
	return _in(0xDB629FFD9285FA06)
end

function Global.StopCutsceneImmediately()
	return _in(0xD220BDD222AC4A1E)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
-- RAGEPluginHook list: docs.ragepluginhook.net/html/62951c37-a440-478c-b389-c471230ddfc5.htm
function Global.StopEntityAnim(entity, animation, animGroup, p3)
	return _in(0x28004F88151E03E0, entity, _ts(animation), _ts(animGroup), p3, _r, _ri)
end

function Global.StopEntityFire(entity)
	return _in(0x7F0DD2EBBB651AFF, entity)
end

function Global.StopFireInRange(x, y, z, radius)
	return _in(0x056A8A219B8E829F, x, y, z, radius)
end

function Global.StopGameplayCamShaking(p0)
	return _in(0x0EF93E9F3D08C178, p0)
end

function Global.StopGameplayHint(p0)
	return _in(0xF46C581C61718916, p0)
end

function Global.StopPadShake(p0)
	return _in(0x38C16A305E8CDC8D, p0)
end

--- p1 is always 0 in the native scripts
function Global.StopParticleFxLooped(ptfxHandle, p1)
	return _in(0x8F75998877616996, ptfxHandle, p1)
end

function Global.StopPedRingtone(ped)
	return _in(0x6C5AE23EFA885092, ped)
end

function Global.StopPedSpeaking(ped, shaking)
	return _in(0x9D64D7405520E3D3, ped, shaking)
end

function Global.StopPedWeaponFiringWhenDropped(ped)
	return _in(0xC158D28142A34608, ped)
end

function Global.StopPlaybackRecordedVehicle(p0)
	return _in(0x54833611C17ABDEA, p0)
end

function Global.StopPlayerSwitch()
	return _in(0x95C0A5BBDC189AA1)
end

--- Disables the player's teleportation
function Global.StopPlayerTeleport()
	return _in(0xC449EDED9D73009C)
end

--- Stops recording and discards the recorded clip.
function Global.StopRecordingAndDiscardClip()
	return _in(0x88BB3507ED41A240)
end
Global.N_0x88bb3507ed41a240 = Global.StopRecordingAndDiscardClip

--- Stops recording and saves the recorded clip.
function Global.StopRecordingAndSaveClip()
	return _in(0x071A5197D6AFC8B3)
end
Global.StopRecording = Global.StopRecordingAndSaveClip

function Global.StopRopeUnwindingFront(rope)
	return _in(0xFFF3A50779EFBBB3, rope)
end

function Global.StopRopeWinding(rope)
	return _in(0xCB2D4AB84A19AA7C, rope)
end

function Global.StopSaveArray()
	return _in(0x04456F95153C6BE4)
end

function Global.StopSaveData()
	return _in(0x74E20C9145FB66FD)
end

function Global.StopSaveStruct()
	return _in(0xEB1774DF12BB9F12)
end

function Global.StopScreenEffect(effectName)
	return _in(0x068E835A1D0DC0E3, _ts(effectName))
end

--- In drunk_controller.c4, sub_309
-- if (CAM::_C912AF078AF19212()) {
-- CAM::_1C9D7949FA533490(0);
-- }
function Global.StopScriptGlobalShaking(p0)
	return _in(0x1C9D7949FA533490, p0)
end
Global.N_0x1c9d7949fa533490 = Global.StopScriptGlobalShaking

function Global.StopScriptedConversation(p0)
	return _in(0xD79DEEFB53455EBA, p0, _r, _ri)
end

function Global.StopSound(soundId)
	return _in(0xA3B0C41BA5CC0BB5, soundId)
end

function Global.StopStream()
	return _in(0xA4718A1419D18151)
end

function Global.StopSynchronizedAudioEvent(p0)
	return _in(0x92D6A88E64A94430, p0, _r)
end

--- p1 sync task id?
function Global.StopSynchronizedEntityAnim(entity, p1, p2)
	return _in(0x43D3807C077261E3, entity, p1, p2, _r)
end

function Global.StopSynchronizedMapEntityAnim(p0, p1, p2, p3, p4, p5)
	return _in(0x11E79CAB7183B6F5, p0, p1, p2, p3, p4, p5, _r)
end

--- Returns false if it's a null or empty string or if the string is too long. outInteger will be set to -999 in that case.
-- If all checks have passed successfully, the return value will be set to whatever strtol(string, 0i64, 10); returns.
function Global.StringToInt(string, outInteger)
	return _in(0x5A5F40FE637EB584, _ts(string), _ii(outInteger) --[[ may be optional ]], _r)
end

function Global.SuppressAgitationEventsNextFrame()
	return _in(0x5F3B7749C112D552)
end

function Global.SuppressShockingEventTypeNextFrame(type)
	return _in(0x3FD2EC8BF1F1CF30, type)
end

function Global.SuppressShockingEventsNextFrame()
	return _in(0x2F9A292AD0A3BD89)
end

--- This was previously named as "RESERVE_ENTITY_EXPLODES_ON_HIGH_EXPLOSION_COMBO"
-- which is obviously incorrect.
-- Seems to only appear in scripts used in Singleplayer. p1 ranges from 2 - 46.
-- I assume this switches the crime type
function Global.SwitchCrimeType(player, p1)
	return _in(0x9A987297ED8BD838, player, p1)
end
Global.N_0x9a987297ed8bd838 = Global.SwitchCrimeType

--- fucks up on mount chilliad
function Global.SwitchOutPlayer(ped, flags, unknown)
	return _in(0xAAB3200ED59016BC, ped, flags, unknown)
end
Global.N_0xaab3200ed59016bc = Global.SwitchOutPlayer

function Global.SwitchTrainTrack(intersectionId, state)
	return _in(0xFD813BB7DB977F20, intersectionId, state, _r, _ri)
end

function Global.Tan(p0)
	return _in(0x632106CC96E82E91, p0, _r, _rf)
end

--- Makes the specified ped achieve the specified heading.
-- pedHandle: The handle of the ped to assign the task to.
-- heading: The desired heading.
-- timeout: The time, in milliseconds, to allow the task to complete. If the task times out, it is cancelled, and the ped will stay at the heading it managed to reach in the time.
function Global.TaskAchieveHeading(ped, heading, timeout)
	return _in(0x93B93A37987F1F3D, ped, heading, timeout)
end

function Global.TaskAimGunAtCoord(ped, x, y, z, time, p5, p6)
	return _in(0x6671F3EEC681BDA1, ped, x, y, z, time, p5, p6)
end

--- duration: the amount of time in milliseconds to do the task.  -1 will keep the task going until either another task is applied, or CLEAR_ALL_TASKS() is called with the ped
function Global.TaskAimGunAtEntity(ped, entity, duration, p3)
	return _in(0x9B53BB6E8943AF53, ped, entity, duration, p3)
end

function Global.TaskAimGunScripted(ped, scriptTask, p2, p3)
	return _in(0x7A192BE16D373D00, ped, _ch(scriptTask), p2, p3)
end

function Global.TaskAimGunScriptedWithTarget(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x8605AF0DE8B3A5AC, p0, p1, p2, p3, p4, p5, p6, p7)
end

--- Example from "me_amanda1.ysc.c4":
-- AI::TASK_ARREST_PED(l_19F /* This is a Ped */ , PLAYER::PLAYER_PED_ID());
-- Example from "armenian1.ysc.c4":
-- if (!PED::IS_PED_INJURED(l_B18[0/*1*/])) {
-- AI::TASK_ARREST_PED(l_B18[0/*1*/], PLAYER::PLAYER_PED_ID());
-- }
-- I would love to have time to experiment to see if a player Ped can arrest another Ped. Might make for a good cop mod.
-- Looks like only the player can be arrested this way. Peds react and try to arrest you if you task them, but the player charater doesn't do anything if tasked to arrest another ped.
function Global.TaskArrestPed(ped, target)
	return _in(0xF3B9A78A178572B1, ped, target)
end

--- You need to call PED::SET_BLOCKING_OF_NON_TEMPORARY_EVENTS after TASK_BOAT_MISSION in order for the task to execute.
-- Working example
-- float vehicleMaxSpeed = VEHICLE::_GET_VEHICLE_MAX_SPEED(ENTITY::GET_ENTITY_MODEL(pedVehicle));
-- AI::TASK_BOAT_MISSION(pedDriver, pedVehicle, 0, 0, waypointCoord.x, waypointCoord.y, waypointCoord.z, 4, vehicleMaxSpeed, 786469, -1.0, 7);
-- PED::SET_BLOCKING_OF_NON_TEMPORARY_EVENTS(pedDriver, 1);
-- P8 appears to be driving style flag - see gtaforums.com/topic/822314-guide-driving-styles/ for documentation
function Global.TaskBoatMission(pedDriver, boat, p2, p3, x, y, z, p7, maxSpeed, drivingStyle, p10, p11)
	return _in(0x15C86013127CE63F, pedDriver, boat, p2, p3, x, y, z, p7, maxSpeed, drivingStyle, p10, p11)
end

--- p2 tend to be 16, 17 or 1
-- p3 to p7 tend to be 0.0
function Global.TaskChatToPed(ped, target, p2, p3, p4, p5, p6, p7)
	return _in(0x8C338E0263E4FD19, ped, target, p2, p3, p4, p5, p6, p7)
end

function Global.TaskClearDefensiveArea(p0)
	return _in(0x95A6C46A31D1917D, p0)
end

--- Not clear what it actually does, but here's how script uses it -
-- if (OBJECT::HAS_PICKUP_BEEN_COLLECTED(...)
-- {
-- if(ENTITY::DOES_ENTITY_EXIST(PLAYER::PLAYER_PED_ID()))
-- {
-- AI::TASK_CLEAR_LOOK_AT(PLAYER::PLAYER_PED_ID());
-- }
-- ...
-- }
-- Another one where it doesn't "look" at current player -
-- AI::TASK_PLAY_ANIM(l_3ED, "missheist_agency2aig_2", "look_at_phone_a", 1000.0, -2.0, -1, 48, v_2, 0, 0, 0);
-- PED::_2208438012482A1A(l_3ED, 0, 0);
-- AI::TASK_CLEAR_LOOK_AT(l_3ED);
function Global.TaskClearLookAt(ped)
	return _in(0x0F804F1DB19B9689, ped)
end

--- Climbs or vaults the nearest thing.
function Global.TaskClimb(ped, unused)
	return _in(0x89D9FCC2435112F1, ped, unused)
end

function Global.TaskClimbLadder(ped, p1)
	return _in(0xB6C987F9285A3814, ped, p1)
end

--- Despite its name, it only attacks ONE hated target. The one closest hated target.
-- p2 seems to be always 0
function Global.TaskCombatHatedTargetsAroundPed(ped, radius, p2)
	return _in(0x7BF835BB9E2698C8, ped, radius, p2)
end

function Global.TaskCombatHatedTargetsAroundPedTimed(p0, p1, p2, p3)
	return _in(0x2BBA30B854534A0C, p0, p1, p2, p3)
end

--- Despite its name, it only attacks ONE hated target. The one closest to the specified position.
function Global.TaskCombatHatedTargetsInArea(ped, x, y, z, radius, p5)
	return _in(0x4CF5F55DAC3280A0, ped, x, y, z, radius, p5)
end

--- Makes the specified ped attack the target ped.
-- p2 should be 0
-- p3 should be 16
function Global.TaskCombatPed(ped, targetPed, p2, p3)
	return _in(0xF166E48407BAC484, ped, targetPed, p2, p3)
end

function Global.TaskCombatPedTimed(p0, ped, p2, p3)
	return _in(0x944F30DCB7096BDE, p0, ped, p2, p3)
end

function Global.TaskCower(ped, duration)
	return _in(0x3EB1FE9E8E908E15, ped, duration)
end

--- Example:
-- AI::TASK_DRIVE_BY(l_467[1/*22*/], PLAYER::PLAYER_PED_ID(), 0, 0.0, 0.0, 2.0, 300.0, 100, 0, ${firing_pattern_burst_fire_driveby});
-- Needs working example. Doesn't seem to do anything.
-- I marked p2 as targetVehicle as all these shooting related tasks seem to have that in common.
-- I marked p6 as distanceToShoot as if you think of GTA's Logic with the native SET_VEHICLE_SHOOT natives, it won't shoot till it gets within a certain distance of the target.
-- I marked p7 as pedAccuracy as it seems it's mostly 100 (Completely Accurate), 75, 90, etc. Although this could be the ammo count within the gun, but I highly doubt it. I will change this comment once I find out if it's ammo count or not.
function Global.TaskDriveBy(driverPed, targetPed, targetVehicle, targetX, targetY, targetZ, distanceToShoot, pedAccuracy, p8, firingPattern)
	return _in(0x2F8AF0E82773A171, driverPed, targetPed, targetVehicle, targetX, targetY, targetZ, distanceToShoot, pedAccuracy, p8, _ch(firingPattern))
end

--- speed 1.0 = walk, 2.0 = run
-- p5 1 = normal, 3 = teleport to vehicle, 16 = teleport directly into vehicle
-- p6 is always 0
-- Usage of seat
-- -1 = driver
-- 0 = passenger
-- 1 = left back seat
-- 2 = right back seat
-- 3 = outside left
-- 4 = outside right
function Global.TaskEnterVehicle(ped, vehicle, timeout, seat, speed, p5, p6)
	return _in(0xC20E50AA46D09CA8, ped, vehicle, timeout, seat, speed, p5, p6)
end

function Global.TaskEveryoneLeaveVehicle(vehicle)
	return _in(0x7F93691AB4B92272, vehicle)
end

function Global.TaskExitCover(p0, p1, p2, p3, p4)
	return _in(0x79B258E397854D29, p0, p1, p2, p3, p4)
end

--- MulleKD19: Adds a new point to the current point route. Call TASK_FLUSH_ROUTE before the first call to this. Call TASK_FOLLOW_POINT_ROUTE to make the Ped go the route.
-- A maximum of 8 points can be added.
function Global.TaskExtendRoute(x, y, z)
	return _in(0x1E7889778264843A, x, y, z)
end

--- MulleKD19: Clears the current point route. Call this before TASK_EXTEND_ROUTE and TASK_FOLLOW_POINT_ROUTE.
function Global.TaskFlushRoute()
	return _in(0x841142A1376E9006)
end

--- If no timeout, set timeout to -1.
function Global.TaskFollowNavMeshToCoord(ped, x, y, z, speed, timeout, stoppingRange, persistFollowing, unk)
	return _in(0x15D3A79D4E44B913, ped, x, y, z, speed, timeout, stoppingRange, persistFollowing, unk)
end

function Global.TaskFollowNavMeshToCoordAdvanced(ped, x, y, z, speed, timeout, unkFloat, unkInt, unkX, unkY, unkZ, unk_40000f)
	return _in(0x17F58B88D085DBAC, ped, x, y, z, speed, timeout, unkFloat, unkInt, unkX, unkY, unkZ, unk_40000f)
end

--- MulleKD19: Makes the ped go on the created point route.
-- ped: The ped to give the task to.
-- speed: The speed to move at in m/s.
-- int: Unknown. Can be 0, 1, 2 or 3.
-- Example:
-- TASK_FLUSH_ROUTE();
-- TASK_EXTEND_ROUTE(0f, 0f, 70f);
-- TASK_EXTEND_ROUTE(10f, 0f, 70f);
-- TASK_EXTEND_ROUTE(10f, 10f, 70f);
-- TASK_FOLLOW_POINT_ROUTE(GET_PLAYER_PED(), 1f, 0);
function Global.TaskFollowPointRoute(ped, speed, unknown)
	return _in(0x595583281858626E, ped, speed, unknown)
end

--- p6 always -1
-- p7 always 10.0
-- p8 always 1
function Global.TaskFollowToOffsetOfEntity(ped, entity, offsetX, offsetY, offsetZ, movementSpeed, timeout, stoppingRange, persistFollowing)
	return _in(0x304AE42E357B8C7E, ped, entity, offsetX, offsetY, offsetZ, movementSpeed, timeout, stoppingRange, persistFollowing)
end

function Global.TaskFollowWaypointRecording(p0, p1, p2, p3, p4)
	return _in(0x0759591819534F7B, p0, p1, p2, p3, p4)
end

--- p2 always false
-- [30/03/2017] ins1de :
-- See dev-c.com/nativedb/func/info/f28965d04f570dca
function Global.TaskForceMotionState(ped, state, p2)
	return _in(0x4F056E1AFFEF17AB, ped, _ch(state), p2)
end

--- Jenkins of this native is 0x4293601F. This is the actual name.
function Global.TaskGetOffBoat(ped, boat)
	return _in(0x9C00E77AF14B2DFF, ped, boat)
end

function Global.TaskGoStraightToCoord(ped, x, y, z, speed, timeout, targetHeading, distanceToSlide)
	return _in(0xD76B57B44F1E6F8B, ped, x, y, z, speed, timeout, targetHeading, distanceToSlide)
end

function Global.TaskGoStraightToCoordRelativeToEntity(entity1, entity2, p2, p3, p4, p5, p6)
	return _in(0x61E360B7E040D12E, entity1, entity2, p2, p3, p4, p5, p6)
end

--- The ped will walk or run towards goToLocation, aiming towards goToLocation or focusLocation (depending on the aimingFlag) and shooting if shootAtEnemies = true to any enemy in his path.
-- If the ped is closer than noRoadsDistance, the ped will ignore pathing/navmesh and go towards goToLocation directly. This could cause the ped to get stuck behind tall walls if the goToLocation is on the other side. To avoid this, use 0.0f and the ped will always use pathing/navmesh to reach his destination.
-- If the speed is set to 0.0f, the ped will just stand there while aiming, if set to 1.0f he will walk while aiming, 2.0f will run while aiming.
-- The ped will stop aiming when he is closer than distanceToStopAt to goToLocation.
-- I still can't figure out what unkTrue is used for. I don't notice any difference if I set it to false but in the decompiled scripts is always true.
-- I think that unkFlag, like the driving styles, could be a flag that "work as a list of 32 bits converted to a decimal integer. Each bit acts as a flag, and enables or disables a function". What leads me to this conclusion is the fact that in the decompiled scripts, unkFlag takes values like: 0, 1, 5 (101 in binary) and 4097 (4096 + 1 or 1000000000001 in binary). For now, I don't know what behavior enable or disable this possible flag so I leave it at 0.
-- Note: After some testing, using unkFlag = 16 (0x10) enables the use of sidewalks while moving towards goToLocation.
-- The aimingFlag takes 2 values: 0 to aim at the focusLocation, 1 to aim at where the ped is heading (goToLocation).
-- Example:
-- enum AimFlag
-- {
-- AimAtFocusLocation,
-- AimAtGoToLocation
-- };
-- Vector3 goToLocation1 = { 996.2867f, 0, -2143.044f, 0, 28.4763f, 0 }; // remember the padding.
-- Vector3 goToLocation2 = { 990.2867f, 0, -2140.044f, 0, 28.4763f, 0 }; // remember the padding.
-- Vector3 focusLocation = { 994.3478f, 0, -2136.118f, 0, 29.2463f, 0 }; // the coord z should be a little higher, around +1.0f to avoid aiming at the ground
-- // 1st example
-- AI::TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD(pedHandle, goToLocation1.x, goToLocation1.y, goToLocation1.z, focusLocation.x, focusLocation.y, focusLocation.z, 2.0f /*run*/, true /*shoot*/, 3.0f /*stop at*/, 0.0f /*noRoadsDistance*/, true /*always true*/, 0 /*possible flag*/, AimFlag::AimAtGoToLocation, -957453492 /*FullAuto pattern*/);
-- // 2nd example
-- AI::TASK_GO_TO_COORD_AND_AIM_AT_HATED_ENTITIES_NEAR_COORD(pedHandle, goToLocation2.x, goToLocation2.y, goToLocation2.z, focusLocation.x, focusLocation.y, focusLocation.z, 1.0f /*walk*/, false /*don't shoot*/, 3.0f /*stop at*/, 0.0f /*noRoadsDistance*/, true /*always true*/, 0 /*possible flag*/, AimFlag::AimAtFocusLocation, -957453492 /*FullAuto pattern*/);
-- 1st example: The ped (pedhandle) will run towards goToLocation1. While running and aiming towards goToLocation1, the ped will shoot on sight to any enemy in his path, using "FullAuto" firing pattern. The ped will stop once he is closer than distanceToStopAt to goToLocation1.
-- 2nd example: The ped will walk towards goToLocation2. This time, while walking towards goToLocation2 and aiming at focusLocation, the ped will point his weapon on sight to any enemy in his path without shooting. The ped will stop once he is closer than distanceToStopAt to goToLocation2.
function Global.TaskGoToCoordAndAimAtHatedEntitiesNearCoord(pedHandle, goToLocationX, goToLocationY, goToLocationZ, focusLocationX, focusLocationY, focusLocationZ, speed, shootAtEnemies, distanceToStopAt, noRoadsDistance, unkTrue, unkFlag, aimingFlag, firingPattern)
	return _in(0xA55547801EB331FC, pedHandle, goToLocationX, goToLocationY, goToLocationZ, focusLocationX, focusLocationY, focusLocationZ, speed, shootAtEnemies, distanceToStopAt, noRoadsDistance, unkTrue, unkFlag, aimingFlag, _ch(firingPattern))
end

--- example from fm_mission_controller
-- AI::TASK_GO_TO_COORD_ANY_MEANS(l_649, sub_f7e86(-1, 0), 1.0, 0, 0, 786603, 0xbf800000);
function Global.TaskGoToCoordAnyMeans(ped, x, y, z, speed, p5, p6, walkingStyle, p8)
	return _in(0x5BC448CB78FA3E88, ped, x, y, z, speed, p5, p6, walkingStyle, p8)
end

function Global.TaskGoToCoordAnyMeansExtraParams(ped, x, y, z, speed, p5, p6, walkingStyle, p8, p9, p10, p11)
	return _in(0x1DD45F9ECFDB1BC9, ped, x, y, z, speed, p5, p6, walkingStyle, p8, p9, p10, p11)
end

function Global.TaskGoToCoordAnyMeansExtraParamsWithCruiseSpeed(ped, x, y, z, speed, p5, p6, walkingStyle, p8, p9, p10, p11, p12)
	return _in(0xB8ECD61F531A7B02, ped, x, y, z, speed, p5, p6, walkingStyle, p8, p9, p10, p11, p12)
end

--- movement_speed: mostly 2f, but also 1/1.2f, etc.
-- p8: always false
-- p9: 2f
-- p10: 0.5f
-- p11: true
-- p12: 0 / 512 / 513, etc.
-- p13: 0
-- firing_pattern: ${firing_pattern_full_auto}, 0xC6EE6B4C
function Global.TaskGoToCoordWhileAimingAtCoord(ped, x, y, z, aimAtX, aimAtY, aimAtZ, moveSpeed, p8, p9, p10, p11, flags, p13, firingPattern)
	return _in(0x11315AB3385B8AC0, ped, x, y, z, aimAtX, aimAtY, aimAtZ, moveSpeed, p8, p9, p10, p11, flags, p13, _ch(firingPattern))
end

function Global.TaskGoToCoordWhileAimingAtEntity(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
	return _in(0xB2A16444EAD9AE47, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13)
end

--- The entity will move towards the target until time is over (duration) or get in target's range (distance). p5 and p6 are unknown, but you could leave p5 = 1073741824 or 100 or even 0 (didn't see any difference but on the decompiled scripts, they use 1073741824 mostly) and p6 = 0
-- Note: I've only tested it on entity -&gt; ped and target -&gt; vehicle. It could work differently on other entities, didn't try it yet.
-- Example: AI::TASK_GO_TO_ENTITY(pedHandle, vehicleHandle, 5000, 4.0, 100, 1073741824, 0)
-- Ped will run towards the vehicle for 5 seconds and stop when time is over or when he gets 4 meters(?) around the vehicle (with duration = -1, the task duration will be ignored).
function Global.TaskGoToEntity(entity, target, duration, distance, speed, p5, p6)
	return _in(0x6A071245EB0D1882, entity, target, duration, distance, speed, p5, p6)
end

function Global.TaskGoToEntityWhileAimingAtCoord(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	return _in(0x04701832B739DCE5, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
end

--- shootatEntity:
-- If true, peds will shoot at Entity till it is dead.
-- If false, peds will just walk till they reach the entity and will cease shooting.
function Global.TaskGoToEntityWhileAimingAtEntity(ped, entityToWalkTo, entityToAimAt, speed, shootatEntity, p5, p6, p7, p8, firingPattern)
	return _in(0x97465886D35210E9, ped, entityToWalkTo, entityToAimAt, speed, shootatEntity, p5, p6, p7, p8, _ch(firingPattern))
end

--- eg
-- AI::TASK_GOTO_ENTITY_AIMING(v_2, PLAYER::PLAYER_PED_ID(), 5.0, 25.0);
-- ped = Ped you want to perform this task.
-- target = the Entity they should aim at.
-- distanceToStopAt = distance from the target, where the ped should stop to aim.
-- StartAimingDist = distance where the ped should start to aim.
function Global.TaskGotoEntityAiming(ped, target, distanceToStopAt, StartAimingDist)
	return _in(0xA9DA48FAB8A76C12, ped, target, distanceToStopAt, StartAimingDist)
end

function Global.TaskGotoEntityOffset(ped, p1, p2, x, y, z, duration)
	return _in(0xE39B4FF4FDEBDE27, ped, p1, p2, x, y, z, duration)
end

function Global.TaskGotoEntityOffsetXy(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x338E7EF52B6095A9, p0, p1, p2, p3, p4, p5, p6, p7)
end

function Global.TaskGuardAssignedDefensiveArea(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xD2A207EEBDF9889B, p0, p1, p2, p3, p4, p5, p6)
end

--- From re_prisonvanbreak:
-- AI::TASK_GUARD_CURRENT_POSITION(l_DD, 35.0, 35.0, 1);
function Global.TaskGuardCurrentPosition(p0, p1, p2, p3)
	return _in(0x4A58A47A72E3FCB4, p0, p1, p2, p3)
end

--- p0 - Guessing PedID
-- p1, p2, p3 - XYZ?
-- p4 - ???
-- p5 - Maybe the size of sphere from XYZ?
-- p6 - ???
-- p7, p8, p9 - XYZ again?
-- p10 - Maybe the size of sphere from second XYZ?
function Global.TaskGuardSphereDefensiveArea(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	return _in(0xC946FE14BE0EB5E2, p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
end

--- In the scripts, p3 was always -1.
-- p3 seems to be duration or timeout of turn animation.
-- Also facingPed can be 0 or -1 so ped will just raise hands up.
function Global.TaskHandsUp(ped, duration, facingPed, p3, p4)
	return _in(0xF2EAB31979A7F910, ped, duration, facingPed, p3, p4)
end

--- Ped pilot should be in a heli.
-- EntityToFollow can be a vehicle or Ped.
-- x,y,z appear to be how close to the EntityToFollow the heli should be. Scripts use 0.0, 0.0, 80.0. Then the heli tries to position itself 80 units above the EntityToFollow. If you reduce it to -5.0, it tries to go below (if the EntityToFollow is a heli or plane)
-- NOTE: If the pilot finds enemies, it will engage them, then remain there idle, not continuing to chase the Entity given.
function Global.TaskHeliChase(pilot, entityToFollow, x, y, z)
	return _in(0xAC83B1DB38D0ADA0, pilot, entityToFollow, x, y, z)
end

--- Needs more research.
-- Default value of p13 is -1.0 or 0xBF800000.
-- Default value of p14 is 0.
-- Modified examples from "fm_mission_controller.ysc", line ~203551:
-- AI::TASK_HELI_MISSION(ped, vehicle, 0, 0, posX, posY, posZ, 4, 1.0, -1.0, -1.0, 10, 10, 5.0, 0);
-- AI::TASK_HELI_MISSION(ped, vehicle, 0, 0, posX, posY, posZ, 4, 1.0, -1.0, -1.0, 0, ?, 5.0, 4096);
-- int mode seams to set mission type 4 = coords target, 23 = ped target.
-- int 14 set to 32 = ped will land at destination.
-- My findings:
-- mode 4 or 7 forces heli to snap to the heading set
-- 8 makes the heli flee from the ped.
-- 9 circles around ped with angle set
-- 10, 11 normal + imitate ped heading
-- 20 makes the heli land when he's near the ped. It won't resume chasing.
-- 21 emulates an helicopter crash
-- 23 makes the heli circle erratically around ped
-- I change p2 to 'vehicleToFollow' as it seems to work like the task natives to set targets. In the heli_taxi script where as the merryweather heli takes you to your waypoint it has no need to follow a vehicle or a ped, so of course both have 0 set.
function Global.TaskHeliMission(pilot, vehicle, vehicleToFollow, pedToFollow, posX, posY, posZ, mode, speed, radius, angle, p11, height, p13, p14)
	return _in(0xDAD029E187A2BEB4, pilot, vehicle, vehicleToFollow, pedToFollow, posX, posY, posZ, mode, speed, radius, angle, p11, height, p13, p14)
end

--- Definition is wrong. This has 4 parameters (Not sure when they were added. v350 has 2, v678 has 4).
-- v350: Ped ped, bool unused
-- v678: Ped ped, bool unused, bool flag1, bool flag2
-- flag1 = super jump, flag2 = do nothing if flag1 is false and doubles super jump height if flag1 is true.
function Global.TaskJump(ped, unused)
	return _in(0x0AE4086104E067B1, ped, unused)
end

function Global.TaskLeaveAnyVehicle(ped, p1, p2)
	return _in(0x504D54DF3F6F2247, ped, p1, p2)
end

--- Flags from decompiled scripts:
-- 0 = normal exit and closes door.
-- 1 = normal exit and closes door.
-- 16 = teleports outside, door kept closed.
-- 64 = normal exit and closes door, maybe a bit slower animation than 0.
-- 256 = normal exit but does not close the door.
-- 4160 = ped is throwing himself out, even when the vehicle is still.
-- 262144 = ped moves to passenger seat first, then exits normally
-- Others to be tried out: 320, 512, 131072.
function Global.TaskLeaveVehicle(ped, vehicle, flags)
	return _in(0xD3DBCE61A490BE02, ped, vehicle, flags)
end

--- p5 = 0, p6 = 2
function Global.TaskLookAtCoord(entity, x, y, z, duration, p5, p6)
	return _in(0x6FA46612594F7973, entity, x, y, z, duration, p5, p6)
end

--- param3: duration in ms, use -1 to look forever
-- param4: using 2048 is fine
-- param5: using 3 is fine
function Global.TaskLookAtEntity(ped, lookAt, duration, unknown1, unknown2)
	return _in(0x69F4BE8C8CC4796C, ped, lookAt, duration, unknown1, unknown2)
end

--- Example:
-- AI::_2D537BA194896636(PLAYER::PLAYER_PED_ID(), "arm_wrestling_sweep_paired_a_rev3", 0.0, 1, "mini@arm_wrestling", 0);
function Global.TaskMoveNetwork(ped, task, multiplier, p3, animDict, flags)
	return _in(0x2D537BA194896636, ped, _ts(task), multiplier, p3, _ts(animDict), flags)
end
Global.N_0x2d537ba194896636 = Global.TaskMoveNetwork

--- Example:
-- AI::_D5B35BEA41919ACB(PLAYER::PLAYER_PED_ID(), "minigame_tattoo_michael_parts", 324.13, 181.29, 102.6, 0.0, 0.0, 22.32, 2, 0, 0, 0, 0);
function Global.TaskMoveNetworkAdvanced(ped, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, animDict, flags)
	return _in(0xD5B35BEA41919ACB, ped, _ts(p1), p2, p3, p4, p5, p6, p7, p8, p9, p10, _ts(animDict), flags)
end
Global.N_0xd5b35bea41919acb = Global.TaskMoveNetworkAdvanced

function Global.TaskOpenVehicleDoor(ped, vehicle, timeOut, doorIndex, speed)
	return _in(0x965791A9A488A062, ped, vehicle, timeOut, doorIndex, speed)
end

--- This function has a third parameter as well (bool).
-- Second parameter is unused.
-- seconds parameter was for jetpack in the early stages of gta and the hard coded code is now removed
function Global.TaskParachute(ped, p1)
	return _in(0xD2F1C53C97EE81AB, ped, p1)
end

--- makes ped parachute to coords x y z. Works well with PATHFIND::GET_SAFE_COORD_FOR_PED
function Global.TaskParachuteToTarget(ped, x, y, z)
	return _in(0xB33E291AFA6BD03A, ped, x, y, z)
end

--- After looking at some scripts the second parameter seems to be an id of some kind. Here are some I found from some R* scripts:
-- "miss_Tower_01" (this went from 01 - 10)
-- "miss_Ass0" (0, 4, 6, 3)
-- "MISS_PATROL_8"
-- I think they're patrol routes, but I'm not sure. And I believe the 3rd parameter is a BOOL, but I can't confirm other than only seeing 0 and 1 being passed.
-- As far as I can see the patrol routes names such as "miss_Ass0" have been defined earlier in the scripts. This leads me to believe we can defined our own new patrol routes by following the same approach.
-- From the scripts
-- AI::OPEN_PATROL_ROUTE("miss_Ass0");
-- AI::ADD_PATROL_ROUTE_NODE(0, "WORLD_HUMAN_GUARD_STAND", l_738[0/*3*/], -139.4076690673828, -993.4732055664062, 26.2754, GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000));
-- AI::ADD_PATROL_ROUTE_NODE(1, "WORLD_HUMAN_GUARD_STAND", l_738[1/*3*/], -116.1391830444336, -987.4984130859375, 26.38541030883789, GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000));
-- AI::ADD_PATROL_ROUTE_NODE(2, "WORLD_HUMAN_GUARD_STAND", l_738[2/*3*/], -128.46847534179688, -979.0340576171875, 26.2754, GAMEPLAY::GET_RANDOM_INT_IN_RANGE(5000, 10000));
-- AI::ADD_PATROL_ROUTE_LINK(0, 1);
-- AI::ADD_PATROL_ROUTE_LINK(1, 2);
-- AI::ADD_PATROL_ROUTE_LINK(2, 0);
-- AI::CLOSE_PATROL_ROUTE();
-- AI::CREATE_PATROL_ROUTE();
function Global.TaskPatrol(ped, p1, p2, p3, p4)
	return _in(0xBDA5DF49D080FE4E, ped, _ts(p1), p2, p3, p4)
end

--- Stand still (?)
function Global.TaskPause(ped, ms)
	return _in(0xE73A266DB0CA9042, ped, ms)
end

function Global.TaskPedSlideToCoord(ped, x, y, z, heading, p5)
	return _in(0xD04FE6765D990A06, ped, x, y, z, heading, p5)
end

function Global.TaskPedSlideToCoordHdgRate(ped, x, y, z, heading, p5, p6)
	return _in(0x5A4A6A6D3DC64F52, ped, x, y, z, heading, p5, p6)
end

function Global.TaskPerformSequence(ped, taskSequence)
	return _in(0x5ABA3986D90D8A3B, ped, taskSequence, _r, _ri)
end

function Global.TaskPerformSequenceFromProgress(p0, p1, p2, p3)
	return _in(0x89221B16730234F0, p0, p1, p2, p3)
end

function Global.TaskPlaneChase(pilot, entityToFollow, x, y, z)
	return _in(0x2D2386F273FF7A25, pilot, entityToFollow, x, y, z)
end

--- Function.Call(Hash.TASK_PLANE_LAND, pilot, selectedAirplane, runwayStartPoint.X, runwayStartPoint.Y, runwayStartPoint.Z, runwayEndPoint.X, runwayEndPoint.Y, runwayEndPoint.Z);
function Global.TaskPlaneLand(pilot, plane, runwayStartX, runwayStartY, runwayStartZ, runwayEndX, runwayEndY, runwayEndZ)
	return _in(0xBF19721FA34D32C0, pilot, plane, runwayStartX, runwayStartY, runwayStartZ, runwayEndX, runwayEndY, runwayEndZ)
end

--- EXAMPLE USAGE:
-- Fly around target (Precautiously, keeps high altitude):
-- Function.Call(Hash.TASK_PLANE_MISSION, pilot, selectedAirplane, 0, 0, Target.X, Target.Y, Target.Z, 4, 100f, 0f, 90f, 0, 200f);
-- Fly around target (Dangerously, keeps VERY low altitude):
-- Function.Call(Hash.TASK_PLANE_MISSION, pilot, selectedAirplane, 0, 0, Target.X, Target.Y, Target.Z, 4, 100f, 0f, 90f, 0, -500f);
-- Fly directly into target:
-- Function.Call(Hash.TASK_PLANE_MISSION, pilot, selectedAirplane, 0, 0, Target.X, Target.Y, Target.Z, 4, 100f, 0f, 90f, 0, -5000f);
-- EXPANDED INFORMATION FOR ADVANCED USAGE (custom pilot)
-- 'physicsSpeed': (THIS IS NOT YOUR ORDINARY SPEED PARAMETER: READ!!)
-- Think of this -first- as a radius value, not a true speed value.  The ACTUAL effective speed of the plane will be that of the maximum speed permissible to successfully fly in a -circle- with a radius of 'physicsSpeed'.  This also means that the plane must complete a circle before it can begin its "bombing run", its straight line pass towards the target.  p9 appears to influence the angle at which a "bombing run" begins, although I can't confirm yet.
-- VERY IMPORTANT: A "bombing run" will only occur if a plane can successfully determine a possible navigable route (the slower the value of 'physicsSpeed', the more precise the pilot can be due to less influence of physics on flightpath).  Otherwise, the pilot will continue to patrol around Destination (be it a dynamic Entity position vector or a fixed world coordinate vector.)
-- 0 = Plane's physics are almost entirely frozen, plane appears to "orbit" around precise destination point
-- 1-299 = Blend of "frozen, small radius" vs. normal vs. "accelerated, hyperfast, large radius"
-- 300+ =  Vehicle behaves entirely like a normal gameplay plane.
-- 'patrolBlend' (The lower the value, the more the Destination is treated as a "fly AT" rather than a "fly AROUND point".)
-- Scenario: Destination is an Entity on ground level, wide open field
-- -5000 = Pilot kamikazes directly into Entity
-- -1000 = Pilot flies extremely low -around- Entity, very prone to crashing
-- -200 = Pilot flies lower than average around Entity.
-- 0 = Pilot flies around Entity, normal altitude
-- 200 = Pilot flies an extra eighty units or so higher than 0 while flying around Destination (this doesn't seem to correlate directly into distance units.)
-- -- Valid mission types found in the exe: --
-- 0 = None
-- 1 = Unk
-- 2 = CTaskVehicleRam
-- 3 = CTaskVehicleBlock
-- 4 = CTaskVehicleGoToPlane
-- 5 = CTaskVehicleStop
-- 6 = CTaskVehicleAttack
-- 7 = CTaskVehicleFollow
-- 8 = CTaskVehicleFleeAirborne
-- 9= CTaskVehicleCircle
-- 10 = CTaskVehicleEscort
-- 15 = CTaskVehicleFollowRecording
-- 16 = CTaskVehiclePoliceBehaviour
-- 17 = CTaskVehicleCrash
function Global.TaskPlaneMission(pilot, plane, targetVehicle, targetPed, destinationX, destinationY, destinationZ, missionType, vehicleSpeed, p9, heading, maxAltitude, minAltitude)
	return _in(0x23703CD154E83B88, pilot, plane, targetVehicle, targetPed, destinationX, destinationY, destinationZ, missionType, vehicleSpeed, p9, heading, maxAltitude, minAltitude)
end

function Global.TaskPlantBomb(ped, x, y, z, heading)
	return _in(0x965FEC691D55E9BF, ped, x, y, z, heading)
end

--- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
-- float speed &gt; normal speed is 8.0f
-- ----------------------
-- float speedMultiplier &gt; multiply the playback speed
-- ----------------------
-- int duration: time in millisecond
-- ----------------------
-- -1 _ _ _ _ _ _ _&gt; Default (see flag)
-- 0 _ _ _ _ _ _ _ &gt; Not play at all
-- Small value _ _ &gt; Slow down animation speed
-- Other _ _ _ _ _ &gt; freeze player control until specific time (ms) has
-- _ _ _ _ _ _ _ _ _ passed. (No effect if flag is set to be
-- _ _ _ _ _ _ _ _ _ controllable.)
-- int flag:
-- ----------------------
-- enum eAnimationFlags
-- {
-- ANIM_FLAG_NORMAL = 0,
-- ANIM_FLAG_REPEAT = 1,
-- ANIM_FLAG_STOP_LAST_FRAME = 2,
-- ANIM_FLAG_UPPERBODY = 16,
-- ANIM_FLAG_ENABLE_PLAYER_CONTROL = 32,
-- ANIM_FLAG_CANCELABLE = 120,
-- };
-- Odd number : loop infinitely
-- Even number : Freeze at last frame
-- Multiple of 4: Freeze at last frame but controllable
-- 01 to 15 &gt; Full body
-- 10 to 31 &gt; Upper body
-- 32 to 47 &gt; Full body &gt; Controllable
-- 48 to 63 &gt; Upper body &gt; Controllable
-- ...
-- 001 to 255 &gt; Normal
-- 256 to 511 &gt; Garbled
-- ...
-- playbackRate:
-- values are between 0.0 and 1.0
-- lockX:
-- 0 in most cases 1 for rcmepsilonism8 and rcmpaparazzo_3
-- &gt; 1 for mini@sprunk
-- lockY:
-- 0 in most cases
-- 1 for missfam5_yoga, missfra1mcs_2_crew_react
-- lockZ:
-- 0 for single player
-- Can be 1 but only for MP
function Global.TaskPlayAnim(ped, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)
	return _in(0xEA47FE3719165B94, ped, _ts(animDictionary), _ts(animationName), speed, speedMultiplier, duration, flag, playbackRate, lockX, lockY, lockZ)
end

--- It's similar to the one above, except the first 6 floats let you specify the initial position and rotation of the task. (Ped gets teleported to the position). animTime is a float from 0.0 -&gt; 1.0, lets you start an animation from given point. The rest as in AI::TASK_PLAY_ANIM.
-- Rotation information : rotX and rotY don't seem to have any effect, only rotZ works.
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.TaskPlayAnimAdvanced(ped, animDict, animName, posX, posY, posZ, rotX, rotY, rotZ, speed, speedMultiplier, duration, flag, animTime, p14, p15)
	return _in(0x83CDB10EA29B370B, ped, _ts(animDict), _ts(animName), posX, posY, posZ, rotX, rotY, rotZ, speed, speedMultiplier, duration, flag, animTime, p14, p15)
end

--- Example from the scripts:
-- AI::TASK_PLAY_PHONE_GESTURE_ANIMATION(PLAYER::PLAYER_PED_ID(), v_3, v_2, v_4, 0.25, 0.25, 0, 0);
-- =========================================================
-- ^^ No offense, but Idk how that would really help anyone.
-- As for the animDict &amp; animation, they're both store in a global in all 5 scripts. So if anyone would be so kind as to read that global and comment what strings they use. Thanks.
-- Known boneMaskTypes'
-- "BONEMASK_HEADONLY"
-- "BONEMASK_HEAD_NECK_AND_ARMS"
-- "BONEMASK_HEAD_NECK_AND_L_ARM"
-- "BONEMASK_HEAD_NECK_AND_R_ARM"
-- p4 known args - 0.0f, 0.5f, 0.25f
-- p5 known args - 0.0f, 0.25f
-- p6 known args - 1 if a global if check is passed.
-- p7 known args - 1 if a global if check is passed.
-- The values found above, I found within the 5 scripts this is ever called in. (fmmc_launcher, fm_deathmatch_controller, fm_impromptu_dm_controller, fm_mission_controller, and freemode).
-- =========================================================
function Global.TaskPlayPhoneGestureAnimation(ped, animDict, animation, boneMaskType, p4, p5, p6, p7)
	return _in(0x8FBB6758B3B3E9EC, ped, _ts(animDict), _ts(animation), _ts(boneMaskType), p4, p5, p6, p7)
end

function Global.TaskPutPedDirectlyIntoCover(ped, x, y, z, timeout, p5, p6, p7, p8, p9, p10)
	return _in(0x4172393E6BE1FECE, ped, x, y, z, timeout, p5, p6, p7, p8, p9, p10)
end

--- from armenian3.c4
-- AI::TASK_PUT_PED_DIRECTLY_INTO_MELEE(PlayerPed, armenianPed, 0.0, -1.0, 0.0, 0);
function Global.TaskPutPedDirectlyIntoMelee(ped, meleeTarget, p2, p3, p4, p5)
	return _in(0x1C6CD14A876FFE39, ped, meleeTarget, p2, p3, p4, p5)
end

--- Only appears twice in the scripts.
-- AI::TASK_RAPPEL_FROM_HELI(PLAYER::PLAYER_PED_ID(), 0x41200000);
-- AI::TASK_RAPPEL_FROM_HELI(a_0, 0x41200000);
-- Fixed, definitely not a float and since it's such a big number obviously not a bool. All though note when I thought it was a bool and set it to 1 it seemed to work that same as int 0x41200000.
function Global.TaskRappelFromHeli(ped, unused)
	return _in(0x09693B0312F91649, ped, unused)
end

function Global.TaskReactAndFleePed(ped, fleeTarget)
	return _in(0x72C896464915D1B1, ped, fleeTarget)
end

--- The 2nd param (unused) is not implemented.
-- -----------------------------------------------------------------------
-- The only occurrence I found in a R* script ("assassin_construction.ysc.c4"):
-- if (((v_3 &lt; v_4) &amp;&amp; (AI::GET_SCRIPT_TASK_STATUS(PLAYER::PLAYER_PED_ID(), 0x6a67a5cc) != 1)) &amp;&amp; (v_5 &gt; v_3)) {
-- AI::TASK_RELOAD_WEAPON(PLAYER::PLAYER_PED_ID(), 1);
-- }
function Global.TaskReloadWeapon(ped, unused)
	return _in(0x62D2916F56B9CD2D, ped, unused)
end

--- From fm_mission_controller.c:
-- reserve_network_mission_objects(get_num_reserved_mission_objects(0) + 1);
-- vVar28 = {0.094f, 0.02f, -0.005f};
-- vVar29 = {-92.24f, 63.64f, 150.24f};
-- func_253(&amp;uVar30, joaat("prop_ld_case_01"), Global_1592429.imm_34757[iParam1 &lt;268&gt;], 1, 1, 0, 1);
-- set_entity_lod_dist(net_to_ent(uVar30), 500);
-- attach_entity_to_entity(net_to_ent(uVar30), iParam0, get_ped_bone_index(iParam0, 28422), vVar28, vVar29, 1, 0, 0, 0, 2, 1);
-- Var31.imm_4 = 1065353216;
-- Var31.imm_5 = 1065353216;
-- Var31.imm_9 = 1065353216;
-- Var31.imm_10 = 1065353216;
-- Var31.imm_14 = 1065353216;
-- Var31.imm_15 = 1065353216;
-- Var31.imm_17 = 1040187392;
-- Var31.imm_18 = 1040187392;
-- Var31.imm_19 = -1;
-- Var32.imm_4 = 1065353216;
-- Var32.imm_5 = 1065353216;
-- Var32.imm_9 = 1065353216;
-- Var32.imm_10 = 1065353216;
-- Var32.imm_14 = 1065353216;
-- Var32.imm_15 = 1065353216;
-- Var32.imm_17 = 1040187392;
-- Var32.imm_18 = 1040187392;
-- Var32.imm_19 = -1;
-- Var31 = 1;
-- Var31.imm_1 = "weapons@misc@jerrycan@mp_male";
-- Var31.imm_2 = "idle";
-- Var31.imm_20 = 1048633;
-- Var31.imm_4 = 0.5f;
-- Var31.imm_16 = get_hash_key("BONEMASK_ARMONLY_R");
-- task_scripted_animation(iParam0, &amp;Var31, &amp;Var32, &amp;Var32, 0f, 0.25f);
-- set_model_as_no_longer_needed(joaat("prop_ld_case_01"));
-- remove_anim_dict("anim@heists@biolab@");
function Global.TaskScriptedAnimation(ped, p4, p5)
	return _in(0x126EF75F1E17ABE5, ped, _i, _i, _i, p4, p5)
end

function Global.TaskSeekCoverFromPed(ped, target, duration, p3)
	return _in(0x84D32B3BEC531324, ped, target, duration, p3)
end

function Global.TaskSeekCoverFromPos(ped, x, y, z, duration, p5)
	return _in(0x75AC2B60386D89F2, ped, x, y, z, duration, p5)
end

--- from michael2:
-- AI::TASK_SEEK_COVER_TO_COORDS(ped, 967.5164794921875, -2121.603515625, 30.479299545288086, 978.94677734375, -2125.84130859375, 29.4752, -1, 1);
-- appears to be shorter variation
-- from michael3:
-- AI::TASK_SEEK_COVER_TO_COORDS(ped, -2231.011474609375, 263.6326599121094, 173.60195922851562, -1, 0);
function Global.TaskSeekCoverToCoords(ped, x1, y1, z1, x2, y2, z2, p7, p8)
	return _in(0x39246A6958EF072C, ped, x1, y1, z1, x2, y2, z2, p7, p8)
end

function Global.TaskSeekCoverToCoverPoint(p0, p1, p2, p3, p4, p5, p6)
	return _in(0xD43D95C7A869447F, p0, p1, p2, p3, p4, p5, p6)
end

--- I cant believe I have to define this, this is one of the best natives.
-- It makes the ped ignore basically all shocking events around it. Occasionally the ped may comment or gesture, but other than that they just continue their daily activities. This includes shooting and wounding the ped. And - most importantly - they do not flee.
-- Since it is a task, every time the native is called the ped will stop for a moment.
function Global.TaskSetBlockingOfNonTemporaryEvents(ped, toggle)
	return _in(0x90D2156198831D69, ped, toggle)
end

--- p1 is always GET_HASH_KEY("empty") in scripts, for the rare times this is used
function Global.TaskSetDecisionMaker(p0, p1)
	return _in(0xEB8517DDA73720DA, p0, _ch(p1))
end

function Global.TaskSetSphereDefensiveArea(p0, p1, p2, p3, p4)
	return _in(0x933C06518B52A9A4, p0, p1, p2, p3, p4)
end

function Global.TaskShockingEventReact(ped, eventHandle)
	return _in(0x452419CBD838065B, ped, eventHandle)
end

function Global.TaskShootAtCoord(ped, x, y, z, duration, firingPattern)
	return _in(0x46A6CC01E0826106, ped, x, y, z, duration, _ch(firingPattern))
end

--- //this part of the code is to determine at which entity the player is aiming, for example if you want to create a mod where you give orders to peds
-- Entity aimedentity;
-- Player player = PLAYER::PLAYER_ID();
-- PLAYER::_GET_AIMED_ENTITY(player, &amp;aimedentity);
-- //bg is an array of peds
-- AI::TASK_SHOOT_AT_ENTITY(bg[i], aimedentity, 5000, GAMEPLAY::GET_HASH_KEY("FIRING_PATTERN_FULL_AUTO"));
-- in practical usage, getting the entity the player is aiming at and then task the peds to shoot at the entity, at a button press event would be better.
function Global.TaskShootAtEntity(entity, target, duration, firingPattern)
	return _in(0x08DA95E8298AE772, entity, target, duration, _ch(firingPattern))
end

--- Makes the specified ped shuffle to the next vehicle seat.
-- The ped MUST be in a vehicle and the vehicle parameter MUST be the ped's current vehicle.
function Global.TaskShuffleToNextVehicleSeat(ped, vehicle)
	return _in(0x7AA80209BDA643EB, ped, vehicle)
end

function Global.TaskSkyDive(ped)
	return _in(0x601736CFE536B0A0, ped)
end

--- Makes the specified ped flee the specified distance from the specified position.
function Global.TaskSmartFleeCoord(ped, x, y, z, distance, time, p6, p7)
	return _in(0x94587F17E9C365D5, ped, x, y, z, distance, time, p6, p7)
end

--- Makes a ped run away from another ped (fleeTarget).
-- distance = ped will flee this distance.
-- fleeTime = ped will flee for this amount of time, set to "-1" to flee forever
function Global.TaskSmartFleePed(ped, fleeTarget, distance, fleeTime, p4, p5)
	return _in(0x22B0D0E37CCB840D, ped, fleeTarget, distance, fleeTime, p4, p5)
end

--- scenarioName example: "WORLD_HUMAN_GUARD_STAND"
function Global.TaskStandGuard(ped, x, y, z, heading, scenarioName)
	return _in(0xAE032F8BBA959E90, ped, x, y, z, heading, _ts(scenarioName))
end

--- Makes the specified ped stand still for (time) milliseconds.
function Global.TaskStandStill(ped, time)
	return _in(0x919BE13EED931959, ped, time)
end

--- List of scenarioNames: pastebin.com/6mrYTdQv
-- Also a few more listed at AI::TASK_START_SCENARIO_IN_PLACE just above.
-- ---------------
-- The first parameter in every scenario has always been a Ped of some sort. The second like TASK_START_SCENARIO_IN_PLACE is the name of the scenario.
-- The next 4 parameters were harder to decipher. After viewing "hairdo_shop_mp.ysc.c4", and being confused from seeing the case in other scripts, they passed the first three of the arguments as one array from a function, and it looked like it was obviously x, y, and z.
-- I haven't seen the sixth parameter go to or over 360, making me believe that it is rotation, but I really can't confirm anything.
-- I have no idea what the last 3 parameters are, but I'll try to find out.
-- -going on the last 3 parameters, they appear to always be "0, 0, 1"
-- p6 -1 also used in scrips
-- p7 used for sitting scenarios
-- p8 teleports ped to position
function Global.TaskStartScenarioAtPosition(ped, scenarioName, x, y, z, heading, duration, sittingScenario, teleport)
	return _in(0xFA4EFC79F69D4F07, ped, _ts(scenarioName), x, y, z, heading, duration, sittingScenario, teleport)
end

--- Plays a scenario on a Ped at their current location.
-- unkDelay - Usually 0 or -1, doesn't seem to have any effect. Might be a delay between sequences.
-- playEnterAnim - Plays the "Enter" anim if true, otherwise plays the "Exit" anim. Scenarios that don't have any "Enter" anims won't play if this is set to true.
-- ----
-- From "am_hold_up.ysc.c4" at line 339:
-- AI::TASK_START_SCENARIO_IN_PLACE(NETWORK::NET_TO_PED(l_8D._f4), sub_adf(), 0, 1);
-- I'm unsure of what the last two parameters are, however sub_adf() randomly returns 1 of 3 scenarios, those being:
-- WORLD_HUMAN_SMOKING
-- WORLD_HUMAN_HANG_OUT_STREET
-- WORLD_HUMAN_STAND_MOBILE
-- This makes sense, as these are what I commonly see when going by a liquor store.
-- -------------------------
-- List of scenarioNames: pastebin.com/6mrYTdQv
-- (^ Thank you so fucking much for this)
-- Also these:
-- WORLD_FISH_FLEE
-- DRIVE
-- WORLD_HUMAN_HIKER
-- WORLD_VEHICLE_ATTRACTOR
-- WORLD_VEHICLE_BICYCLE_MOUNTAIN
-- WORLD_VEHICLE_BIKE_OFF_ROAD_RACE
-- WORLD_VEHICLE_BIKER
-- WORLD_VEHICLE_CONSTRUCTION_PASSENGERS
-- WORLD_VEHICLE_CONSTRUCTION_SOLO
-- WORLD_VEHICLE_DRIVE_PASSENGERS
-- WORLD_VEHICLE_DRIVE_SOLO
-- WORLD_VEHICLE_EMPTY
-- WORLD_VEHICLE_PARK_PARALLEL
-- WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN
-- WORLD_VEHICLE_POLICE_BIKE
-- WORLD_VEHICLE_POLICE_CAR
-- WORLD_VEHICLE_POLICE_NEXT_TO_CAR
-- WORLD_VEHICLE_SALTON_DIRT_BIKE
-- WORLD_VEHICLE_TRUCK_LOGS
function Global.TaskStartScenarioInPlace(ped, scenarioName, unkDelay, playEnterAnim)
	return _in(0x142A02425FF02BD9, ped, _ts(scenarioName), unkDelay, playEnterAnim)
end

--- Makes the ped run to take cover
function Global.TaskStayInCover(ped)
	return _in(0xE5DA8615A6180789, ped)
end

--- known "killTypes" are: "AR_stealth_kill_knife" and "AR_stealth_kill_a".
function Global.TaskStealthKill(killer, target, killType, p3, p4)
	return _in(0xAA5DC05579D60BD9, killer, target, _ch(killType), p3, p4, _r, _ri)
end

--- TODO: add hash from x360
-- ^^^
-- I got you, x360 Hash: 0x5A32D4B4.
-- Note: Whoever named this I just compared it and the hash matches, it was the correct name thanks.
-- Note: Alexander Blade, needs to fix this site or his code one, as when we do find the right name the server throws an error saying the name is already in use. AB is a legend coder, so I'm sure this is a simple fix for him.
function Global.TaskStopPhoneGestureAnimation(ped)
	return _in(0x3FA00D4F4641BFAE, ped)
end

function Global.TaskSwapWeapon(ped, p1)
	return _in(0xA21C51255B205245, ped, p1)
end

--- This function is called on peds in vehicles.
-- anim: animation name
-- p2, p3, p4: "sweep_low", "sweep_med" or "sweep_high"
-- p5: no idea what it does but is usually -1
function Global.TaskSweepAimEntity(ped, anim, p2, p3, p4, p5, vehicle, p7, p8)
	return _in(0x2047C02158D6405A, ped, _ts(anim), _ts(p2), _ts(p3), _ts(p4), p5, vehicle, p7, p8)
end

function Global.TaskSweepAimPosition(p0, p5, p6, p7, p8, p9, p10)
	return _in(0x7AFE8FDC10BC07D2, p0, _i, _i, _i, _i, p5, p6, p7, p8, p9, p10)
end

--- AI::TASK_SYNCHRONIZED_SCENE(ped, scene, "creatures@rottweiler@in_vehicle@std_car", "get_in", 1000.0, -8.0, 4, 0, 0x447a0000, 0);
-- Animations List : www.ls-multiplayer.com/dev/index.php?section=3
function Global.TaskSynchronizedScene(ped, scene, animDictionary, animationName, speed, speedMultiplier, duration, flag, playbackRate, p9)
	return _in(0xEEA929141F699854, ped, scene, _ts(animDictionary), _ts(animationName), speed, speedMultiplier, duration, flag, playbackRate, p9)
end

--- In every case of this native, I've only seen the first parameter passed as 0, although I believe it's a Ped after seeing tasks around it using 0. That's because it's used in a Sequence Task.
-- The last 3 parameters are definitely coordinates after seeing them passed in other scripts, and even being used straight from the player's coordinates.
-- ---
-- It seems that - in the decompiled scripts - this native was used on a ped who was in a vehicle to throw a projectile out the window at the player. This is something any ped will naturally do if they have a throwable and they are doing driveby-combat (although not very accurately).
-- It is possible, however, that this is how SWAT throws smoke grenades at the player when in cover.
-- ----------------------------------------------------
-- The first comment is right it definately is the ped as if you look in script finale_heist2b.c line 59628 in Xbox Scripts atleast you will see task_throw_projectile and the first param is Local_559[2 &lt;14&gt;] if you look above it a little bit line 59622 give_weapon_to_ped uses the same exact param Local_559[2 &lt;14&gt;] and we all know the first param of that native is ped. So it guaranteed has to be ped. 0 just may mean to use your ped by default for some reason.
function Global.TaskThrowProjectile(ped, x, y, z)
	return _in(0x7285951DBF6B5A51, ped, x, y, z)
end

--- used in sequence task
-- both parameters seems to be always 0
function Global.TaskToggleDuck(p0, p1)
	return _in(0xAC96609B9995EDF8, p0, p1)
end

--- duration in milliseconds
function Global.TaskTurnPedToFaceCoord(ped, x, y, z, duration)
	return _in(0x1DDA930A0AC38571, ped, x, y, z, duration)
end

--- duration: the amount of time in milliseconds to do the task. -1 will keep the task going until either another task is applied, or CLEAR_ALL_TASKS() is called with the ped
function Global.TaskTurnPedToFaceEntity(ped, entity, duration)
	return _in(0x5AD23D40115353AC, ped, entity, duration)
end

--- Actually has 3 params, not 2.
-- p0: Ped
-- p1: int (or bool?)
-- p2: int
function Global.TaskUseMobilePhone(ped, p1)
	return _in(0xBD2A8EC3AF4DE7DB, ped, p1)
end

function Global.TaskUseMobilePhoneTimed(ped, duration)
	return _in(0x5EE02954A14C69DB, ped, duration)
end

function Global.TaskUseNearestScenarioChainToCoord(p0, p1, p2, p3, p4, p5)
	return _in(0x9FDA1B3D7E7028B3, p0, p1, p2, p3, p4, p5)
end

function Global.TaskUseNearestScenarioChainToCoordWarp(p0, p1, p2, p3, p4, p5)
	return _in(0x97A28E63F0BA5631, p0, p1, p2, p3, p4, p5)
end

--- Updated variables
-- An alternative to AI::TASK_USE_NEAREST_SCENARIO_TO_COORD_WARP. Makes the ped walk to the scenario instead.
function Global.TaskUseNearestScenarioToCoord(ped, x, y, z, distance, duration)
	return _in(0x277F471BA9DB000B, ped, x, y, z, distance, duration)
end

function Global.TaskUseNearestScenarioToCoordWarp(ped, x, y, z, radius, p5)
	return _in(0x58E2E0F23F6B76C3, ped, x, y, z, radius, p5)
end

function Global.TaskVehicleAimAtCoord(ped, x, y, z)
	return _in(0x447C1E9EF844BC0F, ped, x, y, z)
end

function Global.TaskVehicleAimAtPed(ped, target)
	return _in(0xE41885592B08B097, ped, target)
end

--- chases targetEnt fast and aggressively
-- --
-- Makes ped (needs to be in vehicle) chase targetEnt.
function Global.TaskVehicleChase(driver, targetEnt)
	return _in(0x3C08A8E30363B353, driver, targetEnt)
end

--- info about driving modes: HTTP://gtaforums.com/topic/822314-guide-driving-styles/
-- ---------------------------------------------------------------
-- Passing P6 value as floating value didn't throw any errors, though unsure what is it exactly, looks like radius or something.
-- P10 though, it is mentioned as float, however, I used bool and set it to true, that too worked.
-- Here the e.g. code I used
-- Function.Call(Hash.TASK_VEHICLE_DRIVE_TO_COORD, Ped, Vehicle, Cor X, Cor Y, Cor Z, 30f, 1f, Vehicle.GetHashCode(), 16777216, 1f, true);
function Global.TaskVehicleDriveToCoord(ped, vehicle, x, y, z, speed, p6, vehicleModel, drivingMode, stopRange, p10)
	return _in(0xE2A2AA2F659D77A7, ped, vehicle, x, y, z, speed, p6, _ch(vehicleModel), drivingMode, stopRange, p10)
end

function Global.TaskVehicleDriveToCoordLongrange(ped, vehicle, x, y, z, speed, driveMode, stopRange)
	return _in(0x158BB33F920D360C, ped, vehicle, x, y, z, speed, driveMode, stopRange)
end

function Global.TaskVehicleDriveWander(ped, vehicle, speed, drivingStyle)
	return _in(0x480142959D337D00, ped, vehicle, speed, drivingStyle)
end

--- Makes a ped follow the targetVehicle with &lt;minDistance&gt; in between.
-- note: minDistance is ignored if drivingstyle is avoiding traffic, but Rushed is fine.
-- Mode: The mode defines the relative position to the targetVehicle. The ped will try to position its vehicle there.
-- -1 = behind
-- 0 = ahead
-- 1 = left
-- 2 = right
-- 3 = back left
-- 4 = back right
-- if the target is closer than noRoadsDistance, the driver will ignore pathing/roads and follow you directly.
-- Driving Styles guide: gtaforums.com/topic/822314-guide-driving-styles/
function Global.TaskVehicleEscort(ped, vehicle, targetVehicle, mode, speed, drivingStyle, minDistance, p7, noRoadsDistance)
	return _in(0x0FA6E4B75F302400, ped, vehicle, targetVehicle, mode, speed, drivingStyle, minDistance, p7, noRoadsDistance)
end

--- Makes a ped in a vehicle follow an entity (ped, vehicle, etc.)
-- drivingStyle:
-- 0 = Rushed
-- 1 = Ignore Traffic Lights
-- 2 = Fast
-- 3 = Normal (Stop in Traffic)
-- 4 = Fast avoid traffic
-- 5 = Fast, stops in traffic but overtakes sometimes
-- 6 = Fast avoids traffic extremely
-- Console Hash: 0xA8B917D7
-- AI::_TASK_VEHICLE_FOLLOW(l_244[3/*1*/], l_268[3/*1*/], l_278, 40.0, 262144, 10);
-- What is this known as in the decompiled scripts ffs. I need more examples. I've searched in all scripts for keywords suchas,
-- TASK_VEHICLE_FOLLOW, FC545A9F0626E3B6, 0xFC545A9F0626E3B6, all the parameters in the above example even just search the last few params '40.0, 262144, 10' and couldnt find where this native is used in scripts at all unless whoever decompiled the scripts gave it a whack a.. name.
function Global.TaskVehicleFollow(driver, vehicle, targetEntity, drivingStyle, speed, minDistance)
	return _in(0xFC545A9F0626E3B6, driver, vehicle, targetEntity, drivingStyle, speed, minDistance)
end

--- task_vehicle_follow_waypoint_recording(Ped p0, Vehicle p1, string p2, int p3, int p4, int p5, int p6, float.x p7, float.Y p8, float.Z p9, bool p10, int p11)
-- p2 = Waypoint recording string (found in update\update.rpf\x64\levels\gta5\waypointrec.rpf
-- p3 = 786468
-- p4 = 0
-- p5 = 16
-- p6 = -1 (angle?)
-- p7/8/9 = usually v3.zero
-- p10 = bool (repeat?)
-- p11 = 1073741824
function Global.TaskVehicleFollowWaypointRecording(ped, vehicle, WPRecording, p3, p4, p5, p6, p7, p8, p9)
	return _in(0x3123FAA6DB1CF7ED, ped, vehicle, _ts(WPRecording), p3, p4, p5, p6, p7, p8, p9)
end

--- Differs from TASK_VEHICLE_DRIVE_TO_COORDS in that it will pick the shortest possible road route without taking one-way streets and other "road laws" into consideration.
-- WARNING:
-- A behaviorFlag value of 0 will result in a clunky, stupid driver!
-- Recommended settings:
-- speed = 30.0f,
-- behaviorFlag = 156,
-- stoppingRange = 5.0f;
-- If you simply want to have your driver move to a fixed location, call it only once, or, when necessary in the event of interruption.
-- If using this to continually follow a Ped who is on foot:  You will need to run this in a tick loop.  Call it in with the Ped's updated coordinates every 20 ticks or so and you will have one hell of a smart, fast-reacting NPC driver -- provided he doesn't get stuck.  If your update frequency is too fast, the Ped may not have enough time to figure his way out of being stuck, and thus, remain stuck.  One way around this would be to implement an "anti-stuck" mechanism, which allows the driver to realize he's stuck, temporarily pause the tick, unstuck, then resume the tick.
-- EDIT:  This is being discussed in more detail at http://gtaforums.com/topic/818504-any-idea-on-how-to-make-peds-clever-and-insanely-fast-c/
function Global.TaskVehicleGotoNavmesh(ped, vehicle, x, y, z, speed, behaviorFlag, stoppingRange)
	return _in(0x195AEEB13CEFE2EE, ped, vehicle, x, y, z, speed, behaviorFlag, stoppingRange)
end

--- pilot, vehicle and altitude are rather self-explanatory.
-- p4: is unused variable in the function.
-- entityToFollow: you can provide a Vehicle entity or a Ped entity, the heli will protect them.
-- 'targetSpeed':  The pilot will dip the nose AS MUCH AS POSSIBLE so as to reach this value AS FAST AS POSSIBLE.  As such, you'll want to modulate it as opposed to calling it via a hard-wired, constant #.
-- 'radius' isn't just "stop within radius of X of target" like with ground vehicles.  In this case, the pilot will fly an entire circle around 'radius' and continue to do so.
-- NOT CONFIRMED:  p7 appears to be a FlyingStyle enum.  Still investigating it as of this writing, but playing around with values here appears to result in different -behavior- as opposed to offsetting coordinates, altitude, target speed, etc.
-- NOTE: If the pilot finds enemies, it will engage them until it kills them, but will return to protect the ped/vehicle given shortly thereafter.
function Global.TaskVehicleHeliProtect(pilot, vehicle, entityToFollow, targetSpeed, p4, radius, altitude, p7)
	return _in(0x1E09C32048FEFD1C, pilot, vehicle, entityToFollow, targetSpeed, p4, radius, altitude, p7)
end

function Global.TaskVehicleMission(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x659427E0EF36BCDE, p0, p1, p2, p3, p4, p5, p6, p7, p8)
end

--- Example from fm_mission_controller.c4:
-- AI::TASK_VEHICLE_MISSION_COORS_TARGET(l_65E1, l_65E2, 324.84588623046875, 325.09619140625, 104.3525, 4, 15.0, 802987, 5.0, 5.0, 0);
function Global.TaskVehicleMissionCoorsTarget(ped, vehicle, x, y, z, p5, p6, p7, p8, p9, p10)
	return _in(0xF0AF20AA7731F8C3, ped, vehicle, x, y, z, p5, p6, p7, p8, p9, p10)
end

--- Modes:
-- 8= flees
-- 1=drives around the ped
-- 4=drives and stops near
-- 7=follows
-- 10=follows to the left
-- 11=follows to the  right
-- 12 = follows behind
-- 13=follows ahead
-- 14=follows, stop when near
function Global.TaskVehicleMissionPedTarget(ped, vehicle, pedTarget, mode, maxSpeed, drivingStyle, minDistance, p7, p8)
	return _in(0x9454528DF15D657A, ped, vehicle, pedTarget, mode, maxSpeed, drivingStyle, minDistance, p7, p8)
end

--- Modes:
-- 0 - ignore heading
-- 1 - park forward
-- 2 - park backwards
-- Depending on the angle of approach, the vehicle can park at the specified heading or at its exact opposite (-180) angle.
-- Radius seems to define how close the vehicle has to be -after parking- to the position for this task considered completed. If the value is too small, the vehicle will try to park again until it's exactly where it should be. 20.0 Works well but lower values don't, like the radius is measured in centimeters or something.
function Global.TaskVehiclePark(ped, vehicle, x, y, z, heading, mode, radius, keepEngineOn)
	return _in(0x0F3E34E968EA374E, ped, vehicle, x, y, z, heading, mode, radius, keepEngineOn)
end

--- Most probably plays a specific animation on vehicle. For example getting chop out of van etc...
-- Here's how its used -
-- AI::TASK_VEHICLE_PLAY_ANIM(l_325, "rcmnigel1b", "idle_speedo");
-- AI::TASK_VEHICLE_PLAY_ANIM(l_556[0/*1*/], "missfra0_chop_drhome", "InCar_GetOutofBack_Speedo");
-- FYI : Speedo is the name of van in which chop was put in the mission.
function Global.TaskVehiclePlayAnim(vehicle, animation_set, animation_name)
	return _in(0x69F5C3BD0F3EBD89, vehicle, _ts(animation_set), _ts(animation_name))
end

function Global.TaskVehicleShootAtCoord(ped, x, y, z, p4)
	return _in(0x5190796ED39C9B6D, ped, x, y, z, p4)
end

function Global.TaskVehicleShootAtPed(ped, target, p2)
	return _in(0x10AB107B887214D8, ped, target, p2)
end

--- '1
-- '3 - brake + reverse
-- '4 - turn left 90 + braking
-- '5 - turn right 90 + braking
-- '6 - brake strong (handbrake?) until time ends
-- '7 - turn left + accelerate
-- '7 - turn right + accelerate
-- '9 - weak acceleration
-- '10 - turn left + restore wheel pos to center in the end
-- '11 - turn right + restore wheel pos to center in the end
-- '13 - turn left + go reverse
-- '14 - turn left + go reverse
-- '16 - crash the game after like 2 seconds :)
-- '17 - keep actual state, game crashed after few tries
-- '18 - game crash
-- '19 - strong brake + turn left/right
-- '20 - weak brake + turn left then turn right
-- '21 - weak brake + turn right then turn left
-- '22 - brake + reverse
-- '23 - accelerate fast
-- '24
-- '25 - brake turning left then when almost stopping it turns left more
-- '26 - brake turning right then when almost stopping it turns right more
-- '27 - brake until car stop or until time ends
-- '28 - brake + strong reverse acceleration
-- '30 - performs a burnout (brake until stop + brake and accelerate)
-- '31 - accelerate + handbrake
-- '32 - accelerate very strong
-- Seems to be this:
-- Works on NPCs, but overrides their current task. If inside a task sequence (and not being the last task), "time" will work, otherwise the task will be performed forever until tasked with something else
function Global.TaskVehicleTempAction(driver, vehicle, action, time)
	return _in(0xC429DCEEB339E129, driver, vehicle, action, time)
end

function Global.TaskWanderInArea(ped, x, y, z, radius, minimalLength, timeBetweenWalks)
	return _in(0xE054346CA3A0F315, ped, x, y, z, radius, minimalLength, timeBetweenWalks)
end

--- Makes ped walk around the area.
-- set p1 to 10.0f and p2 to 10 if you want the ped to walk anywhere without a duration.
function Global.TaskWanderStandard(ped, p1, p2)
	return _in(0xBB9CE077274F6A1B, ped, p1, p2)
end

--- Seat Numbers
-- -------------------------------
-- Driver = -1
-- Any = -2
-- Left-Rear = 1
-- Right-Front = 0
-- Right-Rear = 2
-- Extra seats = 3-14(This may differ from vehicle type e.g. Firetruck Rear Stand, Ambulance Rear)
function Global.TaskWarpPedIntoVehicle(ped, vehicle, seat)
	return _in(0x9A7D091411C5F684, ped, vehicle, seat)
end

--- EX: Function.Call(Ped1, Ped2, Time, 0);
-- The last parameter is always 0 for some reason I do not know. The first parameter is the pedestrian who will writhe to the pedestrian in the other parameter. The third paremeter is how long until the Writhe task ends. When the task ends, the ped will die. If set to -1, he will not die automatically, and the task will continue until something causes it to end. This can be being touched by an entity, being shot, explosion, going into ragdoll, having task cleared. Anything that ends the current task will kill the ped at this point.
-- MulleDK19: Third parameter does not appear to be time. The last parameter is not implemented (It's not used, regardless of value).
function Global.TaskWrithe(ped, target, time, p3)
	return _in(0xCDDC2B77CE54AC6E, ped, target, time, p3)
end

--- For a full list, see here: pastebin.com/yLNWicUi
function Global.TerminateAllScriptsWithThisName(scriptName)
	return _in(0x9DC711BC69C548DF, _ts(scriptName))
end

function Global.TerminateThisThread()
	return _in(0x1090044AD1DA76FA)
end

function Global.TerminateThread(threadId)
	return _in(0xC8B189ED9138BCD4, threadId)
end

function Global.TestProbeAgainstAllWater(p0, p1, p2, p3, p4, p5, p6, p7)
	return _in(0x8974647ED222EA5F, p0, p1, p2, p3, p4, p5, p6, p7, _r)
end

function Global.TestProbeAgainstWater(x1, y1, z1, x2, y2, z2, result)
	return _in(0xFFA5D878809819DB, x1, y1, z1, x2, y2, z2, _v, _r)
end

function Global.TestVerticalProbeAgainstAllWater(x, y, z, p3, p4)
	return _in(0x2B3451FA1E3142E2, x, y, z, p3, _ii(p4) --[[ may be optional ]], _r)
end

function Global.TextureDownloadGetName(p0)
	return _in(0x3448505B6E35262D, p0, _r, _s)
end

function Global.TextureDownloadHasFailed(p0)
	return _in(0x5776ED562C134687, p0, _r)
end
Global.N_0x5776ed562c134687 = Global.TextureDownloadHasFailed

function Global.TextureDownloadRelease(p0)
	return _in(0x487EB90B98E9FB19, p0)
end

function Global.TextureDownloadRequest(FilePath, Name, p3)
	return _in(0x16160DA74A8E74A2, _i, _ts(FilePath), _ts(Name), p3, _r, _ri)
end

--- Counts up. Every 1000 is 1 real-time second. Use SETTIMERA(int value) to set the timer (e.g.: SETTIMERA(0)).
function Global.Timera()
	return _in(0x83666F9FB8FEBD4B, _r, _ri)
end

function Global.Timerb()
	return _in(0xC9D9444186B5A374, _r, _ri)
end

--- Gets the current frame time.
function Global.Timestep()
	return _in(0x0000000050597EE2, _r, _rf)
end

function Global.ToFloat(value)
	return _in(0xBBDA792448DB5A89, value, _r, _rf)
end

function Global.ToggleStealthRadar(toggle)
	return _in(0x6AFDFB93754950C7, toggle)
end

--- Toggles:
-- UNK17
-- Turbo
-- UNK19
-- Tire Smoke
-- UNK21
-- Xenon Headlights
function Global.ToggleVehicleMod(vehicle, modType, toggle)
	return _in(0x2A1F4F37F95BAD08, vehicle, modType, toggle)
end

function Global.TrackObjectVisibility(p0)
	return _in(0xB252BC036B525623, p0)
end

--- in script hook .net
-- Vehicle v = ...;
-- Function.Call(Hash.TRACK_VEHICLE_VISIBILITY, v.Handle);
function Global.TrackVehicleVisibility(vehicle)
	return _in(0x64473AEFDCF47DCA, vehicle)
end

--- time in ms to transition from fully blurred to normal
function Global.TransitionFromBlurred(transitionTime)
	return _in(0xEFACC8AEF94430D5, transitionTime, _r)
end

--- time in ms to transition to fully blurred screen
function Global.TransitionToBlurred(transitionTime)
	return _in(0xA328A24AAA6B7FDC, transitionTime, _r)
end

--- The backing function for TriggerEvent.
function Global.TriggerEventInternal(eventName, eventPayload, payloadLength)
	return _in(0x91310870, _ts(eventName), _ts(eventPayload), payloadLength)
end

--- List of all usable event names found in b617d used with this native. Sorted alphabetically and identical names removed: pastebin.com/RzDFmB1W
-- All music event names found in the b617d scripts: pastebin.com/GnYt0R3P
function Global.TriggerMusicEvent(eventName)
	return _in(0x706D57B0F50DA710, _ts(eventName), _r)
end

--- from scripts:
-- int bitFlag = 0;
-- int vVar0[3];
-- vVar0[0] = 2; //p0
-- vVar0[1] = PLAYER_ID(); //p1 0 player
-- vVar0[2] = 53; //p2
-- SET_BIT(&amp;bitFlag, selectedPlayer);
-- TRIGGER_SCRIPT_EVENT(1, vVar0, 3, bitFlag);
function Global.TriggerScriptEvent(p0, argCount, bitset)
	return _in(0x5AE99C571D5BBE5D, p0, _i, argCount, bitset)
end

--- The backing function for TriggerServerEvent.
function Global.TriggerServerEventInternal(eventName, eventPayload, payloadLength)
	return _in(0x7fdd1128, _ts(eventName), _ts(eventPayload), payloadLength)
end

function Global.UnblockDecisionMakerEvent(name, type)
	return _in(0xD7CD9CF34F2C99E8, _ch(name), type)
end

function Global.UncuffPed(ped)
	return _in(0x67406F2C8F87FC4F, ped)
end

function Global.UnfreezeRadioStation(radioStation)
	return _in(0xFC00454CF60B91DD, _ts(radioStation))
end

--- Returns the interior ID at the given coords, but only if the unknown variable is set to 0, otherwise it will return 0.
function Global.UnkGetInteriorAtCoords(x, y, z, unk)
	return _in(0xF0F77ADB9F67E79D, x, y, z, unk, _r, _ri)
end
Global.N_0xf0f77adb9f67e79d = Global.UnkGetInteriorAtCoords

function Global.UnlockMinimapAngle()
	return _in(0x8183455E16C42E3A)
end

function Global.UnlockMinimapPosition()
	return _in(0x3E93E06DB8EF1F30)
end

--- I see this as a native that would of been used back in GTA III when you finally unlocked the bridge to the next island and such.
function Global.UnlockMissionNewsStory(newsStory)
	return _in(0xB165AB7C248B2DC1, newsStory)
end

function Global.UnpausePlaybackRecordedVehicle(p0)
	return _in(0x8879EE09268305D5, p0)
end

--- Does something similar to INTERIOR::DISABLE_INTERIOR.
-- You don't fall through the floor but everything is invisible inside and looks the same as when INTERIOR::DISABLE_INTERIOR is used. Peds behaves normally inside.
function Global.UnpinInterior(interiorID)
	return _in(0x261CCE7EED010641, interiorID)
end

function Global.UnpinRopeVertex(rope, vertex)
	return _in(0x4B5AE2EEE4A8F180, rope, vertex, _r, _ri)
end

--- gtaforums.com/topic/885580-ped-headshotmugshot-txd/
function Global.UnregisterPedheadshot(handle)
	return _in(0x96B1361D9B24C2FF, handle)
end

function Global.UnregisterScriptWithAudio()
	return _in(0xA8638BE228D4751A)
end

function Global.UpdateNavmeshBlockingObject(p0, p1, p2, p3, p4, p5, p6, p7, p8)
	return _in(0x109E99373F290687, p0, p1, p2, p3, p4, p5, p6, p7, p8)
end

--- Returns the current status of the onscreen keyboard, and updates the output.
-- Status Codes:
-- 0 - User still editing
-- 1 - User has finished editing
-- 2 - User has canceled editing
-- 3 - Keyboard isn't active
function Global.UpdateOnscreenKeyboard()
	return _in(0x0CF2B696BBF945AE, _r, _ri)
end

--- See SET_PED_HEAD_BLEND_DATA().
function Global.UpdatePedHeadBlendData(ped, shapeMix, skinMix, thirdMix)
	return _in(0x723538F61C647C5A, ped, shapeMix, skinMix, thirdMix)
end

function Global.UpdateTaskAimGunScriptedTarget(p0, p1, p2, p3, p4, p5)
	return _in(0x9724FB59A3E72AD0, p0, p1, p2, p3, p4, p5)
end

function Global.UpdateTaskHandsUpDuration(ped, duration)
	return _in(0xA98FCAFD7893C834, ped, duration)
end

function Global.UpdateTaskSweepAimEntity(ped, entity)
	return _in(0xE4973DBDBE6E44B3, ped, entity)
end

function Global.UpdateTaskSweepAimPosition(p0, p1, p2, p3)
	return _in(0xBB106883F5201FC4, p0, p1, p2, p3)
end

--- Formerly known as _LOWER_MAP_PROP_DENSITY and wrongly due to idiots as _ENABLE_MP_DLC_MAPS.
-- Sets the maximum prop density and changes a loading screen flag from 'loading story mode' to 'loading GTA Online'. Does not touch DLC map data at all.
-- In fact, I doubt this changes the flag whatsoever, that's the OTHER native idiots use together with this that does so, this one only causes a loading screen to show as it reloads map data.
function Global.UseFreemodeMapBehavior(toggle)
	return _in(0x9BAE5AD2508DF078, toggle)
end
Global.EnableMpDlcMaps = Global.UseFreemodeMapBehavior

--- From the b678d decompiled scripts:
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("FM_Mission_Controler");
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_apartment_mp");
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_indep_fireworks");
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_mp_cig_plane");
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_mp_creator");
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_ornate_heist");
-- GRAPHICS::_SET_PTFX_ASSET_NEXT_CALL("scr_prison_break_heist_station");
function Global.UseParticleFxAssetNextCall(name)
	return _in(0x6C38AF3693A69A91, _ts(name))
end
Global.SetPtfxAssetNextCall = Global.UseParticleFxAssetNextCall

--- hash collision?
function Global.UsePlayerColourInsteadOfTeamColour(toggle)
	return _in(0x5FFE9B4144F9712F, toggle)
end

function Global.UseSirenAsHorn(vehicle, toggle)
	return _in(0xFA932DE350266EF8, vehicle, toggle)
end

function Global.UseWaypointRecordingAsAssistedMovementRoute(p1, p2, p3)
	return _in(0x5A353B8E6B1095B5, _i, p1, p2, p3)
end

--- Hash collision
function Global.UsingMissionCreator(toggle)
	return _in(0xF14878FC50BEC6EE, toggle)
end

--- hash collision?
function Global.UsingNetworkWeapontype(p0)
	return _in(0xE26CCFF8094D8C74, p0, _r)
end

--- Calculates distance between vectors.
function Global.Vdist(x1, y1, z1, x2, y2, z2)
	return _in(0x2A488C176D52CCA5, x1, y1, z1, x2, y2, z2, _r, _rf)
end

--- Calculates distance between vectors but does not perform Sqrt operations. (Its way faster)
function Global.Vdist2(x1, y1, z1, x2, y2, z2)
	return _in(0xB7A628320EFF8E47, x1, y1, z1, x2, y2, z2, _r, _rf)
end

--- calls from vehicle to net.
function Global.VehToNet(vehicle)
	return _in(0xB4C94523F023419C, vehicle, _r, _ri)
end

--- Vehicle has landing gear?
function Global.VehicleHasLandingGear(vehicle)
	return _in(0x4198AB0022B15F87, vehicle, _r)
end
Global.N_0x4198ab0022b15f87 = Global.VehicleHasLandingGear

function Global.VehicleWaypointPlaybackOverrideSpeed(p0, p1)
	return _in(0x121F0593E0A431D7, p0, p1)
end

function Global.VehicleWaypointPlaybackPause(p0)
	return _in(0x8A4E6AC373666BC5, p0)
end

function Global.VehicleWaypointPlaybackResume(p0)
	return _in(0xDC04FCAA7839D492, p0)
end

function Global.VehicleWaypointPlaybackUseDefaultSpeed(p0)
	return _in(0x5CEB25A7D2848963, p0)
end

--- Calculates the magnitude of a vector.
function Global.Vmag(x, y, z)
	return _in(0x652D2EEEF1D3E62C, x, y, z, _r, _rf)
end

--- Calculates the magnitude of a vector but does not perform Sqrt operations. (Its way faster)
function Global.Vmag2(x, y, z)
	return _in(0xA8CEACB4F35AE058, x, y, z, _r, _rf)
end

--- Pauses execution of the current script, please note this behavior is only seen when called from one of the game script files(ysc). In order to wait an asi script use
-- static void WAIT(DWORD time);
-- found in main.h
-- --------------------------------------------------------------------
-- It does not actually seem to wait the amount of milliseconds stated like the normal WAIT() command does, but it does seem to make task sequences work more smoothly
-- System native hashes do not change on gameupdate
function Global.Wait(ms)
	return _in(0x4EDE34FBADD967A6, ms)
end

--- Hash collision
function Global.WasCounterActivated(vehicle, p1)
	return _in(0x3EC8BF18AA453FE9, vehicle, p1, _r)
end

function Global.WasCutsceneSkipped()
	return _in(0x40C8656EDAEDD569, _r)
end

--- Returns whether or not the currently executing event was canceled. See https://wiki.fivem.net/wiki/WasEventCanceled
-- @return A boolean.
function Global.WasEventCanceled()
	return _in(0x58382a19, _r)
end

function Global.WasPedKilledByStealth(ped)
	return _in(0xF9800AA1A771B000, ped, _r)
end

function Global.WasPedKilledByTakedown(ped)
	return _in(0x7F08E26039C7347C, ped, _r)
end

--- Despite this function's name, it simply returns whether the specified handle is a Ped.
function Global.WasPedSkeletonUpdated(ped)
	return _in(0x11B499C1E0FF8559, ped, _r)
end

function Global.WashDecalsFromVehicle(vehicle, p1)
	return _in(0x5B712761429DBC14, vehicle, p1)
end

function Global.WashDecalsInRange(p0, p1, p2, p3, p4)
	return _in(0x9C30613D50A6ADEF, p0, p1, p2, p3, p4)
end

function Global.WaypointPlaybackGetIsPaused(p0)
	return _in(0x701375A7D43F01CB, p0, _r)
end

function Global.WaypointPlaybackOverrideSpeed(p0, p1, p2)
	return _in(0x7D7D2B47FA788E85, p0, p1, p2)
end

function Global.WaypointPlaybackPause(p0, p1, p2)
	return _in(0x0F342546AA06FED5, p0, p1, p2)
end

function Global.WaypointPlaybackResume(p0, p1, p2, p3)
	return _in(0x244F70C84C547D2D, p0, p1, p2, p3)
end

function Global.WaypointPlaybackStartAimingAtCoord(p0, p1, p2, p3, p4)
	return _in(0x8968400D900ED8B3, p0, p1, p2, p3, p4)
end

function Global.WaypointPlaybackStartAimingAtPed(p0, p1, p2)
	return _in(0x20E330937C399D29, p0, p1, p2)
end

function Global.WaypointPlaybackStartShootingAtCoord(p0, p1, p2, p3, p4, p5)
	return _in(0x057A25CFCC9DB671, p0, p1, p2, p3, p4, p5)
end

function Global.WaypointPlaybackStopAimingOrShooting(p0)
	return _in(0x47EFA040EBB8E2EA, p0)
end

function Global.WaypointPlaybackUseDefaultSpeed(p0)
	return _in(0x6599D834B12D0800, p0)
end

--- For a full list, see here: pastebin.com/Tp0XpBMN
-- For a full list of the points, see here: goo.gl/wIH0vn
function Global.WaypointRecordingGetClosestWaypoint(name, x, y, z, point)
	return _in(0xB629A298081F876F, _ts(name), x, y, z, _ii(point) --[[ may be optional ]], _r)
end

--- For a full list, see here: pastebin.com/Tp0XpBMN
-- For a full list of the points, see here: goo.gl/wIH0vn
function Global.WaypointRecordingGetCoord(name, point, coord)
	return _in(0x2FB897405C90B361, _ts(name), point, _v, _r)
end

--- For a full list, see here: pastebin.com/Tp0XpBMN
-- For a full list of the points, see here: goo.gl/wIH0vn
function Global.WaypointRecordingGetNumPoints(name, points)
	return _in(0x5343532C01A07234, _ts(name), _ii(points) --[[ may be optional ]], _r)
end

function Global.WaypointRecordingGetSpeedAtPoint(name, point)
	return _in(0x005622AEBC33ACA9, _ts(name), point, _r, _rf)
end

--- First parameter was previously an Entity but after further research it is definitely a hash.
function Global.WouldEntityBeOccluded(entityModelHash, x, y, z, p4)
	return _in(0xEE5D2A122E09EC42, _ch(entityModelHash), x, y, z, p4, _r)
end

