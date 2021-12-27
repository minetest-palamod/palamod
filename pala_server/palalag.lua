local S = minetest.get_translator(minetest.get_current_modname())
--local C = minetest.colorize
local CE = minetest.get_color_escape_sequence

local math = math
--local string = string

local pairs = pairs

local registered_entities = minetest.registered_entities
local log = minetest.log
local chat_send_all = minetest.chat_send_all
local after = minetest.after

local msg_base = CE(mcl_colors.GOLD).."[PalaLag] "
local msg1 = msg_base..CE(mcl_colors.RED)..S("Entities will be deleted in 30s!")
local msg2 = msg_base..CE(mcl_colors.RED)..S("Entities have been deleted!")
local CLEAR_INTERVAL = tonumber(minetest.settings:get("pala_server.clear_lag_interval")) or 300
--CLEAR_INTERVAL = 31
local time = 0

minetest.register_globalstep(function(dtime)
	time = time + dtime
	if time >= CLEAR_INTERVAL then
		chat_send_all(msg1)
		log("info", "[pala_server] Palalag will start in 30s")
		after(30, function()
			log("info", "[pala_server] Palalag starting...")
			local count = 0
			for id, val in pairs(minetest.luaentities) do
				if val.name == "__builtin:item" or val.name == "mcl_experience:orb" then
					val.object:remove()
					count = count + 1
				else
					local def = registered_entities[val.name]
					if def._cmi_is_mob then
						val.object:remove()
						count = count + 1
					end
				end
			end
			log("info", "[pala_server] Palalag removed "..count.." entities")
			chat_send_all(msg2)
		end)
		time = 0
	end
end)

--Allow you to show when will be the next clearlag
minetest.register_chatcommand("palalagtime", {
	params = "",
	description = S("Allow you to show next clearlag"),
	func = function(name, param)
		return true, CE(mcl_colors.GOLD)..S("Next clearlag in @1s", math.floor(CLEAR_INTERVAL - time + 30))
	end,
})