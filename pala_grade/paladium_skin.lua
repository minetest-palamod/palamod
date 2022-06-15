local S = minetest.get_translator(minetest.get_current_modname())

--this is 100% hard codded :(
local nb_skins = 2

--store color escape sequences
local ce_RED = minetest.get_color_escape_sequence(mcl_colors.RED)


--store and manage skin ids

local function is_id_valid(id)
	return id >= 1 and id <= nb_skins
end

function pala_grade.set_player_paladium_skin(player, id)
	player:get_meta():set_int("pala_grade:pala_armor_id", id)
	mcl_armor.update(player)
end

function pala_grade.get_player_paladium_skin(player)
	local id = player:get_meta():get_int("pala_grade:pala_armor_id")
	return is_id_valid(id) and id or 1
end

minetest.register_on_joinplayer(function(player)
	local meta = player:get_meta()
	local id = meta:get_int("pala_grade:pala_armor_id")
	if id == 0 or not is_id_valid(id) then
		meta:set_int("pala_grade:pala_armor_id", 1)
	end
end)


--override corresponding items to use skin ids

local function add_overlay_if_enchanted(itemstack, texture)
	if mcl_enchanting.is_enchanted(itemstack:get_name()) then
		return texture..mcl_enchanting.overlay
	else
		return texture
	end
end

minetest.override_item("pala_armor:helmet_paladium", {
	_mcl_armor_texture = function(obj, itemstack)
		local texture
		if obj:is_player() and pala_grade.can_execute(obj, 3) then
			local id = pala_grade.get_player_paladium_skin(obj)
			texture = "pala_armor_helmet_paladium_"..id..".png"
		else
			texture = "pala_armor_helmet_paladium_1.png"
		end

		texture = add_overlay_if_enchanted(itemstack, texture)

		return texture
	end,
})

minetest.override_item("pala_armor:chestplate_paladium", {
	_mcl_armor_texture = function(obj, itemstack)
		local texture
		if obj:is_player() and pala_grade.can_execute(obj, 3) then
			local id = pala_grade.get_player_paladium_skin(obj)
			texture = "pala_armor_chestplate_paladium_"..id..".png"
		else
			texture = "pala_armor_chestplate_paladium_1.png"
		end

		texture = add_overlay_if_enchanted(itemstack, texture)

		return texture
	end,
})

minetest.override_item("pala_armor:leggings_paladium", {
	_mcl_armor_texture = function(obj, itemstack)
		local texture
		if obj:is_player() and pala_grade.can_execute(obj, 3) then
			local id = pala_grade.get_player_paladium_skin(obj)
			texture = "pala_armor_leggings_paladium_"..id..".png"
		else
			texture = "pala_armor_leggings_paladium_1.png"
		end

		texture = add_overlay_if_enchanted(itemstack, texture)

		return texture
	end,
})

minetest.override_item("pala_armor:boots_paladium", {
	_mcl_armor_texture = function(obj, itemstack)
		local texture
		if obj:is_player() and pala_grade.can_execute(obj, 3) then
			local id = pala_grade.get_player_paladium_skin(obj)
			texture = "pala_armor_boots_paladium_"..id..".png"
		else
			texture = "pala_armor_boots_paladium_1.png"
		end

		texture = add_overlay_if_enchanted(itemstack, texture)

		return texture
	end,
})


--register the /skin command

local function get_skin_formspec(player, current_id)
	local form = table.concat({
		"formspec_version[4]",
		"size[8,9]",
		"hypertext[0,0;8,1.5;skin;<global valign=middle halign=center size=35 color=#313131>Skin]",
		"style_type[image_button;bgimg=blank.png;bgimg_pressed=blank.png;border=false]",
	})

	if current_id ~= 1 then
		form = form.."image_button[0.20,4;1,1;pala_grade_skin_arrow_l.png;left;]"
	end
	if current_id ~= nb_skins then
		form = form.."image_button[6.8,4;1,1;pala_grade_skin_arrow_r.png;right;]"
	end

	--TODO: allow player to rotate model with mouse
	form = form..mcl_player.get_player_formspec_model(player, 1.25, 1.5, 5.5, 6.75, "player_model")

	return form
end

--TODO: fix description not like mc
minetest.register_chatcommand("skin", {
	params = "",
	description = S("Allow you to change the skin of your paladium armor"),
	privs = {interact = true},
	func = function(name, param)
		local player = minetest.get_player_by_name(name)
		if player then
			if pala_grade.can_execute(player, 3) then
				local form = get_skin_formspec(player, pala_grade.get_player_paladium_skin(player))
				minetest.show_formspec(name, "pala_grade:pala_skin", form)
				return true
			else
				return false, ce_RED..S("You must have the @1 grade to run this command.", pala_grade.grades.legendary.desc)
			end
		else
			return false, S("Error: Player not found")
		end
	end,
})

minetest.register_on_player_receive_fields(function(player, formname, fields)
	if formname == "pala_grade:pala_skin" and pala_grade.can_execute(player, 3) then
		if fields.left then
			local old_id = pala_grade.get_player_paladium_skin(player)
			if is_id_valid(old_id - 1) then
				pala_grade.set_player_paladium_skin(player, old_id - 1)
				minetest.show_formspec(player:get_player_name(), "pala_grade:pala_skin", get_skin_formspec(player, old_id - 1))
			end
		elseif fields.right then
			local old_id = pala_grade.get_player_paladium_skin(player)
			if is_id_valid(old_id + 1) then
				pala_grade.set_player_paladium_skin(player, old_id + 1)
				minetest.show_formspec(player:get_player_name(), "pala_grade:pala_skin", get_skin_formspec(player, old_id + 1))
			end
		end
	end
end)
