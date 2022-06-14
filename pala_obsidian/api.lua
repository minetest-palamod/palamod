local S = minetest.get_translator(minetest.get_current_modname())

pala_obsidian.registered_custom_obsidian = {}

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
		after_dig=def.after_dig,
		groups = def.groups,
	}
	local after_dig_node
	if def.after_dig then
		function after_dig_node(pos, oldnode, oldmetadata, digger)
			if digger:get_wielded_item():get_name() == "pala_obsidian:obsidian_pick" then
				return
			else
				def.after_dig(pos, oldnode, oldmetadata, digger)
			end
		end
	else
		after_dig_node = nil
	end
	local groups
	if def.groups then
		groups = def.groups
	else
		groups = {pickaxey=5, building_block=1, material_stone=1, miner_level=def.miner_level, pickaxey_obsidian=5}
	end
	minetest.register_node(newname, {
		description = def.desc,
		_doc_items_longdesc = (
			S("@1 is an extremely hard mineral with an enourmous blast-resistance. @2", def.desc, def.longdesc)
			),
		tiles = def.tiles,
		overlay_tiles = def.overlay,
		color = def.color,
		is_ground_content = true,
		stack_max = 64,
		sounds = mcl_sounds.node_sound_stone_defaults(),
		groups = groups,
		_mcl_blast_resistance = 1200,
		_mcl_hardness = 50,
		after_dig_node = after_dig_node,
		mesecons = def.mesecons,
	})
end

mcl_autogroup.register_diggroup("pickaxey_obsidian")
