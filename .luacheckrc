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

    -- MCL (CORE only)
    "biomeinfo", "flowlib", "mcl_explosions", "mcl_sounds", "mcl_loot", "mcl_particles", "mcl_util", "mcl_worlds", "walkover",
}
