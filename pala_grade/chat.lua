local C = minetest.colorize

--[[
TODO: add exactly like mc colored chat handling
]]

local function safe_gsub(s, replace, with)
	local i1, i2 = s:find(replace, 1, true)
	if not i1 then
		return s, false
	end

	return s:sub(1, i1 - 1) .. with .. s:sub(i2 + 1), true
end

function minetest.format_chat_message(name, message)
	local error_str = "Invalid chat message format - missing %s"
	local str = core.settings:get("chat_message_format")
	local replaced

	-- Name
	str, replaced = safe_gsub(str, "@name", name)
	if not replaced then
		error(error_str:format("@name"), 2)
	end

	-- Timestamp
	str = safe_gsub(str, "@timestamp", os.date("%H:%M:%S", os.time()))

	-- Insert the message into the string only after finishing all other processing
	str, replaced = safe_gsub(str, "@message", message)
	if not replaced then
		error(error_str:format("@message"), 2)
	end
    local player = minetest.get_player_by_name(name)
    if player then
        return pala_grade.grades[pala_grade.get_grade(player)].desc.." "..str
    else
	    return str
    end
end