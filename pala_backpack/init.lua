local C = minetest.colorize
local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size('backpack', 81) -- 9*9
end)

pala_backpack = {}
pala_backpack.form = {}
pala_backpack.form.amethyst = table.concat({
	"formspec_version[3]",
	"size[12,8]",
	--mcl_formspec.get_itemslot_bg(0.5,1,9,1),
	"list[current_player;backpack;0.5,1;9,1;]", --9
	"list[current_player;main;0.5,3;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C(mcl_colors.GRAY, S("Backpack")).."]",
	"label[0.5,2.5;"..C(mcl_colors.GRAY, S("Inventory")).."]",
})

pala_backpack.form.titanium = table.concat({
	"formspec_version[3]",
	"size[12,10.5]",
	"list[current_player;backpack;0.5,1;9,3;]", --27
	"list[current_player;main;0.5,5.5;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C(mcl_colors.GRAY, S("Backpack")).."]",
	"label[0.5,5;"..C(mcl_colors.GRAY, S("Inventory")).."]",
})

pala_backpack.form.paladium = table.concat({
	"formspec_version[3]",
	"size[12,14.5]",
	"list[current_player;backpack;0.5,1;9,6;]", --56
	"list[current_player;main;0.5,9.5;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C(mcl_colors.GRAY, S("Backpack")).."]",
	"label[0.5,9;"..C(mcl_colors.GRAY, S("Inventory")).."]",
})

pala_backpack.form.endium = table.concat({
	"formspec_version[3]",
	"size[12,18]",
	"list[current_player;backpack;0.5,1;9,9;]", --81
	"list[current_player;main;0.5,13;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C(mcl_colors.GRAY, S("Backpack")).."]",
	"label[0.5,12.5;"..C(mcl_colors.GRAY, S("Inventory")).."]",
})

--Backpack------------------------------
--Amethyst
minetest.register_craftitem("pala_backpack:amethyste_backpack", {
	description = S("@1 Backpack", C(mcl_colors.DARK_PURPLE, S("Amethyste"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 9),
	inventory_image = "pala_backpack_ametyst.png",
	stack_max = 1,
	groups = {miner_level=5},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "amethyste_backpack", pala_backpack.form.amethyst)
	end,
})


--Titanium
minetest.register_craftitem("pala_backpack:titanium_backpack", {
	description = S("@1 Backpack", C(mcl_colors.DARK_GRAY, S("Titanium"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 27),
	inventory_image = "pala_backpack_titanium.png",
	stack_max = 1,
	groups = {miner_level=10},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "titanium_backpack", pala_backpack.form.titanium)
	end,
})

--Paladium
minetest.register_craftitem("pala_backpack:paladium_backpack", {
	description = S("@1 Backpack", C(mcl_colors.RED, S("Paladium"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 56),
	inventory_image = "pala_backpack_paladium.png",
	stack_max = 1,
	groups = {miner_level=15},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "paladium_backpack", pala_backpack.form.paladium)
	end,
})

--Endium
minetest.register_craftitem("pala_backpack:endium_backpack", {
	description = S("@1 Backpack", C(mcl_colors.BLUE, S("Endium"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 81),
	inventory_image = "pala_backpack_endium.png",
	stack_max = 1,
	groups = {miner_level=20},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "endium_backpack", pala_backpack.form.endium)
	end,
})

mcl_death_drop.register_dropped_list("PLAYER", "backpack", true)

--Craft (WIP) (BROKEN)
--Chest missing
if minetest.get_modpath("mcl_mobitems") and minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		output = "pala_backpack:amethyste_backpack",
		recipe = {
			{"pala_paladium:amethyst_ingot", "mcl_chests:chest", "pala_paladium:amethyst_ingot"},
			{"pala_paladium:amethyst_ingot", "mcl_hoppers:hopper", "pala_paladium:amethyst_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:amethyst_ingot", "mcl_mobitems:leather"}
		}
	})
	minetest.register_craft({
		output = "pala_backpack:titanium_backpack",
		recipe = {
			{"pala_paladium:titanium_ingot", "mcl_chests:chest", "pala_paladium:titanium_ingot"},
			{"pala_paladium:titanium_ingot", "mcl_hoppers:hopper", "pala_paladium:titanium_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:titanium_ingot", "mcl_mobitems:leather"}
		}
	})
	minetest.register_craft({
		output = "pala_backpack:paladium_backpack",
		recipe = {
			{"pala_paladium:paladium_ingot", "mcl_chests:chest", "pala_paladium:paladium_ingot"},
			{"pala_paladium:paladium_ingot", "mcl_hoppers:hopper", "pala_paladium:paladium_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:paladium_ingot", "mcl_mobitems:leather"}
		}
	})
	minetest.register_craft({
		output = "pala_backpack:endium_backpack",
		recipe = {
			{"pala_paladium:paladium_ingot", "mcl_chests:chest", "pala_paladium:paladium_ingot"},
			{"pala_paladium:paladium_ingot", "mcl_hoppers:hopper", "pala_paladium:paladium_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:endium_nugget", "mcl_mobitems:leather"}
		}
	})
end