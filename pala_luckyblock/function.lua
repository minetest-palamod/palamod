function sleep(s)
  local ntime = os.time() + s
  repeat until os.time() > ntime
end

function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end

local itemlist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}

function pala_pillone(pos, player)
	local name = player:get_player_name()
	--minetest.chat_send_all("nnnn")
	for i = 0, 8, 1 do
		minetest.chat_send_all(tostring(i))
		local bpos = {x = pos.x, y = pos.y + i, z = pos.z}
		--if not minetest.is_protected(bpos, name) then
		minetest.chat_send_all(tostring(bpos.x))
		local test = minetest.set_node(bpos, {name="pala_paladium:paladiumblock"})
		minetest.chat_send_all(tostring(test))
		--end
	end
	--minetest.set_node(pos, {name="mcl_core:obsidian"})
	--minetest.add_item(pos, "mcl_core:stone")
end

function mineral_shower(pos, player)
	local name = player:get_player_name()
	local drop_pos = {x=pos.x, y=pos.y+3, z=pos.z}
	minetest.set_node(pos, {name="pala_paladium:paladiumblock"})
	for i = 0, 8, 1 do
		local rnd = math.random(1, 5)
		local rndpos = math.random(1, 2)
		local drop_pos = {x=pos.x+rndpos, y=pos.y+3+rndpos, z=pos.z+rndpos}
		minetest.add_item(drop_pos, itemlist[rnd])
	end
end

function instant_break(pos, player)
	local inv = player:get_inventory()
	inv:remove_item("main", 1)
end

function placefakepala(pos, player)
	while i == true do
		local x = math.random(pos.x-10,pos.x+10)
		local z = math.random(pos.z-10,pos.z+10)
	
		local pos2 = {x = x, y = pos.y,z = z}
		local pos3 = {x = x, y = pos.y + 5,z = z}
		if minetest.get_node(pos2).name == "air" then
			if minetest.get_node(pos3).name == "air" then
				minetest.set_node(pos2, {name="pala_luckyblock:fakepaladiumblock"})
				local meta = minetest.get_meta(pos2)
				meta:set_string("number", 1)
				--minetest.chat_send_all(x..pos.y..z)
				--mcl_particles.add_node_particlespawner(pos2, particlespawner_definition, level)
				ok = true
			end
		end
	end
	--minetest.chat_send_all(x..pos.y..z)
	--minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)
end


function well(pos, player)
	minetest.after(3, function()
		minetest.set_node(pos, {name="mcl_core:obsidian"})
		lightning.strike(pos)
		for i = 1, 10, 1 do
			local rnd = math.random(1, 5)
			minetest.add_item(pos, itemlist[rnd])
		end
	end
	)
end

function expala_osion(pos, player)
	minetest.after(2, function()
		for i = 1, 64*2, 1 do
			local rnd = math.random(-5, 5)
			local rnd2 = math.random(-5, 5)
			local pos2 = {x=pos.x+rnd,y=pos.y+3,z=pos.z+rnd2}
			minetest.add_item(pos2, {"pala_paladium:paladium_ingot"})
		end
	end
	)
end

function consolation(pos, player)
	minetest.after(1, function()
		for i = 1, 27, 1 do
			minetest.add_item(pos, {"pala_paladium:paladium_ingot"})
		end
	end
	)
end

function get_legendary_stone(pos, player)
	minetest.add_item(pos, "pala_legendary:legendary_random")
end

--Explode
function explosif(pos, player)
	minetest.set_node(pos, {name="mcl_core:obsidian"})
	minetest.add_item(pos, "mcl_core:stone")
end


function megaboom(pos, player)
	mcl_explosions.explode(pos, 10, { drop_chance = 1.0 }, player)
	minetest.set_node(pos, {name="air"})
end

function boom(pos, player)
	mcl_explosions.explode(pos, 3, { drop_chance = 1.0 }, player)
	minetest.set_node(pos, {name="air"})
end

--Spawn
function body_guard(pos, player)
	for i = 1, 3, 1 do
		minetest.add_entity(pos, "mobs_mc:iron_golem")
	end
end

function psss(pos, player)
	for i = 1, 4, 1 do
		minetest.add_entity(pos, "mobs_mc:creeper")
	end
end

function caballo_de_la_muerte(pos, player)
	minetest.add_entity(pos, "mobs_mc:skeleton_horse")
end

function batman_nerveux(pos, player)
	for i = 1, 20, 1 do
		minetest.add_entity(pos, "mobs_mc:bat")
	end
end

function silverfish(pos, player)
	for i = 1, 3, 1 do
		minetest.add_entity(pos, "mobs_mc:silverfish")
	end
	minetest.set_node(pos, {name="air"})
end


function geyser(pos, player)
	--TODO: water particules
	player:add_player_velocity({x=0,y=30,z=0})
end

function spam_tp(pos, player)
	local playerpos = player:get_pos()
	minetest.after(10, function()
		player:set_pos({x=playerpos.x,y=playerpos.y+200,z=playerpos.z})
	end)
end

function hasta_la_vista(pos, player)
	local name = player:get_player_name()
	minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Malheureusement nous allons nous quitter d'ici 5 secondes"))
	minetest.after(1, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Content d'avoir passé du temp avec toi"))end)
	minetest.after(2, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Plus que 3 secondes :("))end)
	minetest.after(3, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Plus que 2 secondes :("))end)
	minetest.after(4, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "T'es encore là ?"))end)
	minetest.after(5, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Bye bye..."))end)
	minetest.after(6, function() minetest.kick_player(name,"Crash")end)
end

--Test
function return_none(pos)
	return 0
end

function test_send_chat(pos)
	minetest.chat_send_all("nnnn")
end


--Structures
function pala_beacon(pos, player)
	--TODO:add beacon
	--local name = player:get_player_name()
	local pos2 = {x=pos.x-3,y=pos.y,z=pos.z-3}
	local path = minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_paladiumbeacon.mts"
	--minetest.place_schematic(pos, schematic, rotation, replacements, force_placement, flags)
	minetest.place_schematic(pos2, path, 0, nil, true)
end

function place_endium_piramid(pos, player)
	local pos2 = {x=pos.x-2,y=pos.y,z=pos.z-2}
	local path = minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_endium_piramid.mts"
	minetest.place_schematic(pos2, path, 0, nil, true)
end

function arachnotrap(pos, player)
	local playerpos = player:get_pos()
	local pos2 = {x=playerpos.x-1,y=playerpos.y-6,z=playerpos.z-1}
	local path = minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_arachnotrap.mts"
	minetest.place_schematic(pos2, path, 0, nil, true)
	for i = 1, 6, 1 do
		minetest.add_entity(playerpos, "mobs_mc:cave_spider")
	end
end

function do_not_break(pos, player)
	local playerpos = player:get_pos()
	local pos2 = {x=playerpos.x-5,y=playerpos.y-1,z=playerpos.z-5}
	local path = minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_ne_pas_casser.mts"
	minetest.place_schematic(pos2, path, 0, nil, true)
end