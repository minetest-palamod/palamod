minetest.log("action", "[pala_paladium] loading...")

local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

--Amethyst
minetest.register_node("pala_paladium:stone_with_amethyst", {
	description = S("Amethyst Ore"),
	_doc_items_longdesc = S("Amethyst ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_amethyst.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:amethyst_ingot", {
	description = S("Amethyst Ingot"),
	_doc_items_longdesc = S("Molten Amethyst. It is used to craft armor, tools, and whatnot."),
	inventory_image = "default_steel_ingot.png^[colorize:#944dc7:150",
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:amethystblock", {
	description = S("Block of Amethyst"),
	_doc_items_longdesc = S("A block of amethyst is mostly a shiny decorative block."),
	tiles = {"pala_paladium_amethyst_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:amethystblock",
	recipe = {
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
		{"pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot", "pala_paladium:amethyst_ingot"},
	},
})

minetest.register_craft({
	output = "pala_paladium:amethyst_ingot 9",
	recipe = {
		{"pala_paladium:amethystblock"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:amethyst_ingot",
	recipe = "pala_paladium:stone_with_amethyst",
	cooktime = 5,
})

--Titanium
minetest.register_node("pala_paladium:stone_with_titanium", {
	description = S("Titanium Ore"),
	_doc_items_longdesc = S("Titanium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_titanium.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:titanium_ingot", {
	description = S("Titanium Ingot"),
	_doc_items_longdesc = S("Molten Titanium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_titanium_ingot.png",
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:titaniumblock", {
	description = S("Block of Titanium"),
	_doc_items_longdesc = S("A block of titanium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_titanium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:titaniumblock",
	recipe = {
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
		{"pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot", "pala_paladium:titanium_ingot"},
	},
})

minetest.register_craft({
	output = "pala_paladium:titanium_ingot 9",
	recipe = {
		{"pala_paladium:titaniumblock"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:titanium_ingot",
	recipe = "pala_paladium:stone_with_titanium",
	cooktime = 5,
})

--Paladium
minetest.register_node("pala_paladium:stone_with_paladium", {
	description = S("Paladium Ore"),
	_doc_items_longdesc = S("Paladium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"pala_paladium_mineral_paladium.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		--TEMP:need mineclone change
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner", {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 60, 54, 48, 42, 36, 30, 24, 18, 12, 6})
		end
	end,
})

minetest.register_craftitem("pala_paladium:paladium_ingot", {
	description = S("Paladium Ingot"),
	_doc_items_longdesc = S("Molten Paladium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_paladium_ingot.png",
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:paladiumblock", {
	description = S("Block of Paladium"),
	_doc_items_longdesc = S("A block of Paladium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_paladium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:paladiumblock",
	recipe = {
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
	},
})

minetest.register_craft({
	output = "pala_paladium:paladium_ingot 9",
	recipe = {
		{"pala_paladium:paladiumblock"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:paladium_ingot",
	recipe = "pala_paladium:stone_with_paladium",
	cooktime = 5,
})

--Green Paladium
minetest.register_node("pala_paladium:stone_with_gpaladium", {
	description = S("Green Paladium Ore"),
	_doc_items_longdesc = S("Green Paladium ore is rare and can be given inside events."),
	tiles = {"default_stone.png^pala_paladium_mineral_gpaladium.png"},
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:gpaladium_ingot", {
	description = S("Green Paladium Ingot"),
	_doc_items_longdesc = S("Molten Green Paladium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_gpaladium_ingot.png",
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:gpaladiumblock", {
	description = S("Block of Green Paladium"),
	_tt_help = C(mcl_colors.RED, S("Can't be decrafted")),
	_doc_items_longdesc = S("A block of Green Paladium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_gpaladium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:gpaladiumblock",
	recipe = {
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
		{"pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot", "pala_paladium:gpaladium_ingot"},
	},
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:gpaladium_ingot",
	recipe = "pala_paladium:stone_with_gpaladium",
	cooktime = 5,
})

--Findium
minetest.register_node("pala_paladium:stone_with_findium", {
	description = S("Findium Ore"),
	_doc_items_longdesc = S("Findium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"pala_paladium_mineral_findium.png"},
	drop = "pala_paladium:findium_gem",
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner",
				{65, 58.5, 52, 45.5, 39, 0, 0, 0, 0, 0, 65, 58.5, 52, 45.5, 39, 32.5, 26, 19.5, 13, 6.5})
		end
	end,
})

minetest.register_craftitem("pala_paladium:findium_gem", {
	description = S("Findium Gem"),
	_doc_items_longdesc = S("Findium Gem. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_findium_gem.png",
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:findiumblock", {
	description = S("Block of Findium"),
	_doc_items_longdesc = S("A block of findium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_findiumblock.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:findiumblock",
	recipe = {
		{"pala_paladium:findium_gem", "pala_paladium:findium_gem", "pala_paladium:findium_gem"},
		{"pala_paladium:findium_gem", "pala_paladium:findium_gem", "pala_paladium:findium_gem"},
		{"pala_paladium:findium_gem", "pala_paladium:findium_gem", "pala_paladium:findium_gem"},
	},
})

minetest.register_craft({
	output = "pala_paladium:findium_gem 9",
	recipe = {
		{"pala_paladium:findiumblock"},
	},
})

--Endium
minetest.register_craftitem("pala_paladium:endium_ingot", {
	description = S("Endium Ingot"),
	_doc_items_longdesc = S("Molten Endium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_endium_ingot.png",
	groups = { craftitem=1 },
})

minetest.register_craftitem("pala_paladium:endium_nugget", {
	description = S("Endium Nugget"),
	_doc_items_longdesc = S([[
		Endium nuggets are very small pieces of molten endium; the main purpose is to create endium ingots.
	]]),
	inventory_image = "pala_paladium_endium_nugget.png",
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:stone_with_endium", { --Added by palamod V7.5
	description = S("Endium Ore"),
	_doc_items_longdesc = S("Endium ore is rare and can be given inside events."),
	tiles = {"pala_paladium_mineral_endium.png"},
	drop = "pala_paladium:endium_nugget",
	is_ground_content = true,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craft({
	output = "pala_paladium:endium_ingot",
	recipe = {
		{"pala_paladium:endium_nugget 9"},
	},
})

minetest.register_node("pala_paladium:endiumblock", {
	description = S("Block of Endium"),
	_tt_help = C(mcl_colors.RED, S("Can't be decrafted")),
	_doc_items_longdesc = S("A block of Endium is mostly a shiny decorative block."),
	tiles = {"pala_paladium_endium_block.png"},
	is_ground_content = false,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:endiumblock",
	recipe = {
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
		{"pala_paladium:endium_ingot", "pala_paladium:endium_ingot", "pala_paladium:endium_ingot"},
	},
})

minetest.log("action", "[pala_paladium] loaded succesfully")
