--Amethyst
minetest.register_node("pala_paladium:stone_with_amethyst", {
	description = ("Amethyst Ore"),
	_doc_items_longdesc = ("Amethyst ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_amethyst.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:amethyst_ingot", {
	description = ("Amethyst Ingot"),
	_doc_items_longdesc = ("Molten Amethyst. It is used to craft armor, tools, and whatnot."),
	inventory_image = "default_steel_ingot.png^[colorize:#944dc7:150",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:amethystblock", {
	description = ("Block of Amethyst"),
	_doc_items_longdesc = ("A block of Amethyst is mostly a shiny decorative block."),
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

minetest.register_alias("pala_paladium:stone_with_amethyst", "468")
minetest.register_alias("pala_paladium:amethyst_ingot", "4468")
minetest.register_alias("pala_paladium:amethystblock", "249")

--Titanium
minetest.register_node("pala_paladium:stone_with_titanium", {
	description = ("Titanium Ore"),
	_doc_items_longdesc = ("Titanium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_titanium.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:titanium_ingot", {
	description = ("Titanium Ingot"),
	_doc_items_longdesc = ("Molten Titanium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_titanium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:titaniumblock", {
	description = ("Block of Titanium"),
	_doc_items_longdesc = ("A block of Titanium is mostly a shiny decorative block."),
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

minetest.register_alias("pala_paladium:stone_with_titanium", "469")
minetest.register_alias("pala_paladium:titanium_ingot", "4469")
minetest.register_alias("pala_paladium:titaniumblock", "248")

--Paladium
minetest.register_node("pala_paladium:stone_with_paladium", {
	description = ("Paladium Ore"),
	_doc_items_longdesc = ("Paladium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_paladium.png"},
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
	description = ("Paladium Ingot"),
	_doc_items_longdesc = ("Molten Paladium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_paladium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:paladiumblock", {
	description = ("Block of Paladium"),
	_doc_items_longdesc = ("A block of Paladium is mostly a shiny decorative block."),
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

minetest.register_alias("pala_paladium:stone_with_paladium", "470")
minetest.register_alias("pala_paladium:paladium_ingot", "4470")
minetest.register_alias("pala_paladium:paladiumblock", "247")

--Green Paladium
minetest.register_node("pala_paladium:stone_with_gpaladium", {
	description = ("Green Paladium Ore"),
	_doc_items_longdesc = ("Green Paladium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_gpaladium.png"},
	is_ground_content = true,
	stack_max = 64,
	groups = {pickaxey=4, building_block=1, material_stone=1},
	sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 3,
	_mcl_hardness = 3,
})

minetest.register_craftitem("pala_paladium:gpaladium_ingot", {
	description = ("Green Paladium Ingot"),
	_doc_items_longdesc = ("Molten Green Paladium. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_gpaladium_ingot.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:gpaladiumblock", {
	description = ("Block of Green Paladium"),
	_doc_items_longdesc = ("A block of Green Paladium is mostly a shiny decorative block."),
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

minetest.register_alias("pala_paladium:stone_with_gpaladium", "471")
minetest.register_alias("pala_paladium:gpaladium_ingot", "4471")
minetest.register_alias("pala_paladium:gpaladiumblock", "250")

--Findium
minetest.register_node("pala_paladium:stone_with_findium", {
	description = ("Findium Ore"),
	_doc_items_longdesc = ("Findium ore is rare and can be found in clusters near the bottom of the world."),
	tiles = {"default_stone.png^pala_paladium_mineral_findium.png"},
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
	description = ("Findium Gem"),
	_doc_items_longdesc = ("Findium Gem. It is used to craft armor, tools, and whatnot."),
	inventory_image = "pala_paladium_findium_gem.png",
	stack_max = 64,
	groups = { craftitem=1 },
})

minetest.register_node("pala_paladium:findiumblock", {
	description = ("Block of Findium"),
	_doc_items_longdesc = ("A block of Findium is mostly a shiny decorative block."),
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

minetest.register_alias("pala_paladium:stone_with_findium", "472")
minetest.register_alias("pala_paladium:findium_ingot", "4474")
minetest.register_alias("pala_paladium:findiumblock", "246")

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

minetest.register_alias("pala_paladium:endium_nugget", "4475")
minetest.register_alias("pala_paladium:endium_ingot", "4472")
