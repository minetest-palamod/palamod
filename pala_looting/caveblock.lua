local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node("pala_looting:caveblock", {
	description = S("Cave Block"),
	_doc_items_longdesc = S("Cave Block allow players to see through blocks."),
	tiles = {"pala_looting_caveblock.png"},
	use_texture_alpha = "clip",
	sunlight_propagates = true,
	groups = {pickaxey = 2, building_block = 1, material_stone = 1},
})

if minetest.get_modpath("mcl_core") then
	if minetest.get_modpath("pala_paladium") then
		minetest.register_craft({
			output = "pala_looting:caveblock",
			recipe = {
				{"mcl_core:glass", "mcl_core:glass", "mcl_core:glass"},
				{"mcl_core:glass", "pala_paladium:findium", "mcl_core:glass"},
				{"mcl_core:glass", "mcl_core:glass", "mcl_core:glass"},
			},
		})
	end
end