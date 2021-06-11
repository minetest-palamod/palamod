minetest.log("action", "[pala_job] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)

local S = minetest.get_translator(modname)
local F = minetest.formspec_escape

local get_item_group = minetest.get_item_group

pala_job = {}
pala_job.levels = {480, 1195, 2476, 4710, 8327, 13792, 21597, 32262, 46328, 64357,
	86931, 114649, 148126, 187995, 234901, 289504, 352478, 424509, 506296, 598549}
pala_job.default_xp = minetest.settings:get("pala_job.default_xp") or 0
pala_job.jobs = {}

if minetest.get_modpath("mc_economy") then
	pala_job.money = "mc_economy:money"
else
	pala_job.money = "mcl_core:stone"
end

--[[
TODO:hammer, cobblebreaker and bow looting
]]

pala_job.jobs.hunter = {
	{pala_job.money.." 2"},
	{pala_job.money.." 3"},
	{pala_job.money.." 4"},
	{pala_job.money.." 5"},
	{"pala_armor:paladium_helmet"},
	{pala_job.money.." 7"},
	{pala_job.money.." 8"},
	{pala_job.money.." 9"},
	{pala_job.money.." 10"},
	{{itemstring = "pala_tools:sword_paladium", enchantments = {sharpness = 5, unbreaking = 4}},
		{itemstring = "pala_tools:infernal_knocker", enchantments = {knockback = 5}}},
	{pala_job.money.." 12"},
	{pala_job.money.." 13"},
	{pala_job.money.." 14"},
	{pala_job.money.." 15"},
	{{itemstring = "pala_tools:sword_paladium", enchantments = {sharpness = 5, unbreaking = 4}},
		"pala_tools:broadsword_paladium"},
	{pala_job.money.." 17"},
	{pala_job.money.." 18"},
	{pala_job.money.." 19"},
	{pala_job.money.." 20"},
	{{itemstring = "pala_tools:sword_paladium", enchantments = {sharpness = 5, unbreaking = 4}},
		"pala_tools:pick_paladium", "pala_paladium:endium_nugget"}
}

pala_job.jobs.miner = {
	{pala_job.money.." 2"},
	{pala_job.money.." 3"},
	{pala_job.money.." 4"},
	{pala_job.money.." 5"},
	{"pala_tools:pick_paladium"},
	{pala_job.money.." 7"},
	{pala_job.money.." 8"},
	{pala_job.money.." 9"},
	{pala_job.money.." 10"},
	{{itemstring = "pala_tools:pick_paladium", enchantments = {unbreaking = 5}},
		"pala_tools:pick_paladium", "pala_tools:pick_paladium"},
	{pala_job.money.." 12"},
	{pala_job.money.." 13"},
	{pala_job.money.." 14"},
	{pala_job.money.." 15"},
	{{itemstring = "pala_tools:pick_paladium", enchantments = {unbreaking = 5}},
		"pala_tools:pick_paladium", "mcl_core:stone 2"},
	{pala_job.money.." 17"},
	{pala_job.money.." 18"},
	{pala_job.money.." 19"},
	{pala_job.money.." 20"},
	{{itemstring = "pala_tools:pick_paladium", enchantments = {unbreaking = 5}},
		"pala_tools:pick_paladium", "pala_paladium:endium_nugget"}
}

function pala_job.init_player(player)
	for job,_ in pairs(pala_job.jobs) do
		player:get_meta():set_int("pala_job_xp_"..job, pala_job.default_xp)
	end
end

function pala_job.earn_xp(player, job, list)
	local meta = player:get_meta()
	if pala_job.levels[meta:get_int("pala_job_level_"..job) + 1] then
		--minetest.chat_send_all(tostring(meta:get_float("pala_job_xp_"..job)))
		meta:set_float("pala_job_xp_"..job, meta:get_float("pala_job_xp_"..job) + list[pala_job.get_level(player, job)+1])
		--pala_job.update_job
		minetest.chat_send_all(tostring(player:get_meta():get_float("pala_job_xp_"..job)))
		if meta:get_float("pala_job_xp_"..job) >= pala_job.levels[meta:get_int("pala_job_level_"..job) + 1] then
			--local oldlevel = player:get_meta():get_int("pala_job_level_"..job)
			player:get_meta():set_int("pala_job_level_"..job, player:get_meta():get_int("pala_job_level_"..job) + 1)
			minetest.chat_send_all("lvl passed")
			pala_job.give_loot(player, job, player:get_meta():get_int("pala_job_level_"..job))
		end
	end
end

function pala_job.reset_xp(player, job)
	pala_job.set_xp(player, job, 0)
	pala_job.update_job(player, job)
end


function pala_job.update_job(player, job)
	local meta = player:get_meta()
	if pala_job.levels[meta:get_int("pala_job_level_"..job) + 1] then
		if meta:get_float("pala_job_xp_"..job) >= pala_job.levels[meta:get_int("pala_job_level_"..job) + 1] then
			--local oldlevel = player:get_meta():get_int("pala_job_level_"..job)
			meta:set_int("pala_job_level_"..job, meta:get_int("pala_job_level_"..job) + 1)
		end
	end
end


function pala_job.set_xp(player, job, amount)
	local meta = player:get_meta()
	--local l = pala_job.levels[20]
	--if not amount>l then
	meta:set_float("pala_job_xp_"..job, amount)
	pala_job.update_job(player, job)
		--return true
	--else
		--return false
	--end
end

--RAW:formspec_version[4]
--size[9,5.5]
--label[3.5,0.5;FARMER]
--label[3,2;You pass level 19]
--label[3,3.5;You receive :]
--image[1,4;1,1;]
--image[4,4;1,1;]
--image[7,4;1,1;]
--image[0,2.25;9,1;]

function pala_job.get_loot_item(def)
	if not def then
		return ItemStack("mcl_core:stone")
	elseif type(def) == "table" then
		local item = ItemStack(def.itemstring)
		mcl_enchanting.set_enchanted_itemstring(item)
		mcl_enchanting.set_enchantments(item, def.enchantments)
		return item
	else
		return ItemStack(def)
	end
end

--[[
TODO: better styling and formspec layout
]]

local gray = mcl_colors.DARK_GRAY
function pala_job.show_win_level(player, job, level, loot)
	local loot1 = pala_job.get_loot_item(loot[level][1])
	local loot2 = pala_job.get_loot_item(loot[level][2])
	local loot3 = pala_job.get_loot_item(loot[level][3])
	local form = table.concat({
		"formspec_version[4]",
		"size[9,5.5]",
		--"label[3.5,0.5;"..S(string.upper(job)).."]",
		"hypertext[0,0;9,1.2;job;<global valign=middle halign=center size=25 color="..gray..">"..S(string.upper(job)).."]",
		"label[3,2;You pass level "..level.."]",
		"label[3,3.5;You receive :]",
		"item_image[1,4;1,1;"..loot1:get_name().." "..loot1:get_count().."]",
		"tooltip[1,4;1,1;"..F(loot1:get_description()).."]",
		"item_image[4,4;1,1;"..loot2:get_name().." "..loot2:get_count().."]",
		"tooltip[4,4;1,1;"..F(loot1:get_description()).."]",
		"item_image[7,4;1,1;"..loot3:get_name().." "..loot3:get_count().."]",
		"tooltip[7,4;1,1;"..F(loot1:get_description()).."]",
		"image[0,2.25;9,1;pala_job_level_up_border.png]"
	})
	minetest.show_formspec(player:get_player_name(), "pala_job:level_up", form)
end

function pala_job.give_loot(player, job, level)
	local loot = pala_job.get_job_loots(job)
	local pos = player:get_pos()
	for _,i in pairs(loot[level]) do
		minetest.add_item(pos, pala_job.get_loot_item(i))
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
	privs = {},
	func = function(name, param)
		return true, pala_job.get_level(minetest.get_player_by_name(name), "miner")
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

minetest.register_chatcommand("add_xp", {
	description = "Send text to chat",
	privs = {},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		return pala_job.set_xp(player, "miner", 598000)
	end,
})

function pala_job.get_job_loots(job)
	if pala_job.jobs[job] then
		return pala_job.jobs[job]
	else
		return nil
	end
end
minetest.register_on_newplayer(function(player)
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

local get_level = pala_job.get_level
minetest.register_craft_predict(function(itemstack, player, old_craft_grid, craft_inv)
	local mgroup = get_item_group(itemstack:get_name(), "miner_level")
	if mgroup > 0 and get_level(player, "miner") < mgroup then
		return ItemStack("")
	end
end)

dofile(modpath.."/update.lua")

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/mobs.lua")
end

minetest.log("action", "[pala_job] loaded succesfully")