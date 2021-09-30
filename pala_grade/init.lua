minetest.log("action", "[pala_grade] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
--local C = minetest.colorize
local CE = minetest.get_color_escape_sequence

local GRAY = mcl_colors.GRAY
local RED = mcl_colors.RED
--local BLUE = mcl_colors.BLUE
local WHITE = mcl_colors.WHITE
local GOLD = mcl_colors.GOLD
local DARK_PURPLE = mcl_colors.DARK_PURPLE

local default_grade = minetest.settings:get("pala_grade.default_grade") or "none"

--[[
TODO: like mc colored chat handling
TODO: handle grade with database
TODO: be sure grade prefixs are mc like
TODO: https://youtu.be/XGvtr2KsX-E?t=426
]]

pala_grade = {}

--prefixs are from https://youtu.be/BUuh-RIlkM0?t=801
pala_grade.grades = {
	none = {
		rank = 0,
		color = nil,
		desc = "",
		prefix = "",
	},
	chalenger = {
		rank = 1,
		color = GRAY,
		desc = CE(GRAY).."["..S("Chalenger").."]",
		prefix = CE(GRAY)..S("CH"),
	},
	hero = {
		rank = 2,
		color = GOLD,
		desc = CE(GOLD).."["..S("Hero").."]",
		prefix = CE(GOLD)..S("HR"),
	},
	legendary = {
		rank = 3,
		color = DARK_PURPLE,
		desc = CE(DARK_PURPLE).."["..S("Legendary").."]",
		prefix = CE(DARK_PURPLE)..S("LG"),
	},
	youtube = {
		rank = 3,
		color = nil,
		desc = CE(RED).."[You"..CE(WHITE).."Tube]",
		prefix = CE(RED)..S("YT"),
	},
}

function pala_grade.get_grade(player)
	return player:get_meta():get_string("pala_grade:grade")
end

function pala_grade.can_execute(player, level)
	local grade = player:get_meta():get_string("pala_grade:grade")
	if pala_grade.grades[grade] then
		return pala_grade.grades[grade].rank >= level
	else
		minetest.log("error", "[pala_grade] Player ["..player:get_player_name().."] has invalid grade ["..grade.."]")
		return "none"
	end
end

function pala_grade.set_grade(player, grade)
	if pala_grade.grades[grade] then
		player:get_meta():set_string("pala_grade:grade", grade)
	else
		minetest.log("error",
			"[pala_grade] Failed to set grade to player ["..player:get_player_name().."]: Invalid grade ["..grade.."]")
	end
end

minetest.register_on_newplayer(function(player)
	pala_grade.set_grade(player, default_grade)
end)

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/chat.lua")

	if minetest.get_modpath("pala_armor")
		and minetest.get_modpath("mcl_armor")
		and minetest.get_modpath("mcl_enchanting") then

		dofile(modpath.."/paladium_skin.lua")
	end
end

dofile(modpath.."/commands.lua")

minetest.log("action", "[pala_grade] loaded succesfully")