pala_machines.particule_list = {}
local function active_formspec(fuel_percent, item_percent)
	return "size[9,8.75]"..
	"label[0,4;"..minetest.formspec_escape(minetest.colorize("#313131", S("Inventory"))).."]"..
	"list[current_player;main;0,4.5;9,3;9]"..
	mcl_formspec.get_itemslot_bg(0,4.5,9,3)..
	"list[current_player;main;0,7.74;9,1;]"..
	mcl_formspec.get_itemslot_bg(0,7.74,9,1)..
	"label[2.75,0;"..minetest.formspec_escape(minetest.colorize("#313131", S("Furnace"))).."]"..
	"list[current_name;src;2.75,0.5;1,1;]"..
	mcl_formspec.get_itemslot_bg(2.75,0.5,1,1)..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	mcl_formspec.get_itemslot_bg(2.75,2.5,1,1)..
	"list[current_name;dst;5.75,1.5;1,1;]"..
	mcl_formspec.get_itemslot_bg(5.75,1.5,1,1)..
	"image[2.75,1.5;1,1;default_furnace_fire_bg.png^[lowpart:"..
	(100-fuel_percent)..":default_furnace_fire_fg.png]"..
	"image[4.1,1.5;1.5,1;gui_furnace_arrow_bg.png^[lowpart:"..
	(item_percent)..":gui_furnace_arrow_fg.png^[transformR270]"..
	-- Craft guide button temporarily removed due to Minetest bug.
	-- TODO: Add it back when the Minetest bug is fixed.
	--"image_button[8,0;1,1;craftguide_book.png;craftguide;]"..
	--"tooltip[craftguide;"..minetest.formspec_escape(S("Recipe book")).."]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"
end

local inactive_formspec = "size[9,8.75]"..
	"label[0,4;"..minetest.formspec_escape(minetest.colorize("#313131", S("Inventory"))).."]"..
	"list[current_player;main;0,4.5;9,3;9]"..
	mcl_formspec.get_itemslot_bg(0,4.5,9,3)..
	"list[current_player;main;0,7.74;9,1;]"..
	mcl_formspec.get_itemslot_bg(0,7.74,9,1)..
	"label[2.75,0;"..minetest.formspec_escape(minetest.colorize("#313131", S("Furnace"))).."]"..
	"list[current_name;src;2.75,0.5;1,1;]"..
	mcl_formspec.get_itemslot_bg(2.75,0.5,1,1)..
	"list[current_name;fuel;2.75,2.5;1,1;]"..
	mcl_formspec.get_itemslot_bg(2.75,2.5,1,1)..
	"list[current_name;dst;5.75,1.5;1,1;]"..
	mcl_formspec.get_itemslot_bg(5.75,1.5,1,1)..
	"image[2.75,1.5;1,1;default_furnace_fire_bg.png]"..
	"image[4.1,1.5;1.5,1;gui_furnace_arrow_bg.png^[transformR270]"..
	-- Craft guide button temporarily removed due to Minetest bug.
	-- TODO: Add it back when the Minetest bug is fixed.
	--"image_button[8,0;1,1;craftguide_book.png;craftguide;]"..
	--"tooltip[craftguide;"..minetest.formspec_escape(S("Recipe book")).."]"..
	"listring[current_name;dst]"..
	"listring[current_player;main]"..
	"listring[current_name;src]"..
	"listring[current_player;main]"..
	"listring[current_name;fuel]"..
	"listring[current_player;main]"

