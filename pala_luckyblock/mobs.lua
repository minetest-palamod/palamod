--[[local S = minetest.get_translator(minetest.get_current_modname())

mobs:register_mob("pala_luckyblock:fake_creeper_charged", {
	description = S("Fake Luckyblock Creeper"),
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

	--BOOM

	textures = {
		{"mobs_mc_creeper.png",
		"mobs_mc_creeper_charge.png"},
	},
	visual_size = {x=3, y=3},
	rotate = 270,
	sounds = {
		attack = "tnt_ignite",
		death = "mobs_mc_creeper_death",
		damage = "mobs_mc_creeper_hurt",
		fuse = "tnt_ignite",
		explode = "tnt_explode",
		distance = 16,
	},
	makes_footstep_sound = false,
	walk_velocity = 1.05,
	run_velocity = 2.1,
	runaway_from = { "mobs_mc:ocelot", "mobs_mc:cat" },
	attack_type = "explode",

	explosion_strength = 0,
	--explosion_radius = 3,
	--explosion_damage_radius = 6,
	--explosiontimer_reset_radius = 3,
	reach = 1.5,
	defuse_reach = 4,
	explosion_timer = 0.3,
	allow_fuse_reset = true,
	stop_to_explode = true,
	do_custom = function(self, dtime)
		if self._forced_explosion_countdown_timer ~= nil then
			self._forced_explosion_countdown_timer = self._forced_explosion_countdown_timer - dtime
			if self._forced_explosion_countdown_timer <= 0 then
				mobs:boom(self, mcl_util.get_object_center(self.object), self.explosion_strength)
			end
		end
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
	"mobs_mc_spawn_icon_creeper.png^[colorize:red:5", 0)]]
