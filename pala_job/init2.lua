--TEMP TESTING STUFF

minetest.log("action", "[pala_job] loading...")

--local modname = minetest.get_current_modname()
--local modpath = minetest.get_modpath(modname)

--local S = minetest.get_translator(modname)
--local F = minetest.formspec_escape

local string = string
local table = table

local sf = string.format

pala_job = {}

local db
if minetest.get_modpath("db_manager") then
	db = db_manager.database("pala_job:job_xp", db_manager.get_schemat("pala_job:sql/xp_storage"))
end

local pool = {}
--local levels = {}

local function get_xp_raw(playername, job)
	return db:get_rows(
		string.format(
			"SELECT * FROM xp WHERE player = '%s' LIMIT 1",
			playername
		)
	)[1]
end

function pala_job.get_xp(playername, job)
	return pool[playername][job] or get_xp_raw(playername, job)
end

local function set_xp_raw(playername, job, amount)
	return db:exec(
		string.format(
			"UPDATE xp SET %s=%s WHERE player='%s'",
			job,
			amount,
			playername
		)
	)[1]
end

function pala_job.set_xp(playername, job, amount)
	if pool[playername] then
		pool[playername][job] = amount
	else
		set_xp_raw(playername, job, amount)
	end
end

function pala_job.init_player(playername)
	db:exec(
		string.format(
			"INSERT INTO xp VALUES ('%s', %s, %s, %s, %s)",
			playername,
			pala_job.default_xp,
			pala_job.default_xp,
			pala_job.default_xp,
			pala_job.default_xp
		)
	)
end

function pala_job.calculate_level(amount)
end

local function save_data(playername)
	db:exec(
		table.concat({
			"BEGIN;",
			sf("UPDATE xp SET farmer=%s WHERE player='%s' LIMIT 1;", pool[playername]["farmer"], playername),
			sf("UPDATE xp SET miner=%s WHERE player='%s' LIMIT 1;", pool[playername]["miner"], playername),
			sf("UPDATE xp SET hunter=%s WHERE player='%s' LIMIT 1;", pool[playername]["hunter"], playername),
			sf("UPDATE xp SET alchemist=%s WHERE player='%s' LIMIT 1;", pool[playername]["alchemist"], playername),
			"COMMIT;",
		})
	)
end

local function create_pool(playername)
	pool[playername] = {}
	for _,name in pairs({"farmer", "miner", "hunter", "alchemist"}) do
		pool[playername][name] = get_xp_raw(playername, name)
	end
end

local function free_pool(playername)
	save_data(playername)
	pool[playername] = nil
end

--cache xp level
minetest.register_on_joinplayer(function(player)
	local playername = player:get_player_name()
	create_pool(playername)
end)

--free cache
minetest.register_on_leaveplayer(function(player)
	local playername = player:get_player_name()
	free_pool(playername)
end)

--init player xp
minetest.register_on_newplayer(function(player)
	local playername = player:get_player_name()
	pala_job.init_player(playername)
end)
