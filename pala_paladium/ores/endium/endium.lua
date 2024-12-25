--Endium
minetest.register_craftitem("pala_paladium:endium_ingot", {
	description = S("Endium Ingot"),
	_doc_items_longdesc = S("Molten Endium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_endium_ingot.png",
	groups = {craftitem=1},
})

minetest.register_craftitem("pala_paladium:endium_nugget", {
	description = S("Endium Nugget"),
	_doc_items_longdesc = S([[
		Endium nuggets are very small pieces of molten endium; the main purpose is to create endium ingots.
	]]),
	inventory_image = "pala_paladium_endium_nugget.png",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:stone_with_endium", { --Added by palamod V7.5
	description = S("Endium Ore"),
	_doc_items_longdesc = S("Endium ore is rare and can be given inside events."),
	tiles = {"pala_paladium_mineral_endium.png"},
	drop = "pala_paladium:endium_nugget",
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craft({
	output = "pala_paladium:endium_ingot",
	recipe = {
		{"pala_paladium:endium_nugget 9"},
	},
})

minetest.register_node("pala_paladium:endiumblock", {
	description = S("Block of Endium"),
	_tt_help = C(mcl_colors.RED, S("Can't be decrafted")),
	_doc_items_longdesc = S("A block of Endium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_endium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:endiumblock",
	recipe = {
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
	},
})
