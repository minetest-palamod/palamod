local S = minetest.get_translator(minetest.get_current_modname())

local sword_longdesc = S([[
	Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles.
	Swords can also be used to cut down a few particular blocks, such as cobwebs.
]])

--Paladium fastsword
minetest.register_tool("pala_tools:fastsword_paladium", {
	description = S("Paladium Fast Sword"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumfastsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
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

--Paladium broadsword
minetest.register_tool("pala_tools:broadsword_paladium", {
	description = "Paladium Broad Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumbroadsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
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