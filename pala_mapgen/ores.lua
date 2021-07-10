local stonelike = {"mcl_core:stone", "mcl_core:diorite", "mcl_core:andesite", "mcl_core:granite"}

--Amethyst
-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_amethyst",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.AMETHYST_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_amethyst",
	wherein         = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.AMETHYST_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_amethyst",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.AMETHYST_LAYER),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_amethyst",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.AMETHYST_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_amethyst",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.AMETHYST_LAYER),
})

--Titanium
-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_titanium",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.TITANIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_titanium",
	wherein         = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.TITANIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_titanium",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.TITANIUM_LAYER),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_titanium",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.TITANIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_titanium",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.TITANIUM_LAYER),
})

--Paladium
-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_paladium",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.PALADIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_paladium",
	wherein         = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.PALADIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_paladium",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.PALADIUM_LAYER),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_paladium",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.PALADIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_paladium",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.PALADIUM_LAYER),
})

--Findium
-- Common spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_findium",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 4,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.FINDIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_findium",
	wherein         = stonelike,
	clust_scarcity = 5000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.FINDIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_findium",
	wherein         = stonelike,
	clust_scarcity = 10000,
	clust_num_ores = 8,
	clust_size     = 3,
	y_min          = mcl_vars.mg_overworld_min,
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.FINDIUM_LAYER),
})

-- Rare spawn
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_findium",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 1,
	clust_size     = 1,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.FINDIUM_LAYER),
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "pala_paladium:stone_with_findium",
	wherein         = stonelike,
	clust_scarcity = 20000,
	clust_num_ores = 2,
	clust_size     = 2,
	y_min          = mcl_worlds.layer_to_y(13),
	y_max          = mcl_worlds.layer_to_y(pala_mapgen.FINDIUM_LAYER),
})