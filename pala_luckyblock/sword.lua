local S = minetest.get_translator("pala_luckyblock")

minetest.register_tool("pala_luckyblock:sword_luckyium", {
	description = S("Luckyium Sword"),
	_doc_items_longdesc = S("This sword gives you opponent luckyblock effects"),
	inventory_image = "pala_tools_endiumsword.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = {weapon = 1, sword = 1},
	tool_capabilities = {
		full_punch_interval = 0.625,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_uses = 32,
	_repair_material = "group:luckyblock",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "object" and pointed_thing.ref:is_player() then
			local _, event_id = pala_luckyblock.get_random_all()
			local event = pala_luckyblock.event_all[event_id]
			pala_luckyblock.run_event(pointed_thing.ref:get_pos(), pointed_thing.ref, event)

			mcl_util.use_item_durability(itemstack, 1)
			return itemstack
		end
	end,
})