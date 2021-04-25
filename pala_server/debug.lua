minetest.register_chatcommand("test_chunk", {
	params = "",
	description = "Debug: show chunk hash",
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if player then
			return true, mcl_worlds.pos_to_chunk(vector.round(player:get_pos()))
		end
	end,
})