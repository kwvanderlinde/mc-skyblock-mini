# Not meant to be called directly. See `setup_spawn_island_auto.mcfunction`. Since that runs on load, ~ refers to world spawn.

gamerule spawnRadius 0

# The land
fill ~-1 ~-1 ~-1 ~4 ~-1 ~4 minecraft:grass_block
fill ~-1 ~-3 ~-1 ~4 ~-2 ~4 minecraft:dirt
fill ~2 ~-3 ~2 ~4 ~-1 ~4 minecraft:air
setblock ~-1 ~-1 ~4 minecraft:dirt

# The chest
setblock ~4 ~ ~ minecraft:chest[facing=west]
item replace block ~4 ~ ~ container.0 with minecraft:ice 1
item replace block ~4 ~ ~ container.1 with minecraft:lava_bucket 1
item replace block ~4 ~ ~ container.8 with minecraft:mycelium 1
item replace block ~4 ~ ~ container.18 with minecraft:cocoa_beans 1
item replace block ~4 ~ ~ container.26 with minecraft:obsidian 10

# The tree
fill ~-3 ~3 ~2 ~1 ~4 ~6 minecraft:oak_leaves
fill ~-3 ~3 ~2 ~-3 ~4 ~2 minecraft:air
fill ~1 ~3 ~2 ~1 ~3 ~2 minecraft:air
fill ~1 ~4 ~6 ~1 ~4 ~6 minecraft:air
fill ~-2 ~5 ~3 ~ ~6 ~5 minecraft:oak_leaves
fill ~-2 ~6 ~3 ~-2 ~6 ~3 minecraft:air
fill ~ ~5 ~3 ~ ~6 ~3 minecraft:air
fill ~ ~6 ~5 ~ ~6 ~5 minecraft:air
fill ~-2 ~6 ~5 ~-2 ~6 ~5 minecraft:air
fill ~-1 ~ ~4 ~-1 ~5 ~4 minecraft:oak_log[axis=y]

# The deep dark
setblock ~ -64 ~ minecraft:sculk_shrieker[can_summon=true]


# The nether side. Always at (0, 0)
execute in the_nether run forceload add -1 -1 0 0
execute in the_nether run fill -1 63 -2 2 63 -1 minecraft:crimson_nylium
execute in the_nether run fill -1 63 1 2 63 2 minecraft:warped_nylium
execute in the_nether run fill -1 63 0 2 67 0 minecraft:obsidian
execute in the_nether run fill 0 64 0 1 66 0 minecraft:nether_portal
execute in the_nether run forceload remove all