local function cobblebreaker_node_timer(pos, elapsed)
	--
	-- Inizialize metadata
	--
	local meta, elapsed_game_time = furnace_get_delta_time(pos, elapsed)

	local fuel_time = meta:get_float("fuel_time") or 0
	local src_time = meta:get_float("src_time") or 0
	local src_item = meta:get_string("src_item") or ""
	--local fuel_totaltime = meta:get_float("fuel_totaltime") or 0

	local inv = meta:get_inventory()
	local srclist, outlist
	local active = true

	srclist = inv:get_list("src")
	outlist = inv:get_list("out")

	-- Check if src item has been changed
	if srclist[1]:get_name() ~= src_item then
		-- Reset cooking progress in this case
		src_time = 0
		src_item = srclist[1]:get_name()
	end

	local update = true
	while elapsed_game_time > 0.00001 and update do
			-- Successful cooking requires space in dst slot and time
			if not inv:room_for_item("dst", "pala_machines:particle_paladium") then
				cookable = false
			end
		end

		if cookable then -- fuel lasts long enough, adjust el to cooking duration
			el = math.min(el, cooked.time - src_time)
		elseif active then
			el = math.min(el, fuel_totaltime - fuel_time)
			-- The furnace is currently active and has enough fuel
			fuel_time = fuel_time + el
		end

		-- If there is a cookable item then check if it is ready yet
		if cookable and active then
			src_time = src_time + el
			-- Place result in dst list if done
			if src_time >= cooked.time then
				inv:add_item("out", pala_machines.particule_list[math.random(1, 6)])

				srclist = inv:get_list("src")
				src_time = 0
			end
		end

		elapsed_game_time = elapsed_game_time - el
	end

	if fuel and fuel_totaltime > fuel.time then
		fuel_totaltime = fuel.time
	end
	if srclist and srclist[1]:is_empty() then
		src_time = 0
	end

	--
	-- Update formspec and node
	--
	local formspec = inactive_formspec
	local item_state
	local item_percent = 0
	if cookable then
		item_percent = math.floor(src_time / cooked.time * 100)
	end

	local result = false

	if active then
		local fuel_percent = 0
		if fuel_totaltime > 0 then
			fuel_percent = math.floor(fuel_time / fuel_totaltime * 100)
		end
		formspec = active_formspec(fuel_percent, item_percent)
		swap_node(pos, "mcl_furnaces:furnace_active")
		-- make sure timer restarts automatically
		result = true
	else
		swap_node(pos, "mcl_furnaces:furnace")
		-- stop timer on the inactive furnace
		minetest.get_node_timer(pos):stop()
	end
	--
	-- Set meta values
	--
	meta:set_float("fuel_totaltime", fuel_totaltime)
	meta:set_float("fuel_time", fuel_time)
	meta:set_float("src_time", src_time)
	if srclist then
		 meta:set_string("src_item", srclist[1]:get_name())
	else
		 meta:set_string("src_item", "")
	end
	meta:set_string("formspec", formspec)
	return result
end

local function allow_metadata_inventory_put(pos, listname, index, stack, player)
	local name = player:get_player_name()
	if minetest.is_protected(pos, name) then
		minetest.record_protection_violation(pos, name)
		return 0
	end
	local meta = minetest.get_meta(pos)
	local inv = meta:get_inventory()
	if listname == "scr" then
		if stack:get_name() == "mcl_buckets:bucket_empty" then
			if inv:get_stack(listname, index):get_name() == "mcl_core:cobble" then
				return 1
			else
				return 0
			end
		end
	elseif listname == "out" then
		return 0
	end
end

