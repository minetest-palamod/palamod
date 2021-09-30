unused_args = false
allow_defined_top = true
max_line_length = 125

globals = {
	minetest = {
		fields = {
			"format_chat_message",
		},
	},
	mcl_spawn = {
		fields = {
			"get_world_spawn_pos",
			"get_bed_spawn_pos",
			"get_player_spawn_pos",
			"set_spawn_pos",
			"spawn",
		},
	},
	mcl_death_messages = {
		fields = {
			"messages",
		},
	},
	mcl_enchanting = {
		fields = {
			"enchantments",
		},
	},
}

read_globals = {
	"DIR_DELIM", "INIT",

	"minetest", "core",
	"dump", "dump2",

	"Raycast",
	"Settings",
	"PseudoRandom",
	"PerlinNoise",
	"VoxelManip",
	"SecureRandom",
	"VoxelArea",
	"PerlinNoiseMap",
	"PcgRandom",
	"ItemStack",
	"AreaStore",

	vector = {
		fields = {
			"new",
			"equals",
			"length",
			"normalize",
			"floor",
			"round",
			"apply",
			"distance",
			"direction",
			"angle",
			"dot",
			"cross",
			"add",
			"subtract",
			"multiply",
			"divide",
			"offset",
			"sort",
			"rotate_around_axis",
			"rotate",
			"dir_to_rotation",
		},
	},

	table = {
		fields = {
			"copy",
			"indexof",
			"insert_all",
			"key_value_swap",
			"shuffle",
		},
	},

	string = {
		fields = {
			"split",
			"trim",
		},
	},

	math = {
		fields = {
			"hypot",
			"sign",
			"factorial"
		},
	},

	--------------------------------------------
	-- MCL
	--------------------------------------------
	-- CORE
	"biomeinfo", "controls", "flowlib", "mcl_autogroup", "mcl_colors", "mcl_commands", "mcl_damage", "mcl_explosions",
	"mcl_vars", "mcl_loot",	"mcl_particles", "mcl_sounds", "mcl_util", "mcl_worlds", "tga_encoder", "walkover",
	-- ENTITIES
	"mcl_burning", "mcl_minecarts", "mobs", "mcl_paintings", "mobs_mc",
	-- ENVIRONNEMENT
	"lightning", "mcl_moon", "mcl_weather",
	-- HELP
	"doc", "mcl_craftguide", "mcl_item_id", "tt",
	-- HUD
	"awards", "hb", "mcl_bossbars", "mcl_credits", "mcl_death_messages", "mcl_experience", "mcl_formspec", "mcl_inventory",
	"mcl_title", "mcl_tmp_message",
	-- ITEMS
	"mcl_armor", "mcl_banners", "mcl_beds", "mcl_bows", "mcl_buckets", "mcl_cocoas", "mcl_clock", "mcl_compass", "mcl_core",
	"mcl_crafting_table", "mcl_doors", "mcl_dye", "mcl_enchanting", "mcl_end", "mcl_farming", "mcl_fences", "mcl_fire",
	"mcl_flowerpots", "mcl_flowers", "mcl_jukebox", "mcl_maps", "mcl_mobspawners", "mcl_ocean", "mcl_portals", "mcl_potions",
	"mcl_stairs", "mcl_throwing", "tnt", "mcl_torches", "mcl_walls", "mcl_observers", "mesecon", "screwdriver", "xpanes",
	-- MAPGEN
	"mcl_dungeons", "mcl_mapgen_core", "mcl_structures", "tsm_railcorridors", "settlements_in_world", "settlements",
	-- MISC
	"mcl_wip",
	-- PLAYER
	"mcl_death_drop", "mcl_hunger", "mcl_player", "mcl_playerinfo", "mcl_playerplus", "mcl_skins", "mcl_spawn", "mcl_sprint",
	"mcl_wieldview", "playerphysics",

	--------------------------------------------
	-- PALAMOD
	--------------------------------------------
	-- OPTIONAL DEPENDS
	"db_manager", "mc_economy", "mc_faction",
}
