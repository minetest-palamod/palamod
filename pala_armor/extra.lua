local S = minetest.get_translator(minetest.get_current_modname())

--Weighted boots
--[[
TODO: increase gravity then wearing
]]
minetest.register_tool("pala_armor:boots_weighted", {
	description = S("Weighted boots"),
	_doc_items_longdesc = mcl_armor.longdesc..
		" "..S("Allows you to descend faster to the bottom of the water and stay there"),
	_doc_items_usagehelp = mcl_armor.usage,
	inventory_image = "mcl_armor_inv_boots_leather.png",
	groups = {armor_feet = 1, non_combat_torso = 1, mcl_armor_points=0.5, mcl_armor_uses = 66},
	sounds = {
		_mcl_armor_equip = "mcl_armor_equip_leather",
		_mcl_armor_unequip = "mcl_armor_unequip_leather",
	},
	on_place = mcl_armor.equip_on_use,
	on_secondary_use = mcl_armor.equip_on_use,
	_mcl_armor_element = "feet",
	_mcl_armor_texture = "mcl_armor_boots_leather.png"
})