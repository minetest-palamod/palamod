local load_time = os.clock()
minetest.log("action", "[pala_paladium] loading...")

local S = minetest.get_translator(minetest.get_current_modname())

--Amethyst
minetest.register_node("pala_paladium:stone_with_amethyst", {
	description = S("Amethyst Ore"),
	_doc_items_longdesc = S("Amethyst ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_amethyst.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:amethyst_ingot", {
	description = S("Amethyst Ingot"),
	_doc_items_longdesc = S("Molten Amethyst. It is used to craft armor, tools, and whatnot."),
	inventory_image = "default_steel_ingot.png^[colorize:#944dc7:150",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:amethystblock", {
	description = S("Block of Amethyst"),
	_doc_items_longdesc = S("A block of Amethyst is mostly a shiny decorative block."),
	tiles = {"pala_paladium_amethyst_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:amethystblock",
	recipe = {
		{'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot'},
		{'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot'},
		{'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot'},
	}
})

minetest.register_craft({
	output = 'pala_paladium:amethyst_ingot 9',
	recipe = {
		{'pala_paladium:amethystblock'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:amethyst_ingot",
	recipe = "pala_paladium:stone_with_amethyst",
	cooktime = 5
})

--Titanium
minetest.register_node("pala_paladium:stone_with_titanium", {
	description = S("@1 Ore", S("Titanium")),
	_doc_items_longdesc = S("@1 ore is rare and can be found in clusters near the bottom of the world.", S("Titanium")),
	tiles = {"default_stone.png^pala_paladium_mineral_titanium.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:titanium_ingot", {
	description = S("@1 Ingot", S("Titanium")),
	_doc_items_longdesc = S("Molten @1. It is used to craft armor, tools, and whatnot.", S("Titanium")),
	inventory_image = "pala_paladium_titanium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:titaniumblock", {
	description = S("Block of @1", S("Titanium")),
	_doc_items_longdesc = S("A block of @1 is mostly a shiny decorative block.", S("Titanium")),
	tiles = {"pala_paladium_titanium_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:titaniumblock",
	recipe = {
		{'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot'},
		{'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot'},
		{'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot'},
	}
})

minetest.register_craft({
	output = 'pala_paladium:titanium_ingot 9',
	recipe = {
		{'pala_paladium:titaniumblock'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:titanium_ingot",
	recipe = "pala_paladium:stone_with_titanium",
	cooktime = 5
})

--Paladium
minetest.register_node("pala_paladium:stone_with_paladium", {
	description = S("@1 Ore", S("Paladium")),
	_doc_items_longdesc = S("@1 ore is rare and can be found in clusters near the bottom of the world.", S("Paladium")),
	tiles = {"pala_paladium_mineral_paladium.png"},
	is_ground_content = true,
	stack_max = 64,
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
	description = S("@1 Ingot", S("Paladium")),
	_doc_items_longdesc = S("Molten @1. It is used to craft armor, tools, and whatnot.", S("Paladium")),
	inventory_image = "pala_paladium_paladium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:paladiumblock", {
	description = S("Block of @1", S("Paladium")),
	_doc_items_longdesc = S("A block of @1 is mostly a shiny decorative block.", S("Paladium")),
	tiles = {"pala_paladium_paladium_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:paladiumblock",
	recipe = {
		{'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot'},
		{'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot'},
		{'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot'},
	}
})

minetest.register_craft({
	output = 'pala_paladium:paladium_ingot 9',
	recipe = {
		{'pala_paladium:paladiumblock'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:paladium_ingot",
	recipe = "pala_paladium:stone_with_paladium",
	cooktime = 5
})

--Green Paladium
minetest.register_node("pala_paladium:stone_with_gpaladium", {
	description = S("@1 Ore", S("Green Paladium")),
	_doc_items_longdesc = S("@1 ore is rare and can be found in clusters near the bottom of the world.", S("Green Paladium")),
	tiles = {"default_stone.png^pala_paladium_mineral_gpaladium.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:gpaladium_ingot", {
	description = S("@1 Ingot", S("Green Paladium")),
	_doc_items_longdesc = S("Molten @1. It is used to craft armor, tools, and whatnot.", S("Green Paladium")),
	inventory_image = "pala_paladium_gpaladium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:gpaladiumblock", {
	description = S("Block of @1", S("Green Paladium")),
	_doc_items_longdesc = S("A block of @1 is mostly a shiny decorative block.", S("Green Paladium")),
	tiles = {"pala_paladium_gpaladium_block.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:gpaladiumblock",
	recipe = {
		{'pala_paladium:gpaladium_ingot', 'pala_paladium:gpaladium_ingot', 'pala_paladium:gpaladium_ingot'},
		{'pala_paladium:gpaladium_ingot', 'pala_paladium:gpaladium_ingot', 'pala_paladium:gpaladium_ingot'},
		{'pala_paladium:gpaladium_ingot', 'pala_paladium:gpaladium_ingot', 'pala_paladium:gpaladium_ingot'},
	}
})

minetest.register_craft({
	output = 'pala_paladium:gpaladium_ingot 9',
	recipe = {
		{'pala_paladium:gpaladiumblock'},
	}
})

minetest.register_craft({
	type = "cooking",
	output = "pala_paladium:gpaladium_ingot",
	recipe = "pala_paladium:stone_with_gpaladium",
	cooktime = 5
})

--Findium
minetest.register_node("pala_paladium:stone_with_findium", {
	description = S("@1 Ore", S("Findium")),
	_doc_items_longdesc = S("@1 ore is rare and can be found in clusters near the bottom of the world.", S("Findium")),
	tiles = {"pala_paladium_mineral_findium.png"},
	is_ground_content = true,
	stack_max = 64,
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
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:findiumblock", {
	description = S("Block of @1", S("Findium")),
	_doc_items_longdesc = S("A block of @1 is mostly a shiny decorative block.", S("Findium")),
	tiles = {"pala_paladium_findiumblock.png"},
	is_ground_content = false,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 6,
	_mcl_hardness = 5,
})

minetest.register_craft({
	output = "pala_paladium:findiumblock",
	recipe = {
		{'pala_paladium:findium_gem', 'pala_paladium:findium_gem', 'pala_paladium:findium_gem'},
		{'pala_paladium:findium_gem', 'pala_paladium:findium_gem', 'pala_paladium:findium_gem'},
		{'pala_paladium:findium_gem', 'pala_paladium:findium_gem', 'pala_paladium:findium_gem'},
	}
})

minetest.register_craft({
	output = 'pala_paladium:findium_gem 9',
	recipe = {
		{'pala_paladium:findiumblock'},
	}
})

--Endium
minetest.register_craftitem("pala_paladium:endium_ingot", {
	description = ("Endium Ingot"),
	_doc_items_longdesc = ("Molten Endium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_endium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_craftitem("pala_paladium:endium_nugget", {
	description = ("Endium Nugget"),
	_doc_items_longdesc = ("Endium Nugget. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_endium_nugget.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_craft({
	output = 'pala_paladium:endium_ingot',
	recipe = {
		{'pala_paladium:endium_nugget 9'},
	}
})

minetest.log("action", "[pala_paladium] loaded in "..((os.clock()-load_time)*1000).."ms")
