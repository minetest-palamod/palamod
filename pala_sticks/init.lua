minetest.log("action", "[pala_sticks] loading...")

local S = minetest.get_translator(minetest.get_current_modname())

local is_creative_enabled = minetest.is_creative_enabled

local function take_pearl(player)
	local inv = player:get_inventory()
	if inv:contains_item("main", ItemStack("mcl_throwing:ender_pearl")) then
		inv:remove_item("main", ItemStack("mcl_throwing:ender_pearl"))
		return true
	end
	return false
end

mcl_enchanting.enchantments.unbreaking.primary.pala_stick_usable = true

minetest.register_tool("pala_sticks:teleport_stick", {
	description = S("Teleport Stick"),
	inventory_image = "default_stick.png",
	groups = {pala_stick = 1, weapon = 1},
	wield_scale = mcl_vars.tool_wield_scale,
	_mcl_toollike_wield = true,
	on_use = function(itemstack, player, pointed_thing)
		local name = player:get_player_name()
		local pos = player:get_pos()
		if not is_creative_enabled(name) then
			if not take_pearl(player) then
				return
			end
		end
		mcl_throwing.throw("mcl_throwing:ender_pearl",
			vector.add(pos, vector.new(0, 1.5, 0)), player:get_look_dir(), 22, name)
	end,
})

minetest.register_tool("pala_sticks:heal_stick", {
	description = S("Heal Stick"),
	inventory_image = "default_stick.png",
	groups = {pala_stick_usable = 1, weapon = 1, enchantability = 10},
	wield_scale = mcl_vars.tool_wield_scale,
	_mcl_uses = 65,
	_mcl_toollike_wield = true,
	on_use = function(itemstack, player, pointed_thing)
		local addhp = 6
		local hp = player:get_hp()
		if hp + addhp >= 20 then
			player:set_hp(hp + addhp)
		else
			player:set_hp(20)
		end
		if not is_creative_enabled(player:get_player_name()) then
			--[[
			TODO: be sure wear is right
			TODO: do not use wear if hp doesn't change
			]]
			mcl_util.use_item_durability(itemstack, 1)
			return itemstack
		end
	end,
})

minetest.log("action", "[pala_sticks] loaded succesfully")