--Voidstone

local trash = minetest.create_detached_inventory("voidstone_trash", {
	allow_put = function(inv, listname, index, stack, player)
		return stack:get_count()
	end,
	on_put = function(inv, listname)
		inv:set_list(listname, {})
	end,
})
trash:set_size("main", 1)

--formspec_version[3]size[12,7]list[current_player;main;0.5,2;9,4;0]label[0.5,0.5;Voidstone]label[0.5,12.5;Inventory]list[current_player;main;5.5,0.5;1,1;0]
pala_tools.void_form = table.concat({
	"formspec_version[3]",
	"size[12,7]",
	mcl_formspec.get_itemslot_bg(0.5,2,9,4),
	"list[current_player;main;0.5,2;9,4;0]",
	"label[0.5,0.5;Voidstone]",
	"list[detached:voidstone_trash;main;5.5,0.5;1,1;0]",
	"listring[]",
})

minetest.register_craftitem("pala_tools:voidstone", {
	description = "Voidstone",
	_doc_items_longdesc = "Voidstone",
	inventory_image = "pala_tools_voidstone.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, user, pointed_thing)
		if user:is_player() then
			minetest.show_formspec(user:get_player_name(), "pala_tools:voidstone", pala_tools.void_form)
		end
	end
})