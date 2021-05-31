local C = minetest.colorize
--local F = minetest.formspec_escape
local has_mc_faction = minetest.get_modpath("mc_faction")

local string = string

local get_color_escape_sequence = minetest.get_color_escape_sequence

local GRAY = mcl_colors.GRAY
local YELLOW = mcl_colors.YELLOW

--[[
TODO: add exactly like mc colored chat handling
]]

pala_grade.chat = {}
pala_grade.chat.colors = {
	["&0"] = {mcl_colors.BLACK, false},
	["&1"] = {mcl_colors.DARK_BLUE, false},
	["&2"] = {mcl_colors.DARK_GREEN, false},
	["&3"] = {mcl_colors.DARK_AQUA, false},
	["&4"] = {mcl_colors.DARK_RED, false},
	["&5"] = {mcl_colors.DARK_PURPLE, false},
	["&6"] = {mcl_colors.GOLD, false},
	["&7"] = {mcl_colors.GRAY, true},
	["&8"] = {mcl_colors.DARK_GRAY, true},
	["&9"] = {mcl_colors.BLUE, true},
}

function minetest.format_chat_message(name, message)
	local player = minetest.get_player_by_name(name)
	if player then
		local grade = pala_grade.get_grade(player)

		if pala_grade.can_execute(player, 1) then
			message = string.gsub(message, "(&[%a%d])", function(color)
				--if pala_grade.chat.colors[color] and pala_grade.chat.colors[color][2] then
				if pala_grade.chat.colors[color] then --re enable last line then every colors implemented
					return get_color_escape_sequence(pala_grade.chat.colors[color][1])
				else
					return ""
				end
			end)
		end

		local desc
		if grade ~= "none" then
			desc = pala_grade.grades[grade].desc
			if pala_grade.grades[grade].color then
				desc = C(pala_grade.grades[grade].color, desc)
			end
		end

		if has_mc_faction then
			if desc then
				return desc.." "..name..": "..message --FIXME
			else
				return name..": "..message --FIXME
			end
		else
			if desc then
				return C(YELLOW, "<BlackOld> ")..desc.." "..C(GRAY, name..": "..message)
			else
				return C(YELLOW, "<BlackOld> ")..C(GRAY, name..": "..message)
			end
		end
	else
		return name..": "..message
	end
end