minetest.log("action", "[pala_paladium] loading...")

local S = minetest.get_translator(minetest.get_current_modname())
local C = minetest.colorize

pala_paladium = {}

local pala_paladium.code = minetest.get_modpath("pala_paladium") .. "/ores"

dofile(pala_paladium.code .. "/paladium/paladium.lua")
dofile(pala_paladium.code .. "/amethyst/amethyst.lua")
dofile(pala_paladium.code .. "/endium/endium.lua")
dofile(pala_paladium.code .. "/findium/findium.lua")
dofile(pala_paladium.code .. "/green_paladium/green_paladium.lua")
dofile(pala_paladium.code .. "/titanium/titanium.lua")
dofile(pala_paladium.code .. "/trixium/trixium.lua")

minetest.log("action", "[pala_paladium] loaded succesfully")