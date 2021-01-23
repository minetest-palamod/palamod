local S
if minetest.get_translator ~= nil then
    S = minetest.get_translator(minetest.get_current_modname())
else
    S = function(str)
        return(str)
    end
end

pala_luckyblock = {}
pala_luckyblock.modpath = minetest.get_modpath("pala_luckyblock")

dofile(pala_luckyblock.modpath.."/node.lua")

function pala_luckyblock.wip_event(pos, player)
	minetest.chat_send_player(player:get_player_name(), minetest.colorize("#fc4b4b", "This event is WIP"))
end

pala_luckyblock.minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}
--60
pala_luckyblock.event_positive = {
	{"Body Guard", 10, "pala_luckyblock_body_guard.png", function(pos, player)
		local name = player:get_player_name()
		for i = 1, 2, 1 do
			local idx = minetest.add_entity(pos, "mobs_mc:iron_golem")
			if idx then
				idx:set_nametag_attributes({text = name.."'s BodyGuard"})
			end
			minetest.chat_send_player(name, minetest.colorize("#13ced8", "To serve you !"))
		end
	end},
	{"Wesh you're suck", 10, "pala_paladium_paladium_block.png", function(pos, player)
		minetest.set_node(player:get_pos(), "pala_luckyblock:fakepaladiumblock")
	end},
	{"Pala-Pillone", 10, "pala_luckyblock_pala_pillone.png", function(pos, player)
		local name = player:get_player_name()
		for i = 0, 8, 1 do
			local bpos = {x = pos.x, y = pos.y + i, z = pos.z}
			if not minetest.is_protected(bpos, name) then
				local test = minetest.set_node(bpos, {name="pala_paladium:paladiumblock"})
			end
		end
	end},
	{"Fish and Chips", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Bow in armor", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Colorful Lamp", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Hunter Plant", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Picasso", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Well", 30, "default_stone.png", function(pos, player)
		minetest.after(3, function()
			minetest.set_node(pos, {name="mcl_core:obsidian"})
			lightning.strike(pos)
			for i = 1, 10, 1 do
				local rnd = math.random(1, 5)
				minetest.add_item(pos, pala_luckyblock.minerallist[rnd])
			end
		end)
	end},
	{"To infinity and beyond", 30, "default_stone.png", pala_luckyblock.wip_event},
	{"Ruée vers les minerais", 30, "default_stone.png", pala_luckyblock.wip_event},
	{"Jimmy Hendyx", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"Mineral Shower", 50, "pala_luckyblock_mineral_shower.png", function(pos, player)
		local drop_pos = {x=pos.x, y=pos.y+3, z=pos.z}
		minetest.set_node(pos, {name="pala_paladium:paladiumblock"})
		for i = 0, 8, 1 do
			local rndpos = math.random(1, 2)
			local drop_pos = {x=pos.x+rndpos, y=pos.y+3+rndpos, z=pos.z+rndpos}
			minetest.add_item(drop_pos, itemlist[math.random(1, 5)])
		end
	end},
	{"Nose", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"SuperMan", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"Walk in Music", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"What a madness !", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"Pretty TNT", 50, "default_stone.png", pala_luckyblock.wip_event},
	--[[{"Wow Bg", 50, "pala_luckyblock_wow_bg.png", function(pos, player)
		minetest.place_schematic({x=pos.x-2,y=pos.y,z=pos.z-2}, minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_endium_piramid.mts", 0, nil, true)
	end},]]
	{"Spawner", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"Consolation", 100, "default_stone.png", function(pos, player)
		minetest.after(1, function()
			for i = 1,  math.floor(64 * math.random(0.5, 2)), 1 do
				minetest.add_item(pos, {"pala_paladium:paladium_ingot"})
			end
		end)
	end},
	{"Wither Head", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"20 000 lieux", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Analyste", 150, "pala_luckyblock_analyste.png", pala_luckyblock.wip_event},
	{"Expala-osion", 150, "default_tnt_side.png^pala_paladium_paladium_ingot.png", function(pos, player)
		minetest.after(2, function()
			for i = 1, 64*2, 1 do
				local pos2 = {x=pos.x+math.random(-5, 5),y=pos.y+3,z=pos.z+math.random(-5, 5)}
				minetest.add_item(pos2, {"pala_paladium:paladium_ingot"})
			end
		end)
	end},
	{"Fake TNT", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"Hook hook jab", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Lasso", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Roller", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Fly me", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Magical Potion", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Wi-Fi", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Pyrobarbare", 150, "default_stone.png", pala_luckyblock.wip_event},
	{"Caballo de la muerte", 200, "default_stone.png", function(pos, player)
		minetest.add_entity(pos, "mobs_mc:skeleton_horse")
	end},
	{"Diamond Beacon", 200, "default_stone.png", pala_luckyblock.wip_event},
	{"Princesse", 200, "default_stone.png", pala_luckyblock.wip_event},
	{"Coloring", 200, "default_stone.png", pala_luckyblock.wip_event},
	{"Palachat", 300, "default_stone.png", pala_luckyblock.wip_event},
	{"Biome Painter", 300, "default_stone.png", pala_luckyblock.wip_event},
	{"Amethyste Beacon", 400, "default_stone.png", pala_luckyblock.wip_event},
	{"Endium Beacon", 400, "default_stone.png", pala_luckyblock.wip_event},
	{"Fast Learner", 500, "default_stone.png", pala_luckyblock.wip_event},
	{"Titane Beacon", 800, "default_stone.png", pala_luckyblock.wip_event},
	{"Explosif", 900, "default_stone.png", function(pos, player)
		minetest.set_node(pos, {name="mcl_core:obsidian"})
		minetest.add_item(pos, "mcl_core:stone") --TODO:replace stone by endium dyna
	end},
	{"T’es chanceux wesh", 900, "default_stone.png", pala_luckyblock.wip_event},
	{"Base déco", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Less pretty TNT", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Be deaf", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Deviens sourd", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Legendary StF", 1000, "default_stone.png", function(pos, player)
		minetest.add_item(pos, "pala_legendary:legendary_random")
	end},
	{"Rodshild", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Camouflage", 1200, "default_stone.png", pala_luckyblock.wip_event},
	{"Paladium Beacon", 1200, "pala_luckyblock_pala_beacon.png", function(pos, player)
		--TODO:add beacon
		minetest.place_schematic({x=pos.x-3,y=pos.y,z=pos.z-3}, minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_paladiumbeacon.mts", 0, nil, true)
	end},
	{"Mega Fast Learner", 2400, "default_stone.png", pala_luckyblock.wip_event},
	{"Inevitable", 5000, "default_stone.png", pala_luckyblock.wip_event},
	{"+ Money", 5000, "default_stone.png", pala_luckyblock.wip_event},
	--{"Téthanos", 5000, "default_stone.png", pala_luckyblock.wip_event},
	{"Endium Grade", 10000, "default_stone.png", pala_luckyblock.wip_event},
	{"Wuzzyyyy/AFCMMMMMMMMMMMMS", 10000, "default_stone.png", pala_luckyblock.wip_event},
	--{"Méga-Thétanos", 42500, "default_stone.png", pala_luckyblock.wip_event},
	{"Big Inevitable", 12500, "pala_luckyblock_mega_ineluctable.png", function(pos, player)
		if player:get_inventory():add_item("main", {name="pala_legendary:endium_gauntlet", count=1}) then
			return
		else 
			minetest.add_item(pos, "pala_legendary:endium_gauntlet")
			return
		end
	end},
}

--46
pala_luckyblock.event_negative = {
	{"BOOM", 20, "default_stone.png", function(pos, player)
		mcl_explosions.explode(pos, 3, { drop_chance = 1.0 }, player)
		minetest.set_node(pos, {name="air"})
	end},
	{"Enfermé", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Geyser", 20, "pala_luckyblock_geyser.png", function(pos, player)
		--TODO: water particules
		player:add_player_velocity({x=0,y=30,z=0})
	end},
	{"StarFish", 20, "pala_luckyblock_starfish.png", function(pos, player)
		for i = 1, 3, 1 do
			minetest.add_entity(pos, "mobs_mc:silverfish")
		end
	end},
	{"Un peu de silence ne fait pas de mal", 20, "default_stone.png", pala_luckyblock.wip_event},
	{"Boom", 30, "pala_luckyblock_boom.png", boom},
	{"C’est un traquenard !", 30, "default_stone.png", pala_luckyblock.wip_event},
	{"Piggy Rodéo", 30, "default_stone.png", pala_luckyblock.wip_event},
	{"Pssssssss", 30, "pala_luckyblock_psss.png", function(pos, player)
		for i = 1, 4, 1 do
			minetest.add_entity(pos, "mobs_mc:creeper") --TODO:custom creeper
		end
	end},
	{"Ruée vers les minerais", 30, "default_stone.png", pala_luckyblock.wip_event},
	{"0 + 0 = La tête à Toto", 40, "default_stone.png", function(pos, player)
		mcl_experience.set_player_xp_level(player, 0)
	end},
	{"Allumer le feu", 40, "default_stone.png", pala_luckyblock.wip_event},
	{"Instant break up", 40, "pala_luckyblock_instant_break_up.png", function(pos, player)
		local inv = player:get_inventory()
		local stackname = inv:get_stack("main", 1):get_name()
		inv:remove_item("main", 1)
		minetest.chat_send_player(player:get_player_name(), "It seems to me you had a "..minetest.colorize("#44c8fc", stackname)) --TODO:make it work
	end},
	{"Sur la Lune", 40, "default_stone.png", pala_luckyblock.wip_event},
	{"Zombie Hero", 40, "default_stone.png", pala_luckyblock.wip_event},
	{"Batman nerveux", 50, "pala_luckyblock_batman_nerveux.png", function(pos, player)
		for i = 1, 20, 1 do
			minetest.add_entity(pos, "mobs_mc:bat")
		end
	end},
	{"Ghast dans l’âme", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"Gros relou", 50, "pala_luckyblock_gros_relou.png", return_none},
	{"Ne pas casser", 50, "pala_luckyblock_do_not_break.png", function(pos, player)
		local playerpos = player:get_pos()
		minetest.place_schematic({x=playerpos.x-5,y=playerpos.y-1,z=playerpos.z-5}, minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_ne_pas_casser.mts", 0, nil, true)
	end},
	{"Spam TP", 50, "mcl_throwing_ender_pearl.png", function(pos, player)
		local playerpos = player:get_pos()
		minetest.after(10, function()
			player:set_pos({x=playerpos.x,y=playerpos.y+200,z=playerpos.z})
		end)
	end},
	{"Tout feu tout flamme", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"Victime", 50, "default_stone.png", pala_luckyblock.wip_event},
	{"MEGABOOM", 70, "pala_luckyblock_megaboom.png", function(pos, player)
		mcl_explosions.explode(pos, 10, { drop_chance = 1.0 }, player)
	end},
	{"ArachnoTrap", 80, "pala_luckyblock_arachnotrap.png", function(pos, player)
		local playerpos = player:get_pos()
		minetest.place_schematic({x=playerpos.x-1,y=playerpos.y-6,z=playerpos.z-1}, minetest.get_modpath("pala_luckyblock") .. "/schematics/pala_luckyblock_arachnotrap.mts", 0, nil, true)
		for i = 1, 6, 1 do
			minetest.add_entity(playerpos, "mobs_mc:cave_spider")
		end
	end},
	{"ObsiTrap", 80, "default_stone.png", pala_luckyblock.wip_event},
	{"On voit pas le fond du bol", 80, "default_stone.png", pala_luckyblock.wip_event},
	{"Badaboum", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"Boom les mobs", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"High attitude", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"J’ai glissé chef", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"Nether activé !", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"One Shot", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"Titanesque", 100, "default_stone.png", pala_luckyblock.wip_event},
	{"Carte au trésor", 200, "default_stone.png", pala_luckyblock.wip_event},
	{"Carte au trésor “2”", 200, "default_stone.png", pala_luckyblock.wip_event},
	{"Hasta la vista", 200, "default_stone.png", function(pos, player)
		local name = player:get_player_name()
		minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Malheureusement nous allons nous quitter d'ici 5 secondes"))
		minetest.after(1, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Content d'avoir passé du temp avec toi"))end)
		minetest.after(2, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Plus que 3 secondes :("))end)
		minetest.after(3, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Plus que 2 secondes :("))end)
		minetest.after(4, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "T'es encore là ?"))end)
		minetest.after(5, function() minetest.chat_send_player(name,minetest.colorize("#fcfc6f", "[LuckyBlock]").." "..minetest.colorize("#fc4a32", "Bye bye..."))end)
		minetest.after(6, function() minetest.kick_player(name,"Crash")end)
	end},
	{"Reflexe", 200, "default_stone.png", pala_luckyblock.wip_event},
	{"La mort ou…", 500, "default_stone.png", pala_luckyblock.wip_event},
	{"Paladin", 500, "pala_tools_paladiumsword.png", pala_luckyblock.wip_event},
	{"La dirt, c’est bien", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"T ki ?", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Triforce", 1000, "default_stone.png", pala_luckyblock.wip_event},
	{"Good Bye have a great time!", 2000, "default_stone.png", pala_luckyblock.wip_event},
	{"Silence, ça tourne", 2000, "default_stone.png", pala_luckyblock.wip_event},

}

pala_luckyblock.positive_somme = 0
for k, v in pairs(pala_luckyblock.event_positive) do
	local inverse = 1/v[2]
	pala_luckyblock.positive_somme = pala_luckyblock.positive_somme + inverse
	v[2] = inverse
end

pala_luckyblock.negative_somme = 0
for k, v in pairs(pala_luckyblock.event_negative) do
	local inverse = 1/v[2]
	pala_luckyblock.negative_somme = pala_luckyblock.negative_somme + inverse
	v[2] = inverse
end


pala_luckyblock.event_all = {unpack(pala_luckyblock.event_positive)}
for I = 1,#pala_luckyblock.event_negative do
    pala_luckyblock.event_all[#pala_luckyblock.event_positive+I] = pala_luckyblock.event_negative[I]
end



function pala_luckyblock.get_random_positive()
	local rnd = randomFloat(0, pala_luckyblock.positive_somme)
	--minetest.chat_send_all(tostring(rnd))
	local somme = 0
	local hit = nil
	for k, v in pairs(pala_luckyblock.event_positive) do
		somme = somme + v[2]
		--minetest.chat_send_all(tostring(somme))
		hit = k
		if rnd < somme then
			break
		end 
	end
	return pala_luckyblock.event_positive[hit]
end

function pala_luckyblock.get_random_all()
	local rnd = randomFloat(0, pala_luckyblock.positive_somme + pala_luckyblock.negative_somme)
	local somme = 0
	local hit = nil
	for k, v in pairs(pala_luckyblock.event_all) do
		somme = somme + v[2]
		hit = k
		if rnd < somme then
			break
		end 
	end
	--WARNING
	return pala_luckyblock.event_all[hit]
end

function pala_luckyblock.get_random_img(nb)
	local rnd = math.random(1,nb)
	return pala_luckyblock.event_all[rnd][3]
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
			"image_button[1,4;1.9,1.9;"..pala_luckyblock.get_random_img(nimg)..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..pala_luckyblock.get_random_img(nimg)..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..pala_luckyblock.get_random_img(nimg)..";img3;;false;true;]",
			"button[1,9;10,1.5;event;Event]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]",
			"button[13,7;3,1;open;Open]",
			"image[1,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]"})
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
			local target_all = pala_luckyblock.get_random_all()
			local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..target_all[3]..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..target_all[3]..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..target_all[3]..";;;false;true;]",
			"button[1,9;10,1.5;event;"..target_all[1].."]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_paladium_block.png^pala_luckyblock_luckyblock.png]",
			"image[1,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]"})
            minetest.show_formspec(player:get_player_name(), "palaluckyblock_confirm", form2)
			minetest.after(2, function()
				minetest.set_node(pos, {name="air"})
				target_all[4](pos, player)
			end)
        end
        --print(fields.x)
    end,
	_mcl_blast_resistance = 1200,
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
			"image_button[1,4;1.9,1.9;"..pala_luckyblock.get_random_img(nimg)..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..pala_luckyblock.get_random_img(nimg)..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..pala_luckyblock.get_random_img(nimg)..";img3;;false;true;]",
			"button[1,9;10,1.5;event;Event]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png]",
			"button[13,7;3,1;open;Open]",
			"image[1,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]"})
		local meta = minetest.get_meta(pos)
        meta:set_string("formspec", form2)
	end,
	on_receive_fields = function(pos, formname, fields, player)
        if fields.open then
			local nimg = 43
			local target_positive = get_random_positive()
			local form2 = table.concat({
			"formspec_version[3]",
			"size[17,11]",
			"image_button[1,4;1.9,1.9;"..target_positive[3]..";img1;;false;true;]",
			"image_button[5,4;1.9,1.9;"..target_positive[3]..";img2;;false;true;]",
			"image_button[9,4;1.9,1.9;"..target_positive[3]..";;;false;true;]",
			"button[1,9;10,1.5;event;"..target_positive[1].."]",
			"label[6,1;Lucky Block]",
			"image[13,3;3,3;pala_paladium_endium_block.png^pala_luckyblock_luckyblock.png]",
			"image[1,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,6;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[1,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[5,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]",
			"image[9,2;1.9,1.9;"..pala_luckyblock.get_random_img(nimg).."]"})
            minetest.show_formspec(player:get_player_name(), "palaluckyblock_confirm", form2)
			minetest.after(2, function()
				minetest.set_node(pos, {name="air"})
				target_positive[4](pos, player)
			end)
        end

        --print(fields.x)
    end,
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 5,
})