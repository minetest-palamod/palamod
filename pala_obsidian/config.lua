pala_obsidian.config = pala_obsidian.config or Settings(minetest.get_worldpath().."/pala_obsidian.conf")

local conf_table = pala_obsidian.config:to_table()

local defaults = {
	palafake_color = "#5e99f7"
}

for k, v in pairs(defaults) do
	if conf_table[k] == nil then
		pala_obsidian.config:set(k, v)
	end
end
