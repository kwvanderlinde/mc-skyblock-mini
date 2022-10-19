# Skyblock Mini

![Starting island](/skyblock_start.png?raw=true "Starting island")

A minimalist's skyblock based on the protosky mod.

Skyblock Mini is a mostly-vanilla version of Skyblock that gives few concessions to the players. It is based on the protosky mod which allows it to be used with any world seed.

## Overview

All blocks have been removed from all dimensions with only a few exceptions:
- In **The Overworld** there is a **Spawn Island** which holds a **Starter chest** and a **single oak tree**. There is also a **Cave Vine** hanging from its bottom and a **Sculk Shrieker** and **Sculk Sensor** at the bottom of the world.
- In **The Nether** there is a bit of **Crimson Nylium** and **Warped Nylium** attached to a simple **Nether Portal**.
- In **The End**, the **Obsidian Platform**, **Obsidian Pillars**, **End Crystals** and **Exit End Portal** have been preserved. Beneath the **Obsidian Platform** is a cage holding a single **Allay**. In the **End Cities**, the **Elytra Item Frames** have also been kept.

## Changes from vanilla

There are a few crafting recipes that have been added:
* 2x2 **Coral** and **Coral Fans** can be crafted into 1 **Coral block** of the corresponding type.
* 2x2 **Weeping vines** can be crafted into 1 **Netherrack**.
* 1 **Nether Star** and 2 **Shulker Shells** can be crafted into 1 **Budding Amethyst**, much like crafting a shulker box.
* 1 **Sculk Shrieker** surrounded by 8 **Echo Shards** can be crafted into 1 **Summoning Sculk Shrieker** capable of summoning the Warden.

Mob drops have also been modified:
* The **Wither** has a chance to drop 1 **Ancient debris** when killed by a player.
* The **Warden** will drop 2-6 **Echo shards** when killed by a player.

## Setup

### Server setup

Skyblock Mini is meant to be run on a dedicated server. Of course it can be run on an integrated server in single player, but that is left as an exercise to the reader.

First you'll need to get a fabric server setup. Get the [fabric installer](https://fabricmc.net/use/) and set it up in the usual way.

Next, you'll need the excellent [protosky](https://modrinth.com/mod/protosky) and [nbt-crafting](https://github.com/Siphalor/nbt-crafting) mods. Drop them into your `mods/` folder and you're good to go.

### World setup

If you want to go the easy route, you can find a world download in the [releases page](https://github.com/kwvanderlinde/mc-skyblock-mini/releases). Just download it and add it to your server and you are ready to play!

If you want to play Skyblock Mini with a different seed, follow these instructions:
1. Create the `./mods/` folder in your server directory and add the [Protosky mod](https://modrinth.com/mod/protosky) to it.
2. Create the `./world/datapacks` folder and add the Skyblock Mini datapack to it.
3. Create the `./eula.txt` file with the contents `eula=true`.
4. Start the fabric server.
5. Start playing!

### Automated world setup

_Note: Only Linux servers are currently supported_

The easiest way to get a server up and running is via an automated script. Run the following command to download and run the script, and then follow the prompts:
```
wget "https://github.com/kwvanderlinde/mc-skyblock-mini/releases/latest/download/setup_skyblock_mini.sh" && chmod +x setup_skyblock_mini.sh && ./setup_skyblock_mini.sh
```
