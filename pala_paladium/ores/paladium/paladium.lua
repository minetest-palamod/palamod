--Paladium
minetest.register_node("pala_paladium:stone_with_paladium", {
	description = S("Paladium Ore"),
	_doc_items_longdesc = S("Paladium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"pala_paladium_mineral_paladium.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		--TEMP:need mineclone change
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner", {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 54, 48, 42, 36, 30, 24, 18, 12, 6})
		end
	end,
})

minetest.register_craftitem("pala_paladium:paladium_ingot", {
	description = S("Paladium Ingot"),
	_doc_items_longdesc = S("Molten Paladium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_paladium_ingot.png",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:paladiumblock", {
	description = S("Block of Paladium"),
	_doc_items_longdesc = S("A block of Paladium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_paladium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:paladiumblock",
	recipe = {
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
	},
})

minetest.register_craft({
	output = "pala_paladium:paladium_ingot 9",
	recipe = {
		{"pala_paladium:paladiumblock"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:paladium_ingot",
	recipe = "pala_paladium:stone_with_paladium",
	cooktime = 5,
})