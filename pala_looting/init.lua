function table.containsplayer(table, element)
  for _, value in pairs(table) do
	local name = value:get_player_name()
    if name == element then
      return true
    end
  end
  return false
end

minetest.register_node("pala_looting:caveblock", {
	description = ("Cave Block"),
	_doc_items_longdesc = ("Cave Block allow players to see through the blocks."),
	drawtype = "normal",
	tiles = {"pala_looting_caveblock.png"},
	use_texture_alpha = true,
	sunlight_propagates = true,
	wield_image = minetest.inventorycube(
		"pala_looting_caveblock.png",
		"pala_looting_caveblock.png",
		"pala_looting_caveblock.png"
	),
	groups = {pickaxey=2, building_block=1, material_stone=1}
})

if minetest.get_modpath("mcl_core") then
	if minetest.get_modpath("pala_paladium") then
		minetest.register_craft({
			output = "pala_looting:caveblock",
			recipe = {
				{'mcl_core:glass', 'mcl_core:glass', 'mcl_core:glass'},
				{'mcl_core:glass', 'pala_paladium:findium', 'mcl_core:glass'},
				{'mcl_core:glass', 'mcl_core:glass', 'mcl_core:glass'},
			}
		})
	end
end

minetest.register_tool("pala_looting:unclaimfinder_green", {
  description = "Green Unclaimfinder",
  wield_image = "ham_radio_receiver_handheld.png",
  inventory_image = "ham_radio_receiver_handheld.png",
  groups = { disable_repair = 1 },
  on_use = function(itemstack, user, pointed_thing)
    local keys = user:get_player_control()
    local meta = itemstack:get_meta()
  end
})

minetest.register_craftitem("pala_looting:diamondstring", {
	description = "Diamond String",
	_doc_items_longdesc = ("Allow you to craft dynamite"),
	inventory_image = "pala_looting_diamondstring.png"
})

if minetest.get_modpath("mcl_core") then
	if minetest.get_modpath("mcl_mobitem") then
		minetest.register_craft({
			output = "pala_looting:diamondstring",
			recipe = {
				{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
				{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
				{'mcl_mobitems:string', 'mcl_core:diamond', 'mcl_mobitems:string'},
			}
		})
	end
end
--online detector

minetest.register_on_leaveplayer(function(player)
	minetest.chat_send_all(player:get_player_name().." has left this awesome game.")
end)

minetest.register_on_joinplayer(function(player)
	minetest.chat_send_all("Give a warm welcome to "..player:get_player_name().."!")
end)

minetest.register_node("pala_looting:online_detector_off", {
	description = ("Online Detector"),
	_doc_items_longdesc = ("Allows you to know if a player is connected."),
	drawtype = "normal",
	tiles = {"default_stone.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1, pala_online_detector=1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[5,3]",
			"field[1,1;3,0.75;name;Player Name;default]"})
		meta:set_string("formspec", form)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if field == name then
			local meta = minetest.get_meta(pos)
			meta:set_string("name", fields.name)
			for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if name == meta:get_string("name") then
				minetest.swap_node(pos, { name = "pala_looting:online_detector_on" })
			end
		end
		end
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[5,3]",
			"field[1,1;3,0.75;name;Player Name;"..default.."]"})
		meta:set_string("formspec", form)
	end,
})

minetest.register_node("pala_looting:online_detector_on", {
	description = ("Online Detector"),
	_doc_items_longdesc = ("Allows you to know if a player is connected."),
	drawtype = "normal",
	tiles = {"pala_paladium_paladium_block.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1, pala_online_detector=1, not_in_creative_inventory=1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[5,3]",
			"field[1,1;3,0.75;name;Player Name;default]"})
		meta:set_string("formspec", form)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if field == name then
			local meta = minetest.get_meta(pos)
			meta:set_string("name", fields.name)
		end
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[5,3]",
			"field[1,1;3,0.75;name;Player Name;"..default.."]"})
		meta:set_string("formspec", form)
	end,
})

minetest.register_abm({
	label = "online_detector",
	nodenames = {"pala_looting:online_detector_off"},
	interval = 30,
	chance = 1,
	action = function(pos)
		local meta = minetest.get_meta(pos)
		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if name == meta:get_string("name") then
				minetest.swap_node(pos, { name = "pala_looting:online_detector_on" })
			end
		end
	end,
})

minetest.register_abm({
	label = "online_detector",
	nodenames = {"pala_looting:online_detector_on"},
	interval = 30,
	chance = 1,
	action = function(pos)
		local meta = minetest.get_meta(pos)
		for _,player in ipairs(minetest.get_connected_players()) do
			local name = player:get_player_name()
			if name == meta:get_string("name") then
				--minetest.swap_node(pos, { name = "pala_looting:online_detector_off" })
			else
				minetest.swap_node(pos, { name = "pala_looting:online_detector_off" })
			end
		end
	end,
})


--Chest Explorer
minetest.register_tool("pala_looting:chest_explorer", {
    description = "Chest Explorer",
    inventory_image = "default_stick.png",
    tool_capabilities = {
        max_drop_level=3,
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=70, maxlevel=1}
        }
    },
	on_use = function(itemstack, player, pointed_thing)
		if pointed_thing.type == "node" then
			--local meta = minetest.get_meta(pointed_thing.under)
			local inv = minetest.get_inventory({ type="node", pos=pointed_thing.under })
		    local size = inv:get_size("main")
			local list = inv:get_list("main")
			local form = table.concat({
				"formspec_version[3]",
				"size[17,11]",
				"list[list;main_chest_exp;1,1;1,1]"
			})
			minetest.show_formspec(player:get_player_name(), "chest_explorer", form)
		end
	end,
})