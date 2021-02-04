if minetest.get_modpath("pala_paladium") then
	if minetest.get_modpath("mcl_stairs") then
		--Paladium
		mcl_stairs.register_slab("paladium", "pala_paladium:paladiumblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_paladium_block.png"},
			("Paladium Slab"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5, -- <---- blast_resistance added
			("Double Paladium Slab"))

		--[[[mcl_stairs.register_stair(subname,
			recipeitem,
			groups,
			images,
			description,
			sounds,
			hardness,
			corner_stair_texture_override)]]

		mcl_stairs.register_stair("paladium", "pala_paladium:paladiumblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_paladium_block.png"},
			("Paladium Stairs"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
			"woodlike")

		--Titanium
		mcl_stairs.register_slab("titanium", "pala_paladium:titaniumblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_titanium_block.png"},
			("Titanium Slab"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
			("Double Titanium Slab"))
		mcl_stairs.register_stair("titanium", "pala_paladium:titaniumblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_titanium_block.png"},
			("Titanium Stairs"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
			"woodlike")

		--Amethyst
		mcl_stairs.register_slab("amethyst", "pala_paladium:amethystblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_amethyst_block.png"},
			("Amethyst Slab"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
			("Double Amethyst Slab"))

		mcl_stairs.register_stair("amethyst", "pala_paladium:amethystblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_amethyst_block.png"},
			("Amethyst Stairs")
			, mcl_sounds.node_sound_stone_defaults(), 5, 5,
			"woodlike")

		--Findium
		mcl_stairs.register_slab("findium", "pala_paladium:findiumblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_findiumblock.png"},
			("Findium Slab"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5,
			("Double Findium Slab"))

		mcl_stairs.register_stair("findium", "pala_paladium:findiumblock",
			{pickaxey=4, building_block=1},
			{"pala_paladium_findiumblock.png"},
			("Findium Stairs"),
			mcl_sounds.node_sound_stone_defaults(), 5, 5,
			"woodlike")
	end
end


minetest.register_node("pala_decoblock:colored_lamp", {
	description = "Colored Lamp",
	tiles = {
		{
			image = "default_furnace_front_active.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	light_source = 14,
	groups = {cracky=2},
	sounds = mcl_sounds.node_sound_stone_defaults(),
})
