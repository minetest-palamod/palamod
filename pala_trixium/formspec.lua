local function player_head(name)
	local player = minetest.get_player_by_name(name)
	if player then
		local skin_id = player:get_meta():get_string("mcl_skins:skin_id")
		print("[combine:8x8:-8,-8="..(skin_id == "0" and "character" or "mcl_skins_character_"..skin_id)..".png")
		return "[combine:8x8:-8,-8="..(skin_id == "0" and "character" or "mcl_skins_character_"..skin_id)..".png"
	else
		return "[combine:8x8:0,0=default_stone.png"
	end
end


local function generate_form(ranking)
	local s = table.concat({
		"formspec_version[5]",
		"size[20,12]",
		ranking[1] and table.concat({
			"image[1,1;1,1;"..minetest.formspec_escape(player_head(ranking[1].name)) .."]"
		})
	})
	return s
end



minetest.register_chatcommand("trixium", {
	func = function(name, param)
		local r = pala_trixium.get_top_ranking()
		minetest.show_formspec(name, "pala_trixium:trixium", generate_form(r))
		return true, "Done"
	end,
})