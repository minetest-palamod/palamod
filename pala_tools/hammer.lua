--Hammer
--Amethyst
minetest.register_tool("pala_tools:hammer_amethyst", {
    description = "Paladium Hammer",
    inventory_image = "default_stick.png",
    tool_capabilities = {
        groupcaps= {
            pickaxey={times={[1]=4.00, [2]=1.50, [3]=1.00}, uses=1999, maxlevel=1}
        }
    }
})

local steelHammerDigs = {}
minetest.register_on_dignode(
  function(pos, oldnode, digger)
    if digger == nil or digger:get_wielded_item():get_name()  ~= "pala_tools:hammer_amethyst" then
      return
    end
    
    local playerName = digger:get_player_name()
    if(playerName == ""  or steelHammerDigs[playerName]) then
      return
    end
    steelHammerDigs[playerName] = true

    local posDiff = pos.y - digger:get_pos().y
    if(posDiff < 2 and posDiff > 1) then
      if
        digger:get_look_horizontal() > math.pi / 4 and digger:get_look_horizontal() < 3 * math.pi / 4 or
        digger:get_look_horizontal() > 5 * math.pi / 4 and digger:get_look_horizontal() < 7 * math.pi / 4
      then
        pos.y = pos.y -1
        pos.z = pos.z -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.z = pos.z +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.z = pos.z +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.z = pos.z -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)
      else
        pos.y = pos.y -1
        pos.x = pos.x -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.x = pos.x +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.x = pos.x +1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.y = pos.y -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)

        pos.x = pos.x -1
        minetest.node_dig(pos, minetest.get_node(pos), digger)
      end
    else
      pos.x = pos.x -1
      pos.z = pos.z -1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.x = pos.x +1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.x = pos.x +1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.z = pos.z +1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.z = pos.z +1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.x = pos.x -1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.x = pos.x -1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

      pos.z = pos.z -1
      minetest.node_dig(pos, minetest.get_node(pos), digger)

    end
    steelHammerDigs[playerName] = nil
  end
)

