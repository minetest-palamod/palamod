minetest.log("action", "[pala_food] loading...")

local S = minetest.get_translator(minetest.get_current_modname())

local function eat_pala_apple(itemstack, placer, pointed_thing)
	if pointed_thing.type == "node" then
		local node = minetest.get_node(pointed_thing.under)
		if placer and not placer:get_player_control().sneak then
			if minetest.registered_nodes[node.name] and minetest.registered_nodes[node.name].on_rightclick then
				return minetest.registered_nodes[node.name].on_rightclick(pointed_thing.under, node, placer, itemstack) or itemstack
			end
		end
	elseif pointed_thing.type == "object" then
		return itemstack
	end
	mcl_potions.fire_resistance_func(placer, 2, 300)
	mcl_potions.regeneration_func(placer, 3, 20)
	local gapple_hunger_restore = minetest.item_eat(4)
	return gapple_hunger_restore(itemstack, placer, pointed_thing)
end

minetest.register_craftitem("pala_food:apple_pala", {
	description = S("Paladium Apple"),
	_doc_items_longdesc = ("Paladium apples are precious food items which can be eaten."),
	wield_image = "mcl_core_apple_golden.png",
	inventory_image = "mcl_core_apple_golden.png",
	color = "#fc7a16",
	stack_max = 64,
	on_place = eat_pala_apple,
	on_secondary_use = eat_pala_apple,
	groups = { food = 2, eatable = 20, can_eat_when_full = 1 },
	_mcl_saturation = 9.6,
})

minetest.register_craft({
	output = "pala_food:apple_pala",
	recipe = {
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "mcl_core:apple", "pala_paladium:paladium_ingot"},
		{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"}
	},
})

minetest.register_craftitem("pala_food:marinated_steak", {
	description = S("Marinated Steak"),
	_doc_items_longdesc = S([[
		Marinated Steak is obtained by hunting and is a food item which can be eaten safely.
		Cooking it improves its nutritional value.
		]]),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_rottenflesh", {
	description = S("Marinated Rotten Flesh"),
	_doc_items_longdesc = S([[
		Marinated Rotten Flesh is obtained by hunting and is a food item which can be eaten safely.
		Cooking it improves its nutritional value.
		]]),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_porkshop", {
	description = S("Marinated Porkshop"),
	_doc_items_longdesc = S([[
		Marinated Porkshop is obtained by hunting and is a food item which can be eaten safely.
		Cooking it improves its nutritional value.
		]]),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_mutton", {
	description = S("Marinated Mutton"),
	_doc_items_longdesc = S([[
		Marinated Mutton is obtained by hunting and is a food item which can be eaten safely.
		Cooking it improves its nutritional value.
		]]),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_chicken", {
	description = S("Marinated Chicken"),
	_doc_items_longdesc = S([[
		Marinated Chicken is obtained by hunting and is a food item which can be eaten safely.
		Cooking it improves its nutritional value.
		]]),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_ham", {
	description = S("Marinated Ham"),
	_doc_items_longdesc = S([[
		Marinated Ham is obtained by hunting and is a food item which can be eaten safely.
		Cooking it improves its nutritional value.
		]]),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

--Clear Golden Apple
if minetest.settings:get_bool("pala_food.clear_golden_apples", true) then
	minetest.clear_craft({output = "mcl_core:apple_gold"})
	--[[
	TODO: clear enchanted golden apples
	]]
end

minetest.log("action", "[pala_food] loaded succesfully")