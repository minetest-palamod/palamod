local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

local sword_longdesc = minetest.registered_tools["mcl_tools:sword_diamond"]._doc_items_longdesc

--Amethyst
minetest.register_tool("pala_tools:sword_amethyst", {
	description = S("Amethyst Sword"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale ,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		damage_groups = {fleshy=7},
		punch_attack_uses = 2999,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 8, level = 1, uses = 2999 },
		swordy_cobweb = { speed = 8, level = 1, uses = 2999 }
	},
})

--Titanium
minetest.register_tool("pala_tools:sword_titanium", {
	description = S("Titanium Sword"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		damage_groups = {fleshy=7.5},
		punch_attack_uses = 3999,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 9, level = 1, uses = 3999 },
		swordy_cobweb = { speed = 9, level = 1, uses = 3999 }
	},
})

--Paladium
minetest.register_tool("pala_tools:sword_paladium", {
	description = S("Paladium Sword"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		damage_groups = {fleshy=8.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 10, level = 1, uses = 4999 },
		swordy_cobweb = { speed = 10, level = 1, uses = 4999 }
	},
})

--Green Paladium
minetest.register_tool("pala_tools:sword_gpaladium", {
	description = S("Green Paladium Sword"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "pala_tools_gpaladiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		damage_groups = {fleshy=8.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 2, level = 1, uses = 4999 },
		swordy_cobweb = { speed = 2, level = 1, uses = 4999 }
	},
})

--Endium
minetest.register_tool("pala_tools:sword_endium", {
	description = S("Endium Sword"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "pala_tools_endiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		damage_groups = {fleshy=9.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 2, level = 1, uses = 4999 },
		swordy_cobweb = { speed = 2, level = 1, uses = 4999 }
	},
})

--CRAFTS
minetest.register_craft({
	output = 'pala_tools:sword_amethyst',
	recipe = {
		{"pala_paladium:amethyst_ingot", "", ""},
		{"pala_paladium:amethyst_ingot", "", ""},
		{"mcl_core:stick", "", ""},
	},
})

minetest.register_craft({
	output = 'pala_tools:sword_titanium',
	recipe = {
		{"pala_paladium:titanium_ingot", "", ""},
		{"pala_paladium:titanium_ingot", "", ""},
		{"mcl_core:stick", "", ""},
	},
})

minetest.register_craft({
	output = 'pala_tools:sword_paladium',
	recipe = {
		{"pala_paladium:paladium_ingot", "", ""},
		{"pala_paladium:paladium_ingot", "", ""},
		{"mcl_core:stick", "", ""},
	},
})

minetest.register_craft({
	output = 'pala_tools:sword_gpaladium',
	recipe = {
		{"pala_paladium:gpaladium_ingot", "", ""},
		{"pala_paladium:gpaladium_ingot", "", ""},
		{"mcl_core:stick", "", ""},
	},
})

minetest.register_craft({
	output = 'pala_tools:sword_endium',
	recipe = {
		{"pala_paladium:endium_ingot", "", ""},
		{"pala_paladium:endium_ingot", "", ""},
		{"mcl_core:stick", "", ""},
	},
})
