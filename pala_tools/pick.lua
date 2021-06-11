local S = minetest.get_translator(minetest.get_current_modname())

--[[
TODO: be sure durability and mining speed are same as mc
]]

local pickaxe_longdesc = S([[
	Pickaxes are mining tools to mine hard blocks, such as stone.
	A pickaxe can also be used as weapon, but it is rather inefficient.
]])

minetest.register_tool("pala_tools:pick_amethyst", {
	description = S("Amethyst Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 8, level = 5, uses = 2999 },
    },
})


minetest.register_tool("pala_tools:pick_titanium", {
	description = S("Titanium Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 9, level = 5, uses = 3999 },
    },
})


minetest.register_tool("pala_tools:pick_paladium", {
	description = S("Paladium Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 10, level = 5, uses = 4999 },
    },
})


minetest.register_tool("pala_tools:pick_gpaladium", {
	description = S("Green Paladium Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 10, level = 5, uses = 4999 },
    },
})


--Endium
minetest.register_tool("pala_tools:pick_endium", {
	description = S("Endium Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5},
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 10, level = 5, uses = 4999 },
    },
})

--CRAFT
minetest.register_craft({
	output = 'pala_tools:pick_amethyst',
	recipe = {
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"", "mcl_core:stick", ""},
		{"", "mcl_core:stick", ""},
	}
})
minetest.register_craft({
	output = 'pala_tools:pick_titanium',
	recipe = {
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"", "mcl_core:stick", ""},
		{"", "mcl_core:stick", ""},
	}
})
minetest.register_craft({
	output = 'pala_tools:pick_paladium',
	recipe = {
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"", "mcl_core:stick", ""},
		{"", "mcl_core:stick", ""},
	}
})
minetest.register_craft({
	output = 'pala_tools:pick_gpaladium',
	recipe = {
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"", "mcl_core:stick", ""},
		{"", "mcl_core:stick", ""},
	}
})
minetest.register_craft({
	output = 'pala_tools:pick_endium',
	recipe = {
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"", "mcl_core:stick", ""},
		{"", "mcl_core:stick", ""},
	}
})