
palafake_color = "#5e99f7"

minetest.register_node("pala_obsidian:two_life_obsidian", {
	description = ("Two Life Obsidian"),
	_doc_items_longdesc = ("Two Life Obsidian is an extremely hard mineral with an enourmous blast-resistance. Place an obsidian on its break"),
	tiles = {"default_obsidian.png"},
	is_ground_content = true,
	stack_max = 64,
	sounds = mcl_sounds.node_sound_stone_defaults(),
	groups = {cracky = 1, level = 2},
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,
	on_destruct = function(pos)
		minetest.set_node(pos, {name="mcl_core:obsidian"})
	end,
})

if minetest.get_modpath("pala_fakewater") then
	minetest.register_node("pala_obsidian:fake_obsidian", {
		description = ("Fake Obsidian"),
		_doc_items_longdesc = ("Fake Obsidian is an extremely hard mineral with an enourmous blast-resistance. Place an fake water source on its break"),
		tiles = {"default_obsidian.png^[colorize:palafake_color:200"},
		is_ground_content = true,
		stack_max = 64,
		groups = {cracky = 1, level = 2},
		sounds = mcl_sounds.node_sound_stone_defaults(),
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		on_destruct = function(pos)
			minetest.set_node(pos, {name="pala_fakewater:fakewater_source"})
		end,
	})
end

if minetest.get_modpath("tnt") then
	minetest.register_node("pala_obsidian:explode_obsidian", {
		description = ("Explode Obsidian"),
		_doc_items_longdesc = ("Explode Obsidian is an extremely hard mineral with an enourmous blast-resistance. Explode on its break"),
		tiles = {"default_obsidian.png"},
		is_ground_content = true,
		stack_max = 64,
		groups = {cracky = 1, level = 2},
		sounds = mcl_sounds.node_sound_stone_defaults(),
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		on_destruct = function(pos)
			tnt.boom(pos, def)
		end
	})
end
--[[sounds = mcl_sounds.node_sound_stone_defaults(),
	_mcl_blast_resistance = 1200,
	_mcl_hardness = 50,]]--