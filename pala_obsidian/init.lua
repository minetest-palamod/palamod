local has_mcl_core = minetest.get_modpath("mcl_core")

minetest.register_node("pala_obsidian:two_life_obsidian", {
	description = ("Two Life Obsidian"),
	_doc_items_longdesc = ([[
		Two Life Obsidian is an extremely hard mineral with an enourmous blast-resistance.
		Place an obsidian on its break
		]]),
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name="mcl_core:obsidian"})
	end,
})


if minetest.get_modpath("mcl_explosions") then
	minetest.register_node("pala_obsidian:explode_obsidian", {
		description = ("Explode Obsidian"),
		_doc_items_longdesc = ([[
			Explode Obsidian is an extremely hard mineral with an enourmous blast-resistance.
			Explode on its break
			]]),
		tiles = {"default_obsidian.png^[colorize:#fc4141:100"},
		is_ground_content = true,
		stack_max = 64,
		--groups = {cracky = 1, level = 2},
		sounds = mcl_sounds.node_sound_stone_defaults(),
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			mcl_explosions.explode(pos, 5, { drop_chance = 1.0 }, digger)
		end
	})
end

if minetest.get_modpath("mcl_stairs") then
	mcl_stairs.register_slab("obsidian", "mcl_core:obsidian",
		{pickaxey=5, building_block=1, material_stone=1},
		{"default_obsidian.png"},
		("Obsidian Slab"), mcl_sounds.node_sound_stone_defaults(), 1200, 50,
		("Double Obsidian Slab"))
	--[[mcl_stairs.register_stair(subname, recipeitem,
		groups,
		images,
		description,
		sounds, blast-resistance, hardness,
		corner_stair_texture_override)
	]]
	mcl_stairs.register_stair("obsidian", "mcl_core:obsidian",
		{pickaxey=5, building_block=1, material_stone=1},
		{"default_obsidian.png"},
		("Obsidian Stairs"),
		mcl_sounds.node_sound_stone_defaults(), 1200, 50,
		"woodlike")
end


if minetest.get_modpath("mcl_doors") then
	mcl_doors:register_door("pala_obsidian:obsidian_door", {
		description = ("Protected Obsidian Door"),
		--_doc_items_longdesc = wood_longdesc,
		--_doc_items_usagehelp = wood_usagehelp,
		inventory_image = "pala_obsidian_item_obsidian.png",
		groups = {pickaxey=5, building_block=1, material_stone=1},
		_mcl_hardness = 50,
		_mcl_blast_resistance = 1200,
		tiles_bottom = {"pala_obsidian_door_obsidian_lower.png", "pala_obsidian_door_obsidian_side_lower.png"},
		tiles_top = {"pala_obsidian_door_obsidian_upper.png", "pala_obsidian_door_obsidian_side_upper.png"},
		sounds = mcl_sounds.node_sound_wood_defaults(),
	})
	mcl_doors:register_trapdoor("pala_obsidian:obsidian_trapdoor", {
		description = ("Protected Obsidian Trap Door"),
		--_doc_items_longdesc = wood_longdesc,
		--_doc_items_usagehelp = wood_usagehelp,
		inventory_image = "pala_obsidian_trapdoor_obsidian_front.png",
		groups = {pickaxey=5, building_block=1, material_stone=1},
		_mcl_hardness = 50,
		_mcl_blast_resistance = 1200,
		tile_front = "pala_obsidian_trapdoor_obsidian_front.png",
		tile_side = "pala_obsidian_trapdoor_obsidian_side.png",
		sounds = mcl_sounds.node_sound_wood_defaults(),
	})
end

--TODO:Craft
--#2e0051
-- if minetest.get_modpath("mcl_doors") then
	-- mcl_doors.register_door("pala_obsidian:obsidian_door", {
		-- "Protected Door",
		-- "default_stone.png",
		-- {pickaxey=5, building_block=1, material_stone=1},
		-- sounds = mcl_sounds.node_sound_stone_defaults(),
		-- _mcl_blast_resistance = 1200,
		-- _mcl_hardness = 50,
	-- })
-- end

--V7--------------------------------------------------
--Hardened Obsidian
minetest.register_node("pala_obsidian:hardened_obsidian", {
	description = ("Hardened Obsidian"),
	_doc_items_longdesc = ([[
		Hardened Obsidian is an extremely hard mineral with an enourmous blast-resistance.
		Breaks with a magical tool.
		]]),
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {magical_tool=1, building_block=1, material_stone=1,},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
})

if has_mcl_core then
	minetest.register_craft({
		output = 'pala_obsidian:hardened_obsidian 4',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", ""},
			{"mcl_core:obsidian", "mcl_core:obsidian", ""},
			{"", "", ""},
		}
	})
end

minetest.register_tool("pala_obsidian:magical_tool", {
    description = "My Tool",
    inventory_image = "default_stone.png",
    tool_capabilities = {
        full_punch_interval = 1.5,
        max_drop_level = 1,
        groupcaps = {
            magical_tool = {
                maxlevel = 2,
                uses = 2000,
                times = { [1]=0.05}
            },
        },
        damage_groups = {fleshy=2},
    },
})

