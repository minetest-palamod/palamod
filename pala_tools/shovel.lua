local S = minetest.get_translator(minetest.get_current_modname())

local shovel_longdesc = minetest.registered_tools["mcl_tools:shovel_diamond"]._doc_items_longdesc
local shovel_use = minetest.registered_tools["mcl_tools:shovel_diamond"]._doc_items_usagehelp
local shovel_on_place = minetest.registered_tools["mcl_tools:shovel_diamond"].on_place

--amethyst
minetest.register_tool("pala_tools:shovel_amethyst", {
	description = S("Amethyst Shovel"),
	_doc_items_longdesc = shovel_longdesc,
	_doc_items_usagehelp = shovel_use,
	inventory_image = "default_tool_diamondshovel.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, shovel=1, dig_speed_class=5, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 5,
		damage_groups = {fleshy=4},
		punch_attack_uses = 1999,
	},
	on_place = shovel_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:amethyst_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 8, level = 5, uses = 1999 }
	},
})

--titanium
minetest.register_tool("pala_tools:shovel_titanium", {
	description = S("Titanium Shovel"),
	_doc_items_longdesc = shovel_longdesc,
	_doc_items_usagehelp = shovel_use,
	inventory_image = "default_tool_diamondshovel.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, shovel=1, dig_speed_class=5, enchantability=10 },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 5,
		damage_groups = {fleshy=4.5},
		punch_attack_uses = 2999,
	},
	on_place = shovel_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:titanium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 8, level = 5, uses = 2999 }
	},
})

--paladium
minetest.register_tool("pala_tools:shovel_paladium", {
	description = S("Paladium Shovel"),
	_doc_items_longdesc = shovel_longdesc,
	_doc_items_usagehelp = shovel_use,
	inventory_image = "default_tool_diamondshovel.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, shovel=1, dig_speed_class=5, enchantability=12 },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 5,
		damage_groups = {fleshy=5.5},
		punch_attack_uses = 4999,
	},
	on_place = shovel_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:paladium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 9, level = 5, uses = 4999 }
	},
})

--gpaladium
minetest.register_tool("pala_tools:shovel_gpaladium", {
	description = S("Green Paladium Shovel"),
	_doc_items_longdesc = shovel_longdesc,
	_doc_items_usagehelp = shovel_use,
	inventory_image = "default_tool_diamondshovel.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { tool=1, shovel=1, dig_speed_class=5, enchantability=12 },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level = 5,
		damage_groups = {fleshy=5.5},
		punch_attack_uses = 4999,
	},
	on_place = shovel_on_place,
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "pala_paladium:paladium_ingot",
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		shovely = { speed = 9, level = 5, uses = 4999 }
	},
})