--Hammer
local function dig_node(pos,player)
	if minetest.is_protected(pos, player:get_player_name()) then
		minetest.record_protection_violation(pos, player:get_player_name())
		return
	end
	local node = minetest.get_node(pos)
	if node.name == "air" or node.name == "ignore" then return end
	if node.name == "default:lava_source" then return end
	if node.name == "default:lava_flowing" then return end
	if node.name == "default:water_source" then minetest.remove_node(pos) return end
	if node.name == "default:water_flowing" then minetest.remove_node(pos) return end
	local def = minetest.registered_nodes[node.name]
	if not def then return end
	def.on_dig(pos, node, player)
end

local function get_axis(player)
	local dir=player:get_look_dir()
	if math.abs(dir.x)>math.abs(dir.z) then
		if dir.x>0 then return 0 end
		return 1
	end
	if dir.z>0 then return 2 end
	return 3
end

local function drill_dig_it2 (pos,player)
	pos.y=pos.y+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	pos.y=pos.y-1
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	pos.y=pos.y-1
	drill_dig_it0 (pos,player)
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
end

local function drill_dig_it3 (pos,player)
	pos.y=pos.y+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.y=pos.y-1
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.y=pos.y-1
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
end

local function drill_dig_it4 (pos,player)
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.z=pos.z+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	pos.z=pos.z-2
	drill_dig_it0 (pos,player)
	pos.x=pos.x+1
	drill_dig_it0 (pos,player)
	pos.x=pos.x-2
	drill_dig_it0 (pos,player)
end

local function drill_dig_it(pos, player, mode)
	local dir=player:get_look_dir()
	if math.abs(dir.y)<0.5 then
		dir=drill_dig_it1(player)
			if dir==0 or dir==1 then -- x
				drill_dig_it2(pos,player)
			end
			if dir==2 or dir==3 then  -- z
				drill_dig_it3(pos,player)
			end
	else
		drill_dig_it4(pos,player)
	end
end

minetest.sound_play("mining_drill", {pos = pos, gain = 1.0, max_hear_distance = 10,})



local function hammer_dig_2(itemstack, user, pointed_thing)
	if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
		return
	end
	local pos = minetest.get_pointed_thing_position(pointed_thing, false)
	drill_dig_it(pos, user, meta.mode)
end

local function hammer_dig(pointed_thing, user)
	local name = user:get_player_name()
	local node = minetest.get_node(pointed_thing.under)
	local axis = get_axis(user)
	
end




--Paladium
minetest.register_tool("pala_tools:hammer_amethyst", {
    description = "Paladium Hammer",
    inventory_image = "default_stick.png",
	on_use = function(itemstack, user, pointed_thing)
		if pointed_thing.type == "node" then
			hammer_dig(pointed_thing, user)
		end
	end,
    tool_capabilities = {
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=1999, maxlevel=1}
        }
    }
})

