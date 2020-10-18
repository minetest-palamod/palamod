minetest.register_craftitem("pala_food:apple_pala", {
	-- TODO: Add special highlight color when this item is special
	description = ("Paladium Apple"),
	_doc_items_longdesc = ("Paladium apples are precious food items which can be eaten."),
	wield_image = "mcl_core_apple_golden.png",
	inventory_image = "mcl_core_apple_golden.png",
	stack_max = 64,
	-- TODO: Reduce to 4 when it's ready
	on_place = minetest.item_eat(20),
	on_secondary_use = minetest.item_eat(20),
	groups = { food = 2, eatable = 20, can_eat_when_full = 1 },
	_mcl_saturation = 9.6,
})

minetest.register_craftitem("pala_food:marinated_steak", {
	description = ("Marinated Steak"),
	_doc_items_longdesc = ("Marinated Steak is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_rottenflesh", {
	description = ("Marinated Rotten Flesh"),
	_doc_items_longdesc = ("Marinated Rotten Flesh is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_porkshop", {
	description = ("Marinated Porkshop"),
	_doc_items_longdesc = ("Marinated Porkshop is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_mutton", {
	description = ("Marinated Mutton"),
	_doc_items_longdesc = ("Marinated Mutton is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_chicken", {
	description = ("Marinated Chicken"),
	_doc_items_longdesc = ("Marinated Chicken is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})

minetest.register_craftitem("pala_food:marinated_ham", {
	description = ("Marinated Ham"),
	_doc_items_longdesc = ("Marinated Ham is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	on_place = minetest.item_eat(4),
	on_secondary_use = minetest.item_eat(4),
	stack_max = 64,
	groups = { food=4, eatable = 4 },
	_mcl_saturation = 0.4,
})