--pala_job.earn_xp(digger, "miner", {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
-- after_dig_node = function(pos, oldnode, oldmetadata, digger)
	-- if digger:is_player() then
		-- pala_job.earn_xp(digger, "miner", {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0})
	-- end
-- end,

local xp = {
	["mcl_core:stone"] = {1, 0.91, 0.82, 0.73, 0.64, 0.55, 0.46, 0.37, 0.28, 0.19, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	["mcl_core:stone_with_coal"] = {5, 4.5, 4, 3.5, 3, 2.5, 2, 1.5, 1, 0.5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	["mcl_core:stone_with_diamond"] = {30, 27, 24, 21, 18, 15, 12, 9, 6, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0},
	["mcl_nether:quartz_ore"] = {20, 18.8, 17.6, 16.4, 15.2, 14, 12.8, 11.6, 10.4, 9.2, 8, 6.8, 5.6, 4.4, 3.2, 2, 0.8, 0, 0, 0},
}

minetest.override_item("mcl_core:stone", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner", xp["mcl_core:stone"])
		end
	end,
})

minetest.override_item("mcl_core:stone_with_coal", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner", xp["mcl_core:stone_with_coal"])
		end
	end,
})

minetest.override_item("mcl_core:stone_with_diamond", {
	after_dig_node = function(pos, oldnode, oldmetadata, digger)
		if digger:is_player() then
			pala_job.earn_xp(digger, "miner", xp["mcl_core:stone_with_diamond"])
		end
	end,
})

if minetest.get_modpath("mcl_nether") then
	minetest.override_item("mcl_nether:quartz_ore", {
		after_dig_node = function(pos, oldnode, oldmetadata, digger)
			if digger:is_player() then
				pala_job.earn_xp(digger, "miner", xp["mcl_nether:quartz_ore"])
			end
		end,
	})
end
