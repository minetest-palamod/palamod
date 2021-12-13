local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local math = math

--Humiliation

if minetest.settings:get_bool("mcl_showDeathMessages", true) then
	minetest.log("warning", "[pala_tools] MineClone2 death messages should be disabled to not collide with Humiliation enchant")
end

local messages = {
	"@1 tasted the sword of @2",
	"@1 took the sword of @2 in the heart",
	"@1 was killed by @2",
}

mcl_enchanting.enchantments.humiliation = {
	name = S("Humiliation"),
	max_level = 1,
	primary = {},
	secondary = {weapon = true},
	disallow = {},
	incompatible = {},
	weight = 2,
	description = S("Humiliates your opponent when you kill him."),
	curse = false,
	on_enchant = function() end,
	requires_tool = true,
	treasure = true,
	power_range_table = {{25, 75}},
	inv_combat_tab = true,
	inv_tool_tab = true,
}

mcl_damage.register_on_death(function(obj, reason)
	minetest.chat_send_all("died")
	if obj:is_player() and reason.source and reason.source:is_player() then
		minetest.chat_send_all("died")
		if mcl_enchanting.has_enchantment(reason.source:get_wielded_item(), "humiliation") then
			minetest.chat_send_all(
				C(mcl_colors.GREEN, S(messages[math.random(#messages)], obj:get_player_name(), reason.source:get_player_name())))
		end
	end
end)