pala_job = {}
pala_job.jobs = {"hunter", "miner", "farmer", "alchemist"}
pala_job.levels = {480, 1195, 2476, 4710, 8327, 13792, 21597, 32262, 46328, 64357, 86931, 114649, 148126, 187995, 234901, 289504, 352478, 424509, 506296, 598549}
pala_job.default_xp = 0
pala_job.job = {}
--TODO:real money
if minetest.get_modpath("my_super_money") then
	pala_job.money = ""
else
	pala_job.money = "mcl_core:stone"
end
--TODO:hammer and cobblebreaker
pala_job.job.hunter = {
	{pala_job.money.." 2"},
	{pala_job.money.." 3"}, 
	{pala_job.money.." 4"}, 
	{pala_job.money.." 5"},
	{"pala_tools:pick_paladium"},
	{pala_job.money.." 7"},
	{pala_job.money.." 8"},
	{pala_job.money.." 9"},
	{pala_job.money.." 10"},
	{"pala_tools:sword_paladium", "pala_tools:infernal_knocker"},
	{pala_job.money.." 12"},
	{pala_job.money.." 13"},
	{pala_job.money.." 14"},
	{pala_job.money.." 15"},
	{"pala_tools:pick_paladium", "pala_tools:pick_paladium", "mcl_core:stone 2"},
	{pala_job.money.." 17"},
	{pala_job.money.." 18"},
	{pala_job.money.." 19"},
	{pala_job.money.." 20"},
	{"pala_tools:pick_paladium", "pala_tools:pick_paladium", "pala_paladium:endium_nugget"}
}

pala_job.job.miner = {
	{pala_job.money.." 2"},
	{pala_job.money.." 3"}, 
	{pala_job.money.." 4"}, 
	{pala_job.money.." 5"},
	{"pala_tools:pick_paladium"},
	{pala_job.money.." 7"},
	{pala_job.money.." 8"},
	{pala_job.money.." 9"},
	{pala_job.money.." 10"},
	{"pala_tools:pick_paladium", "pala_tools:pick_paladium"},
	{pala_job.money.." 12"},
	{pala_job.money.." 13"},
	{pala_job.money.." 14"},
	{pala_job.money.." 15"},
	{"pala_tools:pick_paladium", "pala_tools:pick_paladium", "mcl_core:stone 2"},
	{pala_job.money.." 17"},
	{pala_job.money.." 18"},
	{pala_job.money.." 19"},
	{pala_job.money.." 20"},
	{"pala_tools:pick_paladium", "pala_tools:pick_paladium", "pala_paladium:endium_nugget"}
}

function pala_job.init_player(player)
	for _,job in pairs(pala_job.jobs) do
		player:get_meta():set_int("pala_job_xp_"..job, pala_job.default_xp)
	end
end

function pala_job.earn_xp(player, job, list)
	local meta = player:get_meta()
	--minetest.chat_send_all(tostring(meta:get_float("pala_job_xp_"..job)))
	meta:set_float("pala_job_xp_"..job, meta:get_float("pala_job_xp_"..job) + list[pala_job.get_level(player, job)+1])
	--pala_job.update_job
	minetest.chat_send_all(tostring(player:get_meta():get_float("pala_job_xp_"..job)))
	if meta:get_float("pala_job_xp_"..job) >= pala_job.levels[meta:get_int("pala_job_level_"..job) + 1] then
		local oldlevel = player:get_meta():get_int("pala_job_level_"..job)
		player:get_meta():set_int("pala_job_level_"..job, player:get_meta():get_int("pala_job_level_"..job) + 1)
		minetest.chat_send_all("lvl passed")
		pala_job.give_loot(player, job, player:get_meta():get_int("pala_job_level_"..job))
	end
end

--RAW:formspec_version[3]size[9,5.5]label[3.5,0.5;FARMER]label[3,2;You pass level 19]label[3,3.5;You receive :]image[1,4;1,1;]image[4,4;1,1;]image[7,4;1,1;]image[0,2.25;9,1;]
function pala_job.show_win_level(player, job, level, loot)
	local loot1 = loot[level][1] or "mcl_core:stone"
	local loot2 = loot[level][2] or "mcl_core:stone"
	local loot3 = loot[level][3] or "mcl_core:stone"
	local form = table.concat({
		"size[6.81,4.02]",
		"label[3,-0.15;"..string.upper(job).."]",
		"label[2.6,1.15;You pass level "..level.."]",
		"label[2.6,2.45;You receive :]",
		"item_image[0.5,3.14;1.0,1.0;"..loot1.."]",
		"item_image[2.9,3.14;1.0,1.0;"..loot2.."]",
		"item_image[5.3,3.14;1.0,1.0;"..loot3.."]",
		"image[-0.3,1.63;9.0,1.0;pala_job_level_up_border.png]"
	})
	minetest.show_formspec(player:get_player_name(), "pala_job:level_up", form)
end

function pala_job.give_loot(player, job, level)
	local loot = pala_job.get_job_loots(job)
	local pos = player:get_pos()
	for _,i in pairs(loot[level]) do
		minetest.add_item(pos, i)
	end
	pala_job.show_win_level(player, job, level, loot)
end

function pala_job.get_level(player, job)
	return player:get_meta():get_int("pala_job_level_"..job)
end
--DEV-------------------------------------------------------------
minetest.register_chatcommand("level", {
	params = "<text>",
	description = "Send text to chat",
	privs = {talk = true},
	func = function(name, param)
		pala_job.get_level(minetest.get_player_by_name(name), "miner")
		return true, "Text was sent successfully"
	end,
})

minetest.register_chatcommand("reset", {
	description = "Send text to chat",
	privs = {},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		player:get_meta():set_int("pala_job_level_miner", 0)
		player:get_meta():set_int("pala_job_xp_miner", 0)
		return true, "Text was sent successfully"
	end,
})

function pala_job.get_job_loots(job)
	if job == "hunter" then
		return pala_job.job.hunter
	elseif job == "miner" then
		return pala_job.job.miner
	elseif job == "farmer" then
		return pala_job.job.farmer
	elseif job == "alchemist" then
		return pala_job.job.alchemist
	end
end
minetest.register_on_newplayer(function(player)
	--local playern = player:get_player_name()
	pala_job.init_player(player)
end)

minetest.register_chatcommand("earn", {
	description = "Send text to chat",
	privs = {},
	func = function(name, param)
		pala_job.earn_xp(minetest.get_player_by_name(name), "miner", {10, 20, 300})
		return true, "Text was sent successfully"
	end,
})


dofile(minetest.get_modpath("pala_job").."/update.lua")