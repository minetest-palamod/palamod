
--DECO BLOCKS


--#2e0051
-- if minetest.get_modpath("mcl_doors") then
	-- mcl_doors.register_door("pala_obsidian:obsidian_door", {
		-- "Protected Door",
		-- "default_stone.png",
		-- {pickaxey=5, building_block=1, material_stone=1},
		-- sounds = mcl_sounds.node_sound_stone_defaults(),
		-- _mcl_blast_resistance = 1200,
		-- _mcl_hardness = 50,
	-- })
-- end

if minetest.get_modpath("mcl_stairs") then
	mcl_stairs.register_slab("obsidian", "mcl_core:obsidian",
		{pickaxey=5, building_block=1, material_stone=1},
		{"default_obsidian.png"},
		("Obsidian Slab"), mcl_sounds.node_sound_stone_defaults(), 1200, 50,
		("Double Obsidian Slab"))
	--[[mcl_stairs.register_stair(subname, recipeitem,
		groups,
		images,
		description,
		sounds, blast-resistance, hardness,
		corner_stair_texture_override)
	]]
	mcl_stairs.register_stair("obsidian", "mcl_core:obsidian",
		{pickaxey=5, building_block=1, material_stone=1},
		{"default_obsidian.png"},
		("Obsidian Stairs"),
		mcl_sounds.node_sound_stone_defaults(), 1200, 50,
		"woodlike")
end


if minetest.get_modpath("mcl_doors") then
	mcl_doors:register_door("pala_obsidian:obsidian_door", {
		description = ("Protected Obsidian Door"),
		--_doc_items_longdesc = wood_longdesc,
		--_doc_items_usagehelp = wood_usagehelp,
		inventory_image = "pala_obsidian_item_obsidian.png",
		groups = {pickaxey=5, building_block=1, material_stone=1},
		_mcl_hardness = 50,
		_mcl_blast_resistance = 1200,
		tiles_bottom = {"pala_obsidian_door_obsidian_lower.png", "pala_obsidian_door_obsidian_side_lower.png"},
		tiles_top = {"pala_obsidian_door_obsidian_upper.png", "pala_obsidian_door_obsidian_side_upper.png"},
		sounds = mcl_sounds.node_sound_wood_defaults(),
	})
	mcl_doors:register_trapdoor("pala_obsidian:obsidian_trapdoor", {
		description = ("Protected Obsidian Trap Door"),
		--_doc_items_longdesc = wood_longdesc,
		--_doc_items_usagehelp = wood_usagehelp,
		inventory_image = "pala_obsidian_trapdoor_obsidian_front.png",
		groups = {pickaxey=5, building_block=1, material_stone=1},
		_mcl_hardness = 50,
		_mcl_blast_resistance = 1200,
		tile_front = "pala_obsidian_trapdoor_obsidian_front.png",
		tile_side = "pala_obsidian_trapdoor_obsidian_side.png",
		sounds = mcl_sounds.node_sound_wood_defaults(),
	})
end