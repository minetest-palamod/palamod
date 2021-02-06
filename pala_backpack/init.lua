minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size('backpack', 81) -- 9*9
end)

minetest.register_on_dieplayer(function(player)
	local inv = player:get_inventory()
	for i = 1, 27 do
		if inv:get_stack("main", i).name == "pala_backpack:amethyste_backpack" then
			pala_backpack.clear_player(3)
		end
	end
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
	"listcolors[#9990;#FFF7;#FFF0;#000;#FFF]",
	"label[0.5,0.5;"..minetest.colorize("#313131", "Backpack").."]",
	"label[0.5,2.5;"..minetest.colorize("#313131", "Inventory").."]",
})

pala_backpack.form.titanium = table.concat({
	"formspec_version[3]",
	"size[12,10.5]",
	"list[current_player;backpack;0.5,1;9,3;]", --27
	"list[current_player;main;0.5,5.5;9,4;]",
	"listring[]",
	"listcolors[#9990;#FFF7;#FFF0;#000;#FFF]",
	"label[0.5,0.5;"..minetest.colorize("#313131", "Backpack").."]",
	"label[0.5,5;"..minetest.colorize("#313131", "Inventory").."]",
})

pala_backpack.form.paladium = table.concat({
	"formspec_version[3]",
	"size[12,14.5]",
	"list[current_player;backpack;0.5,1;9,6;]", --56
	"list[current_player;main;0.5,9.5;9,4;]",
	"listring[]",
	"listcolors[#9990;#FFF7;#FFF0;#000;#FFF]",
	"label[0.5,0.5;"..minetest.colorize("#313131", "Backpack").."]",
	"label[0.5,9;"..minetest.colorize("#313131", "Inventory").."]",
})

pala_backpack.form.endium = table.concat({
	"formspec_version[3]",
	"size[12,18]",
	"list[current_player;backpack;0.5,1;9,9;]", --81
	"list[current_player;main;0.5,13;9,4;]",
	"listring[]",
	"listcolors[#9990;#FFF7;#FFF0;#000;#FFF]",
	"label[0.5,0.5;"..minetest.colorize("#313131", "Backpack").."]",
	"label[0.5,12.5;"..minetest.colorize("#313131", "Inventory").."]",
})

function pala_backpack.clear_player(player, line)
	local inv = player:get_inventory()
	local pos = player:get_pos()
	for i = 1, 9*line do
		local stack = inv:get_stack("backpack", i)
		inv:set_stack("backpack", i, nil)
		minetest.add_item(pos, stack:get_name())
	end
end


--Backpack------------------------------
--Amethyst
minetest.register_craftitem("pala_backpack:amethyste_backpack", {
	description = (minetest.colorize("#9f2bd1", "Ametyste").." Backpack"),
	_doc_items_longdesc = ("Offers 9 storage slots"),
	inventory_image = "pala_backpack_ametyst.png",
	stack_max = 1,
	groups = {miner_level=5},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "amethyste_backpack", pala_backpack.form.amethyst)
	end,
})


--Titanium
minetest.register_craftitem("pala_backpack:titanium_backpack", {
	description = (minetest.colorize("#666666", "Titanium").." Backpack"),
	_doc_items_longdesc = ("Offers 27 storage slots"),
	inventory_image = "pala_backpack_titanium.png",
	stack_max = 1,
	groups = {miner_level=10},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "titanium_backpack", pala_backpack.form.titanium)
	end,
})

--Paladium
minetest.register_craftitem("pala_backpack:paladium_backpack", {
	description = (minetest.colorize("#f9aa3b", "Paladium").." Backpack"),
	_doc_items_longdesc = ("Offers 56 storage slots"),
	inventory_image = "pala_backpack_paladium.png",
	stack_max = 1,
	groups = {miner_level=15},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "paladium_backpack", pala_backpack.form.paladium)
	end,
})

--Endium
minetest.register_craftitem("pala_backpack:endium_backpack", {
	description = (minetest.colorize("#0e32d3", "Endium").." Backpack"),
	_doc_items_longdesc = ("Offers 81 storage slots"),
	inventory_image = "pala_backpack_endium.png",
	stack_max = 1,
	groups = {miner_level=20},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "endium_backpack", pala_backpack.form.endium)
	end,
})

--Craft (WIP)
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