local vector = vector

minetest.register_node("pala_tools:fertilised_dirt", {
	tiles = {"pala_tools_fertilised_dirt.png", "default_dirt.png^[colorize:#332521:200"},
	description = ("Fertilised Dirt"),
	_tt_help = ("Surface for crops"),
	_doc_items_longdesc = ([[
		Fertilised Dirt is used for farming, a necessary surface to plant crops.
		It is created when a hoe is used on dirt or a similar block.
		Plants are able to grow on farmland, but slowly.
		This block will turn back to dirt when a solid block appears above it or a piston arm extends above it.
		]]),
	drop = "mcl_core:dirt",
	drawtype = "nodebox",
	paramtype = "light",
	node_box = {
		type = "fixed",
		fixed = {
			-- 15/16 of the normal height
			{-0.5, -0.5, -0.5, 0.5, 0.4375, 0.5},
		}
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_int("wet", 0)
	end,
	groups = {handy=1,shovely=1, dirtifies_below_solid=1, dirtifier=1, soil=4, soil_sapling=1, deco_block=1 },
	sounds = mcl_sounds.node_sound_dirt_defaults(),
	_mcl_blast_resistance = 0.5,
	_mcl_hardness = 0.6,
})

if minetest.get_modpath("pala_job") then
	local uses = {
		wood = 60,
		stone = 132,
		iron = 251,
		gold = 33,
		diamond = 1562,
	}
	local function create_soil(pos, user)
		local level = user:get_meta():get_int("pala_job_level_miner")
		if pos == nil then
			return false
		end
		local node = minetest.get_node(pos)
		local name = node.name
		local above = minetest.get_node(vector.new(pos.x, pos.y + 1, pos.z))
		if minetest.get_item_group(name, "cultivatable") == 2 then
			if above.name == "air" then
				if level >= 5 then
					node.name = "pala_tools:fertilised_dirt"
				else
					node.name = "mcl_farming:soil"
				end
				minetest.set_node(pos, node)
				minetest.sound_play("default_dig_crumbly", { pos = pos, gain = 0.5 }, true)
				return true
			end
		elseif minetest.get_item_group(name, "cultivatable") == 1 then
			if above.name == "air" then
				node.name = "mcl_core:dirt"
				minetest.set_node(pos, node)
				minetest.sound_play("default_dig_crumbly", { pos = pos, gain = 0.6 }, true)
				return true
			end
		end
		return false
	end
	local on_place = function(wear_divisor)
		return function(itemstack, user, pointed_thing)
			-- Call on_rightclick if the pointed node defines it
			local new_stack = mcl_util.call_on_rightclick(itemstack, user, pointed_thing)
			if new_stack then
				return new_stack
			end

			if minetest.is_protected(pointed_thing.under, user:get_player_name()) then
				minetest.record_protection_violation(pointed_thing.under, user:get_player_name())
				return itemstack
			end

			if create_soil(pointed_thing.under, user) then
				if not minetest.settings:get_bool("creative_mode") then
					itemstack:add_wear(65535/wear_divisor)
				end
				return itemstack
			end
		end
	end
	minetest.override_item("mcl_farming:hoe_wood", {
		on_place = on_place(uses.wood)
	})
	minetest.override_item("mcl_farming:hoe_stone", {
		on_place = on_place(uses.stone)
	})
	minetest.override_item("mcl_farming:hoe_iron", {
		on_place = on_place(uses.iron)
	})
	minetest.override_item("mcl_farming:hoe_gold", {
		on_place = on_place(uses.gold)
	})
	minetest.override_item("mcl_farming:hoe_diamond", {
		on_place = on_place(uses.diamond)
	})
end
