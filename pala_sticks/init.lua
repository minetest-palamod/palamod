minetest.register_tool("pala_sticks:teleport_stick", {
    description = "Teleport Stick",
    inventory_image = "default_stick.png",
	on_use = function(itemstack, player, pointed_thing)
		local pos = player:get_pos()
		mcl_throwing.throw("mcl_throwing:ender_pearl",
			{x=pos.x, y=pos.y+1.5, z=pos.z}, player:get_look_dir(), 22,
			player:get_player_name())
	end,
})

minetest.register_tool("pala_sticks:heal_stick", {
    description = "Heal Stick",
    inventory_image = "default_stick.png",
	on_use = function(itemstack, player, pointed_thing)
		local addhp = 6
		local hp = player:get_hp()
		if hp + addhp >= 20 then
			player:set_hp(hp+addhp)
		else
			player:set_hp(20)
		end
		--TODO: remove wear
	end,
})
