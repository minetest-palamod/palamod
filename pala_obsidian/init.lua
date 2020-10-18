
palafake_color = "#5e99f7"

minetest.register_node("pala_obsidian:two_life_obsidian", {
	description = ("Two Life Obsidian"),
	_doc_items_longdesc = ("Two Life Obsidian is an extremely hard mineral with an enourmous blast-resistance. Place an obsidian on its break"),
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	--groups = {cracky = 1, level = 2},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		minetest.set_node(pos, {name="mcl_core:obsidian"})
	end,
})

if minetest.get_modpath("pala_fakewater") then
	minetest.register_node("pala_obsidian:fake_obsidian", {
		description = ("Fake Obsidian"),
		_doc_items_longdesc = ("Fake Obsidian is an extremely hard mineral with an enourmous blast-resistance. Place an fake water source on its break"),
		tiles = {"default_obsidian.png^[colorize:#5e99f7:100"},
		is_ground_content = true,
		stack_max = 64,
		--groups = {pickaxey=5, cracky = 1, level = 2},
		sounds = mcl_sounds.node_sound_stone_defaults(),
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			minetest.set_node(pos, {name="pala_fakewater:fakewater_source"})
		end,
	})
end

if minetest.get_modpath("mcl_explosions") then
	minetest.register_node("pala_obsidian:explode_obsidian", {
		description = ("Explode Obsidian"),
		_doc_items_longdesc = ("Explode Obsidian is an extremely hard mineral with an enourmous blast-resistance. Explode on its break"),
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
	mcl_stairs.register_slab("obsidian", "mcl_core:obsidian", {pickaxey=5, building_block=1, material_stone=1}, {"default_obsidian.png"}, ("Obsidian Slab"), mcl_sounds.node_sound_stone_defaults(), 1200, 50, ("Double Obsidian Slab"))
	--mcl_stairs.register_stair(subname, recipeitem, groups, images, description, sounds, hardness, corner_stair_texture_override)
	mcl_stairs.register_stair("obsidian", "mcl_core:obsidian", {pickaxey=5, building_block=1, material_stone=1}, {"default_obsidian.png"}, ("Obsidian Stairs"), mcl_sounds.node_sound_stone_defaults(), 1200, 50, "woodlike")
end


if minetest.get_modpath("mcl_doors") then
	mcl_doors:register_door("pala_obsidian:obsidian_door", {
		description = ("Protected Obsidian Door"),
		_doc_items_longdesc = wood_longdesc,
		_doc_items_usagehelp = wood_usagehelp,
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
		_doc_items_longdesc = wood_longdesc,
		_doc_items_usagehelp = wood_usagehelp,
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
		
-- end
--[[sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,]]--