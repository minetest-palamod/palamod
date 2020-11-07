--TODO:textures and help

local minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}

local stoneslist = {
	"pala_legendary:legendary_fortune"
}


local function fortune(pos)
	local rnd2 = math.random(6, 40)
	for i = 1, rnd2, 1 do
		local rnd = math.random(1, 5)
		minetest.add_item(pos, minerallist[rnd])
	end
end

local function get_random_stone(pos)
	local rnd = math.random(1, 1)
	return stoneslist[rnd]
end

--Fortune
minetest.register_craftitem("pala_legendary:legendary_fortune", {
	description = ("Legendary Stone Fortune"),
	_doc_items_longdesc = ("Marinated Ham is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, player, pointed_thing)
		fortune(player:get_pos())
	end,
})

minetest.register_craftitem("pala_legendary:legendary_random", {
	description = ("Legendary Stone Random"),
	_doc_items_longdesc = ("Marinated Ham is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	inventory_image = "mcl_fishing_salmon_raw.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, player, pointed_thing)
		itemstack:replace(get_random_stone())
		return itemstack
	end,
})