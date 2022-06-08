local string = string

local pairs = pairs

local sf = string.format

---@type number
local SAVE_INTERVAL = tonumber(minetest.settings:get("pala_trixium.saving_interval")) or 30

local cached_playerdata = {}

local cached_top_rank

--Open database
local db = db_manager.database("pala_trixium:data", db_manager.get_schemat("pala_trixium:sql/ranking.sql"))

minetest.register_on_newplayer(function(player)
	db:exec(sf("INSERT INTO 'ranking' ('name', 'amount') VALUES ('%s', 0);", player:get_player_name()))
	--Init inventory slot
	--player:get_inventory():set_size("trixium", 1)
end)

local function get_top_ranking_raw()
	minetest.log("action", "[pala_trixium] generating top rank...")
	local out = db:get_rows("SELECT * FROM ranking ORDER BY ranking.amount DESC LIMIT 50;")
	minetest.log("action", "[pala_trixium] top rank generated")
	return out
end

function pala_trixium.get_top_ranking()
	if cached_top_rank then
		return cached_top_rank
	else
		cached_top_rank = get_top_ranking_raw()
		return cached_top_rank
	end
end

local function get_amount_raw(playername)
	local r = db:get_rows(sf("SELECT * FROM ranking WHERE name = '%s' LIMIT 1", playername))
	if r[1] and r[1].amount then
		return r[1].amount
	else
		return 0
	end
end

minetest.register_on_joinplayer(function(player)
	local pname = player:get_player_name()
	cached_playerdata[pname] = get_amount_raw(pname)
end)

---@param playername string
---@return integer
function pala_trixium.get_amount(playername)
	if cached_playerdata[playername] then
		return cached_playerdata[playername]
	else
		cached_playerdata[playername] = get_amount_raw(playername)
		return cached_playerdata[playername]
	end
end

---@param playername string
---@param amount integer
function pala_trixium.set_amount(playername, amount)
	cached_playerdata[playername] = amount
end

---@param playername string
---@param amount integer
function pala_trixium.add_amount(playername, amount)
	pala_trixium.set_amount(playername, pala_trixium.get_amount(playername) + amount)
end

---@param playername string
---@param clear_cache boolean
function pala_trixium.save_playerdata(playername, clear_cache)
	if cached_playerdata[playername] then
		print(sf("UPDATE ranking SET amount=%s WHERE name='%s';", cached_playerdata[playername], playername))
		db:exec(sf("UPDATE ranking SET amount=%s WHERE name='%s';", cached_playerdata[playername], playername))
		if clear_cache then
			cached_playerdata[playername] = nil
		end
	end
end

local time = 0
minetest.register_globalstep(function(dtime)
	time = time + dtime;
	if time >= SAVE_INTERVAL then
		minetest.log("action", "[pala_trixium] saving player data...")

		--print(dump(cached_playerdata))

		--save player data
		local c = 0
		for _,player in pairs(minetest.get_connected_players()) do
			local pname = player:get_player_name()
			pala_trixium.save_playerdata(pname, false)
			c = c + 1
		end

		minetest.log("action", "[pala_trixium] player data saved ("..c.." cache entries)")

		--update cached ranking
		cached_top_rank = get_top_ranking_raw()
		time = 0
	end
end)

if minetest.is_singleplayer() then
	--we are forced to use this callback insteed of on_leaveplayer because in singleplayer, on_leaveplayer is never called
	minetest.register_on_shutdown(function()
		local player = minetest.get_connected_players()[1]
		pala_trixium.save_playerdata(player:get_player_name(), true)
	end)
else
	--Save data then a player leaves
	minetest.register_on_leaveplayer(function(player)
		pala_trixium.save_playerdata(player:get_player_name(), true)
	end)
end