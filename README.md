# Minetest Palamod
![Discord](https://img.shields.io/discord/816629552897196074)
![GitHub](https://img.shields.io/github/license/minetest-palamod/palamod)
![GitHub commit activity](https://img.shields.io/github/commit-activity/m/minetest-palamod/palamod)
![GitHub all releases](https://img.shields.io/github/downloads/minetest-palamod/palamod/total)
[![ContentDB](https://content.minetest.net/packages/AFCM/palamod/shields/title/)](https://content.minetest.net/packages/AFCM/palamod/)
[![ContentDB](https://content.minetest.net/packages/AFCM/palamod/shields/downloads/)](https://content.minetest.net/packages/AFCM/palamod/)


Why this project?
-----------------

This project is a free clone of the main modpack of a french minecraft server called [Paladium](https://paladium-pvp.fr/).
This server was created by the french youtuber [FuzeIII](https://www.youtube.com/channel/UCfznY5SlSoZoXN0-kBPtCdg) and is the biggest french pvp-faction.
I attemp to provide players a good alternative, providing singleplayer and multiplayer support, for any purpose.
You can freely create a server with this modpack if you want or enjoy singleplayer.

This project is free software, and it doesn't aim to compete the original server.
It is just made for fun, testing and freedom fans.

Informations
------------

This project use the free voxel game engine [Minetest](https://www.minetest.net/) with the [MineClone2](https://git.minetest.land/MineClone2/MineClone2) game.

This modpack is very WIP and breaking changes can be made with  no warning. Use at your own risk until the main features of the modpack will become stable.

This project is mostly a personal project, but I will accept pr for translation, bugfix and better textures.

Gameplay
--------

### Features

This modpack aims to recreate the main features of the original server.

This target include:
* ores, weapons, armors, machines, tools and basic storage systems
* plants and farming related stuff
* job system
* grade system
* server commands

Additional features:
* A good API to allow external mod to work with this modpack properly.
* A full translation in English and French (at least for stable features).
* A full ingame documentation (based on the wiki of the original server)

### Features not included in this target

Some features aren't and will not be included in this modpack.

This modpack isn't a custom version of the MineClone2 game.
So, it can be difficult to recreate some non trivial and strange features like some luckyblock events.

It doesn't include:
* The original craft guide (the existing one works pretty good)
* The menus graphical theme (I don't like it and there is no need of it)
* Some luckyblock events
* Drawers (Because you can add them with an external mod)
* Exact mapgen (mapgen is handeled by the engine, so it can be difficult to recrate exactly the original behaviour)
* Faction and protection system (Handled by another mod)
* Economy system (Handled by another mod)
* Decocraft (I dont like decocraft and it should be external)
* Gost blocks (Should be in external mod and sadly require engine change)

Installing
----------

You can just clone the repo in your mods folder and start to play, but if you want to create a server or replicate more exactly the gameplay, you should use some external mods:

Economy: [minetest-palamod/mc_economy](https://github.com/minetest-palamod/mc_economy)

Faction: [minetest-palamod/mc_faction](https://github.com/minetest-palamod/mc_faction)

Drawers: [minetest-mods/drawers](https://github.com/minetest-mods/drawers)

WorldEdit: [Uberi/Minetest-WorldEdit](https://github.com/Uberi/Minetest-WorldEdit)

Build Limit: [AFCMS/mcl_build_limit](https://github.com/AFCMS/mcl_build_limit)
