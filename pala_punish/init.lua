minetest.register_chatcommand("nuke", {
	params = "",
	description = "Allows you to completely fill your food bar",
	privs = {punish = true},
	func = function(name, param)
		for _, player in pairs(minetest.get_connected_players()) do
			local player_name = player:get_player_name()
			local pos = player:get_pos()
				mcl_explosions.explode(pos, 3, { drop_chance = 1.0 }, player)
			end
		end
	end,
})

minetest.register_privilege("punish", {
	description = "Punish",
	give_to_singleplayer = true,
})