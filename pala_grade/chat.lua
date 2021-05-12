local C = minetest.colorize
--local F = minetest.formspec_escape
local has_mc_faction = minetest.get_modpath("mc_faction")

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

--[[local function safe_gsub(s, replace, with)
	local i1, i2 = s:find(replace, 1, true)
	if not i1 then
		return s, false
	end

	return s:sub(1, i1 - 1) .. with .. s:sub(i2 + 1), true
end]]

function minetest.format_chat_message(name, message)
	local player = minetest.get_player_by_name(name)
	local grade = pala_grade.get_grade(player)

	-- Colors
	--if player and pala_grade.can_execute(player, 1) then
	--for pattern, def in pairs(pala_grade.chat.colors) do
		--if def[2] then
		--str = safe_gsub(str, pattern, F(def[1]))
		--end
	--end
	--end

    if player then
		if has_mc_faction then
			return pala_grade.grades[grade].desc.." "..name..": "..message
		else
			return C(mcl_colors.YELLOW, "<BlackOld> ")..
				pala_grade.grades[grade].desc.." "..C(mcl_colors.GRAY, name..": "..message)
		end
    else
	    return name..": "..message
    end
end