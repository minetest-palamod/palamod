--local S = minetest.get_translator(minetest.get_current_modname())
local modpath = minetest.get_modpath(minetest.get_current_modname())

--Usual Armors---------
--TODO: be sure durability is right

--Amethyst
mcl_armor.register_set({
	name = "amethyst",
	description = "Amethyst",
	durability = 1500,
	enchantability = 15,
	points = {
		head = 4.5,
		torso = 5,
		legs = 4,
		feet = 4.5,
	},
	craft_material = "pala_paladium:amethyst_ingot",
})

--Titanium
mcl_armor.register_set({
	name = "titanium",
	description = "Titanium",
	durability = 1500,
	enchantability = 20,
	points = {
		head = 4.5,
		torso = 5,
		legs = 5,
		feet = 4.5,
	},
	craft_material = "pala_paladium:titanium_ingot",
})

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

--Green Paladium
mcl_armor.register_set({
	name = "gpaladium",
	description = "Green Paladium",
	durability = 2080,
	enchantability = 25,
	points = {
		head = 4.5,
		torso = 6.5,
		legs = 5.5,
		feet = 5,
	},
	toughness = 2,
	craft_material = "pala_paladium:gpaladium_ingot",
})

dofile(modpath.."/travel.lua")
dofile(modpath.."/extra.lua")