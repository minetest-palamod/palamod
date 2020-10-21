function sleep(s)
  local ntime = os.time() + s
  repeat until os.time() > ntime
end

function randomFloat(lower, greater)
    return lower + math.random()  * (greater - lower);
end

function placefakepala(pos, player)
	local x = math.random(pos.x-10,pos.x+10)
	local z = math.random(pos.z-10,pos.z+10)
	--local list = minetest.find_nodes_in_area(pos.x-10, pos2, { "default:mese" })
	if minetest.get_node({x, pos.y, z}).name == "air" then
		minetest.chat_send_all(x..pos.y..z)
	end
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)
end

function place_endium_piramid(pos, player)
	local x = pos.x-2
	--local list = minetest.find_nodes_in_area(pos.x-10, pos2, { "default:mese" })
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)
end

function well(pos, player)
	local itemlist = {
		"pala_paladium:paladium_ingot",
		"pala_paladium:titanium_ingot",
		"pala_paladium:ametyst_ingot",
		"mcl_core:gold_ingot",
		"mcl_core:steel_ingot"
	}
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
	if not minetest.is_protected(pos, player:get_player_name()) then
		minetest.set_node(pos, {name="air"})
	end
end

function return_none(pos)
	return 0
end

function test_send_chat(pos)
	minetest.chat_send_all("nnnn")
end