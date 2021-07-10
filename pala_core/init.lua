minetest.log("action", "[pala_core] loading...")

pala_core = {}

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