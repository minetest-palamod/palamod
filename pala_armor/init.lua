--Paladium
minetest.register_tool("pala_armor:boots_weighted", {
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
})

