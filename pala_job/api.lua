--local S = minetest.get_translator(modname)
--local F = minetest.formspec_escape

--localize some commun functions (for performances)
local pairs = pairs

local string = string
local table = table

local sf = string.format


--vars---------
local levels_mapping = {480, 1195, 2476, 4710, 8327, 13792, 21597, 32262, 46328, 64357,
	86931, 114649, 148126, 187995, 234901, 289504, 352478, 424509, 506296, 598549}
---------------

--create database object for storage use
local db = db_manager.database("pala_job:job_xp", db_manager.get_schemat("pala_job:sql/xp_storage.sql"))

local pool = {}
--local levels = {}

local function get_xp_raw(playername, job)
	return db:get_rows(
		sf(
			"SELECT * FROM xp WHERE player = '%s' LIMIT 1",
			playername
		)
	)[1]
end

local function set_xp_raw(playername, job, amount)
	db:exec(
		sf(
			"UPDATE xp SET %s=%s WHERE player='%s'",
			job,
			amount,
			playername
		)
	)
end

--get xp in specified job for playername
function pala_job.get_xp(playername, job)
	return pool[playername][job]
end

--set xp in specified job for playername
function pala_job.set_xp(playername, job, amount)
	pool[playername][job] = amount
end

function pala_job.init_player(playername)
	db:exec(
		sf(
			"INSERT INTO xp VALUES ('%s', %s, %s, %s, %s)",
			playername,
			pala_job.default_xp,
			pala_job.default_xp,
			pala_job.default_xp,
			pala_job.default_xp
		)
	)
end

--FIXME
function pala_job.calculate_level(amount)
	for level, val in pairs(levels_mapping) do
		if amount >= val then
			return level + 1
		end
	end
	return 0
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

--save xp periodicaly every 10mn
local time = 0
minetest.register_globalstep(function(dtime)
	time = time + dtime;
	if time >= 600 then
		for _,player in pairs(minetest.get_connected_players()) do
			local playername = player:get_player_name()
			if pool[playername] then --it should ALWAYS be true
				save_data(playername)
			end
		end
		time = 0
	end
end)
