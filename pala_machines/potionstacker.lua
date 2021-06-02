local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize
local F = minetest.formspec_escape
local get_group = minetest.get_item_group

--local function update_inventory()
--end

-- Update the inventory slots
-- meta: Metadata of node
local function update_slots(meta)
	local inv = meta:get_inventory()
	local input = inv:get_stack("input", 1)
	local output = inv:get_stack("output", 1)
    if input:get_name() == output:get_name() or output:is_empty() then
        local count = input:get_count() + output:get_count()
		inv:set_stack("output", 1, ItemStack({name=input:get_name(), count=count}))
		inv:set_stack("input", 1, ItemStack())
    end
end

-- Drop input items pos with metadata meta
local function drop_items(pos, meta)
	local inv = meta:get_inventory()
	for i=1, 2 do
		local stack = inv:get_stack("input", i)
		if not stack:is_empty() then
			local p = {x=pos.x+math.random(0, 10)/10-0.5, y=pos.y, z=pos.z+math.random(0, 10)/10-0.5}
			minetest.add_item(p, stack)
		end
	end
end

local function after_dig_node(pos, oldnode, oldmetadata, digger)
	local meta = minetest.get_meta(pos)
	local meta2 = meta:to_table()
	meta:from_table(oldmetadata)
	drop_items(pos, meta)
	meta:from_table(meta2)
end

local function allow_metadata_inventory_take(pos, listname, index, stack, player)
	local name = player:get_player_name()
	if minetest.is_protected(pos, name) then
		minetest.record_protection_violation(pos, name)
		return 0
	else
		return stack:get_count()
	end
end

minetest.register_node("pala_machines:potionstacker", {
    description = S("Potion Stacker"),
	groups = {pickaxey=1, deco_block=1},
	tiles = {"default_stone.png"},
	_tt_help = S("Allow you to stack potions"),
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 5,
	after_dig_node = after_dig_node,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local name = player:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return 0
		elseif listname == "output" then
			return 0
        elseif get_group(stack:get_name(), "brewitem") == 1 then
			return stack:get_count()
        else
            return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local name = player:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return 0
		elseif to_list == "output" then
			return 0
		elseif from_list == "output" and to_list == "input" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if inv:get_stack(to_list, to_index):is_empty() then
				return count
			else
				return 0
			end
		else
			return count
		end
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
		if listname == "input" then
			minetest.swap_node(pos, {name="pala_machines:potionstacker_on"})
			minetest.get_node_timer(pos):start(1)
		end
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if from_list == "output" and to_list == "input" then
			local inv = meta:get_inventory()
			for i=1, inv:get_size("input") do
				if i ~= to_index then
					local istack = inv:get_stack("input", i)
					istack:set_count(math.max(0, istack:get_count() - count))
					inv:set_stack("input", i, istack)
				end
			end
		end
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("input", 1)
		inv:set_size("output", 1)
		--TODO: better form
		meta:set_string("formspec",
            "size[9,8.75]"..
            "background[-0.19,-0.25;9.41,9.49;mcl_anvils_inventory.png]"..
            "label[0,4.0;"..F(C(mcl_colors.DARK_GRAY, S("Inventory"))).."]"..
            "list[current_player;main;0,4.5;9,3;9]"..
            mcl_formspec.get_itemslot_bg(0,4.5,9,3)..
            "list[current_player;main;0,7.74;9,1;]"..
            mcl_formspec.get_itemslot_bg(0,7.74,9,1)..
            "list[context;input;1,2.5;1,1;]"..
            mcl_formspec.get_itemslot_bg(1,2.5,1,1)..
            "list[context;output;8,2.5;1,1;]"..
            mcl_formspec.get_itemslot_bg(8,2.5,1,1)..
            "label[3,0.1;"..F(C(mcl_colors.DARK_GRAY, S("Stack potions"))).."]"..
            "listring[context;output]"..
            "listring[current_player;main]"..
            "listring[context;input]"..
            "listring[current_player;main]"
        )
	end,
})

minetest.register_node("pala_machines:potionstacker_on", {
    description = S("Potion Stacker"),
	groups = {pickaxey=1, deco_block=1},
	tiles = {"default_stone.png"},
	_tt_help = S("Allow you to stack potions"),
	sounds = mcl_sounds.node_sound_metal_defaults(),
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 5,
	after_dig_node = after_dig_node,
	allow_metadata_inventory_take = allow_metadata_inventory_take,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local name = player:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return 0
		elseif listname == "output" then
			return 0
        elseif get_group(stack:get_name(), "brewitem") == 1 then
			return stack:get_count()
        else
            return 0
		end
	end,
	allow_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local name = player:get_player_name()
		if minetest.is_protected(pos, name) then
			minetest.record_protection_violation(pos, name)
			return 0
		elseif to_list == "output" then
			return 0
		elseif from_list == "output" and to_list == "input" then
			local meta = minetest.get_meta(pos)
			local inv = meta:get_inventory()
			if inv:get_stack(to_list, to_index):is_empty() then
				return count
			else
				return 0
			end
		else
			return count
		end
	end,
	on_metadata_inventory_put = function(pos, listname, index, stack, player)
	end,
	on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
		local meta = minetest.get_meta(pos)
		if from_list == "output" and to_list == "input" then
			local inv = meta:get_inventory()
			for i=1, inv:get_size("input") do
				if i ~= to_index then
					local istack = inv:get_stack("input", i)
					istack:set_count(math.max(0, istack:get_count() - count))
					inv:set_stack("input", i, istack)
				end
			end
		end
	end,
	on_metadata_inventory_take = function(pos, listname, index, stack, player)
	end,
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		inv:set_size("input", 1)
		inv:set_size("output", 1)
		meta:set_string("formspec",
            "size[9,8.75]"..
            "background[-0.19,-0.25;9.41,9.49;mcl_anvils_inventory.png]"..
            "label[0,4.0;"..F(C(mcl_colors.DARK_GRAY, S("Inventory"))).."]"..
            "list[current_player;main;0,4.5;9,3;9]"..
            mcl_formspec.get_itemslot_bg(0,4.5,9,3)..
            "list[current_player;main;0,7.74;9,1;]"..
            mcl_formspec.get_itemslot_bg(0,7.74,9,1)..
            "list[context;input;1,2.5;1,1;]"..
            mcl_formspec.get_itemslot_bg(1,2.5,1,1)..
            "list[context;output;8,2.5;1,1;]"..
            mcl_formspec.get_itemslot_bg(8,2.5,1,1)..
            "label[3,0.1;"..F(C(mcl_colors.DARK_GRAY, S("Stack potions"))).."]"..
            "listring[context;output]"..
            "listring[current_player;main]"..
            "listring[context;input]"..
            "listring[current_player;main]"
        )
	end,
	on_timer = function(pos, elapsed)
		update_slots(minetest.get_meta(pos))
	end,
})
