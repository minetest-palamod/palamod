local S = minetest.get_translator(minetest.get_current_modname())

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

--Colored Lamp
local usage_help = S("Once installed, the lamp acts like a normal redstone lamp except that it constantly changes color.")

minetest.register_node("pala_decoblock:colored_lamp_off", {
	description = S("Colored Lamp"),
	_doc_items_usagehelp = usage_help,
	tiles = {"pala_decoblock_colored_lamp_off.png"},
	groups = {handy = 1, mesecon_effector_off = 1, mesecon = 2},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	mesecons = {effector = {
		action_on = function (pos, node)
			minetest.swap_node(pos, {name="pala_decoblock:colored_lamp_on", param2 = node.param2})
		end,
		rules = mesecon.rules.alldirs,
	}},
})

minetest.register_node("pala_decoblock:colored_lamp_on", {
	description = S("Colored Lamp"),
	_doc_items_usagehelp = usage_help,
	tiles = {
		{
			image = "pala_decoblock_colored_lamp_on.png",
			backface_culling = false,
			animation = {
				type = "vertical_frames",
				aspect_w = 16,
				aspect_h = 16,
				length = 1.5
			},
		}
	},
	drop = "pala_decoblock:colored_lamp_off",
	light_source = 14,
	groups = {handy = 1, mesecon_effector_on = 1, mesecon = 2, not_in_creative_inventory = 1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	mesecons = {effector = {
		action_off = function (pos, node)
			minetest.swap_node(pos, {name="pala_decoblock:colored_lamp_off", param2 = node.param2})
		end,
		rules = mesecon.rules.alldirs,
	}},
})
