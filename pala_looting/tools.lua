local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_tool("pala_looting:unclaimfinder_green", {
    description = S("Green Unclaimfinder"),
    wield_image = "default_stone.png",
    inventory_image = "default_stone.png",
    groups = { disable_repair = 1 },
    on_use = function(itemstack, user, pointed_thing)
      --local keys = user:get_player_control()
      --local meta = itemstack:get_meta()
    end
  })

--Chest Explorer
minetest.register_craftitem("pala_looting:chest_explorer", {
    description = S("Chest Explorer"),
    inventory_image = "pala_looting_chest_explorer.png",
    on_use = function(itemstack, player, pointed_thing)
        if pointed_thing.type == "node" then
            --local meta = minetest.get_meta(pointed_thing.under)
            --item_image[<X>,<Y>;<W>,<H>;<item name>]
            --local inv = minetest.get_inventory({ type="node", pos=pointed_thing.under })
            --local size = inv:get_size("main")
            --local list = inv:get_list("main")
            local form = table.concat({
                "formspec_version[3]",
                "size[17,11]",
                "list[list;main_chest_exp;1,1;1,1]"
            })
            minetest.show_formspec(player:get_player_name(), "chest_explorer", form)
        end
    end,
})

if minetest.get_modpath("pala_paladium") and minetest.get_modpath("pala_craftstick") then
    minetest.register_craft({
        output = "pala_looting:chest_explorer",
        recipe = {
            {'pala_paladium:findium_gem', 'pala_paladium:paladium_ingot', 'pala_paladium:findium_gem'},
            {'pala_paladium:findium_gem', 'pala_craftstick:compressed_paladium', 'pala_paladium:findium_gem'},
            {'pala_paladium:findium_gem', 'pala_paladium:paladium_ingot', 'pala_paladium:findium_gem'},
        }
    })
end