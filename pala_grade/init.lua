minetest.log("action", "[pala_grade] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
local C = minetest.colorize

local GRAY = mcl_colors.GRAY
local RED = mcl_colors.RED
--local BLUE = mcl_colors.BLUE
local WHITE = mcl_colors.WHITE
local GOLD = mcl_colors.GOLD
local DARK_PURPLE = mcl_colors.DARK_PURPLE

local default_grade = minetest.settings:get("pala_grade.default_grade") or "none"
local singleplayer_grade = minetest.settings:get("pala_grade.singleplayer_grade") or "none"

local is_singleplayer = minetest.is_singleplayer()

--[[
TODO: like mc colored chat handling
TODO: handle grade with database
TODO: be sure grade prefixs are mc like
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
        desc = C(GRAY, "["..S("Chalenger").."]"),
        prefix = C(GRAY, S("CH")),
    },
    hero = {
        rank = 2,
        color = GOLD,
        desc = C(GOLD, "["..S("Hero").."]"),
        prefix = C(GOLD, S("HR")),
    },
    legendary = {
        rank = 3,
        color = DARK_PURPLE,
        desc = C(DARK_PURPLE, "["..S("Legendary").."]"),
        prefix = C(DARK_PURPLE, S("LG")),
    },
    youtube = {
        rank = 3,
        color = nil,
        desc = C(RED, "[You")..C(WHITE, "Tube]"),
        prefix = C(RED, S("YT")),
    },
}

function pala_grade.get_grade(player)
	return player:get_meta():get_string("pala_grade.grade")
end

function pala_grade.can_execute(player, level)
	local grade = player:get_meta():get_string("pala_grade.grade")
	if pala_grade.grades[grade] then
		return pala_grade.grades[grade].rank >= level
	else
		minetest.log("error", "[pala_grade] Player ["..player:get_player_name().."] has invalid grade ["..grade.."]")
		return "none"
	end
end

function pala_grade.set_grade(player, grade)
	if pala_grade.grades[grade] then
		player:get_meta():set_string("pala_grade.grade", grade)
	else
		minetest.log("error",
			"[pala_grade] Failed to set grade to player ["..player:get_player_name().."]: Invalid grade ["..grade.."]")
	end
end

--This function should be overiden by network mods to retreive grade from auth database and return grade name
function pala_grade.retrieve_grade(player)
	return nil
end

minetest.register_on_joinplayer(function(player)
    if is_singleplayer then
        pala_grade.set_grade(player, singleplayer_grade)
    else
        local retrived_grade = pala_grade.retrieve_grade(player)
        if retrived_grade then
            pala_grade.set_grade(player, retrived_grade)
        else
            pala_grade.set_grade(player, default_grade)
        end
    end
end)

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/chat.lua")
end

dofile(modpath.."/commands.lua")

minetest.log("action", "[pala_grade] loaded succesfully")