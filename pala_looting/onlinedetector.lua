local S = minetest.get_translator(minetest.get_current_modname())

--online detector
minetest.register_node("pala_looting:online_detector_off", {
	description = S("Online Detector"),
	_doc_items_longdesc = S("Allows you to know if a player is connected."),
	drawtype = "normal",
	tiles = {"pala_looting_online_detector_off.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1, pala_online_detector=1},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[8,3]",
			"field[0.25,0.75;7.5,0.75;name;Online Detector;"..default.."]",
			"label[0.25,2.25;Detecting: "..default.."]"})
		meta:set_string("formspec", form)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.name then
			local meta = minetest.get_meta(pos)
			meta:set_string("name", fields.name)
			for _,player in ipairs(minetest.get_connected_players()) do
				local name = player:get_player_name()
				if name == meta:get_string("name") then
					minetest.swap_node(pos, { name = "pala_looting:online_detector_on" })
					break
				end
			end
		end
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[8,3]",
			"field[0.25,0.75;7.5,0.75;name;Online Detector;"..default.."]",
			"label[0.25,2.25;Detecting: "..default.."]"})
		meta:set_string("formspec", form)
	end,
})

minetest.register_node("pala_looting:online_detector_on", {
	description = ("Online Detector"),
	_doc_items_longdesc = ("Allows you to know if a player is connected."),
	drawtype = "normal",
	tiles = {"pala_looting_online_detector_on.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1, pala_online_detector=1, not_in_creative_inventory=1},
	drop = {"pala_looting:online_detector_off"},
	mesecons = {receptor = {
		state = mesecon.state.on,
		rules = mesecon.rules.alldirs,
	}},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[8,3]",
			"field[0.25,0.75;7.5,0.75;name;Online Detector;"..default.."]",
			"label[0.25,2.25;Detecting: "..default.."]"})
		meta:set_string("formspec", form)
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.name then
			local meta = minetest.get_meta(pos)
			meta:set_string("name", fields.name)
			for _,player in ipairs(minetest.get_connected_players()) do
				local name = player:get_player_name()
				if name ~= meta:get_string("name") then
					minetest.swap_node(pos, { name = "pala_looting:online_detector_off" })
					break
				end
			end
		end
	end,
	on_rightclick = function(pos, node, player, itemstack, pointed_thing)
		local meta = minetest.get_meta(pos)
		local default = meta:get_string("name")
		local form = table.concat({
			"formspec_version[3]",
			"size[8,3]",
			"field[0.25,0.75;7.5,0.75;name;Online Detector;"..default.."]",
			"label[0.25,2.25;Detecting: "..default.."]"})
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
				mesecon.receptor_on(pos, mesecon.rules.alldirs)
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
			if not name == meta:get_string("name") then
				minetest.swap_node(pos, { name = "pala_looting:online_detector_off" })
				mesecon.receptor_off(pos, mesecon.rules.alldirs)
			end
		end
	end,
})