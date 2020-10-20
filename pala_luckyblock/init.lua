pala_luckyblock = {}
pala_luckyblock.modpath = minetest.get_modpath("pala_luckyblock")
dofile(pala_luckyblock.modpath.."/function.lua")
dofile(pala_luckyblock.modpath.."/node.lua")
--require "posix"

local S

if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end

pala_luckyblock_positive = {
	{"Body Guard", 10, "pala_luckyblock_body_guard.png", body_guard},
	{"Wesh you're suck", 10, "default_stone.png", test_send_chat},
	{"Pala-Pillone", 10, "pala_luckyblock_pala_pillone.png", test_send_chat},
	{"Fish and Chips", 20, "default_stone.png", test_send_chat},
	{"Well", 30, "default_stone.png", well},
	{"Ruée vers les minerais", 30, "default_stone.png", test_send_chat},
	{"Jimmy Hendyx", 50, "default_stone.png", test_send_chat},
	{"Mineral Shower", 50, "default_stone.png", test_send_chat},
	{"Nose", 50, "default_stone.png", test_send_chat},
	{"SuperMan", 50, "default_stone.png", test_send_chat},
	{"Walk in Music", 50, "default_stone.png", test_send_chat},
	{"Wow Bg", 50, "default_stone.png", test_send_chat},
	{"Spawner", 100, "default_stone.png", test_send_chat},
	{"20 000 lieux", 150, "default_stone.png", test_send_chat},
	{"Analyste", 150, "default_stone.png", test_send_chat},
	{"Expala-osion", 150, "default_stone.png", test_send_chat},
	{"Fake TNT", 100, "default_stone.png", test_send_chat},
}


local function get_random_positive()
	local rnd = randomFloat(0,1)
	minetest.chat_send_all(tostring(rnd))
	local somme = 0
	for k, v in pairs(pala_luckyblock_positive) do
		local inverse = 1/v[2]
		--local somme += inverse
	end
	for k, v in pairs(pala_luckyblock_positive) do
		local inverse = 1/v[2]
		--local cumul = 
		minetest.chat_send_all("test @0", tostring(v[1]))
		local d = tostring(v[1])
	end
	return pala_luckyblock_positive[1]
end

local function get_random_img()
	local rnd = math.random(1,6)
	return pala_luckyblock_positive[rnd][3]
end

minetest.register_node("pala_luckyblock:luckyblockpaladium", {
	description = ("Paladium LuckyBlock"),
	_doc_items_longdesc = ("Paladium LuckyBlock"),
	tiles = {"pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	after_place_node = function(pos, placer)
		--minetest.chat_send_all(get_random_img())
		local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..get_random_img()..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..get_random_img()..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..get_random_img()..";img3;;false;true;]",
			"button[1,9;10,1.5;event;Event]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]",
			"button[13,7;3,1;open;Open]",
			"image[1,6;1.9,1.9;"..get_random_img().."]",
			"image[5,6;1.9,1.9;"..get_random_img().."]",
			"image[9,6;1.9,1.9;"..get_random_img().."]",
			"image[1,2;1.9,1.9;"..get_random_img().."]",
			"image[5,2;1.9,1.9;"..get_random_img().."]",
			"image[9,2;1.9,1.9;"..get_random_img().."]"})
		local meta = minetest.get_meta(pos)
        meta:set_string("formspec", form2)
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		--local name = player:get_player_name()
		--local form = "formspec_version[3]size[16,10]image_button[1,4;2,2;blank.png;img1;;false;true;]image_button[5,4;2,2;blank.png;img2;;false;true;]image_button[9,4;2,2;blank.png;;;false;true;]button[1,8;10,1.5;event;Event]label[6,1;Lucky Block]image[13,4;2,2;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]button[13,8;2,1;Open;Open]"
		--minetest.show_formspec(name, "palaluckyblock", form2)
		--minetest.set_node(pos, {name="air"})
	end,
	on_receive_fields = function(pos, formname, fields, player)
        if fields.open then
			local randomp = get_random_positive()
			local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..randomp[3]..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..randomp[3]..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..randomp[3]..";;;false;true;]",
			"button[1,9;10,1.5;event;"..randomp[1].."]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]",
			"image[1,6;1.9,1.9;"..get_random_img().."]",
			"image[5,6;1.9,1.9;"..get_random_img().."]",
			"image[9,6;1.9,1.9;"..get_random_img().."]",
			"image[1,2;1.9,1.9;"..get_random_img().."]",
			"image[5,2;1.9,1.9;"..get_random_img().."]",
			"image[9,2;1.9,1.9;"..get_random_img().."]"})
            minetest.show_formspec(player:get_player_name(), "palaluckyblock_confirm", form2)
			sleep(3)
			local func = randomp[4]
			func(pos, player)
			return
        end

        print(fields.x)
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