--Voidstone

--[[formspec_version[3]
	size[12,7]
	list[current_player;main;0.5,2;9,4;0]
	label[0.5,0.5;Voidstone]
	label[0.5,12.5;Inventory]
	list[current_player;main;5.5,0.5;1,1;0]
]]
-- pala_tools.void_form = table.concat({
	-- "formspec_version[3]",
	-- "size[12,7]",
	-- "real_coordinates[false]",
	-- mcl_formspec.get_itemslot_bg(0.5,2,9,4),
	-- "list[current_player;main;0.5,2;9,4;0]",
	-- "label[0.5,0.5;Voidstone]",
	-- mcl_formspec.get_itemslot_bg(5.5,0.5,1,1),
	-- "list[detached:voidstone_trash;main;5.5,0.5;1,1;0]",
	-- "listring[]",
-- })

pala_tools.voidstone_form = table.concat({
	"size[9.21,5.32]",
	"real_coordinates[false]",
	mcl_formspec.get_itemslot_bg(0.1,1.41,9,1),
	mcl_formspec.get_itemslot_bg(0.1,2.49,9,1),
	mcl_formspec.get_itemslot_bg(0.1,3.58,9,1),
	mcl_formspec.get_itemslot_bg(0.1,4.66,9,1),
	"list[current_player;main;0.1,1.41;9.0,1.0;9]",
	"list[current_player;main;0.1,2.49;9.0,1.0;18]",
	"list[current_player;main;0.1,3.58;9.0,1.0;27]",
	"list[current_player;main;0.1,4.66;9.0,1.0;0]",
	"label[0.1,-0.15;Voidstone]",
	mcl_formspec.get_itemslot_bg(4.1,0.11,1,1),
	"list[detached:trash;main;4.1,0.11;1.0,1.0;0]",
})

minetest.register_craftitem("pala_tools:voidstone", {
	description = "Voidstone",
	_doc_items_longdesc = "Voidstone", --TODO: desc and translation
	inventory_image = "pala_tools_voidstone.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, user, pointed_thing)
		if user:is_player() then
			minetest.show_formspec(user:get_player_name(), "pala_tools:voidstone", pala_tools.voidstone_form)
		end
	end
})