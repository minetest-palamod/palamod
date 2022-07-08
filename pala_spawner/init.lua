minetest.log("action", "[pala_spawner] loading...")

local S = minetest.get_translator("pala_spawner")

mcl_autogroup.register_diggroup("hammer_spawner")


-- Cavern Hammer
minetest.register_tool("pala_spawner:cavern_hammer", {
	description = S("Cavern Hammer"),
	_doc_items_longdesc = S("Used for modded spawners"),
	inventory_image = "pala_tools_infernalknocker.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = {tool = 1, dig_speed_class = 2, enchantability = 12},
	sound = { breaks = "default_tool_breaks" },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 5,
		damage_groups = {fleshy=4},
		punch_attack_uses = 4999,
	},
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		hammer_spawner = { speed = 9, level = 5, uses = 4999 }
	},
})

minetest.override_item("mcl_mobspawners:spawner", {
	groups = {pickaxey = 1, material_stone = 1, deco_block = 1, hammer_spawner = 1},
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if digger:get_wielded_item():get_name() == "pala_spawner:cavern_hammer" then
			minetest.chat_send_all("Stuff")
			local mob = oldmetadata.fields.Mob
			minetest.chat_send_all(mob)
		end
	end,
})


minetest.register_node("pala_spawner:spawner_broken", {
	tiles = {"mob_spawner.png"},
	drawtype = "glasslike",
	paramtype = "light",
	walkable = true,
	description = ("Brocken Mob Spawner"),
	_tt_help = S("Brocken Mob Spawner"),
	groups = {pickaxey = 1, material_stone = 1, deco_block = 1},
	is_ground_content = false,
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 5,
	_mcl_hardness = 5,
})

minetest.log("action", "[pala_server] loaded succesfully")
