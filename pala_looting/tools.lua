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
    wield_scale = mcl_vars.tool_wield_scale,
    stack_max = 1,
    on_place = function(itemstack, placer, pointed_thing)
        if placer:is_player() and placer:get_player_control().sneak and pointed_thing.type == "node" then
            local nodename = minetest.get_node(pointed_thing.under)
            local meta = minetest.get_meta(pointed_thing.under)
            local inv = meta:get_inventory()
            local size = inv:get_size("main")
            local width = inv:get_width("main")

            --item_image[<X>,<Y>;<W>,<H>;<item name>]
            --local inv = minetest.get_inventory({ type="node", pos=pointed_thing.under })
            --local size = inv:get_size("main")
            --local list = inv:get_list("main")
            local form = "formspec_version[3]"..
                "size[30,30]"..
                mcl_formspec.get_itemslot_bg(0,4.5, width, size/width)
            for i = 1, size do
                local stack = inv:get_stack("main", i)
                form = form.."item_image[0,4.5;1,1;"..stack:get_name().."]"
            end
            minetest.show_formspec(placer:get_player_name(), "chest_explorer", form)
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