--Green Paladium
minetest.register_node("pala_paladium:stone_with_gpaladium", {
	description = S("Green Paladium Ore"),
	_doc_items_longdesc = S("Green Paladium ore is rare and can be given inside events."),
	tiles = {"default_stone.png^pala_paladium_mineral_gpaladium.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:gpaladium_ingot", {
	description = S("Green Paladium Ingot"),
	_doc_items_longdesc = S("Molten Green Paladium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_gpaladium_ingot.png",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:gpaladiumblock", {
	description = S("Block of Green Paladium"),
	_tt_help = C(mcl_colors.RED, S("Can't be decrafted")),
	_doc_items_longdesc = S("A block of Green Paladium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_gpaladium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:gpaladiumblock",
	recipe = {
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:gpaladium_ingot",
	recipe = "pala_paladium:stone_with_gpaladium",
	cooktime = 5,
})