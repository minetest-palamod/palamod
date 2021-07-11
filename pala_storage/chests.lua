local S = minetest.get_translator("mcl_chests")
local F = minetest.formspec_escape
local C = minetest.colorize


pala_storage = {}


-- Chest Entity
local animate_chests = (minetest.settings:get_bool("animated_chests") ~= false)
local chest_anim = {
	speed = 25,
	open = {x = 0, y = 7},
	close = {x = 13, y = 20},
}

minetest.register_entity("pala_storage:chest", {
	initial_properties = {
		visual = "mesh",
		visual_size = {x = 3, y = 3},
		pointable = false,
		physical = false,
		static_save = false,
	},
	set_animation = function(self, animname)
		local anim = chest_anim[animname]
		if not anim then return end
		self.object:set_animation(anim, chest_anim.speed, 0, false)
	end,
	open = function(self, playername)
		self.players[playername] = true
		if not self.is_open then
			self:set_animation("open")
			minetest.sound_play(self.sound_prefix .. "_open", {
				pos = self.node_pos,
			})
			self.is_open = true
		end
	end,
	close = function(self, playername)
		self.players[playername] = nil
		if self.is_open then
			--[[for _ in pairs(self.players) do
				return
			end]]
			self:set_animation("close")
			minetest.sound_play(self.sound_prefix .. "_close", {
				pos = self.node_pos,
			})
			self.is_open = false
		end
	end,
	initialize = function(self, node_pos, node_name, textures, dir, sound_prefix, mesh_prefix)
		self.node_pos = node_pos
		self.node_name = node_name
		self.sound_prefix = sound_prefix
		local obj = self.object
		obj:set_properties({
			textures = textures,
			mesh = mesh_prefix..".b3d",
		})
		self:set_yaw(dir)
	end,
	reinitialize = function(self, node_name)
		self.node_name = node_name
	end,
	set_yaw = function(self, dir)
		self.object:set_yaw(minetest.dir_to_yaw(dir))
	end,
	check = function(self)
		local node_pos, node_name = self.node_pos, self.node_name
		if not node_pos or not node_name then
			return false
		end
		local node = minetest.get_node(node_pos)
		if node.name ~= node_name then
			return false
		end
		return true
	end,
	on_activate = function(self)
		self.object:set_armor_groups({immortal = 1})
		self.players = {}
	end,
	on_step = function(self, dtime)
		if not self:check() then
			self.object:remove()
		end
	end
})

local function get_entity_pos(pos, dir)
	pos = vector.new(pos)
	pos.y = pos.y - 0.49
	return pos
end

local function find_entity(pos)
	for _,obj in pairs(minetest.get_objects_inside_radius(pos, 0)) do
		local luaentity = obj:get_luaentity()
		if luaentity and luaentity.name == "pala_storage:chest" then
			return luaentity
		end
	end
end

local function get_entity_info(pos, param2)
	local dir = minetest.facedir_to_dir(param2)
	return dir, get_entity_pos(pos, dir)
end

local function create_entity(pos, node_name, textures, param2, sound_prefix, mesh_prefix)
	local dir, entity_pos = get_entity_info(pos, param2)
	local obj = minetest.add_entity(entity_pos, "pala_storage:chest")
	local luaentity = obj:get_luaentity()
	luaentity:initialize(pos, node_name, textures, dir, sound_prefix, mesh_prefix)
	return luaentity
end

local function find_or_create_entity(pos, node_name, textures, param2, sound_prefix, mesh_prefix)
	local dir, entity_pos = get_entity_info(pos, param2)
	return find_entity(entity_pos)
        or create_entity(pos, node_name, textures, param2, sound_prefix, mesh_prefix, dir, entity_pos)
end

local simple_rotate
if minetest.get_modpath("screwdriver") then
	--no_rotate = screwdriver.disallow
	simple_rotate = function(pos, node, user, mode, new_param2)
		if screwdriver.rotate_simple(pos, node, user, mode, new_param2) ~= false then
			local nodename = node.name
			local nodedef = minetest.registered_nodes[nodename]
			local dir = minetest.facedir_to_dir(new_param2)
			find_or_create_entity(pos, nodename, nodedef._chest_entity_textures, new_param2,
                false, nodedef._chest_entity_sound, nodedef._chest_entity_mesh, dir):set_yaw(dir)
		else
			return false
		end
	end
end

--[[ List of open chests.
Key: Player name
Value:
    If player is using a chest: { pos = <chest node position> }
    Otherwise: nil ]]
local open_chests = {}

-- To be called if a player opened a chest
local player_chest_open = function(player, pos, node_name, textures, param2, sound, mesh)
	local name = player:get_player_name()
	open_chests[name] = {
        pos = pos, node_name = node_name, textures = textures, param2 = param2, sound = sound, mesh = mesh,
    }
	if animate_chests then
		local dir = minetest.facedir_to_dir(param2)
		find_or_create_entity(pos, node_name, textures, param2, sound, mesh, "chest", dir):open(name)
	end