--Lava Obsidian
minetest.register_node("pala_obsidian:lava_obsidian", {
	description = ("Lava Obsidian"),
	_doc_items_longdesc = ([[
		Obsidian is an extremely hard mineral with an enourmous blast-resistance.
		Place an lava source on its break
		]]),
	tiles = {"pala_obsidian_lava_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {pickaxey=5, building_block=1, material_stone=1, miner_level = 7},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name="mcl_core:lava_source"})
	end,
})

if has_mcl_core and minetest.get_modpath("mcl_buckets") then
	minetest.register_craft({
		output = 'pala_obsidian:lava_obsidian',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			{"pala_fakewater:bucket_fakewater", "pala_fakewater:bucket_fakewater", "pala_fakewater:bucket_fakewater"},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
		}
	})
end

--Big Obsidian
minetest.register_node("pala_obsidian:big_obsidian", {
	description = ("Big Obsidian"),
	_doc_items_longdesc = ([[
		Obsidian is an extremely hard mineral with an enourmous blast-resistance.
		Place an lava sourcesn on its break
		]]),
	tiles = {"default_obsidian.png^pala_obsidian_big_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {pickaxey=5, building_block=1, material_stone=1, miner_level = 7},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name="mcl_core:obsidian"})
	end,
})

--TODO:fix paladium core missing
if has_mcl_core and minetest.get_modpath("pala_craftstick") then
	minetest.register_craft({
		output = 'pala_obsidian:big_obsidian',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			{"mcl_core:obsidian", "", "mcl_core:obsidian"},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
		}
	})
end


--Fake Obsidian
if minetest.get_modpath("pala_fakewater") then
	minetest.register_node("pala_obsidian:fake_obsidian", {
		description = ("Fake Obsidian"),
		_doc_items_longdesc = ([[
			Fake Obsidian is an extremely hard mineral with an enourmous blast-resistance.
			Place an fake water source on its break
			]]),
		tiles = {"pala_obsidian_fake_obsidian.png"},
		is_ground_content = true,
		stack_max = 64,
		groups = {pickaxey=5, building_block=1, material_stone=1, miner_level = 8},
		sounds = mcl_sounds.node_sound_stone_defaults(),
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name="pala_fakewater:fakewater_source"})
		end,
	})
end

if has_mcl_core and minetest.get_modpath("pala_craftstick") then
	minetest.register_craft({
		output = 'pala_obsidian:fake_obsidian',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			{"mcl_core:obsidian", "", "mcl_core:obsidian"},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
		}
	})
end

--Boom obsidian
minetest.register_node("pala_obsidian:boom_obsidian", {
	description = ("Boom Obsidian"),
	_doc_items_longdesc = ([[
		Obsidian is an extremely hard mineral with an enourmous blast-resistance.
		Give a poison effect to players
		]]),
	tiles = {"default_obsidian.png^pala_obsidian_boom_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {pickaxey=5, building_block=1, material_stone=1, miner_level = 4},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		mcl_explosions.explode(pos, 8, {griefing=false}, digger)
	end,
})

if has_mcl_core and minetest.get_modpath("pala_dynamite") then
	minetest.register_craft({
		output = 'pala_obsidian:boom_obsidian',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			{"", "", ""},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			--TODO:big dynamite
		}
	})
end

--Poison Obsidian
local function poison_apply(pos)
	for _,obj in ipairs(minetest.get_objects_inside_radius(pos, 7)) do
		if obj:is_player() then
			mcl_potions.poison_func(obj, 6, 5)
		end
	end
end
minetest.register_node("pala_obsidian:poison_obsidian", {
	description = ("Poison Obsidian"),
	_doc_items_longdesc = ([[
		Obsidian is an extremely hard mineral with an enourmous blast-resistance.
		Give a poison effect to players
		]]),
	tiles = {"default_obsidian.png^[colorize:#1c6222:100"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	--groups = {cracky = 1, level = 2, miner_level = 12},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_destruct = function(pos, oldnode)
		poison_apply(pos)
	end,
})

if has_mcl_core and minetest.get_modpath("mcl_potions") then
	minetest.register_craft({
		output = 'pala_obsidian:poison_obsidian',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			{"mcl_potions:poison_2_splash", "mcl_core:obsidian", "mcl_potions:poison_2_splash"},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
		}
	})
end

--Wither Obsidian
minetest.register_node("pala_obsidian:wither_obsidian", {
	description = ("Wither Obsidian"),
	_doc_items_longdesc = ("Obsidian is an extremely hard mineral with an enourmous blast-resistance."),
	tiles = {"default_obsidian.png^pala_obsidian_wither_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	--groups = {cracky = 1, level = 2, miner_level = 12},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		--TODO: Check if digger is Wither
		local playerpos = digger:get_pos()
		local pos2 = {x=playerpos.x-3,y=playerpos.y-1,z=playerpos.z-3}
		local path = minetest.get_modpath("pala_obsidian") .. "/schematics/pala_obsidian_cage.mts"
		minetest.place_schematic(pos2, path, 0, nil, true)
	end,
})

--TODO:fix diamond chest missing
if has_mcl_core and minetest.get_modpath("mcl_potions") then
	minetest.register_craft({
		output = 'pala_obsidian:wither_obsidian',
		recipe = {
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			{"", "mcl_core:obsidian", ""},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
		}
	})
end
