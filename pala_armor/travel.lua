local S = minetest.get_translator(minetest.get_current_modname())

--Slimy Helmet
minetest.register_tool("pala_armor:helmet_slimy", {
	description = S("Slimy Helmet"),
	_doc_items_longdesc = mcl_armor.longdesc..
		" "..S("Negate fall damage"),
	_doc_items_usagehelp = mcl_armor.usage,
	inventory_image = "mcl_armor_inv_helmet_leather.png",
	groups = {armor_head = 1, non_combat_head = 1, mcl_armor_points=1, mcl_armor_uses = 165},
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
    if reason.type == "fall" and obj:get_inventory():get_stack("armor", 2):get_name() == "pala_armor:helmet_slimy" then
        return 0
    end
    return damage
end, 199)

if minetest.settings:get_bool("palamod.experimental", true) then
	--Hood Helmet
	--TODO: real action and properties
	minetest.register_tool("pala_armor:helmet_hood", {
		description = S("Hood Helmet"),
		_doc_items_longdesc = mcl_armor.longdesc..
			" "..S("Make your nametag invisible"),
		_doc_items_usagehelp = mcl_armor.usage,
		inventory_image = "mcl_armor_inv_helmet_leather.png",
		groups = {armor_head = 1, non_combat_head = 1, mcl_armor_points=1, mcl_armor_uses = 165},
		sounds = {
			_mcl_armor_equip = "mcl_armor_equip_leather",
			_mcl_armor_unequip = "mcl_armor_unequip_leather",
		},
		on_place = mcl_armor.equip_on_use,
		on_secondary_use = mcl_armor.equip_on_use,
		_mcl_armor_element = "head",
		_mcl_armor_texture = "mcl_armor_helmet_leather.png"
	})
end