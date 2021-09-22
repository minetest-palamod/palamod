local S = minetest.get_translator(minetest.get_current_modname())

local string = string
local vector = vector

local sf = string.format

local function close_forms(pos)
	local players = minetest.get_connected_players()
	for p=1, #players do
		if vector.distance(players[p]:get_pos(), pos) <= 30 then
			minetest.close_formspec(players[p]:get_player_name(), "mcl_chests:autocrafter_"..pos.x.."_"..pos.y.."_"..pos.z)
		end
	end
end

--[[
minetest.show_formspec(clicker:get_player_name(),
				sf("mcl_chests:%s_%s_%s_%s", canonical_basename, pos.x, pos.y, pos.z),
				table.concat({
					"formspec_version[4]",
					"size[11.75,10.425]",
					mcl_formspec.apply_label_size,

					"label[0.375,0.375;"..F(C(mcl_formspec.label_color, name)).."]",

					mcl_formspec.get_itemslot_bg_v4(0.375, 0.75, 9, 3),
					sf("list[nodemeta:%s,%s,%s;main;0.375,0.75;9,3;]", pos.x, pos.y, pos.z),

					"label[0.375,4.7;"..F(C(mcl_formspec.label_color, S("Inventory"))).."]",

					mcl_formspec.get_itemslot_bg_v4(0.375, 5.1, 9, 3),
					"list[current_player;main;0.375,5.1;9,3;9]",

					mcl_formspec.get_itemslot_bg_v4(0.375, 9.05, 9, 1),
					"list[current_player;main;0.375,9.05;9,1;]",

					sf("listring[nodemeta:%s,%s,%s;main]", pos.x, pos.y, pos.z),
					"listring[current_player;main]",
				})
			)
]]

minetest.register_node("pala_machines:autocrafter", {
	description = S("Autocrafter"),
	--_tt_help = ("Uses fuel to smelt or cook items"),
	--_doc_items_longdesc = ("Furnaces cook or smelt several items, using a furnace fuel, into something else."),
	--_doc_items_usagehelp = nil,
	--_doc_items_hidden = false,
	tiles = "default_stone.png",
	paramtype2 = "facedir",
	groups = {pickaxey=1, container=4, deco_block=1, material_stone=1},
	is_ground_content = false,
	sounds = mcl_sounds.node_sound_stone_defaults(),

	--on_timer = furnace_node_timer,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)

	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("selected", "")
		local inv = meta:get_inventory()
		inv:set_size("src", 3*3)
		inv:set_size("out", 3*3)
	end,
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		minetest.show_formspec(clicker:get_player_name(),
			sf("mcl_chests:autocrafter_%s_%s_%s", pos.x, pos.y, pos.z), "") --FIXME
	end,
	on_destruct = function(pos)
		close_forms(pos)
	end,

	on_metadata_inventory_move = function(pos)

	end,
	on_metadata_inventory_put = function(pos)

	end,
	on_metadata_inventory_take = function(pos)

	end,

	--allow_metadata_inventory_put = allow_metadata_inventory_put,
	-- allow_metadata_inventory_move = allow_metadata_inventory_move,
	-- allow_metadata_inventory_take = allow_metadata_inventory_take,
	--on_receive_fields = receive_fields,
	_mcl_blast_resistance = 3.5,
	_mcl_hardness = 3.5,
})

minetest.register_node("pala_machines:autocrafter_active", {
	description = S("Autocrafter"),
	_doc_items_create_entry = false,
	tiles = "default_stone.png",
	paramtype2 = "facedir",
	drop = "pala_machines:autocrafter",
	groups = {pickaxey=1, container=4, deco_block=1, not_in_creative_inventory=1, material_stone=1},
	is_ground_content = false,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	--on_timer = cobblebreaker_node_timer,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
	end,
	--allow_metadata_inventory_put = allow_metadata_inventory_put,
	--allow_metadata_inventory_move = allow_metadata_inventory_move,
	--allow_metadata_inventory_take = allow_metadata_inventory_take,
	--on_metadata_inventory_take = on_metadata_inventory_take,
	--on_receive_fields = receive_fields,
	_mcl_blast_resistance = 3.5,
	_mcl_hardness = 3.5,
})