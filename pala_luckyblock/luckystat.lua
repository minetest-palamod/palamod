local has_db_manager = minetest.get_modpath("db_manager")

if minetest.settings:get_bool("pala_luckyblock.luckystat", false) then
	if not has_db_manager then
		error("[pala_luckyblock] Luckystat failed to setup because 'db_manager' isn't installed")
	end

	--local db = db_manager.database("pala_luckyblock:luckystat",
	--	db_manager.get_schemat("pala_luckyblock:sql/pala_luckyblock_luckystat.sql"))

	function pala_luckyblock.luckystat.unlock(playername, eventname)
		return false
	end
	function pala_luckyblock.luckystat.lock(playername, eventname)
		return false
	end
	function pala_luckyblock.luckystat.get(playername, eventname)
		return false
	end
else
	function pala_luckyblock.luckystat.unlock(playername, eventname)
		return false
	end
	function pala_luckyblock.luckystat.lock(playername, eventname)
		return false
	end
	function pala_luckyblock.luckystat.get(playername, eventname)
		return false
	end
end