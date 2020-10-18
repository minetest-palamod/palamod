pala_spikes = {}

local function register_spike(name, color, damage)
	local newname = "pala_spikes:"..name.."_spike"
	minetest.register_node(newname, {
		drawtype="mesh",
		mesh="pala_spikes_pyramid_spike.obj",
		visual_scale=1.0,
		tiles="default_wood.png^[colorize:"..color..":150",
		groups = {pickaxey=5, building_block=1},
		on_walk_over = function(loc, nodeiamon, player)
			-- Hurt players standing on top of this block
			if player:get_hp() > 0 then
				if mod_death_messages then
					mcl_death_messages.player_damage(player, S("@1 stood too long on a spike.", player:get_player_name()))
				end
				player:set_hp(player:get_hp() - damage, { type = "punch", from = "mod" })
			end
		end,
	})
end

-- pala_spikes.register_spike("wood", color, 2)
-- pala_spikes.register_spike("iron", color, 5)
-- pala_spikes.register_spike("gold", color, 7)
-- pala_spikes.register_spike("diamond", color, 10)
register_spike("amethyst", "#944dc7", 10)
-- pala_spikes.register_spike("titanium", color, 12)
-- pala_spikes.register_spike("paladium", color, 14)

--TODO:craft

minetest.register_node("pala_spikes:test", {
		drawtype="mesh",
		mesh="pala_spikes_pyramid_spike.obj",
		visual_scale=1.0,
		tiles="default_wood.png",
		groups = {pickaxey=5, building_block=1},
		on_walk_over = function(loc, nodeiamon, player)
			-- Hurt players standing on top of this block
			if player:get_hp() > 0 then
				if mod_death_messages then
					mcl_death_messages.player_damage(player, S("@1 stood too long on a spike.", player:get_player_name()))
				end
				player:set_hp(player:get_hp() - damage, { type = "punch", from = "mod" })
			end
		end,
	})