--This file contains functions redefinition in case 'db_manager' isn't present

--get xp in specified job for playername
function pala_job.get_xp(playername, job)
	return nil
end

--set xp in specified job for playername
function pala_job.set_xp(playername, job, amount)
	return false
end

function pala_job.init_player(playername)
	return false
end

function pala_job.calculate_level(amount)
end