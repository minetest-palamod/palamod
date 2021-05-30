local S = minetest.get_translator(minetest.get_current_modname())

--[[
TODO: make player stick to roof
]]

--Slimy Helmet
minetest.register_tool("pala_armor:helmet_slimy", {
	description = S("Slimy Helmet"),
	_doc_items_longdesc = mcl_armor.longdesc..
		" "..S("Negate fall damage"),
	_doc_items_usagehelp = mcl_armor.usage,
	inventory_image = "mcl_armor_inv_helmet_leather.png",
	groups = {armor_head = 1, non_combat_head = 1, mcl_armor_points=1, mcl_armor_uses = 165, enchantability = 15},
	sounds = {
		_mcl_armor_equip = "slimenodes_step.1",
		_mcl_armor_unequip = "slimenodes_step.1",
	},
	on_place = mcl_armor.equip_on_use,
	on_secondary_use = mcl_armor.equip_on_use,
	_mcl_armor_element = "head",
	_mcl_armor_texture = "mcl_armor_helmet_leather.png"
})

--No fall damage if wearing slimy helmet
mcl_damage.register_modifier(function(obj, damage, reason)
    if reason.type == "fall" then
        local inv = obj:get_inventory()
        local stack = inv:get_stack("armor", 2)
		if stack:get_name() == "pala_armor:helmet_slimy" then
			if obj:is_player() and not minetest.is_creative_enabled(obj:get_player_name()) then
				mcl_util.use_item_durability(stack, 1)
            end
            inv:set_stack("armor", 2, stack)
            return 0
        end
    end
    return damage
end, 199)

if minetest.settings:get_bool("palamod.experimental", false) then
	--Hood Helmet
	--[[
	TODO: real action and properties
	]]
	minetest.register_tool("pala_armor:helmet_hood", {
		description = S("Hood Helmet"),
		_doc_items_longdesc = mcl_armor.longdesc..
			" "..S("Make your nametag invisible"),
		_doc_items_usagehelp = mcl_armor.usage,
		inventory_image = "mcl_armor_inv_helmet_leather.png",
		groups = {armor_head = 1, non_combat_head = 1, mcl_armor_points = 1, mcl_armor_uses = 165, enchantability = 15},
		sounds = {
			_mcl_armor_equip = "mcl_armor_equip_leather",
			_mcl_armor_unequip = "mcl_armor_unequip_leather",
		},
		on_place = mcl_armor.equip_on_use,
		on_secondary_use = mcl_armor.equip_on_use,
		_mcl_armor_element = "head",
		_mcl_armor_texture = "mcl_armor_helmet_leather.png"
	})

	--Scuba Helmet
	--[[
	TODO: provide water breathing and properties
	]]
	minetest.register_tool("pala_armor:helmet_scuba", {
		description = S("Scuba Helmet"),
		_doc_items_longdesc = mcl_armor.longdesc..
			" "..S("Make your breath bar not go down"),
		_doc_items_usagehelp = mcl_armor.usage,
		inventory_image = "mcl_armor_inv_helmet_leather.png",
		groups = {armor_head = 1, non_combat_head = 1, mcl_armor_points = 1, mcl_armor_uses = 165, enchantability = 15},
		sounds = {
			_mcl_armor_equip = "mcl_armor_equip_leather",
			_mcl_armor_unequip = "mcl_armor_unequip_leather",
		},
		on_place = mcl_armor.equip_on_use,
		on_secondary_use = mcl_armor.equip_on_use,
        _on_equip = function(obj, itemstack)
            mcl_potions.water_breathing_func(obj, nil, 16)
        end,
        _on_unequip = function(obj, itemstack)
            --mcl_potions.water_breathing_func(player, nil, 16)
        end,
		_mcl_armor_element = "head",
		_mcl_armor_texture = "mcl_armor_helmet_leather.png"
	})

    --[[
    TODO: use the player globalstep API the implemented
    TODO: use the new potion API then implemented
    ]]
    local time = 0
    minetest.register_globalstep(function(dtime)
        time = time + dtime;
        if time >= 15 then
            for _,player in pairs(minetest.get_connected_players()) do
                local inv = player:get_inventory()
                if inv:get_stack("armor", 2):get_name() == "pala_armor:helmet_scuba" then --Helmet
                    mcl_potions.water_breathing_func(player, nil, 16)
                end
            end
            time = 0
        end
    end)
    minetest.register_on_joinplayer(function(player)
        local inv = player:get_inventory()
        if inv:get_stack("armor", 2):get_name() == "pala_armor:helmet_scuba" then --Helmet
            mcl_potions.water_breathing_func(player, nil, 16)
        end
    end)
end