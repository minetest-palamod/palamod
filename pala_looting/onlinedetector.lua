local S = minetest.get_translator(minetest.get_current_modname())
local F = minetest.formspec_escape

local table = table

local function get_detector_form(default)
	return table.concat({
		"formspec_version[4]",
		"size[8,3]",
		"field[0.25,0.75;7.5,0.75;name;"..F(S("Online Detector"))..";"..default.."]",
		"label[0.25,2.25;"..F(S("Detecting:")).." "..default.."]"
	})
end

local playerlist = {}

minetest.register_on_joinplayer(function(player)
	playerlist[player:get_player_name()] = true
end)

minetest.register_on_leaveplayer(function(player)
	playerlist[player:get_player_name()] = nil
end)

local function update_detector_on(pos, target)
	if not playerlist[target] then
		minetest.swap_node(pos, { name = "pala_looting:online_detector_off" })
		mesecon.receptor_off(pos, mesecon.rules.alldirs)
	end
end

local function update_detector_off(pos, target)
	if playerlist[target] then
		minetest.swap_node(pos, { name = "pala_looting:online_detector_on" })
		mesecon.receptor_on(pos, mesecon.rules.alldirs)
	end
end

minetest.register_node("pala_looting:online_detector_off", {
	description = S("Online Detector"),
	_doc_items_longdesc = S("Allows you to know if a player is connected."),
	tiles = {"pala_looting_online_detector_off.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1, pala_online_detector=1},
	mesecons = {
		receptor = {
			state = mesecon.state.off,
			rules = mesecon.rules.alldirs,
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_detector_form(meta:get_string("name")))
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.name then
			local meta = minetest.get_meta(pos)
			meta:set_string("name", fields.name)
			meta:set_string("formspec", get_detector_form(fields.name))
			update_detector_off(pos, fields.name)
		end
	end,
})

minetest.register_node("pala_looting:online_detector_on", {
	description = S("Online Detector"),
	_doc_items_longdesc = S("Allows you to know if a player is connected."),
	tiles = {"pala_looting_online_detector_on.png"},
	groups = {pickaxey=2, building_block=1, material_stone=1, pala_online_detector=1, not_in_creative_inventory=1},
	drop = "pala_looting:online_detector_off",
	mesecons = {
		receptor = {
			state = mesecon.state.on,
			rules = mesecon.rules.alldirs,
		},
	},
	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_detector_form(meta:get_string("name")))
	end,
	on_receive_fields = function(pos, formname, fields, sender)
		if fields.name then
			local meta = minetest.get_meta(pos)
			meta:set_string("name", fields.name)
			meta:set_string("formspec", get_detector_form(fields.name))
			update_detector_on(pos, fields.name)
		end
	end,
})

minetest.register_abm({
	label = "pala_looting:online_detector_off",
	nodenames = {"pala_looting:online_detector_off"},
	interval = 30,
	chance = 1,
	action = function(pos)
		update_detector_off(pos, minetest.get_meta(pos):get_string("name"))
	end,
})

minetest.register_abm({
	label = "pala_looting:online_detector_on",
	nodenames = {"pala_looting:online_detector_on"},
	interval = 30,
	chance = 1,
	action = function(pos)
		update_detector_on(pos, minetest.get_meta(pos):get_string("name"))
	end,
})

minetest.register_craft({
	output = "pala_looting:online_detector_off",
	recipe = {
		{'mcl_dye:black', 'mcl_dye:black', 'mcl_dye:black'},
		{'mcl_dye:black', 'pala_paladium:paladium_ingot', 'mcl_dye:black'},
		{'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot'},
	}
})