unused_args = false
allow_defined_top = true

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
    -- CORE
    "biomeinfo", "flowlib", "mcl_explosions", "mcl_sounds", "mcl_loot", "mcl_particles", "mcl_util", "mcl_worlds", "walkover",
    -- ENVIRONNEMENT
    "lightning",
    -- HUD
    "mcl_death_messages", "mcl_experience", "mcl_formspec",
    -- ITEMS
    "mcl_buckets", "mcl_doors", "mcl_fire", "mcl_stairs",
    -- PLAYER
    "mcl_hunger",
}
