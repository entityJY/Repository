scoreboard players add @s raycast_steps 1

# 1 is the first step, end after 60 steps, .1*60 = 6 blocks. If target block is found, set score to 0
execute if score @s raycast_steps matches 1..60 if data block ~ ~ ~ components.minecraft:custom_data.terminal run scoreboard players set @s raycast_steps 0
execute if score @s raycast_steps matches 1..60 if block ~ ~ ~ #minecraft:air positioned ^ ^ ^.1 run function entityjy:terminal/terminal_raycast