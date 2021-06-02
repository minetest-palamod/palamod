-- multihome/init.lua

local S = minetest.get_translator(minetest.get_current_modname())

local has_pala_grade = minetest.get_modpath("pala_grade")

local vector = vector
local string = string
local pairs = pairs
local serialize = minetest.serialize
local deserialize = minetest.deserialize
local C = minetest.colorize

pala_server.homes = {}

pala_server.homes.grade = {
	none = 3,
	chalenger = 4,
	hero = 4,
	youtube = 4,
}


---
--- API
---

-- [local function] Check attribute
local function init_player(player)
	local meta = player:get_meta()
	if meta:get_string("pala_server.home") == "" then
		meta:set_string("pala_server.home", serialize({}))
	end
end

-- [local function] Count homes
local function count_homes(list)
	local count = 0
	for _, h in pairs(list) do
		count = count + 1
	end
	return count
end

function pala_server.homes.can_create(player, name, homes)
	if has_pala_grade then
		local grade = pala_grade.get_grade(player)
		local max = pala_server.homes.grade[grade]
		if not max then
			minetest.log("error", string.format("[pala_server] Player [%s]'s grade has no valid home count!",
				player:get_player_name()))
			max = 3
		end
		local count = count_homes(homes)
		if not count < max or homes[name] then
			return false
		else
			return true
		end
	end
end

-- [function] Set home
function pala_server.homes.set(player, name, rawpos)
	local meta = player:get_meta()
	local pos = vector.round(rawpos)
	local homes = deserialize(meta:get_string("pala_server.home"))

	-- if home doesn't already exist (i.e. a new home is being created), check for space
	--local can_create = pala_server.homes.can_create(player, name, homes)
	--if true then
	homes[name] = pos
	meta:set_string("pala_server.home", serialize(homes))
	return true, C(mcl_colors.GRAY, S("The home has been set to your position"))
	--else
	--	return false, "Too many homes. Remove one with /delhome <name>"
	--end
end

-- [function] Remove home
function pala_server.homes.remove(player, name)
	local meta = player:get_meta()
	local homes = deserialize(meta:get_string("pala_server.home"))
	if homes[name] then
		homes[name] = nil
		meta:set_string("pala_server.home", serialize(homes))
		return true, C(mcl_colors.GRAY, S("Home deleted"))
	else
		return false, "Home does not exist!"
	end
end

-- [function] Get home position
function pala_server.homes.get(player, name)
	local homes = deserialize(player:get_meta():get_string("pala_server.home"))
	return homes[name]
end

-- [function] List homes
function pala_server.homes.list(player)
	local homes = deserialize(player:get_meta():get_string("pala_server.home"))
	if homes then
		local list = "None"
		for name, h in pairs(homes) do
			if list == "None" then
				list = name.." "..minetest.pos_to_string(h)
			else
				list = list..", "..name.." "..minetest.pos_to_string(h)
			end
		end
		return C(mcl_colors.GRAY, S("Your Homes (@1/@2): ", count_homes(homes), 5)..list)
		--return "test"
	end
end

-- [function] Go to home
function pala_server.homes.go(player, name)
	local pos = pala_server.homes.get(player, name)
	if pos then
		player:set_pos(pos)
		return true, "Teleported to home \""..name.."\""
	else
		local homes = deserialize(player:get_meta():get_string("pala_server.home"))
		if not homes then
			return false, "Set a home using /sethome <name>"
		else
			return false, "Invalid home \""..name.."\""
		end
	end
end

---
--- Registrations
---

-- [event] On join player
minetest.register_on_joinplayer(function(player)
	init_player(player)
end)

-- [privilege] pala_home
minetest.register_privilege("pala_home", {
	description = "Can use pala_server home system",
	give_to_singleplayer = true,
	give_to_admin = true,
})

-- [override] /home
minetest.register_chatcommand("home", {
	description = "Teleport you to one of your home points (related: /sethome, /delhome)",
	params = "[<home name>]",
	func = function(name, param)
		if param and param ~= "" then
			return pala_server.homes.go(minetest.get_player_by_name(name), param)
		elseif param == "" then
			return true, pala_server.homes.list(minetest.get_player_by_name(name))
		end
	end,
})

-- [override] /sethome
minetest.register_chatcommand("sethome", {
	description = "Set or update one of your home points (related: /home, /delhome)",
	params = "<home name>",
	func = function(name, param)
		if param and param ~= "" then
			local player = minetest.get_player_by_name(name)
			return pala_server.homes.set(player, param, player:get_pos())
		else
			return false, "Invalid parameters (see /help sethome)"
		end
	end,
})

-- [chatcommand] /delhome
minetest.register_chatcommand("delhome", {
	description = "Delete one of your home points (related: /home, /sethome)",
	params = "<home name>",
	privs = {},
	func = function(name, param)
		if param and param ~= "" then
			return pala_server.homes.remove(minetest.get_player_by_name(name), param)
		else
			return false, "Invalid parameters (see /help delhome)"
		end
	end,
})