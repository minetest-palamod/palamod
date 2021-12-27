local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local has_mc_economy = minetest.get_modpath("mc_economy")

minetest.register_craftitem("pala_tools:stonks_stone", {
	description = S("Stonks Stone")..(has_mc_economy and "" or "\n"..C(mcl_colors.RED, S("Currently Disabled"))),
	_doc_items_longdesc = S(
		"Collects all the blocks in your inventory that can be sold in the admin shop and sells them directly."
	),
	stack_max = 1,
	groups = {tool = 1},
})

mcl_wip.register_wip_item("pala_tools:stonks_stone")

--[[
if has_mc_economy then
	local time = 0
	minetest.register_globalstep(function(dtime)
		time = time + dtime
		if time >= 10 then
			for _,player in pairs(minetest.get_connected_players()) do
				local i = player:get_inventory()
				if i:get_stack("main", 9):get_name() == "pala_tools:stonks_stone" then
					local l = i:get_list("main")
					--minetest.log("warning", dump(l))
				end
				--minetest.log("called")
			end
			time = 0
		end
	end)
end
]]