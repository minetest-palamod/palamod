pala_tools = {}

--Hammer
local function drill_dig_it0 (pos,player)
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

local function drill_dig_it1 (player)
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
	-- local keys = user:get_player_control()
	-- local meta = minetest.deserialize(itemstack:get_metadata())
	-- if not meta or not meta.mode or keys.sneak then
		-- return mining_drill_mk3_setmode(user, itemstack)
	-- end
	if pointed_thing.type ~= "node" or not pos_is_pointable(pointed_thing.under) then
		return
	end
	local pos = minetest.get_pointed_thing_position(pointed_thing, false)
	drill_dig_it(pos, user, meta.mode)
end

local function hammer_dig(pointed_thing, user)
	-- local uppos = {x = pos.x, y = pos.y + 1,z = pos.z}
	-- local toppos = {x = pos.x, y = pos.y + 2,z = pos.z}
	local name = user:get_player_name()
	
	local node = minetest.get_node(pointed_thing.under)
	--local upper = minetest.get_node(uppos)
	--local top = minetest.get_node(toppos)
	--local helpers = check_valid_util(upper.name)
	
	-- if node.name == "farming:weed" then
	    -- return node
	-- end
	
	for x=pointed_thing.under.x-1, pointed_thing.under.x+1 do 
		for y=pointed_thing.under.y-1, pointed_thing.under.y+1 do 
			if minetest.is_protected(pointed_thing.under, user) then
				minetest.record_protection_violation(pointed_thing.under, user)
				break
			end
			local node = minetest.get_node({x, y, pointed_thing.under.z})
			--minetest.chat_send_player(name, node)
			minetest.set_node({x, y, pointed_thing.under.z}, {name="air"})
		end
	end
	return upper
end



--Paladium
minetest.register_tool("pala_tools:hammer", {
    description = "Paladium Hammer",
    inventory_image = "default_stick.png",
	on_use = function(itemstack, user, pointed_thing)
		hammer_dig_2(itemstack, pointed_thing, user)
	end,
    tool_capabilities = {
        groupcaps= {
            cracky={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=500, maxlevel=1}
        }
    }
}
)

local sword_longdesc = "Swords are great in melee combat, as they are fast, deal high damage and can endure countless battles. Swords can also be used to cut down a few particular blocks, such as cobwebs."
local pickaxe_longdesc = "Pickaxes are mining tools to mine hard blocks, such as stone. A pickaxe can also be used as weapon, but it is rather inefficient."

--Paladium
minetest.register_tool("pala_tools:sword_paladium", {
	description = "Paladium Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, },
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=8.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})
if minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		output = 'pala_tools:sword_paladium',
		recipe = {
			{"pala_paladium:paladium_ingot", "", ""},
			{"pala_paladium:paladium_ingot", "", ""},
			{"mcl_core:stick", "", ""},
		}
	})
end

minetest.register_tool("pala_tools:fastsword_paladium", {
	description = "Paladium Fast Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumfastsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, },
	tool_capabilities = {
		full_punch_interval = 0.250,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=7},
		punch_attack_uses = 20,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})

minetest.register_tool("pala_tools:broadsword_paladium", {
	description = "Paladium Broad Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_paladiumbroadsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, },
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=9},
		punch_attack_uses = 3000,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})


minetest.register_tool("pala_tools:pick_paladium", {
	description = "Paladium Pickaxe",
	_doc_items_longdesc = pickaxe_longdesc,
	inventory_image = "pala_tools_paladiumpick.png",
	wield_scale = wield_scale,
	groups = { tool=1, pickaxe=1, dig_speed_class=5},
	tool_capabilities = {
		-- 1/1.2
		full_punch_interval = 0.83333333,
		max_drop_level=5,
		groupcaps={
			pickaxey_dig_diamond = {times=2, uses=4999, maxlevel=0},
		},
		damage_groups = {fleshy=6.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
})

if minetest.get_modpath("pala_paladium") then
	minetest.register_craft({
		output = 'pala_tools:pick_paladium',
		recipe = {
			{"pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot", "pala_paladium:paladium_ingot"},
			{"", "mcl_core:stick", ""},
			{"", "mcl_core:stick", ""},
		}
	})
end

--Green Paladium
minetest.register_tool("pala_tools:sword_gpaladium", {
	description = "Green Paladium Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_gpaladiumsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, },
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=8.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})

--Endium
minetest.register_tool("pala_tools:sword_endium", {
	description = "Endium Sword",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_endiumsword.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, },
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=9.5},
		punch_attack_uses = 4999,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})


--Infernal Knocker

minetest.register_tool("pala_tools:infernal_knocker", {
	description = "Infernal Knocker",
	_doc_items_longdesc = sword_longdesc,
	_doc_items_hidden = false,
	inventory_image = "pala_tools_infernalknocker.png",
	wield_scale = wield_scale,
	groups = { weapon=1, sword=1, dig_speed_class=2, },
	tool_capabilities = {
		full_punch_interval = 0.625,
		max_drop_level=1,
		groupcaps={
			swordy_dig = {times=5, uses=60, maxlevel=0},
			swordy_cobweb_dig = {times=1, uses=60, maxlevel=0},
		},
		damage_groups = {fleshy=4},
		punch_attack_uses = 59,
	},
	sound = { breaks = "default_tool_breaks" },
	_repair_material = "group:wood",
})

if minetest.get_modpath("pala_paladium") and minetest.get_modpath("pala_craftstick") then
	minetest.register_craft({
		output = 'pala_tools:infernal_knocker',
		recipe = {
			{"pala_paladium:paladium_ingot", "", ""},
			{"pala_craftstick:orb_knockback", "", ""},
			{"pala_craftstick:palastick", "", ""},
		}
	})
end

--Voidstone

-- minetest.register_tool("pala_tools:voidstone", {
	-- description = "Infernal Knocker",
	-- inventory_image = "pala_tools_infernalknocker.png",
	-- groups = {},
	-- sound = { breaks = "default_tool_breaks" },
	-- on_use = function(pos, node, player, itemstack, pointed_thing)
		-- minetest.show_formspec(player:get_player_name(), "pala_tools:voidstone",
			-- table.concat({
				-- "size[8,9]" ..
				-- "button[0,0;2,1;empty;Empty Trash]" ..
				-- "list[context;trashlist;3,1;2,3;]" ..
				-- "list[current_player;main;0,5;8,4;]"
			-- },'')
		-- )
	-- ,
-- })
local trash = minetest.create_detached_inventory("voidstone_trash", {
	allow_put = function(inv, listname, index, stack, player)
		return stack:get_count()
	end,
	on_put = function(inv, listname)
		inv:set_list(listname, {})
	end,
})
trash:set_size("main", 1)

--formspec_version[3]size[12,7]list[current_player;main;0.5,2;9,4;0]label[0.5,0.5;Voidstone]label[0.5,12.5;Inventory]list[current_player;main;5.5,0.5;1,1;0]
pala_tools.void_form = table.concat({
	"formspec_version[3]",
	"size[12,7]",
	"list[current_player;main;0.5,2;9,4;0]",
	"label[0.5,0.5;Voidstone]",
	"list[detached:voidstone_trash;main;5.5,0.5;1,1;0]",
})
minetest.register_craftitem("pala_tools:voidstone", {
	description = "Voidstone",
	_doc_items_longdesc = "Voidstone",
	inventory_image = "pala_tools_voidstone.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, user, pointed_thing)
		if user:is_player() then
			minetest.show_formspec(user:get_player_name(), "pala_tools:voidstone", pala_tools.void_form)
		end
	end
})