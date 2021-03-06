unused_args = false
allow_defined_top = true
max_line_length = 125

globals = {
    "minetest",
}

read_globals = {
    string = {fields = {"split"}},
    table = {fields = {"copy", "getn"}},

    -- Builtin
    "vector", "ItemStack",
    "dump", "DIR_DELIM", "VoxelArea", "Settings",

    -- MCL
	--------------------------------------------
    -- CORE
    "biomeinfo", "flowlib", "mcl_explosions", "mcl_sounds", "mcl_loot", "mcl_particles", "mcl_util", "mcl_worlds", "walkover", "mcl_colors",
    -- ENTITIES
    "mobs", "mobs_mc",
    -- ENVIRONNEMENT
    "lightning", "mcl_weather",
    -- HELP
    "mcl_craftguide",
    -- HUD
    "awards", "mcl_death_messages", "mcl_experience", "mcl_formspec",
    -- ITEMS
    "armor", "mcl_buckets", "mcl_doors", "mcl_enchanting", "mcl_fire",
	"mcl_potions", "mcl_throwing", "mcl_stairs", "screwdriver", "mesecon", "tnt",
    -- PLAYER
    "mcl_hunger",
    
    --OTHER
    "mcl_vars",
	
	-- PALAMOD
	--------------------------------------------
	"pala_dynamite",
}
