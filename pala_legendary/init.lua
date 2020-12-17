--TODO:textures and help
pala_legendary = {}
pala_legendary.stones_list ={}
function pala_legendary.get_random_stone(min_item, max_item)
	local rnd = math.random(min_item, max_item)
	return pala_legendary.stones_list[rnd]
end
function pala_legendary.register_legendary(name, descname, longdesc, inventory_image, func)
	local tempname = "pala_legendary:legendary_"..name
	minetest.register_craftitem(tempname, {
		description = ("Legendary Stone "..descname),
		_doc_items_longdesc = (longdesc.." Just right-click to use it."),
		inventory_image = inventory_image,
		stack_max = 1,
		groups = {legendary_stone=1},
		on_use = function(itemstack, player, pointed_thing)
			if not itemstack:get_meta():get_string("last_use") then
				itemstack:get_meta():set_string("last_use", os.date())
				ok = true
			elseif itemstack:get_meta():get_string("last_use") ~= os.date() then
				ok = true
			else
				--TODO:better message
				minetest.chat_send_player(player:get_player_name(), "Allready used")
				ok = false
			end
			if ok == true then
				func(itemstack, player, pointed_thing)
			end
		end,
	})
	table.insert(pala_legendary.stones_list, tempname)
end
local minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}

local function fortune(itemstack, player, pointed_thing)
	local rnd2 = math.random(6, 40)
	for i = 1, rnd2, 1 do
		local rnd = math.random(1, 5)
		minetest.add_item(player:get_pos(), minerallist[rnd])
	end
end
local function get_random_stone()
	local rnd = math.random(1, 1)
	return stoneslist[rnd]
end

local function random_stone(itemstack, player, pointed_thing)
	itemstack:replace(pala_legendary.get_random_stone(1, 1))
end

--Fortune
pala_legendary.register_legendary("fortune", "Fortune", "Gives a random number of a random ore (this can be coal such as palladium).", "mcl_core_stone.png", fortune)
pala_legendary.register_legendary("random", "Random", "Basic legendary stone, it is the one that then gives one of the six stones.", "mcl_core_stone.png", random_stone)
-- minetest.register_craftitem("pala_legendary:legendary_fortune", {
	-- description = ("Legendary Stone Fortune"),
	-- _doc_items_longdesc = ("Marinated Ham is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	-- inventory_image = "mcl_fishing_salmon_raw.png",
	-- stack_max = 1,
	-- groups = {},
	-- on_use = function(itemstack, player, pointed_thing)
		-- fortune(player:get_pos())
	-- end,
-- })

-- minetest.register_craftitem("pala_legendary:legendary_random", {
	-- description = ("Legendary Stone Random"),
	-- _doc_items_longdesc = ("Marinated Ham is obtained by hunting and is a food item which can be eaten safely. Cooking it improves its nutritional value."),
	-- inventory_image = "mcl_fishing_salmon_raw.png",
	-- stack_max = 1,
	-- groups = {},
	-- on_use = function(itemstack, player, pointed_thing)
		-- itemstack:replace(get_random_stone())
		-- return itemstack
	-- end,
-- })