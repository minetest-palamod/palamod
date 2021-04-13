local C = minetest.colorize
local S = minetest.get_translator(minetest.get_current_modname())
local serialize = minetest.serialize
local deserialize = minetest.deserialize

pala_legendary.gauntlet = {}

function pala_legendary.gauntlet.get_stones_gauntlet(itemstack)
	return deserialize(itemstack:get_meta():get_string("pala_legendary:stones")) or {}
end

function pala_legendary.gauntlet.add_stone_gauntlet(itemstack, name)
	local stones = pala_legendary.gauntlet.get_stones_gauntlet(itemstack)
	stones[name] = {}
	itemstack:get_meta():set_string("pala_legendary:stones", serialize(stones))
	itemstack = pala_legendary.gauntlet.regenerate_description(itemstack)
	return itemstack
end

function pala_legendary.gauntlet.regenerate_description(itemstack)
	local stones = deserialize(itemstack:get_meta():get_string("pala_legendary:stones"))
	if not stones then return end
	local desc = itemstack:get_definition().description.."\n"
	for name,_ in pairs(stones) do
		if pala_legendary.registered_stones[name] then
			desc = desc..pala_legendary.registered_stones[name].name.."\n"
		else
			minetest.log("error", "[pala_legendary] Found gauntlet with wrong meta")
		end
	end
	itemstack:get_meta():set_string("description", desc)
	return itemstack
end

minetest.register_craftitem("pala_legendary:endium_gauntlet", {
	description = S("Endium Gauntlet"),
	_doc_items_longdesc = ("Just right-click to use it."),
	inventory_image = "pala_legendary_endium_gauntlet.png",
	stack_max = 1,
	groups = {},
	on_use = function(itemstack, player, pointed_thing)
	end,
	on_place = function(itemstack, player, pointed_thing)
		minetest.chat_send_player(player:get_player_name(), S(C(mcl_colors.RED, "There is no stone in the gauntlet.")))
		return pala_legendary.gauntlet.add_stone_gauntlet(itemstack, "fortune")
	end,
})