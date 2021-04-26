local S = minetest.get_translator(minetest.get_current_modname())

local minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}

pala_legendary.register_legendary("random", {
	name = S("Random"),
	longdesc = "Basic legendary stone, it is the one that then gives one of the six stones.",
	inventory_image = "pala_legendary_legendary_random.png",
	func = function(itemstack, player, pointed_thing)
		return itemstack:replace({name=pala_legendary.get_random_stone()})
	end,
})

--Fortune
pala_legendary.register_legendary("fortune", {
	name = S("Fortune"),
	longdesc = "Gives a random number of a random ore (this can be coal such as palladium).",
	inventory_image = "pala_legendary_legendary_fortune.png",
	func = function(itemstack, player, pointed_thing)
		local rnd2 = math.random(6, 40)
		for i = 1, rnd2, 1 do
			local rnd = math.random(1, 5)
			minetest.add_item(player:get_pos(), minerallist[rnd])
		end
	end,
})