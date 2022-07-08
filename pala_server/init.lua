minetest.log("action", "[pala_server] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_server = {}

pala_server.anticheat    = minetest.settings:get_bool("pala_server.anticheat", true)
pala_server.experimental = minetest.settings:get_bool("palamod.experimental", false)
pala_server.debug        = minetest.settings:get_bool("palamod.debug", false)

if pala_server.anticheat then
	minetest.log("action", "[pala_server] Anticheat enabled")
else
	minetest.log("action", "[pala_server] Anticheat disabled")
end

dofile(modpath.."/utils.lua")
dofile(modpath.."/msg.lua")
dofile(modpath.."/spawn.lua")

if minetest.settings:get_bool("pala_server.clear_lag", true) then
	dofile(modpath.."/palalag.lua")
else
	minetest.log("action", "[pala_server] Clearlag disabled")
end

if pala_server.experimental then
	dofile(modpath.."/home.lua")
	minetest.log("action", "[pala_server] Homes enabled")
else
	minetest.log("action", "[pala_server] Homes disabled")
end

if pala_server.debug then
	dofile(modpath.."/debug.lua")
end

minetest.log("action", "[pala_server] loaded succesfully")
