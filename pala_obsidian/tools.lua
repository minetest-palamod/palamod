local S = minetest.get_translator(minetest.get_current_modname())

local has_pala_paladium = minetest.get_modpath("pala_paladium")
local has_pala_craftitems = minetest.get_modpath("pala_craftitems")

local pickaxe_longdesc = minetest.registered_tools["mcl_tools:pick_diamond"]._doc_items_longdesc

local get_node = minetest.get_node
local dig_node = minetest.dig_node
local get_pointed_thing_position = minetest.get_pointed_thing_position

minetest.register_tool("pala_obsidian:obsidian_pick", {
	description = S("Obsidian Pickaxe"),
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "default_tool_diamondpick.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = {tool=1, pickaxe=1, dig_speed_class=5, enchantability=10},
	tool_capabilities = {
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		damage_groups = {fleshy=5},
		punch_attack_uses = 5000,
	},
	sound = { breaks = "default_tool_breaks" },
	_mcl_toollike_wield = true,
	_mcl_diggroups = {
		pickaxey_obsidian = {speed = 10, level = 5, uses = 5000},
	},
})


minetest.register_tool("pala_obsidian:magical_tool", {
	description = S("Magical Tool"),
	inventory_image = "pala_obsidian_magical_tool.png",
	wield_scale = mcl_vars.tool_wield_scale,
	groups = {tool=1},
	on_place = function(itemstack, user, pointed_thing)
		local new_stack = mcl_util.call_on_rightclick(itemstack, user, pointed_thing)
		if new_stack then
			return new_stack
		end

		local pos = get_pointed_thing_position(pointed_thing)
		if not minetest.is_protected(pos, user) and get_node(pos).name == "pala_obsidian:hardened_obsidian" then
			dig_node(pos)
		end
	end,
})

if has_pala_paladium and has_pala_craftitems then
	minetest.register_craft({
		output = "pala_obsidian:magical_tool",
		recipe = {
			{"", "pala_paladium:paladium_ingot", ""},
			{"pala_paladium:paladium_ingot", "pala_paladium:paladiumblock", "pala_paladium:paladium_ingot"},
			{"", "pala_craftitems:palastick", ""},
		},
	})
end
