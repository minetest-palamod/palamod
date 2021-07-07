local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize
local CE = minetest.get_color_escape_sequence

--https://youtu.be/nvyPOKz37pE?t=66

local function preserve_metadata(pos, oldnode, oldmeta, drops)
	drops[1]:get_meta():set_string("pala_luckyblock:owner", oldmeta["pala_luckyblock:owner"] or "")
	tt.reload_itemstack_description(drops[1])
end

local function after_place_node(pos, placer, itemstack, pointed_thing)
	local node_meta = minetest.get_meta(pos)
	local item_meta = itemstack:get_meta()
	node_meta:set_string("pala_luckyblock:owner", item_meta:get_string("pala_luckyblock:owner"))
	node_meta:set_string("infotext", S("@1's Trophy", placer:get_player_name() or "somebody"))
end

minetest.register_node("pala_luckyblock:trophy_25", {
	description = CE(mcl_colors.YELLOW)..S("Trophy @1", CE(mcl_colors.AQUA).."25%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_25_top.png",
		"pala_luckyblock_trophy_25_top.png",
		"pala_luckyblock_trophy_25_side.png",
		"pala_luckyblock_trophy_25_side.png",
		"pala_luckyblock_trophy_25_side.png",
		"pala_luckyblock_trophy_25_side.png"
	},
	use_texture_alpha = "opaque",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- foot
			{-0.0625, -0.5, -0.0625, 0.0625, 0.0625, 0.0625}, -- foot2
			{-0.1875, 0.125, -0.1875, -0.125, 0.5, 0.1875}, -- side1
			{-0.1875, 0.0625, -0.1875, 0.1875, 0.125, 0.1875}, -- botom
			{0.125, 0.125, -0.1875, 0.1875, 0.5, 0.1875}, -- NodeBox5
			{-0.1875, 0.125, -0.1875, 0.1875, 0.5, -0.125}, -- NodeBox6
			{-0.1875, 0.125, 0.125, 0.1875, 0.5, 0.1875}, -- NodeBox7
		}
	},
	groups = {building_block = 1},
	preserve_metadata = preserve_metadata,
	after_place_node = after_place_node,
	_pala_luckyblock_percentage_desc = "25%",
})

minetest.register_node("pala_luckyblock:trophy_50", {
	description = CE(mcl_colors.YELLOW)..S("Trophy @1", CE(mcl_colors.AQUA).."50%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_50_top.png",
		"pala_luckyblock_trophy_50_top.png",
		"pala_luckyblock_trophy_50_side2.png",
		"pala_luckyblock_trophy_50_side2.png",
		"pala_luckyblock_trophy_50_side1.png",
		"pala_luckyblock_trophy_50_side1.png"
	},
	use_texture_alpha = "opaque",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- foot
			{-0.0625, -0.375, -0.0625, 0.0625, 0.0625, 0.0625}, -- foot2
			{-0.1875, 0.125, -0.1875, -0.125, 0.5, 0.1875}, -- side1
			{-0.1875, 0.0625, -0.1875, 0.1875, 0.125, 0.1875}, -- botom
			{0.125, 0.125, -0.1875, 0.1875, 0.5, 0.1875}, -- side2
			{-0.1875, 0.125, -0.1875, 0.1875, 0.5, -0.125}, -- side3
			{-0.1875, 0.125, 0.125, 0.1875, 0.5, 0.1875}, -- side4
			{0.1875, 0.1875, -0.0625, 0.3125, 0.4375, 0.0625}, -- handle1
			{-0.3125, 0.1875, -0.0625, -0.1875, 0.4375, 0.0625}, -- NodeBox9
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox10
		}
	},
	groups = {building_block = 1},
	preserve_metadata = preserve_metadata,
	after_place_node = after_place_node,
	_pala_luckyblock_percentage_desc = "50%",
})


minetest.register_node("pala_luckyblock:trophy_75", {
	description = CE(mcl_colors.YELLOW)..S("Trophy @1", CE(mcl_colors.AQUA).."75%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_75_top.png",
		"pala_luckyblock_trophy_75_top.png",
		"pala_luckyblock_trophy_75_side2.png",
		"pala_luckyblock_trophy_75_side2.png",
		"pala_luckyblock_trophy_75_side1.png",
		"pala_luckyblock_trophy_75_side1.png"
	},
	use_texture_alpha = "opaque",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- foot
			{-0.0625, -0.375, -0.0625, 0.0625, 0.0625, 0.0625}, -- foot2
			{-0.1875, 0.125, -0.1875, -0.125, 0.5, 0.1875}, -- side1
			{-0.1875, 0.0625, -0.1875, 0.1875, 0.125, 0.1875}, -- botom
			{0.125, 0.125, -0.1875, 0.1875, 0.5, 0.1875}, -- side2
			{-0.1875, 0.125, -0.1875, 0.1875, 0.5, -0.125}, -- side3
			{-0.1875, 0.125, 0.125, 0.1875, 0.5, 0.1875}, -- side4
			{0.1875, 0.1875, -0.0625, 0.3125, 0.4375, 0.0625}, -- handle1
			{-0.3125, 0.1875, -0.0625, -0.1875, 0.4375, 0.0625}, -- NodeBox9
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox10
			{0.3125, 0.25, -0.0625, 0.375, 0.4375, 0.0625}, -- NodeBox11
			{-0.375, 0.25, -0.0625, -0.3125, 0.4375, 0.0625}, -- NodeBox12
		}
	},
	groups = {building_block = 1},
	preserve_metadata = preserve_metadata,
	after_place_node = after_place_node,
	_pala_luckyblock_percentage_desc = "75%",
})

