--Voidstone

local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local ipairs = ipairs

--[[formspec_version[4]
	size[12,7]
	list[current_player;main;0.5,2;9,4;0]
	label[0.5,0.5;Voidstone]
	label[0.5,12.5;Inventory]
	list[current_player;main;5.5,0.5;1,1;0]
]]

---Voidstone Formspec
pala_tools.voidstone_form = table.concat({
	"formspec_version[4]",
	"size[12,7]",
	pala_core.get_itemslot_bg(0.5,2,9,4),
	"list[current_player;main;0.5,2;9,4;0]",
	"label[0.5,0.5;"..S("Voidstone").."]",
	pala_core.get_itemslot_bg(5.5,0.5,1,1),
	"list[detached:voidstone_trash;main;5.5,0.5;1,1;0]",
	"listring[]",
})

local callbacks = {
	on_put = function(inv, listname, index, stack, player)
		inv:set_stack(listname, index, "")
	end,
}

if not minetest.settings:get_bool("disable_anticheat", false) then
	callbacks.allow_put = function(inv, listname, index, stack, player)
		if player:get_wielded_item():get_name() == "pala_tools:voidstone" then
			return stack:get_count()
		else
			return 0
		end
	end
else
	callbacks.allow_put = function(inv, listname, index, stack, player)
		return stack:get_count()
	end
end

local trash = minetest.create_detached_inventory("voidstone_trash", callbacks)
trash:set_size("main", 1)

minetest.register_craftitem("pala_tools:voidstone", {
	description = S("Voidstone"),
	_doc_items_longdesc = S("Allow you to trash items"), --TODO: paladium desc
	inventory_image = "pala_tools_voidstone.png",
	stack_max = 1,
	groups = {tool = 1},
	on_use = function(itemstack, user, pointed_thing)
		if user:is_player() then
			minetest.show_formspec(user:get_player_name(), "pala_tools:voidstone", pala_tools.voidstone_form)
		end
	end
})


--TODO: Craft
--TODO: Proper inventory image
--TODO: Help text
minetest.register_craftitem("pala_tools:minage_voidstone", {
	description = S("Minage Voidstone"),
	_doc_items_longdesc = S("Allow you to trash items"), --TODO: paladium desc
	inventory_image = "pala_tools_voidstone.png^[brighten",
	stack_max = 1,
	groups = {tool = 1},
})


local META_KEY = "pala_tools:voidstone_cobble_count"
local VOIDSTONE_SLOT = 9

local CHECK_INTERVAL = tonumber(minetest.settings:get("pala_tools.minage_voidstone_interval")) or 2
local t = 0
minetest.register_globalstep(function(dtime)
	t = t + dtime
	if t > CHECK_INTERVAL then
		for _,player in ipairs(minetest.get_connected_players()) do
			local inv = player:get_inventory()

			local vs = inv:get_stack("main", VOIDSTONE_SLOT)
			if vs:get_name() == "pala_tools:minage_voidstone" then
				local taken = inv:remove_item("main", ItemStack({name = "mcl_core:cobble", count = 65535}))
				local c = taken:get_count()

				if c > 0 then
					local meta = vs:get_meta()

					local ac = meta:get_int(META_KEY)
					meta:set_int(META_KEY, ac + c)

					tt.reload_itemstack_description(vs)

					inv:set_stack("main", VOIDSTONE_SLOT, vs)
				end
			end
		end
		t = 0
	end
end)


tt.register_priority_snippet(function(_, _, itemstack)
	if not itemstack then
		return
	end

	if itemstack:get_name() == "pala_tools:minage_voidstone" then
		---@type ItemStackMetaRef
		local meta = itemstack:get_meta()
		local c = meta:get_int(META_KEY)
		if c ~= 0 then
			return C(mcl_colors.DARK_GRAY, S("Cobble: @1", c))
		end
	end
end)
