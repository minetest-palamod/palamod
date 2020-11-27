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

--38
pala_luckyblock_positive = {
	{"Body Guard", 10, "pala_luckyblock_body_guard.png", body_guard},
	{"Wesh you're suck", 10, "pala_paladium_paladium_block.png", placefakepala},
	{"Pala-Pillone", 10, "pala_luckyblock_pala_pillone.png", pala_pillone},
	{"Fish and Chips", 20, "default_stone.png", test_send_chat},
	{"Well", 30, "default_stone.png", well},
	{"Ruée vers les minerais", 30, "default_stone.png", test_send_chat},
	{"Jimmy Hendyx", 50, "default_stone.png", test_send_chat},
	{"Mineral Shower", 50, "pala_luckyblock_mineral_shower.png", mineral_shower},
	{"Nose", 50, "default_stone.png", test_send_chat},
	{"SuperMan", 50, "default_stone.png", test_send_chat},
	{"Walk in Music", 50, "default_stone.png", test_send_chat},
	{"Wow Bg", 50, "pala_luckyblock_wow_bg.png", place_endium_piramid},
	{"Spawner", 100, "default_stone.png", test_send_chat},
	{"20 000 lieux", 150, "default_stone.png", test_send_chat},
	{"Analyste", 150, "default_stone.png", test_send_chat},
	{"Expala-osion", 150, "default_tnt_side.png^pala_paladium_paladium_ingot.png", expala_osion},
	{"Fake TNT", 100, "default_stone.png", test_send_chat},
	{"Hook hook jab", 150, "default_stone.png", test_send_chat},
	{"Pyrobarbare", 150, "default_stone.png", test_send_chat},
	{"Caballo de la muerte", 200, "default_stone.png", caballo_de_la_muerte},
	{"Diamond Beacon", 200, "default_stone.png", test_send_chat},
	{"Princesse", 200, "default_stone.png", test_send_chat},
	{"Amethyste Beacon", 400, "default_stone.png", test_send_chat},
	{"Endium Beacon", 400, "default_stone.png", test_send_chat},
	{"Fast Learner", 500, "default_stone.png", test_send_chat},
	{"Titane Beacon", 800, "default_stone.png", test_send_chat},
	{"Explosif", 900, "default_stone.png", explosif},
	{"T’es chanceux wesh", 900, "default_stone.png", test_send_chat},
	{"Base déco", 1000, "default_stone.png", test_send_chat},
	{"Deviens sourd", 1000, "default_stone.png", test_send_chat},
	{"Legendary Stone", 1000, "default_stone.png", get_legendary_stone},
	{"Rodshild", 1000, "default_stone.png", test_send_chat},
	{"Camouflage", 1200, "default_stone.png", test_send_chat},
	{"Paladium Beacon", 1200, "pala_luckyblock_pala_beacon.png", pala_beacon},
	{"Mega Fast Learner", 2400, "default_stone.png", test_send_chat},
	{"Téthanos", 5000, "default_stone.png", test_send_chat},
	{"Endium Grade", 10000, "default_stone.png", test_send_chat},
	{"Méga-Thétanos", 42500, "default_stone.png", test_send_chat},
}

--46
pala_luckyblock_negative = {
	{"BOOM", 20, "default_stone.png", test_send_chat},
	{"Enfermé", 20, "default_stone.png", test_send_chat},
	{"Geyser", 20, "pala_luckyblock_geyser.png", geyser},
	{"StarFish", 20, "pala_luckyblock_starfish.png", silverfish},
	{"Un peu de silence ne fait pas de mal", 20, "default_stone.png", test_send_chat},
	{"Boom", 30, "pala_luckyblock_boom.png", boom},
	{"C’est un traquenard !", 30, "default_stone.png", test_send_chat},
	{"Piggy Rodéo", 30, "default_stone.png", test_send_chat},
	{"Pssssssss", 30, "pala_luckyblock_psss.png", psss},
	{"Ruée vers les minerais", 30, "default_stone.png", test_send_chat},
	{"0 + 0 = La tête à Toto", 40, "default_stone.png", return_none},
	{"Allumer le feu", 40, "default_stone.png", test_send_chat},
	{"Instant break up", 40, "pala_tools_paladiumsword.png", instant_break},
	{"Sur la Lune", 40, "default_stone.png", test_send_chat},
	{"Zombie Hero", 40, "default_stone.png", test_send_chat},
	{"Batman nerveux", 50, "pala_luckyblock_batman_nerveux.png", batman_nerveux},
	{"Ghast dans l’âme", 50, "default_stone.png", test_send_chat},
	{"Gros relou", 50, "pala_luckyblock_gros_relou.png", return_none},
	{"Ne pas casser", 50, "pala_luckyblock_do_not_break.png", do_not_break},
	{"Spam TP", 50, "mcl_throwing_ender_pearl.png", spam_tp},
	{"Tout feu tout flamme", 50, "default_stone.png", test_send_chat},
	{"Victime", 50, "default_stone.png", test_send_chat},
	{"MEGABOOM", 70, "pala_luckyblock_megaboom.png", megaboom},
	{"ArachnoTrap", 80, "pala_luckyblock_arachnotrap.png", arachnotrap},
	{"ObsiTrap", 80, "default_stone.png", test_send_chat},
	{"On voit pas le fond du bol", 80, "default_stone.png", test_send_chat},
	{"Badaboum", 100, "default_stone.png", test_send_chat},
	{"Boom les mobs", 100, "default_stone.png", test_send_chat},
	{"High attitude", 100, "default_stone.png", test_send_chat},
	{"J’ai glissé chef", 100, "default_stone.png", test_send_chat},
	{"Nether activé !", 100, "default_stone.png", test_send_chat},
	{"One Shot", 100, "default_stone.png", test_send_chat},
	{"Titanesque", 100, "default_stone.png", test_send_chat},
	{"Carte au trésor", 200, "default_stone.png", test_send_chat},
	{"Carte au trésor “2”", 200, "default_stone.png", test_send_chat},
	{"Hasta la vista", 200, "default_stone.png", hasta_la_vista},
	{"Reflexe", 200, "default_stone.png", test_send_chat},
	{"La mort ou…", 500, "default_stone.png", test_send_chat},
	{"Paladin", 500, "pala_tools_paladiumsword.png", test_send_chat},
	{"La dirt, c’est bien", 1000, "default_stone.png", test_send_chat},
	{"T ki ?", 1000, "default_stone.png", test_send_chat},
	{"Triforce", 1000, "default_stone.png", test_send_chat},
	{"Good Bye have a great time!", 2000, "default_stone.png", test_send_chat},
	{"Silence, ça tourne", 2000, "default_stone.png", test_send_chat},

}

