local C = minetest.colorize
local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_craftitem("pala_legendary:endium_gauntlet", {
	description = ("Endium Gauntlet"),
	_doc_items_longdesc = ("Just right-click to use it."),
	inventory_image = "pala_legendary_endium_gauntlet.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, player, pointed_thing)
	end,
	on_place = function(itemstack, player, pointed_thing)
		minetest.chat_send_player(player:get_player_name(), S(C(mcl_colors.RED, "There is no stone in the gauntlet.")))
	end,
})