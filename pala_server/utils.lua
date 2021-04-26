--chunk handling

if minetest.get_modpath("mc_faction") then
    pala_server.pos_to_chunk = mc_faction.pos_to_chunk
else
    local pos_to_dim = mcl_worlds.pos_to_dimension
    local pos_tohash = minetest.hash_node_position

    local function dim_to_number(dim)
	    if dim == "overworld" then return 1
	    elseif dim == "nether" then return 2
	    elseif dim == "end" then return 3
	    else return nil end
    end

    function pala_server.pos_to_chunk(pos)
        local dim = dim_to_number(pos_to_dim(pos))
	    if dim then
	    	return pos_tohash({x=dim,y=math.floor(pos.y/16),z=math.floor(pos.z/16)})
	    else
	    	return nil
	    end
    end
end