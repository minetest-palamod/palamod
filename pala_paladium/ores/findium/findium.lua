--Findium
minetest.register_node("pala_paladium:stone_with_findium", {
	description = S("Findium Ore"),
	_doc_items_longdesc = S("Findium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"pala_paladium_mineral_findium.png"},
	drop = "pala_paladium:findium_gem",
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner",
				{65, 58.5, 52, 45.5, 39, 0, 0, 0, 0, 0, 65, 58.5, 52, 45.5, 39, 32.5, 26, 19.5, 13, 6.5})
		end
	end,
})

minetest.register_craftitem("pala_paladium:findium_gem", {
	description = S("Findium Gem"),
	_doc_items_longdesc = S("Findium Gem. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_findium_gem.png",
	groups = {craftitem=1},
})

minetest.register_node("pala_paladium:findiumblock", {
	description = S("Block of Findium"),
	_doc_items_longdesc = S("A block of findium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_findiumblock.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:findiumblock",
	recipe = {
		{"pala_paladium:findium_gem", "pala_paladium:findium_gem", "pala_paladium:findium_gem"},
		{"pala_paladium:findium_gem", "pala_paladium:findium_gem", "pala_paladium:findium_gem"},
		{"pala_paladium:findium_gem", "pala_paladium:findium_gem", "pala_paladium:findium_gem"},
	},
})

minetest.register_craft({
	output = "pala_paladium:findium_gem 9",
	recipe = {
		{"pala_paladium:findiumblock"},
	},
})