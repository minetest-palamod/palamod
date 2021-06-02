minetest.log("action", "[pala_storage] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

if minetest.settings:get_bool("palamod.experimental", false) then
    dofile(modpath.."/chests.lua")
end

minetest.log("action", "[pala_storage] loaded succesfully")