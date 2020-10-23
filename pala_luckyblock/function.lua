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
	minetest.set_node(drop_pos, {name="pala_paladium:paladiumblock"})
	for i = 0, 8, 1 do
		local rnd = math.random(1, 5)
		local drop_pos = {x=pos.x+rnd, y=pos.y+3+rnd, z=pos.z+rnd}
		minetest.add_item(drop_pos, itemlist[rnd])
	end
end

function instant_break(pos, player)
	local inv = player:get_inventory()
	inv:set_stack({name = ""}, 1)
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

function place_endium_piramid(pos, player)
	local x = pos.x-2
	--local list = minetest.find_nodes_in_area(pos.x-10, pos2, { "default:mese" })
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)
end

function well(pos, player)
	minetest.set_node(pos, {name="mcl_core:obsidian"})
	lightning.strike(pos)
	for i = 1, 10, 1 do
		local rnd = math.random(1, 5)
		minetest.add_item(pos, itemlist[rnd])
	end
end

function explosif(pos, player)
	minetest.set_node(pos, {name="mcl_core:obsidian"})
	minetest.add_item(pos, "mcl_core:stone")
end

function body_guard(pos, player)
	for i = 1, 3, 1 do
		minetest.add_entity(pos, "mobs_mc:iron_golem")
	end
	minetest.set_node(pos, {name="air"})
end

function psss(pos, player)
	for i = 1, 4, 1 do
		minetest.add_entity(pos, "mobs_mc:creeper")
	end
	minetest.set_node(pos, {name="air"})
end

function megaboom(pos, player)
	mcl_explosions.explode(pos, 10, { drop_chance = 1.0 }, player)
	minetest.set_node(pos, {name="air"})
end

function boom(pos, player)
	mcl_explosions.explode(pos, 3, { drop_chance = 1.0 }, player)
	minetest.set_node(pos, {name="air"})
end

function caballo_de_la_muerte(pos, player)
	minetest.add_entity(pos, "mobs_mc:skeleton_horse")
	minetest.set_node(pos, {name="air"})
end

function silverfish(pos, player)
	for i = 1, 3, 1 do
		minetest.add_entity(pos, "mobs_mc:silverfish")
	end
	minetest.set_node(pos, {name="air"})
end

function return_none(pos)
	return 0
end

function test_send_chat(pos)
	minetest.chat_send_all("nnnn")
end