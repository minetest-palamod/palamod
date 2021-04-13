minetest.register_tool("pala_sticks:teleport_stick", {
    description = "Teleport Stick",
    inventory_image = "default_stick.png",
	on_use = function(itemstack, player, pointed_thing)
		mcl_throwing.throw("mcl_throwing:ender_pearl",
			player:get_pos(), player:get_look_dir(), 22,
			minetest.get_player_by_name(player))
	end,
})

minetest.register_tool("pala_sticks:heal_stick", {
    description = "Heal Stick",
    inventory_image = "default_stick.png",
	on_use = function(pos, node, player)
		local addhp = 6
		local hp = player:get_hp()
		if hp + addhp >= 20 then
			player:set_hp(hp+addhp)
		else
			player:set_hp(20)
		end
	end,
})
