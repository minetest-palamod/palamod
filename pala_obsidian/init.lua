minetest.log("action", "[pala_obsidian] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

pala_obsidian = {}

dofile(modpath.."/api.lua")
dofile(modpath.."/register.lua")
dofile(modpath.."/tools.lua")
dofile(modpath.."/deco.lua")

minetest.log("action", "[pala_obsidian] loaded succesfully")
