minetest.log("action", "[pala_craftitems] loading...")

local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_craftitem("pala_craftitems:palastick", {
	description = S("Paladium Stick"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craftitem("pala_craftitems:titaniumstick", {
	description = S("Titanium Stick"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_titaniumstick.png",
})

minetest.register_craftitem("pala_craftitems:amethyststick", {
	description = S("Amethyst Stick"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_amethyststick.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "pala_craftitems:palastick 4",
	recipe = {"pala_paladium:paladium_ingot 2"},
})

minetest.register_craft({
	type = "shapeless",
	output = "pala_craftitems:titaniumstick",
	recipe = {"pala_paladium:titanium_ingot 2"},
})

minetest.register_craft({
	type = "shapeless",
	output = "pala_craftitems:amethyststick",
	recipe = {"pala_paladium:amethyst_ingot 2"},
})

--orbs
----------------------------------------------------------
--speed
minetest.register_craftitem("pala_craftitems:orb_speed", {
	description = S("Speed Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craft({
	output = "pala_craftitems:orb_speed",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_core:sugar", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""},
	}
})

--heal
minetest.register_craftitem("pala_craftitems:orb_heal", {
	description = S("Heal Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craft({
	output = "pala_craftitems:orb_heal",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_potions:speckled_melon", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""},
	}
})
minetest.register_craft({
	output = "pala_craftitems:orb_heal",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_books:book", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""},
	}
})

--jump
minetest.register_craftitem("pala_craftitems:orb_jump", {
	description = S("Jump Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craft({
	output = "pala_craftitems:orb_jump",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_nether:nether_wart_item", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""},
	}
})

--knockback
minetest.register_craftitem("pala_craftitems:orb_knockback", {
	description = S("Knockback Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png"
})

minetest.register_craft({
	output = "pala_craftitems:orb_knockback",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_mobitems:ghast_tear", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""},
	}
})

--strenght
minetest.register_craftitem("pala_craftitems:orb_strenght", {
	description = S("Strenght Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craft({
	output = "pala_craftitems:orb_strenght",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_mobitems:blaze_powder", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""},
	}
})

--compressed
--------------------------------------------------------------------

minetest.register_craftitem("pala_craftitems:compressed_paladium", {
	description = S("Compressed Paladium"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craftitem("pala_craftitems:compressed_titanium", {
	description = S("Compressed Titanium"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

minetest.register_craftitem("pala_craftitems:compressed_amethyst", {
	description = S("Compressed Amethyst"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_paladiumstick.png",
})

--Wither Skull Fragment
minetest.register_craftitem("pala_craftitems:wither_skull_fragment", {
	description = S("Wither Skull Fragment"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftitems_wither_skull_fragment.png",
})

minetest.register_craft({
	type = "shapeless",
	output = "pala_craftitems:wither_skull_fragment 9",
	recipe = {"mcl_heads:wither_skeleton"}
})

minetest.register_craftitem("pala_craftitems:diamondstring", {
	description = S("Diamond String"),
	_doc_items_longdesc = S("Allow you to craft dynamite"),
	inventory_image = "pala_craftitems_diamondstring.png",
})

minetest.register_craft({
	output = "pala_craftitems:diamondstring",
	recipe = {
		{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
		{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
		{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
	},
})

minetest.log("action", "[pala_craftitems] loaded succesfully")
