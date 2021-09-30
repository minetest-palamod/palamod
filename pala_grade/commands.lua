local S = minetest.get_translator(minetest.get_current_modname())

local C = minetest.colorize
--local F = minetest.get_color_escape_sequence

local ce_RED = minetest.get_color_escape_sequence(mcl_colors.RED)

local vector = vector

local mcl_colors = mcl_colors

--local serialize = minetest.serialize
--local deserialize = minetest.deserialize
local pos_to_string = minetest.pos_to_string
local string_to_pos = minetest.string_to_pos
local get_player_by_name = minetest.get_player_by_name

--local storage = minetest.get_mod_storage()

--[[
TODO: use the upcomming mcl2 command API
TODO: be sure the command is exactly mc like
]]
minetest.register_chatcommand("set_grade", {
	params = "<player> <grade>",
	description = S("Allows you to change the grade of a player"),
	privs = {server = true},
	func = function(name, param)
		local sparam = param:split(" ")
		if sparam[1] and sparam[2] then
			local target = minetest.get_player_by_name(sparam[1])
			if not target then
				return false, S("Player '@1' cannot be found.", sparam[1])
			end
			if not pala_grade.grades[sparam[2]] then
				return false, S("Invalid Grade")
			end
			pala_grade.set_grade(target, sparam[2])
			return true, C(mcl_colors.GREEN, "Grade succesfully given")
		else
			return false, C(mcl_colors.RED, "Invalid params")
		end
	end,
})

minetest.register_chatcommand("feed", {
	params = "",
	description = S("Allows you to completely fill your food bar"),
	privs = {interact = true},
	func = function(name, param)
		local player = get_player_by_name(name)
		if not player then
			return false, S("Error: Player not found")
		end
		if pala_grade.can_execute(player, 2) then
			mcl_hunger.set_hunger(player, 20)
			return true, C(mcl_colors.GREEN, S("You have been feed!"))
		else
			return false, ce_RED..S("You must have the @1 grade to run this command.",
				pala_grade.grades.hero.desc)
		end
	end,
})

local show_crafting_form = mcl_crafting_table.show_crafting_form
minetest.register_chatcommand("craft", {
	params = "",
	description = S("Allows you to open a crafting table interface."),
	privs = {interact = true},
	func = function(name, param)
		show_crafting_form(get_player_by_name(name))
	end,
})
-------------
--deathlocate
-------------

minetest.register_on_dieplayer(function(player)
	player:get_meta():set_string("pala_grade:deathpos", pos_to_string(vector.round(player:get_pos())))
end)

minetest.register_chatcommand("deathlocate", {
	params = "",
	description = "Allows you to open a crafting table interface.",
	privs = {interact = true},
	func = function(name, param)
		local player = get_player_by_name(name)
		if player then
			if pala_grade.can_execute(player, 3) then --limit to Legendary and YouTube grade
				local pos = string_to_pos(player:get_meta():get_string("pala_grade:deathpos"))
				if pos then
					return true, C(mcl_colors.GREEN, S("Your last death was in: x:@1 y:@2 z:@3", pos.x, pos.y, pos.z))
				else
					return true, C(mcl_colors.GREEN, S("You never died"))
				end
			else
				return false, C(mcl_colors.RED, S("You must have the [@1] grade to run this command.",
					pala_grade.grades.hero.desc))
			end
		else
			return false, "Player not found"
		end
	end,
})

if minetest.settings:get_bool("palamod.experimental", false) then
	minetest.register_chatcommand("furnace", {
		params = "",
		description = "Allows you to cook an item without a furnace",
		privs = {interact = true},
		func = function(name, param)
			local player = get_player_by_name(name)
			if not player then
				return false, "Player not found"
			end
			local item = player:get_wielded_item()
			local output = minetest.get_craft_result({
				method = "cooking",
				width = 1,
				items = {item}
			})
			if output and output.item and not output.item:is_empty() then
				minetest.chat_send_player(name, tostring(output))
				--local outputname = output.item:get_name(),
				--minetest.chat_send_player(name, tostring(outputname))
				minetest.chat_send_player(name, "WIP")
				--player:set_wielded_item(outputname)
				--local count = output.item:to_table().count
			end
			--if output == item
			mcl_hunger.set_hunger(player, 20)
		end,
	})
end