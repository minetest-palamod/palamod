--Trixium
minetest.register_node("pala_paladium:stone_with_trixium", {
	description = S("Trixium Ore"),
	_doc_items_longdesc = S("Trixium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"pala_paladium_mineral_trixium.png"},
	drop = "pala_paladium:trixium_gem",
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	--XP then mining?
})

minetest.register_craftitem("pala_paladium:trixium_gem", {
	description = S("Trixium Gem"),
	_doc_items_longdesc = S("Trixium Gem. It's a competitive mineral."),
	inventory_image = "pala_paladium_trixium_gem.png",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:trixiumblock", {
	description = S("Block of Trixium"),
	_doc_items_longdesc = S("A block of trixium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_trixium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:trixiumblock",
	recipe = {
		{"pala_paladium:trixium_gem", "pala_paladium:trixium_gem", "pala_paladium:trixium_gem"},
		{"pala_paladium:trixium_gem", "pala_paladium:trixium_gem", "pala_paladium:trixium_gem"},
		{"pala_paladium:trixium_gem", "pala_paladium:trixium_gem", "pala_paladium:trixium_gem"},
	},
})

minetest.register_craft({
	output = "pala_paladium:trixium_gem 9",
	recipe = {
		{"pala_paladium:trixiumblock"},
	},
})