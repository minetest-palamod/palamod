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