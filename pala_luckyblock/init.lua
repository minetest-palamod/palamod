pala_luckyblock = {}
--Fake pala
local function placefakepala(pos)
	local x = math.random(pos.x-10,pos.x+10)
	local z = math.random(pos.z-10,pos.z+10)
	--local list = minetest.find_nodes_in_area(pos.x-10, pos2, { "default:mese" })
	if minetest.get_node({x, pos.y, z}).name == "air" then
		minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)

	end

end

local function place_endium_piramid(pos)
	local x = pos.x-2
	--local list = minetest.find_nodes_in_area(pos.x-10, pos2, { "default:mese" })
	if minetest.get_node({x, pos.y, z}).name == "air" then
		minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(x..pos.y..z)
	minetest.chat_send_all(minetest.get_node({x, pos.y, z}).name)

	end

end

minetest.register_node("pala_luckyblock:fakepaladiumblock", {
	description = ("Fake Block of Paladium"),
	_doc_items_longdesc = ("Strange Block"),
	tiles = {"pala_paladium_paladium_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	after_dig_node = function(pos, node, player)
		placefakepala(pos)
	end,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_node("pala_luckyblock:luckyblockpaladium", {
	description = ("Paladium LuckyBlock"),
	_doc_items_longdesc = ("Paladium LuckyBlock"),
	tiles = {"pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local name = player:get_player_name()
		local form = "formspec_version[3]size[16,10]image_button[1,4;2,2;blank.png;img1;;false;true;]image_button[5,4;2,2;blank.png;img2;;false;true;]image_button[9,4;2,2;blank.png;;;false;true;]button[1,8;10,1.5;event;Event]label[6,1;Lucky Block]image[13,4;2,2;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]button[13,8;2,1;Open;Open]"
		local form2 = """
			formspec_version[3]
			size[17,11]
			image_button[1,4;2,2;blank.png;img1;;false;true;]
			image_button[5,4;2,2;blank.png;img2;;false;true;]
			image_button[9,4;2,2;blank.png;;;false;true;]
			button[1,9;10,1.5;event;Event]
			label[6,1;Lucky Block]
			image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]
			button[13,7;3,1;Open;Open]
			image[1,6;2,2;]
			image[5,6;2,2;]
			image[9,6;2,2;]
			image[1,2;2,2;]
			image[5,2;2,2;]
			image[9,2;2,2;]
		minetest.show_formspec(name, "palaluckyblock", form)
		minetest.set_node(pos, {name="air"})
	end,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_node("pala_luckyblock:luckyblockendium", {
	description = ("Endium LuckyBlock"),
	_doc_items_longdesc = ("Endium LuckyBlock"),
	tiles = {"pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local name = player:get_player_name()
		local form = "formspec_version[3]size[16,10]image_button[1,4;2,2;blank.png;img1;;false;true;]image_button[5,4;2,2;blank.png;img2;;false;true;]image_button[9,4;2,2;blank.png;;;false;true;]button[1,8;10,1.5;event;Event]label[6,1;Lucky Block]image[13,4;2,2;pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png]button[13,8;2,1;Open;Open]"
		minetest.show_formspec(name, "endiumluckyblock", form)
		minetest.set_node(pos, {name="air"})
	end,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})