minetest.log("action", "[pala_obsidian] loading...")

local modname = minetest.get_current_modname()

pala_obsidian = {}
pala_obsidian.modpath = minetest.get_modpath(modname)

dofile(pala_obsidian.modpath.."/api.lua")
dofile(pala_obsidian.modpath.."/register.lua")
dofile(pala_obsidian.modpath.."/tools.lua")
dofile(pala_obsidian.modpath.."/deco.lua")

minetest.log("action", "[pala_obsidian] loaded succesfully")