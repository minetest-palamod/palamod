local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_node("pala_luckyblock:trophy_25", {
	description = S("Trophy 25%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_25_top.png",
		"pala_luckyblock_trophy_25_top.png",
		"pala_luckyblock_trophy_25_side.png",
		"pala_luckyblock_trophy_25_side.png",
		"pala_luckyblock_trophy_25_side.png",
		"pala_luckyblock_trophy_25_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
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
})

minetest.register_node("pala_luckyblock:trophy_50", {
	description = S("Trophy 50%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_50_top.png",
		"pala_luckyblock_trophy_50_top.png",
		"pala_luckyblock_trophy_50_side2.png",
		"pala_luckyblock_trophy_50_side2.png",
		"pala_luckyblock_trophy_50_side1.png",
		"pala_luckyblock_trophy_50_side1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
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
})


minetest.register_node("pala_luckyblock:trophy_75", {
	description = S("Trophy 75%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_75_top.png",
		"pala_luckyblock_trophy_75_top.png",
		"pala_luckyblock_trophy_75_side2.png",
		"pala_luckyblock_trophy_75_side2.png",
		"pala_luckyblock_trophy_75_side1.png",
		"pala_luckyblock_trophy_75_side1.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
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
})

minetest.register_node("pala_luckyblock:trophy_100", {
	description = S("Trophy 100%"),
	stack_max = 1,
	tiles = {
		"pala_luckyblock_trophy_100_top.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png",
		"pala_luckyblock_trophy_100_side.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
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
})