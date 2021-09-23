--TODO: replace by formspecs

minetest.register_chatcommand("add_trixium", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player isn't online"
		end
		local item_count = player:get_wielded_item():get_count()
		pala_trixium.add_amount(name, item_count)
		player:set_wielded_item(ItemStack())
	end,
})

minetest.register_chatcommand("reset_trixium", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player isn't online"
		end
		pala_trixium.set_amount(name, 0)
	end,
})

minetest.register_chatcommand("get_trixium", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player isn't online"
		end
		return true, pala_trixium.get_amount(name)
	end
})