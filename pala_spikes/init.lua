minetest.log("action", "[pala_spikes] loading...")

local S = minetest.get_translator(minetest.get_current_modname())

local pairs = pairs
local math = math

pala_spikes = {}

pala_spikes.registered_spikes = {}

mcl_damage.register_type("spike_floor", {})

mcl_death_messages.messages.spike_floor = {
    _translator = S,
    plain = "@1 stood too long on a spike",
    assist = "@1 stood too long on a spike due to @2",
}

function pala_spikes.register_spike(name, desc, color, damage, id)
	local newname = "pala_spikes:"..name.."_spike"
	pala_spikes.registered_spikes[newname] = {name=name, desc=desc, color=color, damage=damage, id=id}

	minetest.register_node(newname, {
		description = S("@1 Spike", desc),
		_doc_items_longdesc = S([[Deals @1 damage to people without armor.
			Destroy items thrown on the spike.
			]], damage),
		drawtype="mesh",
		mesh="pala_spikes_pyramid_spike.obj",
		visual_scale=1.0,
		tiles={"pala_spikes_wood_base.png"},
		color = color,
		groups = {pickaxey=2, building_block=1, pala_spikes=1},
		on_walk_over = function(loc, nodeiamon, player)
			-- Hurt players standing on top of this block
            --[[
            TODO: damage people at the pointing face only
            ]]
            mcl_util.deal_damage(player, damage, {type = "spike_floor"})
		end,
	})
end

pala_spikes.register_spike("wood", S("Wood"), "#b59246", 2)
pala_spikes.register_spike("iron", S("Iron"), "#f4f4f4", 5)
pala_spikes.register_spike("gold", S("Gold"), "#fcfc07", 7)
pala_spikes.register_spike("diamond", S("Diamond"), "#0af0fc", 10)
pala_spikes.register_spike("amethyst", S("Amethyst"), "#a43afc", 10)
pala_spikes.register_spike("titanium", S("Titanium"), "#777777", 12)
pala_spikes.register_spike("paladium", S("Paladium"), "#fc552f", 14)

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
        if active_object_count > 0 then
            local abovenode = minetest.get_node({x=pos.x, y=pos.y+1, z=pos.z})
            if not minetest.registered_items[abovenode.name] then return end
            -- Don't bother checking item enties if node above is a container (should save some CPU)
            if minetest.registered_items[abovenode.name].groups.container then
                return
            end
            for _,object in pairs(minetest.get_objects_inside_radius(pos, 2)) do
                if not object:is_player() and object:get_luaentity() and object:get_luaentity().name == "__builtin:item" then
                    local posob = object:get_pos()
                    local posob_miny = posob.y + object:get_properties().collisionbox[2]
                    if math.abs(posob.x-pos.x) <= 0.5 and (posob_miny-pos.y < 1.5 and posob.y-pos.y >= 0.3) then
                        object:get_luaentity().itemstring = ""
                        object:remove()
                    end
                end
            end
        end
	end,
})

minetest.log("action", "[pala_spikes] loaded succesfully")