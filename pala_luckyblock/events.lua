local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local math = math
local table = table

--[[
local function give_item(player, item)
	if player:get_inventory():add_item("main", item) then
		return
	else
		minetest.add_item(player:get_pos(), item)
		return
	end
end]]

local mobs = {
	"mobs_mc:zombie",
	"mobs_mc:witch",
	"mobs_mc:spider",
	"mobs_mc:skeleton",
}

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
			minetest.place_schematic({x=pos.x-2, y=pos.y, z=pos.z-2},
				pala_luckyblock.modpath .. "/schematics/pala_luckyblock_endium_piramid.mts", 0, nil, true)
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
		func = pala_luckyblock.wip_event,
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
}