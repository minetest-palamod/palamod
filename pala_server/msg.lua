local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

pala_server.messages = {}

if minetest.settings:get_bool("pala_server.pvp_spawn", true) then
    pala_server.messages.enter_nopvp = C(mcl_colors.DARK_GREEN, S("Welcome to @1", C(mcl_colors.GOLD , S("Spawn"))))..
        C(mcl_colors.DARK_GREEN, ", ")..
        C(mcl_colors.DARK_GREEN, S("a place where @1", C(mcl_colors.GOLD, S("PvP is disabled"))))

	pala_server.messages.enter_pvp = C(mcl_colors.DARK_GREEN, S("You just entered @1", C(mcl_colors.RED , S("Warzone"))))..
	C(mcl_colors.DARK_GREEN, ", ")..
	C(mcl_colors.DARK_GREEN, S("a place where @1", C(mcl_colors.RED, S("PvP is enabled"))))
else
    pala_server.messages.enter_nopvp = C(mcl_colors.DARK_GREEN, S("Welcome to @1", C(mcl_colors.GOLD , S("Spawn"))))
    pala_server.messages.enter_pvp = C(mcl_colors.DARK_GREEN, S("You just entered @1", C(mcl_colors.RED , S("Warzone"))))
end

--https://youtu.be/7D1fcB6Addg?t=84
function minetest.send_join_message(player_name)
	if not core.is_singleplayer() then
		if minetest.get_player_privs(player_name).server == true then
			minetest.chat_send_all(C(mcl_colors.RED, S("[Admin] @1 as joined the server")))
		else
			minetest.chat_send_all("*** " .. player_name .. " joined the game.")
		end
	end
end