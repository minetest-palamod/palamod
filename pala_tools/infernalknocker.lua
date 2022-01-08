local S = minetest.get_translator(minetest.get_current_modname())

local sword_longdesc = S([[
	Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles.
	Swords can also be used to cut down a few particular blocks, such as cobwebs.
]])

--Infernal Knocker
minetest.register_tool("pala_tools:infernal_knocker", {
	description = S("Infernal Knocker"),
	_doc_items_longdesc = sword_longdesc,
	inventory_image = "pala_tools_infernalknocker.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, enchantability=22},
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		groupcaps={
			swordy = { speed = 5, level = 1, uses = 60 },
			swordy_cobweb = { speed = 1, level = 1, uses = 60 }
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 59,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
})

minetest.register_on_craft(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() == "pala_tools:infernal_knocker" then
		return mcl_enchanting.enchant(itemstack, "knockback", 5)
	end
end)

minetest.register_craft_predict(function(itemstack, player, old_craft_grid, craft_inv)
	if itemstack:get_name() == "pala_tools:infernal_knocker" then
		return mcl_enchanting.enchant(itemstack, "knockback", 5)
	end
end)

minetest.register_craft({
	output = 'pala_tools:infernal_knocker',
	recipe = {
		{"pala_paladium:paladium_ingot", "", ""},
		{"pala_craftitems:orb_knockback", "", ""},
		{"pala_craftitems:palastick", "", ""},
	}
})