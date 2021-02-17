local S = minetest.get_translator("pala_spikes")

pala_spikes = {}
pala_spikes.registered_spikes = {}
function pala_spikes.register_spike(name, desc, color, damage, id)
	local newname = "pala_spikes:"..name.."_spike"
	pala_spikes.registered_spikes[newname] = {name=name, desc=desc, color=color, damage=damage, id=id}

	minetest.register_node(newname, {
		description = (desc.." Spike"),
		_doc_items_longdesc = ("Deals "..tostring(damage)..[[
			damage to people without armor.
			Destroy items thrown on the spike.
			]]),
		drawtype="mesh",
		mesh="pala_spikes_pyramid_spike.obj",
		visual_scale=1.0,
		tiles={"pala_spikes_wood_base.png"},
		color = color,
		groups = {pickaxey=2, building_block=1, pala_spikes=1},
		on_walk_over = function(loc, nodeiamon, player)
			-- Hurt players standing on top of this block
			if player:get_hp() > 0 then
				mcl_death_messages.player_damage(player, S("@1 stood too long on a spike.", player:get_player_name()))
				player:set_hp(player:get_hp() - damage, { type = "punch", from = "mod" })
			end
		end,
	})
	minetest.register_alias("#"..tostring(id), newname)
end

pala_spikes.register_spike("wood", "Wood", "#b59246", 2, 438)
pala_spikes.register_spike("iron", "Iron", "#f4f4f4", 5, 439)
pala_spikes.register_spike("gold", "Gold", "#fcfc07", 7, 440)
pala_spikes.register_spike("diamond", "Diamond", "#0af0fc", 10, 441)
pala_spikes.register_spike("amethyst", "Amethyst", "#a43afc", 10, 442)
pala_spikes.register_spike("titanium", "Titanium", "#777777", 12, 443)
pala_spikes.register_spike("paladium", "Paladium", "#fc552f", 14, 444)

--Craft

minetest.register_craft({
	output = "pala_spike:wood_spike",
	recipe = {
		{'', 'mcl_tools:sword_wood', ''},
		{'mcl_tools:sword_wood', 'group:wood', 'mcl_tools:sword_wood'},
		{'group:wood', 'group:wood', 'group:wood'},
	}
})

minetest.register_craft({
	output = "pala_spike:iron_spike",
	recipe = {
		{'', 'mcl_tools:sword_wood', ''},
		{'mcl_tools:sword_wood', 'mcl_core:iron_ingot', 'mcl_tools:sword_wood'},
		{'mcl_core:iron_ingot', 'mcl_core:iron_ingot', 'mcl_core:iron_ingot'},
	}
})

minetest.register_craft({
	output = "pala_spike:gold_spike",
	recipe = {
		{'', 'mcl_tools:sword_gold', ''},
		{'mcl_tools:sword_gold', 'mcl_core:gold_ingot', 'mcl_tools:sword_gold'},
		{'mcl_core:gold_ingot', 'mcl_core:gold_ingot', 'mcl_core:gold_ingot'},
	}
})

minetest.register_craft({
	output = "pala_spike:gold_spike",
	recipe = {
		{'', 'mcl_tools:sword_gold', ''},
		{'mcl_tools:sword_gold', 'mcl_core:diamond', 'mcl_tools:sword_gold'},
		{'mcl_core:diamond', 'mcl_core:diamond', 'mcl_core:diamond'},
	}
})

minetest.register_craft({
	output = "pala_spike:amethyst_spike",
	recipe = {
		{'', 'mcl_tools:sword_diamond', ''},
		{'mcl_tools:sword_diamond', 'pala_paladium:amethyst_ingot', 'mcl_tools:sword_diamond'},
		{'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot', 'pala_paladium:amethyst_ingot'},
	}
})

minetest.register_craft({
	output = "pala_spike:titanium_spike",
	recipe = {
		{'', 'pala_tools:sword_amethyst', ''},
		{'pala_tools:sword_amethyst', 'pala_paladium:titanium_ingot', 'pala_tools:sword_amethyst'},
		{'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot', 'pala_paladium:titanium_ingot'},
	}
})

minetest.register_craft({
	output = "pala_spike:paladium_spike",
	recipe = {
		{'', 'pala_tools:sword_titanium', ''},
		{'pala_tools:sword_titanium', 'pala_paladium:paladium_ingot', 'pala_tools:sword_titanium'},
		{'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot', 'pala_paladium:paladium_ingot'},
	}
})

minetest.register_abm({
	label = "Spikes destroy dropped items",
	nodenames = {"group:pala_spikes"},
	interval = 3.0,
	chance = 0.5,
	action = function(pos, node, active_object_count, active_object_count_wider)
		local abovenode = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
		if not minetest.registered_items[abovenode.name] then return end
		-- Don't bother checking item enties if node above is a container (should save some CPU)
		if minetest.registered_items[abovenode.name].groups.container then
			return
		end
		for _,object in ipairs(minetest.get_objects_inside_radius(pos, 2)) do
			if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
				local posob = object:get_pos()
				local posob_miny = posob.y + object:get_properties().collisionbox[2]
				if math.abs(posob.x-pos.x) <= 0.5 and (posob_miny-pos.y < 1.5 and posob.y-pos.y >= 0.3) then
					object:get_luaentity().itemstring = ""
					object:remove()
				end
			end
		end
	end,
})