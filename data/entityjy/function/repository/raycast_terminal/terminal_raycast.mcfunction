scoreboard players add @s raycast_steps_repository2 1

# 1 is the first step, end after 60 steps, .1*60 = 6 blocks. If target block is found, set score to 0, then run terminal_found
execute if score @s raycast_steps_repository2 matches 1..60 if data block ~ ~ ~ components.minecraft:custom_data.terminal run return run function entityjy:repository/raycast_terminal/terminal_found
execute if score @s raycast_steps_repository2 matches 1..60 if block ~ ~ ~ #minecraft:air positioned ^ ^ ^.1 run return run function entityjy:repository/raycast_terminal/terminal_raycast

# if player score is greater than 61 (raycast failed) reset score, then return a fail
execute if score @s raycast_steps_repository2 matches 61.. run scoreboard players reset @s raycast_steps_repository2
execute if score @s raycast_steps_repository2 matches 61.. run return fail