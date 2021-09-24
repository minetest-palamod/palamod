local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_tool("pala_looting:unclaimfinder_green", {
    description = S("Green Unclaimfinder"),
    wield_image = "default_stone.png",
    inventory_image = "default_stone.png",
    groups = {tool=1, disable_repair=1},
    on_use = function(itemstack, user, pointed_thing)
        --local keys = user:get_player_control()
        --local meta = itemstack:get_meta()
    end
})
