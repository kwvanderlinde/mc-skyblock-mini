# Not meant to be called directly. See `setup_spawn_island_auto.mcfunction`. Since that runs on load, ~ refers to world spawn.

gamerule spawnRadius 0

# The land
fill ~-1 ~-1 ~-1 ~4 ~-1 ~4 minecraft:grass_block
fill ~-1 ~-3 ~-1 ~4 ~-2 ~4 minecraft:dirt
fill ~2 ~-3 ~2 ~4 ~-1 ~4 minecraft:air
setblock ~3 ~-1 ~ minecraft:lava
# The tiniest proper cave vine, no berries. Bone meal will be required.
setblock ~ ~-4 ~ minecraft:cave_vines_plant[berries=false]
setblock ~ ~-5 ~ minecraft:cave_vines[berries=false,age=25]

# The tree
# The block below the tree.
setblock ~-1 ~-1 ~4 minecraft:dirt
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


# The nether side. In order for the commands to take effect, we need to make
# sure chunks are loaded. Be generous. Note that the coordinates are blocks, not
# chunks.
execute in the_nether run forceload add ~-32 ~-32 ~32 ~32
execute in the_nether run fill ~-1 ~-1 ~-2 ~2 ~-1 ~-1 minecraft:crimson_nylium
execute in the_nether run fill ~-1 ~-1 ~1 ~2 ~-1 ~2 minecraft:warped_nylium
execute in the_nether run fill ~-1 ~-1 ~0 ~2 ~3 ~0 minecraft:obsidian
execute in the_nether run fill ~0 ~ ~0 ~1 ~2 ~0 minecraft:nether_portal
# The chest
execute in the_nether run setblock ~-2 ~-1 ~0 minecraft:chest[facing=west]
execute in the_nether run item replace block ~-2 ~-1 ~0 container.13 with minecraft:cocoa_beans 1
# We don't want to keep the nether chunks loaded forever!
execute in the_nether run forceload remove all


# Allay cage beneath obsidian platform.
execute in the_end run forceload add 100 0 100 -1
execute in the_end run fill 98 48 2 102 48 -2 minecraft:obsidian
execute in the_end run fill 99 45 -2 101 47 -2 minecraft:dark_oak_fence
execute in the_end run fill 99 45 2 101 47 2 minecraft:dark_oak_fence
execute in the_end run fill 98 45 -1 98 47 1 minecraft:dark_oak_fence
execute in the_end run fill 102 45 -1 102 47 1 minecraft:dark_oak_fence
execute in the_end run fill 98 45 -2 98 47 -2 minecraft:dark_oak_log[axis=y]
execute in the_end run fill 102 45 -2 102 47 -2 minecraft:dark_oak_log[axis=y]
execute in the_end run fill 102 45 2 102 47 2 minecraft:dark_oak_log[axis=y]
execute in the_end run fill 98 45 2 98 47 2 minecraft:dark_oak_log[axis=y]
execute in the_end run fill 99 44 -1 101 44 1 minecraft:mycelium
execute in the_end run setblock 98 44 -2 minecraft:dark_oak_slab[type=top]
execute in the_end run setblock 102 44 -2 minecraft:dark_oak_slab[type=top]
execute in the_end run setblock 102 44 2 minecraft:dark_oak_slab[type=top]
execute in the_end run setblock 98 44 2 minecraft:dark_oak_slab[type=top]
execute in the_end run fill 99 44 -2 101 44 -2 minecraft:dark_oak_stairs[facing=south,half=top,shape=straight]
execute in the_end run fill 102 44 -1 102 44 1 minecraft:dark_oak_stairs[facing=west,half=top,shape=straight]
execute in the_end run fill 99 44 2 101 44 2 minecraft:dark_oak_stairs[facing=north,half=top,shape=straight]
execute in the_end run fill 98 44 -1 98 44 1 minecraft:dark_oak_stairs[facing=east,half=top,shape=straight]
# I want to be sure this original allay doesn't just disappear!
execute unless entity @e[type=minecraft:allay,name=Tinkerbell] in the_end run summon minecraft:allay 100 46 0 {PersistenceRequired:1b,CustomName:'{"text":"Tinkerbell","color":"light_purple","italic":true,"underlined":true}'}
execute in the_end run forceload remove all
