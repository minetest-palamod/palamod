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

minetest.register_node("pala_looting:online_detector", {
	description = ("Online Detector"),
	_doc_items_longdesc = ("Allows you to know if a player is connected."),
	drawtype = "normal",
	tiles = {"default_stone.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1},
	on_receive_fields = function(pos, formname, fields, sender)
		if formname == "pala_looting:configure_playerdetector" or not minetest.is_player(sender) then
			local meta = minetest.get_meta(pos)
			meta:set_string("ptarget", fields.ptarget)
		end
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "pala_looting:configure_playerdetector",
			table.concat({
			"size[3,4]",
			"field[0.25,2;3,1;ptarget;Player;",tostring(ptarget),"]",
			"tooltip[ptarget;Player name ",
			"button_exit[0,3.5;3,1;;Done]"
			},'')
		)
	end,
	on_punch = function(pos, node, player, pointed_thing)
		for _,testplayer in ipairs(minetest.get_connected_players()) do
			local name = testplayer:get_player_name()
			if name == ptarget then
				minetest.chat_send_player(name, "co")
			end
		end
	end
})
