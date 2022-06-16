minetest.log("action", "[pala_machines] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

pala_machines = {}

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/cobblebreaker.lua")
	dofile(modpath.."/potionstacker.lua")
end

minetest.log("action", "[pala_machines] loaded succesfully")