end

-- Simple protection checking functions
local protection_check_move = function(pos, from_list, from_index, to_list, to_index, count, player)
	local name = player:get_player_name()
	if minetest.is_protected(pos, name) then
		minetest.record_protection_violation(pos, name)
		return 0
	else
		return count
	end
end
local protection_check_put_take = function(pos, listname, index, stack, player)
	local name = player:get_player_name()
	if minetest.is_protected(pos, name) then
		minetest.record_protection_violation(pos, name)
		return 0
	else
		return stack:get_count()
	end
end


-- To be called when a chest is closed (only relevant for trapped chest atm)
local chest_update_after_close = function(pos)
end

-- To be called if a player closed a chest
local player_chest_close = function(player)
	local name = player:get_player_name()
	local open_chest = open_chests[name]
	if open_chest == nil then
		return
	end
	if animate_chests then
		find_or_create_entity(open_chest.pos, open_chest.node_name,
            open_chest.textures, open_chest.param2, open_chest.sound, open_chest.mesh):close(name)
	end
	chest_update_after_close(open_chest.pos)

	open_chests[name] = nil
end

local drop_items_chest = function(pos, oldnode, oldmetadata)
    local meta = minetest.get_meta(pos)
    local meta2 = meta
    if oldmetadata then
        meta:from_table(oldmetadata)
    end
    local inv = meta:get_inventory()
    for i=1,inv:get_size("main") do
        local stack = inv:get_stack("main", i)
        if not stack:is_empty() then
            local p = {x=pos.x+math.random(0, 10)/10-0.5, y=pos.y, z=pos.z+math.random(0, 10)/10-0.5}
            minetest.add_item(p, stack)
        end
    end
    meta:from_table(meta2:to_table())
end

local on_chest_blast = function(pos)
    local node = minetest.get_node(pos)
    drop_items_chest(pos, node)
    minetest.remove_node(pos)
end

local function close_forms(basename, pos)
    local players = minetest.get_connected_players()
    for p=1, #players do
        if vector.distance(players[p]:get_pos(), pos) <= 30 then
            minetest.close_formspec(players[p]:get_player_name(),
                "pala_storage:"..basename.."_"..pos.x.."_"..pos.y.."_"..pos.z)
        end
    end
end

