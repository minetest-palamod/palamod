minetest.log("action", "[pala_looting] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

pala_looting = {}

dofile(modpath.."/caveblock.lua")
dofile(modpath.."/handglider.lua")
dofile(modpath.."/onlinedetector.lua")

if minetest.settings:get_bool("palamod.experimental", false) then
    dofile(modpath.."/unclaimfinder.lua")
	dofile(modpath.."/chest_explorer.lua")
end

minetest.log("action", "[pala_looting] loaded succesfully")