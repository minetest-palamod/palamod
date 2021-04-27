local S = minetest.get_translator(minetest.get_current_modname())

--[[minetest.register_tool("pala_armor:boots_weighted", {
	description = "Weighted boots",
	_doc_items_longdesc = "Allows you to descend faster to the bottom of the water and stay there",
	inventory_image = "mcl_armor_inv_boots_leather.png",
	groups = {armor_feet=1, mcl_armor_points=0.5, mcl_armor_uses=66},
	sounds = {
		_mcl_armor_equip = "mcl_armor_equip_leather",
		_mcl_armor_unequip = "mcl_armor_unequip_leather",
	},
	on_place = armor.on_armor_use,
	on_secondary_use = armor.on_armor_use,
})]]

--3=torso

--[[minetest.register_globalstep(function()
	for _, player in ipairs(minetest.get_connected_players()) do
		local torso = player:get_inventory():get_stack("armor", 1)
		if torso and torso:get_name() == "pala_armor:boots_weighted" then
		player:set_physics_override({gravity = 5, speed = 0.5,}) -- reduced gravity
		else
			player:set_physics_override({gravity = 1, speed = 1,}) -- reset to normal gravity
		end
	end
end)]]


--Paladium
mcl_armor.register_set({
	name = "paladium",
	description = "Paladium",
	durability = 2080,
	enchantability = 25,
	points = {
		head = 4.5,
		torso = 6.5,
		legs = 5.5,
		feet = 5,
	},
	toughness = 2,
	craft_material = "pala_paladium:paladium_ingot",
})