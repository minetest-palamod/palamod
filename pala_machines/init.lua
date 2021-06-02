minetest.log("action", "[pala_machines] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

pala_machines = {}

dofile(modpath.."/potionstacker.lua")

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/cobblebreaker.lua")
end

minetest.log("action", "[pala_machines] loaded succesfully")