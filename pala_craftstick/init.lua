local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end

minetest.register_craftitem("pala_craftstick:palastick", {
	description = "Paladium Stick",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:titaniumstick", {
	description = "Titanium Stick",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_titaniumstick.png"
})

minetest.register_craftitem("pala_craftstick:amethyststick", {
	description = "Amethyst Stick",
	_doc_items_longdesc = ("Useful in many crafts"),
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

minetest.register_craftitem("pala_craftstick:orb_speed", {
	description = "Speed Orb",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:orb_heal", {
	description = "Heal Orb",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:orb_jump", {
	description = "Jump Orb",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:orb_knockback", {
	description = "Knockback Orb",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:orb_strenght", {
	description = "Strenght Orb",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

--compressed

minetest.register_craftitem("pala_craftstick:compressed_paladium", {
	description = "Compressed Paladium",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:compressed_titanium", {
	description = "Compressed Titanium",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

minetest.register_craftitem("pala_craftstick:compressed_amethyst", {
	description = "Compressed Amethyst",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_paladiumstick.png"
})

--Wither Skull Fragment
minetest.register_craftitem("pala_craftstick:wither_skull_fragment", {
	description = "Wither Skull Fragment",
	_doc_items_longdesc = ("Useful in many crafts"),
	inventory_image = "pala_craftstick_wither_skull_fragment.png"
})

if minetest.get_modpath("mcl_heads") then
	minetest.register_craft({
		type = "shapeless",
		output = "pala_craftstick:wither_skull_fragment 9",
		recipe = {"mcl_heads:wither_skeleton"}
	})
end