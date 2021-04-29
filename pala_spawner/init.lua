if minetest.settings:get_bool("palamod.experimental", false) then
	minetest.register_node("pala_spawner:spawner_brocken", {
		tiles = {"mob_spawner.png"},
		drawtype = "glasslike",
		paramtype = "light",
		walkable = true,
		description = ("Brocken Mob Spawner"),
		_tt_help = ("Brocken Mob Spawner"),
		_doc_items_longdesc = ([[
			A mob spawner regularily causes mobs to appear around it while a player is nearby.
			Some mob spawners are disabled while in light.
			]]),
		_doc_items_usagehelp = ([[
			If you have a spawn egg, you can use it to change the mob to spawn.
			Just place the item on the mob spawner.
			Player-set mob spawners always spawn mobs regardless of the light level.
			]]),
		groups = {pickaxey=1, material_stone=1, deco_block=1},
		is_ground_content = false,
		drop = "",
		sounds = mcl_sounds.node_sound_metal_defaults(),
		_mcl_blast_resistance = 5,
		_mcl_hardness = 5,
	})
end