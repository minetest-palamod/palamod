minetest.log("action", "[pala_armor] loading...")

--local S = minetest.get_translator(minetest.get_current_modname())
local modpath = minetest.get_modpath(minetest.get_current_modname())

--Usual Armors---------

--Amethyst
mcl_armor.register_set({
	name = "amethyst",
	description = "Amethyst",
	durabilities = {
		head = 1100,
		torso = 1600,
		legs = 1500,
		feet = 1300,
	},
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
	durabilities = {
		head = 2750,
		torso = 4000,
		legs = 3750,
		feet = 3250,
	},
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
	durabilities = {
		head = 1760,
		torso = 2560,
		legs = 2400,
		feet = 2080,
	},
	enchantability = 25,
	points = {
		head = 4.5,
		torso = 6.5,
		legs = 5.5,
		feet = 5,
	},
	craft_material = "pala_paladium:paladium_ingot",
})

--Green Paladium
mcl_armor.register_set({
	name = "gpaladium",
	description = "Green Paladium",
	durabilities = {
		head = 1760,
		torso = 2560,
		legs = 2400,
		feet = 2080,
	},
	enchantability = 25,
	points = {
		head = 4.5,
		torso = 6.5,
		legs = 5.5,
		feet = 5,
	},
	craft_material = "pala_paladium:gpaladium_ingot",
})

--Endium
mcl_armor.register_set({
	name = "endium",
	description = "Endium",
	durabilities = {
		head = 1650,
		torso = 2400,
		legs = 2250,
		feet = 1950,
	},
	enchantability = 30,
	points = {
		head = 4.5,
		torso = 6.5,
		legs = 5.5,
		feet = 5,
	},
	craft_material = "pala_paladium:endium_ingot",
})

dofile(modpath.."/travel.lua")
dofile(modpath.."/extra.lua")

minetest.log("action", "[pala_armor] loaded succesfully")