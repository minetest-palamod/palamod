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
function pala_legendary.register_legendary(name, def)
	local tempname = "pala_legendary:legendary_"..name
	minetest.register_craftitem(tempname, {
		description = ("Legendary Stone "..firstToUpper(name)),
		_doc_items_longdesc = (def.longdesc.." Just right-click to use it."),
		inventory_image = def.inventory_image,
		stack_max = 1,
		groups = {legendary_stone=1},
		on_use = function(itemstack, player, pointed_thing)
			local ok
			minetest.chat_send_player(player:get_player_name(), "------------------------------------------------------")
			minetest.chat_send_player(player:get_player_name(), "last use : "..itemstack:get_meta():get_int("pala_last_use"))
			minetest.chat_send_player(player:get_player_name(), os.time())
			
			local last_use = itemstack:get_meta():get_int("pala_last_use")
			
			if not last_use then
				ok = true
			elseif os.time()-86400 >= last_use then
				--minetest.chat_send_player(player:get_player_name(), itemstack:get_meta():get_int("pala_last_use"))
				ok = true
			else
				--TODO:better message
				local nbhour = (last_use-(os.time()-86400))/3600
				minetest.chat_send_player(player:get_player_name(), "You must wait "..(nbhour).."H to use this stone!")
				ok = false
			end
			if ok == true then
				itemstack:get_meta():set_int("pala_last_use", os.time())
				minetest.chat_send_player(player:get_player_name(),
					"last use is now set to : "..itemstack:get_meta():get_string("pala_last_use"))
				pala_legendary.spawn_particle(player:get_pos())
				def.func(itemstack, player, pointed_thing)
				return itemstack
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
        minvel = {x=-0.2, y=-0.2, z=-0.2},
        maxvel = {x=0.2, y=0.2, z=0.2},
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
function pala_legendary.get_random_stone()
	local rnd = math.random(2, #pala_legendary.stones_list)
	return pala_legendary.stones_list[rnd]
end

pala_legendary.register_legendary("random", {
	longdesc = "Basic legendary stone, it is the one that then gives one of the six stones.",
	inventory_image = "pala_legendary_legendary_random.png",
	func = function(itemstack, player, pointed_thing) 
		return itemstack:replace({name=pala_legendary.get_random_stone()})
	end,
})
	
--Fortune
pala_legendary.register_legendary("fortune", {
	longdesc = "Gives a random number of a random ore (this can be coal such as palladium).",
	inventory_image = "pala_legendary_legendary_fortune.png",
	func = fortune
})


dofile(minetest.get_modpath("pala_legendary").."/endium_gauntlet.lua")