pala_luckyblock_positive_somme = 0
for k, v in pairs(pala_luckyblock_positive) do
	local inverse = 1/v[2]
	pala_luckyblock_positive_somme = pala_luckyblock_positive_somme + inverse
	v[2] = inverse
end

pala_luckyblock_negative_somme = 0
for k, v in pairs(pala_luckyblock_negative) do
	local inverse = 1/v[2]
	pala_luckyblock_negative_somme = pala_luckyblock_negative_somme + inverse
	v[2] = inverse
end


pala_luckyblock_all = {unpack(pala_luckyblock_positive)}
for I = 1,#pala_luckyblock_negative do
    pala_luckyblock_all[#pala_luckyblock_positive+I] = pala_luckyblock_negative[I]
end



local function get_random_positive()
	local rnd = randomFloat(0, pala_luckyblock_positive_somme)
	--minetest.chat_send_all(tostring(rnd))
	local somme = 0
	local hit = nil
	for k, v in pairs(pala_luckyblock_positive) do
		somme = somme + v[2]
		--minetest.chat_send_all(tostring(somme))
		hit = k
		if rnd < somme then
			break
		end 
	end
	return pala_luckyblock_positive[hit]
end

local function get_random_all()
	local rnd = randomFloat(0, pala_luckyblock_positive_somme + pala_luckyblock_negative_somme)
	local somme = 0
	local hit = nil
	for k, v in pairs(pala_luckyblock_all) do
		somme = somme + v[2]
		hit = k
		if rnd < somme then
			break
		end 
	end
	--WARNING
	return pala_luckyblock_all[2]
end

local function get_random_img(nb)
	local rnd = math.random(1,nb)
	return pala_luckyblock_all[rnd][3]
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
		local nimg = 82
		--minetest.chat_send_all(get_random_img())
		local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..get_random_img(nimg)..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..get_random_img(nimg)..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..get_random_img(nimg)..";img3;;false;true;]",
			"button[1,9;10,1.5;event;Event]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]",
			"button[13,7;3,1;open;Open]",
			"image[1,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..get_random_img(nimg).."]"})
		local meta = minetest.get_meta(pos)
        meta:set_string("formspec", form2)
	end,
	--on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		--local name = player:get_player_name()
		--local form = "formspec_version[3]size[16,10]image_button[1,4;2,2;blank.png;img1;;false;true;]image_button[5,4;2,2;blank.png;img2;;false;true;]image_button[9,4;2,2;blank.png;;;false;true;]button[1,8;10,1.5;event;Event]label[6,1;Lucky Block]image[13,4;2,2;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]button[13,8;2,1;Open;Open]"
		--minetest.show_formspec(name, "palaluckyblock", form2)
		--minetest.set_node(pos, {name="air"})
	--end,
	on_receive_fields = function(pos, formname, fields, player)
        if fields.open then
			local nimg = 82
			local randoma = get_random_all()
			local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..randoma[3]..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..randoma[3]..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..randoma[3]..";;;false;true;]",
			"button[1,9;10,1.5;event;"..randoma[1].."]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]",
			"image[1,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..get_random_img(nimg).."]"})
            minetest.show_formspec(player:get_player_name(), "palaluckyblock_confirm", form2)
			minetest.after(2, function()
				minetest.set_node(pos, {name="air"})
				local func = randoma[4]
				func(pos, player)
			end)
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
	after_place_node = function(pos, placer)
		local nimg = 43
		--minetest.chat_send_all(get_random_img())
		local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..get_random_img(nimg)..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..get_random_img(nimg)..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..get_random_img(nimg)..";img3;;false;true;]",
			"button[1,9;10,1.5;event;Event]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png]",
			"button[13,7;3,1;open;Open]",
			"image[1,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..get_random_img(nimg).."]"})
		local meta = minetest.get_meta(pos)
        meta:set_string("formspec", form2)
	end,
	on_receive_fields = function(pos, formname, fields, player)
        if fields.open then
			local nimg = 43
			local randomp = get_random_positive()
			local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..randomp[3]..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..randomp[3]..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..randomp[3]..";;;false;true;]",
			"button[1,9;10,1.5;event;"..randomp[1].."]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png]",
			"image[1,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..get_random_img(nimg).."]"})
            minetest.show_formspec(player:get_player_name(), "palaluckyblock_confirm", form2)
			minetest.after(2, function()
				minetest.set_node(pos, {name="air"})
				local func = randomp[4]
				func(pos, player)
			end)
        end

        print(fields.x)
    end,
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})