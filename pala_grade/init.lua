minetest.log("action", "[pala_grade] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
local C = minetest.colorize

local default_grade = minetest.settings:get("pala_grade.default_grade") or "none"

--[[
TODO: like mc colored chat handling
TODO: handle grade with database
]]

pala_grade = {}
pala_grade.grades = {}
pala_grade.grades.none      = {rank=0, desc=""}
pala_grade.grades.chalenger = {rank=1, desc=C(mcl_colors.GRAY, "["..S("Chalenger").."]")}
pala_grade.grades.hero      = {rank=2, desc=C(mcl_colors.RED, "["..S("Hero").."]")}
pala_grade.grades.legendary = {rank=3, desc=C(mcl_colors.BLUE, "["..S("Legendary").."]")}
pala_grade.grades.youtube   = {rank=3, desc=C(mcl_colors.RED, "[You")..C(mcl_colors.WHITE, "Tube]")}

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

--This function should be overiden by network mods to retreive grade from auth database
function pala_grade.update_grade(player)
	return pala_grade.set_grade(player, default_grade)
end

minetest.register_on_joinplayer(function(player)
	pala_grade.update_grade(player)
end)

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/chat.lua")
end

dofile(modpath.."/commands.lua")

minetest.log("action", "[pala_grade] loaded succesfully")