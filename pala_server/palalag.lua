local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local math = math
--local string = string

if minetest.settings:get_bool("pala_server.clear_lag", true) then
    local msg_base = C(mcl_colors.GOLD, "[PalaLag] ")
    local msg1 = msg_base..C(mcl_colors.RED, S("Entities will be deleted in 30s!"))
    local msg2 = msg_base..C(mcl_colors.RED, S("Entities have been deleted!"))
    local CLEAR_INTERVAL = tonumber(minetest.settings:get("pala_server.clear_lag_interval") or 300)
    --CLEAR_INTERVAL = 31
    local time = 0

    minetest.register_globalstep(function(dtime)
        time = time + dtime;
        if time >= CLEAR_INTERVAL then
            minetest.chat_send_all(msg1)
            minetest.log("info", "[pala_server] Palalag will start in 30s")
            minetest.after(30, function()
                minetest.log("info", "[pala_server] Palalag starting...")
                local count = 0
                for id, val in pairs(minetest.luaentities) do
                    local def = minetest.registered_entities[minetest.luaentities[id].name]
                    if def._cmi_is_mob or val.name == "__builtin:item" then
                        minetest.luaentities[id].object:remove()
                        count = count + 1
                    end
                end
                minetest.log("info", "[pala_server] Palalag removed "..count.." entities")
                minetest.chat_send_all(msg2)
            end)
            time = 0
        end
    end)
    minetest.register_chatcommand("palalagtime", {
        params = "",
        description = S("Allow you to show next clearlag"),
        func = function(name, param)
            return true, C(mcl_colors.GOLD, S("Next clearlag in @1s", math.floor(CLEAR_INTERVAL-time+30)))
        end,
    })
end