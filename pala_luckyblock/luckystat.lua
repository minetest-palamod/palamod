-- luckystat data is stored in player meta to allow using it without db_manager (which require insecure env)

local serialize = minetest.serialize
local deserialize = minetest.deserialize

--local event_count = #pala_luckyblock.event_all

local pool = {}

pala_luckyblock.luckystat = {}

function pala_luckyblock.luckystat.unlock(player, eventname)
	pool[player][eventname] = true
end

function pala_luckyblock.luckystat.lock(player, eventname)
	pool[player][eventname] = false
end

function pala_luckyblock.luckystat.get(player, eventname)
	return pool[player][eventname]
end

function pala_luckyblock.luckystat.get_percent(player)
	if not pool[player] then return nil end
	local count = 0
	for name, val in pairs(pool[player]) do
		if val == true then count = count + 1 end
	end
end

-- Generate luckystat event list for new players
local base_events = {}
for _,v in pairs(pala_luckyblock.event_all) do
	base_events[v.name] = false
end
local str_base_events = serialize(base_events)

-- Add missing entries to existing players (eg if a new event is added)
local function update_events(input)
	if not input or not type(input) == "table" then return nil end
	for _,v in pairs(pala_luckyblock.event_all) do
		if input[v.name] == nil then
			input[v.name] = false
		end
	end
	return input
end

-- Load data
minetest.register_on_joinplayer(function(player)
	local meta = player:get_meta()
	local str = meta:get_string("pala_luckyblock:luckystat")
	if str == "" then
		meta:set_string("pala_luckyblock:luckystat", str_base_events)
		pool[player] = base_events
	else
		local deserialised = deserialize(str)
		deserialised = update_events(deserialised)
		meta:set_string("pala_luckyblock:luckystat", serialize(deserialised) or str_base_events)
		pool[player] = deserialised or base_events
	end
end)

-- Save data on player leave
minetest.register_on_leaveplayer(function(player, timed_out)
	local meta = player:get_meta()
	meta:set_string("pala_luckyblock:luckystat", serialize(pool[player]) or str_base_events)
	pool[player] = nil
end)

-- Save data on shutdown
minetest.register_on_shutdown(function()
	for _,player in pairs(minetest.get_connected_players()) do
		if pool[player] then --This is especialy usefull in singleplayer where leave callbacks are't called sometimes
			local meta = player:get_meta()
			meta:set_string("pala_luckyblock:luckystat", serialize(pool[player]) or str_base_events)
			pool[player] = nil
		end
	end
end)

-- Save data periodicaly
local time = 0
minetest.register_globalstep(function(dtime)
	time = time + dtime;
	if time >= 1800 then --30mn
		for _,player in pairs(minetest.get_connected_players()) do
			local meta = player:get_meta()
			meta:set_string("pala_luckyblock:luckystat", serialize(pool[player]) or str_base_events)
		end
		time = 0
	end
end)
