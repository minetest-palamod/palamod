local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local spawnmsg
if minetest.settings:get_bool("pala_server.pvp_spawn", true) then
    spawnmsg = C(mcl_colors.DARK_GREEN, S("Welcome to @1", C(mcl_colors.GOLD , S("Spawn"))))..
        C(mcl_colors.DARK_GREEN, ", ")..
        C(mcl_colors.DARK_GREEN, S("a place where @1", C(mcl_colors.GOLD, S("PvP is disabled"))))
else
    spawnmsg = C(mcl_colors.DARK_GREEN, S("Welcome to @1", C(mcl_colors.GOLD , S("Spawn"))))
end

minetest.register_chatcommand("spawn", {
	params = "",
	description = S("Allow you to teleport to spawn"),
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, C(mcl_colors.RED, S("Player not found"))
		end
        mcl_spawn.spawn(player)
		return true, spawnmsg
	end,
})