local S = minetest.get_translator(minetest.get_current_modname())

local sword_longdesc = S([[
	Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles.
	Swords can also be used to cut down a few particular blocks, such as cobwebs.
]])

--Infernal Knocker
minetest.register_tool("pala_tools:infernal_knocker", {
	description = S("Infernal Knocker"),
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_infernalknocker.png",
	wield_scale = mcl_vars.tool_wield_scale,
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