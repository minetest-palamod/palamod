--A volcano biome, mostly composed by obsidian

if minetest.settings:get_bool("palamod.experimental", false) then
	minetest.register_biome({
		name = "volcano",
		node_dust = "mcl_core:obsidian",
		node_top = "mcl_core:obsidian",
		depth_top = 1,
		node_filler = "mcl_core:obsidian",
		depth_filler = 7,
		node_stone = "mcl_core:obsidian",
		node_water_top = "mcl_core:water_source",
		depth_water_top = 10,
		node_water = "",
		node_river_water = "mcl_core:lava_source",
		node_riverbed = "mcl_core:stone",
		depth_riverbed = 3,
		y_min = 5,
		y_max = 75,
		heat_point = 40,
		humidity_point = 10,
	})
end
