minetest.log("action", "[pala_job] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

pala_job = {}

if minetest.get_modpath("db_manager") then
	minetest.log("action", "[pala_job] 'db_manager' found, initialising job database")
	dofile(modpath.."/api.lua")
else
	minetest.log("action", "[pala_job] 'db_manager' not found, job system is disabled")
	dofile(modpath.."/fallback.lua")
end

minetest.log("action", "[pala_job] loaded succesfully")