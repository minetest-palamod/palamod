minetest.log("action", "[pala_paladium] loading...")

S = minetest.get_translator(minetest.get_current_modname())
C = minetest.colorize

local pala_paladium_code = minetest.get_modpath("pala_paladium") .. "/ores"

dofile(pala_paladium_code .. "/paladium/paladium.lua")
dofile(pala_paladium_code .. "/amethyst/amethyst.lua")
dofile(pala_paladium_code .. "/endium/endium.lua")
dofile(pala_paladium_code .. "/findium/findium.lua")
dofile(pala_paladium_code .. "/green_paladium/green_paladium.lua")
dofile(pala_paladium_code .. "/titanium/titanium.lua")
dofile(pala_paladium_code .. "/trixium/trixium.lua")

minetest.log("action", "[pala_paladium] loaded succesfully")