minetest.register_node("pala_luckyblock:trophy_100", {
	description = CE(mcl_colors.YELLOW)..S("Trophy @1", CE(mcl_colors.AQUA).."100%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_100_top.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png"
	},
	use_texture_alpha = "opaque",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	node_box = {
		type = "fixed",
		fixed = {
			{-0.1875, -0.5, -0.1875, 0.1875, -0.4375, 0.1875}, -- foot
			{-0.0625, -0.375, -0.0625, 0.0625, 0, 0.0625}, -- foot2
			{-0.1875, 0.0625, -0.1875, -0.125, 0.4375, 0.1875}, -- side1
			{-0.1875, 0, -0.1875, 0.1875, 0.0625, 0.1875}, -- botom
			{0.125, 0.0625, -0.1875, 0.1875, 0.4375, 0.1875}, -- side2
			{-0.1875, 0.0625, -0.1875, 0.1875, 0.4375, -0.125}, -- side3
			{-0.1875, 0.0625, 0.125, 0.1875, 0.4375, 0.1875}, -- side4
			{0.1875, 0.125, -0.0625, 0.3125, 0.375, 0.0625}, -- handle1
			{-0.3125, 0.125, -0.0625, -0.1875, 0.375, 0.0625}, -- NodeBox9
			{-0.125, -0.4375, -0.125, 0.125, -0.375, 0.125}, -- NodeBox10
			{0.3125, 0.1875, -0.0625, 0.375, 0.375, 0.0625}, -- NodeBox11
			{-0.375, 0.1875, -0.0625, -0.3125, 0.375, 0.0625}, -- NodeBox12
			{-0.0625, 0.125, -0.3125, 0.0625, 0.375, -0.1875}, -- NodeBox13
			{-0.0625, 0.125, 0.1875, 0.0625, 0.375, 0.3125}, -- NodeBox14
			{-0.0625, 0.1875, 0.3125, 0.0625, 0.375, 0.375}, -- NodeBox15
			{-0.0625, 0.1875, -0.375, 0.0625, 0.375, -0.3125}, -- NodeBox16
			{0.1875, -0.5, -0.25, 0.25, -0.375, -0.1875}, -- NodeBox17
			{-0.25, -0.5, -0.25, -0.1875, -0.375, -0.1875}, -- NodeBox18
			{-0.25, -0.5, 0.1875, -0.1875, -0.375, 0.25}, -- NodeBox19
			{0.1875, -0.5, 0.1875, 0.25, -0.375, 0.25}, -- NodeBox20
			{0.1875, 0.375, -0.25, 0.25, 0.5, -0.1875}, -- NodeBox21
			{-0.25, 0.375, -0.25, -0.1875, 0.5, -0.1875}, -- NodeBox22
			{-0.25, 0.375, 0.1875, -0.1875, 0.5, 0.25}, -- NodeBox23
			{0.1875, 0.375, 0.1875, 0.25, 0.5, 0.25}, -- NodeBox24
		}
	},
	groups = {building_block = 1},
	preserve_metadata = preserve_metadata,
	after_place_node = after_place_node,
	_pala_luckyblock_percentage_desc = "100%",
})

tt.register_priority_snippet(function(_, _, itemstack)
	if not itemstack then
		return
	end
	local owner = itemstack:get_meta():get_string("pala_luckyblock:owner")
	local text = ""
	if owner ~= "" then
		text = text..
			C(mcl_colors.YELLOW,
				S("This trophy was awarded to @1",
					C(mcl_colors.BLUE, owner)
				).."\n"..
				S("for getting @1",
					C(mcl_colors.GREEN, itemstack:get_definition()._pala_luckyblock_percentage_desc)
				).."\n"..
				S("of all Luckyblocks events")
			)
	end
	if text ~= "" then
		if not itemstack:get_definition()._tt_original_description then
			text = text:sub(1, text:len() - 1)
		end
		return text, false
	end
end)

if minetest.settings:get("palamod.debug", false) then
	--TESTING COMMAND
	minetest.register_chatcommand("pala_luckyblock:trophy", {
		func = function(name)
			local player = minetest.get_player_by_name(name)
			local itemstack = player:get_wielded_item()
			itemstack:get_meta():set_string("pala_luckyblock:owner", "AFCM")
			tt.reload_itemstack_description(itemstack)
			player:set_wielded_item(itemstack)
		end,
	})
end