local mod_storage = minetest.get_mod_storage()

pala_job = {}

pala_job.__skillsets = {}

pala_job.__skill_defs = {}

pala_job.__skills_list = {}

function pala_job:register_job(jobname, idx)
  local player_pos = player:get_pos()
  local player_look_vector = player:get_look_dir()
  local player_direction = vector.add(player_pos, player_look_vector)
end