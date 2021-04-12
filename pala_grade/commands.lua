local S = minetest.get_translator(minetest.get_current_modname())

minetest.register_chatcommand("feed", {
	params = "",
	description = "Allows you to completely fill your food bar",
	privs = {interact = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if not player then
			return false, "Player not found"
		end
        if pala_grade.can_execute(player, 2) then
		    mcl_hunger.set_hunger(player, 20)
        else
            return false, S("You must have the [@1] grade to run this command.", pala_grade.grades.youtube.desc)
        end
	end,
})

local show_crafting_form = mcl_crafting_table.show_crafting_form
minetest.register_chatcommand("craft", {
	params = "",
	description = "Allows you to open a crafting table interface.",
	privs = {interact = true},
	func = function(name, param)
		show_crafting_form(minetest.get_player_by_name(name))
	end,
})

minetest.register_chatcommand("furnace", {
	params = "",
	description = "Allows you to cook an item without a furnace",
	privs = {interact = true},
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