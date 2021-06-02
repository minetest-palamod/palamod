minetest.log("action", "[pala_decoblock] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/stairs.lua")
dofile(modpath.."/colored_lamp.lua")

minetest.log("action", "[pala_decoblock] loaded succesfully")