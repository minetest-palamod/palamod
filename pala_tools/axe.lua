local S = minetest.get_translator(minetest.get_current_modname())

local axe_longdesc = minetest.registered_tools["mcl_tools:axe_diamond"]._doc_items_longdesc
local axe_on_place = minetest.registered_tools["mcl_tools:axe_diamond"].on_place

--amethyst
minetest.register_tool("pala_tools:axe_amethyst", {
	description = S("Amethyst Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "default_tool_diamondaxe.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=5, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 5,
		damage_groups = {fleshy = 6},
		punch_attack_uses = 1999,
	},
	on_place = axe_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:amethyst_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 8, level = 5, uses = 1999 }
	},
})

--titanium
minetest.register_tool("pala_tools:axe_titanium", {
	description = S("Titanium Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "default_tool_diamondaxe.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=5, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 5,
		damage_groups = {fleshy = 6.5},
		punch_attack_uses = 2999,
	},
	on_place = axe_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:titanium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 8, level = 5, uses = 2999 }
	},
})

--paladium
minetest.register_tool("pala_tools:axe_paladium", {
	description = S("Paladium Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "default_tool_diamondaxe.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=5, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 5,
		damage_groups = {fleshy = 7.5},
		punch_attack_uses = 4999,
	},
	on_place = axe_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:paladium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 9, level = 5, uses = 4999 }
	},
})

--gpaladium
minetest.register_tool("pala_tools:axe_gpaladium", {
	description = S("Green Paladium Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "default_tool_diamondaxe.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=5, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 5,
		damage_groups = {fleshy = 7.5},
		punch_attack_uses = 4999,
	},
	on_place = axe_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:gpaladium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 9, level = 5, uses = 4999 }
	},
})

--endium
minetest.register_tool("pala_tools:axe_endium", {
	description = S("Endium Axe"),
	_doc_items_longdesc = axe_longdesc,
	inventory_image = "default_tool_diamondaxe.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, axe=1, dig_speed_class=5, enchantability=12 },
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 5,
		damage_groups = {fleshy = 8.5},
		punch_attack_uses = 4999,
	},
	on_place = axe_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:endium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		axey = { speed = 9, level = 5, uses = 4999 }
	},
})

--CRAFT
minetest.register_craft({
	output = "pala_tools:axe_amethyst",
	recipe = {
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"pala_paladium:amethyst_ingot", "mcl_core:stick"},
		{"", "mcl_core:stick"},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_amethyst",
	recipe = {
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"mcl_core:stick", "pala_paladium:amethyst_ingot"},
		{"mcl_core:stick", ""},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_titanium",
	recipe = {
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"pala_paladium:titanium_ingot", "mcl_core:stick"},
		{"", "mcl_core:stick"},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_titanium",
	recipe = {
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"mcl_core:stick", "pala_paladium:titanium_ingot"},
		{"mcl_core:stick", ""},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_paladium",
	recipe = {
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "mcl_core:stick"},
		{"", "mcl_core:stick"},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_paladium",
	recipe = {
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"mcl_core:stick", "pala_paladium:paladium_ingot"},
		{"mcl_core:stick", ""},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_gpaladium",
	recipe = {
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"pala_paladium:gpaladium_ingot", "mcl_core:stick"},
		{"", "mcl_core:stick"},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_gpaladium",
	recipe = {
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"mcl_core:stick", "pala_paladium:gpaladium_ingot"},
		{"mcl_core:stick", ""},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_endium",
	recipe = {
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"pala_paladium:endium_ingot", "mcl_core:stick"},
		{"", "mcl_core:stick"},
	},
})

minetest.register_craft({
	output = "pala_tools:axe_endium",
	recipe = {
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"mcl_core:stick", "pala_paladium:endium_ingot"},
		{"mcl_core:stick", ""},
	},
})
