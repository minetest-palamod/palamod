function placefakepala(pos, player)
	local x = math.random(pos.x-10,pos.x+10)
	local z = math.random(pos.z-10,pos.z+10)
	local y = minetest.get_spawn_level(x, z)
	if minetest.get_spawn_level(x, z) then
	--minetest.chat_send_all(tostring(y))
		local pos2 = {x = x, y = y,z = z}
	--minetest.chat_send_all(tostring(pos2))
	--local pos3 = {x = x, y = pos.y + 5,z = z}
		if not minetest.is_protected(pos2, player:get_player_name()) then
			minetest.set_node(pos2, {name="pala_luckyblock:fakepaladiumblock"})
			local meta = minetest.get_meta(pos2)
			meta:set_string("number", 1)
		end
		-- if minetest.get_node(pos2).name == "air" then
			-- if minetest.get_node(pos3).name == "air" then
				-- minetest.set_node(pos2, {name="pala_luckyblock:fakepaladiumblock"})
				-- local meta = minetest.get_meta(pos2)
				-- meta:set_string("number", 1)
				-- --minetest.chat_send_all(x..pos.y..z)
				-- --mcl_particles.add_node_particlespawner(pos2, particlespawner_definition, level)
				-- ok = true
			-- end
		-- end
	end
	--minetest.chat_send_all(x..pos.y..z)
	--minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)
end

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
--Because no check of protection (reduce lag)
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

local tnt_mesecons = nil
-- if minetest.get_modpath("mesecons") then
	-- tnt_mesecons = {effector = {
		-- action_on = tnt.ignite,
		-- rules = mesecon.rules.alldirs,
	-- }}
-- end
local sounds
if minetest.get_modpath("mcl_sounds") then
	sounds = mcl_sounds.node_sound_wood_defaults()
end
minetest.register_tool("pala_luckyblock:blaze_flint_and_steel", {
	description = "Blaze Flint and Steel",
	_tt_help = "Starts fires and ignites blocks",
	_doc_items_longdesc = "Flint and steel is a tool to start fires and ignite blocks.",
	_doc_items_usagehelp = [[
		Rightclick the surface of a block to attempt to light a fire in front of it or ignite the block.
		A few blocks have an unique reaction when ignited.
		]],
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

minetest.register_node("pala_luckyblock:faketnt", {
	tiles = {"default_tnt_top.png", "default_tnt_bottom.png",
			"default_tnt_side.png", "default_tnt_side.png",
			"default_tnt_side.png", "default_tnt_side.png"},
	is_ground_content = false,
	stack_max = 64,
	description = "Fake TNT",
	paramtype = "light",
	sunlight_propagates = true,
	_tt_help = "Ignited by tools, explosions, fire, lava, redstone power",
	--_doc_items_longdesc = longdesc,
	_doc_items_usagehelp = [[
		Place the TNT and ignite it with one of the methods above.
		Quickly get in safe distance.
		The TNT will start to be affected by gravity and explodes in 4 seconds.
		]],
	groups = { dig_immediate = 3, tnt = 1, enderman_takable=1, flammable=-1},
	mesecons = tnt_mesecons,
	on_blast = function(pos)
	    minetest.add_particle({
			pos = {x=pos.x,y=pos.y+0.5,z=pos.z},
			velocity = vector.new(math.random() * 0.2 - 0.1, 1.0 + math.random(), math.random() * 0.2 - 0.1),
			acceleration = vector.new(0, -0.1, 0),
			expirationtime = 0.15 + math.random() * 0.25,
			size = 1.0 + math.random(),
			collisiondetection = false,
			texture = "mcl_particles_smoke.png"
		})
	end,
	_on_ignite = function(player, pointed_thing)
		minetest.add_particle({
			pos = {x=pointed_thing.above.x,y=pointed_thing.above.y+0.5,z=pointed_thing.above.z},
			velocity = vector.new(math.random() * 0.2 - 0.1, 1.0 + math.random(), math.random() * 0.2 - 0.1),
			acceleration = vector.new(0, -0.1, 0),
			expirationtime = 0.15 + math.random() * 0.25,
			size = 1.0 + math.random(),
			collisiondetection = false,
			texture = "mcl_particles_smoke.png"
		})
		if pointed_thing.type == "node" then
			minetest.remove_node(minetest.get_pointed_thing_position(pointed_thing, true))
		end
	end,
	_on_burn = function(pos)
		minetest.add_particle({
			pos = {x=pos.x,y=pos.y+0.5,z=pos.z},
			velocity = vector.new(math.random() * 0.2 - 0.1, 1.0 + math.random(), math.random() * 0.2 - 0.1),
			acceleration = vector.new(0, -0.1, 0),
			expirationtime = 0.15 + math.random() * 0.25,
			size = 1.0 + math.random(),
			collisiondetection = false,
			texture = "mcl_particles_smoke.png"
		})
		minetest.remove_node(pos)
	end,
	_on_dispense = function(stack, pos, droppos, dropnode, dropdir)
		minetest.add_particle({
			pos = {x=pos.x,y=pos.y+0.5,z=pos.z},
			velocity = vector.new(math.random() * 0.2 - 0.1, 1.0 + math.random(), math.random() * 0.2 - 0.1),
			acceleration = vector.new(0, -0.1, 0),
			expirationtime = 0.15 + math.random() * 0.25,
			size = 1.0 + math.random(),
			collisiondetection = false,
			texture = "mcl_particles_smoke.png"
		})
		minetest.remove_node(pos)
	end,
	sounds = sounds,
})
