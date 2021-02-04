minetest.register_chatcommand("nuke", {
	params = "",
	description = "Make explosion around all players.",
	privs = {punish = true},
	func = function(name, param)
		for _, player in pairs(minetest.get_connected_players()) do
			local pos = player:get_pos()
			mcl_explosions.explode(pos, 3, { drop_chance = 1.0 }, player)
		end
	end,
})

minetest.register_privilege("punish", {
	description = "Punish",
	give_to_singleplayer = true,
})