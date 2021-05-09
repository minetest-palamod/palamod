minetest.log("action", "[pala_mapgen] loading...")

pala_mapgen = {}

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/ores.lua")
dofile(modpath.."/biome_volcano.lua")

minetest.log("action", "[pala_mapgen] loaded succesfully")