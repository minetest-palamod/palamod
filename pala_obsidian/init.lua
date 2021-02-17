local has_mcl_core = minetest.get_modpath("mcl_core")
local has_pala_paladium = minetest.get_modpath("pala_paladium")
local has_pala_craftstick = minetest.get_modpath("pala_craftstick")
local wield_scale = { x = 1.8, y = 1.8, z = 1 }

pala_obsidian = {}
pala_obsidian.registered_custom_obsidian = {}
pala_obsidian.modpath = minetest.get_modpath(minetest.get_current_modname())

local pala_obsidian_modpath = pala_obsidian.modpath

function pala_obsidian.register_custom_obsidian(name, def)
	local newname = "pala_obsidian:"..name.."_obsidian"
	pala_obsidian.registered_custom_obsidian[newname] = {
		name=def.name,
		desc=def.desc,
		longdesc=def.longdesc,
		tiles=def.tiles,
		overlay=def.overlay,
		color=def.color,
		miner_level=def.miner_level,
		after_dig=def.after_dig
	}
	minetest.register_node(newname, {
		description = def.desc,
		_doc_items_longdesc = (
			def.desc.." is an extremely hard mineral with an enourmous blast-resistance."..def.longdesc
			),
		tiles = def.tiles,
		overlay_tiles = def.overlay,
		color = def.color,
		is_ground_content = true,
		stack_max = 64,
		sounds = mcl_sounds.node_sound_stone_defaults(),
		groups = {pickaxey=5, building_block=1, material_stone=1, miner_level = def.miner_level},
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			--if not digger:get_wielded_item():get_name() == "pala_obsidian:obsidian_pick" then
			def.after_dig(pos, oldnode, oldmetadata, digger)
			--end
		end,
	})
end

-- minetest.register_tool("pala_obsidian:obsidian_pick", {
	-- description = ("Obsidian Pickaxe"),
	-- _doc_items_longdesc = pickaxe_longdesc,
	-- inventory_image = "default_tool_diamondpick.png",
	-- wield_scale = wield_scale,
	-- groups = { tool=1, pickaxe=1, dig_speed_class=5, enchantability=10 },
	-- tool_capabilities = {
		-- -- 1/1.2
		-- full_punch_interval = 0.83333333,
		-- max_drop_level=5,
		-- groupcaps={
			-- pickaxey_dig_diamond = {times=mcl_autogroup.digtimes.pickaxey_dig_diamond, uses=1562, maxlevel=0},
		-- },
		-- damage_groups = {fleshy=5},
		-- punch_attack_uses = 781,
	-- },
	-- sound = { breaks = "default_tool_breaks" },
-- })

pala_obsidian.register_custom_obsidian("two_life", {
	desc = "Two Life Obsidian",
	longdesc = "Place an obsidian on its break",
	tiles = {"default_obsidian.png"},
	miner_level = 0,
	after_dig = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name="mcl_core:obsidian"})
	end,
})

if minetest.get_modpath("mcl_explosions") then
	pala_obsidian.register_custom_obsidian("explode", {
		desc = "Explode Obsidian",
		longdesc = "Explode on its break",
		tiles = {"default_obsidian.png^[colorize:#fc4141:100"},
		miner_level = 0,
		after_dig = function(pos, oldnode, oldmetadata, digger)
			mcl_explosions.explode(pos, 5, { drop_chance = 1.0 }, digger)
		end,
	})
end

pala_obsidian.register_custom_obsidian("lava", {
	desc = "Lava Obsidian",
	longdesc = "Place a lava source on its break",
	tiles = {"pala_obsidian_lava_obsidian.png"},
	miner_level = 7,
	after_dig = function(pos, oldnode, oldmetadata, digger)
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

pala_obsidian.register_custom_obsidian("big", {
	desc = "Big Obsidian",
	longdesc = "Place an obsidian block on its break",
	tiles = {"default_obsidian.png^pala_obsidian_big_obsidian.png"},
	miner_level = 7,
	after_dig = function(pos, oldnode, oldmetadata, digger)
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

pala_obsidian.register_custom_obsidian("fake", {
	desc = "Fake Obsidian",
	longdesc = "Place a fake water source on its break",
	tiles = {"pala_obsidian_fake_obsidian.png"},
	miner_level = 8,
	after_dig = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name="pala_fakewater:fakewater_source"})
	end,
})

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

pala_obsidian.register_custom_obsidian("boom", {
	desc = "Boom Obsidian",
	longdesc = "Explode with no griefing on its break",
	tiles = {"default_obsidian.png^pala_obsidian_boom_obsidian.png"},
	miner_level = 4,
	after_dig = function(pos, oldnode, oldmetadata, digger)
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

pala_obsidian.register_custom_obsidian("poison", {
	desc = "Poison Obsidian",
	longdesc = "Give a poison effect to players",
	tiles = {"default_obsidian.png^[colorize:#1c6222:100"},
	miner_level = 12,
	after_dig = function(pos, oldnode, oldmetadata, digger)
		for _,obj in ipairs(minetest.get_objects_inside_radius(pos, 7)) do
			if obj:is_player() then
				mcl_potions.poison_func(obj, 6, 5)
			end
		end
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

pala_obsidian.register_custom_obsidian("wither", {
	desc = "Wither Obsidian",
	longdesc = "Catch digger in an obsidian if digger is Wither (WIP)",
	tiles = {"default_obsidian.png^pala_obsidian_wither_obsidian.png"},
	miner_level = 12,
	after_dig = function(pos, oldnode, oldmetadata, digger)
		--TODO: Check if digger is Wither
		local playerpos = digger:get_pos()
		local pos2 = {x=playerpos.x-3,y=playerpos.y-1,z=playerpos.z-3}
		minetest.place_schematic(pos2, pala_obsidian_modpath.."/schematics/pala_obsidian_cage.mts", 0, nil, true)
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


--Spikes Obsidians
if minetest.get_modpath("pala_spikes") then
	for name,value in pairs(pala_spikes.registered_spikes) do
		pala_obsidian.register_custom_obsidian(value.name, {
			desc = "Spike Obsidian "..value.desc,
			longdesc = "Place a "..value.name.." spike on its break",
			tiles = {"pala_obsidian_spike_overlay.png"},
			overlay = {"pala_obsidian_spike_obsidian_overlay.png"},
			color = value.color,
			miner_level = 12,
			after_dig = function(pos, oldnode, oldmetadata, digger)
				minetest.set_node(pos, {name=name})
			end,
		})
		minetest.register_craft({
			output = "pala_obsidian:spike_obsidian_"..value.name,
			recipe = {
				{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
				{"mcl_core:obsidian", name, "mcl_core:obsidian"},
				{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
			}
		})
	end
end

--DECO BLOCKS
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
    description = "Magical Tool",
    inventory_image = "pala_obsidian_magical_tool.png",
	wield_scale = wield_scale,
	on_place = function(itemstack, user, pointed_thing)
		local pos = minetest.get_pointed_thing_position(pointed_thing)
		local node = minetest.get_node(pos)
		if not minetest.is_protected(pos, user) and node.name == "pala_obsidian:hardened_obsidian" then
			minetest.dig_node(pos)
		end
	end,
})

if has_pala_paladium and has_pala_craftstick then
	minetest.register_craft({
		output = 'pala_obsidian:magical_tool',
		recipe = {
			{"", "pala_paladium:paladium_ingot", ""},
			{"pala_paladium:paladium_ingot", "pala_paladium:paladiumblock", "pala_paladium:paladium_ingot"},
			{"", "pala_craftstick:palastick", ""},
		}
	})
end

