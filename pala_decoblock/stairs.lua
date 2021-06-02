local S = minetest.get_translator(minetest.get_current_modname())

--Paladium
mcl_stairs.register_slab("paladium", "pala_paladium:paladiumblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_paladium_block.png"},
	S("Paladium Slab"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5, -- <---- blast_resistance added
	S("Double Paladium Slab")
)

--[[[mcl_stairs.register_stair(subname,
recipeitem,
groups,
images,
description,
sounds,
hardness,
corner_stair_texture_override)]]

mcl_stairs.register_stair("paladium", "pala_paladium:paladiumblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_paladium_block.png"},
	S("Paladium Stairs"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
	"woodlike"
)

--Titanium
mcl_stairs.register_slab("titanium", "pala_paladium:titaniumblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_titanium_block.png"},
	S("Titanium Slab"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
	S("Double Titanium Slab")
)

mcl_stairs.register_stair("titanium", "pala_paladium:titaniumblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_titanium_block.png"},
	S("Titanium Stairs"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
	"woodlike"
)

--Amethyst
mcl_stairs.register_slab("amethyst", "pala_paladium:amethystblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_amethyst_block.png"},
	S("Amethyst Slab"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5, --  <---- blast_resistance added
	S("Double Amethyst Slab")
)

mcl_stairs.register_stair("amethyst", "pala_paladium:amethystblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_amethyst_block.png"},
	S("Amethyst Stairs"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5,
	"woodlike"
)

--Findium
mcl_stairs.register_slab("findium", "pala_paladium:findiumblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_findiumblock.png"},
	S("Findium Slab"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5,
	S("Double Findium Slab")
)

mcl_stairs.register_stair("findium", "pala_paladium:findiumblock",
	{pickaxey = 4, building_block = 1},
	{"pala_paladium_findiumblock.png"},
	S("Findium Stairs"),
	mcl_sounds.node_sound_stone_defaults(), 5, 5,
	"woodlike"
)