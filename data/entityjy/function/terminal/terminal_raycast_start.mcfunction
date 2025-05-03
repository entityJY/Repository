# start raycast
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function entityjy:terminal/terminal_raycast
# return success if score = 0
execute if score @s raycast_steps_terminal matches 0 run return 1