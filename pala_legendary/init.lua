minetest.log("action", "[pala_legendary] loading...")

local modname = minetest.get_current_modname()
local modpath = minetest.get_modpath(modname)
local S = minetest.get_translator(modname)
local C = minetest.colorize

local vector = vector
local math = math

--[[
TODO: add documentation
]]

pala_legendary = {}
pala_legendary.registered_stones = {}
local stone_list = {}

function pala_legendary.register_legendary(name, def)
	local tempname = "pala_legendary:legendary_"..name
	if not def.func then def.func = function() end end
	minetest.register_craftitem(tempname, {
		description = S("LegendaryStone @1", def.name),
		_tt_help = def.tt_help or C(mcl_colors.GREEN, S("Just right-click to use it.")),
		_doc_items_longdesc = def.longdesc,
		inventory_image = def.inventory_image,
		stack_max = 1,
		groups = {legendary_stone = 1},
		on_use = function(itemstack, player, pointed_thing)
			local ok
			local last_use = itemstack:get_meta():get_int("pala_last_use")

			if not last_use then
				ok = true
			elseif os.time()-86400 >= last_use then
				ok = true
			else
				local nbhour = (last_use-(os.time()-86400))/3600
				minetest.chat_send_player(player:get_player_name(),
					C(mcl_colors.GRAY, S("You must wait @1 hours before you can use it.", math.floor(nbhour))))
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
		color = def.color,
		longdesc = def.longdesc,
		tt_help = def.tt_help,
		inventory_image = def.inventory_image,
		func = def.func,
	}
	table.insert(stone_list, tempname)
end

function pala_legendary.spawn_particle(pos)
	minetest.add_particlespawner({
		amount = 300,
		--time = 1,
		minpos = vector.new(pos.x - 3, pos.y - 1, pos.z - 3),
		maxpos = vector.new(pos.x + 3, pos.y + 1, pos.z + 3),
		--minvel = {x=-0.1, y=-0.1, z=-0.1},
		--maxvel = {x=0.1, y=0.1, z=0.1},
		minexptime = 2,
		maxexptime = 2,
		minsize = 1,
		maxsize = 2,
		collisiondetection = false,
		collision_removal = false,
		object_collision = false,
		texture = "pala_legendary_particule.png",
		glow = 3,
	})
end

function pala_legendary.get_random_stone()
	return stone_list[math.random(2, #stone_list)] --exclude legendary stone random
end

dofile(modpath.."/register.lua")

if minetest.settings:get_bool("palamod.experimental", false) then
	dofile(modpath.."/endium_gauntlet.lua")
end

minetest.log("action", "[pala_legendary] loaded succesfully")
