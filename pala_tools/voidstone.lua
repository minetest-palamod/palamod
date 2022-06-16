--Voidstone

--[[
TODO: item description and translation
]]

local S = minetest.get_translator(minetest.get_current_modname())

--[[formspec_version[4]
	size[12,7]
	list[current_player;main;0.5,2;9,4;0]
	label[0.5,0.5;Voidstone]
	label[0.5,12.5;Inventory]
	list[current_player;main;5.5,0.5;1,1;0]
]]
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
	groups = {tool=1},
	on_use = function(itemstack, user, pointed_thing)
		if user:is_player() then
			minetest.show_formspec(user:get_player_name(), "pala_tools:voidstone", pala_tools.voidstone_form)
		end
	end
})
