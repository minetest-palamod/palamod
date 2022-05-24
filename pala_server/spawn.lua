local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize
local vector = vector
local log = minetest.log

local static_spawnpoint = minetest.setting_get_pos("static_spawnpoint")
--local spawn_pos = mcl_spawn.get_world_spawn_pos()
local is_spawn_nopvp = minetest.settings:get_bool("pala_server.pvp_spawn", true)
--local no_pvp = minetest.settings:get("pala_server.pvp_spawn_radius") or 20

--[[
TODO: dynamicly add every chunks in area to spawn_chunks
TODO: add registration of no pvp chunk
]]

local spawn_chunks = {}

spawn_chunks[pala_server.pos_to_chunk(vector.new(0, 0, 0))] = true

---@param player ObjectRef
---@return boolean
function pala_server.is_nopvp(player)
	if is_spawn_nopvp then
		--nd vector.distance(spawn_pos, player:get_pos()) < no_pvp then
		if spawn_chunks[pala_server.pos_to_chunk(vector.round(player:get_pos()))] then
			--minetest.chat_send_all(pala_server.pos_to_chunk(vector.round(player:get_pos())))
			--minetest.chat_send_all(pala_server.pos_to_chunk(vector.new(0, 0, 0)))
			return true
		end
		return false
	else
		return false
	end
end

if static_spawnpoint then
	--Spawn MUST be static if static spawn is defined
	function mcl_spawn.get_world_spawn_pos()
		return static_spawnpoint
	end
	spawn_pos = mcl_spawn.get_world_spawn_pos()

	function mcl_spawn.get_bed_spawn_pos(player)
		return spawn_pos, false
	end

	function mcl_spawn.get_player_spawn_pos(player)
		return spawn_pos, false
	end

	function mcl_spawn.set_spawn_pos(player, pos, message)
		log("warning", "[pala_server] mcl_spawn.set_spawn_pos shouldn't be called!")
		return false
	end

	function mcl_spawn.spawn(player)
		player:set_pos(spawn_pos)
		return true
	end
end

--This command allow any player to go to spawn
minetest.register_chatcommand("spawn", {
	params = "",
	description = S("Allow you to teleport to spawn"),
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, C(mcl_colors.RED, S("Player not found"))
		end
        mcl_spawn.spawn(player)
		return true, pala_server.messages.enter_nopvp
	end,
})

if is_spawn_nopvp then
	local is_nopvp = pala_server.is_nopvp
	mcl_damage.register_modifier(function(obj, damage, reason)
		if is_nopvp(obj) then
			return 0
		end
		return damage
	end, 200)
end
