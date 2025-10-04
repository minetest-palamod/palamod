--Amethyst
minetest.register_node("pala_paladium:stone_with_amethyst", {
	description = S("Amethyst Ore"),
	_doc_items_longdesc = S("Amethyst ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_amethyst.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:amethyst_ingot", {
	description = S("Amethyst Ingot"),
	_doc_items_longdesc = S("Molten Amethyst. It is used to craft armor, tools, and whatnot."),
	inventory_image = "default_steel_ingot.png^[colorize:#944dc7:150",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:amethystblock", {
	description = S("Block of Amethyst"),
	_doc_items_longdesc = S("A block of amethyst is mostly a shiny decorative block."),
	tiles = {"pala_paladium_amethyst_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:amethystblock",
	recipe = {
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
	},
})

minetest.register_craft({
	output = "pala_paladium:amethyst_ingot 9",
	recipe = {
		{"pala_paladium:amethystblock"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:amethyst_ingot",
	recipe = "pala_paladium:stone_with_amethyst",
	cooktime = 5,
})