--Titanium
minetest.register_node("pala_paladium:stone_with_titanium", {
	description = S("Titanium Ore"),
	_doc_items_longdesc = S("Titanium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_titanium.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:titanium_ingot", {
	description = S("Titanium Ingot"),
	_doc_items_longdesc = S("Molten Titanium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_titanium_ingot.png",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:titaniumblock", {
	description = S("Block of Titanium"),
	_doc_items_longdesc = S("A block of titanium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_titanium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:titaniumblock",
	recipe = {
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
	},
})

minetest.register_craft({
	output = "pala_paladium:titanium_ingot 9",
	recipe = {
		{"pala_paladium:titaniumblock"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:titanium_ingot",
	recipe = "pala_paladium:stone_with_titanium",
	cooktime = 5,
})