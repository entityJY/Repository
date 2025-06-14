scoreboard players add @s raycast_steps_terminal 1

# 1 is the first step, end after 60 steps, .1*60 = 6 blocks. If target block is found, set score to 0, then run terminal_found as the marker at the terminal. If a block other than air or the terminal is found, stop executing
execute if score @s raycast_steps_terminal matches 1..60 if data block ~ ~ ~ components.minecraft:custom_data.terminal run function entityjy:terminal/opening/wand/terminal_found_wand with block ~ ~ ~ components.minecraft:custom_data
execute if score @s raycast_steps_terminal matches 1..60 if block ~ ~ ~ #minecraft:air positioned ^ ^ ^.1 run function entityjy:terminal/opening/wand/terminal_raycast_wand