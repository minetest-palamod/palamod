minetest.log("action", "[pala_core] loading...")

pala_core = {}

local has_modname_tooltip = minetest.get_modpath("modname_tooltip")

-- Set item namespace to "palamod"
-- Set mod title to "Palamod"
local mods = {
	"pala_armor",
	"pala_backpack",
	"pala_craftitems",
	"pala_decoblocks",
	"pala_dynamite",
	"pala_fakewater",
	"pala_food",
	"pala_furnace",
	"pala_golem",
	"pala_legendary",
	"pala_looting",
	"pala_luckyblock",
	"pala_machines",
	"pala_obsidian",
	"pala_paladium",
	"pala_spawner",
	"pala_spikes",
	"pala_sticks",
	"pala_storage",
	"pala_tools",
}

for _,name in ipairs(mods) do
	mcl_item_id.set_mod_namespace(name, "palamod")
	if has_modname_tooltip then
		modname_tooltip.set_mod_title(name, "Palamod")
	end
end

minetest.log("action", "[pala_core] successfully set mod namespace to 'palamod'")

if has_modname_tooltip then
	minetest.log("action", "[pala_core] successfully set mods title to 'Palamod'")
end

--TEMP FUNCTION
--MUST BE REMOVED WHEM mcl2 MIGRATE TO FORMSPEC V4
function pala_core.get_itemslot_bg(x, y, w, h)
	local out = ""
	for i = 0, w - 1, 1 do
		for j = 0, h - 1, 1 do
			out = out .."image["..x+i+(i*0.25)..","..y+j+(j*0.25)..";1,1;mcl_formspec_itemslot.png]"
		end
	end
	return out
end

minetest.log("action", "[pala_core] loaded succesfully")