minetest.register_node("pala_machines:cobblebreaker", {
	description = ("Cobble Breaker"),
	_tt_help = ("Uses fuel to smelt or cook items"),
	_doc_items_longdesc = ("Furnaces cook or smelt several items, using a furnace fuel, into something else."),
	_doc_items_usagehelp =
			("Use the furnace to open the furnace menu. Place a furnace fuel in the lower slot and the source material in the upper slot. The furnace will slowly use its fuel to smelt the item. The result will be placed into the output slot at the right side.").."\n"..
			("Use the recipe book to see what you can smelt, what you can use as fuel and how long it will burn."),
	_doc_items_hidden = false,
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "default_furnace_front.png"
	},
	paramtype2 = "facedir",
	groups = {pickaxey=1, container=4, deco_block=1, material_stone=1},
	is_ground_content = false,
	sounds = mcl_sounds.node_sound_stone_defaults(),

	on_timer = furnace_node_timer,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local meta = minetest.get_meta(pos)
		local meta2 = meta
		meta:from_table(oldmetadata)
		local inv = meta:get_inventory()
		for _, listname in ipairs({"src", "dst", "fuel"}) do
			local stack = inv:get_stack(listname, 1)
			if not stack:is_empty() then
				local p = {x=pos.x+math.random(0, 10)/10-0.5, y=pos.y, z=pos.z+math.random(0, 10)/10-0.5}
				minetest.add_item(p, stack)
			end
		end
		meta:from_table(meta2:to_table())
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", inactive_formspec)
		local inv = meta:get_inventory()
		inv:set_size('src', 1)
		inv:set_size('out', 6)
	end,
	on_destruct = function(pos) end,

	on_metadata_inventory_move = function(pos)
		-- Reset accumulated game time when player works with furnace:
		furnace_reset_delta_time(pos)
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_put = function(pos)
		-- Reset accumulated game time when player works with furnace:
		furnace_reset_delta_time(pos)
		-- start timer function, it will sort out whether furnace can burn or not.
		minetest.get_node_timer(pos):start(1.0)
	end,
	on_metadata_inventory_take = function(pos)
		-- Reset accumulated game time when player works with furnace:
		furnace_reset_delta_time(pos)
		-- start timer function, it will helpful if player clears dst slot
		minetest.get_node_timer(pos):start(1.0)
	end,

	allow_metadata_inventory_put = allow_metadata_inventory_put,
	-- allow_metadata_inventory_move = allow_metadata_inventory_move,
	-- allow_metadata_inventory_take = allow_metadata_inventory_take,
	--on_receive_fields = receive_fields,
	_mcl_blast_resistance = 3.5,
	_mcl_hardness = 3.5,
})

minetest.register_node("pala_machines:cobblebreaker_active", {
	description = S("Burning Furnace"),
	_doc_items_create_entry = false,
	tiles = {
		"default_furnace_top.png", "default_furnace_bottom.png",
		"default_furnace_side.png", "default_furnace_side.png",
		"default_furnace_side.png", "default_furnace_front_active.png",
	},
	paramtype2 = "facedir",
	drop = "mcl_furnaces:furnace",
	groups = {pickaxey=1, container=4, deco_block=1, not_in_creative_inventory=1, material_stone=1},
	is_ground_content = false,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	on_timer = cobblebreaker_node_timer,

	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		local meta = minetest.get_meta(pos)
		local meta2 = meta
		meta:from_table(oldmetadata)
		local inv = meta:get_inventory()
		for _, listname in ipairs({"src", "out"}) do
			local stack = inv:get_stack(listname, 1)
			if not stack:is_empty() then
				local p = {x=pos.x+math.random(0, 10)/10-0.5, y=pos.y, z=pos.z+math.random(0, 10)/10-0.5}
				minetest.add_item(p, stack)
			end
		end
		meta:from_table(meta2:to_table())
	end,
	allow_metadata_inventory_put = allow_metadata_inventory_put,
	--allow_metadata_inventory_move = allow_metadata_inventory_move,
	--allow_metadata_inventory_take = allow_metadata_inventory_take,
	--on_metadata_inventory_take = on_metadata_inventory_take,
	--on_receive_fields = receive_fields,
	_mcl_blast_resistance = 3.5,
	_mcl_hardness = 3.5,
})

minetest.register_craft({
	output = "pala_machines:cobblebreaker",
	recipe = {
		{ "mcl_core:cobble", "", "mcl_core:cobble" },
		{ "mcl_core:cobble", "pala_tools:voidstone", "mcl_core:cobble" },
		{ "mcl_core:cobble", "", "mcl_core:cobble" },
	}
})
