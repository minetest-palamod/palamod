local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

local math = math
local table = table
local ipairs = ipairs

local minerallist = {
	"pala_paladium:paladium_ingot",
	"pala_paladium:titanium_ingot",
	"pala_paladium:ametyst_ingot",
	"mcl_core:gold_ingot",
	"mcl_core:steel_ingot",
}

--Fortune
pala_legendary.register_legendary("fortune", {
	name = S("Fortune"),
	color = mcl_colors.YELLOW,
	longdesc = S("Gives a random number of a random ore (this can be coal such as palladium)."),
	inventory_image = "pala_legendary_legendary_fortune.png",
	func = function(itemstack, player, pointed_thing)
		local rnd2 = math.random(6, 40)
		for i = 1, rnd2, 1 do
			local rnd = math.random(1, 5)
			minetest.add_item(player:get_pos(), minerallist[rnd])
		end
		minetest.chat_send_player(player:get_player_name(), C(mcl_colors.GRAY, S("Fortune has fallen upon you!")))
		--minetest.chat_send_player(player:get_player_name(),
		--	C(mcl_colors.GRAY, S("You worked hard. You earned a lot of xp. Congratulations!")))
	end,
})

--Chaos
pala_legendary.register_legendary("chaos", {
	name = S("Chaos"),
	color = mcl_colors.DARK_PURPLE,
	longdesc = S("Basic legendary stone, it is the one that then gives one of the six stones."),
	inventory_image = "pala_legendary_legendary_fortune.png",
	func = function(itemstack, player, pointed_thing)
		local playername = player:get_player_name()
		for _,target in ipairs(minetest.get_objects_inside_radius(player:get_pos(), 6)) do
			if target:is_player() and target:get_player_name() ~= playername then
				local inv = target:get_inventory()
				local list = inv:get_list("main")
				table.shuffle(list)
				inv:set_list("main", list)
			end
		end
		minetest.chat_send_player(playername, C(mcl_colors.GRAY, S("You just put chaos around you!")))
	end,
})

if minetest.settings:get_bool("palamod.experimental", false) then
	--Jobs
	pala_legendary.register_legendary("jobs", {
		name = S("Jobs"),
		color = mcl_colors.GREEN,
		longdesc = S("Basic legendary stone, it is the one that then gives one of the six stones."),
		inventory_image = "pala_legendary_legendary_fortune.png",
	})

	--Power
	pala_legendary.register_legendary("power", {
		name = S("Power"),
		color = mcl_colors.RED,
		longdesc = S("Basic legendary stone, it is the one that then gives one of the six stones."),
		inventory_image = "pala_legendary_legendary_fortune.png",
	})

	--[[mcl_damage.register_modifier(function(obj, damage, reason)
		if obj:is_player() and reason.type == "node_damage" then
		end
	end, 100)]]

	--Invisibility
	pala_legendary.register_legendary("invisibility", {
		name = S("Invisibility"),
		color = mcl_colors.GRAY,
		longdesc = S("Basic legendary stone, it is the one that then gives one of the six stones."),
		inventory_image = "pala_legendary_legendary_fortune.png",
	})
end

--This stone should be registered LAST to have the right number of stones in his description
--minetest.register_on_mods_loaded(function()
pala_legendary.register_legendary("random", {
	name = S("Random"),
	longdesc = S("Basic legendary stone, it is the one that then gives one of the @1 stones.",
		#pala_legendary.registered_stones),
	inventory_image = "pala_legendary_legendary_random.png",
	func = function(itemstack, player, pointed_thing)
		return itemstack:replace({name = pala_legendary.get_random_stone()})
	end,
})
--end)

--[[
TODO: every legendary stones working
TODO: be sure chaos player search value is right
TODO: textures for power, invisibility, chaos, job stones
]]