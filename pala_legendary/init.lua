local load_time = os.clock()
minetest.log("action", "[pala_legendary] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modpath)

local math = math

--TODO: help
pala_legendary = {}
pala_legendary.registered_stones = {}
local stone_list = {}

function pala_legendary.get_random_stone(min_item, max_item)
	local rnd = math.random(min_item, max_item)
	return stone_list[rnd]
end
function pala_legendary.register_legendary(name, def)
	local tempname = "pala_legendary:legendary_"..name
	minetest.register_craftitem(tempname, {
		description = S("Legendary Stone @1", def.name),
		_doc_items_longdesc = S(def.longdesc.." Just right-click to use it."),
		inventory_image = def.inventory_image,
		stack_max = 1,
		groups = {legendary_stone=1},
		on_use = function(itemstack, player, pointed_thing)
			local ok
			local last_use = itemstack:get_meta():get_int("pala_last_use")

			if not last_use then
				ok = true
			elseif os.time()-86400 >= last_use then
				ok = true
			else
				--TODO:better message
				local nbhour = (last_use-(os.time()-86400))/3600
				minetest.chat_send_player(player:get_player_name(), "You must wait "..math.floor(nbhour).."h to use this stone!")
				ok = false
			end
			if ok == true then
				itemstack:get_meta():set_int("pala_last_use", os.time())
				pala_legendary.spawn_particle(player:get_pos())
				def.func(itemstack, player, pointed_thing)
				return itemstack
			end
		end,
	})
	pala_legendary.registered_stones[name] = {
		name = def.name,
		longdesc = def.longdesc,
		inventory_image = def.inventory_image,
		func = def.func,
	}
	table.insert(stone_list, tempname)
end

function pala_legendary.spawn_particle(pos)
	minetest.add_particlespawner({
		amount = 75,
        time = 1,
        minpos = {x=pos.x-3, y=pos.y-1, z=pos.z-3},
        maxpos = {x=pos.x+3, y=pos.y+1, z=pos.z+3},
        minvel = {x=-0.2, y=-0.2, z=-0.2},
        maxvel = {x=0.2, y=0.2, z=0.2},
        minexptime = 1,
        maxexptime = 3,
        minsize = 1,
        maxsize = 2,
        collisiondetection = false,
        collision_removal = false,
        object_collision = false,
        texture = "pala_legendary_particule.png",
        glow = 3,
	})
end

local minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot"
}

function pala_legendary.get_random_stone()
	return stone_list[math.random(2, #stone_list)] --exclude legendary stone random
end

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

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/endium_gauntlet.lua")
end

minetest.log("action", "[pala_legendary] loaded in "..((os.clock()-load_time)*1000).."ms")