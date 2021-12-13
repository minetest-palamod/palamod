--local S = minetest.get_translator(minetest.get_current_modname())
local has_mcl_core = minetest.get_modpath("mcl_core")

local modpath = minetest.get_modpath(minetest.get_current_modname())

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

--[[
TODO: add paladium core craftitem to craft receipe then added
]]

if has_mcl_core and minetest.get_modpath("pala_craftitems") then
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

if has_mcl_core and minetest.get_modpath("pala_craftitems") then
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
			{"pala_dynamite:dynamite_big", "pala_dynamite:dynamite_big", "pala_dynamite:dynamite_big"},
			{"mcl_core:obsidian", "mcl_core:obsidian", "mcl_core:obsidian"},
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


--https://youtu.be/W1MuBf2B-U8&t=638
--TODO: add craft
pala_obsidian.register_custom_obsidian("redstone_off", {
	desc = "Redstone Obsidian",
	longdesc = "Transmits redstone power",
	tiles = {
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_off_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_off_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_off_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_off_obsidian.png",
	},
	groups = {
		pickaxey = 5,
		building_block = 1,
		material_stone = 1,
		pickaxey_obsidian = 5,
		mesecon_conductor_craftable = 1,
	},
	mesecons = {
		conductor = {
			state = mesecon.state.off,
			onstate = "pala_obsidian:redstone_on_obsidian",
		},
	},
})

pala_obsidian.register_custom_obsidian("redstone_on", {
	desc = "Redstone Obsidian",
	longdesc = "Transmits redstone power",
	tiles = {
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_on_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_on_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_on_obsidian.png",
		"default_obsidian.png^pala_obsidian_redstone_on_obsidian.png",
	},
	groups = {
		pickaxey = 5,
		building_block = 1,
		material_stone = 1,
		pickaxey_obsidian = 5,
		mesecon_conductor_craftable = 1,
		not_in_creative_inventory = 1,
	},
	mesecons = {
		conductor = {
			state = mesecon.state.on,
			offstate = "pala_obsidian:redstone_off_obsidian",
		},
	},
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
		--[[
		TODO: Check if digger is Wither to spawn the obsidian cage
		]]
		local playerpos = digger:get_pos()
		local pos2 = vector.add(playerpos, vector.new(-3, -1, -3))
		minetest.place_schematic(pos2, modpath.."/schematics/pala_obsidian_cage.mts", 0, nil, true)
	end,
})

--[[
TODO: add diamond chest to craft then fully working
]]

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