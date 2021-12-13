minetest.log("action", "[pala_tools] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

pala_tools = {}

dofile(modpath.."/pick.lua")
dofile(modpath.."/axe.lua")
dofile(modpath.."/shovel.lua")
dofile(modpath.."/swords.lua")
dofile(modpath.."/special_swords.lua")
dofile(modpath.."/infernalknocker.lua")
dofile(modpath.."/hammer.lua")
dofile(modpath.."/voidstone.lua")
dofile(modpath.."/hoe_overide.lua")
dofile(modpath.."/enchantments.lua")

minetest.log("action", "[pala_tools] loaded succesfully")