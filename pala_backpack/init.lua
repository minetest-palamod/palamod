minetest.log("action", "[pala_backpack] loading...")

local C = minetest.colorize
local S = minetest.get_translator(minetest.get_current_modname())

local string = string

minetest.register_on_joinplayer(function(player)
	local inv = player:get_inventory()
	inv:set_size("backpack", 81) -- 9*9
end)

--[[
TODO: separate properly the hotbar from the other inventory slots
TODO: use the exact mcl2 values for spacing/pading/color
]]

pala_backpack = {}
pala_backpack.form = {}
pala_backpack.form.amethyst = table.concat({
	"formspec_version[4]",
	"size[12,8]",
	pala_core.get_itemslot_bg(0.5, 1, 9, 1),
	"list[current_player;backpack;0.5,1;9,1;]", --9 slots
	pala_core.get_itemslot_bg(0.5, 3, 9, 4),
	"list[current_player;main;0.5,3;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C("#313131", S("Backpack")).."]",
	"label[0.5,2.5;"..C("#313131", S("Inventory")).."]",
})

pala_backpack.form.titanium = table.concat({
	"formspec_version[4]",
	"size[12,10.5]",
	pala_core.get_itemslot_bg(0.5, 1, 9, 3),
	"list[current_player;backpack;0.5,1;9,3;]", --27 slots
	pala_core.get_itemslot_bg(0.5, 5.5, 9, 4),
	"list[current_player;main;0.5,5.5;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C("#313131", S("Backpack")).."]",
	"label[0.5,5;"..C("#313131", S("Inventory")).."]",
})

pala_backpack.form.paladium = table.concat({
	"formspec_version[4]",
	"size[12,14.5]",
	pala_core.get_itemslot_bg(0.5, 1, 9, 6),
	"list[current_player;backpack;0.5,1;9,6;]", --56 slots
	pala_core.get_itemslot_bg(0.5, 9.5, 9, 4),
	"list[current_player;main;0.5,9.5;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C("#313131", S("Backpack")).."]",
	"label[0.5,9;"..C("#313131", S("Inventory")).."]",
})

pala_backpack.form.endium = table.concat({
	"formspec_version[4]",
	"size[12,18]",
	pala_core.get_itemslot_bg(0.5, 1, 9, 9),
	"list[current_player;backpack;0.5,1;9,9;]", --81 slots
	pala_core.get_itemslot_bg(0.5, 13, 9, 4),
	"list[current_player;main;0.5,13;9,4;]",
	"listring[]",
	"label[0.5,0.5;"..C("#313131", S("Backpack")).."]",
	"label[0.5,12.5;"..C("#313131", S("Inventory")).."]",
})

local backpack_widths = {
	["pala_backpack:amethyste_backpack"] = 9,
	["pala_backpack:titanium_backpack"] = 27,
	["pala_backpack:paladium_backpack"] = 56,
	["pala_backpack:endium_backpack"] = 81,
}

--Disallow accessing to inventory if player hasn't the right backpack to avoid cheating

--You can test with anticheat disabled and the official palamod dragonfire test mod
--https://github.com/minetest-palamod/palamod-test-dragonfire

if not minetest.settings:get_bool("disable_anticheat", false) then
	local cheat_log = "[pala_backpack] Player [%s] tried to interact with backpack inventory without using a backpack!"

	minetest.register_allow_player_inventory_action(function(player, action, inventory, inventory_info)
		if action == "move" or action == "take" then
			if inventory_info.from_list == "backpack" then
				local backpack = backpack_widths[player:get_wielded_item():get_name()]
				if not backpack or inventory_info.from_index > backpack then
					minetest.log("action", string.format(cheat_log, player:get_player_name()))
					return 0
				end
			elseif inventory_info.to_list == "backpack" then
				local backpack = backpack_widths[player:get_wielded_item():get_name()]
				if not backpack or inventory_info.to_index > backpack then
					minetest.log("action", string.format(cheat_log, player:get_player_name()))
					return 0
				end
			end
		elseif action == "put" and inventory_info.listname == "backpack" then
			local backpack = backpack_widths[player:get_wielded_item():get_name()]
			if not backpack or inventory_info.index > backpack then
				minetest.log("action", string.format(cheat_log, player:get_player_name()))
				return 0
			end
		end
	end)
