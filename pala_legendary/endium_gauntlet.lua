local C = minetest.colorize
local S = minetest.get_translator(minetest.get_current_modname())
--local F = minetest.formspec_escape

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
	stones[name] = true
	itemstack:get_meta():set_string("pala_legendary:stones", serialize(stones))
	tt.reload_itemstack_description(itemstack)
	return itemstack
end

local function get_colored_desc(name)
	return C(pala_legendary.registered_stones[name].color or mcl_colors.GRAY, pala_legendary.registered_stones[name].name)
end

local function snippet(_, _, itemstack)
	if not itemstack then
		return
	end
	local stones = pala_legendary.gauntlet.get_stones(itemstack)
	local text = ""
	for stone, _ in pairs(stones) do
		text = text..get_colored_desc(stone).."\n"
	end
	if text ~= "" then
		if not itemstack:get_definition()._tt_original_description then
			text = text:sub(1, text:len() - 1)
		end
		return text, false
	end
end

tt.register_priority_snippet(snippet)

minetest.register_craftitem("pala_legendary:endium_gauntlet", {
	description = S("Endium Gauntlet"),
	_doc_items_longdesc = ("Just right-click to use it."),
	inventory_image = "pala_legendary_endium_gauntlet.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, player, pointed_thing)
	end,
	on_place = function(itemstack, player, pointed_thing)
		local playername = player:get_player_name()
		local stones = pala_legendary.gauntlet.get_stones(itemstack)
		if stones == {} then
			minetest.chat_send_player(playername, S(C(mcl_colors.RED, "There is no stone in the gauntlet.")))
			return itemstack
		else
			local meta = itemstack:get_meta()
			local selected = meta:get_string("selected")
			if player:get_player_control().sneak then
				if selected == "" then
					local newstone = next(stones)
					meta:set_string("selected", next(stones))
					mcl_tmp_message.message(player, string.format("Endium Gauntlet (%s)",
						pala_legendary.registered_stones[newstone].name)
					)
				else
					local newstone = next(stones, selected) or next(stones)
					meta:set_string("selected", newstone)
					mcl_tmp_message.message(player, string.format("Endium Gauntlet (%s)",
						pala_legendary.registered_stones[newstone].name)
					)
				end
				return itemstack
			else
				if selected == "" then
					minetest.chat_send_player(playername, S("No stone is selected!"))
				else
					if stones[selected] then
						local stonedef = pala_legendary.registered_stones[selected]
						if stonedef then
							pala_legendary.spawn_particle(player:get_pos())
							stonedef.func(itemstack, player, pointed_thing)
						else
							minetest.log("warning",
								string.format("[pala_legendary] player [%s] used a gauntlet with a wrong stone inside!",
									playername)
							)
						end
						return itemstack
					else
						minetest.log("warning",
							string.format("[pala_legendary] player [%s] used a gauntlet with a wrong selected stone!",
								playername)
						)
						meta:set_string("selected", next(stones))
						return itemstack
					end
				end
			end
		end
		--return pala_legendary.gauntlet.add_stone(itemstack, "fortune")
		return pala_legendary.gauntlet.set_stones(itemstack, {
			fortune = true,
			chaos = true,
			jobs = true,
			power = true,
			invisibility = true,
		})
	end,
})