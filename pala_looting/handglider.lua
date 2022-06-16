local S = minetest.get_translator(minetest.get_current_modname())

pala_looting.handglider = {}
pala_looting.handglider.using = {}

minetest.register_craftitem("pala_looting:handglider", {
	description = S("Handglider"),
	inventory_image = "default_stone.png",
	groups = {tool=1},
	on_use = function(itemstack, player, pointed_thing)
		local pname = player:get_player_name()
		if not pala_looting.handglider.using[pname] then --Equip
			pala_looting.handglider.using[pname] = true
			playerphysics.add_physics_factor(player, "jump", "pala_looting:handglider", 0)
			playerphysics.add_physics_factor(player, "gravity", "pala_looting:handglider", 0.2)
		elseif pala_looting.handglider.using[pname] then --Unequip
			pala_looting.handglider.using[pname] = false
			playerphysics.remove_physics_factor(player, "jump", "pala_looting:handglider")
			playerphysics.remove_physics_factor(player, "gravity", "pala_looting:handglider")
		end
	end,
})
