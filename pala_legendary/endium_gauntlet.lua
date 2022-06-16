local C = minetest.colorize
local S = minetest.get_translator(minetest.get_current_modname())
--local F = minetest.formspec_escape

local math = math
local string = string

local next = next

local serialize = minetest.serialize
local deserialize = minetest.deserialize

pala_legendary.gauntlet = {}

function pala_legendary.gauntlet.get_stones(itemstack)
	return deserialize(itemstack:get_meta():get_string("pala_legendary:stones")) or {}
end

function pala_legendary.gauntlet.has_stone(itemstack, name)
	return deserialize(itemstack:get_meta():get_string("pala_legendary:stones"))[name] ~= nil
end

function pala_legendary.gauntlet.set_stones(itemstack, stones)
	itemstack:get_meta():set_string("pala_legendary:stones", serialize(stones))
	tt.reload_itemstack_description(itemstack)
	return itemstack
end

function pala_legendary.gauntlet.add_stone(itemstack, name)
	local stones = pala_legendary.gauntlet.get_stones(itemstack)
	stones[name] = 0
	itemstack:get_meta():set_string("pala_legendary:stones", serialize(stones))
	tt.reload_itemstack_description(itemstack)
	return itemstack
end

local function get_colored_desc(name)
	return C(pala_legendary.registered_stones[name].color or mcl_colors.GRAY, pala_legendary.registered_stones[name].name)
end

tt.register_priority_snippet(function(_, _, itemstack)
	if not itemstack then
		return
	end
	if itemstack:get_name() == "pala_legendary:endium_gauntlet" then
		local stones = pala_legendary.gauntlet.get_stones(itemstack)
		local text = ""
		if next(stones) then
			text = text..C(mcl_colors.GOLD, "Stones:\n")
		end
		for stone in pairs(stones) do
			text = text.." "..get_colored_desc(stone)..(next(stones, stone) and "\n" or "")
		end
		if text ~= "" then
			if not itemstack:get_definition()._tt_original_description then
				text = text:sub(1, text:len() - 1)
			end
			return text, false
		end
	end
end)

local function place_function(itemstack, player, pointed_thing)
	local new_stack = mcl_util.call_on_rightclick(itemstack, player, pointed_thing)
	if new_stack then
		return new_stack
	end

	if not player then return itemstack end
	local playername = player:get_player_name()
	local stones = pala_legendary.gauntlet.get_stones(itemstack)
	local meta = itemstack:get_meta()
	local selected = meta:get_string("selected")

	if not stones or stones == {} then
		minetest.chat_send_player(playername, C(mcl_colors.RED, S("There is no stone in the gauntlet.")))
		return itemstack
	else
		if player:get_player_control().sneak then
			if selected == "" then
				local newstone = next(stones)
				selected = newstone
				mcl_title.set(player, "actionbar", {
					text = string.format("Endium Gauntlet (%s)",
						pala_legendary.registered_stones[newstone].name)
				})
			else
				local newstone = next(stones, selected) or next(stones)
				selected = newstone
				mcl_title.set(player, "actionbar", {
					text = string.format("Endium Gauntlet (%s)",
						pala_legendary.registered_stones[newstone].name)
				})
			end
		else
			if selected == "" then
				minetest.chat_send_player(playername, S("No stone is selected!"))
			else
				if stones[selected] then
					local stonedef = pala_legendary.registered_stones[selected]
					if stonedef then
						if os.time()-43200 >= stones[selected] then --12h
							pala_legendary.spawn_particle(player:get_pos())
							stonedef.func(itemstack, player, pointed_thing)
							stones[selected] = os.time()
						else
							local nbhour = (stones[selected]-(os.time()-43200))/3600
							minetest.chat_send_player(player:get_player_name(),
								C(mcl_colors.GRAY, S("You must wait @1 hours before you can use it.",
								math.floor(nbhour)))
							)
						end
					else
						minetest.log("warning",
							string.format("[pala_legendary] player [%s] used a gauntlet with a wrong stone inside!",
								playername)
						)
					end
				else
					minetest.log("warning",
						string.format("[pala_legendary] player [%s] used a gauntlet with a wrong selected stone!",
							playername)
					)
					selected = next(stones)
				end
			end
		end
	end
	--return pala_legendary.gauntlet.add_stone(itemstack, "fortune")
	meta:set_string("selected", selected)
	return pala_legendary.gauntlet.set_stones(itemstack, stones)
	--[[return pala_legendary.gauntlet.set_stones(itemstack, {
		fortune = 0,
		chaos = 0,
		jobs = 0,
		power = 0,
		invisibility = 0,
	})]]
end

minetest.register_craftitem("pala_legendary:endium_gauntlet", {
	description = S("Endium Gauntlet"),
	_doc_items_usagehelp = S("Just right-click to use it."),
	_doc_items_longdesc =
		"\n"..
		S("Allows you to wear the 6 legendary stones (in the same way as the glove of Thanos (MUC)).").."\n"..
		S("Note: You must have the 6 stones, they do not come with the gauntlet.").."\n"..
		S("Reduces the cooldown of the stones by 12 hours."),
	inventory_image = "pala_legendary_endium_gauntlet.png",
	stack_max = 1,
	groups = {},
	on_place = place_function,
	on_secondary_use = place_function,
})

minetest.register_chatcommand("pala_endium", {
	func = function(name)
		local player = minetest.get_player_by_name(name)
		player:set_wielded_item(
			pala_legendary.gauntlet.set_stones(player:get_wielded_item(), {
				fortune = 0,
				chaos = 0,
				jobs = 0,
				power = 0,
				invisibility = 0,
			})
		)
	end,
})
