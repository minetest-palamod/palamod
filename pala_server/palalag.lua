local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

if minetest.settings:get_bool("pala_server.clear_lag", true) then
    local msg_base = C(mcl_colors.GOLD, "[PalaLag] ")
    local msg1 = msg_base..C(mcl_colors.RED, S("Entities will be deleted in 30s!"))
    local msg2 = msg_base..C(mcl_colors.RED, S("Entities have been deleted!"))
    local CLEAR_INTERVAL = tonumber(minetest.settings:get("pala_server.clear_lag_interval") or 300)
    --local CLEAR_INTERVAL = 40
    local time = 0

    minetest.register_globalstep(function(dtime)
        time = time + dtime;
        if time >= CLEAR_INTERVAL then
            minetest.chat_send_all(msg1)
            minetest.after(30, function()
                for id, val in pairs(minetest.luaentities) do
                    local def = minetest.registered_entities[minetest.luaentities[id].name]
                    if def._cmi_is_mob or val.name == "__builtin:item" then
                        minetest.luaentities[id].object:remove()
                        --count = count + 1
                    end
                end
                minetest.chat_send_all(msg2)
            end)
            time = 0
        end
    end)
end