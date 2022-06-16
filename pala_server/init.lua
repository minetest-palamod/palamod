minetest.log("action", "[pala_server] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_server = {}

dofile(modpath.."/utils.lua")
dofile(modpath.."/msg.lua")
dofile(modpath.."/spawn.lua")

if minetest.settings:get_bool("pala_server.clear_lag", true) then
	dofile(modpath.."/palalag.lua")
end

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/home.lua")
end

if minetest.settings:get_bool("palamod.debug", false) then
	dofile(modpath.."/debug.lua")
end

minetest.log("action", "[pala_server] loaded succesfully")