end

--Backpack------------------------------

local generic_doc = S("To use it, you just need to rightclick it and the interface will open exactly like a chest.")

--Amethyst
minetest.register_craftitem("pala_backpack:amethyste_backpack", {
	description = S("@1 Backpack", C(mcl_colors.DARK_PURPLE, S("Amethyste"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 9).."\n"..generic_doc.."\n"..S("Available from level @1 hunter", 5),
	inventory_image = "pala_backpack_ametyst.png",
	stack_max = 1,
	groups = {miner_level = 5},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "pala_backpack:amethyste", pala_backpack.form.amethyst)
	end,
})


--Titanium
minetest.register_craftitem("pala_backpack:titanium_backpack", {
	description = S("@1 Backpack", C(mcl_colors.DARK_GRAY, S("Titanium"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 27).."\n"..generic_doc.."\n"..S("Available from level @1 hunter", 10),
	inventory_image = "pala_backpack_titanium.png",
	stack_max = 1,
	groups = {miner_level = 10},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "pala_backpack:titanium", pala_backpack.form.titanium)
	end,
})

--Paladium
minetest.register_craftitem("pala_backpack:paladium_backpack", {
	description = S("@1 Backpack", C(mcl_colors.RED, S("Paladium"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 56).."\n"..generic_doc.."\n"..S("Available from level @1 hunter", 15),
	inventory_image = "pala_backpack_paladium.png",
	stack_max = 1,
	groups = {miner_level = 15},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "pala_backpack:paladium", pala_backpack.form.paladium)
	end,
})

--Endium
minetest.register_craftitem("pala_backpack:endium_backpack", {
	description = S("@1 Backpack", C(mcl_colors.BLUE, S("Endium"))),
	_doc_items_longdesc = S("Offers @1 storage slots", 81).."\n"..generic_doc.."\n"..S("Available from level @1 hunter", 20),
	inventory_image = "pala_backpack_endium.png",
	stack_max = 1,
	groups = {miner_level = 20},
	on_use = function(itemstack, player, pointed_thing)
		minetest.show_formspec(player:get_player_name(), "pala_backpack:endium", pala_backpack.form.endium)
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
		},
	})
	minetest.register_craft({
		output = "pala_backpack:titanium_backpack",
		recipe = {
			{"pala_paladium:titanium_ingot", "mcl_chests:chest", "pala_paladium:titanium_ingot"},
			{"pala_paladium:titanium_ingot", "mcl_hoppers:hopper", "pala_paladium:titanium_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:titanium_ingot", "mcl_mobitems:leather"}
		},
	})
	minetest.register_craft({
		output = "pala_backpack:paladium_backpack",
		recipe = {
			{"pala_paladium:paladium_ingot", "mcl_chests:chest", "pala_paladium:paladium_ingot"},
			{"pala_paladium:paladium_ingot", "mcl_hoppers:hopper", "pala_paladium:paladium_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:paladium_ingot", "mcl_mobitems:leather"}
		},
	})
	minetest.register_craft({
		output = "pala_backpack:endium_backpack",
		recipe = {
			{"pala_paladium:paladium_ingot", "mcl_chests:chest", "pala_paladium:paladium_ingot"},
			{"pala_paladium:paladium_ingot", "mcl_hoppers:hopper", "pala_paladium:paladium_ingot"},
			{"mcl_mobitems:leather", "pala_paladium:endium_nugget", "mcl_mobitems:leather"}
		},
	})
end

minetest.log("action", "[pala_backpack] loaded succesfully")
