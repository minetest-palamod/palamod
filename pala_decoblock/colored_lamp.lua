local S = minetest.get_translator(minetest.get_current_modname())

--Colored Lamp
local usage_help = S("Once installed, the lamp acts like a normal redstone lamp except that it constantly changes color.")

minetest.register_node("pala_decoblock:colored_lamp_off", {
	description = S("Colored Lamp"),
	_doc_items_usagehelp = usage_help,
	tiles = {"pala_decoblock_colored_lamp_off.png"},
	groups = {handy = 1, mesecon_effector_off = 1, mesecon = 2},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	mesecons = {
		effector = {
			action_on = function(pos, node)
				minetest.swap_node(pos, {name="pala_decoblock:colored_lamp_on", param2 = node.param2})
			end,
			rules = mesecon.rules.alldirs,
		},
	},
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
		},
	},
	drop = "pala_decoblock:colored_lamp_off",
	light_source = 14,
	groups = {handy = 1, mesecon_effector_on = 1, mesecon = 2, not_in_creative_inventory = 1},
	sounds = mcl_sounds.node_sound_glass_defaults(),
	mesecons = {
		effector = {
			action_off = function(pos, node)
				minetest.swap_node(pos, {name = "pala_decoblock:colored_lamp_off", param2 = node.param2})
			end,
			rules = mesecon.rules.alldirs,
		},
	},
})
