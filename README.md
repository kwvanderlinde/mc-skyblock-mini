# Skyblock Mini

![Starting island](/skyblock_start.png?raw=true "Starting island")

A minimalist's skyblock based on the protosky mod.

Skyblock Mini is a mostly-vanilla version of Skyblock that gives few concessions to the players. It is based on the protosky mod which allows it to be used with any world seed.

## Changes from vanilla

There are a few crafting recipes that have been added:
* Tube and fan corals can be crafted into the corresponding coral blocks.
* Weeping vines can be crafted into netherrack.

Mob drops have also been modified:
* The wither has a change to drop a single ancient debris when killed by a player.
* The warden will drop echo shards when killed by a player.

Finally, all sculk shriekers are capable of summoning the warden, and not just the original sculk shrieker in the world.

## Setup

### Server setup

Skyblock Mini is meant to be run on a dedicated server. Of course it can be run on an integrated server in single player, but that is left as an exercise to the reader.

First you'll need to get a fabric server setup. Get the [fabric installer](https://fabricmc.net/use/) and set it up in the usual way.

Next, you'll need the excellent [protosky mod](https://modrinth.com/mod/protosky). Drop it in your `mods/` folder and you're good to go.

### World setup

If you want to go the easy route, you can find a world download in the [releases page](https://github.com/kwvanderlinde/mc-skyblock-mini/releases). Just download it and add it to your server and you are ready to play!

If you want to play Skyblock Mini with a different seed, follow these instructions:
1. Start the server for the first time so that the basic folder structure is created.
2. Accept the EULA.
3. Place the ProtoSky mod in your `mods/` folder.
4. Start the server again and immediately stop it. This will allow the world folders to be created as needed.
5. Download the datapack and place it in your server's `datapacks/` directory.
6. Start the server again.
7. And you are ready to play now!
