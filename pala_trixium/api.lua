local string = string

sf = string.format


local cached_playerdata = {}

local cached_top_rank

--Open database
db = db_manager.database("pala_trixium:data", db_manager.get_schemat("pala_trixium:sql/ranking.sql"))

minetest.register_on_newplayer(function(player)
	db:exec(sf("INSERT INTO 'ranking' ('name', 'amount') VALUES ('%s', 0);", player:get_player_name()))
	--Init inventory slot
	--player:get_inventory():set_size("trixium", 1)
end)

function pala_trixium.top_rank()
	if cached_top_rank then
		return cached_top_rank
	else
		minetest.log("action", "[pala_trixium] generating top rank...")
		cached_top_rank = db:get_rows("SELECT * FROM ranking ORDER BY ranking.amount DESC LIMIT 50;")
		return cached_top_rank
	end
end

function pala_trixium.add_to_account(playername, amount)
end