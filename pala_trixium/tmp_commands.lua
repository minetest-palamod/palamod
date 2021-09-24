--TODO: replace by formspecs

minetest.register_chatcommand("add_trixium", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player isn't online"
		end
		local item = player:get_wielded_item()

		local group = minetest.get_item_group(item:get_name(), "trixium_amount")
		if group > 0 then
			pala_trixium.add_amount(name, group * item:get_count())
			player:set_wielded_item(ItemStack())
			return true, "Done."
		end
		return false, "Not right minerals"
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

--TODO: add inventory tab
minetest.register_chatcommand("ranking_trixium", {
	func = function(name)
		local top_rank = pala_trixium.get_top_ranking()
		local out = ""
		for num,entry in pairs(top_rank) do
			out = out..num..": "..entry.name.." - "..entry.amount.."\n"
		end
		return true, out
	end
})