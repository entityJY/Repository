advancement revoke @s only entityjy:place_terminal

# run raycast function
execute at @s anchored eyes positioned ^ ^ ^ anchored feet run function entityjy:terminal/terminal_raycast
# check if raycast is successful
execute if score @s raycast_steps matches 0 run say success
# clear players score
scoreboard players reset @s raycast_steps