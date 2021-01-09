local function firstToUpper(str)
    return (str:gsub("^%l", string.upper))
end

--TODO:textures and help
pala_legendary = {}
pala_legendary.stones_list = {}

function pala_legendary.get_random_stone(min_item, max_item)
	local rnd = math.random(min_item, max_item)
	return pala_legendary.stones_list[rnd]
end
function pala_legendary.register_legendary(name, longdesc, inventory_image, func)
	local tempname = "pala_legendary:legendary_"..name
	minetest.register_craftitem(tempname, {
		description = ("Legendary Stone "..firstToUpper(name)),
		_doc_items_longdesc = (longdesc.." Just right-click to use it."),
		inventory_image = inventory_image,
		stack_max = 1,
		groups = {legendary_stone=1},
		on_use = function(itemstack, player, pointed_thing)
			minetest.chat_send_player(player:get_player_name(), "last use : "..itemstack:get_meta():get_string("pala_last_use"))
			minetest.chat_send_player(player:get_player_name(), os.date("%Y-%m-%d"))
			if not itemstack:get_meta():get_string("pala_last_use") then
				ok = true
			elseif itemstack:get_meta():get_string("pala_last_use") ~= os.date("%Y-%m-%d") then
				minetest.chat_send_player(player:get_player_name(), itemstack:get_meta():get_string("pala_last_use"))
				ok = true
			else
				--TODO:better message
				minetest.chat_send_player(player:get_player_name(), "Already used")
				ok = false
			end
			if ok == true then
				itemstack:get_meta():set_string("pala_last_use", os.date("%Y-%m-%d"))
				minetest.chat_send_player(player:get_player_name(), "last use is now set to : "..itemstack:get_meta():get_string("pala_last_use"))
				func(itemstack, player, pointed_thing)
				pala_legendary.spawn_particle(player:get_pos())
			end
		end,
	})
	table.insert(pala_legendary.stones_list, tempname)
end

function pala_legendary.spawn_particle(pos)
	minetest.add_particlespawner({
		amount = 50,
        time = 1,
        minpos = {x=pos.x-3, y=pos.y-1, z=pos.z-3},
        maxpos = {x=pos.x+3, y=pos.y+1, z=pos.z+3},
        minvel = {x=-2, y=-2, z=-2},
        maxvel = {x=2, y=2, z=2},
        --minacc = {x=0, y=0, z=0},
        --maxacc = {x=0, y=0, z=0},
        minexptime = 1,
        maxexptime = 3,
        minsize = 1,
        maxsize = 2,
        collisiondetection = false,
        collision_removal = false,
        object_collision = false,
        --attached = ObjectRef,
        --vertical = false,
        texture = "pala_legendary_particule.png",
        -- playername = "singleplayer",
        --animation = {Tile Animation definition},
        glow = 3,
        --node = {name = "ignore", param2 = 0},
        --node_tile = 0,
	})
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
pala_legendary.register_legendary("fortune", "Gives a random number of a random ore (this can be coal such as palladium).", "mcl_core_stone.png", fortune)
pala_legendary.register_legendary("random", "Basic legendary stone, it is the one that then gives one of the six stones.", "mcl_core_stone.png", random_stone)
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
dofile(minetest.get_modpath("pala_legendary").."/endium_gauntlet.lua")