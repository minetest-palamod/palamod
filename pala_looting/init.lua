local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_looting = {}

dofile(modpath.."/caveblock.lua")
dofile(modpath.."/handglider.lua")
dofile(modpath.."/onlinedetector.lua")
dofile(modpath.."/items.lua")
dofile(modpath.."/tools.lua")
