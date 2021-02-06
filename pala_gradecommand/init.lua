minetest.register_chatcommand("feed", {
	params = "",
	description = "Allows you to completely fill your food bar",
	privs = {gradepaladins = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		mcl_hunger.set_hunger(player, 20)
	end,
})


minetest.register_chatcommand("furnace", {
	params = "",
	description = "Allows you to cook an item without a furnace",
	privs = {gradepaladins = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
		local item = player:get_wielded_item()
		local output = minetest.get_craft_result({
            method = "cooking",
            width = 1,
            items = {item}
        })
		if output and output.item and not output.item:is_empty() then
			minetest.chat_send_player(name, tostring(output))
			--local outputname = output.item:get_name(),
			--minetest.chat_send_player(name, tostring(outputname))
			minetest.Chat_send_player(name, "WIP")
			--player:set_wielded_item(outputname)
            --local count = output.item:to_table().count
		end
		--if output == item
		mcl_hunger.set_hunger(player, 20)
	end,
})

minetest.register_privilege("gradetitan", {
	description = "Titan Grade",
	give_to_singleplayer = true,
})

minetest.register_privilege("gradepaladins", {
	description = "Paladin Grade",
	give_to_singleplayer = true,
})

minetest.register_privilege("gradeendium", {
	description = "Endium Grade",
	give_to_singleplayer = true,
})
