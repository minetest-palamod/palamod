local modname = minetest.get_current_modname()
local S = minetest.get_translator(modname)

pala_tools = {}
pala_tools.path = minetest.get_modpath(modname)


local sword_longdesc = S([[
	Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles.
	Swords can also be used to cut down a few particular blocks, such as cobwebs.
]])

local pickaxe_longdesc = S([[
	Pickaxes are mining tools to mine hard blocks, such as stone.
	A pickaxe can also be used as weapon, but it is rather inefficient.
]])

local wield_scale = mcl_vars.tool_wield_scale

--Amethyst
minetest.register_tool("pala_tools:sword_amethyst", {
	description = S("Amethyst Sword"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = wield_scale,
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

minetest.register_tool("pala_tools:pick_amethyst", {
	description = S("Amethyst Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5}, --TODO: be sure values are real
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 8, level = 5, uses = 2999 }, --TODO: be sure values are real
    },
})

--Titanium
minetest.register_tool("pala_tools:sword_titanium", {
	description = S("Titanium Sword"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = wield_scale,
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

minetest.register_tool("pala_tools:pick_titanium", {
	description = S("Titanium Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5}, --TODO: be sure values are real
		punch_attack_uses = 781,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
        pickaxey = { speed = 9, level = 5, uses = 3999 }, --TODO: be sure values are real
    },
})

--Paladium
minetest.register_tool("pala_tools:sword_paladium", {
	description = "Paladium Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = wield_scale,
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
if minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		output = 'pala_tools:sword_paladium',
		recipe = {
			{"pala_paladium:paladium_ingot", "", ""},
			{"pala_paladium:paladium_ingot", "", ""},
			{"mcl_core:stick", "", ""},
		}
	})
end

minetest.register_tool("pala_tools:fastsword_paladium", {
	description = "Paladium Fast Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumfastsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.15,
		max_drop_level=1,
		damage_groups = {fleshy=7},
		punch_attack_uses = 20,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 10, level = 1, uses = 20 },
		swordy_cobweb = { speed = 10, level = 1, uses = 20 }
	},
})

minetest.register_tool("pala_tools:broadsword_paladium", {
	description = "Paladium Broad Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumbroadsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=6, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 2,
		max_drop_level=1,
		damage_groups = {fleshy=9},
		punch_attack_uses = 3000,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		swordy = { speed = 10, level = 1, uses = 3000 },
		swordy_cobweb = { speed = 10, level = 1, uses = 3000 }
	},
})


minetest.register_tool("pala_tools:pick_paladium", {
	description = S("Paladium Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = wield_scale,
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


if minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		output = 'pala_tools:pick_paladium',
		recipe = {
			{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
			{"", "mcl_core:stick", ""},
			{"", "mcl_core:stick", ""},
		}
	})
end

--Green Paladium
minetest.register_tool("pala_tools:sword_gpaladium", {
	description = "Green Paladium Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_gpaladiumsword.png",
	wield_scale = wield_scale,
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
	description = "Endium Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_endiumsword.png",
	wield_scale = wield_scale,
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


--Infernal Knocker

minetest.register_tool("pala_tools:infernal_knocker", {
	description = "Infernal Knocker",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_infernalknocker.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 59,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() == "pala_tools:infernal_knocker" then
		mcl_enchanting.enchant(itemstack, "knockback", 5)
	end
end)

minetest.register_craft_predict(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() == "pala_tools:infernal_knocker" then
		return mcl_enchanting.enchant(itemstack, "knockback", 5)
	end
end)

if minetest.get_modpath("pala_paladium") and minetest.get_modpath("pala_craftstick") then
	minetest.register_craft({
		output = 'pala_tools:infernal_knocker',
		recipe = {
			{"pala_paladium:paladium_ingot", "", ""},
			{"pala_craftstick:orb_knockback", "", ""},
			{"pala_craftstick:palastick", "", ""},
		}
	})
end

dofile(pala_tools.path.."/hammer.lua")
dofile(pala_tools.path.."/voidstone.lua")
dofile(pala_tools.path.."/hoe_overide.lua")