-- This is a helper function to register chests
function pala_storage.register_chest(basename, def)
    def.slotnumber = def.slotnumber or 27
    def.desc = def.desc or S("Chests are containers which provide @1 inventory slots", def.slotnumber)
    def.textures = def.textures or {
        entity = {"mcl_chests_normal.png"},
        inventory = {"default_chest_top.png", "mcl_chests_chest_bottom.png",
		"mcl_chests_chest_right.png", "mcl_chests_chest_left.png",
		"mcl_chests_chest_back.png", "default_chest_front.png"},
    }

    local small_name = "pala_storage:chest_"..basename.."_small"

    minetest.register_node("pala_storage:chest_"..basename, {
        description = def.desc,
        _tt_help = S("To access its inventory, rightclick it. When broken, the items will drop out."),
        _doc_items_longdesc = def.longdesc,
        drawtype = "mesh",
        mesh = "mcl_chests_chest.obj",
        tiles = def.textures.entity,
        use_texture_alpha = "opaque",
        paramtype = "light",
        paramtype2 = "facedir",
        stack_max = 64,
        sounds = mcl_sounds.node_sound_wood_defaults(),
        groups = {deco_block=1},
        on_construct = function(pos)
            local node = minetest.get_node(pos)
            node.name = small_name
            minetest.set_node(pos, node)
        end,
        after_place_node = function(pos, placer, itemstack, pointed_thing)
            minetest.get_meta(pos):set_string("name", itemstack:get_meta():get_string("name"))
        end,
    })

    minetest.register_node(small_name, {
        description = def.desc,
        _tt_help = S("To access its inventory, rightclick it. When broken, the items will drop out."),
        _doc_items_longdesc = def.longdesc,
        _doc_items_hidden = true,
        drawtype = "nodebox",
        node_box = {
            type = "fixed",
            fixed = {-0.4375, -0.5, -0.4375, 0.4375, 0.375, 0.4375},
        },
        tiles = {"mcl_chests_blank.png"},
        use_texture_alpha = "clip",
        _chest_entity_textures = def.textures.entity,
        _chest_entity_sound = "default_chest",
        _chest_entity_mesh = "mcl_chests_chest",
        _chest_entity_animation_type = "chest",
        paramtype = "light",
        paramtype2 = "facedir",
        stack_max = 64,
        drop = "pala_storage:chest_"..basename,
        groups = {handy=1,axey=1, container=2, deco_block=1,
            material_wood=1,flammable=-1,pala_chest_entity=1, not_in_creative_inventory=1},
        is_ground_content = false,
        sounds = mcl_sounds.node_sound_wood_defaults(),
        on_construct = function(pos)
            local param2 = minetest.get_node(pos).param2
            local meta = minetest.get_meta(pos)
            local inv = meta:get_inventory()
            inv:set_size("main", def.slotnumber)
            -- BEGIN OF LISTRING WORKAROUND
            inv:set_size("input", 1)
            -- END OF LISTRING WORKAROUND
            minetest.swap_node(pos, { name = "pala_storage:chest_"..basename.."_small", param2 = param2 })
            create_entity(pos, small_name, def.textures.entity, param2, "default_chest", "mcl_chests_chest", "chest")
			--(pos, node_name, textures, param2, sound_prefix, mesh_prefix)
        end,
        after_place_node = function(pos, placer, itemstack, pointed_thing)
            minetest.get_meta(pos):set_string("name", itemstack:get_meta():get_string("name"))
        end,
        after_dig_node = drop_items_chest,
        on_blast = on_chest_blast,
        allow_metadata_inventory_move = protection_check_move,
        allow_metadata_inventory_take = protection_check_put_take,
        allow_metadata_inventory_put = protection_check_put_take,
        on_metadata_inventory_move = function(pos, from_list, from_index, to_list, to_index, count, player)
            minetest.log("action", player:get_player_name()..
                    " moves stuff in chest at "..minetest.pos_to_string(pos))
        end,
        on_metadata_inventory_put = function(pos, listname, index, stack, player)
            minetest.log("action", player:get_player_name()..
                    " moves stuff to chest at "..minetest.pos_to_string(pos))
            -- BEGIN OF LISTRING WORKAROUND
            if listname == "input" then
                local inv = minetest.get_inventory({type="node", pos=pos})
                inv:add_item("main", stack)
            end
            -- END OF LISTRING WORKAROUND
        end,
        on_metadata_inventory_take = function(pos, listname, index, stack, player)
            minetest.log("action", player:get_player_name()..
                    " takes stuff from chest at "..minetest.pos_to_string(pos))
        end,
        _mcl_blast_resistance = 2.5,
        _mcl_hardness = 2.5,
        on_rightclick = function(pos, node, clicker)
            if minetest.registered_nodes[
                minetest.get_node({x = pos.x, y = pos.y + 1, z = pos.z}).name].groups.opaque == 1 then
                -- won't open if there is no space from the top
                return false
            end
            local name = minetest.get_meta(pos):get_string("name")
            if name == "" then
                name = S("Chest")
            end
            local width = def.slotnumber/9
            minetest.show_formspec(clicker:get_player_name(), "pala_storage:"..basename.."_"..pos.x.."_"..pos.y.."_"..pos.z,
                table.concat({
                    "formspec_version[4]",
                    "size["..(0.25+9*1.25)..","..(1.5+width*1.25).."]",
                    "label[0.25,0.5;"..F(C(mcl_colors.DARK_GRAY, name)).."]",
					pala_core.get_itemslot_bg(0.25, 1, 9, width),
                    "list[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main;0.25,1;9,3;]",
                    --"label[0,4.0;"..F(C(mcl_colors.DARK_GRAY, S("Inventory"))).."]",
                    --"list[current_player;main;0,4.5;9,3;9]",
                    --pala_core.get_itemslot_bg(0,4.5,9,3),
                    --"list[current_player;main;0,7.74;9,1;]",
                    --pala_core.get_itemslot_bg(0,7.74,9,1),
                    --"listring[nodemeta:"..pos.x..","..pos.y..","..pos.z..";main]",
                    --"listring[current_player;main]",
                }))
            player_chest_open(clicker, pos, small_name, def.textures.entity, node.param2,
                false, "default_chest")
        end,
        on_destruct = function(pos)
            close_forms(basename, pos)
        end,
        on_rotate = simple_rotate,
    })
end

-- Disable chest when it has been closed
minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname:find("pala_storage:") == 1 then
		if fields.quit then
			player_chest_close(player)
		end
	end
end)

minetest.register_on_leaveplayer(function(player)
	player_chest_close(player)
end)

local function select_and_spawn_entity(pos, node)
	local node_name = node.name
	local node_def = minetest.registered_nodes[node_name]
	find_or_create_entity(pos, node_name, node_def._chest_entity_textures,
        node.param2, node_def._chest_entity_sound, node_def._chest_entity_mesh, node_def._chest_entity_animation_type)
end

minetest.register_lbm({
	label = "Spawn Pala Chest entities",
	name = "pala_storage:spawn_chest_entities",
	nodenames = {"group:pala_chest_entity"},
	run_at_every_load = true,
	action = select_and_spawn_entity,
})

pala_storage.register_chest("paladium", {
    desc = S("Diamond Chest"),
    slotnumber = 108,
})