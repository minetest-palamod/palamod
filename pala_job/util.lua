local mod_storage = minetest.get_mod_storage()

--pala_job.FILE_NAME = job.txt

function pala_job.init_skill(player)
    minetest.log("info", "[pala_job, Notice] Init skills for "..player..)
	for jobs in range(1, 4)
		local data += { "job"..jobs = 1, {level = 0, score = 0 }}
	end
	mod_storage:set_string(player, minetest.serialize(data))

	data = minetest.deserialize(minetest:get_string(player))
end

function pala_job.add_skill(player, job, number)
    minetest.log("info", "[pala_job, Notice] Saving skills")
    
    --open or create a file at the specified path
    --local f = io.open(minetest.get_worldpath()..pala_job.FILE_NAME, "w")
    local tmp = mod_storage:to_table()
	mod_storage.sp = "bar"
	meta:from_table(tmp)
    --serialise the skillsets then save them to opend file
    --f:write(minetest.serialize(pala_job.skillsets))
	local data = { username = "player1", score = 1234 }
meta:set_string(player, minetest.serialize(data))

data = minetest.deserialize(minetest:get_string("foo"))
    --close the file
    f:close()
end