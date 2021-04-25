local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_server = {}

dofile(modpath.."/spawn.lua")


if minetest.settings:get_bool("palamod.debug", false) then
	dofile(modpath.."/debug.lua")
end