minetest.log("action", "[pala_trixium] loading...")

local modpath = minetest.get_modpath(minetest.get_current_modname())

pala_trixium = {}

if minetest.settings:get_bool("pala_trixium.ranking", false) then
	minetest.log("action", "[pala_trixium] enabling ranking...")
	if minetest.get_modpath("db_manager") then
		pala_trixium.IS_ENABLED = true
		dofile(modpath.."/api.lua")
		dofile(modpath.."/tmp_commands.lua")
		minetest.log("action", "[pala_trixium] 'db_manager' found")
	else
		pala_trixium.IS_ENABLED = false
		minetest.log("error", "[pala_trixium] 'db_manager' not found!")
	end
else
	pala_trixium.IS_ENABLED = false
	minetest.log("action", "[pala_trixium] ranking is disabled")
end

minetest.log("action", "[pala_trixium] loaded succesfully")