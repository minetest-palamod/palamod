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

minetest.register_tool("pala_luckyblock:blaze_flint_and_steel", {
	description = "Blaze Flint and Steel",
	_tt_help = "Starts fires and ignites blocks", 
	_doc_items_longdesc = "Flint and steel is a tool to start fires and ignite blocks.",
	_doc_items_usagehelp = "Rightclick the surface of a block to attempt to light a fire in front of it or ignite the block. A few blocks have an unique reaction when ignited.",
	inventory_image = "mcl_fire_flint_and_steel.png",
	liquids_pointable = false,
	stack_max = 1,
	groups = { tool = 1 },
	on_place = function(itemstack, user, pointed_thing)
		-- Use pointed node's on_rightclick function first, if present
		local node = minetest.get_node(pointed_thing.under)
		if user and not user:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, user, itemstack) or itemstack
			end
		end
		-- Check protection
		local protname = user:get_player_name()
		if minetest.is_protected(pointed_thing.under, protname) then
			minetest.record_protection_violation(pointed_thing.under, protname)
			return itemstack
		end

		local idef = itemstack:get_definition()
		minetest.sound_play(
			"fire_flint_and_steel",
			{pos = pointed_thing.above, gain = 0.5, max_hear_distance = 8},
			true
		)
		local used = false
		if pointed_thing.type == "node" then
			local nodedef = minetest.registered_nodes[minetest.get_node(pointed_thing.under).name]
			if nodedef and nodedef._on_ignite then
				local overwrite = nodedef._on_ignite(user, pointed_thing)
				if not overwrite then
					mcl_fire.set_fire(pointed_thing, user, false)
				end
			else
				mcl_fire.set_fire(pointed_thing, user, false)
			end
			used = true
		end
		if itemstack:get_count() == 0 and idef.sound and idef.sound.breaks then
			minetest.sound_play(idef.sound.breaks, {pos=user:get_pos(), gain=0.5}, true)
		end
		if (not minetest.is_creative_enabled(user:get_player_name())) and used == true then
			itemstack:add_wear(65535/65) -- 65 uses
		end
		return itemstack
	end,
	_dispense_into_walkable = true,
	_on_dispense = function(stack, pos, droppos, dropnode, dropdir)
		-- Ignite air
		if dropnode.name == "air" then
			minetest.add_node(droppos, {name="mcl_fire:fire"})
			if not minetest.is_creative_enabled("") then
				stack:add_wear(65535/65) -- 65 uses
			end
		-- Ignite TNT
		elseif dropnode.name == "mcl_tnt:tnt" then
			tnt.ignite(droppos)
			if not minetest.is_creative_enabled("") then
				stack:add_wear(65535/65) -- 65 uses
			end
		end
		return stack
	end,
	sound = { breaks = "default_tool_breaks" },
})