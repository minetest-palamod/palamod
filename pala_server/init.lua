minetest.log("action", "[pala_server] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_server = {}

dofile(modpath.."/utils.lua")
dofile(modpath.."/msg.lua")
dofile(modpath.."/spawn.lua")

if minetest.settings:get_bool("palamod.debug", false) then
	dofile(modpath.."/debug.lua")
end

minetest.log("action", "[pala_server] loaded succesfully")