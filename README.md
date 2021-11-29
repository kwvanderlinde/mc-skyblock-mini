# Skyblock Mini

A minimalist's skyblock based on the protosky mod.

Skyblock Mini is a mostly-vanilla version of Skyblock that gives few concessions to the players. It is based on the protosky mod which allows it to be used with any world seed.

## Changes from vanilla

There are a few crafting recipes that have been added:
* Tube and fan corals can be crafted into the corresponding coral blocks.
* Weeping vines can be crafted into netherrack.

Mob drops have also been modified:
* The wither has a change to drop a single ancient debris.

## Setup

### Server setup

Skyblock Mini is meant to be run on a dedicated server. Of course it can be run on an integrated server in single player, but that is left as an exercise to the reader.

First you'll need to get a fabric server setup. Get the [fabric installer](https://fabricmc.net/use/) and set it up in the usual way.

Next, you'll need the excellent [protosky mod](https://github.com/DeadlyMC/ProtoSky). Drop it in your `mods/` folder and you're good to go.

### World setup

If you want to go the easy route, you can find a world download in the [releases page](https://github.com/kwvanderlinde/mc-skyblock-mini/releases). Just download it and add it to your server and you are ready to play!

If you want to play Skyblock Mini with a different seed, follow these instructions:
1. Add the [carpet mod](https://github.com/gnembon/fabric-carpet/releases) to your server. This is only for the `/tick freeze` command, so you can skip this if you want.
2. Add the [litematica mod](https://www.curseforge.com/minecraft/mc-mods/litematica) to your client. This is required to load the provided schematics.
3. Download the schematics and place them in your server's `schematics/` directory.
4. Download the datapack and place it in your server's `datapacks/` directory.
5. Start the world in creative mode and join the world.
6. Run `/tick freeze` to avoid ticking before the world is set up.
7. Load the overworld schematic.
   * Make sure the center of the island's "elbow" is the world spawn, and is placed as y=63.
   *  Paste the schematic.
8. When standing at spawn, run `/setblock ~ ~ ~ /setblock ~ ~ ~ minecraft:nether_portal` to go to the nether.
9. In the nether, load the nether schematic.
   * Place it so that the portal in the schematic is aligned with the existing nether portal. The bottom block of the schematic should be at y=63.
   * Destroy the existing nether portal.
   * Paste the schematic.
10. Go back to the overworld and destroy the nether portal.
11. Run `/tick freeze` to unfreeze the world.
12. You now have a playable world. You can remove the carpet and litematics mods now if you would like.
