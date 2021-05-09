minetest.log("action", "[pala_looting] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_looting = {}

dofile(modpath.."/caveblock.lua")
dofile(modpath.."/handglider.lua")
dofile(modpath.."/onlinedetector.lua")
dofile(modpath.."/items.lua")

if minetest.settings:get_bool("palamod.experimental", false) then
    dofile(modpath.."/unclaimfinder.lua")
	dofile(modpath.."/chest_explorer.lua")
end

minetest.log("action", "[pala_looting] loaded succesfully")