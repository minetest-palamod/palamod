local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end

minetest.register_craftitem("pala_craftstick:palastick", {
	description = S("Paladium Stick"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:titaniumstick", {
	description = S("Titanium Stick"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_titaniumstick.png"
})

minetest.register_craftitem("pala_craftstick:amethyststick", {
	description = S("Amethyst Stick"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_amethyststick.png"
})

if minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		type = "shapeless",
		output = "pala_craftstick:palastick 4",
		recipe = {"pala_paladium:paladium_ingot 2"}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "pala_craftstick:titaniumstick",
		recipe = {"pala_paladium:titanium_ingot 2"}
	})
	minetest.register_craft({
		type = "shapeless",
		output = "pala_craftstick:amethyststick",
		recipe = {"pala_paladium:amethyst_ingot 2"}
	})
end

--orbs
----------------------------------------------------------
--speed
minetest.register_craftitem("pala_craftstick:orb_speed", {
	description = S("Speed Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craft({
	output = "pala_craftstick:orb_speed",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_core:sugar", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""}
	}
})
minetest.register_alias("#4571", "pala_craftstick:orb_speed")


--heal
minetest.register_craftitem("pala_craftstick:orb_heal", {
	description = S("Heal Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craft({
	output = "pala_craftstick:orb_heal",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_potions:speckled_melon", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""}
	}
})
minetest.register_craft({
	output = "pala_craftstick:orb_heal",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_books:book", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""}
	}
})
minetest.register_alias("#4568", "pala_craftstick:orb_heal")

--jump
minetest.register_craftitem("pala_craftstick:orb_jump", {
	description = S("Jump Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craft({
	output = "pala_craftstick:orb_jump",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_nether:nether_wart_item", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""}
	}
})
minetest.register_alias("#4569", "pala_craftstick:orb_jump")

--knockback
minetest.register_craftitem("pala_craftstick:orb_knockback", {
	description = S("Knockback Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craft({
	output = "pala_craftstick:orb_knockback",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_mobitems:ghast_tear", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""}
	}
})
minetest.register_alias("#4570", "pala_craftstick:orb_knockback")

--strenght
minetest.register_craftitem("pala_craftstick:orb_strenght", {
	description = S("Strenght Orb"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craft({
	output = "pala_craftstick:orb_strenght",
	recipe = {
		{"", "pala_paladium:paladium_ingot", ""},
		{"pala_paladium:paladium_ingot", "mcl_mobitems:blaze_powder", "pala_paladium:paladium_ingot"},
		{"", "pala_paladium:paladium_ingot", ""}
	}
})
minetest.register_alias("#4572", "pala_craftstick:orb_strenght")

--compressed
--------------------------------------------------------------------

minetest.register_craftitem("pala_craftstick:compressed_paladium", {
	description = S("Compressed Paladium"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:compressed_titanium", {
	description = S("Compressed Titanium"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:compressed_amethyst", {
	description = S("Compressed Amethyst"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

--Wither Skull Fragment
minetest.register_craftitem("pala_craftstick:wither_skull_fragment", {
	description = S("Wither Skull Fragment"),
	_doc_items_longdesc = S("Useful in many crafts"),
	inventory_image = "pala_craftstick_wither_skull_fragment.png"
})

if minetest.get_modpath("mcl_heads") then
	minetest.register_craft({
		type = "shapeless",
		output = "pala_craftstick:wither_skull_fragment 9",
		recipe = {"mcl_heads:wither_skeleton"}
	})
end
