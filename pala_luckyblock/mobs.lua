local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("pala_luckyblock:fake_creeper_charged", {
	type = "monster",
	spawn_class = "hostile",
	hp_min = 20,
	hp_max = 20,
	xp_min = 5,
	xp_max = 5,
	collisionbox = {-0.3, -0.01, -0.3, 0.3, 1.69, 0.3},
	pathfinding = 1,
	visual = "mesh",
	mesh = "mobs_mc_creeper.b3d",
	textures = {
		{"mobs_mc_creeper.png",
		"mobs_mc_creeper_charge.png"},
	},
	visual_size = {x=3, y=3},
	sounds = {
		attack = "tnt_ignite",
		death = "mobs_mc_creeper_death",
		damage = "mobs_mc_creeper_hurt",
		fuse = "tnt_ignite",
		explode = "tnt_explode",
		distance = 16,
	},
	makes_footstep_sound = true,
	walk_velocity = 1.05,
	run_velocity = 2.1,
	runaway_from = { "mobs_mc:ocelot", "mobs_mc:cat" },
	attack_type = "explode",

	explosion_strength = 0,
	explosion_radius = 0,
	explosion_damage_radius = 0,
	explosiontimer_reset_radius = 6,
	reach = 3,
	explosion_timer = 1.5,
	allow_fuse_reset = true,
	stop_to_explode = true,

	-- Force-ignite creeper with flint and steel and explode after 1.5 seconds.
	-- TODO: Make creeper flash after doing this as well.
	-- TODO: Test and debug this code.
	on_rightclick = function(self, clicker)
		if self._forced_explosion_countdown_timer ~= nil then
			return
		end
		local item = clicker:get_wielded_item()
		if item:get_name() == mobs_mc.items.flint_and_steel then
			if not minetest.is_creative_enabled(clicker:get_player_name()) then
				-- Wear tool
				local wdef = item:get_definition()
				item:add_wear(1000)
				-- Tool break sound
				if item:get_count() == 0 and wdef.sound and wdef.sound.breaks then
					minetest.sound_play(wdef.sound.breaks, {pos = clicker:get_pos(), gain = 0.5}, true)
				end
				clicker:set_wielded_item(item)
			end
			self._forced_explosion_countdown_timer = self.explosion_timer
			minetest.sound_play(self.sounds.attack, {pos = self.object:get_pos(), gain = 1, max_hear_distance = 16}, true)
		end
	end,
	do_custom = function(self, dtime)
		if self._forced_explosion_countdown_timer ~= nil then
			self._forced_explosion_countdown_timer = self._forced_explosion_countdown_timer - dtime
			if self._forced_explosion_countdown_timer <= 0 then
				mobs:boom(self, mcl_util.get_object_center(self.object), self.explosion_strength)
				self.object:remove()
			end
		end
	end,
	on_die = function(self, pos, cmi_cause)
		minetest.add_particlespawner({
			amount = 50,
			time = 2,
			minpos = {x=pos.x-0.5, y=pos.y, z=pos.z-0.5},
			maxpos = {x=pos.x+0.5, y=pos.y+2, z=pos.z+0.5},
			minvel = {x=-0.1, y=-0.1, z=-0.1},
			maxvel = {x=0.1, y=0.1, z=0.1},
			--minacc = {x=0, y=0, z=0},
			--maxacc = {x=0, y=0, z=0},
			minexptime = 1,
			maxexptime = 3,
			minsize = 1,
			maxsize = 1,
			collisiondetection = true,
			collision_removal = false,
			object_collision = false,
			--attached = ObjectRef,
			--vertical = false,
			texture = mcl_weather.rain.get_texture(),
			-- playername = "singleplayer",
			--animation = {Tile Animation definition},
			--node = {name = "ignore", param2 = 0},
			--node_tile = 0,
		})
	end,
	animation = {
		speed_normal = 24,
		speed_run = 48,
		stand_start = 0,
		stand_end = 23,
		walk_start = 24,
		walk_end = 49,
		run_start = 24,
		run_end = 49,
		hurt_start = 110,
		hurt_end = 139,
		death_start = 140,
		death_end = 189,
		look_start = 50,
		look_end = 108,
	},
	floats = 1,
	fear_height = 4,
	view_range = 16,
	--Having trouble when fire is placed with lightning
	fire_resistant = true,
	glow = 3,
})
mobs:register_egg("pala_luckyblock:fake_creeper_charged",
	S("Fake Luckyblock Creeper"),
	"mobs_mc_spawn_icon_creeper.png^[colorize:red:5", 0)