minetest.log("action", "[pala_mapgen] loading...")

pala_mapgen = {}

local modpath = minetest.get_modpath(minetest.get_current_modname())

dofile(modpath.."/vars.lua")

if minetest.settings:get_bool("pala_mapgen.generate_ores", true) then
	dofile(modpath.."/ores.lua")
end

dofile(modpath.."/biome_volcano.lua")

minetest.log("action", "[pala_mapgen] loaded succesfully")