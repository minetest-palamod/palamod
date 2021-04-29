local S = minetest.get_translator(minetest.get_current_modname())

--Chest Explorer
minetest.register_craftitem("pala_looting:chest_explorer", {
    description = S("Chest Explorer"),
    inventory_image = "pala_looting_chest_explorer.png",
    wield_scale = mcl_vars.tool_wield_scale,
    stack_max = 1,
    on_place = function(itemstack, placer, pointed_thing)
        if placer:is_player() and placer:get_player_control().sneak and pointed_thing.type == "node" then
            --local nodename = minetest.get_node(pointed_thing.under)
            --if minetest.get_item_group(nodename, "container") == 0 then return end
            local meta = minetest.get_meta(pointed_thing.under)
            local inv = meta:get_inventory()
            local size = inv:get_size("main")
            --local width = inv:get_width("main")
            --minetest.chat_send_all(width)

            --item_image[<X>,<Y>;<W>,<H>;<item name>]
            --local inv = minetest.get_inventory({ type="node", pos=pointed_thing.under })
            --local size = inv:get_size("main")
            --local list = inv:get_list("main")
            local form = table.concat({
                "formspec_version[4]",
                "size[11.50,"..((size/9)+size/9*0.25)+0.25 .."]",
                pala_paladium.get_itemslot_bg(0.25,0.25, 9, (size/9)),
            })
                --mcl_formspec.get_itemslot_bg(0,4.5, width, size/width)
            for i = 1, size do
                local stack = inv:get_stack("main", i)
                form = form.."item_image["..(i+i*0.25)-1 ..",0.25;1,1;"..stack:get_name().." "..stack:get_count().."]"
                form = form.."tooltip["..(i+i*0.25)-1 ..",0.25;1,1;"..stack:get_description().."]"
            end
            --[[for i = 1, size/9 do
                for j = 1, 9 do
                    local stack = inv:get_stack("main", (i*9)-9+j)
                    form = form..
                    "item_image["..(i+i*0.25)-1 ..","..(j+j*0.25)-1 ..";1,1;"..stack:get_name().." "..stack:get_count().."]"
                    form = form.."tooltip["..(i+i*0.25)-1 ..",0.25;1,1;"..stack:get_description().."]"
                end
            end]]
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