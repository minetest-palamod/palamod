local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local modpath = minetest.get_modpath(minetest.get_current_modname())

--Cache often used functions for better performances
local math = math
local table = table

--Utility function used to give player an item
local function give_item(player, item)
	if player:get_inventory():add_item("main", item) then
		return
	else
		minetest.add_item(player:get_pos(), item)
		return
	end
end

--list of availlable spawners (for the 'spawner' event)
local mobs = {
	"mobs_mc:zombie",
	"mobs_mc:witch",
	"mobs_mc:spider",
	"mobs_mc:skeleton",
}

--List of availlable minerals
pala_luckyblock.minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}

--Fallback function for WIP events
function pala_luckyblock.wip_event(pos, player)
	minetest.chat_send_player(player:get_player_name(), C(mcl_colors.RED, S("This event is WIP")))
end

--EVENTS DEFINITION
pala_luckyblock.event_positive = {
	{
		name = "body-guard",
		description = S("Body Guard"),
		rarity = 10,
		texture = "pala_luckyblock_body_guard.png",
		func = function(pos, player)
			local name = player:get_player_name()
			for i = 1, 2 do
				local idx = minetest.add_entity(pos, "mobs_mc:iron_golem")
				if idx then
					idx:set_nametag_attributes({text = name.."'s BodyGuard"})
				end
				minetest.chat_send_player(name, C(mcl_colors.BLUE, S("To serve you!")))
			end
		end,
	},
	{
		name = "wesh-you-suck",
		description = S("Wesh you're suck"),
		rarity = 10,
		texture = "pala_paladium_paladium_block.png",
		func = function(pos, player)
			minetest.set_node(pos, {name="pala_luckyblock:fakepaladiumblock"})
		end,
	},
	{
		name = "paladium-tower",
		description = S("Paladium Tower"),
		rarity = 10,
		texture = "pala_luckyblock_pala_pillone.png",
		func = function(pos, player)
			if not minetest.is_protected(pos, player:get_player_name()) then --assuming chunk based protection
				local poslist = {}
				for i = 0, 8, 1 do
					table.insert(poslist, {x = pos.x, y = pos.y + i, z = pos.z})
				end
				minetest.bulk_set_node(poslist, {name="pala_paladium:paladiumblock"})
			end
		end,
	},
	{
		name = "fish-and-chips",
		description = S("Fish and Chips"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "bow-in-armor",
		description = S("Bow in armor"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "colorful-lamp",
		description = S("Colorful Lamp"),
		rarity = 20,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.add_item(pos, "pala_decoblock:colored_lamp 16")
		end,
	},
	{
		name = "hunter-plant",
		description = S("Hunter Plant"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "picasso",
		description = S("Picasso"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "well",
		description = S("Well"),
		rarity = 30,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.set_node(pos, {name="mcl_core:obsidian"})
			lightning.strike(pos)
			for i = 1, 10, 1 do
				local rnd = math.random(1, 5)
				minetest.add_item(pos, pala_luckyblock.minerallist[rnd])
			end
		end,
	},
	{
		name = "to-infinity-and-beyond",
		description = S("To infinity and beyond"),
		rarity = 30,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "rush-to-the-minerals",
		description = S("Rush to the minerals"),
		rarity = 30,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "jimmy-hendyx",
		description = S("Jimmy Hendyx"),
		rarity = 50,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "mineral-shower",
		description = S("Mineral Shower"),
		rarity = 50,
		texture = "pala_luckyblock_mineral_shower.png",
		func = function(pos, player)
			minetest.set_node(pos, {name="pala_paladium:paladiumblock"})
			for i = 0, 8, 1 do
				local rndpos = math.random(1, 2)
				local drop_pos = {x = pos.x + rndpos, y = pos.y + 3 + rndpos, z = pos.z + rndpos}
				minetest.add_item(drop_pos, pala_luckyblock.minerallist[math.random(1, #pala_luckyblock.minerallist)])
			end
		end,
	},
	{
		name = "nose",
		description = S("Nose"),
		rarity = 50,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "superman",
		description = S("SuperMan"),
		rarity = 50,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "walk-in-music",
		description = S("Walk in Music"),
		rarity = 50,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "what-a-madness",
		description = S("What a madness !"),
		rarity = 50,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.place_schematic({x=pos.x-1, y=pos.y, z=pos.z-1},
				modpath .. "/schematics/pala_luckyblock_endium_piramid.mts", 0, nil, true)
		end,
	},
	{
		name = "pretty-tnt",
		description = S("Pretty TNT"),
		rarity = 50,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "spawner",
		description = S("Spawner"),
		rarity = 100,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.set_node(pos, {name="mcl_mobspawners:spawner"})
			mcl_mobspawners.setup_spawner(pos, mobs[math.random(1, #mobs)], 0, 7)
		end,
	},
	{
		name = "consolation",
		description = S("Consolation"),
		rarity = 100,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.after(1, function()
				minetest.add_item(pos, {name="pala_paladium:paladium_ingot", count=math.floor(64 * math.random(0.5, 2))})
			end)
		end,
	},
	{
		name = "wither-head",
		description = S("Wither Head"),
		rarity = 100,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "20000-places",
		description = S("20 000 places"),
		rarity = 150,
		texture = "default_stone.png",
		func = function(pos, player)
			give_item(player, "pala_armor:boots_weighted")
		end,
	},
	{
		name = "analyser",
		description = S("Analyser"),
		rarity = 150,
		texture = "pala_luckyblock_analyste.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "pala-explosion",
		description = S("Paladium explosion"),
		rarity = 150,
		texture = "default_tnt_side.png^pala_paladium_paladium_ingot.png",
		func = function(pos, player)
			minetest.after(2, function()
				for i = 1, 64*2, 1 do
					local pos2 = {x=pos.x+math.random(-5, 5), y=pos.y+3, z=pos.z+math.random(-5, 5)}
					minetest.add_item(pos2, {"pala_paladium:paladium_ingot"})
				end
			end)
		end,
	},
	{
		name = "fake-tnt",
		description = S("Fake TNT"),
		rarity = 100,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "hook-hook-jab",
		description = S("Hook hook jab"),
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "lead",
		description = S("Lead"),
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "roller",
		description = S("Roller"),
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "fly-me",
		description = S("Fly me"), --TODO: french translation?
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "magical-potion",
		description = S("Magical Potion"),
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "wifi",
		description = S("Wi-Fi"),
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "incendiary",
		description = S("Incendiary"),
		rarity = 150,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "horse-of-the-death",
		description = S("The Horse of the death"),
		rarity = 200,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.add_entity(pos, "mobs_mc:skeleton_horse")
		end,
	},
	{
		name = "diamond-beacon",
		description = S("Diamond Beacon"),
		rarity = 200,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "princess",
		description = S("Princess"),
		rarity = 200,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "coloring",
		description = S("Coloring"),
		rarity = 200,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "palachat",
		description = S("Palachat"),
		rarity = 300,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "biome-painter",
		description = S("Biome Painter"),
		rarity = 300,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "amethyst-beacon",
		description = S("Amethyst Beacon"),
		rarity = 400,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "endium-beacon",
		description = S("Endium Beacon"),
		rarity = 400,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "fast-learner",
		description = S("Fast Learner"),
		rarity = 500,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "titanium-beacon",
		description = S("Titanium Beacon"),
		rarity = 800,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "explosive",
		description = S("Explosive"),
		rarity = 900,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.set_node(pos, {name="mcl_core:obsidian"})
			minetest.add_item(pos, "pala_dynamite:dynamite_endium")
		end,
	},
	{
		name = "too-lucky-for-this-world",
		description = S("Too lucky for this world..."),
		rarity = 900,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.set_node(pos, {name="mcl_chests:chest_small"})
			minetest.get_meta(pos):get_inventory():set_stack("main", 14, ItemStack("pala_paladium:endium_nugget"))
		end,
	},
	{
		name = "pretty-base",
		description = S("Pretty Base"),
		rarity = 1000,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "less-pretty-tnt",
		description = S("Less Pretty TNT"),
		rarity = 1000,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "become-deaf",
		description = S("Become Deaf"),
		rarity = 1000,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "legendary-stf",
		description = S("Legendary StF"),
		rarity = 1000,
		texture = "pala_legendary_legendary_random.png",
		func = function(pos, player)
			minetest.add_item(pos, "pala_legendary:legendary_random")
		end,
	},
	{
		name = "rodshild",
		description = S("Rodshild"),
		rarity = 1000,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "camouflage",
		description = S("Camouflage"),
		rarity = 1200,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "paladium-beacon",
		description = S("Paladium Beacon"),
		rarity = 1200,
		texture = "pala_luckyblock_pala_beacon.png",
		func = function(pos, player)
			--TODO: add beacon at the structure top
			minetest.place_schematic({x=pos.x-3,y=pos.y,z=pos.z-3},
				pala_luckyblock.modpath .. "/schematics/pala_luckyblock_paladiumbeacon.mts", 0, nil, true)
		end,
	},
	{
		name = "mega-fast-learner",
		description = S("Mega Fast Learner"),
		rarity = 2400,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "inevitable",
		description = S("Inevitable"),
		rarity = 5000,
		texture = "pala_legendary_endium_gauntlet.png",
		func = function(pos, player)
			give_item(player, "pala_legendary:endium_gauntlet")
		end,
	},
	{
		name = "more-money",
		description = S("+ Money"),
		rarity = 5000,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "endium-grade",
		description = S("Endium Grade"),
		rarity = 10000,
		texture = "pala_paladium_endium_nugget.png",
		func = function(pos, player)
			if pala_grade.can_execute(player, 3) then
				minetest.chat_send_player(player:get_player_name(),
					C(mcl_colors.GRAY, S("You already have the rank, so here is an endium nugget")))
				give_item(player, "pala_paladium:endium_nugget")
			else
				pala_grade.set_grade(player, "legendary")
			end
		end,
	},
	{
		name = "wuzzy-afcms",
		description = S("Wuzzyyyy/AFCMMMMMMMMMMMMS"),
		rarity = 10000,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "big-inevitable",
		description = S("Big Inevitable"),
		rarity = 12500,
		texture = "pala_luckyblock_mega_ineluctable.png",
		func = function(pos, player)
			local item = pala_legendary.gauntlet.set_stones(ItemStack("pala_legendary:endium_gauntlet"), {
				fortune = 0,
				chaos = 0,
				jobs = 0,
				power = 0,
				invisibility = 0,
			})
			give_item(player, item)
		end,
	},
}

pala_luckyblock.event_negative = {
	{
		name = "enclosed",
		description = S("Enclosed"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "cow-player",
		description = S("Cow Player"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "geyser",
		description = S("Geyser"),
		rarity = 20,
		texture = "pala_luckyblock_geyser.png",
		func = function(pos, player)
			local playerpos = player:get_pos()
			minetest.add_particlespawner({
				amount = 1000,
				time = 2,
				minpos = {x=playerpos.x-0.1, y=playerpos.y, z=playerpos.z-0.1},
				maxpos = {x=playerpos.x+0.1, y=playerpos.y+30, z=playerpos.z+0.1},
				minvel = {x=-0.5, y=5, z=-0.5},
				maxvel = {x=0.5, y=10, z=0.5},
				--minacc = {x=0, y=0, z=0},
				--maxacc = {x=0, y=0, z=0},
				minexptime = 1,
				maxexptime = 3,
				minsize = 2,
				maxsize = 3,
				collisiondetection = true,
				collision_removal = false,
				object_collision = false,
				vertical = true,
				texture = mcl_weather.rain.get_texture(),
				-- playername = "singleplayer",
				--animation = {Tile Animation definition},
				--node = {name = "ignore", param2 = 0},
				--node_tile = 0,
			})
			player:add_player_velocity({x=0,y=30,z=0})
		end,
	},
	{
		name = "starfish",
		description = S("StarFish"),
		rarity = 20,
		texture = "pala_luckyblock_starfish.png",
		func = function(pos, player)
			for i = 1, 3, 1 do
				minetest.add_entity(pos, "mobs_mc:silverfish")
			end
		end,
	},
	{
		name = "over-there",
		description = S("Over there"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "inversion",
		description = S("Inversion"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "slime-tower",
		description = S("Slime Tower"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "are-u-ok",
		description = S("Are u ok?"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "army-mission",
		description = S("Army Mission"),
		rarity = 20,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "boom1",
		description = S("BOOM"),
		rarity = 20,
		texture = "pala_dynamite_big_dynamite_inv.png",
		func = function(pos, player)
			local obj = minetest.add_entity(pos, "pala_dynamite:dynamite")
			if obj then
				obj:get_luaentity().thrower_name = player:get_player_name()
			end
		end,
	},
	{
		name = "piggy-rodeo",
		description = S("Piggy Rodeo"),
		rarity = 30,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "boom2",
		description = S("Boom"),
		rarity = 30,
		texture = "pala_luckyblock_boom.png",
		func = function(pos, player)
			mcl_explosions.explode(pos, 5, { drop_chance = 1.0 }, player)
		end,
	},
	{
		name = "pssssssss",
		description = S("Pssssssss"),
		rarity = 30,
		texture = "pala_luckyblock_psss.png",
		func = function(pos, player)
			for i = 1, 4, 1 do
				--TODO: use special creeper not exploding
				--minetest.add_entity(pos, "pala_luckyblock:fake_creeper_charged")
				minetest.add_entity(pos, "mobs_mc:creeper")
			end
		end,
	},
	{
		name = "rush-to-the-minerals",
		description = S("Rush to the minerals"),
		rarity = 30,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "shot-the-pigeons",
		description = S("Shot the pigeons"),
		rarity = 30,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	{
		name = "no-xp",
		description = S("No XP"),
		rarity = 40,
		texture = "default_stone.png",
		func = function(pos, player)
			minetest.chat_send_player(player:get_player_name(), C(mcl_colors.RED, S("You will lose your xp in the next second!")))
			mcl_experience.set_player_xp_level(player, 0)
		end,
	},
	{
		name = "light-the-fire",
		description = S("Light the fire"),
		rarity = 40,
		texture = "default_stone.png",
		func = function(pos, player)
			local playername = player:get_player_name()
			local pos1 = {x=pos.x-6, y=pos.y-2, z=pos.z-6}
			local pos2 = {x=pos.x+6, y=pos.y+2, z=pos.z+6}
			if minetest.is_area_protected(pos1, pos2, playername, 2) then
				minetest.record_protection_violation(pos, playername)
			else
				local positions = minetest.find_nodes_in_area_under_air(
					pos1,
					pos2,
					{"group:building_block"}
				)
				for i = 1, #positions do
					positions[i] = {x=positions[i].x, y=positions[i].y+1 , z=positions[i].z}
				end
				minetest.bulk_set_node(positions, {name="mcl_fire:fire"})
			end
		end,
	},
	{
		name = "instant-breakup",
		description = S("Instant break up"),
		rarity = 40,
		texture = "pala_luckyblock_instant_break_up.png",
		func = function(pos, player)
			local inv = player:get_inventory()
			local oldstack = inv:get_stack("main", 1)
			minetest.chat_send_player(player:get_player_name(),
				S("It seems to me you had @1", C(mcl_colors.AQUA, oldstack:get_count().."x"..oldstack:get_name())))
			inv:set_stack("main", 1, ItemStack())
		end,
	},
	{
		name = "on-the-moon",
		description = S("On the moon"),
		rarity = 40,
		texture = "default_stone.png",
		func = pala_luckyblock.wip_event,
	},
	--TODO: add definition of other events
}

--Calculate some useful values
----------------------------------
pala_luckyblock.positive_somme = 0
for k, v in ipairs(pala_luckyblock.event_positive) do
	local inverse = 1/v.rarity
	pala_luckyblock.positive_somme = pala_luckyblock.positive_somme + inverse
	v.rarity = inverse
end

pala_luckyblock.negative_somme = 0
for k, v in ipairs(pala_luckyblock.event_negative) do
	local inverse = 1/v.rarity
	pala_luckyblock.negative_somme = pala_luckyblock.negative_somme + inverse
	v.rarity = inverse
end

pala_luckyblock.somme = pala_luckyblock.positive_somme + pala_luckyblock.negative_somme
----------------------------------

--Get all events in a single table
pala_luckyblock.event_all = {unpack(pala_luckyblock.event_positive)}
for i = 1,#pala_luckyblock.event_negative do
	pala_luckyblock.event_all[#pala_luckyblock.event_positive+i] = pala_luckyblock.event_negative[i]
end

minetest.log("action", string.format("[pala_luckyblock] loaded %s positive luckyblock events",
	#pala_luckyblock.event_positive))

minetest.log("action", string.format("[pala_luckyblock] loaded %s negative luckyblock events",
	#pala_luckyblock.event_negative))

minetest.log("action", string.format("[pala_luckyblock] loaded %s luckyblock events",
	#pala_luckyblock.event_all))
