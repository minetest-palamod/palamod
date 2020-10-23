minetest.register_node("pala_luckyblock:fakepaladiumblock", {
	description = ("Fake Block of Paladium"),
	_doc_items_longdesc = ("Strange Block"),
	tiles = {"pala_paladium_paladium_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	after_dig_node = function(pos, node, player)
		placefakepala(pos)
	end,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_node("pala_luckyblock:luckyblockfakepaladium", {
	description = ("Fake Paladium LuckyBlock"),
	_doc_items_longdesc = ("Fake Paladium LuckyBlock : use fur visuals"),
	tiles = {"pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, not_in_creative_inventory=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
}) 

minetest.register_node("pala_luckyblock:luckyblockfakeendium", {
	description = ("Fake Endium LuckyBlock"),
	_doc_items_longdesc = ("Fake Endium LuckyBlock : use fur visuals"),
	tiles = {"pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, not_in_creative_inventory=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
}) 