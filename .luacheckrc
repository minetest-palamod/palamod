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
    -- ENTITIES
    "mobs",
    -- ENVIRONNEMENT
    "lightning",
    -- HELP
    "mcl_craftguide",
    -- HUD
    "awards", "mcl_death_messages", "mcl_experience", "mcl_formspec",
    -- ITEMS
    "armor", "mcl_buckets", "mcl_doors", "mcl_fire", "mcl_throwing", "mcl_stairs", "screwdriver", "mesecon",
    -- PLAYER
    "mcl_hunger",
    
    --OTHER
    "mcl_vars",
}
